<?php

namespace App\Entity;

use App\Repository\MembreCommissionRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MembreCommissionRepository::class)
 */
class MembreCommission
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Employe::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $employe;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $fonction;

    /**
     * @ORM\Column(type="date")
     */
    private $dateIntegration;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $statut;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateSortie;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $motifSortie;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmploye(): ?Employe
    {
        return $this->employe;
    }

    public function setEmploye(?Employe $employe): self
    {
        $this->employe = $employe;

        return $this;
    }

    public function getFonction(): ?string
    {
        return $this->fonction;
    }

    public function setFonction(string $fonction): self
    {
        $this->fonction = $fonction;

        return $this;
    }

    public function getDateIntegration(): ?\DateTimeInterface
    {
        return $this->dateIntegration;
    }

    public function setDateIntegration(\DateTimeInterface $dateIntegration): self
    {
        $this->dateIntegration = $dateIntegration;

        return $this;
    }

    public function getStatut(): ?bool
    {
        return $this->statut;
    }

    public function setStatut(?bool $statut): self
    {
        $this->statut = $statut;

        return $this;
    }

    public function getDateSortie(): ?\DateTimeInterface
    {
        return $this->dateSortie;
    }

    public function setDateSortie(?\DateTimeInterface $dateSortie): self
    {
        $this->dateSortie = $dateSortie;

        return $this;
    }

    public function getMotifSortie(): ?string
    {
        return $this->motifSortie;
    }

    public function setMotifSortie(?string $motifSortie): self
    {
        $this->motifSortie = $motifSortie;

        return $this;
    }
}
