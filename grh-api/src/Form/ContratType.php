<?php

namespace App\Form;

use App\Entity\Contrat;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContratType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('dureeEnMois')
            ->add('dateSignature')
            ->add('dateDebut')
            ->add('dateFinEffective')
            ->add('dateFinPrevue')
            ->add('motifFin')
            ->add('numero')
            ->add('commentaireSurFinContrat')
            ->add('etat')
            ->add('typeContrat')
            ->add('employe')
            ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Contrat::class,
        ]);
    }
}
