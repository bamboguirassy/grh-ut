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
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/employe")
 */
class EmployeController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="employe_index")
     * @Rest\View(StatusCode = 200)
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
     * @Rest\Get(path="/statistics/count-by-type/", name="employe_count_statistic_by_type")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countByType(): array
    {
        $em = $this->getDoctrine()->getManager();
        $types = $em->getRepository('App\Entity\TypeEmploye')
            ->findAll();
        $tab = [];
        foreach ($types as $type) {
            $employes = $em->getRepository(Employe::class)
                ->findByTypeEmploye($type);
            $tab [] = [
                'type' => $type,
                'nbreEmploye' => count($employes)
            ];
        }


        return count($tab) ? $tab : [];
    }

    /**
     * @Rest\Post(path="/statistics/by-type", name="statistic_by_type")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function findStatsByType(Request $request): array
    {
        /** @var EntityManagerInterface $em */
        $em = $this->getDoctrine()->getManager();
        $typeEmployeIds = Utils::serializeRequestContent($request)['typeEmployes'];
        $tab = [];
        $tabCaisse = [];
        $tabRecrutementCourant = [];
        $tabRecrutementPrecedent = [];
        $nbrHomme = 0;
        $nbrFemme = 0;
        $tranche1830 = 0;
        $tranche3040 = 0;
        $tranche4050 = 0;
        $tranche5060 = 0;
        $tranche60Plus = 0;
        $anneeCourante = date("Y");
        $anneePrecendente = date("Y", strtotime("-1 year"));
        $typeEmployes = $em->createQuery('
            SELECT te
            FROM App\Entity\TypeEmploye te
            WHERE te.id IN (:ids)
        ')->setParameter('ids', $typeEmployeIds)->getResult();
        $employes = $em->createQuery('
            SELECT e
            FROM App\Entity\Employe e
            WHERE e.typeEmploye IN (:te)
        ')->setParameter('te', $typeEmployes)->getResult();
        $caisseSociales = $em->getRepository(CaisseSociale::class)->findAll();


        foreach (range(1, 12) as $mois) {
            if ($mois >= 1 AND $mois <= 9)
                $mois = '0' . $mois;
            $mois = (string)$mois;
            try {
                $nombreEmployeCourant = $em
                    ->createQuery('
                            SELECT COUNT(e) 
                            FROM App\Entity\Employe e 
                            WHERE e.dateRecrutement LIKE :dr 
                            AND e.typeEmploye IN (:te)
                        ')
                    ->setParameter('dr', "{$anneeCourante}-{$mois}%")
                    ->setParameter('te', $typeEmployes)
                    ->getSingleScalarResult();
            } catch (NoResultException $e) {
                $nombreEmployeCourant = 0;
            } catch (NonUniqueResultException $e) {
                $nombreEmployeCourant = 0;
            }

            try {
                $nombreEmployePrecendent = $em
                    ->createQuery('
                            SELECT COUNT(e) 
                            FROM App\Entity\Employe e 
                            WHERE e.dateRecrutement LIKE :dr 
                            AND e.typeEmploye IN (:te)
                        ')
                    ->setParameter('dr', "{$anneePrecendente}-{$mois}%")
                    ->setParameter('te', $typeEmployes)
                    ->getSingleScalarResult();
            } catch (NoResultException $e) {
                $nombreEmployePrecendent = 0;
            } catch (NonUniqueResultException $e) {
                $nombreEmployePrecendent = 0;
            }

            $tabRecrutementCourant[] = [
                'mois' => $mois,
                'nombre' => $nombreEmployeCourant
            ];

            $tabRecrutementPrecedent[] = [
                'mois' => $mois,
                'nombre' => $nombreEmployePrecendent
            ];
        }

        /** @var CaisseSociale $caisseSociale */
        foreach ($caisseSociales as $caisseSociale) {
            $count = 0;
            try {
                $count = $em
                    ->createQuery('
                        SELECT COUNT(e) 
                        FROM App\Entity\Employe e 
                        WHERE e.caisseSociale=:cs 
                            AND e.typeEmploye IN (:te)
                    ')
                    ->setParameter('cs', $caisseSociale)
                    ->setParameter('te', $typeEmployes)
                    ->getSingleScalarResult();
            } catch (NoResultException $e) {
                $count = 0;
            } catch (NonUniqueResultException $e) {
                $count = 0;
            }
            $tabCaisse[] = [
                'nom' => $caisseSociale->getNom(),
                'nombre' => $count
            ];
        }
        /** @var Employe $employe */
        foreach ($employes as $employe) {
            if (strtolower($employe->getGenre()) === 'masculin')
                $nbrHomme++;
            else
                $nbrFemme++;
            $age = (int)date('Y') - (int)$employe->getDateNaissance()->format('Y');
            if ($age >= 18 && $age < 30) $tranche1830++;
            else if ($age >= 30 && $age < 40) $tranche3040++;
            else if ($age >= 40 && $age < 50) $tranche4050++;
            else if ($age >= 50 && $age < 60) $tranche5060++;
            else if ($age >= 60) $tranche60Plus++;
        }
        $tab [] = [
            'nombreEmploye' => count($employes),
            'nombreHomme' => $nbrHomme,
            'nombreFemme' => $nbrFemme,
            'tranche1830' => $tranche1830,
            'tranche4050' => $tranche4050,
            'tranche5060' => $tranche5060,
            'tranche3040' => $tranche3040,
            'tranchePlus60' => $tranche60Plus,
            'caisseSociales' => $tabCaisse,
            'recrutementCourant' => $tabRecrutementCourant,
            'recrutementPrecedent' => $tabRecrutementPrecedent
        ];


        return count($tab) ? $tab : [];
    }


    /**
     * @Rest\Get(path="/{id}/typeemploye", name="employe_by_typeemploye")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function findByTypeEmployé(\App\Entity\TypeEmploye $typeEmploye): array
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
    public function edit(Request $request, Employe $employe): Employe
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
}
