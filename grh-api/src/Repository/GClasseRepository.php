<?php

namespace App\Repository;

use App\Entity\GClasse;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method GClasse|null find($id, $lockMode = null, $lockVersion = null)
 * @method GClasse|null findOneBy(array $criteria, array $orderBy = null)
 * @method GClasse[]    findAll()
 * @method GClasse[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GClasseRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GClasse::class);
    }

    // /**
    //  * @return GClasse[] Returns an array of GClasse objects
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
    public function findOneBySomeField($value): ?GClasse
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
