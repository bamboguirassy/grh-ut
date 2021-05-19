<?php

namespace App\Controller;

use App\Entity\CaisseSociale;
use App\Entity\Employe;
use App\Entity\Grade;
use App\Entity\MutuelleSante;
use App\Entity\Pays;
use App\Entity\TypeEmploye;
use App\Form\EmployeType;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\NonUniqueResultException;
use Doctrine\ORM\NoResultException;
use Metadata\Tests\Driver\Fixture\C\SubDir\C;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\File\File;
use App\Service\FileUploader;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/employe")
 */
class EmployeController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="employe_index")
     * @Rest\View(StatusCode = 200, serializerEnableMaxDepthChecks=true)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function index(): array
    {
        $employes = $this->getDoctrine()
            ->getRepository(Employe::class)
            ->findAll();

        return count($employes) ? $employes : [];
    }

    /**
     * @Rest\Get(path="/{id}/typeemploye", name="employe_by_typeemploye")
     * @Rest\View(StatusCode = 200, serializerEnableMaxDepthChecks=true)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function findByTypeEmploye(\App\Entity\TypeEmploye $typeEmploye): array
    {

        $employes = $this->getDoctrine()
            ->getRepository(Employe::class)
            ->findByTypeEmploye($typeEmploye);

        return count($employes) ? $employes : [];
    }

    /**
     * @Rest\Post(Path="/create", name="employe_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_EMPLOYE_CREATE")
     */
    public function create(Request $request, \App\Service\FileUploader $uploader): Employe
    {
        $employe = new Employe();
        $form = $this->createForm(EmployeType::class, $employe);
        $form->submit(Utils::serializeRequestContent($request));
        $reqData = Utils::getObjectFromRequest($request);
        if (!isset($reqData->dateNaissance)) {
            throw $this->createNotFoundException("La date de naissance est introuvable !");
        }
        if (!isset($reqData->dateRecrutement)) {
            throw $this->createNotFoundException("La date de recrutement est introuvable !");
        }
        if (isset($reqData->dateSortie)) {
            $employe->setDateSortie(new \DateTime($reqData->dateSortie));
        }
        if (isset($reqData->datePriseService)) {
            $employe->setDatePriseService(new \DateTime($reqData->datePriseService));
        }
        $employe->setDateNaissance(new \DateTime($reqData->dateNaissance));
        $employe->setDateRecrutement(new \DateTime($reqData->dateRecrutement));
        
        //check if file provided
        if ($employe->getFilepath()) {
            $host = $request->getHttpHost();
            $scheme = $request->getScheme();
            file_put_contents($employe->getFilename(), base64_decode($employe->getFilepath()));
            $file = new \Symfony\Component\HttpFoundation\File\File($employe->getFilename());
            $authorizedExtensions = ['jpeg', 'jpg', 'png'];
            if (!in_array($file->guessExtension(), $authorizedExtensions)) {
                throw new BadRequestHttpException('Fichier non pris en charge');
            }
            $newFileName = $uploader->setTargetDirectory('employe_photo_directory')->upload($file, null); // old fileName
            $employe->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
            $employe->setFilename($newFileName);
        }

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($employe);
        $entityManager->flush();

        return $employe;
    }

    /**
     * @Rest\Get(path="/{id}", name="employe_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_EMPLOYE_SHOW")
     */
    public function show(Employe $employe): Employe
    {
        return $employe;
    }


    /**
     * @Rest\Put(path="/{id}/edit", name="employe_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_EMPLOYE_EDIT")
     */
    public function edit(Request $request, Employe $employe,\App\Service\FileUploader $uploader): Employe
    {
        $form = $this->createForm(EmployeType::class, $employe);
        $form->submit(Utils::serializeRequestContent($request));
        $reqData = Utils::getObjectFromRequest($request);
        if (!isset($reqData->dateNaissance)) {
            throw $this->createNotFoundException("La date de naissance est introuvable !");
        }
        if (!isset($reqData->dateRecrutement)) {
            throw $this->createNotFoundException("La date de recrutement est introuvable !");
        }
        if (isset($reqData->dateSortie)) {
            $employe->setDateSortie(new \DateTime($reqData->dateSortie));
        }
        if (isset($reqData->datePriseService)) {
            $employe->setDatePriseService(new \DateTime($reqData->datePriseService));
        }
       
        $employe->setDateNaissance(new \DateTime($reqData->dateNaissance));
        $employe->setDateRecrutement(new \DateTime($reqData->dateRecrutement));
        $this->getDoctrine()->getManager()->flush();

        return $employe;
    }

    /**
     * @Rest\Put(path="/{id}/clone", name="employe_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_EMPLOYE_CLONE")
     */
    public function cloner(Request $request, Employe $employe): Employe
    {
        $em = $this->getDoctrine()->getManager();
        $employeNew = new Employe();
        $form = $this->createForm(EmployeType::class, $employeNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($employeNew);

        $em->flush();

        return $employeNew;
    }

    /**
     * @Rest\Delete("/{id}", name="employe_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_EMPLOYE_EDIT")
     */
    public function delete(Employe $employe): Employe
    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($employe);
        $entityManager->flush();

        return $employe;
    }

    /**
     * @Rest\Post("/delete-selection/", name="employe_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_EMPLOYE_DELETE")
     */
    public function deleteMultiple(Request $request): array
    {
        $entityManager = $this->getDoctrine()->getManager();
        $employes = Utils::getObjectFromRequest($request);
        if (!count($employes)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($employes as $employe) {
            $employe = $entityManager->getRepository(Employe::class)->find($employe->id);
            $entityManager->remove($employe);
        }
        $entityManager->flush();

        return $employes;
    }

    function generateFakeData()
    {
        // find groups
        $em = $this->getDoctrine()->getManager();
        $nationalites = $em->getRepository(Pays::class)->findAll();
        $mutuelleSantes = $em->getRepository(MutuelleSante::class)->findAll();
        $grades = $em->getRepository(Grade::class)->findAll();
        $caisseSociales = $em->getRepository(CaisseSociale::class)->findAll();
        $typeEmployes = $em->getRepository(TypeEmploye::class)->findAll();
        $situationMatrimoniales = ['Célibataire', 'Marié(e)', 'Divorcé(e)', 'Veuf(ve)'];
        $genres = ['Masculin', 'Féminin'];


        $faker = \Faker\Factory::create('fr_FR');

        for ($i = 0; $i < 1500; $i++) {
            /** @var Employe $employe */
            $employe = new Employe();
            $employe
                ->setPrenoms($faker->firstName)
                ->setNom($faker->lastName)
                ->setDateNaissance($faker->dateTime())
                ->setLieuNaissance($faker->city)
                ->setCni($faker->unique()->bankAccountNumber)
                ->setMatricule($faker->unique()->postcode)
                ->setMatriculeCaisseSociale($faker->unique()->postcode)
                ->setDateRecrutement($faker->dateTime())
                ->setSitutationMatrimoniale($faker->randomElement($situationMatrimoniales))
                ->setRetraite($faker->boolean)
                ->setGenre($faker->randomElement($genres))
                ->setEtat($faker->boolean)
                ->setEmailUniv(strtolower(str_replace(' ', '', $faker->unique()->name)) . "@univ-thies.sn")
                ->setEmail($faker->unique()->email)
                ->setFilename($faker->ean13)
                ->setFilepath($faker->imageUrl())
                ->setTelephonePrimaire($faker->unique()->phoneNumber)
                ->setTelephoneSecondaire($faker->unique()->phoneNumber)
                ->setCaisseSociale($faker->randomElement($caisseSociales))
                ->setGrade($faker->randomElement($grades))
                ->setMutuelleSante($faker->randomElement($mutuelleSantes))
                ->setNationalite($faker->randomElement($nationalites))
                ->setTypeEmploye($faker->randomElement($typeEmployes));


            $em->persist($employe);
        }
        $em->flush();
    }
    
    /**
     * @Rest\Put(path="/change_image_employe", name="edit_image_picture")
     * @Rest\View(StatusCode=200)
     * @IsGranted("IS_AUTHENTICATED_FULLY")
     * @param Request $request
     * @param FileUploader $uploader
     * @return Employe
     * @throws Exception
     */
    public function uploadPhoto(Request $request,  Employe $employe,\App\Service\FileUploader $uploader) {
        $manager = $this->getDoctrine()->getManager();
        $host = $request->getHttpHost();
        $scheme = $request->getScheme();
        $data = Utils::getObjectFromRequest($request);
        $filename = $data->filename;

        file_put_contents($filename, base64_decode($data->photo));
        $file = new File($filename);
        $authorizedExtensions = ['jpeg', 'jpg', 'png'];
        if (!in_array($file->guessExtension(), $authorizedExtensions))
            throw new BadRequestHttpException('Fichier non pris en charge');
        $newFileName = $uploader->setTargetDirectory('employe_photo_directory')->upload($file, $employe->getFilename()); // old fileName
        $employe->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
        $employe->setFilename($newFileName);
        $manager->flush();

        return $employe;
    }
}
