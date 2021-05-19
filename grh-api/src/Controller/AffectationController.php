<?php

namespace App\Controller;

use App\Entity\Affectation;
use App\Form\AffectationType;
use App\Repository\AffectationRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use App\Entity\Employe;

/**
 * @Route("/api/affectation")
 */
class AffectationController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="affectation_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_AFFECTATION_INDEX")
     */
    public function index(AffectationRepository $affectationRepository): array
    {
        return $affectationRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="affectation_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_AFFECTATION_CREATE")
     */
    public function create(Request $request): Affectation    {
        $affectation = new Affectation();
        $form = $this->createForm(AffectationType::class, $affectation);
        $form->submit(Utils::serializeRequestContent($request));
        $reqData = Utils::getObjectFromRequest($request);
        $entityManager = $this->getDoctrine()->getManager();
        
        if ($affectation->getEmploye()->getStructure() == $affectation->getStructure()) {
            throw $this->createNotFoundException("L'employé est déjà affecté à cette structure.");
        }
        if (isset($reqData->date)) {
            $affectation->setDate(new \DateTime($reqData->date));
        }
        $employe = $entityManager->getRepository(Employe::class)
                ->find($affectation->getEmploye());
        if ($employe) {
            $employe->setStructure($affectation->getStructure());
        }
        $entityManager->persist($affectation);
        $entityManager->flush();

        return $affectation;
    }

    /**
     * @Rest\Get(path="/{id}", name="affectation_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_AFFECTATION_SHOW")
     */
    public function show(Affectation $affectation): Affectation    {
        return $affectation;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="affectation_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_AFFECTATION_EDIT")
     */
    public function edit(Request $request, Affectation $affectation): Affectation    {
        $form = $this->createForm(AffectationType::class, $affectation);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $affectation;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="affectation_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_AFFECTATION_CLONE")
     */
    public function cloner(Request $request, Affectation $affectation):  Affectation {
        $em=$this->getDoctrine()->getManager();
        $affectationNew=new Affectation();
        $form = $this->createForm(AffectationType::class, $affectationNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($affectationNew);

        $em->flush();

        return $affectationNew;
    }
    
    /**
    * @Rest\Get(path="/{id}/employe", name="affectation_employe")
    * @Rest\View(StatusCode = 200)  
    * @IsGranted("ROLE_AFFECTATION_INDEX")
    */
    public function findByEmploye(\App\Entity\Employe $employe): array
    {
        $affectations = $this->getDoctrine()
            ->getRepository(Affectation::class)
            ->findByEmploye($employe);
            
        return $affectations;
    }

    /**
     * @Rest\Delete("/{id}", name="affectation_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_AFFECTATION_EDIT")
     */
    public function delete(Affectation $affectation): Affectation    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($affectation);
        $entityManager->flush();

        return $affectation;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="affectation_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_AFFECTATION_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $affectations = Utils::getObjectFromRequest($request);
        if (!count($affectations)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($affectations as $affectation) {
            $affectation = $entityManager->getRepository(Affectation::class)->find($affectation->id);
            $entityManager->remove($affectation);
        }
        $entityManager->flush();

        return $affectations;
    }
}
