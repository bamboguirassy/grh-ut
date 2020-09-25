<?php

namespace App\Form;

use App\Entity\FonctionEmploye;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class FonctionEmployeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('datePriseFonction')
            ->add('duree')
            ->add('etat')
            ->add('employe')
            ->add('fonction')
            ->add('structure')
            ->add('typeContrat')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => FonctionEmploye::class,
        ]);
    }
}
