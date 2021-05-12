<?php

namespace App\Entity;

use App\Repository\GClasseRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=GClasseRepository::class)
 */
class GClasse
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
     * @ORM\OneToOne(targetEntity=GClasse::class, cascade={"persist", "remove"})
     */
    private $suivant;

    /**
     * @ORM\Column(type="integer")
     */
    private $ordre;

    /**
     * @ORM\ManyToMany(targetEntity=GCategorie::class)
     */
    private $categories;

    /**
     * @ORM\ManyToMany(targetEntity=GNiveau::class)
     */
    private $niveaux;
    
    /**
     * @var \TypeEmploye
     *
     * @ORM\ManyToOne(targetEntity="TypeEmploye")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="type_employe", referencedColumnName="id", nullable=false)
     * })
     */
    private $typeEmploye;

    public function __construct()
    {
        $this->categories = new ArrayCollection();
        $this->niveaux = new ArrayCollection();
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

    public function getIndice(): ?string
    {
        return $this->indice;
    }

    public function setIndice(string $indice): self
    {
        $this->indice = $indice;

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

    public function getOrdre(): ?int
    {
        return $this->ordre;
    }

    public function setOrdre(int $ordre): self
    {
        $this->ordre = $ordre;

        return $this;
    }

    /**
     * @return Collection|GCategorie[]
     */
    public function getCategories(): Collection
    {
        return $this->categories;
    }

    public function addCategory(GCategorie $category): self
    {
        if (!$this->categories->contains($category)) {
            $this->categories[] = $category;
        }

        return $this;
    }

    public function removeCategory(GCategorie $category): self
    {
        if ($this->categories->contains($category)) {
            $this->categories->removeElement($category);
        }

        return $this;
    }

    /**
     * @return Collection|GNiveau[]
     */
    public function getNiveaux(): Collection
    {
        return $this->niveaux;
    }

    public function addNiveau(GNiveau $niveau): self
    {
        if (!$this->niveaux->contains($niveau)) {
            $this->niveaux[] = $niveau;
        }

        return $this;
    }

    public function removeNiveau(GNiveau $niveau): self
    {
        if ($this->niveaux->contains($niveau)) {
            $this->niveaux->removeElement($niveau);
        }

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
}
