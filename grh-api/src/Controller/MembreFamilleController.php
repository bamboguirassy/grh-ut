<?php

namespace App\Controller;

use App\Entity\MembreFamille;
use App\Form\MembreFamilleType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/membrefamille")
 */
class MembreFamilleController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="membre_famille_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_MEMBREFAMILLE_INDEX")
     */
    public function index(): array
    {
        $membreFamilles = $this->getDoctrine()
            ->getRepository(MembreFamille::class)
            ->findAll();

        return count($membreFamilles)?$membreFamilles:[];
    }
    
    /**
     * @Rest\Get(path="/{id}/employe", name="membre_famille_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_MEMBREFAMILLE_INDEX")
     */
    public function findByEmploye(\App\Entity\Employe $employe): array
    {
        $membreFamilles = $this->getDoctrine()
            ->getRepository(MembreFamille::class)
            ->findByEmploye($employe);

        return count($membreFamilles)?$membreFamilles:[];
    }

    /**
     * @Rest\Post(Path="/create", name="membre_famille_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBREFAMILLE_CREATE")
     */
    public function create(Request $request): MembreFamille    {
        $membreFamille = new MembreFamille();
        $form = $this->createForm(MembreFamilleType::class, $membreFamille);
        $form->submit(Utils::serializeRequestContent($request));
        
        $requestData = Utils::getObjectFromRequest($request);
        if(!isset($requestData->dateNaissance)) {
            throw $this->createNotFoundException("La date de naissance est obligatoire !");
        }
        $membreFamille->setDateNaissance(new \DateTime($requestData->dateNaissance));
        if (isset($requestData->dateMariage)) {
            $membreFamille->setDateMariage(new \DateTime($requestData->dateMariage));
        }
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($membreFamille);
        $entityManager->flush();

        return $membreFamille;
    }

    /**
     * @Rest\Get(path="/{id}", name="membre_famille_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBREFAMILLE_SHOW")
     */
    public function show(MembreFamille $membreFamille): MembreFamille    {
        return $membreFamille;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="membre_famille_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBREFAMILLE_EDIT")
     */
    public function edit(Request $request, MembreFamille $membreFamille): MembreFamille    {
        
        $form = $this->createForm(MembreFamilleType::class, $membreFamille);
        $form->submit(Utils::serializeRequestContent($request));
        $requestData = Utils::getObjectFromRequest($request);
        $membreFamille->setDateNaissance(new \DateTime($requestData->dateNaissance));
        if (isset($requestData->dateMariage)) {
            $membreFamille->setDateMariage(new \DateTime($requestData->dateMariage));
        }
        $this->getDoctrine()->getManager()->flush();

        return $membreFamille;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="membre_famille_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBREFAMILLE_CLONE")
     */
    public function cloner(Request $request, MembreFamille $membreFamille):  MembreFamille {
        $em=$this->getDoctrine()->getManager();
        $membreFamilleNew=new MembreFamille();
        $form = $this->createForm(MembreFamilleType::class, $membreFamilleNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($membreFamilleNew);

        $em->flush();

        return $membreFamilleNew;
    }

    /**
     * @Rest\Delete("/{id}", name="membre_famille_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBREFAMILLE_EDIT")
     */
    public function delete(MembreFamille $membreFamille): MembreFamille    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($membreFamille);
        $entityManager->flush();

        return $membreFamille;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="membre_famille_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBREFAMILLE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $membreFamilles = Utils::getObjectFromRequest($request);
        if (!count($membreFamilles)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($membreFamilles as $membreFamille) {
            $membreFamille = $entityManager->getRepository(MembreFamille::class)->find($membreFamille->id);
            $entityManager->remove($membreFamille);
        }
        $entityManager->flush();

        return $membreFamilles;
    }
}
