<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MutuelleSante
 *
 * @ORM\Table(name="mutuelle_sante")
 * @ORM\Entity
 */
class MutuelleSante
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
     * @ORM\Column(name="nom", type="string", length=245, nullable=false)
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=45)
     */
    private $code;

    /**
     * @ORM\Column(type="string", length=145, nullable=true)
     */
    private $filename;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $filepath;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(string $code): self
    {
        $this->code = $code;

        return $this;
    }

    public function getFilename(): ?string
    {
        return $this->filename;
    }

    public function setFilename(string $filename): self
    {
        $this->filename = $filename;

        return $this;
    }

    public function getFilepath(): ?string
    {
        return $this->filepath;
    }

    public function setFilepath(?string $filepath): self
    {
        $this->filepath = $filepath;

        return $this;
    }


}
