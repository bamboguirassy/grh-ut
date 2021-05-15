<?php

namespace App\Controller;

use App\Entity\GClasse;
use App\Entity\TypeEmploye;
use App\Form\GClasseType;
use App\Repository\GClasseRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/gclasse")
 */
class GClasseController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="g_classe_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GCLASSE_INDEX")
     */
    public function index(GClasseRepository $gClasseRepository): array
    {
        return $gClasseRepository->findAll();
    }

    /**
     * @Rest\Get(path="/{id}/typeemploye", name="g_classe_type_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GCLASSE_INDEX")
     */
    public function findByEmploye(TypeEmploye $typeEmploye): array
    {
        return $this->getDoctrine()->getManager()
        ->getRepository(GClasse::class)
        ->findByTypeEmploye($typeEmploye);
    }

    /**
     * @Rest\Post(Path="/create", name="g_classe_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCLASSE_CREATE")
     */
    public function create(Request $request): GClasse    {
        $gClasse = new GClasse();
        $form = $this->createForm(GClasseType::class, $gClasse);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        
        //transformer le champ suivant en précédent
        if($gClasse->getSuivant()) {
            $gClasse->getSuivant()->setSuivant($gClasse);
            $gClasse->setSuivant(NULL);
        }

        $entityManager->persist($gClasse);
        $entityManager->flush();

        return $gClasse;
    }

    /**
     * @Rest\Get(path="/{id}", name="g_classe_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCLASSE_SHOW")
     */
    public function show(GClasse $gClasse): GClasse    {
        return $gClasse;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="g_classe_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCLASSE_EDIT")
     */
    public function edit(Request $request, GClasse $gClasse): GClasse    {
        $form = $this->createForm(GClasseType::class, $gClasse);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
         /** verification duplication suivant */
         if($gClasse->getSuivant()!=null) {
            $classes = $entityManager->getRepository(GClasse::class)
            ->findBySuivant($gClasse->getSuivant());
            if(count($classes)>0 && $classes[0]->getId()!=$gClasse->getId()) {
               throw $this->createNotFoundException("Attention ! Le suivant que vous avez selectionné est déja associé à l'enregistrement: {$classes[0]->getNom()}");
            }
        }
        /** fin test duplication suivant */
        $entityManager->flush();

        return $gClasse;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="g_classe_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCLASSE_CLONE")
     */
    public function cloner(Request $request, GClasse $gClasse):  GClasse {
        $em=$this->getDoctrine()->getManager();
        $gClasseNew=new GClasse();
        $form = $this->createForm(GClasseType::class, $gClasseNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($gClasseNew);

        $em->flush();

        return $gClasseNew;
    }

    /**
     * @Rest\Delete("/{id}", name="g_classe_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCLASSE_EDIT")
     */
    public function delete(GClasse $gClasse): GClasse    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($gClasse);
        $entityManager->flush();

        return $gClasse;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="g_classe_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GCLASSE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $gClasses = Utils::getObjectFromRequest($request);
        if (!count($gClasses)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($gClasses as $gClasse) {
            $gClasse = $entityManager->getRepository(GClasse::class)->find($gClasse->id);
            $entityManager->remove($gClasse);
        }
        $entityManager->flush();

        return $gClasses;
    }

    /** 
     * @Rest\Get(path="/no-suivant/", name="find_classe_no_suivant")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GCATEGORIE_INDEX")
     */
    public function findNonSuivants(GClasseRepository $gClasseRepository): array
    {
        $em = $this->getDoctrine()->getManager();
        $classes = $em->createQuery('select c from App\Entity\GClasse c
         where (select count(c1) from App\Entity\GClasse c1 where c1.suivant=c)<1')
         ->getResult();

        return $classes;
    }
}
