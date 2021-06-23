<?php

namespace App\Controller;

use App\Entity\Diplome;
use App\Form\DiplomeType;
use App\Repository\DiplomeRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/diplome")
 */
class DiplomeController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="diplome_index")
     * @Rest\View(StatusCode = 200)
     */
    public function index(DiplomeRepository $diplomeRepository): array
    {
        return $diplomeRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="diplome_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOME_CREATE")
     */
    public function create(Request $request): Diplome    {
        $diplome = new Diplome();
        $form = $this->createForm(DiplomeType::class, $diplome);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($diplome);
        $entityManager->flush();

        return $diplome;
    }

    /**
     * @Rest\Get(path="/{id}", name="diplome_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOME_SHOW")
     */
    public function show(Diplome $diplome): Diplome    {
        return $diplome;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="diplome_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOME_EDIT")
     */
    public function edit(Request $request, Diplome $diplome): Diplome    {
        $form = $this->createForm(DiplomeType::class, $diplome);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $diplome;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="diplome_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOME_CLONE")
     */
    public function cloner(Request $request, Diplome $diplome):  Diplome {
        $em=$this->getDoctrine()->getManager();
        $diplomeNew=new Diplome();
        $form = $this->createForm(DiplomeType::class, $diplomeNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($diplomeNew);

        $em->flush();

        return $diplomeNew;
    }

    /**
     * @Rest\Delete("/{id}", name="diplome_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOME_EDIT")
     */
    public function delete(Diplome $diplome): Diplome    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($diplome);
        $entityManager->flush();

        return $diplome;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="diplome_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_DIPLOME_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $diplomes = Utils::getObjectFromRequest($request);
        if (!count($diplomes)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($diplomes as $diplome) {
            $diplome = $entityManager->getRepository(Diplome::class)->find($diplome->id);
            $entityManager->remove($diplome);
        }
        $entityManager->flush();

        return $diplomes;
    }
}
