<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FonctionEmploye
 *
 * @ORM\Table(name="fonction_employe", indexes={@ORM\Index(name="fk_fonction_employe_employe1_idx", columns={"employe"}), @ORM\Index(name="fk_fonction_employe_responsabilite_idx", columns={"responsabilite"})})
 * @ORM\Entity
 */
class FonctionEmploye
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
     * @var \DateTime
     *
     * @ORM\Column(name="date_prise_fonction", type="date", nullable=false)
     */
    private $datePriseFonction;


    /**
     * @var bool|null
     *
     * @ORM\Column(name="etat", type="boolean", nullable=true, options={"comment"="true ou false pour savoir si la fonction est toujours d'actualité Donner la possibilité de définir une fonction comme étant la courante"})
     */
    private $etat;

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
    private $dateFin;

    /**
     * @ORM\ManyToOne(targetEntity=StructureFonction::class)
     * @ORM\JoinColumn(name="responsabilite", referencedColumnName="id",nullable=false)
     */
    private $responsabilite;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDatePriseFonction(): ?\DateTimeInterface
    {
        return $this->datePriseFonction;
    }

    public function setDatePriseFonction(\DateTimeInterface $datePriseFonction): self
    {
        $this->datePriseFonction = $datePriseFonction;

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

    public function getEmploye(): ?Employe
    {
        return $this->employe;
    }

    public function setEmploye(?Employe $employe): self
    {
        $this->employe = $employe;

        return $this;
    }


    public function getDateFin(): ?\DateTimeInterface
    {
        return $this->dateFin;
    }

    public function setDateFin(?\DateTimeInterface $dateFin): self
    {
        $this->dateFin = $dateFin;

        return $this;
    }

    public function getResponsabilite(): ?StructureFonction
    {
        return $this->responsabilite;
    }

    public function setResponsabilite(?StructureFonction $responsabilite): self
    {
        $this->responsabilite = $responsabilite;

        return $this;
    }


}
