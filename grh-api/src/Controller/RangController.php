<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class RangController extends AbstractController
{
    /**
     * @Route("/rang", name="rang")
     */
    public function index(): Response
    {
        return $this->render('rang/index.html.twig', [
            'controller_name' => 'RangController',
        ]);
    }
}
