<?php

namespace App\Form;

use App\Entity\MembreSyndicat;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MembreSyndicatType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('dateEnregistrement')
            ->add('etat')
            ->add('employe')
            ->add('syndicat')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => MembreSyndicat::class,
        ]);
    }
}
