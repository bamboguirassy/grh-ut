<?php

namespace App\Controller;

use App\Entity\StructureFonction;
use App\Form\StructureFonctionType;
use App\Repository\StructureFonctionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/structurefonction")
 */
class StructureFonctionController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="structure_fonction_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_STRUCTUREFONCTION_INDEX")
     */
    public function index(StructureFonctionRepository $structureFonctionRepository): array
    {
        return $structureFonctionRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="structure_fonction_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTUREFONCTION_CREATE")
     */
    public function create(Request $request): StructureFonction    {
        $structureFonction = new StructureFonction();
        $form = $this->createForm(StructureFonctionType::class, $structureFonction);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($structureFonction);
        $entityManager->flush();

        return $structureFonction;
    }

    /**
     * @Rest\Get(path="/{id}", name="structure_fonction_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTUREFONCTION_SHOW")
     */
    public function show(StructureFonction $structureFonction): StructureFonction    {
        return $structureFonction;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="structure_fonction_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTUREFONCTION_EDIT")
     */
    public function edit(Request $request, StructureFonction $structureFonction): StructureFonction    {
        $form = $this->createForm(StructureFonctionType::class, $structureFonction);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $structureFonction;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="structure_fonction_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTUREFONCTION_CLONE")
     */
    public function cloner(Request $request, StructureFonction $structureFonction):  StructureFonction {
        $em=$this->getDoctrine()->getManager();
        $structureFonctionNew=new StructureFonction();
        $form = $this->createForm(StructureFonctionType::class, $structureFonctionNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($structureFonctionNew);

        $em->flush();

        return $structureFonctionNew;
    }

    /**
     * @Rest\Delete("/{id}", name="structure_fonction_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTUREFONCTION_EDIT")
     */
    public function delete(StructureFonction $structureFonction): StructureFonction    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($structureFonction);
        $entityManager->flush();

        return $structureFonction;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="structure_fonction_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTUREFONCTION_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $structureFonctions = Utils::getObjectFromRequest($request);
        if (!count($structureFonctions)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($structureFonctions as $structureFonction) {
            $structureFonction = $entityManager->getRepository(StructureFonction::class)->find($structureFonction->id);
            $entityManager->remove($structureFonction);
        }
        $entityManager->flush();

        return $structureFonctions;
    }
}
