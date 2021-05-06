<?php

namespace App\Repository;

use App\Entity\GCategorie;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method GCategorie|null find($id, $lockMode = null, $lockVersion = null)
 * @method GCategorie|null findOneBy(array $criteria, array $orderBy = null)
 * @method GCategorie[]    findAll()
 * @method GCategorie[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GCategorieRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GCategorie::class);
    }

    // /**
    //  * @return GCategorie[] Returns an array of GCategorie objects
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
    public function findOneBySomeField($value): ?GCategorie
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
