<?php

namespace App\Form;

use App\Entity\DiplomeEmploye;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class DiplomeEmployeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('anneeObtention')
            ->add('etablissement')
            ->add('employe')
            ->add('diplome')
            ->add('formation')
            ->add('statutFormation')
            ->add('commentaire')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => DiplomeEmploye::class,
        ]);
    }
}
