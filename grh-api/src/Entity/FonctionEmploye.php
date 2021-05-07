<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FonctionEmploye
 *
 * @ORM\Table(name="fonction_employe", indexes={@ORM\Index(name="fk_fonction_employe_employe1_idx", columns={"employe"}), @ORM\Index(name="fk_fonction_employe_fonction1_idx", columns={"fonction"}), @ORM\Index(name="fk_fonction_employe_structure1_idx", columns={"structure"})})
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
     * @var \Fonction
     *
     * @ORM\ManyToOne(targetEntity="Fonction")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="fonction", referencedColumnName="id")
     * })
     */
    private $fonction;

    /**
     * @var \Structure
     *
     * @ORM\ManyToOne(targetEntity="Structure")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="structure", referencedColumnName="id")
     * })
     */
    private $structure;

    

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateFin;

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


    public function getDateFin(): ?\DateTimeInterface
    {
        return $this->dateFin;
    }

    public function setDateFin(?\DateTimeInterface $dateFin): self
    {
        $this->dateFin = $dateFin;

        return $this;
    }


}
