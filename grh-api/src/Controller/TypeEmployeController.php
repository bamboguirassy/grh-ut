<?php

namespace App\Controller;

use App\Entity\TypeEmploye;
use App\Form\TypeEmployeType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/typeemploye")
 */
class TypeEmployeController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="type_employe_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_TYPEEMPLOYE_INDEX")
     */
    public function index(): array
    {
        $typeEmployes = $this->getDoctrine()
            ->getRepository(TypeEmploye::class)
            ->findBy([],['code'=>'ASC']);

        return count($typeEmployes)?$typeEmployes:[];
    }

    /**
     * @Rest\Post(Path="/create", name="type_employe_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPEEMPLOYE_CREATE")
     */
    public function create(Request $request): TypeEmploye    {
        $typeEmploye = new TypeEmploye();
        $form = $this->createForm(TypeEmployeType::class, $typeEmploye);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($typeEmploye);
        $entityManager->flush();

        return $typeEmploye;
    }

    /**
     * @Rest\Get(path="/{id}", name="type_employe_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPEEMPLOYE_SHOW")
     */
    public function show(TypeEmploye $typeEmploye): TypeEmploye    {
        return $typeEmploye;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="type_employe_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPEEMPLOYE_EDIT")
     */
    public function edit(Request $request, TypeEmploye $typeEmploye): TypeEmploye    {
        $form = $this->createForm(TypeEmployeType::class, $typeEmploye);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $typeEmploye;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="type_employe_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPEEMPLOYE_CLONE")
     */
    public function cloner(Request $request, TypeEmploye $typeEmploye):  TypeEmploye {
        $em=$this->getDoctrine()->getManager();
        $typeEmployeNew=new TypeEmploye();
        $form = $this->createForm(TypeEmployeType::class, $typeEmployeNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($typeEmployeNew);

        $em->flush();

        return $typeEmployeNew;
    }

    /**
     * @Rest\Delete("/{id}", name="type_employe_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPEEMPLOYE_EDIT")
     */
    public function delete(TypeEmploye $typeEmploye): TypeEmploye    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($typeEmploye);
        $entityManager->flush();

        return $typeEmploye;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="type_employe_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPEEMPLOYE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $typeEmployes = Utils::getObjectFromRequest($request);
        if (!count($typeEmployes)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($typeEmployes as $typeEmploye) {
            $typeEmploye = $entityManager->getRepository(TypeEmploye::class)->find($typeEmploye->id);
            $entityManager->remove($typeEmploye);
        }
        $entityManager->flush();

        return $typeEmployes;
    }
}
