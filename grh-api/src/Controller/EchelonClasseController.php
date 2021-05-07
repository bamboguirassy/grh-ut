<?php

namespace App\Controller;

use App\Entity\EchelonClasse;
use App\Form\EchelonClasseType;
use App\Repository\EchelonClasseRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/echelonclasse")
 */
class EchelonClasseController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="echelon_classe_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_ECHELONCLASSE_INDEX")
     */
    public function index(EchelonClasseRepository $echelonClasseRepository): array
    {
        return $echelonClasseRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="echelon_classe_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ECHELONCLASSE_CREATE")
     */
    public function create(Request $request): EchelonClasse    {
        $echelonClasse = new EchelonClasse();
        $form = $this->createForm(EchelonClasseType::class, $echelonClasse);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($echelonClasse);
        $entityManager->flush();

        return $echelonClasse;
    }

    /**
     * @Rest\Get(path="/{id}", name="echelon_classe_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ECHELONCLASSE_SHOW")
     */
    public function show(EchelonClasse $echelonClasse): EchelonClasse    {
        return $echelonClasse;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="echelon_classe_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ECHELONCLASSE_EDIT")
     */
    public function edit(Request $request, EchelonClasse $echelonClasse): EchelonClasse    {
        $form = $this->createForm(EchelonClasseType::class, $echelonClasse);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $echelonClasse;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="echelon_classe_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ECHELONCLASSE_CLONE")
     */
    public function cloner(Request $request, EchelonClasse $echelonClasse):  EchelonClasse {
        $em=$this->getDoctrine()->getManager();
        $echelonClasseNew=new EchelonClasse();
        $form = $this->createForm(EchelonClasseType::class, $echelonClasseNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($echelonClasseNew);

        $em->flush();

        return $echelonClasseNew;
    }

    /**
     * @Rest\Delete("/{id}", name="echelon_classe_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ECHELONCLASSE_EDIT")
     */
    public function delete(EchelonClasse $echelonClasse): EchelonClasse    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($echelonClasse);
        $entityManager->flush();

        return $echelonClasse;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="echelon_classe_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_ECHELONCLASSE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $echelonClasses = Utils::getObjectFromRequest($request);
        if (!count($echelonClasses)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($echelonClasses as $echelonClasse) {
            $echelonClasse = $entityManager->getRepository(EchelonClasse::class)->find($echelonClasse->id);
            $entityManager->remove($echelonClasse);
        }
        $entityManager->flush();

        return $echelonClasses;
    }
}
