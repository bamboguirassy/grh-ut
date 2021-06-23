<?php

namespace App\Controller;

use App\Entity\Rang;
use App\Entity\Structure;
use App\Form\RangType;
use App\Repository\RangRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/rang")
 */
class RangController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="rang_index")
     * @Rest\View(StatusCode = 200)
     */
    public function index(RangRepository $rangRepository): array
    {
        return $rangRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="rang_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RANG_CREATE")
     */
    public function create(Request $request): Rang    {
        $rang = new Rang();
        $form = $this->createForm(RangType::class, $rang);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($rang);
        $entityManager->flush();

        return $rang;
    }

    /**
     * @Rest\Get(path="/{id}", name="rang_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RANG_SHOW")
     */
    public function show(Rang $rang): Rang    {
        return $rang;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="rang_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RANG_EDIT")
     */
    public function edit(Request $request, Rang $rang): Rang    {
        $form = $this->createForm(RangType::class, $rang);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $rang;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="rang_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RANG_CLONE")
     */
    public function cloner(Request $request, Rang $rang):  Rang {
        $em=$this->getDoctrine()->getManager();
        $rangNew=new Rang();
        $form = $this->createForm(RangType::class, $rangNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($rangNew);

        $em->flush();

        return $rangNew;
    }


    /**
     * @Rest\Delete("/{id}", name="rang_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RANG_EDIT")
     */
    public function delete(Rang $rang): Rang    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($rang);
        $entityManager->flush();

        return $rang;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="rang_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RANG_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $rangs = Utils::getObjectFromRequest($request);
        if (!count($rangs)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($rangs as $rang) {
            $rang = $entityManager->getRepository(Rang::class)->find($rang->id);
            $entityManager->remove($rang);
        }
        $entityManager->flush();

        return $rangs;
    }
    
}
