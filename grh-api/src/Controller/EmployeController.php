<?php

namespace App\Controller;

use App\Entity\CaisseSociale;
use App\Entity\Employe;
use App\Entity\Grade;
use App\Entity\MutuelleSante;
use App\Entity\Pays;
use App\Entity\Profession;
use App\Entity\Structure;
use App\Entity\TypeEmploye;
use App\Entity\MembreFamille;
use App\Form\EmployeType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Symfony\Component\HttpFoundation\File\File;
use App\Service\FileUploader;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use Swift_Mailer;
use Swift_Message;

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
     * @Rest\Post(path="/realtime-search", name="employe_realtime_search")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function realtimeSearch(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $redData = Utils::serializeRequestContent($request);
        $employes = [];
        if (isset($redData['searchTerm'])) {
            $names = explode(' ', $redData['searchTerm']);
            if (count($names) > 1) {
                $employes = $em->createQuery('SELECT e
                    FROM App\Entity\Employe e
                    WHERE CONCAT(e.prenoms,\' \',e.nom) LIKE :term')
                    ->setParameter('term', '%' . $redData['searchTerm'] . '%')
                    ->getResult();
            } else {
                $employes = $em->createQuery('SELECT e
                    FROM App\Entity\Employe e
                    WHERE e.prenoms LIKE :term OR
                    e.nom LIKE :term OR 
                    e.matricule LIKE :term OR 
                    e.emailUniv LIKE :term OR 
                    e.cni LIKE :term')
                    ->setParameter('term', '%' . $redData['searchTerm'] . '%')
                    ->getResult();
            }
        }

        return $employes;
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
        /*  $professions = $this->getDoctrine()
            ->getRepository(Profession::class)
            ->findAll();
            $faker = \Faker\Factory::create('fr_FR');
            foreach($employes as $employe) {
                if($employe->getProfession()==null) {
$employe->setProfession($faker->randomElement($professions));
                }
            }
            $this->getDoctrine()->getManager()->flush();*/


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
        if (isset($reqData->dateRecrutement)) {
            $employe->setDateRecrutement(new \DateTime($reqData->dateRecrutement));
        }
        if (isset($reqData->dateSortie)) {
            $employe->setDateSortie(new \DateTime($reqData->dateSortie));
        }
        if (isset($reqData->datePriseService)) {
            $employe->setDatePriseService(new \DateTime($reqData->datePriseService));
        }
        $employe->setDateNaissance(new \DateTime($reqData->dateNaissance));


        if ($employe->getFilepath()) {
            $scheme = $request->getScheme();
            file_put_contents($employe->getFilename(), base64_decode($employe->getFilepath()));
            $file = new \Symfony\Component\HttpFoundation\File\File($employe->getFilename());
            $authorizedExtensions = ['jpeg', 'jpg', 'png'];
            if (!in_array($file->guessExtension(), $authorizedExtensions)) {
                throw $this->createAccessDeniedException('Fichier non pris en charge');
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
     * @Rest\Get(path="/caisse-sociale/{id}", name="caisse_sociale_employe",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200, serializerEnableMaxDepthChecks=true)
     * @IsGranted("ROLE_EMPLOYE_SHOW")
     */
    public function findByCaiseSociale(CaisseSociale $caisseSociale)
    {
        $employes = $this->getDoctrine()
            ->getRepository(Employe::class)
            ->findByCaisseSociale($caisseSociale);
        return $employes;
    }

    /**
     * @Rest\Get(path="/date-recrutement-range/{startDate}/{endDate}", name="find_by_date_recrutement_range",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200, serializerEnableMaxDepthChecks=true)
     * @IsGranted("ROLE_EMPLOYE_SHOW")
     */
    public function findByDateRecrutementRange(EntityManagerInterface $entityManager, $startDate, $endDate)
    {
        if (!isset($startDate) || empty($startDate)) throw new BadRequestHttpException("Vous devez préciser la date de début!");

        if (!isset($endDate) || empty($endDate)) throw new BadRequestHttpException("Vous devez préciser la date de fin!");

        return $entityManager->createQuery('
            SELECT e
            FROM App\Entity\Employe e
            WHERE e.dateRecrutement BETWEEN :startDate AND :endDate
        ')->setParameters([
            'startDate' => $startDate,
            'endDate' => $endDate
        ])->getResult();
    }

    /**
     * @Rest\Put(path="/{id}/edit", name="employe_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_EMPLOYE_EDIT")
     */
    public function edit(Request $request, Employe $employe, \App\Service\FileUploader $uploader): Employe
    {
        $form = $this->createForm(EmployeType::class, $employe);
        $form->submit(Utils::serializeRequestContent($request));
        $reqData = Utils::getObjectFromRequest($request);
        if (!isset($reqData->dateNaissance)) {
            throw $this->createNotFoundException("La date de naissance est introuvable !");
        }
        if (isset($reqData->dateRecrutement)) {
            $employe->setDateRecrutement(new \DateTime($reqData->dateRecrutement));
        }
        if (isset($reqData->dateSortie)) {
            $employe->setDateSortie(new \DateTime($reqData->dateSortie));
        }
        if (isset($reqData->datePriseService)) {
            $employe->setDatePriseService(new \DateTime($reqData->datePriseService));
        }

        $employe->setDateNaissance(new \DateTime($reqData->dateNaissance));
        $this->getDoctrine()->getManager()->flush();

        return $employe;
    }

    /**
     * @Rest\Put(path="/upload-photo/{id}", name="upload_employe_photo")
     * @Rest\View(StatusCode=200)
     * @param Request $request
     * @param FileUploader $uploader
     * @return Employe
     * @throws Exception
     */
    public function uploadPhoto(Request $request, Employe $employe, FileUploader $uploader)
    {
        $manager = $this->getDoctrine()->getManager();
        $host = $request->getHttpHost();
        $scheme = $request->getScheme();
        $data = Utils::getObjectFromRequest($request);
        $fileName = $data->fileName;
        file_put_contents($fileName, base64_decode($data->photo));
        $file = new File($fileName);
        $authorizedExtensions = ['jpeg', 'jpg', 'png'];
        if (!in_array($file->guessExtension(), $authorizedExtensions))
            throw new BadRequestHttpException('Fichier non pris en charge');
        $newFileName = $uploader->setTargetDirectory('employe_photo_directory')->upload($file, $employe->getFilename()); // old fileName
        $employe->setFilepath("$scheme://$host/" . $uploader->getTargetDirectory() . $newFileName);
        $employe->setFilename($newFileName);
        $manager->flush();

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
     * @Rest\Post(path="/public/with-family-members", name="employe_with_family_members")
     * @Rest\View(StatusCode = 200)
     */
    public function findWithMemberFamily(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $redData = Utils::serializeRequestContent($request);
        $mdp = 'AsjfV4*QdGmZ12Z';
        $password = $redData['password'];
        $matricule = $redData['matricule'];
        $tab = [];

        if (strcmp($mdp, $password) !== 0) {
            throw $this->createAccessDeniedException("Vous n'êtes pas autorisé à accéder à cette ressource. Merci de contact l'administrateur de la plateforme.");
        }

        $employe = $em->getRepository(Employe::class)
            ->findOneByMatricule($matricule);

        if ($employe == null) {
            throw $this->createNotFoundException("Aucun employé n'a été trouvé avec le matricule {$matricule}.");
        }
        $membreFamilles = $em->getRepository(MembreFamille::class)
            ->findByEmploye($employe);
        $tab = [
            'employe' => $employe,
            'membreFamilles' => $membreFamilles
        ];
        return $tab;
    }

    /**
     * @Rest\Post(path="/send-email", name="employe_send-email")
     * @Rest\View(StatusCode=200)
     * @param Request $request
     * @param Swift_Mailer $mailer
     * @return array
     * @throws Exception
     */
    public function sendSingleEmail(Request $request, Swift_Mailer $mailer): array
    {

       $employeIds = Utils::serializeRequestContent($request)['id'];
       $entityManager = $this->getDoctrine()->getManager();
        $object = Utils::serializeRequestContent($request)['object'];
        $messaye_body = Utils::serializeRequestContent($request)['message'];
        $result = []; // confirmation link
        foreach ($employeIds as $id) {
            $employe = $entityManager->getRepository(Employe::class)->find($id);
            if($employe->getEmail()!=NULL && $employe->getEmailUniv()!=NULL){
                $message = (new Swift_Message($object))
                ->setFrom(Utils::$sender)
                ->setTo($employe->getEmail())
                ->setCc($employe->getEmailUniv())
                ->setBody($messaye_body, 'text/html');
                array_push($result,  [$employe->getId() => $mailer->send($message)]); 
            }
            else{
                 if($employe->getEmailUniv()==NULL && $employe->getEmail()!=NULL){
                    $message = (new Swift_Message($object))
                     ->setFrom(Utils::$sender)
                     ->setTo($employe->getEmail())
                     ->setBody($messaye_body, 'text/html');
                     array_push($result,  [$employe->getId() => $mailer->send($message)]); 
                 }
                 elseif($employe->getEmailUniv()!=NULL && $employe->getEmail()==NULL){
                    $message = (new Swift_Message($object))
                     ->setFrom(Utils::$sender)
                     ->setTo($employe->getEmailUniv())
                     ->setBody($messaye_body, 'text/html');
                     array_push($result,  [$employe->getId() => $mailer->send($message)]); 
                 }
                 else{
                    throw $this->createNotFoundException("L'employé {$employe->getPrenoms()} {$employe->getNom()} avec l'identifiant {$employe->getId()} ne dispose d'aucun email dans le système");
                 }

               
            }// 0 => failure

        }

        return $result;
    }

    /**
     * @param Request $request
     * @param EntityManagerInterface $entityManager
     * @Rest\Post(path="/global-filter", name="global_filter")
     * @Rest\View(StatusCode=200, serializerEnableMaxDepthChecks=true)
     * @return mixed
     */
    public function filterGlobal(Request $request, EntityManagerInterface $entityManager)
    {
        ini_set('memory_limit', '512M');
        $typeEmployes = Utils::serializeRequestContent($request)['criteria']['typeEmployes'];
        $structures = Utils::serializeRequestContent($request)['criteria']['structures'];
        $startDate = Utils::serializeRequestContent($request)['criteria']['startDate'];
        $endDate = Utils::serializeRequestContent($request)['criteria']['endDate'];
        $dqlQuery = count($typeEmployes)
            ? 'SELECT DISTINCT e
               FROM App\Entity\Employe e
               WHERE e.typeEmploye IN (:typeEmployes)'
            : 'SELECT DISTINCT e
               FROM App\Entity\Employe e';

        if(count($structures)) {
            $dqlQuery .= ' AND e.structure IN (:structures)';
        }

        if(!empty($startDate) && !empty($endDate)) {
            $dqlQuery .= ' AND  e.dateRecrutement BETWEEN :startDate AND :endDate';
        }

        $queryObject = $entityManager->createQuery(trim($dqlQuery));
        if(str_contains($dqlQuery, ':typeEmployes')) {
            $queryObject->setParameter('typeEmployes', $typeEmployes);
        }

        if(str_contains($dqlQuery, ':structures')) {
            $queryObject->setParameter('structures', $structures);
        }

        if(str_contains($dqlQuery, ':startDate') && str_contains($dqlQuery, ':endDate')) {
           $queryObject->setParameter('startDate', $startDate);
           $queryObject->setParameter('endDate', $endDate);
        }

        return $queryObject->getResult();

    }

    /**
     * @param Request $request
     * @param EntityManagerInterface $entityManager
     * @Rest\Post(path="/many-type-employe", name="find_by_many_type_employe")
     * @Rest\View(StatusCode=200, serializerEnableMaxDepthChecks=true)
     * @return mixed
     */
    public function findByManyTypeEmploye(Request $request, EntityManagerInterface $entityManager)
    {
        $typeEmployes = Utils::serializeRequestContent($request)['typeEmployes'];
        if (count($typeEmployes)) {
            return $entityManager->createQuery('
                SELECT e
                FROM App\Entity\Employe e
                WHERE e.typeEmploye IN (:typeEmployes)
            ')->setParameter('typeEmployes', $typeEmployes)
                ->getResult();
        } else {
            throw new BadRequestHttpException("Vous devez selectionner au moins un type d'employé!");
        }

    }

    /**
     * @param Request $request
     * @param EntityManagerInterface $entityManager
     * @Rest\Post(path="/many-structure", name="find_by_many_structure")
     * @Rest\View(StatusCode=200)
     * @return mixed
     */
    public function findByManyStructure(Request $request, EntityManagerInterface $entityManager)
    {
        $structures = Utils::serializeRequestContent($request)['structures'];
        if (count($structures)) {
            return $entityManager->createQuery('
                SELECT e
                FROM App\Entity\Employe e
                WHERE e.structure IN (:structures)
            ')->setParameter('structures', $structures)
                ->getResult();
        } else {
            throw new BadRequestHttpException("Vous devez selectionner au moins une structure!");
        }

    }

    /**
     * @Rest\Get(path="/{id}/membre-mutuelle-sante", name="employe_by_mutuellesante",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode = 200, serializerEnableMaxDepthChecks=true)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function findByMutuelleSante(MutuelleSante $mutuellesante)
    {
        $em = $this->getDoctrine()->getManager();
        $employes = $em->getRepository(Employe::class)
            ->findByMutuelleSante($mutuellesante);

        return $employes;
    }

    /**
     * @Rest\Post(path="/charger-employe/{id}", name="charger_employe_by_type_employe", requirements = {"id"="\d+"})
     * @Rest\View(StatusCode = 200)
     */
    public function chargerEmployeByTypeEmploye(Request $request, TypeEmploye $typeEmploye)
    {
        $em = $this->getDoctrine()->getManager();
        $reqData = Utils::getObjectFromRequest($request);
        foreach ($reqData as $rowEmploye) {
            $employe = new Employe();
            $form = $this->createForm(EmployeType::class, $employe);
            $form->submit((array)$rowEmploye);
            if (!isset($rowEmploye->cni) || $rowEmploye->cni == NULL) {
                throw $this->createNotFoundException("L'ajout échoué pour l'employé " . $rowEmploye->prenoms . " " . $rowEmploye->nom . ", le CNI est obligatoire.");
            }

            $employes = $em->createQuery('SELECT e
                    FROM App\Entity\Employe e
                    WHERE e.cni = :cni')
                ->setParameter('cni', $rowEmploye->cni)
                ->getResult();
            if (count($employes) > 0) {
                throw $this->createNotFoundException("Ajout échoué pour l'employé " . $employe->getPrenoms() . " " . $employe->getNom() . ", CNI " . $employe->getCni() . ".");
            } else {
                $employe->setTypeEmploye($typeEmploye);
                if (isset($rowEmploye->dateNaissance)) {
                    $employe->setDateNaissance(new \DateTime($rowEmploye->dateNaissance));
                }
                if (isset($rowEmploye->dateRecrutement)) {
                    $employe->setDateRecrutement(new \DateTime($rowEmploye->dateRecrutement));
                }
                if (isset($rowEmploye->dateSortie)) {
                    $employe->setDateSortie(new \DateTime($rowEmploye->dateSortie));
                }
                if (isset($rowEmploye->datePriseService)) {
                    $employe->setDatePriseService(new \DateTime($rowEmploye->datePriseService));
                }
                $em->persist($employe);
            }

        }

        try {
<<<<<<< HEAD
            return $em->flush();
        } catch (\Exception $e) {
            throw $this->createNotFoundException("Il y'a une duplication au niveaau des CNI merci!");
=======
           return $em->flush();
        }   
        catch(\Doctrine\DBAL\Exception\UniqueConstraintViolationException $e){
            throw $this->createNotFoundException("Il y'a une duplication au niveaau des CNI merci!"); 
>>>>>>> f2ca4c3700541e0053d63cd013dbe35cf00d6864
        }

    }
}
