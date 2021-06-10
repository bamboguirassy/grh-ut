<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FosGroup
 *
 * @ORM\Table(name="fos_group", uniqueConstraints={@ORM\UniqueConstraint(name="UNIQ_4B019DDB5E237E06", columns={"name"})})
 * @ORM\Entity
 */
class FosGroup
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
     * @ORM\Column(name="name", type="string", length=180, nullable=false)
     */
    private $name;

    /**
     * @var array
     *
     * @ORM\Column(name="roles", type="array", length=0, nullable=false)
     */
    private $roles;

    /**
     * @var string
     *
     * @ORM\Column(name="code", type="string", length=145, nullable=false)
     */
    private $code;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="FosUser", mappedBy="group")
     */
    private $user;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->user = new \Doctrine\Common\Collections\ArrayCollection();
    }

}
