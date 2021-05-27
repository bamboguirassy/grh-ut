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
use DateTime;
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
        $entityManager = $this->getDoctrine()->getManager();
        $form = $this->createForm(ContratType::class, $contrat);
        $form->submit(Utils::serializeRequestContent($request));
        $reqData = Utils::getObjectFromRequest($request);
        if (isset($reqData->dateSignature)) {
            $contrat->setDateSignature(new \DateTime($reqData->dateSignature));
        }
        if (isset($reqData->dateDebut)) {
            $contrat->setDateDebut(new \DateTime($reqData->dateDebut));
        }
        if (isset($reqData->dateFinPrevue)) {
            $contrat->setDateFinPrevue(new \DateTime($reqData->dateFinPrevue));
        }
        if (isset($reqData->dateFinEffective)) {
            $contrat->setDateFinEffective(new \DateTime($reqData->dateFinEffective));
        }
        if ($contrat->getEtat()) {
            // rechercher les autres contrats actifs
            $contratActifs = $entityManager->getRepository(Contrat::class)
                ->findBy(['etat' => true, 'employe' => $contrat->getEmploye()]);
            if (count($contratActifs)) {
                throw $this->createAccessDeniedException("Un contrat est déja en cours pour cet employé, 
                merci d'y mettre fin avant de pouvoir créer un autre contrat actif.");
            }
            $contrat->getEmploye()->setDateSortie($contrat->getDateFinEffective());
            $contrat->getEmploye()->setMotifSortie($contrat->getMotifFin());
            $contrat->getEmploye()->setCommentaireSortie($contrat->getCommentaireSurFinContrat());
            $contrat->getEmploye()->setEtat(true);
        }
        // $contrat->setNumero($this->generateNumeroContrat());

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
        $oldContrat = clone $contrat;
        $form = $this->createForm(ContratType::class, $contrat);
        $form->submit(Utils::serializeRequestContent($request));
        $em = $this->getDoctrine()->getManager();
        // verifier s'il y'a un autre contrat actif
        $contratActifs = $em->createQuery('select c from App\Entity\Contrat c 
        where c.etat=?1 and c<>?2 and c.employe=?3')
            ->setParameter(1, true)
            ->setParameter(2, $contrat)
            ->setParameter(3, $contrat->getEmploye())
            ->getResult();
        if ((!$oldContrat->getEtat() && $contrat->getEtat()) || ($oldContrat->getEtat() && !$contrat->getEtat() && count($contratActifs) < 1)) {
            if (count($contratActifs)) {
                throw $this->createAccessDeniedException("Impossible de procéder à l'activation de ce contrat.
                 Un autre est déja en cours, merci d'y mettre fin en le modifiant.");
            }
            $contrat->getEmploye()->setDateSortie($contrat->getDateFinEffective());
            $contrat->getEmploye()->setMotifSortie($contrat->getMotifFin());
            $contrat->getEmploye()->setCommentaireSortie($contrat->getCommentaireSurFinContrat());
        }
        if ($oldContrat->getEtat() && !$contrat->getEtat() && count($contratActifs) < 1) {
            $contrat->getEmploye()->setEtat(false);
        } elseif (!$oldContrat->getEtat() && $contrat->getEtat() && count($contratActifs) < 1) {
            $contrat->getEmploye()->setEtat(true);
        }
        $reqData = Utils::getObjectFromRequest($request);
        if (isset($reqData->dateSignature)) {
            $contrat->setDateSignature(new \DateTime($reqData->dateSignature));
        }
        if (isset($reqData->dateDebut)) {
            $contrat->setDateDebut(new \DateTime($reqData->dateDebut));
        }
        if (isset($reqData->dateFinPrevue)) {
            $contrat->setDateFinPrevue(new \DateTime($reqData->dateFinPrevue));
        }
        if (isset($reqData->dateFinEffective)) {
            $contrat->setDateFinEffective(new \DateTime($reqData->dateFinEffective));
        }
        $em->flush();

        return $contrat;
    }

    /**
     * @Rest\Put(path="/{id}/clone", name="contrat_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_CONTRAT_CLONE")
     */
    public function cloner(Request $request, Contrat $contrat): Contrat
    {
        $em = $this->getDoctrine()->getManager();
        $contratNew = new Contrat();
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
            ->findByEmploye($employe);

        return $contrats;
    }
    /**
     * @Rest\Get(path="/contrat-en-expiration", name="contrat_en_expiration")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_CONTRAT_INDEX")
     */
    public function findEnExpiration(): array
    {
        $em = $this->getDoctrine()->getManager();
        $toDay = new \DateTime();
        $toDay = $toDay->format('Ymd');
        $newDate = strtotime($toDay . "+ 3 months");
        $date = date("Y-m-d", $newDate);
        $contratEnExpirations = $em->createQuery('select c from App\Entity\Contrat c 
        where c.dateFinPrevue <= ?1 and c.dateFinPrevue >=?2 and c.etat=?3')
            ->setParameter(1, $date)
            ->setParameter(2, $toDay)
            ->setParameter(3, true)
            ->getResult();
        return $contratEnExpirations;
    }


    // public function generateNumeroContrat()
    // {
    //     $em = $this->getDoctrine()->getManager();
    //     $toDay = new \DateTime();
    //     $numero = $toDay->format('Ymd');
    //     $i = 1;
    //     // check contrats for unique numero
    //     $contrats = $em->getRepository(Contrat::class)
    //         ->findByNumero($numero . $i);
    //     while (count($contrats) > 0) {
    //         $i++;
    //         $contrats = $em->getRepository(Contrat::class)
    //             ->findByNumero($numero . $i);
    //     }
    //     return $numero . $i;
    // }
}
