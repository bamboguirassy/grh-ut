<?php

namespace App\Repository;

use App\Entity\GEchelon;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method GEchelon|null find($id, $lockMode = null, $lockVersion = null)
 * @method GEchelon|null findOneBy(array $criteria, array $orderBy = null)
 * @method GEchelon[]    findAll()
 * @method GEchelon[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GEchelonRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GEchelon::class);
    }

    // /**
    //  * @return GEchelon[] Returns an array of GEchelon objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('g')
            ->andWhere('g.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('g.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?GEchelon
    {
        return $this->createQueryBuilder('g')
            ->andWhere('g.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
