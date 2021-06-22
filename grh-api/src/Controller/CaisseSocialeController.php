<?php

namespace App\Controller;

use App\Entity\CaisseSociale;
use App\Form\CaisseSocialeType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\File\File;
use App\Service\FileUploader;

/**
 * @Route("/api/caissesociale")
 */
class CaisseSocialeController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="caisse_sociale_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_CAISSESOCIALE_INDEX")
     */
    public function index(): array
    {
        $caisseSociales = $this->getDoctrine()
            ->getRepository(CaisseSociale::class)
            ->findAll();

        return count($caisseSociales) ? $caisseSociales : [];
    }

    /**
     * @Rest\Post(Path="/create", name="caisse_sociale_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CAISSESOCIALE_CREATE")
     */
    public function create(Request $request, \App\Service\FileUploader $uploader): CaisseSociale
    {
        $caisseSociale = new CaisseSociale();
        $form = $this->createForm(CaisseSocialeType::class, $caisseSociale);
        $form->submit(Utils::serializeRequestContent($request));

        //check if file provided
        if ($caisseSociale->getFilepath()) {
            $host = $request->getHttpHost();
            $scheme = $request->getScheme();
            file_put_contents($caisseSociale->getFilename(), base64_decode($caisseSociale->getFilepath()));
            $file = new \Symfony\Component\HttpFoundation\File\File($caisseSociale->getFilename());
            $authorizedExtensions = ['jpeg', 'jpg', 'png'];
            if (!in_array($file->guessExtension(), $authorizedExtensions)) {
                throw new BadRequestHttpException('Fichier non pris en charge');
            }
            $newFileName = $uploader->setTargetDirectory('caissesociale_image_directory')->upload($file, null); // old fileName
            $caisseSociale->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
            $caisseSociale->setFilename($newFileName);
        }

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($caisseSociale);
        $entityManager->flush();

        return $caisseSociale;
    }

    /**
     * @Rest\Get(path="/{id}", name="caisse_sociale_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CAISSESOCIALE_SHOW")
     */
    public function show(CaisseSociale $caisseSociale): CaisseSociale
    {
        return $caisseSociale;
    }

    /**
     * @Rest\Get(path="/with-at-least-one-employe", name="cs_find_with_at_least_one_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_CAISSESOCIALE_INDEX")
     */
    public function findWithAtLeastOneEmploye(EntityManagerInterface $entityManager): array
    {
        $caisseSociales = $entityManager->createQuery('
            SELECT cs
            FROM App\Entity\CaisseSociale cs
            WHERE cs IN (
                SELECT csoc
                FROM App\Entity\Employe e
                JOIN e.caisseSociale csoc
            )
        ')->getResult();

        return count($caisseSociales) ? $caisseSociales : [];
    }


    /**
     * @Rest\Put(path="/{id}/edit", name="caisse_sociale_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CAISSESOCIALE_EDIT")
     */
    public function edit(Request $request, CaisseSociale $caisseSociale): CaisseSociale
    {
        $form = $this->createForm(CaisseSocialeType::class, $caisseSociale);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $caisseSociale;
    }

    /**
     * @Rest\Put(path="/{id}/clone", name="caisse_sociale_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CAISSESOCIALE_CLONE")
     */
    public function cloner(Request $request, CaisseSociale $caisseSociale): CaisseSociale
    {
        $em = $this->getDoctrine()->getManager();
        $caisseSocialeNew = new CaisseSociale();
        $form = $this->createForm(CaisseSocialeType::class, $caisseSocialeNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($caisseSocialeNew);

        $em->flush();

        return $caisseSocialeNew;
    }

    /**
     * @Rest\Delete("/{id}", name="caisse_sociale_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CAISSESOCIALE_EDIT")
     */
    public function delete(CaisseSociale $caisseSociale, FileUploader $uploader): CaisseSociale
    {
        $entityManager = $this->getDoctrine()->getManager();
        if ($caisseSociale->getFileName()) {
            $uploader->setTargetDirectory('caissesociale_image_directory');
            $uploader->remove($caisseSociale->getFileName());
        }
        $entityManager->remove($caisseSociale);
        $entityManager->flush();

        return $caisseSociale;
    }

    /**
     * @Rest\Post("/delete-selection/", name="caisse_sociale_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CAISSESOCIALE_DELETE")
     */
    public function deleteMultiple(Request $request, FileUploader $uploader): array
    {
        $entityManager = $this->getDoctrine()->getManager();
        $caisseSociales = Utils::getObjectFromRequest($request);
        $uploader->setTargetDirectory('caissesociale_image_directory');
        if (!count($caisseSociales)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($caisseSociales as $caisseSociale) {
            $caisseSociale = $entityManager->getRepository(CaisseSociale::class)->find($caisseSociale->id);
            if ($caisseSociale->getFileName()) {
                $uploader->remove($caisseSociale->getFileName());
            }
            $entityManager->remove($caisseSociale);
        }
        $entityManager->flush();

        return $caisseSociales;
    }

    /**
     * @Rest\Put(path="/upload-photo-caisseSociale/{id}", name="upload_caisseSociale_photo")
     * @Rest\View(StatusCode=200)
     * @param Request $request
     * @param FileUploader $uploader
     * @return CaisseSociale
     * @throws Exception
     */
    public function uploadPhotoCaisseSociale(Request $request, CaisseSociale $caisseSociale, FileUploader $uploader)
    {
        $manager = $this->getDoctrine()->getManager();
        $host = $request->getHttpHost();
        $scheme = $request->getScheme();
        $data = Utils::getObjectFromRequest($request);
        $fileName = $data->fileName;
        file_put_contents($fileName, base64_decode($data->photo));
        $file = new File($fileName);
        $authorizedExtensions = ['jpeg', 'jpg', 'png'];
        if (!in_array($file->guessExtension(), $authorizedExtensions))
            throw new BadRequestHttpException('Fichier non pris en charge');
        $newFileName = $uploader->setTargetDirectory('caissesociale_image_directory')->upload($file, $caisseSociale->getFilename()); // old fileName
        $caisseSociale->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
        $caisseSociale->setFilename($newFileName);
        $manager->flush();

        return $caisseSociale;
    }


}
