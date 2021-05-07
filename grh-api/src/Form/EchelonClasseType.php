<?php

namespace App\Form;

use App\Entity\EchelonClasse;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EchelonClasseType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('indice')
            ->add('echelon')
            ->add('niveau')
            ->add('categorie')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => EchelonClasse::class,
        ]);
    }
}
