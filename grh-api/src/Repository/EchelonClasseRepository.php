<?php

namespace App\Repository;

use App\Entity\EchelonClasse;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method EchelonClasse|null find($id, $lockMode = null, $lockVersion = null)
 * @method EchelonClasse|null findOneBy(array $criteria, array $orderBy = null)
 * @method EchelonClasse[]    findAll()
 * @method EchelonClasse[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EchelonClasseRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, EchelonClasse::class);
    }

    // /**
    //  * @return EchelonClasse[] Returns an array of EchelonClasse objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?EchelonClasse
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
