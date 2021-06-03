<?php

namespace App\Form;

use App\Entity\MembreFamille;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MembreFamilleType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('prenoms')
            ->add('nom')
            ->add('dateNaissance')
            ->add('dateMariage')
            ->add('lieuNaissance')
            ->add('genre')
            ->add('lienParente')
            ->add('telephone')
            ->add('employe')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => MembreFamille::class,
        ]);
    }
}
