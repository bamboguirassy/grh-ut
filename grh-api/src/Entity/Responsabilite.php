<?php

namespace App\Entity;

use App\Repository\ResponsabiliteRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ResponsabiliteRepository::class)
 */
class Responsabilite
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Fonction::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $fonction;

    /**
     * @ORM\ManyToOne(targetEntity=Structure::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $structure;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFonction(): ?Fonction
    {
        return $this->fonction;
    }

    public function setFonction(?Fonction $fonction): self
    {
        $this->fonction = $fonction;

        return $this;
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
}
