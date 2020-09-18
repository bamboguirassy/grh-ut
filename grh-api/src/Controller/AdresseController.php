<?php

namespace App\Controller;

use App\Entity\Adresse;
use App\Form\AdresseType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/adresse")
 */
class AdresseController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="adresse_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_ADRESSE_INDEX")
     */
    public function index(): array
    {
        $adresses = $this->getDoctrine()
            ->getRepository(Adresse::class)
            ->findAll();

        return count($adresses)?$adresses:[];
    }
    
    /**
     * @Rest\Get(path="/{id}/employe", name="adresse_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_ADRESSE_INDEX")
     */
    public function findByEmploye(\App\Entity\Employe $employe): array
    {
        $adresses = $this->getDoctrine()
            ->getRepository(Adresse::class)
            ->findByEmploye($employe);

        return count($adresses)?$adresses:[];
    }

    /**
     * @Rest\Post(Path="/create", name="adresse_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ADRESSE_CREATE")
     */
    public function create(Request $request): Adresse    {
        $adresse = new Adresse();
        $form = $this->createForm(AdresseType::class, $adresse);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($adresse);
        $entityManager->flush();

        return $adresse;
    }

    /**
     * @Rest\Get(path="/{id}", name="adresse_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ADRESSE_SHOW")
     */
    public function show(Adresse $adresse): Adresse    {
        return $adresse;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="adresse_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ADRESSE_EDIT")
     */
    public function edit(Request $request, Adresse $adresse): Adresse    {
        $form = $this->createForm(AdresseType::class, $adresse);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $adresse;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="adresse_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ADRESSE_CLONE")
     */
    public function cloner(Request $request, Adresse $adresse):  Adresse {
        $em=$this->getDoctrine()->getManager();
        $adresseNew=new Adresse();
        $form = $this->createForm(AdresseType::class, $adresseNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($adresseNew);

        $em->flush();

        return $adresseNew;
    }

    /**
     * @Rest\Delete("/{id}", name="adresse_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ADRESSE_EDIT")
     */
    public function delete(Adresse $adresse): Adresse    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($adresse);
        $entityManager->flush();

        return $adresse;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="adresse_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ADRESSE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $adresses = Utils::getObjectFromRequest($request);
        if (!count($adresses)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($adresses as $adresse) {
            $adresse = $entityManager->getRepository(Adresse::class)->find($adresse->id);
            $entityManager->remove($adresse);
        }
        $entityManager->flush();

        return $adresses;
    }
}
