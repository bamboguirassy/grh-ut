<?php

namespace App\Controller;

use App\Entity\MembreSyndicat;
use App\Form\MembreSyndicatType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use App\Entity\Syndicat;

/**
 * @Route("/api/membresyndicat")
 */
class MembreSyndicatController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="membre_syndicat_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_MEMBRESYNDICAT_INDEX")
     */
    public function index(): array
    {
        $membreSyndicats = $this->getDoctrine()
            ->getRepository(MembreSyndicat::class)
            ->findAll();

        return count($membreSyndicats)?$membreSyndicats:[];
    }
    
    /**
     * @Rest\Get(path="/{id}/employe", name="membre_syndicat_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_MEMBRESYNDICAT_INDEX")
     */
    public function findByEmploye(\App\Entity\Employe $employe): array
    {
        $membreSyndicats = $this->getDoctrine()
            ->getRepository(MembreSyndicat::class)
            ->findByEmploye($employe);

        return count($membreSyndicats)?$membreSyndicats:[];
    }

    /**
     * @Rest\Post(Path="/create", name="membre_syndicat_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRESYNDICAT_CREATE")
     */
    public function create(Request $request): MembreSyndicat    {
        $membreSyndicat = new MembreSyndicat();
        $form = $this->createForm(MembreSyndicatType::class, $membreSyndicat);
        $form->submit(Utils::serializeRequestContent($request));
        
        $requestData = Utils::getObjectFromRequest($request);
        if(!isset($requestData->dateEnregistrement)) {
            throw $this->createNotFoundException("La date d'enregistrement est obligatoire !");
        }
        $membreSyndicat->setDateEnregistrement(new \DateTime($requestData->dateEnregistrement));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($membreSyndicat);
        $entityManager->flush();

        return $membreSyndicat;
    }

    /**
     * @Rest\Get(path="/{id}", name="membre_syndicat_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRESYNDICAT_SHOW")
     */
    public function show(MembreSyndicat $membreSyndicat): MembreSyndicat    {
        return $membreSyndicat;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="membre_syndicat_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRESYNDICAT_EDIT")
     */
    public function edit(Request $request, MembreSyndicat $membreSyndicat): MembreSyndicat    {
        $form = $this->createForm(MembreSyndicatType::class, $membreSyndicat);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $membreSyndicat;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="membre_syndicat_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRESYNDICAT_CLONE")
     */
    public function cloner(Request $request, MembreSyndicat $membreSyndicat):  MembreSyndicat {
        $em=$this->getDoctrine()->getManager();
        $membreSyndicatNew=new MembreSyndicat();
        $form = $this->createForm(MembreSyndicatType::class, $membreSyndicatNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($membreSyndicatNew);

        $em->flush();

        return $membreSyndicatNew;
    }

    /**
     * @Rest\Delete("/{id}", name="membre_syndicat_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRESYNDICAT_EDIT")
     */
    public function delete(MembreSyndicat $membreSyndicat): MembreSyndicat    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($membreSyndicat);
        $entityManager->flush();

        return $membreSyndicat;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="membre_syndicat_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRESYNDICAT_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $membreSyndicats = Utils::getObjectFromRequest($request);
        if (!count($membreSyndicats)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($membreSyndicats as $membreSyndicat) {
            $membreSyndicat = $entityManager->getRepository(MembreSyndicat::class)->find($membreSyndicat->id);
            $entityManager->remove($membreSyndicat);
        }
        $entityManager->flush();

        return $membreSyndicats;
    }
    
    
     /**
     * @Rest\Get(path="/{id}/membre-syndicat", name="syndicat_amical_membre",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200, serializerEnableMaxDepthChecks=true)
     * @IsGranted("ROLE_MEMBRESYNDICAT_SHOW")
     */
    public function findBySyndicat(Syndicat $syndicat)
    {
        $membres = $this->getDoctrine()
            ->getRepository(MembreSyndicat::class)
            ->findBySyndicat($syndicat);
        return $membres;
    }

}
