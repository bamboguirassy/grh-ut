<?php

namespace App\Controller;

use App\Entity\Employe;
use App\Entity\FonctionEmploye;
use App\Form\FonctionEmployeType;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\NonUniqueResultException;
use Doctrine\ORM\NoResultException;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/fonctionemploye")
 */
class FonctionEmployeController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="fonction_employe_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_FONCTIONEMPLOYE_INDEX")
     */
    public function index(): array
    {
        $fonctionEmployes = $this->getDoctrine()
            ->getRepository(FonctionEmploye::class)
            ->findAll();

        return count($fonctionEmployes) ? $fonctionEmployes : [];
    }

    /**
     * @Rest\Get(path="/{id}/employe", name="fonction_employe_by_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_FONCTIONEMPLOYE_INDEX")
     */
    public function findByEmploye(\App\Entity\Employe $employe): array
    {
        $fonctionEmployes = $this->getDoctrine()
            ->getRepository(FonctionEmploye::class)
            ->findByEmploye($employe);

        return count($fonctionEmployes) ? $fonctionEmployes : [];
    }

    /**
     * @Rest\Get(path="/employe/{id}/latest", name="fonction_latest_by_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_FONCTIONEMPLOYE_INDEX")
     * @throws NoResultException
     * @throws NonUniqueResultException
     */
    public function findLatest(Employe $employe, EntityManagerInterface $entityManager)
    {
        return
            $entityManager->createQuery('
            SELECT fe
            FROM App\Entity\FonctionEmploye fe
            WHERE fe.employe = :employe
            ORDER BY fe.datePriseFonction DESC
      ')->setParameter('employe', $employe)
                ->setMaxResults(1)
                ->getSingleResult();
    }

    /**
     * @Rest\Post(Path="/create", name="fonction_employe_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTIONEMPLOYE_CREATE")
     */
    public function create(Request $request): FonctionEmploye
    {
        $fonctionEmploye = new FonctionEmploye();
        $form = $this->createForm(FonctionEmployeType::class, $fonctionEmploye);
        $form->submit(Utils::serializeRequestContent($request));
        $reqData = Utils::getObjectFromRequest($request);
        if (!isset($reqData->datePriseFonction)) {
            throw $this->createNotFoundException("La date de prise de service est obligatoire !");
        }

        $fonctionEmploye->setDatePriseFonction(new \DateTime($reqData->datePriseFonction));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($fonctionEmploye);
        $entityManager->flush();

        return $fonctionEmploye;
    }

    /**
     * @Rest\Get(path="/{id}", name="fonction_employe_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTIONEMPLOYE_SHOW")
     */
    public function show(FonctionEmploye $fonctionEmploye): FonctionEmploye
    {
        return $fonctionEmploye;
    }


    /**
     * @Rest\Put(path="/{id}/edit", name="fonction_employe_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTIONEMPLOYE_EDIT")
     */
    public function edit(Request $request, FonctionEmploye $fonctionEmploye): FonctionEmploye
    {
        $form = $this->createForm(FonctionEmployeType::class, $fonctionEmploye);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $fonctionEmploye;
    }

    /**
     * @Rest\Put(path="/{id}/clone", name="fonction_employe_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTIONEMPLOYE_CLONE")
     */
    public function cloner(Request $request, FonctionEmploye $fonctionEmploye): FonctionEmploye
    {
        $em = $this->getDoctrine()->getManager();
        $fonctionEmployeNew = new FonctionEmploye();
        $form = $this->createForm(FonctionEmployeType::class, $fonctionEmployeNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($fonctionEmployeNew);

        $em->flush();

        return $fonctionEmployeNew;
    }

    /**
     * @Rest\Delete("/{id}", name="fonction_employe_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTIONEMPLOYE_EDIT")
     */
    public function delete(FonctionEmploye $fonctionEmploye): FonctionEmploye
    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($fonctionEmploye);
        $entityManager->flush();

        return $fonctionEmploye;
    }

    /**
     * @Rest\Post("/delete-selection/", name="fonction_employe_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_FONCTIONEMPLOYE_DELETE")
     */
    public function deleteMultiple(Request $request): array
    {
        $entityManager = $this->getDoctrine()->getManager();
        $fonctionEmployes = Utils::getObjectFromRequest($request);
        if (!count($fonctionEmployes)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($fonctionEmployes as $fonctionEmploye) {
            $fonctionEmploye = $entityManager->getRepository(FonctionEmploye::class)->find($fonctionEmploye->id);
            $entityManager->remove($fonctionEmploye);
        }
        $entityManager->flush();

        return $fonctionEmployes;
    }
}
