<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MembreSyndicat
 *
 * @ORM\Table(name="membre_syndicat", indexes={@ORM\Index(name="fk_membre_syndicat_syndicat1_idx", columns={"syndicat"}), @ORM\Index(name="fk_membre_syndicat_employe1_idx", columns={"employe"})})
 * @ORM\Entity
 */
class MembreSyndicat
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
     * @ORM\Column(name="date_enregistrement", type="date", nullable=false)
     */
    private $dateEnregistrement;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="etat", type="boolean", nullable=true, options={"comment"="true si c'est le syndicat actuel du travailleur
un employé peut être dans plusieurs syndicats"})
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
     * @var \Syndicat
     *
     * @ORM\ManyToOne(targetEntity="Syndicat")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="syndicat", referencedColumnName="id")
     * })
     */
    private $syndicat;

    public function getId()
    {
        return $this->id;
    }

    public function getDateEnregistrement()
    {
        return $this->dateEnregistrement;
    }

    public function setDateEnregistrement($dateEnregistrement): self
    {
        $this->dateEnregistrement = $dateEnregistrement;

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

    public function getEmploye()
    {
        return $this->employe;
    }

    public function setEmploye($employe): self
    {
        $this->employe = $employe;

        return $this;
    }

    public function getSyndicat()
    {
        return $this->syndicat;
    }

    public function setSyndicat($syndicat): self
    {
        $this->syndicat = $syndicat;

        return $this;
    }


}
