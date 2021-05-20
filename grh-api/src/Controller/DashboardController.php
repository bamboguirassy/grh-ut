<?php

namespace App\Controller;

use App\Entity\CaisseSociale;
use App\Entity\Employe;
use App\Entity\Grade;
use App\Entity\TypeEmploye;
use App\Utils\Utils;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\NonUniqueResultException;
use Doctrine\ORM\NoResultException;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;

/**
 * @Route("/api/statistics")
 */
class DashboardController extends AbstractController
{
    /**
     * @Rest\Get(path="/employe/count-by-type/", name="employe_count_statistic_by_type")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByType(): array
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
     * @Rest\Post(path="/employe/by-type", name="employe_statistic_by_type")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function findStatsEmployeByType(Request $request): array
    {
        /** @var EntityManagerInterface $em */
        $em = $this->getDoctrine()->getManager();
        $typeEmployeIds = Utils::serializeRequestContent($request)['typeEmployes'];
        $tab = [];
        $tabCaisse = [];
        $tabRecrutement = [];
        $nbrHomme = 0;
        $nbrFemme = 0;
        $tranche1830 = 0;
        $tranche3040 = 0;
        $tranche4050 = 0;
        $tranche5060 = 0;
        $tranche60Plus = 0;
        $anneeCourante = date("Y");
        $annees = [$anneeCourante];
        foreach (range(1,4) as $i) {
            $annees[] = date("Y", strtotime("-{$i} year"));
        }
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

        foreach ($annees as $annee) {
            /** @var int $nombreEmployeH nombre de recrutement homme */
            try {
                $nombreRecrutementH = $em->createQuery('
                    SELECT COUNT(e)
                    FROM App\Entity\Employe e
                    WHERE e.typeEmploye IN (:te)
                        AND e.dateRecrutement LIKE :dr
                        AND e.genre = :genre
                ')->setParameters([
                    'dr' => '%' . $annee . '%',
                    'te' => $typeEmployes,
                    'genre' => 'Masculin'
                ])->getSingleScalarResult();
            } catch (NoResultException $e) {
                $nombreRecrutementH = 0;
            } catch (NonUniqueResultException $e) {
                $nombreRecrutementH = 0;
            }

