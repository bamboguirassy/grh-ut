<?php

namespace App\Controller;

use App\Entity\Fonction;
use App\Entity\Structure;
use App\Form\FonctionType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/fonction")
 */
class FonctionController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="fonction_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_FONCTION_INDEX")
     */
    public function index(): array
    {
        $fonctions = $this->getDoctrine()
            ->getRepository(Fonction::class)
            ->findAll();

        return count($fonctions) ? $fonctions : [];
    }

    /**
     * @Rest\Post(Path="/create", name="fonction_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTION_CREATE")
     */
    public function create(Request $request): Fonction
    {
        $fonction = new Fonction();
        $form = $this->createForm(FonctionType::class, $fonction);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($fonction);
        $entityManager->flush();

        return $fonction;
    }

    /**
     * @Rest\Get(path="/{id}", name="fonction_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTION_SHOW")
     */
    public function show(Fonction $fonction): Fonction
    {
        return $fonction;
    }

    /**
     * @Rest\Get(path="/not-binded/{id}/structure", name="find_not_binded_by_structure",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTION_SHOW")
     */
    public function findNotBindedByStructure(Structure $structure, EntityManagerInterface $entityManager)
    {
        return $entityManager->createQuery('
            SELECT f
            FROM App\Entity\Fonction f
            WHERE f NOT IN (
                SELECT bf
                FROM App\Entity\StructureFonction sf
                JOIN sf.fonction bf
                WHERE sf.structure = :structure
            )
            ORDER BY f.nom
        ')->setParameter('structure', $structure)->getResult();
    }


    /**
     * @Rest\Put(path="/{id}/edit", name="fonction_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTION_EDIT")
     */
    public function edit(Request $request, Fonction $fonction): Fonction
    {
        $form = $this->createForm(FonctionType::class, $fonction);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $fonction;
    }

    /**
     * @Rest\Put(path="/{id}/clone", name="fonction_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTION_CLONE")
     */
    public function cloner(Request $request, Fonction $fonction): Fonction
    {
        $em = $this->getDoctrine()->getManager();
        $fonctionNew = new Fonction();
        $form = $this->createForm(FonctionType::class, $fonctionNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($fonctionNew);

        $em->flush();

        return $fonctionNew;
    }

    /**
     * @Rest\Delete("/{id}", name="fonction_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTION_EDIT")
     */
    public function delete(Fonction $fonction): Fonction
    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($fonction);
        $entityManager->flush();

        return $fonction;
    }

    /**
     * @Rest\Post("/delete-selection/", name="fonction_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTION_DELETE")
     */
    public function deleteMultiple(Request $request): array
    {
        $entityManager = $this->getDoctrine()->getManager();
        $fonctions = Utils::getObjectFromRequest($request);
        if (!count($fonctions)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($fonctions as $fonction) {
            $fonction = $entityManager->getRepository(Fonction::class)->find($fonction->id);
            $entityManager->remove($fonction);
        }
        $entityManager->flush();

        return $fonctions;
    }
}
