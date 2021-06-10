<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FosUser
 *
 * @ORM\Table(name="fos_user", uniqueConstraints={@ORM\UniqueConstraint(name="UNIQ_957A6479C05FB297", columns={"confirmation_token"}), @ORM\UniqueConstraint(name="UNIQ_957A647992FC23A8", columns={"username_canonical"}), @ORM\UniqueConstraint(name="UNIQ_957A6479A0D96FBF", columns={"email_canonical"})})
 * @ORM\Entity
 */
class FosUser
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
     * @ORM\Column(name="username", type="string", length=180, nullable=false)
     */
    private $username;

    /**
     * @var string
     *
     * @ORM\Column(name="username_canonical", type="string", length=180, nullable=false)
     */
    private $usernameCanonical;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=180, nullable=false)
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="email_canonical", type="string", length=180, nullable=false)
     */
    private $emailCanonical;

    /**
     * @var bool
     *
     * @ORM\Column(name="enabled", type="boolean", nullable=false)
     */
    private $enabled;

    /**
     * @var string|null
     *
     * @ORM\Column(name="salt", type="string", length=255, nullable=true)
     */
    private $salt;

    /**
     * @var string
     *
     * @ORM\Column(name="password", type="string", length=255, nullable=false)
     */
    private $password;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="last_login", type="datetime", nullable=true)
     */
    private $lastLogin;

    /**
     * @var string|null
     *
     * @ORM\Column(name="confirmation_token", type="string", length=180, nullable=true)
     */
    private $confirmationToken;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="password_requested_at", type="datetime", nullable=true)
     */
    private $passwordRequestedAt;

    /**
     * @var array
     *
     * @ORM\Column(name="roles", type="array", length=0, nullable=false)
     */
    private $roles;

    /**
     * @var string|null
     *
     * @ORM\Column(name="prenom", type="string", length=145, nullable=true)
     */
    private $prenom;

    /**
     * @var string|null
     *
     * @ORM\Column(name="nom", type="string", length=145, nullable=true)
     */
    private $nom;

    /**
     * @var string|null
     *
     * @ORM\Column(name="telephone", type="string", length=145, nullable=true)
     */
    private $telephone;

    /**
     * @var string|null
     *
     * @ORM\Column(name="source", type="string", length=145, nullable=true)
     */
    private $source;

    /**
     * @var string|null
     *
     * @ORM\Column(name="path_image", type="string", length=255, nullable=true)
     */
    private $pathImage;

    /**
     * @var string|null
     *
     * @ORM\Column(name="file_name", type="string", length=145, nullable=true)
     */
    private $fileName;

    /**
     * @var string|null
     *
     * @ORM\Column(name="fonction", type="string", length=45, nullable=true)
     */
    private $fonction;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="FosGroup", inversedBy="user")
     * @ORM\JoinTable(name="fos_user_group",
     *   joinColumns={
     *     @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="group_id", referencedColumnName="id")
     *   }
     * )
     */
    private $group;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->group = new \Doctrine\Common\Collections\ArrayCollection();
    }

}
