<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Grade
 *
 * @ORM\Table(name="grade")
 * @ORM\Entity
 */
class Grade
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
     * @ORM\Column(name="classification", type="string", length=45, nullable=false)
     */
    private $classification;

    /**
     * @ORM\ManyToOne(targetEntity=GEchelon::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $echelon;

    /**
     * @ORM\ManyToOne(targetEntity=GNiveau::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $niveau;

    /**
     * @ORM\ManyToOne(targetEntity=GCategorie::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $categorie;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getClassification(): ?string
    {
        return $this->classification;
    }

    public function setClassification(string $classification): self
    {
        $this->classification = $classification;

        return $this;
    }

    public function getEchelon(): ?GEchelon
    {
        return $this->echelon;
    }

    public function setEchelon(?GEchelon $echelon): self
    {
        $this->echelon = $echelon;

        return $this;
    }

    public function getNiveau(): ?GNiveau
    {
        return $this->niveau;
    }

    public function setNiveau(?GNiveau $niveau): self
    {
        $this->niveau = $niveau;

        return $this;
    }

    public function getCategorie(): ?GCategorie
    {
        return $this->categorie;
    }

    public function setCategorie(?GCategorie $categorie): self
    {
        $this->categorie = $categorie;

        return $this;
    }


}
