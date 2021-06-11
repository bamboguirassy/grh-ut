<?php

namespace App\Controller;

use App\Entity\Rang;
use App\Form\RangType;
use App\Repository\RangRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/rang")
 */
class RangController extends AbstractController
{
    /**
     * @Route("/", name="rang_index", methods={"GET"})
     */
    public function index(RangRepository $rangRepository): Response
    {
        return $this->render('rang/index.html.twig', [
            'rangs' => $rangRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="rang_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $rang = new Rang();
        $form = $this->createForm(RangType::class, $rang);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($rang);
            $entityManager->flush();

            return $this->redirectToRoute('rang_index');
        }

        return $this->render('rang/new.html.twig', [
            'rang' => $rang,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="rang_show", methods={"GET"})
     */
    public function show(Rang $rang): Response
    {
        return $this->render('rang/show.html.twig', [
            'rang' => $rang,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="rang_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Rang $rang): Response
    {
        $form = $this->createForm(RangType::class, $rang);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('rang_index');
        }

        return $this->render('rang/edit.html.twig', [
            'rang' => $rang,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="rang_delete", methods={"POST"})
     */
    public function delete(Request $request, Rang $rang): Response
    {
        if ($this->isCsrfTokenValid('delete'.$rang->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($rang);
            $entityManager->flush();
        }

        return $this->redirectToRoute('rang_index');
    }
}
