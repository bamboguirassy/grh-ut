<?php

namespace App\Form;

use App\Entity\MembreCommission;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MembreCommissionType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('fonction')
            ->add('dateIntegration')
            ->add('statut')
            ->add('dateSortie')
            ->add('motifSortie')
            ->add('employe')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => MembreCommission::class,
        ]);
    }
}
