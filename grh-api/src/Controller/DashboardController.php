<?php

namespace App\Controller;

use App\Entity\CaisseSociale;
use App\Entity\Employe;
use App\Entity\Grade;
use App\Entity\Diplome;
use App\Entity\TypeEmploye;
use App\Entity\Contrat;
use App\Utils\Utils;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\NonUniqueResultException;
use Doctrine\ORM\NoResultException;
use FOS\RestBundle\Controller\Annotations as Rest;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;



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
        $nombreEmployes = 0;
        foreach ($types as $type) {
            $employes = $em->getRepository(Employe::class)
                ->findByTypeEmploye($type);
            $tab[] = [
                'type' => $type,
                'nbreEmploye' => count($employes),

            ];
            $nombreEmployes += count($employes);
        }
        $tab[] = [
            'type' => ['code' => 'Nombre total employés'],
            'nbreEmploye' => $nombreEmployes
        ];
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
        foreach (range(1, 4) as $i) {
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
        $tab[] = [
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
        foreach (range(1, 4) as $i) {
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
    public function countEmployeByGrade(Request $request, EntityManagerInterface $entityManager)
    {
        $grades = $entityManager->createQuery('
            SELECT g
            FROM App\Entity\Grade g
            WHERE g IN (
                    SELECT eg
                    FROM App\Entity\Employe e
                    JOIN e.indice eg
            )           
        ')->getResult();
        $tab = [];
        foreach ($grades as $grade) {
            $employes = $entityManager->getRepository(Employe::class)
                ->findByIndice($grade);
            $tab[] = [
                'grade' => $grade,
                'nombreEmploye' => count($employes)
            ];
        }
        return $tab;
    }

    /**
     * @Rest\Get(path="/employe/count-employe-by-seniority", name="statistic_count_employe_by_seniority")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     * @throws \Exception
     */
    public function getSeniorityStats(Request $request, EntityManagerInterface $entityManager)
    {
        $typeEmployes = $entityManager->getRepository(TypeEmploye::class)->findAll();
        $borneSup = 25;
        $tab = [];
        for ($anciennete = 0; $anciennete < $borneSup; $anciennete += 5) {
            $ancienneteSuivant = $anciennete + 5;
            $label = "{$anciennete} à {$ancienneteSuivant} ans";
            $categories = [];
            foreach ($typeEmployes as $typeEmploye) {
                $count = $entityManager->createQuery('
                    SELECT COUNT(e)
                    FROM App\Entity\Employe e
                    JOIN e.typeEmploye te
                    WHERE ((DATE_DIFF(CURRENT_DATE(), e.dateRecrutement)) / 365) >= :anciennete 
                        AND ((DATE_DIFF(CURRENT_DATE(), e.dateRecrutement)) / 365) < :ancienneteSuivant
                        AND te = :typeEmploye
                ')->setParameters(['anciennete' => $anciennete, 'ancienneteSuivant' => ($anciennete + 5), 'typeEmploye' => $typeEmploye])
                    ->getSingleScalarResult();
                $categories[] = [
                    "typeEmploye" => $typeEmploye,
                    "nombreEmploye" => $count
                ];
            }
            $tab[] = [
                'anciennete' => $label,
                'categories' => $categories
            ];
        }
        $label = "25 ans et +";
        $categories = [];
        foreach ($typeEmployes as $typeEmploye) {
            $count = $entityManager->createQuery('
                    SELECT COUNT(e)
                    FROM App\Entity\Employe e
                    JOIN e.typeEmploye te
                    WHERE ((DATE_DIFF(CURRENT_DATE(), e.dateRecrutement)) / 365) >= 25
                        AND te = :typeEmploye
                ')->setParameters(['typeEmploye' => $typeEmploye])
                ->getSingleScalarResult();
            $categories[] = [
                "typeEmploye" => $typeEmploye,
                "nombreEmploye" => $count
            ];
        }

        $tab[] = [
            'anciennete' => $label,
            'categories' => $categories
        ];

        return $tab;
    }
    
     /**
     * @Rest\Get(path="/employe/count-age-by-type-employe/{id}", name="statistic_count_employe_by_genres")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeGroupeAgeByGenres(TypeEmploye $typeEmploye,EntityManagerInterface $em)
    {
        $borneSup = 55;
        $tab = [];
        for ($age = 20; $age < $borneSup; $age += 5) {
            $ageSuivant = $age + 5;
            $label = "{$age} à {$ageSuivant} ans";
            $nombreEmployeHomme = $em->createQuery('select count(e) from 
            App\Entity\Employe e JOIN e.typeEmploye te
                    WHERE ((DATE_DIFF(CURRENT_DATE(), e.dateNaissance)) / 365) >= :age 
                        AND ((DATE_DIFF(CURRENT_DATE(), e.dateNaissance)) / 365) < :ageSuivant
                        AND te = :typeEmploye AND e.genre= :genre')
                ->setParameter('age', $age)
                ->setParameter('ageSuivant', ($age + 5))
                ->setParameter('typeEmploye', $typeEmploye)
                ->setParameter('genre', 'Masculin')
                ->getSingleScalarResult();
            $nombreEmployeFemme = $em->createQuery('select count(e) from 
            App\Entity\Employe e JOIN e.typeEmploye te
                    WHERE ((DATE_DIFF(CURRENT_DATE(), e.dateNaissance)) / 365) >= :age 
                        AND ((DATE_DIFF(CURRENT_DATE(), e.dateNaissance)) / 365) < :ageSuivant
                        AND te = :typeEmploye AND e.genre= :genre')
                ->setParameter('age', $age)
                ->setParameter('ageSuivant', ($age + 5))
                ->setParameter('typeEmploye', $typeEmploye)
                ->setParameter('genre', 'Féminin')
                ->getSingleScalarResult();
            
                $tab[] = [
                    'age' => $label,
                    'nombreEmployeHomme' => $nombreEmployeHomme,
                    'nombreEmployeFemme' => $nombreEmployeFemme
                ];
        
        }
        $label = "55 ans et +";
        $nombreEmployeHomme = $em->createQuery('select count(e) from 
            App\Entity\Employe e JOIN e.typeEmploye te
                    WHERE ((DATE_DIFF(CURRENT_DATE(), e.dateNaissance)) / 365) > 55 
                        AND te = :typeEmploye AND e.genre= :genre')
                ->setParameter('typeEmploye', $typeEmploye)
                ->setParameter('genre', 'Masculin')
                ->getSingleScalarResult();
            $nombreEmployeFemme = $em->createQuery('select count(e) from 
            App\Entity\Employe e JOIN e.typeEmploye te
                    WHERE ((DATE_DIFF(CURRENT_DATE(), e.dateNaissance)) / 365) > 55 
                        AND te = :typeEmploye AND e.genre= :genre')
                ->setParameter('typeEmploye', $typeEmploye)
                ->setParameter('genre', 'Féminin')
                ->getSingleScalarResult();
            $tab[] = [
                    'age' => $label,
                    'nombreEmployeHomme' => $nombreEmployeHomme,
                    'nombreEmployeFemme' => $nombreEmployeFemme
                ];
            
        return $tab;
    }

    /**
     * @Rest\Get(path="/employe/suivi-recrutement-genre", name="statistic_by_genre")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function calculateRecrutementGroupedByGenres(Request $request)
    {
        /** @var EntityManagerInterface $em */
        $em = $this->getDoctrine()->getManager();
        $anneeCourante = date("Y");
        $annees = [$anneeCourante];
        $tabRecrutement = [];
        foreach (range(1, 4) as $i) {
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
     * @Rest\Get(path="/employe/count-by-profession/", name="employe_count_statistic_by_profession")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByProfession(): array
    {
        $em = $this->getDoctrine()->getManager();
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
            $nombreEmployeHomme = $em->createQuery('select count(e) from 
            App\Entity\Employe e where e.profession=?1 and e.genre=?2')
                ->setParameter(1, $profession)
                ->setParameter(2, 'Masculin')
                ->getSingleScalarResult();
            $nombreEmployeFemme = $em->createQuery('select count(e) from 
            App\Entity\Employe e where e.profession=?1 and e.genre=?2')
                ->setParameter(1, $profession)
                ->setParameter(2, 'Féminin')
                ->getSingleScalarResult();
            $tab[] = [
                'profession' => $profession,
                'nbrHomme' => $nombreEmployeHomme,
                'nbrFemme' => $nombreEmployeFemme,
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
        foreach ($typeEmployes as $typeEmploye) {
            $nbrHomme = 0;
            $nbrFemme = 0;
            $employes = $em->getRepository(Employe::class)
                ->findByTypeEmploye($typeEmploye);
            foreach ($employes as $employe) {
                if (strtolower($employe->getGenre()) === 'masculin')
                    $nbrHomme++;
                else
                    $nbrFemme++;
            }
            $tab[] = [
                'typeEmploye' => $typeEmploye,
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
            $nombreEmployeHomme = $em->createQuery('select count(e) from 
            App\Entity\Employe e where e.structure=?1 and e.genre=?2')
                ->setParameter(1, $structure)
                ->setParameter(2, 'Masculin')
                ->getSingleScalarResult();
            $nombreEmployeFemme = $em->createQuery('select count(e) from 
            App\Entity\Employe e where e.structure=?1 and e.genre=?2')
                ->setParameter(1, $structure)
                ->setParameter(2, 'Féminin')
                ->getSingleScalarResult();
            $tab[] = [
                'structure' => $structure,
                'nbrHomme' => $nombreEmployeHomme,
                'nbrFemme' => $nombreEmployeFemme
            ];
        }

        return count($tab) ? $tab : [];
    }

    /**
     * @Rest\Get(path="/employe/count-by-entree-sortie", name="statistic_count_employe_by_entree_sortie")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByEntreeSortie(Request $request, EntityManagerInterface $entityManager)
    {
        $anneeCourante = date("Y");
        $annees = [$anneeCourante];
        foreach (range(1, 6) as $i) {
            $annees[] = date("Y", strtotime("-{$i} year"));
        }
        $tab = [];
        $em = $this->getDoctrine()->getManager();
        foreach ($annees as $annee) {
            //            $nombreRecrutement = $em->createQuery('select count(e) 
            //            from App\Entity\Employe e where e.dateRecrutement like ?1')
            //                ->setParameter(1, $annee . '%')
            //                ->getSingleScalarResult();
            //            $nombreSortie = $em->createQuery('select count(e) 
            //                from App\Entity\Employe e where e.dateSortie like ?1')
            //                    ->setParameter(1, $annee . '%')
            //                    ->getSingleScalarResult();
            $nombreDemission = $em->createQuery('select count(e)
            from App\Entity\Employe e where e.dateSortie like ?1
            and e.motifSortie=?2')
                ->setParameter(1, $annee . '%')
                ->setParameter(2, 'Démission')
                ->getSingleScalarResult();
            $nombreDepartRetraite = $em->createQuery('select count(e)
            from App\Entity\Employe e where e.dateSortie like ?1
            and e.motifSortie in (?2)')
                ->setParameter(1, $annee . '%')
                ->setParameter(2, ['Retraite', 'Retraite Anticipé'])
                ->getSingleScalarResult();
            $nombreMisAPied = $em->createQuery('select count(e)
            from App\Entity\Employe e where e.dateSortie like ?1
            and e.motifSortie=?2')
                ->setParameter(1, $annee . '%')
                ->setParameter(2, 'Mis à pied')
                ->getSingleScalarResult();
            $nombreExpirationContrat = $em->createQuery('select count(e)
            from App\Entity\Employe e where e.dateSortie like ?1
            and e.motifSortie=?2')
                ->setParameter(1, $annee . '%')
                ->setParameter(2, 'Expiration Contrat')
                ->getSingleScalarResult();
            $tab[] = [
                'annee' => $annee, 'nombreDemission' => $nombreDemission,
                'nombreDepartRetraite' => $nombreDepartRetraite,
                'nombreMisAPied' => $nombreMisAPied,
                'nombreExpirationContrat' => $nombreExpirationContrat
            ];
        }
        return $tab;
    }

    /**
     * @Rest\Get(path="/employe/count-demission-structure-annee", name="statistic_count_demission_employe_by_annee_structure")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countDemissionEmployeByStructureAnnee(Request $request, EntityManagerInterface $entityManager)
    {
        $anneeCourante = date("Y");
        $annees = [$anneeCourante];
        foreach (range(1, 4) as $i) {
            $annees[] = date("Y", strtotime("-{$i} year"));
        }
        $em = $this->getDoctrine()->getManager();
        $structures = $em->createQuery('select s from 
		App\Entity\Structure s where (select count(e)
		 from App\Entity\Employe e where e.structure=s and e.motifSortie=?1)>0')
            ->setParameter(1, 'Démission')
            ->getResult();

        foreach ($annees as $annee) {
            $tabDemission = [];
            foreach ($structures as $structure) {
                $nombreDemission = $em->createQuery('select count(e) 
				from App\Entity\Employe e where e.dateSortie like ?1 and e.structure=?2
				and e.motifSortie=?3')
                    ->setParameter(1, $annee . '%')
                    ->setParameter(2, $structure)
                    ->setParameter(3, 'Démission')
                    ->getSingleScalarResult();
                $tabDemission[] = $nombreDemission;
            }
            $tabAnnee[] = ['annee' => $annee, 'data' => $tabDemission];
        }
        return ['structures' => $structures, 'anneeData' => $tabAnnee];
    }

    /**
     * @Rest\Get(path="/employe/count-demission-profession-annee", name="statistic_count_demission_employe_by_annee_profession")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countDemissionEmployeByProfessionAnnee(Request $request, EntityManagerInterface $entityManager)
    {
        $anneeCourante = date("Y");
        $annees = [$anneeCourante];
        foreach (range(1, 4) as $i) {
            $annees[] = date("Y", strtotime("-{$i} year"));
        }
        $em = $this->getDoctrine()->getManager();
        $professions = $em->createQuery('select p from 
		App\Entity\Profession p where (select count(e)
		 from App\Entity\Employe e where e.profession=p and e.motifSortie=?1)>0')
            ->setParameter(1, 'Démission')
            ->getResult();

        foreach ($annees as $annee) {
            $tabDemission = [];
            foreach ($professions as $profession) {
                $nombreDemission = $em->createQuery('select count(e) 
				from App\Entity\Employe e where e.dateSortie like ?1 and e.profession=?2
				and e.motifSortie=?3')
                    ->setParameter(1, $annee . '%')
                    ->setParameter(2, $profession)
                    ->setParameter(3, 'Démission')
                    ->getSingleScalarResult();
                $tabDemission[] = $nombreDemission;
            }
            $tabAnnee[] = ['annee' => $annee, 'data' => $tabDemission];
        }
        return ['professions' => $professions, 'anneeData' => $tabAnnee];
    }

    /**
     * @Rest\Post(path="/employe/count-by-daterange/", name="employe_count_statistic_by_dattrange")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByDateRange(Request $request): array
    {
        $em = $this->getDoctrine()->getManager();
        //$dates = AppManager::getSerializedDataFromRequest($request);
        $dates = Utils::serializeRequestContent($request);
        $dateDebut = str_replace('/', '-', $dates['dateDebut']);
        $dateDebut = date('Y-m-d', strtotime($dateDebut));

        $dateFin = str_replace('/', '-', $dates['dateFin']);
        $dateFin = date('Y-m-d', strtotime($dateFin));
        $typeEmployes = $em->createQuery('
            SELECT t
            FROM App\Entity\TypeEmploye t
            WHERE t IN (SELECT te
            FROM App\Entity\Employe e JOIN e.typeEmploye te
            )
        ')
            ->getResult();
        $tab = [];
        foreach ($typeEmployes as $typeEmploye) {
            $nombreEmployeHomme = $em->createQuery('select count(e) from 
            App\Entity\Employe e where e.typeEmploye=?1 and e.genre=?2 and e.dateRecrutement>=?3 
            and e.dateRecrutement<=?4')
                ->setParameter(1, $typeEmploye)
                ->setParameter(2, 'Masculin')
                ->setParameter(3, $dateDebut)
                ->setParameter(4, $dateFin)
                ->getSingleScalarResult();

            $nombreEmployeFemme = $em->createQuery('select count(e) from 
            App\Entity\Employe e where e.typeEmploye=?1 and e.genre=?2 and e.dateRecrutement>=?3 
            and e.dateRecrutement<=?4')
                ->setParameter(1, $typeEmploye)
                ->setParameter(2, 'Féminin')
                ->setParameter(3, $dateDebut)
                ->setParameter(4, $dateFin)
                ->getSingleScalarResult();
            $tab[] = [
                'typeEmploye' => $typeEmploye,
                'nbrHomme' => $nombreEmployeHomme,
                'nbrFemme' => $nombreEmployeFemme
            ];
        }

        return count($tab) ? $tab : [];
    }

    /**
     * @Rest\Post(path="/employe/count-by-period", name="employe_count_statistic_by_period")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByPeriod(Request $request): array
    {
        $em = $this->getDoctrine()->getManager();
        $dates = Utils::serializeRequestContent($request);
        $date = str_replace('/', '-', $dates['date']);
        $date = date('Y-m-d', strtotime($date));

        $typeEmployes = $em->createQuery('
            SELECT t
            FROM App\Entity\TypeEmploye t
            WHERE t IN (SELECT te
            FROM App\Entity\Employe e JOIN e.typeEmploye te
            )
        ')
            ->getResult();
        $tab = [];
        foreach ($typeEmployes as $typeEmploye) {
            $nombreEmployeHomme = $em->createQuery('select count(e) from 
            App\Entity\Employe e where e.typeEmploye=?1 and e.genre=?2 and e.dateRecrutement<=?3')
                ->setParameter(1, $typeEmploye)
                ->setParameter(2, 'Masculin')
                ->setParameter(3, $date)
                ->getSingleScalarResult();

            $nombreEmployeFemme = $em->createQuery('select count(e) from 
            App\Entity\Employe e where e.typeEmploye=?1 and e.genre=?2 and e.dateRecrutement>=?3')
                ->setParameter(1, $typeEmploye)
                ->setParameter(2, 'Féminin')
                ->setParameter(3, $date)
                ->getSingleScalarResult();
            $tab[] = [
                'typeEmploye' => $typeEmploye,
                'nbrHomme' => $nombreEmployeHomme,
                'nbrFemme' => $nombreEmployeFemme
            ];
        }

        return count($tab) ? $tab : [];
    }


    /**
     * @Rest\Get(path="/employe/count-by-typecontrat", name="employe_count_statistic_by_type_contrat")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */

    public function countEmployeByContratGroupByTypeContrat(EntityManagerInterface $entityManager)
    {
        $em = $this->getDoctrine()->getManager();

        $typeContrats = $em->createQuery('Select tc FROM App\Entity\TypeContrat tc '
            . 'WHERE tc IN (SELECT tyc FROM App\Entity\Contrat c JOIN c.typeContrat tyc ) ')
            ->getResult();
        $tab = [];
        foreach ($typeContrats as $typeContrat) {
            $employes = $em->createQuery('SELECT count(e) FROM App\Entity\Employe e '
                . 'WHERE e IN(select ec FROM App\Entity\Contrat c JOIN c.employe ec where c.typeContrat=:typeContrat) 
                        ')
                ->setParameter('typeContrat', $typeContrat)
                ->getSingleScalarResult();

            $tab[] = [
                'typeContrat' => $typeContrat,
                'nbreEmploye' => $employes
            ];
        }
        return count($tab) ? $tab : [];
    }

    /**
     * @Rest\Get(path="/employe/count-by-typecontrat-actif", name="employe_count_statistic_by_type_contrat_actif")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
    public function countEmployeByContratGroupByTypeContratActif()
    {
        $em = $this->getDoctrine()->getManager();
        $typeContrats = $em->createQuery('Select tc FROM App\Entity\TypeContrat tc '
            . 'WHERE tc IN (SELECT tyc FROM App\Entity\Contrat c JOIN c.typeContrat tyc ) ')
            ->getResult();
        $tab = [];
        foreach ($typeContrats as $typeContrat) {
           
            $employes = $em->createQuery('SELECT count(e) FROM App\Entity\Employe e '
                . 'WHERE e IN(select ec FROM App\Entity\Contrat c JOIN 
                          c.employe ec where c.typeContrat=?1 and c.etat=?2) 
                        ')
                ->setParameter(1, $typeContrat)
                ->setParameter(2, true)
                ->getSingleScalarResult();
            $tab[] = [
                'typeContrat' => $typeContrat,
                'nbreEmploye' => $employes
            ];
        }
        return count($tab) ? $tab : [];
    }

    /**
     * @Rest\Get(path="/employe/count-by-diplome", name="employe_count_statistic_by_diplome")
     * @Rest\View(StatusCode = 200)
     */
    public function countEmployeByDiplome()
    {
        $em = $this->getDoctrine()->getManager();
        $diplomes = $em->getRepository(Diplome::class)
            ->findAll();
        $tab = [];
        foreach ($diplomes as $diplome) {
            $nbreEmploye = $em->createQuery('SELECT count(e) FROM App\Entity\Employe e '
                . 'WHERE e IN(select emp FROM App\Entity\DiplomeEmploye de 
                          JOIN de.diplome dip 
                          JOIN de.employe emp 
                          where dip =?1) 
                        ')
                ->setParameter(1, $diplome)
                ->getSingleScalarResult();

            $tab[] = [
                'diplome' => $diplome,
                'nbreEmploye' => $nbreEmploye
            ];
        }
        $nbreSansDiplome = $em->createQuery('SELECT count(e) FROM App\Entity\Employe e '
            . 'WHERE e NOT IN(select emp FROM App\Entity\DiplomeEmploye de 
                          JOIN de.employe emp where emp = e) 
                        ')
            ->getSingleScalarResult();
        $tab[] = [
            'diplome' => ['nom' => 'Sans Diplôme'],
            'nbreEmploye' => $nbreSansDiplome
        ];
        return $tab;
    }
     /**
     * @Rest\Get(path="/employe/count-pers-by-grade", name="pers_count_statistic_by_grade")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_EMPLOYE_INDEX")
     */
     public function countPersByGradeGroupByGenre():array {
        $em = $this->getDoctrine()->getManager();
        
       $typeEmploye = $em->getRepository(TypeEmploye::class)->findOneByCode('PER');
       
       $grades = $em->createQuery('SELECT DISTINCT e.grade FROM App\Entity\Employe e '
                . 'where e.grade is NOT NULL and e.typeEmploye=?1 ')
                ->setParameter(1,$typeEmploye)
                ->getResult();
        
    
     $tab = [];
     foreach ($grades as $grade){
       $nbrHomme = $em->createQuery('
            SELECT count(e)
            FROM App\Entity\Employe e
            WHERE e.typeEmploye=?1 and e.grade=?2 and e.genre=?3')
            ->setParameter(1, $typeEmploye)
            ->setParameter(2,$grade)
            ->setParameter(3,'Masculin')
            ->getSingleScalarResult();
       $nbrFemme = $em->createQuery('
            SELECT count(e)
            FROM App\Entity\Employe e
            WHERE e.typeEmploye=?1 and e.grade=?2 and e.genre=?3')
            ->setParameter(1, $typeEmploye)
            ->setParameter(2,$grade)
            ->setParameter(3,'Féminin')
            ->getSingleScalarResult();

       $tab[] = [
                'grade' => $grade,
                'nbrHomme' => $nbrHomme,
               'nbrFemme' => $nbrFemme
            ];
        }


        return $tab;
          
  }
       
       
  
    

    
       
       
         
                
                
      
        
    
    
    
}
