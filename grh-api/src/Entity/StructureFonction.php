<?php

namespace App\Entity;

use App\Repository\StructureFonctionRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=StructureFonctionRepository::class)
 */
class StructureFonction
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Structure::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $structure;


    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $etat;

    /**
     * @ORM\OneToMany(targetEntity=FonctionEmploye::class, mappedBy="responsabilite")
     */
    private $fonctionEmployes;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $duree;
    
    /**
     * @ORM\ManyToOne(targetEntity=Rang::class)
     * @ORM\JoinColumn(name="rang", referencedColumnName="id",nullable=false)
    */
    private $rang;

    public function __construct()
    {
        $this->fonctionEmployes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStructure(): ?Structure
    {
        return $this->structure;
    }

    public function setStructure(?Structure $structure): self
    {
        $this->structure = $structure;

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

    /**
     * @return mixed
     */
    public function getFonctionEmployes()
    {
        return $this->fonctionEmployes;
    }

    public function addFonctionEmploye(FonctionEmploye $fonctionEmploye): self
    {
        if (!$this->fonctionEmployes->contains($fonctionEmploye)) {
            $this->fonctionEmployes[] = $fonctionEmploye;
            $fonctionEmploye->setResponsabilite($this);
        }

        return $this;
    }

    public function removeFonctionEmploye(FonctionEmploye $fonctionEmploye): self
    {
        if ($this->fonctionEmployes->removeElement($fonctionEmploye)) {
            // set the owning side to null (unless already changed)
            if ($fonctionEmploye->getResponsabilite() === $this) {
                $fonctionEmploye->setResponsabilite(null);
            }
        }

        return $this;
    }

    public function getDuree(): ?int
    {
        return $this->duree;
    }

    public function setDuree(?int $duree): self
    {
        $this->duree = $duree;

        return $this;
    }
    
    public function getRang()
    {
        return $this->rang;
    }

    public function setRang(?Rang $rang)
    {
        $this->rang = $rang;

        return $this;
    }

}
