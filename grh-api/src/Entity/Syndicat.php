<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Syndicat
 *
 * @ORM\Table(name="syndicat", indexes={@ORM\Index(name="fk_syndicat_type_employe1_idx", columns={"type_employe"})})
 * @ORM\Entity
 */
class Syndicat
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
     * @var string
     *
     * @ORM\Column(name="code", type="string", length=45, nullable=false)
     */
    private $code;

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
     * @var int|null
     *
     * @ORM\Column(name="montant_cotisation_mensuelle", type="integer", nullable=true)
     */
    private $montantCotisationMensuelle;

    /**
     * @var \TypeEmploye
     *
     * @ORM\ManyToOne(targetEntity="TypeEmploye")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="type_employe", referencedColumnName="id")
     * })
     */
    private $typeEmploye;

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

    public function setFilename(?string $filename): self
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

    public function getMontantCotisationMensuelle(): ?int
    {
        return $this->montantCotisationMensuelle;
    }

    public function setMontantCotisationMensuelle(?int $montantCotisationMensuelle): self
    {
        $this->montantCotisationMensuelle = $montantCotisationMensuelle;

        return $this;
    }

    public function getTypeEmploye(): ?TypeEmploye
    {
        return $this->typeEmploye;
    }

    public function setTypeEmploye(?TypeEmploye $typeEmploye): self
    {
        $this->typeEmploye = $typeEmploye;

        return $this;
    }


}
