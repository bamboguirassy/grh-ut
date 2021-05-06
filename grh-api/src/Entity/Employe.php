<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Employe
 *
 * @ORM\Table(name="employe", indexes={@ORM\Index(name="fk_employe_mutuelle_sante1_idx", columns={"mutuelle_sante"}), @ORM\Index(name="fk_employe_pays1_idx", columns={"nationalite"}), @ORM\Index(name="fk_employe_caisse_sociale1_idx", columns={"caisse_sociale"}), @ORM\Index(name="fk_employe_grade1_idx", columns={"grade"}), @ORM\Index(name="fk_employe_type_employe1_idx", columns={"type_employe"})})
 * @ORM\Entity
 */
class Employe
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
     * @ORM\Column(name="prenoms", type="string", length=145, nullable=false)
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
     * @ORM\Column(name="lieu_naissance", type="string", length=65, nullable=false)
     */
    private $lieuNaissance;

    /**
     * @var string
     *
     * @ORM\Column(name="cni", type="string", length=45, nullable=false)
     */
    private $cni;

    /**
     * @var string
     *
     * @ORM\Column(name="matricule", type="string", length=45, nullable=false)
     */
    private $matricule;

    /**
     * @var string|null
     *
     * @ORM\Column(name="matricule_caisse_sociale", type="string", length=45, nullable=true)
     */
    private $matriculeCaisseSociale;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_recrutement", type="date", nullable=false)
     */
    private $dateRecrutement;

    /**
     * @var string|null
     *
     * @ORM\Column(name="situtation_matrimoniale", type="string", length=45, nullable=true)
     */
    private $situtationMatrimoniale;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="retraite", type="boolean", nullable=true, options={"comment"="true ou false, false par defaut"})
     */
    private $retraite;

    /**
     * @var string
     *
     * @ORM\Column(name="genre", type="string", length=45, nullable=false, options={"comment"="Homme ou Femme"})
     */
    private $genre;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="etat", type="boolean", nullable=true, options={"comment"="true ou false pur indiquer si l'employé est toujours actif"})
     */
    private $etat;

    /**
     * @var string|null
     *
     * @ORM\Column(name="email_univ", type="string", length=45, nullable=true)
     */
    private $emailUniv;

    /**
     * @var string|null
     *
     * @ORM\Column(name="email", type="string", length=45, nullable=true)
     */
    private $email;

    /**
     * @var string|null
     *
     * @ORM\Column(name="filename", type="string", length=145, nullable=true)
     */
    private $filename;

    /**
     * @var string|null
     *
     * @ORM\Column(name="filepath", type="text", length=65535, nullable=true)
     */
    private $filepath;

    /**
     * @var string
     *
     * @ORM\Column(name="telephone_primaire", type="string", length=45, nullable=false)
     */
    private $telephonePrimaire;

    /**
     * @var string|null
     *
     * @ORM\Column(name="telephone_secondaire", type="string", length=45, nullable=true)
     */
    private $telephoneSecondaire;

    /**
     * @var \CaisseSociale
     *
     * @ORM\ManyToOne(targetEntity="CaisseSociale")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="caisse_sociale", referencedColumnName="id")
     * })
     */
    private $caisseSociale;

    /**
     * @var \Grade
     *
     * @ORM\ManyToOne(targetEntity="Grade")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="grade", referencedColumnName="id")
     * })
     */
    private $grade;

    /**
     * @var \MutuelleSante
     *
     * @ORM\ManyToOne(targetEntity="MutuelleSante")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="mutuelle_sante", referencedColumnName="id")
     * })
     */
    private $mutuelleSante;

    /**
     * @var \Pays
     *
     * @ORM\ManyToOne(targetEntity="Pays")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="nationalite", referencedColumnName="id")
     * })
     */
    private $nationalite;

    /**
     * @var \TypeEmploye
     *
     * @ORM\ManyToOne(targetEntity="TypeEmploye")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="type_employe", referencedColumnName="id")
     * })
     */
    private $typeEmploye;

    /**
     * @ORM\ManyToOne(targetEntity=Profession::class)
     */
    private $profession;

    public function getId()
    {
        return $this->id;
    }

    public function getPrenoms()
    {
        return $this->prenoms;
    }

    public function setPrenoms(string $prenoms): self
    {
        $this->prenoms = $prenoms;

        return $this;
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

    public function getDateNaissance()
    {
        return $this->dateNaissance;
    }

    public function setDateNaissance($dateNaissance): self
    {
        $this->dateNaissance = $dateNaissance;

        return $this;
    }

    public function getLieuNaissance()
    {
        return $this->lieuNaissance;
    }

    public function setLieuNaissance(string $lieuNaissance): self
    {
        $this->lieuNaissance = $lieuNaissance;

        return $this;
    }

    public function getCni()
    {
        return $this->cni;
    }

    public function setCni(string $cni): self
    {
        $this->cni = $cni;

        return $this;
    }

    public function getMatricule()
    {
        return $this->matricule;
    }

    public function setMatricule(string $matricule): self
    {
        $this->matricule = $matricule;

        return $this;
    }

    public function getMatriculeCaisseSociale()
    {
        return $this->matriculeCaisseSociale;
    }

    public function setMatriculeCaisseSociale($matriculeCaisseSociale): self
    {
        $this->matriculeCaisseSociale = $matriculeCaisseSociale;

        return $this;
    }

    public function getDateRecrutement()
    {
        return $this->dateRecrutement;
    }

    public function setDateRecrutement($dateRecrutement): self
    {
        $this->dateRecrutement = $dateRecrutement;

        return $this;
    }

    public function getSitutationMatrimoniale()
    {
        return $this->situtationMatrimoniale;
    }

    public function setSitutationMatrimoniale($situtationMatrimoniale): self
    {
        $this->situtationMatrimoniale = $situtationMatrimoniale;

        return $this;
    }

    public function getRetraite()
    {
        return $this->retraite;
    }

    public function setRetraite($retraite): self
    {
        $this->retraite = $retraite;

        return $this;
    }

    public function getGenre()
    {
        return $this->genre;
    }

    public function setGenre(string $genre): self
    {
        $this->genre = $genre;

        return $this;
    }

    public function getEtat()
    {
        return $this->etat;
    }

    public function setEtat($etat): self
    {
        $this->etat = $etat;

        return $this;
    }

    public function getEmailUniv()
    {
        return $this->emailUniv;
    }

    public function setEmailUniv($emailUniv): self
    {
        $this->emailUniv = $emailUniv;

        return $this;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getFilename()
    {
        return $this->filename;
    }

    public function setFilename($filename): self
    {
        $this->filename = $filename;

        return $this;
    }

    public function getFilepath()
    {
        return $this->filepath;
    }

    public function setFilepath($filepath): self
    {
        $this->filepath = $filepath;

        return $this;
    }

    public function getTelephonePrimaire()
    {
        return $this->telephonePrimaire;
    }

    public function setTelephonePrimaire(string $telephonePrimaire): self
    {
        $this->telephonePrimaire = $telephonePrimaire;

        return $this;
    }

    public function getTelephoneSecondaire()
    {
        return $this->telephoneSecondaire;
    }

    public function setTelephoneSecondaire($telephoneSecondaire): self
    {
        $this->telephoneSecondaire = $telephoneSecondaire;

        return $this;
    }

    public function getCaisseSociale()
    {
        return $this->caisseSociale;
    }

    public function setCaisseSociale($caisseSociale): self
    {
        $this->caisseSociale = $caisseSociale;

        return $this;
    }

    public function getGrade()
    {
        return $this->grade;
    }

    public function setGrade($grade): self
    {
        $this->grade = $grade;

        return $this;
    }

    public function getMutuelleSante()
    {
        return $this->mutuelleSante;
    }

    public function setMutuelleSante($mutuelleSante): self
    {
        $this->mutuelleSante = $mutuelleSante;

        return $this;
    }

    public function getNationalite()
    {
        return $this->nationalite;
    }

    public function setNationalite($nationalite): self
    {
        $this->nationalite = $nationalite;

        return $this;
    }

    public function getTypeEmploye()
    {
        return $this->typeEmploye;
    }

    public function setTypeEmploye($typeEmploye): self
    {
        $this->typeEmploye = $typeEmploye;

        return $this;
    }

    public function getProfession(): ?Profession
    {
        return $this->profession;
    }

    public function setProfession(?Profession $profession): self
    {
        $this->profession = $profession;

        return $this;
    }


}
