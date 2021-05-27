<?php

namespace App\Controller;

use App\Entity\Commission;
use App\Form\CommissionType;
use App\Repository\CommissionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/commission")
 */
class CommissionController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="commission_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_COMMISSION_INDEX")
     */
    public function index(CommissionRepository $commissionRepository): array
    {
        return $commissionRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="commission_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_COMMISSION_CREATE")
     */
    public function create(Request $request): Commission    {
        $commission = new Commission();
        $form = $this->createForm(CommissionType::class, $commission);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($commission);
        $entityManager->flush();

        return $commission;
    }

    /**
     * @Rest\Get(path="/{id}", name="commission_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_COMMISSION_SHOW")
     */
    public function show(Commission $commission): Commission    {
        return $commission;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="commission_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_COMMISSION_EDIT")
     */
    public function edit(Request $request, Commission $commission): Commission    {
        $form = $this->createForm(CommissionType::class, $commission);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $commission;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="commission_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_COMMISSION_CLONE")
     */
    public function cloner(Request $request, Commission $commission):  Commission {
        $em=$this->getDoctrine()->getManager();
        $commissionNew=new Commission();
        $form = $this->createForm(CommissionType::class, $commissionNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($commissionNew);

        $em->flush();

        return $commissionNew;
    }

    /**
     * @Rest\Delete("/{id}", name="commission_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_COMMISSION_EDIT")
     */
    public function delete(Commission $commission): Commission    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($commission);
        $entityManager->flush();

        return $commission;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="commission_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_COMMISSION_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $commissions = Utils::getObjectFromRequest($request);
        if (!count($commissions)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($commissions as $commission) {
            $commission = $entityManager->getRepository(Commission::class)->find($commission->id);
            $entityManager->remove($commission);
        }
        $entityManager->flush();

        return $commissions;
    }
}
