<?php

namespace App\Controller;

use App\Entity\Profession;
use App\Form\ProfessionType;
use App\Repository\ProfessionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use App\Entity\Employe;

/**
 * @Route("/api/profession")
 */
class ProfessionController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="profession_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_PROFESSION_INDEX")
     */
    public function index(ProfessionRepository $professionRepository): array
    {
        return $professionRepository->findAll();
    }

    /**
     * @Rest\Post(Path="/create", name="profession_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_PROFESSION_CREATE")
     */
    public function create(Request $request): Profession    {
        $profession = new Profession();
        $form = $this->createForm(ProfessionType::class, $profession);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($profession);
        $entityManager->flush();

        return $profession;
    }

    /**
     * @Rest\Get(path="/{id}", name="profession_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_PROFESSION_SHOW")
     */
    public function show(Profession $profession): Profession    {
        return $profession;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="profession_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_PROFESSION_EDIT")
     */
    public function edit(Request $request, Profession $profession): Profession    {
        $form = $this->createForm(ProfessionType::class, $profession);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $profession;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="profession_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_PROFESSION_CLONE")
     */
    public function cloner(Request $request, Profession $profession):  Profession {
        $em=$this->getDoctrine()->getManager();
        $professionNew=new Profession();
        $form = $this->createForm(ProfessionType::class, $professionNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($professionNew);

        $em->flush();

        return $professionNew;
    }

    /**
     * @Rest\Delete("/{id}", name="profession_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_PROFESSION_EDIT")
     */
    public function delete(Profession $profession): Profession    {
        $entityManager = $this->getDoctrine()->getManager();
        $employes = $entityManager->getRepository(Employe::class)
                ->findByProfession($profession);
        if (count($employes) > 0) {
            return $employes;
            //throw $this->createNotFoundException("Suppression Profession!!!.");
        }
        $entityManager->remove($profession);
        $entityManager->flush();

        return $profession;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="profession_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_PROFESSION_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $professions = Utils::getObjectFromRequest($request);
        if (!count($professions)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($professions as $profession) {
            $profession = $entityManager->getRepository(Profession::class)->find($profession->id);
            $entityManager->remove($profession);
        }
        $entityManager->flush();

        return $professions;
    }
}
