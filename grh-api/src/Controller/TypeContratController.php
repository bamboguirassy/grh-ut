<?php

namespace App\Controller;

use App\Entity\TypeContrat;
use App\Form\TypeContratType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/typecontrat")
 */
class TypeContratController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="type_contrat_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_TYPECONTRAT_INDEX")
     */
    public function index(): array
    {
        $typeContrats = $this->getDoctrine()
            ->getRepository(TypeContrat::class)
            ->findAll();

        return count($typeContrats)?$typeContrats:[];
    }

    /**
     * @Rest\Post(Path="/create", name="type_contrat_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPECONTRAT_CREATE")
     */
    public function create(Request $request): TypeContrat    {
        $typeContrat = new TypeContrat();
        $form = $this->createForm(TypeContratType::class, $typeContrat);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($typeContrat);
        $entityManager->flush();

        return $typeContrat;
    }

    /**
     * @Rest\Get(path="/{id}", name="type_contrat_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPECONTRAT_SHOW")
     */
    public function show(TypeContrat $typeContrat): TypeContrat    {
        return $typeContrat;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="type_contrat_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPECONTRAT_EDIT")
     */
    public function edit(Request $request, TypeContrat $typeContrat): TypeContrat    {
        $form = $this->createForm(TypeContratType::class, $typeContrat);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $typeContrat;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="type_contrat_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPECONTRAT_CLONE")
     */
    public function cloner(Request $request, TypeContrat $typeContrat):  TypeContrat {
        $em=$this->getDoctrine()->getManager();
        $typeContratNew=new TypeContrat();
        $form = $this->createForm(TypeContratType::class, $typeContratNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($typeContratNew);

        $em->flush();

        return $typeContratNew;
    }

    /**
     * @Rest\Delete("/{id}", name="type_contrat_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPECONTRAT_EDIT")
     */
    public function delete(TypeContrat $typeContrat): TypeContrat    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($typeContrat);
        $entityManager->flush();

        return $typeContrat;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="type_contrat_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_TYPECONTRAT_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $typeContrats = Utils::getObjectFromRequest($request);
        if (!count($typeContrats)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($typeContrats as $typeContrat) {
            $typeContrat = $entityManager->getRepository(TypeContrat::class)->find($typeContrat->id);
            $entityManager->remove($typeContrat);
        }
        $entityManager->flush();

        return $typeContrats;
    }
}
