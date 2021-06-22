<?php

namespace App\Controller;

use App\Entity\Document;
use App\Form\DocumentType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

/**
 * @Route("/api/document")
 */
class DocumentController extends AbstractController {

    /**
     * @Rest\Get(path="/", name="document_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_DOCUMENT_INDEX")
     */
    public function index(): array {
        $documents = $this->getDoctrine()
                ->getRepository(Document::class)
                ->findAll();

        return count($documents) ? $documents : [];
    }

    /**
     * @Rest\Get(path="/{id}/employe", name="document_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_DOCUMENT_INDEX")
     */
    public function findByEmploye(\App\Entity\Employe $employe): array {
        $documents = $this->getDoctrine()
                ->getRepository(Document::class)
                ->findByEmploye($employe);

        return count($documents) ? $documents : [];
    }

    /**
     * @Rest\Post(Path="/create", name="document_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DOCUMENT_CREATE")
     */
    public function create(Request $request, \App\Service\FileUploader $uploader): Document {
        $document = new Document();
        $form = $this->createForm(DocumentType::class, $document);
        $form->submit(Utils::serializeRequestContent($request));

        //check if file provided
        if ($document->getFilepath()) {
            $host = $request->getHttpHost();
            $scheme = $request->getScheme();
            file_put_contents($document->getFilename(), base64_decode($document->getFilepath()));
            $file = new \Symfony\Component\HttpFoundation\File\File($document->getFilename());
            $newFileName = $uploader->setTargetDirectory('employe_document_directory')->upload($file, null); // old fileName
            $document->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
            $document->setFilename($newFileName);
        }

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($document);
        $entityManager->flush();

        return $document;
    }

    /**
     * @Rest\Get(path="/{id}", name="document_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DOCUMENT_SHOW")
     */
    public function show(Document $document): Document {
        return $document;
    }

    /**
     * @Rest\Put(path="/{id}/edit", name="document_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DOCUMENT_EDIT")
     */
    public function edit(Request $request, Document $document): Document {
        $form = $this->createForm(DocumentType::class, $document);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $document;
    }

    /**
     * @Rest\Put(path="/{id}/clone", name="document_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DOCUMENT_CLONE")
     */
    public function cloner(Request $request, Document $document): Document {
        $em = $this->getDoctrine()->getManager();
        $documentNew = new Document();
        $form = $this->createForm(DocumentType::class, $documentNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($documentNew);

        $em->flush();

        return $documentNew;
    }

    /**
     * @Rest\Delete("/{id}", name="document_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DOCUMENT_EDIT")
     */
    public function delete(Document $document, FileUploader $uploader): Document {
        $entityManager = $this->getDoctrine()->getManager();
        if ($document->getFileName()) {
            $uploader->setTargetDirectory('employe_document_directory');
            $uploader->remove($document->getFileName());
        }
        $entityManager->remove($document);
        $entityManager->flush();

        return $document;
    }

    /**
     * @Rest\Post("/delete-selection/", name="document_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DOCUMENT_DELETE")
     */
    public function deleteMultiple(Request $request, FileUploader $uploader): array {
        $entityManager = $this->getDoctrine()->getManager();
        $documents = Utils::getObjectFromRequest($request);
        $uploader->setTargetDirectory('employe_document_directory');
        if (!count($documents)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($documents as $document) {
            $document = $entityManager->getRepository(Document::class)->find($document->id);
            if ($document->getFileName()) {
                $uploader->remove($document->getFileName());
            }
            $entityManager->remove($document);
        }
        $entityManager->flush();

        return $documents;
    }

}
