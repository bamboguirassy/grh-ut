<?php

namespace App\Controller;

use App\Entity\Responsabilite;
use App\Form\ResponsabiliteType;
use App\Repository\ResponsabiliteRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/responsabilite")
 */
class ResponsabiliteController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="responsabilite_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_RESPONSABILITE_INDEX")
     */
    public function index(ResponsabiliteRepository $responsabiliteRepository): array
    {
        return $responsabiliteRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="responsabilite_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RESPONSABILITE_CREATE")
     */
    public function create(Request $request): Responsabilite    {
        $responsabilite = new Responsabilite();
        $form = $this->createForm(ResponsabiliteType::class, $responsabilite);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($responsabilite);
        $entityManager->flush();

        return $responsabilite;
    }

    /**
     * @Rest\Get(path="/{id}", name="responsabilite_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RESPONSABILITE_SHOW")
     */
    public function show(Responsabilite $responsabilite): Responsabilite    {
        return $responsabilite;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="responsabilite_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RESPONSABILITE_EDIT")
     */
    public function edit(Request $request, Responsabilite $responsabilite): Responsabilite    {
        $form = $this->createForm(ResponsabiliteType::class, $responsabilite);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $responsabilite;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="responsabilite_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RESPONSABILITE_CLONE")
     */
    public function cloner(Request $request, Responsabilite $responsabilite):  Responsabilite {
        $em=$this->getDoctrine()->getManager();
        $responsabiliteNew=new Responsabilite();
        $form = $this->createForm(ResponsabiliteType::class, $responsabiliteNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($responsabiliteNew);

        $em->flush();

        return $responsabiliteNew;
    }

    /**
     * @Rest\Delete("/{id}", name="responsabilite_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RESPONSABILITE_EDIT")
     */
    public function delete(Responsabilite $responsabilite): Responsabilite    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($responsabilite);
        $entityManager->flush();

        return $responsabilite;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="responsabilite_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_RESPONSABILITE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $responsabilites = Utils::getObjectFromRequest($request);
        if (!count($responsabilites)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($responsabilites as $responsabilite) {
            $responsabilite = $entityManager->getRepository(Responsabilite::class)->find($responsabilite->id);
            $entityManager->remove($responsabilite);
        }
        $entityManager->flush();

        return $responsabilites;
    }
}
