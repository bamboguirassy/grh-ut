<?php

namespace App\Controller;

use App\Entity\GNiveau;
use App\Form\GNiveauType;
use App\Repository\GNiveauRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/gniveau")
 */
class GNiveauController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="g_niveau_index")
     * @Rest\View(StatusCode = 200)
     */
    public function index(GNiveauRepository $gNiveauRepository): array
    {
        return $gNiveauRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="g_niveau_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GNIVEAU_CREATE")
     */
    public function create(Request $request): GNiveau    {
        $gNiveau = new GNiveau();
        $form = $this->createForm(GNiveauType::class, $gNiveau);
        $form->submit(Utils::serializeRequestContent($request));
        $entityManager = $this->getDoctrine()->getManager();
        
        //transformer le champ suivant en précédent
        if($gNiveau->getSuivant()) {
            $gNiveau->getSuivant()->setSuivant($gNiveau);
            $gNiveau->setSuivant(NULL);
        }
        
          /** fin test duplication suivant */
        
        $entityManager->persist($gNiveau);
        $entityManager->flush();

        return $gNiveau;
    }

    /**
     * @Rest\Get(path="/{id}", name="g_niveau_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GNIVEAU_SHOW")
     */
    public function show(GNiveau $gNiveau): GNiveau    {
        return $gNiveau;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="g_niveau_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GNIVEAU_EDIT")
     */
    public function edit(Request $request, GNiveau $gNiveau): GNiveau    {
        $form = $this->createForm(GNiveauType::class, $gNiveau);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $gNiveau;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="g_niveau_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GNIVEAU_CLONE")
     */
    public function cloner(Request $request, GNiveau $gNiveau):  GNiveau {
        $em=$this->getDoctrine()->getManager();
        $gNiveauNew=new GNiveau();
        $form = $this->createForm(GNiveauType::class, $gNiveauNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($gNiveauNew);

        $em->flush();

        return $gNiveauNew;
    }

    /**
     * @Rest\Delete("/{id}", name="g_niveau_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GNIVEAU_EDIT")
     */
    public function delete(GNiveau $gNiveau): GNiveau    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($gNiveau);
        $entityManager->flush();

        return $gNiveau;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="g_niveau_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GNIVEAU_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $gNiveaus = Utils::getObjectFromRequest($request);
        if (!count($gNiveaus)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($gNiveaus as $gNiveau) {
            $gNiveau = $entityManager->getRepository(GNiveau::class)->find($gNiveau->id);
            $entityManager->remove($gNiveau);
        }
        $entityManager->flush();

        return $gNiveaus;
    }
    
    
     /**
     * @Rest\Get(path="/nosuivant/", name="find_niveau_no_suivant")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GNIVEAU_INDEX")
     */
    public function findNonsuivant(GNiveauRepository $gNiveauRepository): array
    {
        $em = $this->getDoctrine()->getManager();
        $niveaux=$em->createQuery('select c from App\Entity\GNiveau c
         where (select count(c1) from App\Entity\GNiveau c1 where c1.suivant=c)<1')
         ->getResult();
        
        return $niveaux;
    }
}