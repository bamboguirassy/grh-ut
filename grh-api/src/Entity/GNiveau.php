<?php

namespace App\Entity;

use App\Repository\GNiveauRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=GNiveauRepository::class)
 */
class GNiveau
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=10)
     */
    private $indice;

    /**
     * @ORM\Column(type="integer")
     */
    private $ordre;

    /**
     * @ORM\OneToOne(targetEntity=GNiveau::class, cascade={"persist", "remove"})
     */
    private $suivant;

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

    public function getIndice(): ?string
    {
        return $this->indice;
    }

    public function setIndice(string $indice): self
    {
        $this->indice = $indice;

        return $this;
    }

    public function getOrdre(): ?int
    {
        return $this->ordre;
    }

    public function setOrdre(int $ordre): self
    {
        $this->ordre = $ordre;

        return $this;
    }

    public function getSuivant(): ?self
    {
        return $this->suivant;
    }

    public function setSuivant(?self $suivant): self
    {
        $this->suivant = $suivant;

        return $this;
    }
}
