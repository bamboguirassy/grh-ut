<?php

namespace App\Controller;

use App\Entity\MembreCommission;
use App\Form\MembreCommissionType;
use App\Repository\MembreCommissionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/membrecommission")
 */
class MembreCommissionController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="membre_commission_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_MEMBRECOMMISSION_INDEX")
     */
    public function index(MembreCommissionRepository $membreCommissionRepository): array
    {
        return $membreCommissionRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="membre_commission_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRECOMMISSION_CREATE")
     */
    public function create(Request $request): MembreCommission
    {
        $membreCommission = new MembreCommission();
        $form = $this->createForm(MembreCommissionType::class, $membreCommission);
        $form->submit(Utils::serializeRequestContent($request));
        $reqData = Utils::getObjectFromRequest($request);
        if (isset($reqData->dateIntegration)) {
            $membreCommission->setDateIntegration(new \DateTime($reqData->dateIntegration));
        }
        if (isset($reqData->dateSortie)) {
            $membreCommission->setDateSortie(new \DateTime($reqData->dateSortie));
        }
        $entityManager = $this->getDoctrine()->getManager();
        // rechercher les missions de l'employé
        $commissionEmployes = $entityManager->getRepository(MembreCommission::class)
        ->findBy(['employe' => $membreCommission->getEmploye()]);
        foreach ($commissionEmployes as $commissionEmploye) {
            if ($membreCommission->getCommission()==$commissionEmploye->getCommission()) {
                throw $this->createAccessDeniedException("Cet employé est déjà membre de cette commission");
            }
        }
        $entityManager->persist($membreCommission);
        $entityManager->flush();

        return $membreCommission;
    }

    /**
     * @Rest\Get(path="/{id}", name="membre_commission_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRECOMMISSION_SHOW")
     */
    public function show(MembreCommission $membreCommission): MembreCommission
    {
        return $membreCommission;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="membre_commission_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRECOMMISSION_EDIT")
     */
    public function edit(Request $request, MembreCommission $membreCommission): MembreCommission
    {
        $form = $this->createForm(MembreCommissionType::class, $membreCommission);
        $form->submit(Utils::serializeRequestContent($request));
        $reqData = Utils::getObjectFromRequest($request);
        if (isset($reqData->dateIntegration)) {
            $membreCommission->setDateIntegration(new \DateTime($reqData->dateIntegration));
        }
        if (isset($reqData->dateSortie)) {
            $membreCommission->setDateSortie(new \DateTime($reqData->dateSortie));
        }
        $this->getDoctrine()->getManager()->flush();

        return $membreCommission;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="membre_commission_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRECOMMISSION_CLONE")
     */
    public function cloner(Request $request, MembreCommission $membreCommission):  MembreCommission
    {
        $em=$this->getDoctrine()->getManager();
        $membreCommissionNew=new MembreCommission();
        $form = $this->createForm(MembreCommissionType::class, $membreCommissionNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($membreCommissionNew);

        $em->flush();

        return $membreCommissionNew;
    }

    /**
     * @Rest\Delete("/{id}", name="membre_commission_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRECOMMISSION_EDIT")
     */
    public function delete(MembreCommission $membreCommission): MembreCommission
    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($membreCommission);
        $entityManager->flush();

        return $membreCommission;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="membre_commission_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_MEMBRECOMMISSION_DELETE")
     */
    public function deleteMultiple(Request $request): array
    {
        $entityManager = $this->getDoctrine()->getManager();
        $membreCommissions = Utils::getObjectFromRequest($request);
        if (!count($membreCommissions)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($membreCommissions as $membreCommission) {
            $membreCommission = $entityManager->getRepository(MembreCommission::class)->find($membreCommission->id);
            $entityManager->remove($membreCommission);
        }
        $entityManager->flush();

        return $membreCommissions;
    }
    /**
    * @Rest\Get(path="/{id}/employe", name="membreCommission_employe")
    * @Rest\View(StatusCode = 200)
    * @IsGranted("ROLE_MEMBRECOMMISSION_INDEX")
    */
    public function findByEmploye(\App\Entity\Employe $employe): array
    {
        $membreCommissions = $this->getDoctrine()
            ->getRepository(MembreCommission::class)
            ->findByEmploye($employe);

        return $membreCommissions;
    }
}
