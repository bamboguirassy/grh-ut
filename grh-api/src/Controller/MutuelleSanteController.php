<?php

namespace App\Controller;

use App\Entity\MutuelleSante;
use App\Form\MutuelleSanteType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Symfony\Component\HttpFoundation\File\File;
use App\Service\FileUploader;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/mutuellesante")
 */
class MutuelleSanteController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="mutuelle_sante_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_MUTUELLESANTE_INDEX")
     */
    public function index(): array
    {
        $mutuelleSantes = $this->getDoctrine()
            ->getRepository(MutuelleSante::class)
            ->findAll();

        return count($mutuelleSantes)?$mutuelleSantes:[];
    }

    /**
     * @Rest\Post(Path="/create", name="mutuelle_sante_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MUTUELLESANTE_CREATE")
     */
    public function create(Request $request, \App\Service\FileUploader $uploader): MutuelleSante    {
        $mutuelleSante = new MutuelleSante();
        $form = $this->createForm(MutuelleSanteType::class, $mutuelleSante);
        $form->submit(Utils::serializeRequestContent($request));
        
        //check if file provided
        if ($mutuelleSante->getFilepath()) {
            $host = $request->getHttpHost();
            $scheme = $request->getScheme();
            file_put_contents($mutuelleSante->getFilename(), base64_decode($mutuelleSante->getFilepath()));
            $file = new \Symfony\Component\HttpFoundation\File\File($mutuelleSante->getFilename());
            $authorizedExtensions = ['jpeg', 'jpg', 'png'];
            if (!in_array($file->guessExtension(), $authorizedExtensions)) {
                throw new BadRequestHttpException('Fichier non pris en charge');
            }
            $newFileName = $uploader->setTargetDirectory('mutuellesante_image_directory')->upload($file, null); // old fileName
            $mutuelleSante->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
            $mutuelleSante->setFilename($newFileName);
        }

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($mutuelleSante);
        $entityManager->flush();

        return $mutuelleSante;
    }

    /**
     * @Rest\Get(path="/{id}", name="mutuelle_sante_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MUTUELLESANTE_SHOW")
     */
    public function show(MutuelleSante $mutuelleSante): MutuelleSante    {
        return $mutuelleSante;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="mutuelle_sante_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MUTUELLESANTE_EDIT")
     */
    public function edit(Request $request, MutuelleSante $mutuelleSante): MutuelleSante    {
        $form = $this->createForm(MutuelleSanteType::class, $mutuelleSante);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $mutuelleSante;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="mutuelle_sante_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MUTUELLESANTE_CLONE")
     */
    public function cloner(Request $request, MutuelleSante $mutuelleSante):  MutuelleSante {
        $em=$this->getDoctrine()->getManager();
        $mutuelleSanteNew=new MutuelleSante();
        $form = $this->createForm(MutuelleSanteType::class, $mutuelleSanteNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($mutuelleSanteNew);

        $em->flush();

        return $mutuelleSanteNew;
    }
    
    
     /**
     * @Rest\Put(path="/upload-photo/{id}", name="upload_mutuellesante_photo")
     * @Rest\View(StatusCode=200)
     * @param Request $request
     * @param FileUploader $uploader
     * @return MutuelleSante
     * @throws Exception
     */
    public function uploadPhoto(Request $request, MutuelleSante $mutuelleSante, FileUploader $uploader) {
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
        $newFileName = $uploader->setTargetDirectory('employe_photo_directory')->upload($file, $mutuelleSante->getFilename()); // old fileName
        $mutuelleSante->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
        $mutuelleSante->setFilename($newFileName);
        $manager->flush();

        return $mutuelleSante;
    }
    
    
    
    
    
    
    

    /**
     * @Rest\Delete("/{id}", name="mutuelle_sante_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MUTUELLESANTE_EDIT")
     */
    public function delete(MutuelleSante $mutuelleSante): MutuelleSante    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($mutuelleSante);
        $entityManager->flush();

        return $mutuelleSante;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="mutuelle_sante_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MUTUELLESANTE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $mutuelleSantes = Utils::getObjectFromRequest($request);
        if (!count($mutuelleSantes)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($mutuelleSantes as $mutuelleSante) {
            $mutuelleSante = $entityManager->getRepository(MutuelleSante::class)->find($mutuelleSante->id);
            $entityManager->remove($mutuelleSante);
        }
        $entityManager->flush();

        return $mutuelleSantes;
    }
}
