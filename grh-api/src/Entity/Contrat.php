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
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $etat;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateFinPrevue;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateFinEffective;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $motifFin;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $commentaireSurFinContrat;


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

    public function getEtat(): ?bool
    {
        return $this->etat;
    }

    public function setEtat(?bool $etat): self
    {
        $this->etat = $etat;

        return $this;
    }

    public function getDateFinPrevue(): ?\DateTimeInterface
    {
        return $this->dateFinPrevue;
    }

    public function setDateFinPrevue(?\DateTimeInterface $dateFinPrevue): self
    {
        $this->dateFinPrevue = $dateFinPrevue;

        return $this;
    }

    public function getDateFinEffective(): ?\DateTimeInterface
    {
        return $this->dateFinEffective;
    }

    public function setDateFinEffective(?\DateTimeInterface $dateFinEffective): self
    {
        $this->dateFinEffective = $dateFinEffective;

        return $this;
    }

    public function getMotifFin(): ?string
    {
        return $this->motifFin;
    }

    public function setMotifFin(?string $motifFin): self
    {
        $this->motifFin = $motifFin;

        return $this;
    }

    public function getCommentaireSurFinContrat(): ?string
    {
        return $this->commentaireSurFinContrat;
    }

    public function setCommentaireSurFinContrat(?string $commentaireSurFinContrat): self
    {
        $this->commentaireSurFinContrat = $commentaireSurFinContrat;

        return $this;
    }

}
