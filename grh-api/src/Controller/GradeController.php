<?php

namespace App\Controller;

use App\Entity\GCategorie;
use App\Entity\GClasse;
use App\Entity\GNiveau;
use App\Entity\Grade;
use App\Entity\Employe;
use App\Form\GradeType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations as Rest;
use App\Utils\Utils;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/api/grade")
 */
class GradeController extends AbstractController
{
    /**
     * @Rest\Get(path="/", name="grade_index")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GRADE_INDEX")
     */
    public function index(): array
    {
        $grades = $this->getDoctrine()
            ->getRepository(Grade::class)
            ->findAll();

        return count($grades)?$grades:[];
    }
     /**
     * @Rest\Get(path="/{id}/typeemploye", name="grade_by_type_employe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GRADE_INDEX")
     */
    public function findGradeByTypeEmploye(\App\Entity\TypeEmploye $typeEmploye): array
    {
       $em= $this->getDoctrine()->getManager();
       $grades = $em->createQuery('select'
               . ' g FROM App\Entity\Grade g '
               . 'JOIN g.classe c WHERE c.typeEmploye=:typeEmploye ')
               ->setParameter('typeEmploye',$typeEmploye)
               ->getResult();
               
        return count($grades)?$grades:[];
    }

    /**
     * @Rest\Get(path="/map/{id}/classe", name="grade_map_classe")
     * @Rest\View(StatusCode = 200)
     * @IsGranted("ROLE_GRADE_INDEX")
     */
    public function mapByClasse(GClasse $classe): array
    {
        $categories = $classe->getCategories();
        $niveaux = $classe->getNiveaux();
        $tabNiveau = [];
        foreach($niveaux as $niveau) {
            $tabCategorie = [];
            foreach($categories as $categorie) {
                $grades = $this->getDoctrine()
            ->getRepository(Grade::class)
            ->findBy(['categorie'=>$categorie,'niveau'=>$niveau,'classe'=>$classe],['classification'=>'ASC']);
            $tabCategorie[] = ['categorie'=>$categorie,'grades'=>$grades];
            }
            $tabNiveau[] = ['niveau'=>$niveau,'tabCategorie'=>$tabCategorie];
        }
        $tabFinal = ['categories'=>$categories, 'tabNiveau'=>$tabNiveau];
        
        return count($tabNiveau)?$tabFinal:[];
    }

