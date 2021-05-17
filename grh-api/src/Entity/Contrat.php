<?php

namespace App\Entity;

use App\Repository\ContratRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ContratRepository::class)
 */
class Contrat
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=TypeContrat::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $typeContrat;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $dureeEnMois;

    /**
     * @ORM\ManyToOne(targetEntity=Employe::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $employe;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateRupture;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $motifRupture;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $expire;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $rompu;

    /**
     * @ORM\Column(type="date", nullable=false)
     */
    private $dateCreation;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateSignature;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateDebut;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateFin;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTypeContrat(): ?TypeContrat
    {
        return $this->typeContrat;
    }

    public function setTypeContrat(?TypeContrat $typeContrat): self
    {
        $this->typeContrat = $typeContrat;

        return $this;
    }

    public function getDureeEnMois(): ?int
    {
        return $this->dureeEnMois;
    }

    public function setDureeEnMois(?int $dureeEnMois): self
    {
        $this->dureeEnMois = $dureeEnMois;

        return $this;
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

    public function getEtat(): ?bool
    {
        return $this->etat;
    }

    public function setEtat(bool $etat): self
    {
        $this->etat = $etat;

        return $this;
    }

    public function getDateRupture()
    {
        return $this->dateRupture;
    }

    public function setDateRupture($dateRupture): self
    {
        $this->dateRupture = $dateRupture;

        return $this;
    }

    public function getMotifRupture(): ?string
    {
        return $this->motifRupture;
    }

    public function setMotifRupture(?string $motifRupture): self
    {
        $this->motifRupture = $motifRupture;

        return $this;
    }

    public function getExpire(): ?bool
    {
        return $this->expire;
    }

    public function setExpire(?bool $expire): self
    {
        $this->expire = $expire;

        return $this;
    }

    public function getRompu(): ?bool
    {
        return $this->rompu;
    }

    public function setRompu(?bool $rompu): self
    {
        $this->rompu = $rompu;

        return $this;
    }

    public function getDateCreation()
    {
        return $this->dateCreation;
    }

    public function setDateCreation($dateCreation): self
    {
        $this->dateCreation = $dateCreation;

        return $this;
    }

    public function getDateSignature()
    {
        return $this->dateSignature;
    }

    public function setDateSignature($dateSignature): self
    {
        $this->dateSignature = $dateSignature;

        return $this;
    }

    public function getDateDebut()
    {
        return $this->dateDebut;
    }

    public function setDateDebut($dateDebut): self
    {
        $this->dateDebut = $dateDebut;

        return $this;
    }

    public function getDateFin()
    {
        return $this->dateFin;
    }

    public function setDateFin($dateFin): self
    {
        $this->dateFin = $dateFin;

        return $this;
    }
}
