<?php

namespace App\Controller;

use App\Entity\Contrat;
use App\Form\ContratType;
use App\Repository\ContratRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use PhpParser\Node\Expr\AssignOp\Concat;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/contrat")
 */
class ContratController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="contrat_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_CONTRAT_INDEX")
     */
    public function index(ContratRepository $contratRepository): array
    {
        return $contratRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="contrat_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CONTRAT_CREATE")
     */
    public function create(Request $request): Contrat
    {
        $contrat = new Contrat();
        $contrat->setDateCreation(new \DateTime('now'));
        $form = $this->createForm(ContratType::class, $contrat);
        $form->submit(Utils::serializeRequestContent($request));
        $reqData = Utils::getObjectFromRequest($request);
        if (isset($reqData->dateSignature)) {
            $contrat->setDateSignature(new \DateTime($reqData->dateSignature));
        }
        if (isset($reqData->dateDebut)) {
            $contrat->setDateDebut(new \DateTime($reqData->dateDebut));
        }
        if (isset($reqData->dateFin)) {
            $contrat->setDateFin(new \DateTime($reqData->dateFin));
        }
        if (isset($reqData->dateRupture)) {
            $contrat->setDateRupture(new \DateTime($reqData->dateRupture));
        }

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($contrat);
        $entityManager->flush();

        return $contrat;
    }

    /**
     * @Rest\Get(path="/{id}", name="contrat_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CONTRAT_SHOW")
     */
    public function show(Contrat $contrat): Contrat
    {
        return $contrat;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="contrat_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CONTRAT_EDIT")
     */
    public function edit(Request $request, Contrat $contrat): Contrat
    {
        $form = $this->createForm(ContratType::class, $contrat);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $contrat;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="contrat_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CONTRAT_CLONE")
     */
    public function cloner(Request $request, Contrat $contrat):  Contrat
    {
        $em=$this->getDoctrine()->getManager();
        $contratNew=new Contrat();
        $form = $this->createForm(ContratType::class, $contratNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($contratNew);

        $em->flush();

        return $contratNew;
    }

    /**
     * @Rest\Delete("/{id}", name="contrat_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CONTRAT_EDIT")
     */
    public function delete(Contrat $contrat): Contrat
    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($contrat);
        $entityManager->flush();

        return $contrat;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="contrat_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CONTRAT_DELETE")
     */
    public function deleteMultiple(Request $request): array
    {
        $entityManager = $this->getDoctrine()->getManager();
        $contrats = Utils::getObjectFromRequest($request);
        if (!count($contrats)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($contrats as $contrat) {
            $contrat = $entityManager->getRepository(Contrat::class)->find($contrat->id);
            $entityManager->remove($contrat);
        }
        $entityManager->flush();

        return $contrats;
    }
    /**
    * @Rest\Get(path="/{id}/employe", name="contrat_employe")
    * @Rest\View(StatusCode = 200)
    * @IsGranted("ROLE_CONTRAT_INDEX")
    */
    public function findByEmploye(\App\Entity\Employe $employe): array
    {
        $contrats = $this->getDoctrine()
            ->getRepository(Contrat::class)
            ->findByEmploye($employe ,['dateDebut' =>'DESC']);
            
        return $contrats;
    }
}
