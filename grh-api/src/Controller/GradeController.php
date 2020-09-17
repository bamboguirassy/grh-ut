<?php

namespace App\Controller;

use App\Entity\Grade;
use App\Form\GradeType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/grade")
 */
class GradeController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="grade_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GRADE_INDEX")
     */
    public function index(): array
    {
        $grades = $this->getDoctrine()
            ->getRepository(Grade::class)
            ->findAll();

        return count($grades)?$grades:[];
    }

    /**
     * @Rest\Post(Path="/create", name="grade_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_CREATE")
     */
    public function create(Request $request): Grade    {
        $grade = new Grade();
        $form = $this->createForm(GradeType::class, $grade);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($grade);
        $entityManager->flush();

        return $grade;
    }

    /**
     * @Rest\Get(path="/{id}", name="grade_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_SHOW")
     */
    public function show(Grade $grade): Grade    {
        return $grade;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="grade_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_EDIT")
     */
    public function edit(Request $request, Grade $grade): Grade    {
        $form = $this->createForm(GradeType::class, $grade);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $grade;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="grade_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_CLONE")
     */
    public function cloner(Request $request, Grade $grade):  Grade {
        $em=$this->getDoctrine()->getManager();
        $gradeNew=new Grade();
        $form = $this->createForm(GradeType::class, $gradeNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($gradeNew);

        $em->flush();

        return $gradeNew;
    }

    /**
     * @Rest\Delete("/{id}", name="grade_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_EDIT")
     */
    public function delete(Grade $grade): Grade    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($grade);
        $entityManager->flush();

        return $grade;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="grade_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $grades = Utils::getObjectFromRequest($request);
        if (!count($grades)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($grades as $grade) {
            $grade = $entityManager->getRepository(Grade::class)->find($grade->id);
            $entityManager->remove($grade);
        }
        $entityManager->flush();

        return $grades;
    }
}
