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
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/syndicat")
 */
class SyndicatController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="syndicat_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_SYNDICAT_INDEX")
     */
    public function index(): array
    {
        $syndicats = $this->getDoctrine()
            ->getRepository(Syndicat::class)
            ->findAll();

        return count($syndicats)?$syndicats:[];
    }

    /**
     * @Rest\Post(Path="/create", name="syndicat_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_SYNDICAT_CREATE")
     */
    public function create(Request $request): Syndicat    {
        $syndicat = new Syndicat();
        $form = $this->createForm(SyndicatType::class, $syndicat);
        $form->submit(Utils::serializeRequestContent($request));

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
    public function delete(Syndicat $syndicat): Syndicat    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($syndicat);
        $entityManager->flush();

        return $syndicat;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="syndicat_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_SYNDICAT_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $syndicats = Utils::getObjectFromRequest($request);
        if (!count($syndicats)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($syndicats as $syndicat) {
            $syndicat = $entityManager->getRepository(Syndicat::class)->find($syndicat->id);
            $entityManager->remove($syndicat);
        }
        $entityManager->flush();

        return $syndicats;
    }
}
