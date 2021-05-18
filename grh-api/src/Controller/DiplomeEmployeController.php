<?php

namespace App\Controller;

use App\Entity\DiplomeEmploye;
use App\Form\DiplomeEmployeType;
use App\Repository\DiplomeEmployeRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/diplomeemploye")
 */
class DiplomeEmployeController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="diplome_employe_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_DIPLOMEEMPLOYE_INDEX")
     */
    public function index(DiplomeEmployeRepository $diplomeEmployeRepository): array
    {
        return $diplomeEmployeRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="diplome_employe_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOMEEMPLOYE_CREATE")
     */
    public function create(Request $request): DiplomeEmploye    {
        $diplomeEmploye = new DiplomeEmploye();
        $form = $this->createForm(DiplomeEmployeType::class, $diplomeEmploye);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($diplomeEmploye);
        $entityManager->flush();

        return $diplomeEmploye;
    }

    /**
     * @Rest\Get(path="/{id}", name="diplome_employe_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOMEEMPLOYE_SHOW")
     */
    public function show(DiplomeEmploye $diplomeEmploye): DiplomeEmploye    {
        return $diplomeEmploye;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="diplome_employe_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOMEEMPLOYE_EDIT")
     */
    public function edit(Request $request, DiplomeEmploye $diplomeEmploye): DiplomeEmploye    {
        $form = $this->createForm(DiplomeEmployeType::class, $diplomeEmploye);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $diplomeEmploye;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="diplome_employe_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOMEEMPLOYE_CLONE")
     */
    public function cloner(Request $request, DiplomeEmploye $diplomeEmploye):  DiplomeEmploye {
        $em=$this->getDoctrine()->getManager();
        $diplomeEmployeNew=new DiplomeEmploye();
        $form = $this->createForm(DiplomeEmployeType::class, $diplomeEmployeNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($diplomeEmployeNew);

        $em->flush();

        return $diplomeEmployeNew;
    }
    
    /**
     * @Rest\Get(path="/{id}/employe", name="diplome_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_DIPLOMEEMPLOYE_INDEX")
     */
    public function findByEmploye(\App\Entity\Employe $employe): array {
        $diplomeEmployes = $this->getDoctrine()
                ->getRepository(DiplomeEmploye::class)
                ->findByEmploye($employe,['anneeObtention' => 'DESC']);
        return count($diplomeEmployes) ? $diplomeEmployes : [];
    }

    /**
     * @Rest\Delete("/{id}", name="diplome_employe_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOMEEMPLOYE_EDIT")
     */
    public function delete(DiplomeEmploye $diplomeEmploye): DiplomeEmploye    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($diplomeEmploye);
        $entityManager->flush();

        return $diplomeEmploye;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="diplome_employe_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOMEEMPLOYE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $diplomeEmployes = Utils::getObjectFromRequest($request);
        if (!count($diplomeEmployes)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($diplomeEmployes as $diplomeEmploye) {
            $diplomeEmploye = $entityManager->getRepository(DiplomeEmploye::class)->find($diplomeEmploye->id);
            $entityManager->remove($diplomeEmploye);
        }
        $entityManager->flush();

        return $diplomeEmployes;
    }
}
