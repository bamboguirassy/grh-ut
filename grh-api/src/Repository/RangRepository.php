<?php

namespace App\Repository;

use App\Entity\Rang;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Rang|null find($id, $lockMode = null, $lockVersion = null)
 * @method Rang|null findOneBy(array $criteria, array $orderBy = null)
 * @method Rang[]    findAll()
 * @method Rang[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RangRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Rang::class);
    }

    // /**
    //  * @return Rang[] Returns an array of Rang objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Rang
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
