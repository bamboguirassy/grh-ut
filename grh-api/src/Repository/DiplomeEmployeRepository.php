<?php

namespace App\Repository;

use App\Entity\DiplomeEmploye;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method DiplomeEmploye|null find($id, $lockMode = null, $lockVersion = null)
 * @method DiplomeEmploye|null findOneBy(array $criteria, array $orderBy = null)
 * @method DiplomeEmploye[]    findAll()
 * @method DiplomeEmploye[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DiplomeEmployeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DiplomeEmploye::class);
    }

    // /**
    //  * @return DiplomeEmploye[] Returns an array of DiplomeEmploye objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('d')
            ->andWhere('d.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('d.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?DiplomeEmploye
    {
        return $this->createQueryBuilder('d')
            ->andWhere('d.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
