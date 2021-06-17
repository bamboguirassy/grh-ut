<?php

namespace App\Controller;

use App\Entity\Structure;
use App\Form\StructureType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/structure")
 */
class StructureController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="structure_index")
     * @Rest\View(StatusCode = 200,  serializerEnableMaxDepthChecks=true)
     * @IsGranted("ROLE_STRUCTURE_INDEX")
     */
    public function index(): array
    {
        $structures = $this->getDoctrine()
            ->getRepository(Structure::class)
            ->findAll();

        return count($structures)?$structures:[];
    }

    /**
     * @Rest\Get(path="/find-organigramme", name="find_organigramme")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_STRUCTURE_INDEX")
     */
    public function findOrganigramme(): array
    {
        $structures = $this->getDoctrine()
            ->getRepository(Structure::class)
            ->findAll();

        return count($structures)?$structures:[];
    }

    /**
     * @Rest\Get(path="/with-at-least-one-employe", name="find_with_at_least_one_employe")
     * @Rest\View(StatusCode = 200,  serializerEnableMaxDepthChecks=true)
     * @IsGranted("ROLE_STRUCTURE_INDEX")
     */
    public function findWithAtLeastOneEmploye(EntityManagerInterface $entityManager): array
    {
        $structures = $entityManager->createQuery('
            SELECT s
            FROM App\Entity\Structure s
            WHERE s IN (
                SELECT struct
                FROM App\Entity\Employe e
                JOIN e.structure struct
            )
        ')->getResult();

        return count($structures)?$structures:[];
    }



    /**
     * @Rest\Post(Path="/create", name="structure_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTURE_CREATE")
     */
    public function create(Request $request): Structure    {
        $structure = new Structure();
        $form = $this->createForm(StructureType::class, $structure);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($structure);
        $entityManager->flush();

        return $structure;
    }

    /**
     * @Rest\Get(path="/{id}", name="structure_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTURE_SHOW")
     */
    public function show(Structure $structure): Structure    {
        return $structure;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="structure_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTURE_EDIT")
     */
    public function edit(Request $request, Structure $structure): Structure    {
        $form = $this->createForm(StructureType::class, $structure);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $structure;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="structure_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTURE_CLONE")
     */
    public function cloner(Request $request, Structure $structure):  Structure {
        $em=$this->getDoctrine()->getManager();
        $structureNew=new Structure();
        $form = $this->createForm(StructureType::class, $structureNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($structureNew);

        $em->flush();

        return $structureNew;
    }

    /**
     * @Rest\Delete("/{id}", name="structure_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTURE_EDIT")
     */
    public function delete(Structure $structure): Structure    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($structure);
        $entityManager->flush();

        return $structure;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="structure_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_STRUCTURE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $structures = Utils::getObjectFromRequest($request);
        if (!count($structures)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($structures as $structure) {
            $structure = $entityManager->getRepository(Structure::class)->find($structure->id);
            $entityManager->remove($structure);
        }
        $entityManager->flush();

        return $structures;
    }
}