            try {
                /** @var int $nombreRecrutementF nombre de recrutement femme */
                $nombreRecrutementF = $em->createQuery('
                    SELECT COUNT(e)
                    FROM App\Entity\Employe e
                    WHERE e.typeEmploye IN (:te)
                        AND e.dateRecrutement LIKE :dr
                        AND e.genre = :genre
                ')->setParameters([
                    'dr' => '%' . $annee . '%',
                    'te' => $typeEmployes,
                    'genre' => 'Féminin'
                ])->getSingleScalarResult();
            } catch (NoResultException $e) {
                $nombreRecrutementF = 0;
            } catch (NonUniqueResultException $e) {
                $nombreRecrutementF = 0;
            }

            $tabRecrutement[] = [
                "annee" => $annee,
                "nombreRecrutementHomme" => $nombreRecrutementH,
                "nombreRecrutementFemme" => $nombreRecrutementF
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
            'anneePrec' => $annees,
            'recrutement' => $tabRecrutement
//            'recrutementCourant' => $tabRecrutementCourant,
//            'recrutementPrecedent' => $tabRecrutementPrecedent
        ];


        return count($tab) ? $tab : [];
    }

    /**
     * @Rest\Get(path="/employe/suivi-recrutement-type", name="statistic_employe_suivi_recrutement_type")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function calculateStatsEmployeSuiviRecrutementGroupedByType(Request $request)
    {
        /** @var EntityManagerInterface $em */
        $em = $this->getDoctrine()->getManager();
        $anneeCourante = date("Y");
        $typeEmployes = $em->getRepository(TypeEmploye::class)->findAll();
        $annees = [$anneeCourante];
        $tabRecrutement = [];
        foreach (range(1,4) as $i) {
            $annees[] = date("Y", strtotime("-{$i} year"));
        }
        foreach ($annees as $annee) {
            $tabNombres = [];
            /** @var TypeEmploye $typeEmploye */
            foreach ($typeEmployes as $typeEmploye) {
                try {
                    $nombreRecrutement = $em->createQuery('
                    SELECT COUNT(e)
                    FROM App\Entity\Employe e
                    WHERE e.typeEmploye = :te
                        AND e.dateRecrutement LIKE :dr
                ')->setParameters([
                        'dr' => '%' . $annee . '%',
                        'te' => $typeEmploye,
                    ])->getSingleScalarResult();
                } catch (NoResultException $e) {
                    $nombreRecrutement = 0;
                } catch (NonUniqueResultException $e) {
                    $nombreRecrutement = 0;
                }
                $tabNombres[] = [
                    'typeEmployeLabel' => $typeEmploye->getNom(),
                    'typeEmployeCode' => $typeEmploye->getCode(),
                    'nombreRecrutement' => $nombreRecrutement
                ];
            }
            $tabRecrutement[] = [
                "annee" => $annee,
                "recrutements" => $tabNombres
            ];
        }

        return count($tabRecrutement) ? $tabRecrutement : [];

    }

    /**
     * @Rest\Get(path="/employe/count-by-grade", name="statistic_count_employe_by_grade")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByGrade(Request $request, EntityManagerInterface $entityManager) {
        $grades = $entityManager->getRepository(Grade::class)->findAll();
        $tab = [];
        foreach ($grades as $grade) {
            $employes = $entityManager->getRepository(Employe::class)
                ->findByGrade($grade);
            $tab [] = [
                'grade' => $grade,
                'nombreEmploye' => count($employes)
            ];
        }
        return $tab;
    }

    /**
     * @Rest\Get(path="/employe/suivi-recrutement-genre", name="statistic_by_genre")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function calculateRecrutementGroupedByGenres(Request $request){
        /** @var EntityManagerInterface $em */
        $em = $this->getDoctrine()->getManager();
        $anneeCourante = date("Y");
        $annees = [$anneeCourante];
        $tabRecrutement = [];
        foreach (range(1,4) as $i) {
            $annees[] = date("Y", strtotime("-{$i} year"));
        }

        foreach ($annees as $annee) {
            /** @var int $nombreEmployeH nombre de recrutement homme */
            try {
                $nombreRecrutementH = $em->createQuery('
                    SELECT COUNT(e)
                    FROM App\Entity\Employe e
                    WHERE e.dateRecrutement LIKE :dr
                        AND e.genre = :genre
                ')->setParameters([
                    'dr' => '%' . $annee . '%',
                    'genre' => 'Masculin'
                ])->getSingleScalarResult();
            } catch (NoResultException $e) {
                $nombreRecrutementH = 0;
            } catch (NonUniqueResultException $e) {
                $nombreRecrutementH = 0;
            }
            try {
                /** @var int $nombreRecrutementF nombre de recrutement femme */
                $nombreRecrutementF = $em->createQuery('
                    SELECT COUNT(e)
                    FROM App\Entity\Employe e
                    WHERE e.dateRecrutement LIKE :dr
                        AND e.genre = :genre
                ')->setParameters([
                    'dr' => '%' . $annee . '%',
                    'genre' => 'Féminin'
                ])->getSingleScalarResult();
            } catch (NoResultException $e) {
                $nombreRecrutementF = 0;
            } catch (NonUniqueResultException $e) {
                $nombreRecrutementF = 0;
            }
            $tabRecrutement[] = [
                "annee" => $annee,
                "nombreRecrutementHomme" => $nombreRecrutementH,
                "nombreRecrutementFemme" => $nombreRecrutementF
            ];
        }
        return count($tabRecrutement) ? $tabRecrutement : [];
    }
    
    
     /**
     * @Rest\Get(path="/employe/count-by-typecontrat/", name="employe_count_statistic_by_typecontrat")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
      * 
     */
    public function countEmployeBy(): array{
        $em = $this->getDoctrine()->getManager();
        $typeContrats = $em->createQuery('SELECT tc FROM App\Entity\TypeContrat tc'
                . ' WHERE tc in(select c FROM App\Entity\Contrat c JOIN c.typeContrat)' )
              ->getResult();
         $tab = [];
      foreach($typeContrats as $typeContrat){
          $employes = $em->getRepository(Contrat::class)
                  ->findByEmploye($typeContrat);
                  $tab [] = [
                'typeContrat' =>$typeContrat,
                'nombreEmploye' => count($employes)
            ];            
      }
        
    }
    
    
    /**
     * @Rest\Get(path="/employe/count-by-profession/", name="employe_count_statistic_by_profession")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByProfession(): array
    {
        $em = $this->getDoctrine()->getManager();
//        $professions = $em->getRepository('App\Entity\Profession')
//            ->findByEmploye();
        $professions = $em->createQuery('
            SELECT p
            FROM App\Entity\Profession p
            WHERE p IN (SELECT pe
            FROM App\Entity\Employe e JOIN e.profession pe
            )
        ')
          ->getResult();
        $tab = [];
        foreach ($professions as $profession) {
            $nbrHomme = 0;
            $nbrFemme = 0;
            $employes = $em->getRepository(Employe::class)
                ->findByProfession($profession);
            foreach ($employes as $employe){
                if (strtolower($employe->getGenre()) === 'masculin')
                    $nbrHomme++;
                else
                    $nbrFemme++;
            }
            $tab [] = [
                'profession' => $profession,
                'nbreEmploye' => count($employes),
                'nbrHomme' => $nbrHomme,
                'nbrFemme' => $nbrFemme,
            ];
        }


        return count($tab) ? $tab : [];
    }
    
    /**
     * @Rest\Get(path="/employe/count-by-typeemploye/", name="employe_count_statistic_by_type_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByTypeEmploye(): array
    {
        $em = $this->getDoctrine()->getManager();
        
        $typeEmployes = $em->createQuery('
            SELECT te
            FROM App\Entity\TypeEmploye te
            WHERE te IN (SELECT t
            FROM App\Entity\Employe e JOIN e.typeEmploye t
            )
        ')
          ->getResult();
        $tab = [];
        foreach ( $typeEmployes as $typeEmploye) {
            $nbrHomme = 0;
            $nbrFemme = 0;
            $employes = $em->getRepository(Employe::class)
                ->findByTypeEmploye($typeEmploye);
            foreach ($employes as $employe){
                if (strtolower($employe->getGenre()) === 'masculin')
                    $nbrHomme++;
                else
                    $nbrFemme++;
            }
            $tab [] = [
                'typeEmploye' => $typeEmploye,
                'nbreEmploye' => count($employes),
                'nbrHomme' => $nbrHomme,
                'nbrFemme' => $nbrFemme
            ];
        }


        return count($tab) ? $tab : [];
    }
    
     /**
     * @Rest\Get(path="/employe/count-by-structure/", name="employe_count_statistic_by_structure")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByStructure(): array
    {
        $em = $this->getDoctrine()->getManager();
        
        $structures = $em->createQuery('
            SELECT s
            FROM App\Entity\Structure s
            WHERE s IN (SELECT se
            FROM App\Entity\Employe e JOIN e.structure se
            )
        ')
          ->getResult();
        $tab = [];
        foreach ($structures as $structure) {
            $nbrHomme = 0;
            $nbrFemme = 0;
            $employes = $em->getRepository(Employe::class)
                ->findByStructure($structure);
            foreach ($employes as $employe){
                if (strtolower($employe->getGenre()) === 'masculin')
                    $nbrHomme++;
                else
                    $nbrFemme++;
            }
            $tab [] = [
                'structure' => $structure,
                'nbreEmploye' => count($employes),
                'nbrHomme' => $nbrHomme,
                'nbrFemme' => $nbrFemme
            ];
        }


        return count($tab) ? $tab : [];
    }
    
    
}
