<?php

namespace App\Controller;

use App\Entity\GCategorie;
use App\Form\GCategorieType;
use App\Repository\GCategorieRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/gcategorie")
 */
class GCategorieController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="g_categorie_index")
     * @Rest\View(StatusCode = 200)
     */
    public function index(GCategorieRepository $gCategorieRepository): array
    {
        return $gCategorieRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="g_categorie_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCATEGORIE_CREATE")
     */
    public function create(Request $request): GCategorie    {
        $gCategorie = new GCategorie();
        $form = $this->createForm(GCategorieType::class, $gCategorie);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        
        //transformer le champ suivant en précédent
        if($gCategorie->getSuivant()) {
            $gCategorie->getSuivant()->setSuivant($gCategorie);
            $gCategorie->setSuivant(NULL);
        }

        $entityManager->persist($gCategorie);
        $entityManager->flush();

        return $gCategorie;
    }

    /**
     * @Rest\Get(path="/{id}", name="g_categorie_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCATEGORIE_SHOW")
     */
    public function show(GCategorie $gCategorie): GCategorie    {
        return $gCategorie;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="g_categorie_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCATEGORIE_EDIT")
     */
    public function edit(Request $request, GCategorie $gCategorie): GCategorie    {
        $form = $this->createForm(GCategorieType::class, $gCategorie);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        /** verification duplication suivant */
        if($gCategorie->getSuivant()!=null) {
            $categories = $entityManager->getRepository(GCategorie::class)
            ->findBySuivant($gCategorie->getSuivant());
            if(count($categories)>0 && $categories[0]->getId()!=$gCategorie->getId()) {
               throw $this->createNotFoundException("Attention ! Le suivant que vous avez selectionné est déja associé à l'enregistrement: {$categories[0]->getNom()}");
            }
        }
        /** fin test duplication suivant */
        $entityManager->flush();

        return $gCategorie;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="g_categorie_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCATEGORIE_CLONE")
     */
    public function cloner(Request $request, GCategorie $gCategorie):  GCategorie {
        $em=$this->getDoctrine()->getManager();
        $gCategorieNew=new GCategorie();
        $form = $this->createForm(GCategorieType::class, $gCategorieNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($gCategorieNew);

        $em->flush();

        return $gCategorieNew;
    }

    /**
     * @Rest\Delete("/{id}", name="g_categorie_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCATEGORIE_EDIT")
     */
    public function delete(GCategorie $gCategorie): GCategorie    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($gCategorie);
        $entityManager->flush();

        return $gCategorie;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="g_categorie_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCATEGORIE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $gCategories = Utils::getObjectFromRequest($request);
        if (!count($gCategories)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($gCategories as $gCategorie) {
            $gCategorie = $entityManager->getRepository(GCategorie::class)->find($gCategorie->id);
            $entityManager->remove($gCategorie);
        }
        $entityManager->flush();

        return $gCategories;
    }

    /**
     * @Rest\Get(path="/no-suivant/", name="find_catgorie_no_suivant")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GCATEGORIE_INDEX")
     */
    public function findNonSuivants(GCategorieRepository $gCategorieRepository): array
    {
        $em = $this->getDoctrine()->getManager();
        $categories = $em->createQuery('select c from App\Entity\GCategorie c
         where (select count(c1) from App\Entity\GCategorie c1 where c1.suivant=c)<1')
         ->getResult();

        return $categories;
    }
}