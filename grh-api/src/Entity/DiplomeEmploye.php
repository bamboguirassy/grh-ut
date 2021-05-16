<?php

namespace App\Entity;

use App\Repository\DiplomeEmployeRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=DiplomeEmployeRepository::class)
 */
class DiplomeEmploye
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
     * @ORM\ManyToOne(targetEntity=Diplome::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $diplome;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $anneeObtention;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $etablissement;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $formation;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $statutFormation;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $commentaire;

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

    public function getDiplome(): ?Diplome
    {
        return $this->diplome;
    }

    public function setDiplome(?Diplome $diplome): self
    {
        $this->diplome = $diplome;

        return $this;
    }

    public function getAnneeObtention(): ?string
    {
        return $this->anneeObtention;
    }

    public function setAnneeObtention(string $anneeObtention): self
    {
        $this->anneeObtention = $anneeObtention;

        return $this;
    }

    public function getEtablissement(): ?string
    {
        return $this->etablissement;
    }

    public function setEtablissement(?string $etablissement): self
    {
        $this->etablissement = $etablissement;

        return $this;
    }

    public function getFormation(): ?string
    {
        return $this->formation;
    }

    public function setFormation(string $formation): self
    {
        $this->formation = $formation;

        return $this;
    }

    public function getStatutFormation(): ?string
    {
        return $this->statutFormation;
    }

    public function setStatutFormation(string $statutFormation): self
    {
        $this->statutFormation = $statutFormation;

        return $this;
    }

    public function getCommentaire(): ?string
    {
        return $this->commentaire;
    }

    public function setCommentaire(?string $commentaire): self
    {
        $this->commentaire = $commentaire;

        return $this;
    }
}
