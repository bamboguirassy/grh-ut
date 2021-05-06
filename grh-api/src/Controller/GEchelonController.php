<?php

namespace App\Controller;

use App\Entity\GEchelon;
use App\Form\GEchelonType;
use App\Repository\GEchelonRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/gechelon")
 */
class GEchelonController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="g_echelon_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GECHELON_INDEX")
     */
    public function index(GEchelonRepository $gEchelonRepository): array
    {
        return $gEchelonRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="g_echelon_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GECHELON_CREATE")
     */
    public function create(Request $request): GEchelon    {
        $gEchelon = new GEchelon();
        $form = $this->createForm(GEchelonType::class, $gEchelon);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($gEchelon);
        $entityManager->flush();

        return $gEchelon;
    }

    /**
     * @Rest\Get(path="/{id}", name="g_echelon_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GECHELON_SHOW")
     */
    public function show(GEchelon $gEchelon): GEchelon    {
        return $gEchelon;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="g_echelon_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GECHELON_EDIT")
     */
    public function edit(Request $request, GEchelon $gEchelon): GEchelon    {
        $form = $this->createForm(GEchelonType::class, $gEchelon);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $gEchelon;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="g_echelon_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GECHELON_CLONE")
     */
    public function cloner(Request $request, GEchelon $gEchelon):  GEchelon {
        $em=$this->getDoctrine()->getManager();
        $gEchelonNew=new GEchelon();
        $form = $this->createForm(GEchelonType::class, $gEchelonNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($gEchelonNew);

        $em->flush();

        return $gEchelonNew;
    }

    /**
     * @Rest\Delete("/{id}", name="g_echelon_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GECHELON_EDIT")
     */
    public function delete(GEchelon $gEchelon): GEchelon    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($gEchelon);
        $entityManager->flush();

        return $gEchelon;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="g_echelon_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GECHELON_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $gEchelons = Utils::getObjectFromRequest($request);
        if (!count($gEchelons)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($gEchelons as $gEchelon) {
            $gEchelon = $entityManager->getRepository(GEchelon::class)->find($gEchelon->id);
            $entityManager->remove($gEchelon);
        }
        $entityManager->flush();

        return $gEchelons;
    }
}