    /**
     * @Rest\Post(Path="/create-batch/{id}", name="grade_new_batch")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_CREATE")
     */
    public function createBatch(Request $request, GNiveau $niveau) {
        $reqData = Utils::getObjectFromRequest($request);
       $entityManager = $this->getDoctrine()->getManager();
       $categorie = $entityManager->getRepository(GCategorie::class)
       ->find($reqData->categorieId);
       $classe = $entityManager->getRepository(GClasse::class)
       ->find($reqData->selectedClasseId);
       $selectedEchelonIds = $reqData->selectedEchelonIds;
       $echelons = $entityManager->createQuery('select e from App\Entity\GEchelon e
        where e.id in (?1)')
        ->setParameter(1,$selectedEchelonIds)
        ->getResult();
        foreach($echelons as $echelon) {
            // check if element already rattchaed
            $grade = $entityManager->getRepository(Grade::class)
            ->findOneBy(['echelon'=>$echelon,'niveau'=>$niveau,
            'categorie'=>$categorie,'classe'=>$classe]);
            if($grade==NULL) {
               // créer le grade
               $grade = new Grade();
               $grade->setEchelon($echelon);
               $grade->setNiveau($niveau);
               $grade->setCategorie($categorie);
               $grade->setClasse($classe);
               $grade->setClassification($this->generateClassificationCode($grade));
               $entityManager->persist($grade);
            }
        }
        // trouver les grades précédement rattachés dont les echelonIds ne sont pas dans selectedEchelonIds
        $dropedGrades = $entityManager->createQuery('select g from App\Entity\Grade g 
        JOIN g.echelon e where g.niveau=?1 and g.classe=?2 and g.categorie=?3 and e.id not in (?4)')
        ->setParameter(1,$niveau)
        ->setParameter(2,$classe)
        ->setParameter(3,$categorie)
        ->setParameter(4,$selectedEchelonIds)
        ->getResult();
        foreach($dropedGrades as $dropedGrade) {
            $employes = $entityManager->getRepository(Employe::class)
                    ->findBy(['indice' => $dropedGrade]);
            if(count($employes)>0){
                throw $this->createNotFoundException("Attention le grade que vous voulez supprimer est rattaché à des employés !");
            }
            $entityManager->remove($dropedGrade);
        }
        // if echelons vide (signifie qu'on supprime tout)
        if(!$selectedEchelonIds) {
            // trouver les grades précédement rattachés dont les echelonIds ne sont pas dans selectedEchelonIds
            $dropedGrades = $entityManager->createQuery('select g from App\Entity\Grade g 
            JOIN g.echelon e where g.niveau=?1 and g.classe=?2 and g.categorie=?3')
            ->setParameter(1,$niveau)
            ->setParameter(2,$classe)
            ->setParameter(3,$categorie)
            ->getResult();
            foreach($dropedGrades as $dropedGrade) {
                $employes = $entityManager->getRepository(Employe::class)
                    ->findBy(['indice' => $dropedGrade]);
                if(count($employes)>0){
                    throw $this->createNotFoundException("Attention le grade que vous voulez supprimer est rattaché à des employés !");
                }
                $entityManager->remove($dropedGrade);
            }
        }
        $entityManager->flush();

            $grades = $this->getDoctrine()
        ->getRepository(Grade::class)
        ->findBy(['categorie'=>$categorie,'niveau'=>$niveau,'classe'=>$classe],['classification'=>'ASC']);

      return $grades;
    }

    /**
     * @Rest\Post(Path="/create", name="grade_new")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_CREATE")
     */
    public function create(Request $request): Grade    {
        $grade = new Grade();
        $form = $this->createForm(GradeType::class, $grade);
        $form->submit(Utils::serializeRequestContent($request));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($grade);
        $entityManager->flush();

        return $grade;
    }

    /**
     * @Rest\Get(path="/{id}", name="grade_show",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_SHOW")
     */
    public function show(Grade $grade): Grade    {
        return $grade;
    }

    
    /**
     * @Rest\Put(path="/{id}/edit", name="grade_edit",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_EDIT")
     */
    public function edit(Request $request, Grade $grade): Grade    {
        $form = $this->createForm(GradeType::class, $grade);
        $form->submit(Utils::serializeRequestContent($request));

        $this->getDoctrine()->getManager()->flush();

        return $grade;
    }
    
    /**
     * @Rest\Put(path="/{id}/clone", name="grade_clone",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_CLONE")
     */
    public function cloner(Request $request, Grade $grade):  Grade {
        $em=$this->getDoctrine()->getManager();
        $gradeNew=new Grade();
        $form = $this->createForm(GradeType::class, $gradeNew);
        $form->submit(Utils::serializeRequestContent($request));
        $em->persist($gradeNew);

        $em->flush();

        return $gradeNew;
    }

    /**
     * @Rest\Delete("/{id}", name="grade_delete",requirements = {"id"="\d+"})
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_EDIT")
     */
    public function delete(Grade $grade): Grade    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($grade);
        $entityManager->flush();

        return $grade;
    }
    
    /**
     * @Rest\Post("/delete-selection/", name="grade_selection_delete")
     * @Rest\View(StatusCode=200)
     * @IsGranted("ROLE_GRADE_DELETE")
     */
    public function deleteMultiple(Request $request): array {
        $entityManager = $this->getDoctrine()->getManager();
        $grades = Utils::getObjectFromRequest($request);
        if (!count($grades)) {
            throw $this->createNotFoundException("Selectionner au minimum un élément à supprimer.");
        }
        foreach ($grades as $grade) {
            $grade = $entityManager->getRepository(Grade::class)->find($grade->id);
            $entityManager->remove($grade);
        }
        $entityManager->flush();

        return $grades;
    }

    public function generateClassificationCode(Grade $grade) {
        return $grade->getClasse()->getIndice().$grade->getNiveau()->getIndice().$grade->getCategorie()->getIndice()
        .$grade->getEchelon()->getIndice();
    }
    
    
}