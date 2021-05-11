-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 11 mai 2021 à 10:50
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `grh_ut_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe` int(11) DEFAULT NULL,
  `ville` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quartier` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` tinyint(1) DEFAULT NULL COMMENT 'plusieurs adresses peuvent être actives en meme temps et les adresses non valables peuvent être désactivées',
  PRIMARY KEY (`id`),
  KEY `fk_adresse_employe1_idx` (`employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `affectation`
--

DROP TABLE IF EXISTS `affectation`;
CREATE TABLE IF NOT EXISTS `affectation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe_id` int(11) NOT NULL,
  `structure_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `motif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poste` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F4DD61D31B65292` (`employe_id`),
  KEY `IDX_F4DD61D32534008B` (`structure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `caisse_sociale`
--

DROP TABLE IF EXISTS `caisse_sociale`;
CREATE TABLE IF NOT EXISTS `caisse_sociale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(245) NOT NULL,
  `code` varchar(45) NOT NULL,
  `filename` varchar(145) DEFAULT NULL,
  `filepath` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `caisse_sociale`
--

INSERT INTO `caisse_sociale` (`id`, `nom`, `code`, `filename`, `filepath`) VALUES
(1, 'Fond National de Retraite', 'FNR', NULL, NULL),
(4, 'Institut de Prévoyance Retraite du Sénégal', 'IPRES', '5f5e4e0722b58.jpeg', 'http://127.0.0.1:8000/uploads/caissesociale/5f5e4e0722b58.jpeg'),
(5, 'Caisse de Sécurité Sociale', 'CSS', '5f5e4e1b339f1.jpeg', 'http://127.0.0.1:8000/uploads/caissesociale/5f5e4e1b339f1.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_contrat_id` int(11) NOT NULL,
  `employe_id` int(11) NOT NULL,
  `duree_en_mois` int(11) DEFAULT NULL,
  `etat` tinyint(1) NOT NULL,
  `date_rupture` date DEFAULT NULL,
  `motif_rupture` longtext DEFAULT NULL,
  `expire` tinyint(1) DEFAULT NULL,
  `rompu` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_60349993520D03A` (`type_contrat_id`),
  KEY `IDX_603499931B65292` (`employe_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
CREATE TABLE IF NOT EXISTS `diplome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `diplome`
--

INSERT INTO `diplome` (`id`, `nom`) VALUES
(1, 'LICENCE'),
(2, 'MASTER');

-- --------------------------------------------------------

--
-- Structure de la table `diplome_employe`
--

DROP TABLE IF EXISTS `diplome_employe`;
CREATE TABLE IF NOT EXISTS `diplome_employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe_id` int(11) NOT NULL,
  `diplome_id` int(11) NOT NULL,
  `annee_obtention` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etablissement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B219CA7B1B65292` (`employe_id`),
  KEY `IDX_B219CA7B26F859E2` (`diplome_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `diplome_employe`
--

INSERT INTO `diplome_employe` (`id`, `employe_id`, `diplome_id`, `annee_obtention`, `etablissement`) VALUES
(1, 1, 1, '2015', 'UIDT'),
(2, 1, 1, '2015', 'UCAD');

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe` int(11) DEFAULT NULL,
  `type_document` int(11) DEFAULT NULL,
  `nom` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_employe1_idx` (`employe`),
  KEY `fk_document_type_document1_idx` (`type_document`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`id`, `employe`, `type_document`, `nom`, `filename`, `filepath`) VALUES
(1, 1, 1, 'photo d\'identité', '60337d8f787c0.jpeg', 'http://127.0.0.1:8000/uploads/employe/document/60337d8f787c0.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caisse_sociale` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `mutuelle_sante` int(11) DEFAULT NULL,
  `nationalite` int(11) DEFAULT NULL,
  `type_employe` int(11) DEFAULT NULL,
  `prenoms` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cni` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricule` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricule_caisse_sociale` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_recrutement` date NOT NULL,
  `situtation_matrimoniale` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retraite` tinyint(1) DEFAULT NULL COMMENT 'true ou false, false par defaut',
  `genre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Homme ou Femme',
  `etat` tinyint(1) DEFAULT NULL COMMENT 'true ou false pur indiquer si l''employé est toujours actif',
  `email_univ` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(145) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filepath` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_primaire` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone_secondaire` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `date_prise_service` date DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `motif_sortie` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_main_oeuvre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employe_mutuelle_sante1_idx` (`mutuelle_sante`),
  KEY `fk_employe_pays1_idx` (`nationalite`),
  KEY `fk_employe_caisse_sociale1_idx` (`caisse_sociale`),
  KEY `fk_employe_grade1_idx` (`grade`),
  KEY `fk_employe_type_employe1_idx` (`type_employe`),
  KEY `IDX_F804D3B9FDEF8996` (`profession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `retraite`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`) VALUES
(1, 5, NULL, 1, 193, 2, 'Moussa', 'FOFANA', '1993-06-03', 'Didé Gassama', '1916200200225', '120254/B', NULL, '2018-05-02', 'Marié(e)', 0, 'Masculin', 1, 'moussa.fofana@univ-thies.sn', 'didegassama@gmail.com', NULL, NULL, '+221780165026', '+221762339081', NULL, '2020-04-27', NULL, NULL, '123598669'),
(2, 1, NULL, 1, 193, 1, 'Moussa Déthié', 'Sarr', '1983-10-10', 'Mékhé', '1916198300220', '112154/C', NULL, '2016-08-16', 'Marié(e)', 0, 'Masculin', 1, 'mdsarr@univ-thies.sn', NULL, NULL, NULL, '775762332', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, NULL, 1, 193, 2, 'Madiba', 'DIAKITE', '1989-05-01', 'Touba', '4558999', '256669', '235668', '2019-05-01', 'Célibataire', 0, 'Masculin', 1, 'oumourouen@gmail.com', 'oumourouen@gmail.com', NULL, NULL, '0613892385', NULL, NULL, '2019-05-10', NULL, NULL, '458899');

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(145) NOT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `rang` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`id`, `nom`, `etat`, `rang`) VALUES
(1, 'Assistante SG', NULL, 0),
(2, 'Chef du service juridique', NULL, 0),
(3, 'Chauffeur', NULL, 0),
(4, 'Directrice de la Communication, du Marketing et de l\'Audiovisuel', NULL, 0),
(5, 'Standardiste', NULL, 0),
(6, 'SAU', NULL, 0),
(7, 'Agent de service', NULL, 0),
(8, 'DRHF', NULL, 0),
(9, 'Chef de bureau Sécurité', NULL, 0),
(10, 'Chef de bureau soldes et dépenses de personnel', NULL, 0),
(11, 'Chef de Bureau/comptabilité', NULL, 0),
(12, 'Secrétaire Général', NULL, 0),
(13, 'Chef de service aux étudiants', NULL, 0),
(14, 'Caissière Principale', NULL, 0),
(15, 'Chef de Division PATS', NULL, 0),
(16, 'Assistante ACP', NULL, 0),
(17, 'Comptable', NULL, 0),
(18, 'ACP', NULL, 0),
(19, 'Controleur de Gestion', NULL, 0),
(20, 'Directrice Bibliothéque', NULL, 0),
(21, 'Assistante de Direction', NULL, 0),
(22, 'Electricien', NULL, 0),
(23, 'Assistante Recteur', NULL, 0),
(24, 'Chef de Division CDP', NULL, 0),
(25, 'AAU', NULL, 0),
(26, 'DFC', NULL, 0),
(27, 'Chef de Division Marketing', NULL, 0),
(28, 'Chargé du bureau  d\'accueil', NULL, 0),
(29, 'Responsable Approvisionnement', NULL, 0),
(30, 'Comptable Matières', NULL, 0),
(31, 'Médecin', NULL, 0),
(32, 'Chef de Division Vie Universitaire', NULL, 0),
(33, 'Archiviste', NULL, 0),
(34, 'Documentaliste', NULL, 0),
(35, 'Reprographe', NULL, 0),
(36, 'Vaguemestre', NULL, 0),
(37, 'Agent de liaison', NULL, 0),
(38, 'Assistante', NULL, 0),
(39, 'Secrétaire', NULL, 0),
(40, 'infirmière', NULL, 0),
(41, 'Technicienne informaticienne', NULL, 0),
(42, 'Technicien Informaticien', NULL, 0),
(43, 'Chef de Division Développement et Innovations Technologiques', NULL, 0),
(44, 'Directeur DSOS', NULL, 0),
(45, 'CSA BC', NULL, 0),
(46, 'Assistant social', NULL, 0),
(47, 'Conservateur', NULL, 0),
(48, 'secrétaire d\'Administration Universitaire', NULL, 0),
(49, 'Agent administratif', NULL, 0),
(50, 'Chef de service scolarité', NULL, 0),
(51, 'CSA', NULL, 0),
(52, 'Secrétaire de Direction', NULL, 0),
(53, 'Chef de service financier', NULL, 0),
(54, 'CSA UFR SES', NULL, 0),
(55, 'Technicien supérieur', NULL, 0),
(56, 'Secrétaire bureautique', NULL, 0),
(57, 'Chef Service Scolarité', NULL, 0),
(58, 'Secrétaire sténodactylo', NULL, 0),
(59, 'Aide Comptable', NULL, 0),
(60, 'Rénéotipyste', NULL, 0),
(61, 'Chef de service Bibliothèque', NULL, 0),
(62, 'Chef Scolarité', NULL, 0),
(63, 'Technicien de laboratoire', NULL, 0),
(64, 'Chef des services administratifs', NULL, 0),
(65, 'Chef de Scolarité', NULL, 0),
(66, 'Chef du Service des Finances', NULL, 0),
(67, 'Technicien en Maintenance', NULL, 0),
(68, 'Bibliothécaire', NULL, 0),
(69, 'Ouvrier agricole', NULL, 0),
(70, 'Technicien horticole', NULL, 0),
(71, 'Mécanicien', NULL, 0),
(72, 'Menuisier bois', NULL, 0),
(73, 'Manœuvre', NULL, 0),
(74, 'Femme de ménage', NULL, 0),
(75, 'Menuisier métallique', NULL, 0),
(76, 'Gardien', NULL, 0),
(77, 'Commis d’administration', NULL, 0),
(78, 'Jardinier', NULL, 0),
(79, 'Berger', NULL, 0),
(80, 'SECRETAIRE DACTYLO', NULL, 0),
(81, 'AIDE INFIRMIERE', NULL, 0),
(82, 'COMPTABLE MATIERE', NULL, 0),
(83, 'COMMIS D\'ADMINISTRATION', NULL, 0),
(84, 'INFIRMIER', NULL, 0),
(85, 'INFIRMIERE D\'ETAT', NULL, 0),
(86, 'PLOMBIER', NULL, 0),
(87, 'INFORMATICIEN', NULL, 0),
(88, 'TECHNICIENNE SUPERIEURE', NULL, 0),
(89, 'Employé d\'Administration', NULL, 0),
(90, 'Chef de service finances', NULL, 0),
(91, 'Professeur Titulaire', NULL, 0),
(92, 'Professeur assimilé', NULL, 0),
(93, 'Maitre de Conférences titulaire', NULL, 0),
(94, 'Assistant', NULL, 0),
(95, 'Maître de Conférences assimilé', NULL, 0),
(96, 'Professeur technique', NULL, 0),
(97, 'Directeur', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `fonction_employe`
--

DROP TABLE IF EXISTS `fonction_employe`;
CREATE TABLE IF NOT EXISTS `fonction_employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe` int(11) DEFAULT NULL,
  `fonction` int(11) DEFAULT NULL,
  `structure` int(11) DEFAULT NULL,
  `date_prise_fonction` date NOT NULL,
  `etat` tinyint(1) DEFAULT NULL COMMENT 'true ou false pour savoir si la fonction est toujours d''actualité Donner la possibilité de définir une fonction comme étant la courante',
  `date_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fonction_employe_employe1_idx` (`employe`),
  KEY `fk_fonction_employe_fonction1_idx` (`fonction`),
  KEY `fk_fonction_employe_structure1_idx` (`structure`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fonction_employe`
--

INSERT INTO `fonction_employe` (`id`, `employe`, `fonction`, `structure`, `date_prise_fonction`, `etat`, `date_fin`) VALUES
(1, 1, 87, 3, '2018-05-02', 1, NULL),
(3, 1, 91, 3, '2020-04-01', 1, NULL),
(4, 1, 88, 3, '2020-05-01', 0, '2021-05-08'),
(5, 1, 87, 3, '2020-05-01', 1, NULL),
(6, 1, 1, 1, '2021-05-01', 1, NULL),
(8, 1, 3, 2, '2021-04-25', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fos_group`
--

DROP TABLE IF EXISTS `fos_group`;
CREATE TABLE IF NOT EXISTS `fos_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `code` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4B019DDB5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fos_group`
--

INSERT INTO `fos_group` (`id`, `name`, `roles`, `code`) VALUES
(1, 'Super Administrateur', 'a:156:{i:0;s:17:\"ROLE_GROUP_CREATE\";i:1;s:16:\"ROLE_GROUP_INDEX\";i:2;s:15:\"ROLE_GROUP_SHOW\";i:3;s:16:\"ROLE_GROUP_CLONE\";i:4;s:17:\"ROLE_GROUP_DELETE\";i:5;s:15:\"ROLE_GROUP_EDIT\";i:6;s:16:\"ROLE_USER_CREATE\";i:7;s:15:\"ROLE_USER_INDEX\";i:8;s:14:\"ROLE_USER_SHOW\";i:9;s:15:\"ROLE_USER_CLONE\";i:10;s:16:\"ROLE_USER_DELETE\";i:11;s:14:\"ROLE_USER_EDIT\";i:12;s:22:\"ROLE_TYPEENTITE_CREATE\";i:13;s:21:\"ROLE_TYPEENTITE_INDEX\";i:14;s:20:\"ROLE_TYPEENTITE_SHOW\";i:15;s:21:\"ROLE_TYPEENTITE_CLONE\";i:16;s:22:\"ROLE_TYPEENTITE_DELETE\";i:17;s:20:\"ROLE_TYPEENTITE_EDIT\";i:18;s:24:\"ROLE_TYPEDOCUMENT_CREATE\";i:19;s:23:\"ROLE_TYPEDOCUMENT_INDEX\";i:20;s:22:\"ROLE_TYPEDOCUMENT_SHOW\";i:21;s:23:\"ROLE_TYPEDOCUMENT_CLONE\";i:22;s:24:\"ROLE_TYPEDOCUMENT_DELETE\";i:23;s:22:\"ROLE_TYPEDOCUMENT_EDIT\";i:24;s:23:\"ROLE_TYPECONTRAT_CREATE\";i:25;s:22:\"ROLE_TYPECONTRAT_INDEX\";i:26;s:21:\"ROLE_TYPECONTRAT_SHOW\";i:27;s:22:\"ROLE_TYPECONTRAT_CLONE\";i:28;s:23:\"ROLE_TYPECONTRAT_DELETE\";i:29;s:21:\"ROLE_TYPECONTRAT_EDIT\";i:30;s:20:\"ROLE_FONCTION_CREATE\";i:31;s:19:\"ROLE_FONCTION_INDEX\";i:32;s:18:\"ROLE_FONCTION_SHOW\";i:33;s:19:\"ROLE_FONCTION_CLONE\";i:34;s:20:\"ROLE_FONCTION_DELETE\";i:35;s:18:\"ROLE_FONCTION_EDIT\";i:36;s:16:\"ROLE_PAYS_CREATE\";i:37;s:15:\"ROLE_PAYS_INDEX\";i:38;s:14:\"ROLE_PAYS_SHOW\";i:39;s:15:\"ROLE_PAYS_CLONE\";i:40;s:16:\"ROLE_PAYS_DELETE\";i:41;s:14:\"ROLE_PAYS_EDIT\";i:42;s:25:\"ROLE_CAISSESOCIALE_CREATE\";i:43;s:24:\"ROLE_CAISSESOCIALE_INDEX\";i:44;s:23:\"ROLE_CAISSESOCIALE_SHOW\";i:45;s:24:\"ROLE_CAISSESOCIALE_CLONE\";i:46;s:25:\"ROLE_CAISSESOCIALE_DELETE\";i:47;s:23:\"ROLE_CAISSESOCIALE_EDIT\";i:48;s:25:\"ROLE_MUTUELLESANTE_CREATE\";i:49;s:24:\"ROLE_MUTUELLESANTE_INDEX\";i:50;s:23:\"ROLE_MUTUELLESANTE_SHOW\";i:51;s:24:\"ROLE_MUTUELLESANTE_CLONE\";i:52;s:25:\"ROLE_MUTUELLESANTE_DELETE\";i:53;s:23:\"ROLE_MUTUELLESANTE_EDIT\";i:54;s:23:\"ROLE_TYPEEMPLOYE_CREATE\";i:55;s:22:\"ROLE_TYPEEMPLOYE_INDEX\";i:56;s:21:\"ROLE_TYPEEMPLOYE_SHOW\";i:57;s:22:\"ROLE_TYPEEMPLOYE_CLONE\";i:58;s:23:\"ROLE_TYPEEMPLOYE_DELETE\";i:59;s:21:\"ROLE_TYPEEMPLOYE_EDIT\";i:60;s:21:\"ROLE_STRUCTURE_CREATE\";i:61;s:20:\"ROLE_STRUCTURE_INDEX\";i:62;s:19:\"ROLE_STRUCTURE_SHOW\";i:63;s:20:\"ROLE_STRUCTURE_CLONE\";i:64;s:21:\"ROLE_STRUCTURE_DELETE\";i:65;s:19:\"ROLE_STRUCTURE_EDIT\";i:66;s:20:\"ROLE_SYNDICAT_CREATE\";i:67;s:19:\"ROLE_SYNDICAT_INDEX\";i:68;s:18:\"ROLE_SYNDICAT_SHOW\";i:69;s:19:\"ROLE_SYNDICAT_CLONE\";i:70;s:20:\"ROLE_SYNDICAT_DELETE\";i:71;s:18:\"ROLE_SYNDICAT_EDIT\";i:72;s:22:\"ROLE_PROFESSION_CREATE\";i:73;s:21:\"ROLE_PROFESSION_INDEX\";i:74;s:20:\"ROLE_PROFESSION_SHOW\";i:75;s:22:\"ROLE_PROFESSION_DELETE\";i:76;s:20:\"ROLE_PROFESSION_EDIT\";i:77;s:19:\"ROLE_DIPLOME_CREATE\";i:78;s:18:\"ROLE_DIPLOME_INDEX\";i:79;s:17:\"ROLE_DIPLOME_SHOW\";i:80;s:18:\"ROLE_DIPLOME_CLONE\";i:81;s:19:\"ROLE_DIPLOME_DELETE\";i:82;s:17:\"ROLE_DIPLOME_EDIT\";i:83;s:17:\"ROLE_GRADE_CREATE\";i:84;s:16:\"ROLE_GRADE_INDEX\";i:85;s:15:\"ROLE_GRADE_SHOW\";i:86;s:16:\"ROLE_GRADE_CLONE\";i:87;s:17:\"ROLE_GRADE_DELETE\";i:88;s:15:\"ROLE_GRADE_EDIT\";i:89;s:19:\"ROLE_GCLASSE_CREATE\";i:90;s:18:\"ROLE_GCLASSE_INDEX\";i:91;s:17:\"ROLE_GCLASSE_SHOW\";i:92;s:19:\"ROLE_GCLASSE_DELETE\";i:93;s:17:\"ROLE_GCLASSE_EDIT\";i:94;s:22:\"ROLE_GCATEGORIE_CREATE\";i:95;s:21:\"ROLE_GCATEGORIE_INDEX\";i:96;s:20:\"ROLE_GCATEGORIE_SHOW\";i:97;s:22:\"ROLE_GCATEGORIE_DELETE\";i:98;s:20:\"ROLE_GCATEGORIE_EDIT\";i:99;s:19:\"ROLE_GNIVEAU_CREATE\";i:100;s:18:\"ROLE_GNIVEAU_INDEX\";i:101;s:17:\"ROLE_GNIVEAU_SHOW\";i:102;s:19:\"ROLE_GNIVEAU_DELETE\";i:103;s:17:\"ROLE_GNIVEAU_EDIT\";i:104;s:20:\"ROLE_GECHELON_CREATE\";i:105;s:19:\"ROLE_GECHELON_INDEX\";i:106;s:18:\"ROLE_GECHELON_SHOW\";i:107;s:20:\"ROLE_GECHELON_DELETE\";i:108;s:18:\"ROLE_GECHELON_EDIT\";i:109;s:25:\"ROLE_ECHELONCLASSE_CREATE\";i:110;s:24:\"ROLE_ECHELONCLASSE_INDEX\";i:111;s:23:\"ROLE_ECHELONCLASSE_SHOW\";i:112;s:25:\"ROLE_ECHELONCLASSE_DELETE\";i:113;s:23:\"ROLE_ECHELONCLASSE_EDIT\";i:114;s:19:\"ROLE_EMPLOYE_CREATE\";i:115;s:18:\"ROLE_EMPLOYE_INDEX\";i:116;s:17:\"ROLE_EMPLOYE_SHOW\";i:117;s:18:\"ROLE_EMPLOYE_CLONE\";i:118;s:19:\"ROLE_EMPLOYE_DELETE\";i:119;s:17:\"ROLE_EMPLOYE_EDIT\";i:120;s:19:\"ROLE_ADRESSE_CREATE\";i:121;s:18:\"ROLE_ADRESSE_INDEX\";i:122;s:17:\"ROLE_ADRESSE_SHOW\";i:123;s:18:\"ROLE_ADRESSE_CLONE\";i:124;s:19:\"ROLE_ADRESSE_DELETE\";i:125;s:17:\"ROLE_ADRESSE_EDIT\";i:126;s:25:\"ROLE_MEMBREFAMILLE_CREATE\";i:127;s:24:\"ROLE_MEMBREFAMILLE_INDEX\";i:128;s:23:\"ROLE_MEMBREFAMILLE_SHOW\";i:129;s:24:\"ROLE_MEMBREFAMILLE_CLONE\";i:130;s:25:\"ROLE_MEMBREFAMILLE_DELETE\";i:131;s:23:\"ROLE_MEMBREFAMILLE_EDIT\";i:132;s:26:\"ROLE_MEMBRESYNDICAT_CREATE\";i:133;s:25:\"ROLE_MEMBRESYNDICAT_INDEX\";i:134;s:24:\"ROLE_MEMBRESYNDICAT_SHOW\";i:135;s:25:\"ROLE_MEMBRESYNDICAT_CLONE\";i:136;s:26:\"ROLE_MEMBRESYNDICAT_DELETE\";i:137;s:24:\"ROLE_MEMBRESYNDICAT_EDIT\";i:138;s:20:\"ROLE_DOCUMENT_CREATE\";i:139;s:19:\"ROLE_DOCUMENT_INDEX\";i:140;s:18:\"ROLE_DOCUMENT_SHOW\";i:141;s:19:\"ROLE_DOCUMENT_CLONE\";i:142;s:20:\"ROLE_DOCUMENT_DELETE\";i:143;s:18:\"ROLE_DOCUMENT_EDIT\";i:144;s:27:\"ROLE_FONCTIONEMPLOYE_CREATE\";i:145;s:26:\"ROLE_FONCTIONEMPLOYE_INDEX\";i:146;s:25:\"ROLE_FONCTIONEMPLOYE_SHOW\";i:147;s:26:\"ROLE_FONCTIONEMPLOYE_CLONE\";i:148;s:27:\"ROLE_FONCTIONEMPLOYE_DELETE\";i:149;s:25:\"ROLE_FONCTIONEMPLOYE_EDIT\";i:150;s:26:\"ROLE_DIPLOMEEMPLOYE_CREATE\";i:151;s:25:\"ROLE_DIPLOMEEMPLOYE_INDEX\";i:152;s:24:\"ROLE_DIPLOMEEMPLOYE_SHOW\";i:153;s:25:\"ROLE_DIPLOMEEMPLOYE_CLONE\";i:154;s:26:\"ROLE_DIPLOMEEMPLOYE_DELETE\";i:155;s:24:\"ROLE_DIPLOMEEMPLOYE_EDIT\";}', 'SA'),
(2, 'Directrice des Ressources Humaines', 'a:60:{i:0;s:17:\"ROLE_GROUP_CREATE\";i:1;s:16:\"ROLE_GROUP_INDEX\";i:2;s:15:\"ROLE_GROUP_SHOW\";i:3;s:16:\"ROLE_USER_CREATE\";i:4;s:15:\"ROLE_USER_INDEX\";i:5;s:14:\"ROLE_USER_SHOW\";i:6;s:25:\"ROLE_CAISSESOCIALE_CREATE\";i:7;s:24:\"ROLE_CAISSESOCIALE_INDEX\";i:8;s:23:\"ROLE_CAISSESOCIALE_SHOW\";i:9;s:25:\"ROLE_CAISSESOCIALE_DELETE\";i:10;s:23:\"ROLE_CAISSESOCIALE_EDIT\";i:11;s:25:\"ROLE_MUTUELLESANTE_CREATE\";i:12;s:24:\"ROLE_MUTUELLESANTE_INDEX\";i:13;s:23:\"ROLE_MUTUELLESANTE_SHOW\";i:14;s:25:\"ROLE_MUTUELLESANTE_DELETE\";i:15;s:23:\"ROLE_MUTUELLESANTE_EDIT\";i:16;s:21:\"ROLE_STRUCTURE_CREATE\";i:17;s:20:\"ROLE_STRUCTURE_INDEX\";i:18;s:19:\"ROLE_STRUCTURE_SHOW\";i:19;s:21:\"ROLE_STRUCTURE_DELETE\";i:20;s:19:\"ROLE_STRUCTURE_EDIT\";i:21;s:20:\"ROLE_SYNDICAT_CREATE\";i:22;s:19:\"ROLE_SYNDICAT_INDEX\";i:23;s:18:\"ROLE_SYNDICAT_SHOW\";i:24;s:18:\"ROLE_SYNDICAT_EDIT\";i:25;s:17:\"ROLE_GRADE_CREATE\";i:26;s:16:\"ROLE_GRADE_INDEX\";i:27;s:15:\"ROLE_GRADE_SHOW\";i:28;s:17:\"ROLE_GRADE_DELETE\";i:29;s:15:\"ROLE_GRADE_EDIT\";i:30;s:19:\"ROLE_EMPLOYE_CREATE\";i:31;s:18:\"ROLE_EMPLOYE_INDEX\";i:32;s:17:\"ROLE_EMPLOYE_SHOW\";i:33;s:19:\"ROLE_EMPLOYE_DELETE\";i:34;s:17:\"ROLE_EMPLOYE_EDIT\";i:35;s:19:\"ROLE_ADRESSE_CREATE\";i:36;s:18:\"ROLE_ADRESSE_INDEX\";i:37;s:17:\"ROLE_ADRESSE_SHOW\";i:38;s:19:\"ROLE_ADRESSE_DELETE\";i:39;s:17:\"ROLE_ADRESSE_EDIT\";i:40;s:25:\"ROLE_MEMBREFAMILLE_CREATE\";i:41;s:24:\"ROLE_MEMBREFAMILLE_INDEX\";i:42;s:23:\"ROLE_MEMBREFAMILLE_SHOW\";i:43;s:25:\"ROLE_MEMBREFAMILLE_DELETE\";i:44;s:23:\"ROLE_MEMBREFAMILLE_EDIT\";i:45;s:26:\"ROLE_MEMBRESYNDICAT_CREATE\";i:46;s:25:\"ROLE_MEMBRESYNDICAT_INDEX\";i:47;s:24:\"ROLE_MEMBRESYNDICAT_SHOW\";i:48;s:26:\"ROLE_MEMBRESYNDICAT_DELETE\";i:49;s:24:\"ROLE_MEMBRESYNDICAT_EDIT\";i:50;s:20:\"ROLE_DOCUMENT_CREATE\";i:51;s:19:\"ROLE_DOCUMENT_INDEX\";i:52;s:18:\"ROLE_DOCUMENT_SHOW\";i:53;s:20:\"ROLE_DOCUMENT_DELETE\";i:54;s:18:\"ROLE_DOCUMENT_EDIT\";i:55;s:27:\"ROLE_FONCTIONEMPLOYE_CREATE\";i:56;s:26:\"ROLE_FONCTIONEMPLOYE_INDEX\";i:57;s:25:\"ROLE_FONCTIONEMPLOYE_SHOW\";i:58;s:27:\"ROLE_FONCTIONEMPLOYE_DELETE\";i:59;s:25:\"ROLE_FONCTIONEMPLOYE_EDIT\";}', 'DRH');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `prenom` varchar(145) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(145) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(145) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(145) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(145) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fonction` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `prenom`, `nom`, `telephone`, `source`, `path_image`, `file_name`, `fonction`) VALUES
(1, 'bamboguirassy', 'bamboguirassy', 'didegassama@gmail.com', 'didegassama@gmail.com', 1, 'Z/gyBaBwxhKdslRLxGEGISo2d1Ri9rQZV2rRXUJrFk4', '$2y$13$NtjJGxfgCmKZg92USbU1DezMcJJ/QQG1Pu3t.gRdhT2TI72Dfcg3m', '2021-02-24 12:21:39', NULL, NULL, 'a:0:{}', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 1, 'xiAQMhJrdX/dcHEd8UHmhDYCWZSdydnTofkyJm316TM', '$2y$13$tLQYO6efpj1AEeGkUVbkbO1/UWJebSAp8KVMcm98Sfy17cs8XQFfO', '2021-05-02 13:39:09', 'f474311a869aa7697c690125d85b9ecd', '2020-09-13 13:37:57', 'a:0:{}', 'Moussa', 'Fofana', '780165026', 'sm', 'http://127.0.0.1:8000/uploads/user/profil/5f5e20b5d03fc.jpeg', '5f5e20b5d03fc.jpeg', 'Chef de Projet - CDD'),
(3, 'codend', 'codend', 'elhadjicode.ndiaye@univ-thies.sn', 'elhadjicode.ndiaye@univ-thies.sn', 1, 'aok2akB/jXOPsEtdmxkxtlauzqayHRxhdVEXGwpnOPo', '$2y$13$tLQYO6efpj1AEeGkUVbkbO1/UWJebSAp8KVMcm98Sfy17cs8XQFfO', '2021-05-11 10:46:14', NULL, NULL, 'a:2:{i:0;s:16:\"ROLE_GROUP_INDEX\";i:1;s:17:\"ROLE_GROUP_CREATE\";}', 'El Hadji', 'NDIAYE', '774093789', 'sm', 'http://127.0.0.1:8000/uploads/user/profil/608eabdd36614.png', '608eabdd36614.png', 'FD');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_group`
--

DROP TABLE IF EXISTS `fos_user_group`;
CREATE TABLE IF NOT EXISTS `fos_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_583D1F3EA76ED395` (`user_id`),
  KEY `IDX_583D1F3EFE54D947` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fos_user_group`
--

INSERT INTO `fos_user_group` (`user_id`, `group_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `gcategorie`
--

DROP TABLE IF EXISTS `gcategorie`;
CREATE TABLE IF NOT EXISTS `gcategorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suivant_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indice` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7FC5B5E59C2BB0CC` (`suivant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gclasse`
--

DROP TABLE IF EXISTS `gclasse`;
CREATE TABLE IF NOT EXISTS `gclasse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suivant_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indice` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordre` int(11) NOT NULL,
  `type_employe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ED38B3209C2BB0CC` (`suivant_id`),
  KEY `IDX_ED38B320D025BC4C` (`type_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gclasse_gcategorie`
--

DROP TABLE IF EXISTS `gclasse_gcategorie`;
CREATE TABLE IF NOT EXISTS `gclasse_gcategorie` (
  `gclasse_id` int(11) NOT NULL,
  `gcategorie_id` int(11) NOT NULL,
  PRIMARY KEY (`gclasse_id`,`gcategorie_id`),
  KEY `IDX_72EFA80AB9E6C6D8` (`gclasse_id`),
  KEY `IDX_72EFA80ABBD4BBC6` (`gcategorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gclasse_gniveau`
--

DROP TABLE IF EXISTS `gclasse_gniveau`;
CREATE TABLE IF NOT EXISTS `gclasse_gniveau` (
  `gclasse_id` int(11) NOT NULL,
  `gniveau_id` int(11) NOT NULL,
  PRIMARY KEY (`gclasse_id`,`gniveau_id`),
  KEY `IDX_8DAEAF65B9E6C6D8` (`gclasse_id`),
  KEY `IDX_8DAEAF653D86FF50` (`gniveau_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gechelon`
--

DROP TABLE IF EXISTS `gechelon`;
CREATE TABLE IF NOT EXISTS `gechelon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suivant_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indice` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_44FA5AB39C2BB0CC` (`suivant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gniveau`
--

DROP TABLE IF EXISTS `gniveau`;
CREATE TABLE IF NOT EXISTS `gniveau` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suivant_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indice` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2960FFDD9C2BB0CC` (`suivant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classification` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `echelon_id` int(11) NOT NULL,
  `niveau_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `membre_famille`
--

DROP TABLE IF EXISTS `membre_famille`;
CREATE TABLE IF NOT EXISTS `membre_famille` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe` int(11) DEFAULT NULL,
  `prenoms` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Homme ou Femme',
  `lien_parente` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'enfant, epoux',
  `telephone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_membre_famille_employe1_idx` (`employe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `membre_famille`
--

INSERT INTO `membre_famille` (`id`, `employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `genre`, `lien_parente`, `telephone`) VALUES
(1, 1, 'Aminata', 'Samb', '1991-11-11', 'Thiès', 'Femme', 'épouse', '+221773509313'),
(2, 1, 'Hawa', 'Fofana', '2019-05-01', 'Thiès', 'Femme', 'fille', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `membre_syndicat`
--

DROP TABLE IF EXISTS `membre_syndicat`;
CREATE TABLE IF NOT EXISTS `membre_syndicat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe` int(11) DEFAULT NULL,
  `syndicat` int(11) DEFAULT NULL,
  `date_enregistrement` date NOT NULL,
  `etat` tinyint(1) DEFAULT NULL COMMENT 'true si c''est le syndicat actuel du travailleur\r\n        un employé peut être dans plusieurs syndicats',
  PRIMARY KEY (`id`),
  KEY `fk_membre_syndicat_syndicat1_idx` (`syndicat`),
  KEY `fk_membre_syndicat_employe1_idx` (`employe`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `membre_syndicat`
--

INSERT INTO `membre_syndicat` (`id`, `employe`, `syndicat`, `date_enregistrement`, `etat`) VALUES
(1, 1, 2, '2018-12-12', 1);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200913161247', '2020-09-13 16:12:55'),
('20200913162947', '2020-09-13 16:30:11'),
('20210222092238', '2021-02-22 09:23:23'),
('20210505110513', '2021-05-06 12:53:55'),
('20210505142059', '2021-05-06 12:53:56'),
('20210505234143', '2021-05-06 00:00:00'),
('20210507081856', '2021-05-06 00:00:00'),
('20210507091025', '2021-05-07 09:10:39'),
('20210507100246', '2021-05-07 10:04:48'),
('20210507120628', '2021-05-08 21:59:02'),
('20210507124006', '2021-05-08 21:59:03'),
('20210507130404', '2021-05-07 00:00:00'),
('20210509140901', '2021-05-09 14:09:18'),
('20210510085457', '2021-05-09 00:00:00'),
('20210510141347', '2021-05-09 00:00:00'),
('20210510143616', '2021-05-10 16:29:30'),
('20210510143722', '2021-05-10 16:31:00'),
('20210510144259', '2021-05-10 16:31:03'),
('20210510155714', '2021-05-10 00:00:00'),
('20210511001047', '2021-05-11 00:11:03'),
('20210511083043', '2021-05-11 10:20:18');

-- --------------------------------------------------------

--
-- Structure de la table `mutuelle_sante`
--

DROP TABLE IF EXISTS `mutuelle_sante`;
CREATE TABLE IF NOT EXISTS `mutuelle_sante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(245) NOT NULL,
  `code` varchar(45) NOT NULL,
  `filename` varchar(145) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mutuelle_sante`
--

INSERT INTO `mutuelle_sante` (`id`, `nom`, `code`, `filename`, `filepath`) VALUES
(1, 'Mutuelle de Santé des Agents de l\'Etat', 'MSAE', '5f5e4c27e1e97.jpeg', 'http://127.0.0.1:8000/uploads/mutuellesante/5f5e4c27e1e97.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(3) NOT NULL,
  `alpha2` varchar(2) NOT NULL,
  `alpha3` varchar(3) NOT NULL,
  `nom_en_gb` varchar(45) NOT NULL,
  `nom_fr_fr` varchar(45) NOT NULL,
  `nationalite` varchar(95) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `code`, `alpha2`, `alpha3`, `nom_en_gb`, `nom_fr_fr`, `nationalite`) VALUES
(1, 4, 'AF', 'AFG', 'Afghanistan', 'Afghanistan', 'Afghan'),
(2, 8, 'AL', 'ALB', 'Albania', 'Albanie', 'Albanais'),
(3, 10, 'AQ', 'ATA', 'Antarctica', 'Antarctique', ''),
(4, 12, 'DZ', 'DZA', 'Algeria', 'Algérie', 'Algérien'),
(5, 16, 'AS', 'ASM', 'American Samoa', 'Samoa Américaines', 'Samoa americain'),
(6, 20, 'AD', 'AND', 'Andorra', 'Andorre', 'Andorran'),
(7, 24, 'AO', 'AGO', 'Angola', 'Angola', 'Angolais'),
(8, 28, 'AG', 'ATG', 'Antigua and Barbuda', 'Antigua-et-Barbuda', ''),
(9, 31, 'AZ', 'AZE', 'Azerbaijan', 'Azerbaïdjan', 'azerbaïdjanaise'),
(10, 32, 'AR', 'ARG', 'Argentina', 'Argentine', 'argentin'),
(11, 36, 'AU', 'AUS', 'Australia', 'Australie', 'Australien'),
(12, 40, 'AT', 'AUT', 'Austria', 'Autriche', 'Autrichien'),
(13, 44, 'BS', 'BHS', 'Bahamas', 'Bahamas', 'Bahaméen'),
(14, 48, 'BH', 'BHR', 'Bahrain', 'Bahreïn', 'Bahrein'),
(15, 50, 'BD', 'BGD', 'Bangladesh', 'Bangladesh', 'Bangladais'),
(16, 51, 'AM', 'ARM', 'Armenia', 'Arménie', 'Arménien'),
(17, 52, 'BB', 'BRB', 'Barbados', 'Barbade', 'Barbaéen'),
(18, 56, 'BE', 'BEL', 'Belgium', 'Belgique', 'Belge'),
(19, 60, 'BM', 'BMU', 'Bermuda', 'Bermudes', 'Bermuéen'),
(20, 64, 'BT', 'BTN', 'Bhutan', 'Bhoutan', 'Bhutaéen'),
(21, 68, 'BO', 'BOL', 'Bolivia', 'Bolivie', 'Bolivien'),
(22, 70, 'BA', 'BIH', 'Bosnia and Herzegovina', 'Bosnie-Herzégovine', 'Bosniéen'),
(23, 72, 'BW', 'BWA', 'Botswana', 'Botswana', 'Botswanais'),
(24, 74, 'BV', 'BVT', 'Bouvet Island', 'Île Bouvet', 'Bouveéen'),
(25, 76, 'BR', 'BRA', 'Brazil', 'Brésil', 'Brésilien'),
(26, 84, 'BZ', 'BLZ', 'Belize', 'Belize', 'Belizéen'),
(27, 86, 'IO', 'IOT', 'British Indian Ocean Territory', 'Territoire Britannique de l\'Océan Indien', 'Britiéen'),
(28, 90, 'SB', 'SLB', 'Solomon Islands', 'Îles Salomon', 'Soloméen'),
(29, 92, 'VG', 'VGB', 'British Virgin Islands', 'Îles Vierges Britanniques', 'Britiéen'),
(30, 96, 'BN', 'BRN', 'Brunei Darussalam', 'Brunéi Darussalam', 'Bruneéen'),
(31, 100, 'BG', 'BGR', 'Bulgaria', 'Bulgarie', 'Bulgare'),
(32, 104, 'MM', 'MMR', 'Myanmar', 'Myanmar', 'Birman'),
(33, 108, 'BI', 'BDI', 'Burundi', 'Burundi', 'Burundais'),
(34, 112, 'BY', 'BLR', 'Belarus', 'Bélarus', 'Biélorusse'),
(35, 116, 'KH', 'KHM', 'Cambodia', 'Cambodge', 'Cambodgien'),
(36, 120, 'CM', 'CMR', 'Cameroon', 'Cameroun', 'Camerounais'),
(37, 124, 'CA', 'CAN', 'Canada', 'Canada', 'Canadien'),
(38, 132, 'CV', 'CPV', 'Cape Verde', 'Cap-vert', 'Capverdien'),
(39, 136, 'KY', 'CYM', 'Cayman Islands', 'Îles Caïmanes', 'Caymaéen'),
(40, 140, 'CF', 'CAF', 'Central African', 'République Centrafricaine', 'Centrafricain'),
(41, 144, 'LK', 'LKA', 'Sri Lanka', 'Sri Lanka', 'Sri-lankais'),
(42, 148, 'TD', 'TCD', 'Chad', 'Tchad', 'Tchadien'),
(43, 152, 'CL', 'CHL', 'Chile', 'Chili', 'Chilien'),
(44, 156, 'CN', 'CHN', 'China', 'Chine', 'Chinois'),
(45, 158, 'TW', 'TWN', 'Taiwan', 'Taïwan', 'Taïwanais'),
(46, 162, 'CX', 'CXR', 'Christmas Island', 'Île Christmas', 'Chriséen'),
(47, 166, 'CC', 'CCK', 'Cocos (Keeling) Islands', 'Îles Cocos (Keeling)', 'Cocoséen'),
(48, 170, 'CO', 'COL', 'Colombia', 'Colombie', 'Colombien'),
(49, 174, 'KM', 'COM', 'Comoros', 'Comores', 'Comorien'),
(50, 175, 'YT', 'MYT', 'Mayotte', 'Mayotte', 'Mahorais'),
(51, 178, 'CG', 'COG', 'Republic of the Congo', 'République du Congo', 'Congolais'),
(52, 180, 'CD', 'COD', 'The Democratic Republic Of The Congo', 'République Démocratique du Congo', 'Congolais - RDC'),
(53, 184, 'CK', 'COK', 'Cook Islands', 'Îles Cook', 'Cook éen'),
(54, 188, 'CR', 'CRI', 'Costa Rica', 'Costa Rica', 'Costaricien'),
(55, 191, 'HR', 'HRV', 'Croatia', 'Croatie', 'Croate'),
(56, 192, 'CU', 'CUB', 'Cuba', 'Cuba', 'Cubain'),
(57, 196, 'CY', 'CYP', 'Cyprus', 'Chypre', 'Chypriote'),
(58, 203, 'CZ', 'CZE', 'Czech Republic', 'République Tchèque', 'Tchèque'),
(59, 204, 'BJ', 'BEN', 'Benin', 'Bénin', 'Béninois'),
(60, 208, 'DK', 'DNK', 'Denmark', 'Danemark', 'Danois'),
(61, 212, 'DM', 'DMA', 'Dominica', 'Dominique', 'Dominéen'),
(62, 214, 'DO', 'DOM', 'Dominican Republic', 'République Dominicaine', 'Dominéen'),
(63, 218, 'EC', 'ECU', 'Ecuador', 'Équateur', 'Equatorien'),
(64, 222, 'SV', 'SLV', 'El Salvador', 'El Salvador', 'El Saéen'),
(65, 226, 'GQ', 'GNQ', 'Equatorial Guinea', 'Guinée Équatoriale', 'Equatéen'),
(66, 231, 'ET', 'ETH', 'Ethiopia', 'Éthiopie', 'Ethiopien'),
(67, 232, 'ER', 'ERI', 'Eritrea', 'Érythrée', 'Erythréen'),
(68, 233, 'EE', 'EST', 'Estonia', 'Estonie', 'Estonien'),
(69, 234, 'FO', 'FRO', 'Faroe Islands', 'Îles Féroé', 'Faroeéen'),
(70, 238, 'FK', 'FLK', 'Falkland Islands', 'Îles (malvinas) Falkland', 'Falkléen'),
(71, 239, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands', 'Géorgie du Sud et les Îles Sandwich du Sud', 'Southéen'),
(72, 242, 'FJ', 'FJI', 'Fiji', 'Fidji', 'Fidjien'),
(73, 246, 'FI', 'FIN', 'Finland', 'Finlande', 'Finlandais'),
(74, 248, 'AX', 'ALA', 'Åland Islands', 'Îles Åland', 'Ålandéen'),
(75, 250, 'FR', 'FRA', 'France', 'France', 'Français'),
(76, 254, 'GF', 'GUF', 'French Guiana', 'Guyane Française', 'Guyanais'),
(77, 258, 'PF', 'PYF', 'French Polynesia', 'Polynésie Française', 'Frencéen'),
(78, 260, 'TF', 'ATF', 'French Southern Territories', 'Terres Australes Françaises', 'Frencéen'),
(79, 262, 'DJ', 'DJI', 'Djibouti', 'Djibouti', 'Djiboutien'),
(80, 266, 'GA', 'GAB', 'Gabon', 'Gabon', 'Gabonais'),
(81, 268, 'GE', 'GEO', 'Georgia', 'Géorgie', 'Géorgien'),
(82, 270, 'GM', 'GMB', 'Gambia', 'Gambie', 'Gambien'),
(83, 275, 'PS', 'PSE', 'Occupied Palestinian Territory', 'Territoire Palestinien Occupé', 'Palestinien'),
(84, 276, 'DE', 'DEU', 'Germany', 'Allemagne', 'Allemand'),
(85, 288, 'GH', 'GHA', 'Ghana', 'Ghana', 'Ghanéen'),
(86, 292, 'GI', 'GIB', 'Gibraltar', 'Gibraltar', 'Gibraéen'),
(87, 296, 'KI', 'KIR', 'Kiribati', 'Kiribati', 'Kiribéen'),
(88, 300, 'GR', 'GRC', 'Greece', 'Grèce', 'Grec'),
(89, 304, 'GL', 'GRL', 'Greenland', 'Groenland', 'Greenéen'),
(90, 308, 'GD', 'GRD', 'Grenada', 'Grenade', 'Grenaéen'),
(91, 312, 'GP', 'GLP', 'Guadeloupe', 'Guadeloupe', 'Goudeloupéen'),
(92, 316, 'GU', 'GUM', 'Guam', 'Guam', 'Guéen'),
(93, 320, 'GT', 'GTM', 'Guatemala', 'Guatemala', 'Guatémaltèque'),
(94, 324, 'GN', 'GIN', 'Guinea', 'Guinée', 'Guinéen'),
(95, 328, 'GY', 'GUY', 'Guyana', 'Guyana', 'Guyanais'),
(96, 332, 'HT', 'HTI', 'Haiti', 'Haïti', 'Haitien'),
(97, 334, 'HM', 'HMD', 'Heard Island and McDonald Islands', 'Îles Heard et Mcdonald', 'Heardéen'),
(98, 336, 'VA', 'VAT', 'Vatican City State', 'Saint-Siège (état de la Cité du Vatican)', 'Vaticéen'),
(99, 340, 'HN', 'HND', 'Honduras', 'Honduras', 'Hondurien'),
(100, 344, 'HK', 'HKG', 'Hong Kong', 'Hong-Kong', 'Hongkongais'),
(101, 348, 'HU', 'HUN', 'Hungary', 'Hongrie', 'Hongrois'),
(102, 352, 'IS', 'ISL', 'Iceland', 'Islande', 'Islandais'),
(103, 356, 'IN', 'IND', 'India', 'Inde', 'Indien'),
(104, 360, 'ID', 'IDN', 'Indonesia', 'Indonésie', 'Indonésien'),
(105, 364, 'IR', 'IRN', 'Islamic Republic of Iran', 'République Islamique d\'Iran', 'Iranien'),
(106, 368, 'IQ', 'IRQ', 'Iraq', 'Iraq', 'Irakien'),
(107, 372, 'IE', 'IRL', 'Ireland', 'Irlande', 'Irlandais'),
(108, 376, 'IL', 'ISR', 'Israel', 'Israël', 'Israélien'),
(109, 380, 'IT', 'ITA', 'Italy', 'Italie', 'Italien'),
(110, 384, 'CI', 'CIV', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Ivoirien'),
(111, 388, 'JM', 'JAM', 'Jamaica', 'Jamaïque', 'Jamaïquain'),
(112, 392, 'JP', 'JPN', 'Japan', 'Japon', 'Japonais'),
(113, 398, 'KZ', 'KAZ', 'Kazakhstan', 'Kazakhstan', 'Kazakh'),
(114, 400, 'JO', 'JOR', 'Jordan', 'Jordanie', 'Jordanien'),
(115, 404, 'KE', 'KEN', 'Kenya', 'Kenya', 'Kényan'),
(116, 408, 'KP', 'PRK', 'Democratic People\'s Republic of Korea', 'République Populaire Démocratique de Corée', 'Democéen'),
(117, 410, 'KR', 'KOR', 'Republic of Korea', 'République de Corée', 'Repubéen'),
(118, 414, 'KW', 'KWT', 'Kuwait', 'Koweït', 'Koweitien'),
(119, 417, 'KG', 'KGZ', 'Kyrgyzstan', 'Kirghizistan', 'Kyrgyéen'),
(120, 418, 'LA', 'LAO', 'Lao People\'s Democratic Republic', 'République Démocratique Populaire Lao', 'Laotien'),
(121, 422, 'LB', 'LBN', 'Lebanon', 'Liban', 'Libanais'),
(122, 426, 'LS', 'LSO', 'Lesotho', 'Lesotho', 'Lesotéen'),
(123, 428, 'LV', 'LVA', 'Latvia', 'Lettonie', 'Letton'),
(124, 430, 'LR', 'LBR', 'Liberia', 'Libéria', 'Libérien'),
(125, 434, 'LY', 'LBY', 'Libyan Arab Jamahiriya', 'Jamahiriya Arabe Libyenne', 'Libyen'),
(126, 438, 'LI', 'LIE', 'Liechtenstein', 'Liechtenstein', 'Liechéen'),
(127, 440, 'LT', 'LTU', 'Lithuania', 'Lituanie', 'Lituanien'),
(128, 442, 'LU', 'LUX', 'Luxembourg', 'Luxembourg', 'Luxeméen'),
(129, 446, 'MO', 'MAC', 'Macao', 'Macao', 'Macaoéen'),
(130, 450, 'MG', 'MDG', 'Madagascar', 'Madagascar', 'Malgache'),
(131, 454, 'MW', 'MWI', 'Malawi', 'Malawi', 'Malawite'),
(132, 458, 'MY', 'MYS', 'Malaysia', 'Malaisie', 'Malais'),
(133, 462, 'MV', 'MDV', 'Maldives', 'Maldives', 'Maldiéen'),
(134, 466, 'ML', 'MLI', 'Mali', 'Mali', 'Malien'),
(135, 470, 'MT', 'MLT', 'Malta', 'Malte', 'Maltaéen'),
(136, 474, 'MQ', 'MTQ', 'Martinique', 'Martinique', 'Martiniquais'),
(137, 478, 'MR', 'MRT', 'Mauritania', 'Mauritanie', 'Mauritanienne'),
(138, 480, 'MU', 'MUS', 'Mauritius', 'Maurice', 'Mauricien'),
(139, 484, 'MX', 'MEX', 'Mexico', 'Mexique', 'Mexicain'),
(140, 492, 'MC', 'MCO', 'Monaco', 'Monaco', 'Monacéen'),
(141, 496, 'MN', 'MNG', 'Mongolia', 'Mongolie', 'Mongol'),
(142, 498, 'MD', 'MDA', 'Republic of Moldova', 'République de Moldova', 'Repubéen'),
(143, 500, 'MS', 'MSR', 'Montserrat', 'Montserrat', 'Montséen'),
(144, 504, 'MA', 'MAR', 'Morocco', 'Maroc', 'Marocain'),
(145, 508, 'MZ', 'MOZ', 'Mozambique', 'Mozambique', 'Mozambicain'),
(146, 512, 'OM', 'OMN', 'Oman', 'Oman', 'Oméen'),
(147, 516, 'NA', 'NAM', 'Namibia', 'Namibie', 'Namibien'),
(148, 520, 'NR', 'NRU', 'Nauru', 'Nauru', 'Nauruéen'),
(149, 524, 'NP', 'NPL', 'Nepal', 'Népal', 'Népalais'),
(150, 528, 'NL', 'NLD', 'Netherlands', 'Pays-Bas', 'Hollandais'),
(151, 530, 'AN', 'ANT', 'Netherlands Antilles', 'Antilles Néerlandaises', 'Netheéen'),
(152, 533, 'AW', 'ABW', 'Aruba', 'Aruba', 'Arubaéen'),
(153, 540, 'NC', 'NCL', 'New Caledonia', 'Nouvelle-Calédonie', 'New Céen'),
(154, 548, 'VU', 'VUT', 'Vanuatu', 'Vanuatu', 'Vanuaéen'),
(155, 554, 'NZ', 'NZL', 'New Zealand', 'Nouvelle-Zélande', 'Néo-zélandais'),
(156, 558, 'NI', 'NIC', 'Nicaragua', 'Nicaragua', 'Nicaréen'),
(157, 562, 'NE', 'NER', 'Niger', 'Niger', 'Nigérien'),
(158, 566, 'NG', 'NGA', 'Nigeria', 'Nigéria', 'Nigérian'),
(159, 570, 'NU', 'NIU', 'Niue', 'Niué', 'Niéen'),
(160, 574, 'NF', 'NFK', 'Norfolk Island', 'Île Norfolk', 'Norfoéen'),
(161, 578, 'NO', 'NOR', 'Norway', 'Norvège', 'Norvégien'),
(162, 580, 'MP', 'MNP', 'Northern Mariana Islands', 'Îles Mariannes du Nord', 'Northéen'),
(163, 581, 'UM', 'UMI', 'United States Minor Outlying Islands', 'Îles Mineures Éloignées des États-Unis', 'Uniteéen'),
(164, 583, 'FM', 'FSM', 'Federated States of Micronesia', 'États Fédérés de Micronésie', 'Federéen'),
(165, 584, 'MH', 'MHL', 'Marshall Islands', 'Îles Marshall', 'Marshéen'),
(166, 585, 'PW', 'PLW', 'Palau', 'Palaos', 'Palauéen'),
(167, 586, 'PK', 'PAK', 'Pakistan', 'Pakistan', 'Pakistanais'),
(168, 591, 'PA', 'PAN', 'Panama', 'Panama', 'Panaméen'),
(169, 598, 'PG', 'PNG', 'Papua New Guinea', 'Papouasie-Nouvelle-Guinée', 'Papuaéen'),
(170, 600, 'PY', 'PRY', 'Paraguay', 'Paraguay', 'Paraguayen'),
(171, 604, 'PE', 'PER', 'Peru', 'Pérou', 'Péruvien'),
(172, 608, 'PH', 'PHL', 'Philippines', 'Philippines', 'Philippin'),
(173, 612, 'PN', 'PCN', 'Pitcairn', 'Pitcairn', 'Pitcaéen'),
(174, 616, 'PL', 'POL', 'Poland', 'Pologne', 'Polonais'),
(175, 620, 'PT', 'PRT', 'Portugal', 'Portugal', 'Portugais'),
(176, 624, 'GW', 'GNB', 'Guinea-Bissau', 'Guinée-Bissau', 'Guineéen'),
(177, 626, 'TL', 'TLS', 'Timor-Leste', 'Timor-Leste', 'Timoréen'),
(178, 630, 'PR', 'PRI', 'Puerto Rico', 'Porto Rico', 'Puertéen'),
(179, 634, 'QA', 'QAT', 'Qatar', 'Qatar', 'Qatari'),
(180, 638, 'RE', 'REU', 'Réunion', 'Réunion', 'Réunionnais'),
(181, 642, 'RO', 'ROU', 'Romania', 'Roumanie', 'Roumain'),
(182, 643, 'RU', 'RUS', 'Russian Federation', 'Fédération de Russie', 'Russe'),
(183, 646, 'RW', 'RWA', 'Rwanda', 'Rwanda', 'Rwandais'),
(184, 654, 'SH', 'SHN', 'Saint Helena', 'Sainte-Hélène', 'Saint Hélène'),
(185, 659, 'KN', 'KNA', 'Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis', 'Saint Kitts'),
(186, 660, 'AI', 'AIA', 'Anguilla', 'Anguilla', 'Anguiéen'),
(187, 662, 'LC', 'LCA', 'Saint Lucia', 'Sainte-Lucie', 'saint-lucien'),
(188, 666, 'PM', 'SPM', 'Saint-Pierre and Miquelon', 'Saint-Pierre-et-Miquelon', ''),
(189, 670, 'VC', 'VCT', 'Saint Vincent and the Grenadines', 'Saint-Vincent-et-les Grenadines', ''),
(190, 674, 'SM', 'SMR', 'San Marino', 'Saint-Marin', 'San Méen'),
(191, 678, 'ST', 'STP', 'Sao Tome and Principe', 'Sao Tomé-et-Principe', 'Sao Téen'),
(192, 682, 'SA', 'SAU', 'Saudi Arabia', 'Arabie Saoudite', 'Saoudien'),
(193, 686, 'SN', 'SEN', 'Senegal', 'Sénégal', 'Sénégalaise'),
(194, 690, 'SC', 'SYC', 'Seychelles', 'Seychelles', 'Seychéen'),
(195, 694, 'SL', 'SLE', 'Sierra Leone', 'Sierra Leone', 'Sierréen'),
(196, 702, 'SG', 'SGP', 'Singapore', 'Singapour', 'Singapourien'),
(197, 703, 'SK', 'SVK', 'Slovakia', 'Slovaquie', 'Slovaque'),
(198, 704, 'VN', 'VNM', 'Vietnam', 'Viet Nam', 'Vietnamien'),
(199, 705, 'SI', 'SVN', 'Slovenia', 'Slovénie', 'Slovène'),
(200, 706, 'SO', 'SOM', 'Somalia', 'Somalie', 'Somalien'),
(201, 710, 'ZA', 'ZAF', 'South Africa', 'Afrique du Sud', 'Sud-africain'),
(202, 716, 'ZW', 'ZWE', 'Zimbabwe', 'Zimbabwe', 'Zimbabwéen'),
(203, 724, 'ES', 'ESP', 'Spain', 'Espagne', 'Espagnol'),
(204, 732, 'EH', 'ESH', 'Western Sahara', 'Sahara Occidental', 'Westeéen'),
(205, 736, 'SD', 'SDN', 'Sudan', 'Soudan', 'Soudanais'),
(206, 740, 'SR', 'SUR', 'Suriname', 'Suriname', 'Surinamais'),
(207, 744, 'SJ', 'SJM', 'Svalbard and Jan Mayen', 'Svalbard etÎle Jan Mayen', 'Svalbéen'),
(208, 748, 'SZ', 'SWZ', 'Swaziland', 'Swaziland', 'Swazi'),
(209, 752, 'SE', 'SWE', 'Sweden', 'Suède', 'Suèdois'),
(210, 756, 'CH', 'CHE', 'Switzerland', 'Suisse', 'Suisse'),
(211, 760, 'SY', 'SYR', 'Syrian Arab Republic', 'République Arabe Syrienne', 'Syrien'),
(212, 762, 'TJ', 'TJK', 'Tajikistan', 'Tadjikistan', 'Tadjiks'),
(213, 764, 'TH', 'THA', 'Thailand', 'Thaïlande', 'Thaïlandais'),
(214, 768, 'TG', 'TGO', 'Togo', 'Togo', 'Togolais'),
(215, 772, 'TK', 'TKL', 'Tokelau', 'Tokelau', 'Tokeléen'),
(216, 776, 'TO', 'TON', 'Tonga', 'Tonga', 'Tongaéen'),
(217, 780, 'TT', 'TTO', 'Trinidad and Tobago', 'Trinité-et-Tobago', 'Triniéen'),
(218, 784, 'AE', 'ARE', 'United Arab Emirates', 'Émirats Arabes Unis', 'Uniteéen'),
(219, 788, 'TN', 'TUN', 'Tunisia', 'Tunisie', 'Tunisien'),
(220, 792, 'TR', 'TUR', 'Turkey', 'Turquie', 'Turc'),
(221, 795, 'TM', 'TKM', 'Turkmenistan', 'Turkménistan', 'Turkméen'),
(222, 796, 'TC', 'TCA', 'Turks and Caicos Islands', 'Îles Turks et Caïques', 'Turkséen'),
(223, 798, 'TV', 'TUV', 'Tuvalu', 'Tuvalu', 'Tuvaluane'),
(224, 800, 'UG', 'UGA', 'Uganda', 'Ouganda', 'Ougandais'),
(225, 804, 'UA', 'UKR', 'Ukraine', 'Ukraine', 'Ukrainien'),
(226, 807, 'MK', 'MKD', 'The Former Yugoslav Republic of Macedonia', 'L\'ex-République Yougoslave de Macédoine', 'The Féen'),
(227, 818, 'EG', 'EGY', 'Egypt', 'Égypte', 'Egyptien'),
(228, 826, 'GB', 'GBR', 'United Kingdom', 'Royaume-Uni', 'Britannique'),
(229, 833, 'IM', 'IMN', 'Isle of Man', 'Île de Man', 'Isle éen'),
(230, 834, 'TZ', 'TZA', 'United Republic Of Tanzania', 'République-Unie de Tanzanie', 'Tanzanien'),
(231, 840, 'US', 'USA', 'United States', 'États-Unis', 'Américain'),
(232, 850, 'VI', 'VIR', 'U.S. Virgin Islands', 'Îles Vierges des États-Unis', 'U.S. éen'),
(233, 854, 'BF', 'BFA', 'Burkina Faso', 'Burkina Faso', 'Burkinabé'),
(234, 858, 'UY', 'URY', 'Uruguay', 'Uruguay', 'Uruguayen'),
(235, 860, 'UZ', 'UZB', 'Uzbekistan', 'Ouzbékistan', 'Ouzbek'),
(236, 862, 'VE', 'VEN', 'Venezuela', 'Venezuela', 'Vénézuélien'),
(237, 876, 'WF', 'WLF', 'Wallis and Futuna', 'Wallis et Futuna', 'Walliéen'),
(238, 882, 'WS', 'WSM', 'Samoa', 'Samoa', 'Samoan'),
(239, 887, 'YE', 'YEM', 'Yemen', 'Yémen', 'Yéménite'),
(240, 891, 'CS', 'SCG', 'Serbia and Montenegro', 'Serbie-et-Monténégro', 'Serbe'),
(241, 894, 'ZM', 'ZMB', 'Zambia', 'Zambie', 'Zambien'),
(242, 1000, 'OO', 'OO', 'OO', 'Non Renseigné', 'Non renseignée');

-- --------------------------------------------------------

--
-- Structure de la table `profession`
--

DROP TABLE IF EXISTS `profession`;
CREATE TABLE IF NOT EXISTS `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA930D698F5EA509` (`classe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `responsabilite`
--

DROP TABLE IF EXISTS `responsabilite`;
CREATE TABLE IF NOT EXISTS `responsabilite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fonction_id` int(11) NOT NULL,
  `structure_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4EA0982057889920` (`fonction_id`),
  KEY `IDX_4EA098202534008B` (`structure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `structure`
--

DROP TABLE IF EXISTS `structure`;
CREATE TABLE IF NOT EXISTS `structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(145) NOT NULL,
  `code` varchar(45) NOT NULL,
  `adresse` text DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `type_entite` int(11) DEFAULT NULL,
  `structure_parente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_structure_typeentite_idx` (`type_entite`),
  KEY `fk_structure_structure1_idx` (`structure_parente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `structure`
--

INSERT INTO `structure` (`id`, `nom`, `code`, `adresse`, `telephone`, `type_entite`, `structure_parente`) VALUES
(1, 'Université de Thiès', 'UT', 'Cité Malick SY, 2 voix prison MAC THIES', NULL, 1, NULL),
(2, 'Rectorat', 'RECT', NULL, '338856985', 2, 1),
(3, 'Direction des Systèmes d\'Informations', 'DSI', NULL, '339875869', 6, 2),
(4, 'Direction de la Scolarité, de l\'Orientation et des Statisques', 'DSOS', NULL, '339875896', 6, 2),
(5, 'Sciences et Technologie', 'SET', NULL, '339512585', 3, 1),
(6, 'Sciences Economiques et Sociales', 'SES', NULL, '339514585', 3, 1),
(7, 'Sciences de l\'Ingenieur', 'SI', NULL, '33 985 78', 3, 1),
(8, 'Sante', 'SANTE', NULL, '33 982 96 85', 3, 1),
(9, 'Ecole Normale Supérieure d\'Agriculture', 'ENSA', NULL, '339815874', 5, 1),
(10, 'Institut Universitaire de Technologie', 'IUT', NULL, '339547856', 1, 1),
(11, 'Bibliothèque Centrale', 'BU', NULL, '339215896', 7, 2),
(12, 'Direction des Finances et de la Comptabilité', 'DFC', NULL, '339854785', 6, 2),
(13, 'Direction des Ressources Humaines', 'DRH', NULL, '339854785', 6, 2),
(14, 'Agence Comptable Principale', 'ACP', NULL, '339854774', 8, 2),
(15, 'UFR SET', 'SET', 'VCN', NULL, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `structure_fonction`
--

DROP TABLE IF EXISTS `structure_fonction`;
CREATE TABLE IF NOT EXISTS `structure_fonction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structure_id` int(11) NOT NULL,
  `fonction_id` int(11) NOT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_580577F72534008B` (`structure_id`),
  KEY `IDX_580577F757889920` (`fonction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `syndicat`
--

DROP TABLE IF EXISTS `syndicat`;
CREATE TABLE IF NOT EXISTS `syndicat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(245) NOT NULL,
  `code` varchar(45) NOT NULL,
  `type_employe` int(11) DEFAULT NULL,
  `filename` varchar(145) DEFAULT NULL,
  `filepath` text DEFAULT NULL,
  `montant_cotisation_mensuelle` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_syndicat_type_employe1_idx` (`type_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `syndicat`
--

INSERT INTO `syndicat` (`id`, `nom`, `code`, `type_employe`, `filename`, `filepath`, `montant_cotisation_mensuelle`) VALUES
(1, 'Syndicat Autonome des Enseignants du Supérieur', 'SAES', 1, '5f60f96bb657f.png', 'http://127.0.0.1:8000/uploads/syndicat/5f60f96bb657f.png', 0),
(2, 'Syndicat Autonome des Travailleurs des universités et des centres universitaires', 'SATUC', 2, '5f622beec0fa3.png', 'http://127.0.0.1:8000/uploads/syndicat/5f622beec0fa3.png', 2500);

-- --------------------------------------------------------

--
-- Structure de la table `type_contrat`
--

DROP TABLE IF EXISTS `type_contrat`;
CREATE TABLE IF NOT EXISTS `type_contrat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_contrat`
--

INSERT INTO `type_contrat` (`id`, `nom`, `code`) VALUES
(1, 'Contrat à Durée Determinée', 'CDD'),
(2, 'Contrat à Durée Indéterminée', 'CDI');

-- --------------------------------------------------------

--
-- Structure de la table `type_document`
--

DROP TABLE IF EXISTS `type_document`;
CREATE TABLE IF NOT EXISTS `type_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `duree_archivage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_document`
--

INSERT INTO `type_document` (`id`, `nom`, `duree_archivage`) VALUES
(1, 'Pièce Justificative', 10),
(2, 'Arreté', 5),
(3, 'Décrets', 5),
(4, 'Autres', 5);

-- --------------------------------------------------------

--
-- Structure de la table `type_employe`
--

DROP TABLE IF EXISTS `type_employe`;
CREATE TABLE IF NOT EXISTS `type_employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(145) NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_employe`
--

INSERT INTO `type_employe` (`id`, `nom`, `code`) VALUES
(1, 'Personnel Enseignement et de Recherche', 'PER'),
(2, 'Personnel Administratif Technique et des Services', 'PATS'),
(3, 'Vacataire', 'VACATAIRE'),
(4, 'Stagiaire', 'STAGIARE');

-- --------------------------------------------------------

--
-- Structure de la table `type_entite`
--

DROP TABLE IF EXISTS `type_entite`;
CREATE TABLE IF NOT EXISTS `type_entite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_entite`
--

INSERT INTO `type_entite` (`id`, `nom`, `code`) VALUES
(1, 'Institution d\'Enseignement Supérieur', 'IES'),
(2, 'Administration', 'ADMIN'),
(3, 'Unité de Formation et de Recherche', 'UFR'),
(4, 'Institut', 'INSTITUT'),
(5, 'Ecole', 'ECOLE'),
(6, 'Direction', 'DIRECTION'),
(7, 'Bibliothèque', 'BIBLIO'),
(8, 'Agence', 'AGENCE');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FK_C35F0816F804D3B9` FOREIGN KEY (`employe`) REFERENCES `employe` (`id`);

--
-- Contraintes pour la table `affectation`
--
ALTER TABLE `affectation`
  ADD CONSTRAINT `FK_F4DD61D31B65292` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`),
  ADD CONSTRAINT `FK_F4DD61D32534008B` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`);

--
-- Contraintes pour la table `diplome_employe`
--
ALTER TABLE `diplome_employe`
  ADD CONSTRAINT `FK_B219CA7B1B65292` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`),
  ADD CONSTRAINT `FK_B219CA7B26F859E2` FOREIGN KEY (`diplome_id`) REFERENCES `diplome` (`id`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK_D8698A761596AD8A` FOREIGN KEY (`type_document`) REFERENCES `type_document` (`id`),
  ADD CONSTRAINT `FK_D8698A76F804D3B9` FOREIGN KEY (`employe`) REFERENCES `employe` (`id`);

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `FK_F804D3B9595AAE34` FOREIGN KEY (`grade`) REFERENCES `grade` (`id`),
  ADD CONSTRAINT `FK_F804D3B99EC4D73F` FOREIGN KEY (`nationalite`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `FK_F804D3B9A6CE7BD9` FOREIGN KEY (`caisse_sociale`) REFERENCES `caisse_sociale` (`id`),
  ADD CONSTRAINT `FK_F804D3B9C2DF197E` FOREIGN KEY (`mutuelle_sante`) REFERENCES `mutuelle_sante` (`id`),
  ADD CONSTRAINT `FK_F804D3B9D025BC4C` FOREIGN KEY (`type_employe`) REFERENCES `type_employe` (`id`),
  ADD CONSTRAINT `FK_F804D3B9FDEF8996` FOREIGN KEY (`profession_id`) REFERENCES `profession` (`id`);

--
-- Contraintes pour la table `fonction_employe`
--
ALTER TABLE `fonction_employe`
  ADD CONSTRAINT `FK_3554BF216F0137EA` FOREIGN KEY (`structure`) REFERENCES `structure` (`id`),
  ADD CONSTRAINT `FK_3554BF21900D5BD` FOREIGN KEY (`fonction`) REFERENCES `fonction` (`id`),
  ADD CONSTRAINT `FK_3554BF21F804D3B9` FOREIGN KEY (`employe`) REFERENCES `employe` (`id`);

--
-- Contraintes pour la table `fos_user_group`
--
ALTER TABLE `fos_user_group`
  ADD CONSTRAINT `FK_583D1F3EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_583D1F3EFE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_group` (`id`);

--
-- Contraintes pour la table `gcategorie`
--
ALTER TABLE `gcategorie`
  ADD CONSTRAINT `FK_7FC5B5E59C2BB0CC` FOREIGN KEY (`suivant_id`) REFERENCES `gcategorie` (`id`);

--
-- Contraintes pour la table `gclasse`
--
ALTER TABLE `gclasse`
  ADD CONSTRAINT `FK_ED38B3209C2BB0CC` FOREIGN KEY (`suivant_id`) REFERENCES `gclasse` (`id`),
  ADD CONSTRAINT `FK_ED38B320D025BC4C` FOREIGN KEY (`type_employe`) REFERENCES `type_employe` (`id`);

--
-- Contraintes pour la table `gclasse_gcategorie`
--
ALTER TABLE `gclasse_gcategorie`
  ADD CONSTRAINT `FK_72EFA80AB9E6C6D8` FOREIGN KEY (`gclasse_id`) REFERENCES `gclasse` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_72EFA80ABBD4BBC6` FOREIGN KEY (`gcategorie_id`) REFERENCES `gcategorie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gclasse_gniveau`
--
ALTER TABLE `gclasse_gniveau`
  ADD CONSTRAINT `FK_8DAEAF653D86FF50` FOREIGN KEY (`gniveau_id`) REFERENCES `gniveau` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8DAEAF65B9E6C6D8` FOREIGN KEY (`gclasse_id`) REFERENCES `gclasse` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gechelon`
--
ALTER TABLE `gechelon`
  ADD CONSTRAINT `FK_44FA5AB39C2BB0CC` FOREIGN KEY (`suivant_id`) REFERENCES `gechelon` (`id`);

--
-- Contraintes pour la table `gniveau`
--
ALTER TABLE `gniveau`
  ADD CONSTRAINT `FK_2960FFDD9C2BB0CC` FOREIGN KEY (`suivant_id`) REFERENCES `gniveau` (`id`);

--
-- Contraintes pour la table `membre_famille`
--
ALTER TABLE `membre_famille`
  ADD CONSTRAINT `FK_9654F0AEF804D3B9` FOREIGN KEY (`employe`) REFERENCES `employe` (`id`);

--
-- Contraintes pour la table `membre_syndicat`
--
ALTER TABLE `membre_syndicat`
  ADD CONSTRAINT `FK_F212A94547704176` FOREIGN KEY (`syndicat`) REFERENCES `syndicat` (`id`),
  ADD CONSTRAINT `FK_F212A945F804D3B9` FOREIGN KEY (`employe`) REFERENCES `employe` (`id`);

--
-- Contraintes pour la table `profession`
--
ALTER TABLE `profession`
  ADD CONSTRAINT `FK_BA930D698F5EA509` FOREIGN KEY (`classe_id`) REFERENCES `gclasse` (`id`);

--
-- Contraintes pour la table `responsabilite`
--
ALTER TABLE `responsabilite`
  ADD CONSTRAINT `FK_4EA098202534008B` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`),
  ADD CONSTRAINT `FK_4EA0982057889920` FOREIGN KEY (`fonction_id`) REFERENCES `fonction` (`id`);

--
-- Contraintes pour la table `structure`
--
ALTER TABLE `structure`
  ADD CONSTRAINT `fk_structure_structure1` FOREIGN KEY (`structure_parente`) REFERENCES `structure` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_structure_typeentite` FOREIGN KEY (`type_entite`) REFERENCES `type_entite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `structure_fonction`
--
ALTER TABLE `structure_fonction`
  ADD CONSTRAINT `FK_580577F72534008B` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`),
  ADD CONSTRAINT `FK_580577F757889920` FOREIGN KEY (`fonction_id`) REFERENCES `fonction` (`id`);

--
-- Contraintes pour la table `syndicat`
--
ALTER TABLE `syndicat`
  ADD CONSTRAINT `fk_syndicat_type_employe1` FOREIGN KEY (`type_employe`) REFERENCES `type_employe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
