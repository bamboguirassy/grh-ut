<?php

namespace App\Repository;

use App\Entity\StructureFonction;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method StructureFonction|null find($id, $lockMode = null, $lockVersion = null)
 * @method StructureFonction|null findOneBy(array $criteria, array $orderBy = null)
 * @method StructureFonction[]    findAll()
 * @method StructureFonction[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StructureFonctionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, StructureFonction::class);
    }

    // /**
    //  * @return StructureFonction[] Returns an array of StructureFonction objects
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
    public function findOneBySomeField($value): ?StructureFonction
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
