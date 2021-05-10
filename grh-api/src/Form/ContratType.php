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
            ->add('etat')
            ->add('dateRupture')
            ->add('motifRupture')
            ->add('expire')
            ->add('rompu')
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
