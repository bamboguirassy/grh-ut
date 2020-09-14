<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Structure
 *
 * @ORM\Table(name="structure", indexes={@ORM\Index(name="fk_structure_structure1_idx", columns={"structure_parente"}), @ORM\Index(name="fk_structure_typeentite_idx", columns={"type_entite"})})
 * @ORM\Entity
 */
class Structure
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
     * @ORM\Column(name="nom", type="string", length=145, nullable=false)
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
     * @ORM\Column(name="adresse", type="text", length=65535, nullable=true)
     */
    private $adresse;

    /**
     * @var string|null
     *
     * @ORM\Column(name="telephone", type="string", length=45, nullable=true)
     */
    private $telephone;

    /**
     * @var \Structure
     *
     * @ORM\ManyToOne(targetEntity="Structure")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="structure_parente", referencedColumnName="id")
     * })
     */
    private $structureParente;

    /**
     * @var \TypeEntite
     *
     * @ORM\ManyToOne(targetEntity="TypeEntite")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="type_entite", referencedColumnName="id")
     * })
     */
    private $typeEntite;

    /**
     * @ORM\OneToMany(targetEntity=Structure::class, mappedBy="structureParente")
     */
    private $children;

    public function __construct()
    {
        $this->children = new ArrayCollection();
    }

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

    public function getAdresse(): ?string
    {
        return $this->adresse;
    }

    public function setAdresse(?string $adresse): self
    {
        $this->adresse = $adresse;

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

    public function getStructureParente(): ?self
    {
        return $this->structureParente;
    }

    public function setStructureParente(?self $structureParente): self
    {
        $this->structureParente = $structureParente;

        return $this;
    }

    public function getTypeEntite(): ?TypeEntite
    {
        return $this->typeEntite;
    }

    public function setTypeEntite(?TypeEntite $typeEntite): self
    {
        $this->typeEntite = $typeEntite;

        return $this;
    }

    /**
     * @return Collection|self[]
     */
    public function getChildren(): Collection
    {
        return $this->children;
    }

    public function addChild(self $child): self
    {
        if (!$this->children->contains($child)) {
            $this->children[] = $child;
            $child->setStructure($this);
        }

        return $this;
    }

    public function removeChild(self $child): self
    {
        if ($this->children->contains($child)) {
            $this->children->removeElement($child);
            // set the owning side to null (unless already changed)
            if ($child->getStructure() === $this) {
                $child->setStructure(null);
            }
        }

        return $this;
    }


}
