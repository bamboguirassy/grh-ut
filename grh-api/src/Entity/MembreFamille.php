<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MembreFamille
 *
 * @ORM\Table(name="membre_famille", indexes={@ORM\Index(name="fk_membre_famille_employe1_idx", columns={"employe"})})
 * @ORM\Entity
 */
class MembreFamille
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
     * @ORM\Column(name="prenoms", type="string", length=45, nullable=false)
     */
    private $prenoms;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=45, nullable=false)
     */
    private $nom;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_naissance", type="date", nullable=false)
     */
    private $dateNaissance;

    /**
     * @var string
     *
     * @ORM\Column(name="lieu_naissance", type="string", length=145, nullable=false)
     */
    private $lieuNaissance;

    /**
     * @var string
     *
     * @ORM\Column(name="genre", type="string", length=45, nullable=false, options={"comment"="Homme ou Femme"})
     */
    private $genre;

    /**
     * @var string
     *
     * @ORM\Column(name="lien_parente", type="string", length=45, nullable=false, options={"comment"="enfant, epoux"})
     */
    private $lienParente;

    /**
     * @var string|null
     *
     * @ORM\Column(name="telephone", type="string", length=45, nullable=true)
     */
    private $telephone;

    /**
     * @var \Employe
     *
     * @ORM\ManyToOne(targetEntity="Employe")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="employe", referencedColumnName="id")
     * })
     */
    private $employe;

    /**
    
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateMariage;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPrenoms(): ?string
    {
        return $this->prenoms;
    }

    public function setPrenoms(string $prenoms): self
    {
        $this->prenoms = $prenoms;

        return $this;
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

    public function getDateNaissance(): ?\DateTimeInterface
    {
        return $this->dateNaissance;
    }

    public function setDateNaissance(\DateTimeInterface $dateNaissance): self
    {
        $this->dateNaissance = $dateNaissance;

        return $this;
    }

    public function getLieuNaissance(): ?string
    {
        return $this->lieuNaissance;
    }

    public function setLieuNaissance(string $lieuNaissance): self
    {
        $this->lieuNaissance = $lieuNaissance;

        return $this;
    }

    public function getGenre(): ?string
    {
        return $this->genre;
    }

    public function setGenre(string $genre): self
    {
        $this->genre = $genre;

        return $this;
    }

    public function getLienParente(): ?string
    {
        return $this->lienParente;
    }

    public function setLienParente(string $lienParente): self
    {
        $this->lienParente = $lienParente;

        return $this;
    }

    public function getTelephone(): ?string
    {
        return $this->telephone;
    }

    public function setTelephone(?string $telephone): self
    {
        $this->telephone = $telephone;

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

    public function getDateMariage(): ?\DateTimeInterface
    {
        return $this->dateMariage;
    }

    public function setDateMariage(?\DateTimeInterface $dateMariage): self
    {
        $this->dateMariage = $dateMariage;

        return $this;
    }


}
