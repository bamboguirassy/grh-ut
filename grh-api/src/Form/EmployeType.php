<?php

namespace App\Form;

use App\Entity\Employe;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EmployeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('prenoms')
            ->add('nom')
            ->add('dateNaissance')
            ->add('lieuNaissance')
            ->add('cni')
            ->add('matricule')
            ->add('matriculeCaisseSociale')
            ->add('dateRecrutement')
            ->add('situtationMatrimoniale')
            ->add('retraite')
            ->add('genre')
            ->add('etat')
            ->add('emailUniv')
            ->add('email')
            ->add('filename')
            ->add('filepath')
            ->add('telephonePrimaire')
            ->add('telephoneSecondaire')
            ->add('caisseSociale')
            ->add('grade')
            ->add('mutuelleSante')
            ->add('nationalite')
            ->add('typeEmploye')
            ->add('datePriseService')
            ->add('dateSortie')
            ->add('motifSortie')
            ->add('numeroMainOeuvre')
            ->add('structure')
            ->add('numeroAffiliationIpres')
            ->add('profession')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Employe::class,
        ]);
    }
}
