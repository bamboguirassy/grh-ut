<?php

namespace App\Form;

use App\Entity\Syndicat;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SyndicatType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nom')
            ->add('code')
            ->add('filename')
            ->add('filepath')
            ->add('montantCotisationMensuelle')
            ->add('typeEmploye')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Syndicat::class,
        ]);
    }
}
