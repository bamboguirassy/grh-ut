<?php

namespace App\Controller;

use App\Entity\Syndicat;
use App\Form\SyndicatType;
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
 * @Route("/api/syndicat")
 */
class SyndicatController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="syndicat_index")
     * @Rest\View(StatusCode = 200)
     */
    public function index(): array
    {
        $syndicats = $this->getDoctrine()
            ->getRepository(Syndicat::class)
            ->findAll();

        return count($syndicats)?$syndicats:[];
    }
    
    
    /**
     * @Rest\Get(path="/{id}/typeemploye", name="syndicat_by_typeemploye")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_SYNDICAT_INDEX")
     */
    public function findByTypeEmploye(\App\Entity\TypeEmploye $typeEmploye): array
    {
        $syndicats = $this->getDoctrine()
            ->getRepository(Syndicat::class)
            ->findByTypeEmploye($typeEmploye);

        return count($syndicats)?$syndicats:[];
    }

    /**
     * @Rest\Post(Path="/create", name="syndicat_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_SYNDICAT_CREATE")
     */
    public function create(Request $request, \App\Service\FileUploader $uploader): Syndicat    {
        $syndicat = new Syndicat();
        $form = $this->createForm(SyndicatType::class, $syndicat);
        $form->submit(Utils::serializeRequestContent($request));
        
        //check if file provided
        if ($syndicat->getFilepath()) {
            $host = $request->getHttpHost();
            $scheme = $request->getScheme();
            file_put_contents($syndicat->getFilename(), base64_decode($syndicat->getFilepath()));
            $file = new \Symfony\Component\HttpFoundation\File\File($syndicat->getFilename());
            $authorizedExtensions = ['jpeg', 'jpg', 'png'];
            if (!in_array($file->guessExtension(), $authorizedExtensions)) {
                throw new BadRequestHttpException('Fichier non pris en charge');
            }
            $newFileName = $uploader->setTargetDirectory('syndicat_image_directory')->upload($file, null); // old fileName
            $syndicat->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
            $syndicat->setFilename($newFileName);
        }

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($syndicat);
        $entityManager->flush();

        return $syndicat;
    }

    /**
     * @Rest\Get(path="/{id}", name="syndicat_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_SYNDICAT_SHOW")
     */
    public function show(Syndicat $syndicat): Syndicat    {
        return $syndicat;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="syndicat_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_SYNDICAT_EDIT")
     */
    public function edit(Request $request, Syndicat $syndicat): Syndicat    {
        $form = $this->createForm(SyndicatType::class, $syndicat);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $syndicat;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="syndicat_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_SYNDICAT_CLONE")
     */
    public function cloner(Request $request, Syndicat $syndicat):  Syndicat {
        $em=$this->getDoctrine()->getManager();
        $syndicatNew=new Syndicat();
        $form = $this->createForm(SyndicatType::class, $syndicatNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($syndicatNew);

        $em->flush();

        return $syndicatNew;
    }

    /**
     * @Rest\Delete("/{id}", name="syndicat_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_SYNDICAT_EDIT")
     */
    public function delete(Syndicat $syndicat, FileUploader $uploader): Syndicat    {
        $entityManager = $this->getDoctrine()->getManager();
        if ($syndicat->getFileName()) {
            $uploader->setTargetDirectory('syndicat_image_directory');
            $uploader->remove($syndicat->getFileName());
        }
        $entityManager->remove($syndicat);
        $entityManager->flush();

        return $syndicat;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="syndicat_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_SYNDICAT_DELETE")
     */
    public function deleteMultiple(Request $request, FileUploader $uploader): array {
        $entityManager = $this->getDoctrine()->getManager();
        $syndicats = Utils::getObjectFromRequest($request);
        $uploader->setTargetDirectory('syndicat_image_directory');
        if (!count($syndicats)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($syndicats as $syndicat) {
            $syndicat = $entityManager->getRepository(Syndicat::class)->find($syndicat->id);
            if ($syndicat->getFileName()) {
                $uploader->remove($syndicat->getFileName());
            }
            $entityManager->remove($syndicat);
        }
        $entityManager->flush();

        return $syndicats;
    }
     /**
     * @Rest\Put(path="/upload-photo/{id}", name="upload_syndicat_photo")
     * @Rest\View(StatusCode=200)
     * @param Request $request
     * @param FileUploader $uploader
     * @return Syndicat
     * @throws Exception
     */
    public function uploadPhoto(Request $request,  Syndicat $syndicat, FileUploader $uploader) {
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
        $newFileName = $uploader->setTargetDirectory('syndicat_image_directory')->upload($file, $syndicat->getFilename()); // old fileName
        $syndicat->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
        $syndicat->setFilename($newFileName);
        $manager->flush();

        return $syndicat;
    }
    
}
