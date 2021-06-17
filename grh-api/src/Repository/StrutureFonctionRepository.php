<?php

namespace App\Repository;

use App\Entity\StrutureFonction;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method StrutureFonction|null find($id, $lockMode = null, $lockVersion = null)
 * @method StrutureFonction|null findOneBy(array $criteria, array $orderBy = null)
 * @method StrutureFonction[]    findAll()
 * @method StrutureFonction[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StrutureFonctionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, StrutureFonction::class);
    }

    // /**
    //  * @return StrutureFonction[] Returns an array of StrutureFonction objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?StrutureFonction
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
