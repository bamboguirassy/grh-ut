<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TypeDocument
 *
 * @ORM\Table(name="type_document")
 * @ORM\Entity
 */
class TypeDocument
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=45, nullable=false)
     */
    private $nom;

    /**
     * @var int
     *
     * @ORM\Column(name="duree_archivage", type="integer", nullable=false)
     */
    private $dureeArchivage;

    public function getId()
    {
        return $this->id;
    }

    public function getNom()
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getDureeArchivage()
    {
        return $this->dureeArchivage;
    }

    public function setDureeArchivage(int $dureeArchivage): self
    {
        $this->dureeArchivage = $dureeArchivage;

        return $this;
    }


}
