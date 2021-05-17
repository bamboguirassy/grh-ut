<?php

namespace App\Form;

use App\Entity\GClasse;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class GClasseType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nom')
            ->add('indice')
            ->add('ordre')
            ->add('suivant')
            ->add('typeEmploye')
            ->add('categories')
            ->add('niveaux')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => GClasse::class,
        ]);
    }
}
