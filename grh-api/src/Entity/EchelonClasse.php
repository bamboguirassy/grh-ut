<?php

namespace App\Entity;

use App\Repository\EchelonClasseRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=EchelonClasseRepository::class)
 */
class EchelonClasse
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

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

    /**
     * @ORM\Column(type="string", length=10)
     */
    private $indice;

    public function getId(): ?int
    {
        return $this->id;
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

    public function getIndice(): ?string
    {
        return $this->indice;
    }

    public function setIndice(string $indice): self
    {
        $this->indice = $indice;

        return $this;
    }
}
