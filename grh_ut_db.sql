-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
<<<<<<< HEAD
-- Généré le :  lun. 17 mai 2021 à 15:32
=======
-- Généré le :  jeu. 27 mai 2021 à 08:48
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d
-- Version du serveur :  8.0.18
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
  `ville` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quartier` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` tinyint(1) DEFAULT NULL COMMENT 'plusieurs adresses peuvent être actives en meme temps et les adresses non valables peuvent être désactivées',
  PRIMARY KEY (`id`),
  KEY `fk_adresse_employe1_idx` (`employe`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `employe`, `ville`, `quartier`, `etat`) VALUES
(1, 1503, 'Thies', 'Mbour 3', 1),
(9, 1, 'Thiès', 'Mbour 3', 1),
(10, 1, 'Dakar', 'Rond Point 6, Liberté 6', 1),
(12, 1, 'Thiès', 'Marché Helgui, Hersent', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `affectation`
--

INSERT INTO `affectation` (`id`, `employe_id`, `structure_id`, `date`, `motif`, `poste`) VALUES
(1, 1, 4, '2021-05-18', 'Perso', 'Chef de division'),
(3, 1, 4, '2021-05-27', NULL, 'Comptable');

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
  `filepath` text,
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
<<<<<<< HEAD
  `date_rupture` date DEFAULT NULL,
  `motif_rupture` longtext COLLATE utf8mb4_unicode_ci,
  `expire` tinyint(1) DEFAULT NULL,
  `rompu` tinyint(1) DEFAULT NULL,
  `date_creation` date NOT NULL,
  `date_signature` date DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_60349993520D03A` (`type_contrat_id`),
  KEY `IDX_603499931B65292` (`employe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
  `date_creation` date NOT NULL,
  `date_signature` date DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_fin_prevue` date DEFAULT NULL,
  `date_fin_effective` date DEFAULT NULL,
  `motif_fin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentaire_sur_fin_contrat` longtext COLLATE utf8mb4_unicode_ci,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_60349993520D03A` (`type_contrat_id`),
  KEY `IDX_603499931B65292` (`employe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

--
-- Déchargement des données de la table `contrat`
--

<<<<<<< HEAD
INSERT INTO `contrat` (`id`, `type_contrat_id`, `employe_id`, `duree_en_mois`, `date_rupture`, `motif_rupture`, `expire`, `rompu`, `date_creation`, `date_signature`, `date_debut`, `date_fin`) VALUES
(46, 3, 1, 4, '2021-05-19', 'yrtyr', 0, 1, '2021-05-17', '2021-05-21', '2021-05-11', '2024-07-11');
=======
INSERT INTO `contrat` (`id`, `type_contrat_id`, `employe_id`, `duree_en_mois`, `date_creation`, `date_signature`, `date_debut`, `etat`, `date_fin_prevue`, `date_fin_effective`, `motif_fin`, `commentaire_sur_fin_contrat`, `numero`) VALUES
(1, 1, 1503, 6, '2021-05-16', '2009-05-06', '0000-00-00', NULL, NULL, NULL, NULL, NULL, ''),
(2, 1, 1503, 5, '2021-05-16', '2020-05-13', '0000-00-00', NULL, NULL, NULL, NULL, NULL, ''),
(19, 2, 6, NULL, '2021-05-24', '2009-05-10', '2009-05-06', 1, NULL, NULL, NULL, NULL, ''),
(20, 1, 2, 12, '2021-05-24', '1999-05-03', '2015-05-17', 1, '2016-05-17', NULL, NULL, NULL, ''),
(22, 1, 126, 2, '2021-05-24', '2021-05-24', '2021-04-25', 0, '2021-06-25', '2021-05-24', 'Démission', NULL, ''),
(23, 1, 1, 12, '2021-05-24', '2021-05-25', '2021-05-24', 0, '2022-05-24', '2021-05-03', 'Retraite Anticipé', NULL, '202105241'),
(24, 2, 1, NULL, '2021-05-24', '2021-05-25', '2021-05-24', 0, NULL, NULL, 'Expiration Contrat', NULL, '202105242'),
(25, 2, 1, NULL, '2021-05-26', '2021-05-26', '2021-05-23', 0, NULL, NULL, NULL, NULL, '202105261'),
(26, 1, 1, 27, '2021-05-26', '2019-05-01', '2019-04-28', 1, '2021-07-28', NULL, NULL, NULL, '202105262');
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
CREATE TABLE IF NOT EXISTS `diplome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `diplome`
--

INSERT INTO `diplome` (`id`, `nom`) VALUES
<<<<<<< HEAD
(1, 'Licence'),
(2, 'Master');
=======
(1, 'Baccalauréat'),
(2, 'Licence'),
(3, 'Master'),
(4, 'Doctorat'),
(5, 'BFEM');
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

-- --------------------------------------------------------

--
-- Structure de la table `diplome_employe`
--

DROP TABLE IF EXISTS `diplome_employe`;
CREATE TABLE IF NOT EXISTS `diplome_employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe_id` int(11) NOT NULL,
  `diplome_id` int(11) NOT NULL,
  `annee_obtention` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etablissement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut_formation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_B219CA7B1B65292` (`employe_id`),
  KEY `IDX_B219CA7B26F859E2` (`diplome_id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

--
-- Déchargement des données de la table `diplome_employe`
--

INSERT INTO `diplome_employe` (`id`, `employe_id`, `diplome_id`, `annee_obtention`, `etablissement`, `formation`, `statut_formation`, `commentaire`) VALUES
<<<<<<< HEAD
(1, 1, 1, '2017', 'UIDT', 'Informatique', 'Terminée', NULL);
=======
(1, 1, 1, '2012', 'Lycée de Goudiry', 'Serie S2', 'Terminée', NULL),
(2, 1, 2, '2015', 'Université de Thiès', 'Licence Informatique - Option Génie Logiciel', 'Terminée', NULL),
(3, 1, 3, '2017', 'Université de Thiès', 'Master en génie Logiciel', 'Terminée', NULL),
(4, 1, 4, '2021', 'ED2DS UIDT', 'Doctorat en Sciences et technologie', 'En cours', NULL),
(5, 1503, 1, '2013', 'Lycée Malick Sy', 'Série L2', 'Terminée', NULL),
(6, 1503, 2, '2016', 'UFR SET/UIDT', 'Sciences économique et Sociales', 'Terminée', NULL),
(7, 1503, 3, NULL, 'UFR SET/UIDT', 'Informatique, option Génie Logiciel', 'En cours', 'Master 1 déjà obtenu, il reste le M2 qui est en cours'),
(8, 126, 2, '2020', 'UFR SET/UIDT', 'Informatique', 'Terminée', NULL);
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe` int(11) DEFAULT NULL,
  `type_document` int(11) DEFAULT NULL,
  `nom` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_employe1_idx` (`employe`),
  KEY `fk_document_type_document1_idx` (`type_document`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`id`, `employe`, `type_document`, `nom`, `filename`, `filepath`) VALUES
(1, 1, 1, 'photo d\'identité', '60337d8f787c0.jpeg', 'http://127.0.0.1:8000/uploads/employe/document/60337d8f787c0.jpeg'),
(2, 1, 1, 'CV', '60a7d6a2705e7.pdf', 'http://127.0.0.1:8000/uploads/employe/document/60a7d6a2705e7.pdf'),
(3, 1, 3, 'FPR SDA IIA VF', '60a7d6c3d64b2.docx', 'http://127.0.0.1:8000/uploads/employe/document/60a7d6c3d64b2.docx');

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
  `prenoms` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cni` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricule` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricule_caisse_sociale` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_recrutement` date NOT NULL,
  `situtation_matrimoniale` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
<<<<<<< HEAD
  `retraite` tinyint(1) DEFAULT NULL COMMENT 'true ou false, false par defaut',
=======
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d
  `genre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Homme ou Femme',
  `etat` tinyint(1) DEFAULT NULL COMMENT 'true ou false pur indiquer si l''employé est toujours actif',
  `email_univ` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filepath` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `telephone_primaire` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone_secondaire` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `date_prise_service` date DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `motif_sortie` longtext COLLATE utf8mb4_unicode_ci,
  `numero_main_oeuvre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `structure_id` int(11) DEFAULT NULL,
  `numero_affiliation_ipres` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
<<<<<<< HEAD
=======
  `commentaire_sortie` longtext COLLATE utf8mb4_unicode_ci,
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d
  PRIMARY KEY (`id`),
  KEY `fk_employe_mutuelle_sante1_idx` (`mutuelle_sante`),
  KEY `fk_employe_pays1_idx` (`nationalite`),
  KEY `fk_employe_caisse_sociale1_idx` (`caisse_sociale`),
  KEY `fk_employe_grade1_idx` (`grade`),
  KEY `fk_employe_type_employe1_idx` (`type_employe`),
  KEY `IDX_F804D3B9FDEF8996` (`profession_id`),
  KEY `IDX_F804D3B99C2214AD` (`structure_id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
) ENGINE=InnoDB AUTO_INCREMENT=1504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

--
-- Déchargement des données de la table `employe`
--

<<<<<<< HEAD
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `retraite`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`) VALUES
(1, 5, NULL, 1, 193, 2, 'Moussa', 'FOFANA', '1993-06-03', 'Didé Gassama', '1916200200225', '120254/B', NULL, '2018-05-02', 'Marié(e)', 0, 'Masculin', 1, 'moussa.fofana@univ-thies.sn', 'didegassama@gmail.com', '60337ba47b089.jpeg', 'http://127.0.0.1:8000/uploads/employe/photo/60337ba47b089.jpeg', '+221780165026', '+221762339081', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, NULL, 1, 193, 1, 'Moussa Déthié', 'Sarr', '1983-10-10', 'Mékhé', '1916198300220', '112154/C', NULL, '2016-08-16', 'Marié(e)', 0, 'Masculin', 1, 'mdsarr@univ-thies.sn', NULL, NULL, NULL, '775762332', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
=======
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(1, 5, 1, 1, 193, 2, 'Moussa', 'FOFANA', '1993-06-03', 'Didé Gassama', '1916200200225', '120254/B', NULL, '2018-05-02', 'Marié(e)', 'Masculin', 1, 'moussa.fofana@univ-thies.sn', 'didegassama@gmail.com', '60aa7c6b560f4.png', 'http://127.0.0.1:8000/uploads/employe/photo/60aa7c6b560f4.png', '+221780165026', '+221762339081', 2, '2018-05-07', NULL, NULL, NULL, 4, '111', NULL),
(2, 1, NULL, 1, 193, 1, 'Moussa Déthié', 'Sarr', '1983-10-10', 'Mékhé', '1916198300220', '112154/C', NULL, '2016-08-16', 'Marié(e)', 'Masculin', 1, 'mdsarr@univ-thies.sn', NULL, '60ab8e6991da7.jpeg', 'http://127.0.0.1:8000/uploads/employe/photo/60ab8e6991da7.jpeg', '775762332', NULL, 8, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(3, 1, NULL, 1, 105, 4, 'Alfred', 'Clement', '2014-06-24', 'BlanchetBourg', 'FR020010407294WM7730FPJ6178', '13 076', '51 628', '1971-10-03', 'Divorcé(e)', 'Masculin', 1, 'margaux-jacquelinehenry@univ-thies.sn', 'bmoreno@gmail.com', NULL, NULL, '01 17 83 71 40', '+33 (0)1 76 21 98 09', 5, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(4, 4, NULL, 1, 105, 1, 'Michel', 'Ferreira', '2012-05-14', 'Thierry', 'FR541154560759AR1468TLFO968', '46 692', '34 364', '1999-07-10', 'Marié(e)', 'Féminin', 0, 'th', 'fleroy@guillaume.fr', NULL, NULL, '+33 (0)2 25 33 24 97', '06 49 19 71 27', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(5, 1, NULL, 1, 157, 3, 'André', 'Turpin', '1986-12-06', 'Letellier', 'FR0918911832940W6OP0Y7ITP56', '16 398', '24 081', '1982-12-24', 'Marié(e)', 'Masculin', 1, 'mariannefaivre@univ-thies.sn', 'maurice.clemence@andre.com', NULL, NULL, '+33 6 56 33 26 20', '+33 (0)1 72 82 49 38', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(6, 1, NULL, 1, 67, 2, 'Marthe', 'Garcia', '2017-03-12', 'Pierredan', 'FR2502007922045C89BY8F21W65', '13 252', '47 563', '1971-03-01', 'Célibataire', 'Féminin', 1, 'sabineberthelot@univ-thies.sn', 'meyer.roger@duval.com', '60ab8e1b53d2e.jpeg', 'http://127.0.0.1:8000/uploads/employe/photo/60ab8e1b53d2e.jpeg', '+33 1 50 57 15 81', '+33 (0)7 72 64 68 80', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(7, 5, NULL, 1, 159, 4, 'Roland', 'Raymond', '1981-06-10', 'Masson-les-Bains', 'FR720971422343CW6RM1W6U7G19', '54 934', '83723', '2019-04-17', 'Divorcé(e)', 'Masculin', 0, 'christianechevallier@univ-thies.sn', 'franck.renaud@live.com', NULL, NULL, '05 99 51 15 85', '01 44 99 48 53', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(8, 4, NULL, 1, 122, 3, 'Alexandre', 'Pires', '1981-07-18', 'Gregoire', 'FR202742986988QZ16X3EA38Z86', '32169', '33559', '1995-07-27', 'Célibataire', 'Féminin', 1, 'yves-danieltexier@univ-thies.sn', 'lboulay@hotmail.fr', NULL, NULL, '+33 (0)8 05 67 10 83', '+33 (0)6 48 62 28 73', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(9, 4, NULL, 1, 35, 1, 'Laetitia', 'Colas', '2021-01-12', 'Antoine', 'FR285195323076I7JJ35937MG30', '04 462', '19 716', '2014-07-19', 'Célibataire', 'Masculin', 1, 'matthieurossi@univ-thies.sn', 'diallo.eleonore@dbmail.com', NULL, NULL, '0955505498', '+33 5 92 10 39 30', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(10, 5, NULL, 1, 194, 3, 'Brigitte', 'Andre', '2013-12-08', 'Girardnec', 'FR92678182042634D0YTGK1TK76', '08 388', '35 401', '1985-01-10', 'Célibataire', 'Masculin', 0, 'doroth', 'elisabeth.guyon@tele2.fr', NULL, NULL, '+33 (0)1 18 31 62 46', '+33 7 53 35 70 22', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(11, 1, NULL, 1, 207, 1, 'Astrid', 'Vasseur', '1973-07-12', 'Fabre', 'FR410791531077MAGX4DPACRN20', '92 128', '32 442', '1980-10-06', 'Veuf(ve)', 'Masculin', 0, '', 'aurelie91@tiscali.fr', NULL, NULL, '+33 8 92 31 13 29', '+33 (0)4 05 70 41 44', 6, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(12, 5, NULL, 1, 32, 1, 'Catherine', 'Philippe', '2005-09-06', 'Moulin', 'FR486748399083097220HJ3D642', '15035', '91003', '2012-07-18', 'Divorcé(e)', 'Masculin', 1, 'paulettepichon@univ-thies.sn', 'antoinette.leleu@delannoy.com', NULL, NULL, '+33 3 14 08 54 83', '+33 2 09 34 22 15', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(13, 5, NULL, 1, 39, 4, 'Honoré', 'Grenier', '1988-02-16', 'Pires', 'FR971444666763P9H5N6Y948S80', '52026', '93863', '1977-12-13', 'Célibataire', 'Masculin', 1, 'augustincosta@univ-thies.sn', 'vleroux@laposte.net', NULL, NULL, '+33 7 73 94 70 36', '08 21 67 59 41', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(14, 5, NULL, 1, 148, 3, 'René', 'Rodrigues', '2002-03-29', 'Vallet', 'FR847663710475ZI1P920WO8765', '85 996', '93 404', '1985-02-06', 'Veuf(ve)', 'Féminin', 1, 'sophiemarin@univ-thies.sn', 'sebastien98@yahoo.fr', NULL, NULL, '06 54 56 97 63', '01 00 23 84 84', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(15, 1, NULL, 1, 222, 2, 'Michelle', 'Albert', '1998-12-07', 'Ledoux', 'FR580471003550STVONOH0GOB22', '94 749', '37046', '1974-04-29', 'Veuf(ve)', 'Féminin', 0, 'marcelmarchand@univ-thies.sn', 'joseph.martin@merle.fr', NULL, NULL, '+33 (0)8 95 24 48 19', '05 19 37 39 84', 5, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(16, 5, NULL, 1, 223, 4, 'Hélène', 'Mary', '1972-09-04', 'Lemaire-la-Forêt', 'FR462510243187V3416S4AQAR72', '74062', '57355', '1993-06-11', 'Divorcé(e)', 'Féminin', 0, 'auroregay@univ-thies.sn', 'ocordier@free.fr', NULL, NULL, '0755285829', '0788530183', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(17, 4, NULL, 1, 2, 4, 'Joseph', 'De Sousa', '1990-04-13', 'Guyon-la-Forêt', 'FR1960242431165TOZ3R4498P53', '21 815', '79973', '1973-10-27', 'Divorcé(e)', 'Masculin', 0, '', 'achauvet@allain.com', NULL, NULL, '0558779702', '+33 4 41 08 09 16', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(18, 5, NULL, 1, 184, 1, 'Dominique', 'Lelievre', '2012-03-29', 'Moulin', 'FR789098043885O41C230B4AK63', '59236', '81 135', '2000-10-27', 'Divorcé(e)', 'Féminin', 0, 'alexandremaurice@univ-thies.sn', 'anastasie.henry@orange.fr', NULL, NULL, '0895865660', '04 23 54 14 24', 6, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(19, 4, NULL, 1, 60, 4, 'Robert', 'Charles', '1994-10-22', 'Morin', 'FR469258769395OGI5CGV0ZC774', '21 586', '31 636', '1974-06-27', 'Marié(e)', 'Féminin', 0, 'victoireclerc@univ-thies.sn', 'charles.jacques@cordier.com', NULL, NULL, '08 29 42 21 12', '+33 5 42 55 02 85', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(20, 5, NULL, 1, 209, 1, 'Valérie', 'Durand', '2010-03-23', 'De Oliveira-sur-Mer', 'FR5764278502828A85O81K53233', '69 204', '21 563', '1974-06-18', 'Divorcé(e)', 'Féminin', 1, 'honor', 'brun.charlotte@jourdan.net', NULL, NULL, '+33 (0)1 83 68 59 37', '+33 6 68 35 93 59', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(21, 1, NULL, 1, 14, 4, 'Jules', 'Cohen', '1989-09-22', 'Hubert', 'FR567035525943N27H3W0183J21', '09019', '15 684', '1995-11-06', 'Divorcé(e)', 'Féminin', 0, 'alphonselebon@univ-thies.sn', 'dlaporte@vidal.com', NULL, NULL, '+33 7 72 00 26 49', '+33 (0)6 02 19 88 55', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(22, 5, NULL, 1, 28, 4, 'Henri', 'Dumas', '1994-10-07', 'LebonVille', 'FR3007140814771I2P8O85A7G64', '25 918', '69 168', '2004-11-04', 'Veuf(ve)', 'Féminin', 1, 'adrien-rolandclerc@univ-thies.sn', 'sabine.hoarau@hoareau.com', NULL, NULL, '0679916724', '0124845888', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(23, 1, NULL, 1, 215, 3, 'Marie', 'Charrier', '2010-06-30', 'Guerin-sur-Vincent', 'FR5063924898607VK6A4T31SK68', '68 182', '72643', '2014-01-09', 'Célibataire', 'Masculin', 1, 'carolinecourtois@univ-thies.sn', 'isaac49@hamon.com', NULL, NULL, '+33 8 10 74 11 43', '+33 (0)7 81 67 88 82', 9, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(24, 5, NULL, 1, 167, 4, 'Anastasie', 'Vasseur', '1989-02-17', 'Vaillant', 'FR655831260297Q56YY824SAO20', '34 149', '74876', '2008-01-12', 'Veuf(ve)', 'Masculin', 0, 'huguesdubernier@univ-thies.sn', 'laroche.rene@gay.com', NULL, NULL, '+33 1 84 52 93 25', '01 64 85 99 32', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(25, 5, NULL, 1, 119, 1, 'Lucy', 'Perez', '1989-04-17', 'PeltierBourg', 'FR24294178825525N4241C9T576', '63 225', '02 524', '1994-03-24', 'Divorcé(e)', 'Masculin', 0, 'ren', 'collet.elisabeth@noos.fr', NULL, NULL, '01 05 65 60 41', '0906070058', 4, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(26, 5, NULL, 1, 76, 2, 'Michel', 'Noel', '2016-09-21', 'Neveu', 'FR075184618713U1MY97VEVN834', '67473', '18831', '1985-04-15', 'Divorcé(e)', 'Féminin', 1, 'r', 'claude43@laposte.net', NULL, NULL, '0193573312', '+33 (0)3 11 69 27 29', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(27, 5, NULL, 1, 13, 1, 'Eugène', 'Martel', '2010-04-21', 'Martel-les-Bains', 'FR796099867855G2GZD17V61820', '61094', '94 301', '2015-08-01', 'Veuf(ve)', 'Masculin', 1, 'antoineriou@univ-thies.sn', 'fpruvost@sfr.fr', NULL, NULL, '09 75 67 67 48', '+33 (0)4 80 73 13 88', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(28, 5, NULL, 1, 235, 2, 'Suzanne', 'Navarro', '1972-03-21', 'Bouchet-les-Bains', 'FR117925237316FVMH724YLYL94', '65143', '86 807', '2017-05-01', 'Divorcé(e)', 'Féminin', 0, 'agn', 'uvidal@torres.fr', NULL, NULL, '01 81 49 57 77', '+33 (0)2 74 25 91 45', 8, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(29, 4, NULL, 1, 159, 1, 'Marc', 'Renaud', '2013-05-28', 'Alexandre', 'FR420981477495U1R7M0WKBE083', '22672', '07 631', '1992-08-27', 'Marié(e)', 'Féminin', 0, 'philippebesnard@univ-thies.sn', 'hhebert@blondel.net', NULL, NULL, '+33 6 50 80 73 67', '03 33 97 85 98', 8, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(30, 5, NULL, 1, 148, 3, 'Nath', 'Bailly', '1997-07-27', 'RocherBourg', 'FR854640667876C7D6549FHPG00', '20419', '64 058', '1985-01-20', 'Veuf(ve)', 'Féminin', 1, 'anastasie-maggievalette@univ-thies.sn', 'emaillet@guichard.fr', NULL, NULL, '+33 (0)9 60 91 22 91', '+33 2 63 85 00 35', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(31, 1, NULL, 1, 29, 2, 'Alfred', 'Maurice', '2019-07-16', 'Alves', 'FR0707828535809706196611I36', '91 268', '88 547', '2013-11-16', 'Divorcé(e)', 'Féminin', 1, 'charlotteimbert@univ-thies.sn', 'benjamin.giraud@marechal.org', NULL, NULL, '+33 1 85 08 57 74', '+33 (0)6 03 39 02 03', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(32, 4, NULL, 1, 220, 4, 'Véronique', 'Adam', '2018-05-24', 'Blondel', 'FR713518998533119MUYIQA6339', '10136', '86887', '1985-10-04', 'Marié(e)', 'Masculin', 0, 'rolandbodin@univ-thies.sn', 'fdossantos@renaud.fr', NULL, NULL, '07 69 00 18 71', '+33 1 49 35 82 19', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(33, 5, NULL, 1, 175, 3, 'Bernard', 'Vidal', '2002-08-11', 'Renaud-sur-Mer', 'FR7344437131677ET0H435O3P67', '96 250', '34 195', '2013-06-23', 'Marié(e)', 'Féminin', 0, 'rolandgallet@univ-thies.sn', 'dorothee30@ifrance.com', NULL, NULL, '08 23 93 76 91', '+33 7 73 43 48 09', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(34, 5, NULL, 1, 218, 3, 'William', 'Lelievre', '1970-01-27', 'Gonzalez', 'FR394066158404GL6881UXO8T21', '42327', '65 425', '2006-11-28', 'Divorcé(e)', 'Féminin', 1, 'alexandriamoulin@univ-thies.sn', 'wpasquier@hotmail.fr', NULL, NULL, '09 86 78 57 14', '0271234708', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(35, 1, NULL, 1, 129, 1, 'Émilie', 'Martinez', '1994-02-12', 'Mendes', 'FR1848741041134I72MZ0Q83L78', '23236', '74 678', '1972-12-26', 'Veuf(ve)', 'Féminin', 1, 'adriennemonnier@univ-thies.sn', 'vmartinez@tiscali.fr', NULL, NULL, '+33 9 66 62 03 89', '04 88 24 89 23', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(36, 5, NULL, 1, 127, 4, 'Étienne', 'Paris', '1980-11-22', 'Lesage', 'FR1099176010459J2QC572NEA97', '35 916', '75 020', '2011-09-08', 'Célibataire', 'Féminin', 0, 'annerousset@univ-thies.sn', 'gmarechal@guillon.fr', NULL, NULL, '+33 9 71 21 67 54', '09 95 20 05 95', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(37, 5, NULL, 1, 141, 1, 'Stéphane', 'Gonzalez', '1995-02-26', 'Martel-sur-Mer', 'FR2568211526333JIP661KMDP51', '76157', '14 642', '2001-10-16', 'Célibataire', 'Féminin', 0, 'robertbesnard-guibert@univ-thies.sn', 'emile65@gaillard.com', NULL, NULL, '+33 8 10 17 91 07', '+33 7 80 44 24 78', 5, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(38, 4, NULL, 1, 4, 4, 'Bernadette', 'Lemoine', '2003-09-28', 'Jean-sur-Julien', 'FR4951499866613SR88N6CD1012', '28 207', '77 322', '1976-07-10', 'Veuf(ve)', 'Masculin', 0, 'augustincordier-evrard@univ-thies.sn', 'leroux.elise@pinto.net', NULL, NULL, '+33 1 94 13 90 69', '+33 6 51 32 63 47', 6, NULL, '2021-05-31', 'Expiration Contrat', NULL, 9, NULL, NULL),
(39, 1, NULL, 1, 223, 1, 'Vincent', 'Garnier', '2001-03-05', 'Mary', 'FR373851212227809QG45P61591', '75 889', '26 143', '2001-03-29', 'Divorcé(e)', 'Masculin', 1, 'beno', 'monique87@club-internet.fr', NULL, NULL, '0434397085', '+33 7 97 60 54 56', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(40, 1, NULL, 1, 26, 3, 'Alexandre', 'Colin', '1995-07-01', 'BaronBourg', 'FR107969408416426A6I2A37M45', '16 210', '23661', '1986-07-12', 'Veuf(ve)', 'Féminin', 0, 'olivierberger@univ-thies.sn', 'diane.lecomte@perrier.com', NULL, NULL, '08 05 38 23 44', '+33 7 50 94 56 20', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(41, 1, NULL, 1, 236, 3, 'Denis', 'De Sousa', '2001-07-18', 'Pages', 'FR8665507313849J2525XVWL534', '60651', '00 010', '1986-07-11', 'Marié(e)', 'Masculin', 0, 'susannedijoux-boucher@univ-thies.sn', 'dumas.francois@dbmail.com', NULL, NULL, '0164359425', '01 20 73 79 58', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(42, 4, NULL, 1, 59, 1, 'Antoine', 'Delorme', '1987-04-11', 'Turpin-sur-Chauvet', 'FR930003285379L37H78W626882', '31 466', '06 885', '2011-10-26', 'Célibataire', 'Féminin', 0, 'anoukdeblin@univ-thies.sn', 'gantoine@camus.net', NULL, NULL, '0235490672', '0112535320', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(43, 5, NULL, 1, 195, 3, 'René', 'Baron', '2002-03-03', 'BlotBourg', 'FR5571785476982M1V2PM2A3663', '95 519', '56 710', '1990-07-28', 'Divorcé(e)', 'Féminin', 0, 'alixguillet@univ-thies.sn', 'iweiss@dubois.fr', NULL, NULL, '06 32 30 36 23', '07 49 87 52 71', 6, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(44, 1, NULL, 1, 35, 3, 'Juliette', 'Arnaud', '1999-08-13', 'Brunel', 'FR624370842074F3XBI333O7Q72', '64083', '69130', '2012-07-29', 'Divorcé(e)', 'Masculin', 0, 'marcdumas@univ-thies.sn', 'legall.leon@gay.fr', NULL, NULL, '+33 6 95 16 05 52', '+33 (0)7 41 85 76 58', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(45, 1, NULL, 1, 218, 2, 'Martin', 'Pinto', '2003-09-18', 'Lopes-sur-Mer', 'FR3836588474716Z856WWLC9171', '62348', '02 261', '1985-02-06', 'Veuf(ve)', 'Masculin', 0, 'julesbenard@univ-thies.sn', 'rousset.zacharie@guibert.fr', NULL, NULL, '+33 2 24 54 29 78', '05 05 18 46 90', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(46, 1, NULL, 1, 91, 3, 'Christine', 'Francois', '2016-05-22', 'Deschamps', 'FR35952132623532XWP9429S967', '11771', '22 093', '2002-01-23', 'Veuf(ve)', 'Masculin', 0, 'louis-j', 'bmerle@yahoo.fr', NULL, NULL, '0110351261', '+33 9 27 97 34 74', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(47, 5, NULL, 1, 95, 1, 'Olivier', 'Delannoy', '1986-08-08', 'Besnard-la-Forêt', 'FR142154647698D9154FFNW0G86', '63208', '03 298', '1973-08-17', 'Marié(e)', 'Féminin', 0, 'huguescollet@univ-thies.sn', 'emmanuelle07@laroche.com', NULL, NULL, '0826383679', '0824334346', 8, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(48, 1, NULL, 1, 47, 4, 'William', 'Dumas', '1986-07-06', 'Moulin-sur-Ramos', 'FR316371608007K569E9NG2TT93', '13713', '07449', '1970-01-13', 'Divorcé(e)', 'Féminin', 0, 'th', 'jules61@hardy.fr', NULL, NULL, '+33 9 91 96 21 23', '03 93 14 39 24', 7, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(49, 1, NULL, 1, 77, 4, 'Hortense', 'Delaunay', '1981-06-30', 'Pierre-sur-Bouchet', 'FR2015303972901CWTE24K9ZR37', '50708', '11 004', '2015-07-03', 'Célibataire', 'Féminin', 0, 'huguesdeoliveira@univ-thies.sn', 'roland.pineau@dbmail.com', NULL, NULL, '+33 (0)8 19 66 94 99', '0975460401', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(50, 5, NULL, 1, 40, 2, 'Patrick', 'Delahaye', '2009-01-08', 'Ruiz', 'FR2092962434835783U810YC119', '75 374', '90180', '1979-04-06', 'Divorcé(e)', 'Féminin', 0, 'franckcollet@univ-thies.sn', 'olivier.brunel@denis.fr', NULL, NULL, '+33 1 41 05 79 44', '08 15 05 24 54', 7, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(51, 4, NULL, 1, 43, 2, 'Pauline', 'Collet', '1973-10-25', 'Ollivier', 'FR922686321120604KBXD6B0586', '94834', '21 986', '2009-06-01', 'Célibataire', 'Masculin', 0, 'claudeaubert@univ-thies.sn', 'xpetit@voila.fr', NULL, NULL, '+33 (0)9 48 91 07 71', '+33 4 57 24 31 37', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(52, 5, NULL, 1, 154, 2, 'Margaret', 'Lefebvre', '2003-01-03', 'Thomasboeuf', 'FR337817598716LIZ0CI6OMV954', '36474', '15 757', '2004-06-30', 'Veuf(ve)', 'Masculin', 0, 'alexandrefouquet@univ-thies.sn', 'ofaivre@hamon.com', NULL, NULL, '+33 (0)1 36 83 05 33', '+33 (0)8 91 26 97 86', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(53, 4, NULL, 1, 166, 3, 'Madeleine', 'Bazin', '1994-02-17', 'Coste-sur-Morel', 'FR7935252687586E6E6B3103J88', '21226', '89 055', '1996-09-23', 'Veuf(ve)', 'Féminin', 0, 'laureauger-cousin@univ-thies.sn', 'josette.couturier@fischer.com', NULL, NULL, '0162544981', '+33 (0)1 39 71 39 30', 5, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(54, 1, NULL, 1, 73, 2, 'Tristan', 'Marin', '1975-12-04', 'Charles', 'FR536208416009540M7D7598N87', '38800', '36158', '1970-09-29', 'Divorcé(e)', 'Féminin', 1, 'juliettebriand@univ-thies.sn', 'vpasquier@courtois.fr', NULL, NULL, '07 49 20 59 84', '0590229955', 2, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(55, 1, NULL, 1, 61, 2, 'Caroline', 'Rodriguez', '1999-04-05', 'Brunel', 'FR141688260079U31G6F0U1X364', '45011', '10 973', '2011-09-22', 'Divorcé(e)', 'Masculin', 0, 'fran', 'alfred22@voila.fr', NULL, NULL, '+33 1 03 15 46 14', '+33 7 38 31 05 32', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(56, 1, NULL, 1, 72, 3, 'Maggie', 'Barbier', '1989-04-11', 'Blondel', 'FR448291736344ZNWAITBD0AG72', '90 342', '22 235', '1971-03-29', 'Célibataire', 'Masculin', 0, 'adrienloiseau@univ-thies.sn', 'petitjean.elisabeth@noos.fr', NULL, NULL, '0892794232', '01 53 56 90 78', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(57, 4, NULL, 1, 179, 3, 'Alain', 'Collet', '2010-04-04', 'Fernandez', 'FR2641498486935858S90JU5E80', '03 690', '10248', '2005-10-26', 'Divorcé(e)', 'Féminin', 0, 'ana', 'remy73@live.com', NULL, NULL, '01 55 51 22 13', '+33 8 98 74 57 22', 4, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(58, 4, NULL, 1, 182, 2, 'Dominique', 'Riviere', '1990-07-24', 'Bruneau', 'FR473976862077NG77VBI59WX70', '66 928', '28 615', '2018-12-09', 'Célibataire', 'Féminin', 1, 'beno', 'lebrun.emmanuel@hardy.com', NULL, NULL, '+33 (0)1 56 41 60 92', '+33 1 18 91 50 04', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(59, 5, NULL, 1, 128, 3, 'Frédérique', 'Michel', '1989-04-24', 'Pages', 'FR429404149605K5EXBIH0THL49', '90037', '86 755', '2015-02-14', 'Marié(e)', 'Féminin', 0, 'chantal-genevi', 'emeunier@live.com', NULL, NULL, '0292241900', '03 01 23 71 20', 5, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(60, 5, NULL, 1, 65, 4, 'Grégoire', 'Schmitt', '2012-01-15', 'Alexandre', 'FR095929951709K4900RQ50P799', '90 078', '55047', '1996-01-14', 'Divorcé(e)', 'Masculin', 0, 'thibaultlacroix@univ-thies.sn', 'odette33@yahoo.fr', NULL, NULL, '+33 6 07 10 20 80', '+33 1 79 11 73 14', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(61, 5, NULL, 1, 216, 3, 'Alfred', 'Pasquier', '2020-10-05', 'Teixeira', 'FR960466043119YW94UD642IK45', '08529', '79 168', '2005-12-25', 'Marié(e)', 'Masculin', 1, 'emmanuel-aim', 'garnier.yves@yahoo.fr', NULL, NULL, '0159819048', '0581315661', 9, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(62, 5, NULL, 1, 63, 2, 'Frédérique', 'Diallo', '2005-05-21', 'Bertin-sur-Mer', 'FR733446545829WR7GY4YX58637', '01669', '01708', '2000-08-05', 'Marié(e)', 'Féminin', 0, 'aim', 'gregoire.lopez@millet.fr', NULL, NULL, '+33 (0)5 71 46 34 13', '03 08 95 65 15', 9, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(63, 4, NULL, 1, 224, 1, 'Étienne', 'Andre', '1996-11-14', 'Lecomte', 'FR6360755113501BKA6U18OY095', '62 628', '79593', '1985-01-20', 'Marié(e)', 'Masculin', 1, 'audreyferrand-bonneau@univ-thies.sn', 'laurent.gaillard@tele2.fr', NULL, NULL, '06 42 25 75 70', '0917080969', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(64, 5, NULL, 1, 194, 3, 'Édouard', 'Roux', '1972-11-12', 'Techer-sur-Morel', 'FR08129899133893RB7223A8790', '11 584', '67103', '1973-03-15', 'Veuf(ve)', 'Féminin', 1, 'paul-franckdacosta@univ-thies.sn', 'emichel@laposte.net', NULL, NULL, '+33 1 03 07 09 59', '08 21 45 63 01', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(65, 4, NULL, 1, 179, 1, 'Aimé', 'Delannoy', '1990-02-11', 'Jacquot', 'FR66336591578590V0M0CW53184', '31618', '73745', '1987-10-27', 'Veuf(ve)', 'Féminin', 0, '', 'cblondel@benard.com', NULL, NULL, '0282498675', '01 50 96 68 50', 7, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(66, 1, NULL, 1, 100, 3, 'Jeannine', 'Lombard', '1995-04-13', 'Reynauddan', 'FR694836881157TK9701803N679', '21657', '87 085', '1999-02-12', 'Divorcé(e)', 'Masculin', 1, 'michelvoisin@univ-thies.sn', 'andre80@live.com', NULL, NULL, '+33 (0)6 09 34 94 76', '+33 (0)1 34 89 79 76', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(67, 4, NULL, 1, 84, 3, 'Alfred', 'Leblanc', '1986-05-21', 'Pasquier-sur-Mer', 'FR566964612251C3LTSZ9S43D06', '06626', '89 436', '2014-06-11', 'Célibataire', 'Féminin', 0, 'alfreddelavincent@univ-thies.sn', 'bmartel@orange.fr', NULL, NULL, '01 30 38 44 55', '05 85 21 68 17', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(68, 4, NULL, 1, 233, 3, 'Susan', 'Charrier', '1994-05-09', 'Faivre', 'FR2164747923741NNE88849Q261', '04 627', '12308', '1982-06-17', 'Célibataire', 'Masculin', 1, 'antoine-beno', 'costa.jacques@ifrance.com', NULL, NULL, '+33 5 64 58 32 79', '+33 (0)6 93 33 45 32', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(69, 4, NULL, 1, 96, 3, 'Hélène', 'Da Costa', '1978-04-11', 'Gauthierboeuf', 'FR806330664339E864M1WF29682', '82774', '33624', '1988-08-24', 'Veuf(ve)', 'Féminin', 0, 'augustincoste@univ-thies.sn', 'maurice.christine@delorme.com', NULL, NULL, '0309191931', '01 86 75 90 74', 4, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(70, 5, NULL, 1, 242, 3, 'Patrick', 'Legros', '2018-06-03', 'ColletBourg', 'FR153944446546116E616JMZ988', '25143', '52757', '2016-01-19', 'Marié(e)', 'Féminin', 0, 'virginielegendre@univ-thies.sn', 'irolland@lemaitre.com', NULL, NULL, '+33 5 97 15 68 84', '+33 1 89 88 73 16', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(71, 5, NULL, 1, 142, 1, 'Adrien', 'Chartier', '2007-03-10', 'Lesage', 'FR6745235475909E0DY70831987', '82 236', '59471', '2020-06-14', 'Marié(e)', 'Masculin', 0, 'sophieroy@univ-thies.sn', 'vmaury@tele2.fr', NULL, NULL, '+33 7 44 39 81 40', '04 34 44 85 03', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(72, 4, NULL, 1, 89, 2, 'Léon', 'Bazin', '2000-05-09', 'Rousset', 'FR157996134537309B7T1VWW305', '59 184', '60753', '1988-04-09', 'Veuf(ve)', 'Féminin', 0, 'alfredpires-costa@univ-thies.sn', 'pierre.francois@marion.fr', NULL, NULL, '04 06 93 46 14', '+33 3 40 86 36 24', 1, NULL, '2020-05-06', 'Retraite', NULL, 16, NULL, NULL),
(73, 1, NULL, 1, 231, 2, 'Adélaïde', 'Humbert', '1977-01-25', 'Poirier', 'FR624421666725S05U0HPYG6J04', '05 283', '28622', '1988-06-04', 'Marié(e)', 'Masculin', 0, 'margotdurand-henry@univ-thies.sn', 'alphonse.lebrun@gmail.com', NULL, NULL, '+33 6 69 70 17 30', '+33 (0)2 59 50 11 03', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(74, 5, NULL, 1, 174, 4, 'Emmanuel', 'Lemaire', '1987-08-06', 'Deschamps', 'FR9564711681838E914SUK0X694', '55 628', '51 063', '1982-04-08', 'Marié(e)', 'Féminin', 1, 'suzanneleroux@univ-thies.sn', 'germain.paulette@voila.fr', NULL, NULL, '04 36 84 70 24', '0318157332', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(75, 4, NULL, 1, 217, 3, 'Aimée', 'Goncalves', '1975-06-26', 'Pascal', 'FR780828433375F6GJMDK77MB31', '98518', '67863', '2006-11-04', 'Divorcé(e)', 'Féminin', 0, 'marthederichard@univ-thies.sn', 'auguste51@lejeune.com', NULL, NULL, '05 70 83 60 18', '+33 (0)5 40 83 78 58', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(76, 5, NULL, 1, 118, 1, 'Victoire', 'Rolland', '1978-01-01', 'Caron-sur-Pinto', 'FR95631391410735B8IT83FMY59', '97191', '17306', '2008-10-22', 'Marié(e)', 'Féminin', 0, 'anouk-philippinebourdon@univ-thies.sn', 'sleconte@nicolas.com', NULL, NULL, '0379510480', '04 31 42 40 85', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(77, 1, NULL, 1, 80, 1, 'Margot', 'Traore', '1994-01-10', 'Fouquet-sur-Martineau', 'FR89769167681923S57CZ5Y4823', '21 567', '39 412', '2016-05-05', 'Célibataire', 'Masculin', 1, 'dominiqueguillot@univ-thies.sn', 'peron.laurent@thibault.com', NULL, NULL, '04 92 16 88 84', '0964396917', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(78, 1, NULL, 1, 240, 1, 'Éléonore', 'Teixeira', '1981-09-07', 'Meunier', 'FR2158745667128456SW280U611', '41 772', '99069', '2004-12-26', 'Veuf(ve)', 'Féminin', 0, 'bernadetteduhamel@univ-thies.sn', 'vpaul@wanadoo.fr', NULL, NULL, '02 87 06 75 90', '+33 4 06 22 95 29', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(79, 4, NULL, 1, 204, 3, 'Inès', 'Verdier', '2004-03-02', 'Perrinboeuf', 'FR536510219181IVEF18686V795', '06 351', '50298', '1992-12-15', 'Célibataire', 'Masculin', 0, 'pierredurodrigues@univ-thies.sn', 'francois.bailly@clement.org', NULL, NULL, '+33 (0)5 21 57 93 88', '+33 1 81 00 31 71', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(80, 4, NULL, 1, 137, 4, 'Augustin', 'Jacquet', '2009-05-01', 'FleuryVille', 'FR0269136588801HB9QHKXD3H01', '95522', '50490', '2015-05-26', 'Célibataire', 'Féminin', 0, 'madeleinepineau@univ-thies.sn', 'roger.raynaud@germain.com', NULL, NULL, '+33 6 73 67 46 08', '03 39 10 01 91', 1, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(81, 1, NULL, 1, 132, 2, 'Dominique', 'Chauvet', '1971-04-24', 'Wagner-sur-Martel', 'FR095720832786TKYYK0CB1P266', '05413', '56 926', '1981-05-29', 'Divorcé(e)', 'Masculin', 1, 'anoukleconte@univ-thies.sn', 'collet.gabriel@camus.com', NULL, NULL, '+33 (0)2 55 97 54 12', '06 84 25 91 46', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(82, 4, NULL, 1, 1, 3, 'Capucine', 'Guillot', '1981-07-29', 'Diaz-la-Forêt', 'FR477980370256B395C753E0E44', '54958', '67774', '1990-03-07', 'Marié(e)', 'Féminin', 1, 'michelhubert@univ-thies.sn', 'onicolas@gilles.com', NULL, NULL, '03 26 34 65 66', '04 69 99 49 95', 8, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(83, 4, NULL, 1, 22, 4, 'Bernard', 'Guibert', '1999-10-03', 'Auger', 'FR879186891230AV3WW0C038V73', '57611', '62 638', '1980-02-07', 'Veuf(ve)', 'Féminin', 1, 'am', 'helene41@verdier.org', NULL, NULL, '+33 5 98 18 48 02', '+33 (0)7 94 95 56 90', 4, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(84, 1, NULL, 1, 231, 3, 'Étienne', 'Louis', '1988-12-14', 'Bouvier', 'FR95484278528001LNQ81BFF712', '34466', '33453', '2020-07-16', 'Divorcé(e)', 'Masculin', 0, 'yveschauvet-techer@univ-thies.sn', 'christine.coulon@antoine.fr', NULL, NULL, '0146959597', '03 18 32 57 94', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(85, 4, NULL, 1, 62, 1, 'Lorraine', 'Blondel', '1984-06-08', 'Fouquet', 'FR1840478508597A28A230A8E06', '49 401', '60361', '2006-11-04', 'Divorcé(e)', 'Féminin', 1, 'alicerichard@univ-thies.sn', 'michel.giraud@bernier.net', NULL, NULL, '+33 1 63 24 41 55', '07 81 01 70 55', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(86, 5, NULL, 1, 38, 1, 'Christiane', 'Legendre', '1993-01-12', 'Traore-sur-Mer', 'FR194445873067A4899XK3OCD36', '70932', '11 674', '2001-06-25', 'Veuf(ve)', 'Masculin', 0, 'marcguyot@univ-thies.sn', 'besson.stephanie@dbmail.com', NULL, NULL, '0270113607', '0277191392', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(87, 4, NULL, 1, 112, 4, 'Lucy', 'Bourdon', '1999-12-07', 'FischerVille', 'FR37703910779613RJUP5B53747', '80433', '79022', '2010-07-16', 'Divorcé(e)', 'Masculin', 1, 'rogerdupottier@univ-thies.sn', 'margot84@ifrance.com', NULL, NULL, '0792155224', '+33 (0)4 53 16 84 41', 9, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(88, 1, NULL, 1, 97, 1, 'Benoît', 'Ruiz', '1998-01-26', 'Lacroix', 'FR490525473426S6E1B230I9S00', '23 679', '10957', '1970-10-19', 'Marié(e)', 'Féminin', 0, 'lucgrondin-meyer@univ-thies.sn', 'ollivier.laurent@legendre.fr', NULL, NULL, '0762788320', '0405188879', 5, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(89, 4, NULL, 1, 80, 1, 'Agnès', 'Royer', '1970-03-30', 'Antoine-les-Bains', 'FR589415736620C1D41A8551513', '48 053', '90 845', '1982-05-01', 'Célibataire', 'Féminin', 1, 'augustefrancois@univ-thies.sn', 'rlejeune@laposte.net', NULL, NULL, '+33 4 92 11 41 53', '+33 2 18 32 24 67', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(90, 1, NULL, 1, 105, 4, 'Patrick', 'Fabre', '1977-06-24', 'Dupuis-sur-Vasseur', 'FR9200678967822QHIK69619L07', '41760', '88501', '2020-06-20', 'Célibataire', 'Masculin', 1, 'anoukmarques@univ-thies.sn', 'maillard.margot@free.fr', NULL, NULL, '+33 (0)3 26 25 36 21', '+33 (0)4 78 22 20 73', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(91, 1, NULL, 1, 15, 4, 'Nicole', 'Traore', '1995-05-26', 'Garnierdan', 'FR2363786591513A1KV4792N859', '55592', '97 863', '2005-03-03', 'Marié(e)', 'Masculin', 1, 'alexandriemartins@univ-thies.sn', 'moulin.monique@loiseau.fr', NULL, NULL, '06 60 36 86 37', '+33 2 58 07 57 62', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(92, 5, NULL, 1, 165, 2, 'Édith', 'Rodrigues', '2008-11-02', 'Guillot', 'FR6712766351633L9FYZ7V9S319', '50 186', '44 807', '1984-08-28', 'Divorcé(e)', 'Masculin', 1, 'paulettehuet@univ-thies.sn', 'xavier.clement@parent.net', NULL, NULL, '0160912849', '+33 (0)8 04 04 51 01', 5, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(93, 5, NULL, 1, 82, 1, 'Arthur', 'Dos Santos', '2013-09-20', 'Fernandesnec', 'FR687025411146J90YP64GU3645', '42 950', '01 445', '1976-12-16', 'Marié(e)', 'Féminin', 0, 'margotpereira@univ-thies.sn', 'lejeune.lorraine@voila.fr', NULL, NULL, '+33 (0)9 21 30 25 44', '+33 2 23 70 79 09', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(94, 5, NULL, 1, 135, 2, 'Noël', 'Lacombe', '2020-02-03', 'Langlois', 'FR5344600261471RXI7X0M5J118', '40756', '12981', '2010-08-11', 'Divorcé(e)', 'Féminin', 0, 'augustin-', 'martin46@barre.com', NULL, NULL, '0744617212', '0361872715', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(95, 1, NULL, 1, 175, 3, 'Pauline', 'Pottier', '1994-03-20', 'Hubertboeuf', 'FR724572422146V0102B23XIU89', '91804', '03 370', '1982-12-31', 'Marié(e)', 'Masculin', 1, 'margaretgros@univ-thies.sn', 'jerome81@andre.com', NULL, NULL, '+33 (0)1 36 78 29 69', '+33 (0)5 13 06 68 47', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(96, 5, NULL, 1, 51, 2, 'Matthieu', 'Regnier', '1998-05-06', 'Morvan', 'FR213856304326348UVV24I4T48', '19448', '28 518', '2002-10-03', 'Divorcé(e)', 'Féminin', 1, 'paulinelevy@univ-thies.sn', 'arthur.techer@blondel.net', NULL, NULL, '+33 1 95 37 30 79', '+33 8 21 82 32 23', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(97, 5, NULL, 1, 126, 4, 'Guillaume', 'Moulin', '1991-09-19', 'Vidal-sur-Mer', 'FR2476036251117YH9N14PJ6186', '40790', '32 114', '1981-02-22', 'Célibataire', 'Féminin', 1, 'moniqueadam-turpin@univ-thies.sn', 'qfoucher@vaillant.com', NULL, NULL, '0113818688', '+33 (0)8 27 00 18 09', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(98, 4, NULL, 1, 34, 2, 'Yves', 'Alexandre', '1978-10-29', 'PayetVille', 'FR261415436531IOKN838843009', '64 753', '06255', '2000-10-26', 'Veuf(ve)', 'Féminin', 1, 'victorfrancois-merle@univ-thies.sn', 'sylvie.alexandre@pages.fr', NULL, NULL, '0279784916', '0167164161', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(99, 5, NULL, 1, 61, 2, 'René', 'Martin', '2012-10-22', 'Humbert', 'FR714892861371MAS366O5M5X90', '31129', '71 800', '1988-05-07', 'Marié(e)', 'Masculin', 0, 'zo', 'oceane.laporte@delaunay.net', NULL, NULL, '04 77 12 32 99', '07 99 04 63 20', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(100, 1, NULL, 1, 218, 2, 'Frédérique', 'Mary', '2004-08-04', 'Carlier-sur-Lambert', 'FR90643982800188B7NI3E87823', '37123', '07730', '2004-03-03', 'Marié(e)', 'Féminin', 0, 'christianeleconte@univ-thies.sn', 'william.coste@martins.com', NULL, NULL, '06 27 72 66 57', '+33 (0)3 44 70 01 08', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(101, 1, NULL, 1, 13, 4, 'Noémi', 'Bernier', '2010-06-10', 'Dupuy-sur-Chevalier', 'FR18700357277302W30TX78ML24', '40 496', '27725', '1970-01-09', 'Divorcé(e)', 'Masculin', 0, 'agn', 'dominique47@live.com', NULL, NULL, '+33 5 42 85 46 24', '+33 2 22 23 43 12', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(102, 5, NULL, 1, 142, 4, 'Dominique', 'Bazin', '1972-11-02', 'Gerard', 'FR2635807820821JOLYD43TIH99', '48 663', '29 860', '2008-05-13', 'Divorcé(e)', 'Masculin', 0, 'andr', 'gilles.wagner@gmail.com', NULL, NULL, '09 43 26 97 38', '0154595879', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(103, 5, NULL, 1, 168, 2, 'Henriette', 'Neveu', '2000-03-26', 'Gillet', 'FR5967092462431B557B9N75125', '40 269', '04656', '2020-02-18', 'Veuf(ve)', 'Féminin', 1, 'eug', 'omerle@rousseau.fr', NULL, NULL, '+33 (0)2 01 24 37 82', '04 35 50 77 70', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(104, 4, NULL, 1, 193, 2, 'Noémi', 'Dijoux', '2018-02-25', 'Samson', 'FR608138830982W5P4L8C618N71', '83660', '34046', '1974-08-08', 'Veuf(ve)', 'Féminin', 1, 'martineschneider@univ-thies.sn', 'baudry.dominique@orange.fr', NULL, NULL, '+33 (0)1 83 87 26 19', '07 91 37 51 75', 1, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(105, 5, NULL, 1, 17, 4, 'Céline', 'Parent', '1986-03-11', 'Maurice', 'FR160190365171BXS20W3I06892', '45 016', '34 549', '2001-08-04', 'Divorcé(e)', 'Féminin', 0, 'catherinebriand@univ-thies.sn', 'nguilbert@bouygtel.fr', NULL, NULL, '+33 4 48 51 94 62', '09 41 68 60 44', 4, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(106, 5, NULL, 1, 4, 2, 'Michel', 'Merle', '1990-05-08', 'Voisindan', 'FR8371031780831V862M99X5538', '12444', '29953', '1970-06-02', 'Divorcé(e)', 'Féminin', 0, 'am', 'christelle44@picard.com', NULL, NULL, '03 05 80 53 69', '07 61 50 96 33', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(107, 1, NULL, 1, 148, 2, 'Christophe', 'Roux', '1981-02-03', 'Sanchez', 'FR984952592974AX95O68082633', '13263', '94 746', '1990-12-29', 'Veuf(ve)', 'Féminin', 0, 'jacques-ren', 'navarro.luc@hoareau.fr', NULL, NULL, '+33 6 54 08 81 61', '0798980939', 4, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(108, 4, NULL, 1, 238, 4, 'Émile', 'Leclercq', '1981-05-02', 'Arnaud', 'FR036851128355B7S46NSXIC367', '50036', '74147', '1996-04-24', 'Divorcé(e)', 'Féminin', 1, 'lucasdeguyot@univ-thies.sn', 'dtraore@gmail.com', NULL, NULL, '07 72 11 66 41', '+33 (0)6 75 87 52 01', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(109, 1, NULL, 1, 51, 4, 'Richard', 'Nguyen', '1981-06-09', 'Barondan', 'FR471317934575B3U4WRI7I9101', '27 579', '51 803', '2018-09-12', 'Divorcé(e)', 'Féminin', 1, 'hugues-gillesdelmas@univ-thies.sn', 'dperret@ledoux.org', NULL, NULL, '+33 (0)3 33 33 09 28', '+33 (0)1 43 32 20 77', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(110, 1, NULL, 1, 240, 3, 'Hortense', 'Moreau', '1972-06-07', 'SamsonBourg', 'FR9119536285148G1K2674Q4X08', '92 759', '44866', '1991-08-25', 'Divorcé(e)', 'Masculin', 0, 'anastasiecollin@univ-thies.sn', 'josette.david@wanadoo.fr', NULL, NULL, '04 44 57 27 97', '0125132783', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(111, 4, NULL, 1, 209, 1, 'Augustin', 'Torres', '1995-04-05', 'Bousquet', 'FR9630271336095V3C3LZPR9520', '62 513', '33929', '2002-10-05', 'Marié(e)', 'Féminin', 1, '', 'aubert.claude@rousseau.fr', NULL, NULL, '02 25 97 99 55', '05 50 04 07 49', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(112, 4, NULL, 1, 96, 2, 'Adèle', 'Bertrand', '1979-12-05', 'Cohen-la-Forêt', 'FR7428290567095XOXVR8914235', '54004', '47996', '1992-03-20', 'Marié(e)', 'Masculin', 0, 'jeanninevaillant@univ-thies.sn', 'delattre.louis@bouygtel.fr', NULL, NULL, '+33 7 33 84 14 76', '03 85 21 74 58', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(113, 4, NULL, 1, 195, 4, 'Caroline', 'Dupre', '1987-05-22', 'Lombard', 'FR7528018896044CC605TUF6528', '80 460', '69840', '1985-10-31', 'Marié(e)', 'Masculin', 1, 'beno', 'ibenard@live.com', NULL, NULL, '03 24 83 33 69', '0133584526', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(114, 1, NULL, 1, 207, 1, 'Joséphine', 'Faivre', '1981-03-05', 'Jean', 'FR187244577374W652KPPR02C51', '46 807', '74095', '1975-10-28', 'Célibataire', 'Masculin', 0, 'fran', 'llaunay@live.com', NULL, NULL, '01 42 89 69 02', '02 72 58 71 14', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(115, 5, NULL, 1, 78, 2, 'Adrienne', 'Lemaitre', '1974-08-13', 'Toussaint-la-Forêt', 'FR716504172238T83W4BOKL0F54', '03 904', '68684', '1980-12-17', 'Marié(e)', 'Féminin', 0, 'lucdelagosselin@univ-thies.sn', 'arnaude67@noos.fr', NULL, NULL, '+33 (0)3 28 60 02 28', '+33 (0)8 01 18 76 48', 7, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(116, 4, NULL, 1, 20, 2, 'Emmanuel', 'Fontaine', '1975-05-26', 'Labbe', 'FR059477205583CJ3117XD1MI56', '34803', '35 457', '1984-09-11', 'Marié(e)', 'Masculin', 1, 'zo', 'margot.cordier@fouquet.com', NULL, NULL, '09 58 35 72 83', '+33 (0)5 16 64 32 94', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(117, 4, NULL, 1, 103, 3, 'Odette', 'Duval', '2007-04-04', 'Mendes', 'FR6601621772154HI9D64B7X933', '89721', '47 472', '1991-11-20', 'Célibataire', 'Masculin', 1, '', 'maillard.guy@bruneau.fr', NULL, NULL, '05 95 02 84 62', '08 23 18 43 19', 9, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(118, 1, NULL, 1, 55, 3, 'Joséphine', 'Philippe', '1977-04-07', 'Meyerboeuf', 'FR705892039397GV2DS13I28N99', '11316', '33 132', '2013-04-24', 'Divorcé(e)', 'Masculin', 0, 'jeanmeunier@univ-thies.sn', 'maurice.renault@voila.fr', NULL, NULL, '0608799841', '06 65 58 13 56', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(119, 5, NULL, 1, 38, 1, 'Joseph', 'Vasseur', '1993-02-19', 'Meyer-sur-Lopez', 'FR397076961313A2TEFQF6OQG32', '33 962', '83960', '1984-12-02', 'Marié(e)', 'Masculin', 0, 'louisefrancois@univ-thies.sn', 'xmarechal@hotmail.fr', NULL, NULL, '+33 9 54 21 90 34', '09 80 53 25 79', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(120, 1, NULL, 1, 207, 1, 'Monique', 'Bourdon', '2016-12-10', 'Gosselin', 'FR434769892376510N6E5A50B60', '04 798', '89665', '1979-04-26', 'Célibataire', 'Masculin', 1, 'alice-ren', 'adelaide52@gmail.com', NULL, NULL, '+33 (0)1 92 05 41 96', '+33 (0)3 99 05 17 18', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(121, 5, NULL, 1, 72, 1, 'Suzanne', 'Poirier', '1977-02-03', 'Leclerc', 'FR76891997744960S8P92KW6C49', '25 688', '16052', '2008-09-21', 'Marié(e)', 'Masculin', 1, 'carolineguillaume@univ-thies.sn', 'bernadette23@masson.net', NULL, NULL, '0502153320', '0419705818', 2, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(122, 4, NULL, 1, 138, 3, 'Denis', 'Gilles', '1978-04-06', 'Gautier', 'FR7154795860583WOXLE6VSIR88', '13 961', '61 178', '1999-04-30', 'Célibataire', 'Masculin', 0, 'jeanninederemy@univ-thies.sn', 'marianne.meunier@laposte.net', NULL, NULL, '06 20 95 09 91', '+33 (0)5 85 84 43 06', 4, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(123, 1, NULL, 1, 157, 1, 'Georges', 'Girard', '2000-12-04', 'Chauvin', 'FR07206719822720870V2EL5P74', '45712', '52415', '2002-02-11', 'Célibataire', 'Masculin', 1, 'alexandriedossantos@univ-thies.sn', 'christophe89@gonzalez.org', NULL, NULL, '+33 1 47 65 85 49', '+33 (0)5 99 32 85 54', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(124, 4, NULL, 1, 44, 3, 'Nathalie', 'Costa', '2019-12-15', 'Nguyen', 'FR937002146760E328B18PYGY49', '25240', '89305', '2019-09-17', 'Divorcé(e)', 'Féminin', 0, 'xavierdelachretien@univ-thies.sn', 'luc23@pereira.net', NULL, NULL, '+33 1 75 13 17 76', '+33 6 08 46 61 90', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(125, 1, NULL, 1, 207, 4, 'Bernard', 'Fernandes', '2018-01-19', 'Langlois', 'FR233449804942716QW408J6625', '12538', '85 636', '1978-05-09', 'Célibataire', 'Féminin', 1, 'daniel-augustinboyer@univ-thies.sn', 'delannoy.jules@paul.fr', NULL, NULL, '05 61 94 15 47', '05 51 35 72 00', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(126, 1, NULL, 1, 227, 4, 'Suzanne', 'Lefort', '1987-11-24', 'Gillet', 'FR6356621741564X9CE78EG8B12', '46731', '05 908', '1982-03-31', 'Divorcé(e)', 'Masculin', 0, 'marc-jacquessamson@univ-thies.sn', 'gauthier.olivier@marin.fr', NULL, NULL, '0694606319', '+33 (0)7 77 54 64 77', 5, NULL, NULL, 'Démission', NULL, 16, NULL, NULL),
(127, 5, NULL, 1, 48, 1, 'Auguste', 'Leclerc', '1997-02-08', 'GalletVille', 'FR413873154225I3U067Q6ZNL03', '84561', '15573', '2012-09-20', 'Divorcé(e)', 'Féminin', 0, 'louisearnaud-devaux@univ-thies.sn', 'thierry21@roger.fr', NULL, NULL, '+33 1 39 55 49 22', '+33 (0)9 35 09 41 93', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(128, 4, NULL, 1, 211, 2, 'Raymond', 'Sauvage', '1985-11-11', 'Pages', 'FR4397259489704ND4BCRJS6R89', '01865', '13077', '2001-09-21', 'Divorcé(e)', 'Féminin', 0, 'andr', 'guy.hoarau@maillet.org', NULL, NULL, '+33 5 05 74 61 56', '01 97 46 04 95', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(129, 5, NULL, 1, 46, 3, 'Roger', 'Garnier', '1989-01-13', 'Vincent', 'FR1879277974173ZB80EVYC8S74', '87 605', '28644', '1996-10-21', 'Marié(e)', 'Masculin', 1, 'claireleroux@univ-thies.sn', 'ygarcia@tiscali.fr', NULL, NULL, '0769953154', '04 67 60 70 67', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(130, 4, NULL, 1, 242, 2, 'Jérôme', 'Martin', '2008-02-20', 'Roussel', 'FR23037924452580KT5R97A9509', '42 706', '96 818', '2011-05-12', 'Célibataire', 'Masculin', 1, 'carolinemercier@univ-thies.sn', 'alice.bertrand@bouygtel.fr', NULL, NULL, '+33 6 23 62 31 74', '+33 8 05 90 11 99', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(131, 4, NULL, 1, 68, 3, 'Geneviève', 'Dupuis', '1974-09-18', 'Launaynec', 'FR0904157198929G4I0ZL0PK806', '41 258', '77 547', '2014-12-04', 'Veuf(ve)', 'Féminin', 0, 'laure-lorrainejoseph@univ-thies.sn', 'lecoq.adrienne@noos.fr', NULL, NULL, '+33 (0)5 89 55 53 74', '+33 4 27 20 28 96', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(132, 1, NULL, 1, 209, 1, 'Suzanne', 'Guyon', '2007-11-22', 'Carlier-sur-Millet', 'FR2478236528442V48K0EW6MA38', '20859', '32933', '2006-01-15', 'Veuf(ve)', 'Masculin', 1, 'christophejoly@univ-thies.sn', 'allard.matthieu@blanchard.org', NULL, NULL, '+33 (0)9 80 84 37 24', '0215501727', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(133, 1, NULL, 1, 34, 1, 'Auguste', 'Robin', '2011-07-15', 'Guillot-sur-Aubert', 'FR623363153770QNOU2LD2LM294', '46 400', '75333', '2017-10-08', 'Marié(e)', 'Masculin', 0, 'patrickpetit-durand@univ-thies.sn', 'odiaz@sfr.fr', NULL, NULL, '0575268850', '+33 4 79 78 65 26', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(134, 5, NULL, 1, 132, 1, 'Sabine', 'Chauvet', '2002-10-23', 'Vincent', 'FR209573618793327UB9OM37B65', '89 988', '22 383', '1970-11-19', 'Célibataire', 'Féminin', 1, 'huguesraymond@univ-thies.sn', 'follivier@baron.org', NULL, NULL, '+33 (0)4 93 41 43 41', '+33 4 21 77 68 52', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(135, 4, NULL, 1, 153, 4, 'Patrick', 'Gilles', '1978-05-11', 'De Oliveira-sur-Coulon', 'FR5616805888924KGN6UB3Y4N11', '26196', '81108', '2007-03-20', 'Divorcé(e)', 'Féminin', 0, 'charlesbrunet@univ-thies.sn', 'julien.techer@bouygtel.fr', NULL, NULL, '+33 (0)2 49 22 52 82', '09 70 81 97 30', 9, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(136, 5, NULL, 1, 153, 3, 'Stéphanie', 'Meunier', '2000-11-30', 'Meyer-sur-Boulay', 'FR74288963590282Z71M8977420', '89882', '22212', '1985-06-09', 'Marié(e)', 'Féminin', 0, 'alexandredelaphilippe@univ-thies.sn', 'stephane49@colas.com', NULL, NULL, '+33 (0)8 93 19 30 44', '0603374143', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(137, 1, NULL, 1, 70, 2, 'Grégoire', 'Techer', '2004-09-01', 'PoirierVille', 'FR368949759745I8WNU74918051', '33840', '53 443', '2017-03-29', 'Célibataire', 'Féminin', 0, 'adrienpichon-mercier@univ-thies.sn', 'stephane.girard@yahoo.fr', NULL, NULL, '+33 (0)3 66 52 23 74', '0113045565', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(138, 4, NULL, 1, 73, 1, 'Éric', 'Vallet', '1999-05-09', 'Deschamps-la-Forêt', 'FR908984743596CKW88Q63T6211', '42 450', '57 990', '2018-06-05', 'Célibataire', 'Masculin', 0, 'juliechartier@univ-thies.sn', 'caroline.chauvet@poirier.fr', NULL, NULL, '+33 8 97 38 13 38', '03 40 38 70 76', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(139, 1, NULL, 1, 133, 2, 'Benjamin', 'Durand', '1990-01-04', 'Carlier', 'FR2494754307626Y0M282J8V106', '13853', '50 413', '1973-01-21', 'Marié(e)', 'Masculin', 0, 'g', 'fouquet.genevieve@orange.fr', NULL, NULL, '+33 5 01 59 79 03', '+33 (0)6 24 08 43 23', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(140, 4, NULL, 1, 118, 3, 'Luc', 'Antoine', '2013-02-10', 'Navarro', 'FR9041723657534772INMY4M698', '21 606', '60 556', '1981-01-05', 'Célibataire', 'Féminin', 1, 'victorbazin@univ-thies.sn', 'tessier.nath@gomes.fr', NULL, NULL, '+33 1 46 55 88 14', '01 71 04 50 56', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(141, 4, NULL, 1, 92, 4, 'Michelle', 'Leroux', '2011-06-10', 'Foucher-sur-Buisson', 'FR290589514173L3QL5FGJV2M75', '68 554', '52334', '1999-02-21', 'Veuf(ve)', 'Féminin', 1, 'gilbertbernard-techer@univ-thies.sn', 'legoff.augustin@carlier.fr', NULL, NULL, '01 28 41 41 48', '01 15 56 52 22', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(142, 4, NULL, 1, 1, 4, 'Michel', 'Lamy', '2002-11-10', 'Sauvage-sur-Foucher', 'FR021851085741XO6UG5HPK8H54', '17 181', '71260', '1989-08-16', 'Marié(e)', 'Féminin', 1, 'th', 'genevieve25@dubois.com', NULL, NULL, '+33 (0)5 01 37 56 09', '+33 1 34 41 51 03', 4, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(143, 4, NULL, 1, 55, 4, 'Valentine', 'Lesage', '1993-07-04', 'Perrot-sur-Leveque', 'FR352548300585AKESQMZM3S280', '75 421', '93909', '2009-10-22', 'Divorcé(e)', 'Féminin', 0, 'guillaumedemichel@univ-thies.sn', 'ifoucher@traore.com', NULL, NULL, '05 38 00 07 05', '+33 3 08 26 49 69', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(144, 5, NULL, 1, 215, 4, 'Noël', 'Gaillard', '2003-04-05', 'Tessier-sur-Hamel', 'FR6258106732102DS6M8GB53M09', '42149', '78352', '2011-07-24', 'Célibataire', 'Masculin', 1, 'xavierrossi@univ-thies.sn', 'pleblanc@noos.fr', NULL, NULL, '01 61 84 26 49', '0963645427', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(145, 5, NULL, 1, 143, 1, 'Jérôme', 'Gerard', '1979-02-08', 'Bertin', 'FR673278526566IA9489306KL01', '98 483', '60015', '1994-06-19', 'Veuf(ve)', 'Masculin', 0, '', 'gregoire42@philippe.net', NULL, NULL, '0534046370', '+33 (0)3 14 08 37 00', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(146, 4, NULL, 1, 128, 3, 'Monique', 'Morvan', '1984-05-23', 'Gautier-sur-Mer', 'FR02590338295710A2Z6AFO2V13', '51457', '63 246', '2019-05-21', 'Veuf(ve)', 'Féminin', 1, 'clairemartinez@univ-thies.sn', 'jacques60@dbmail.com', NULL, NULL, '+33 6 69 02 05 24', '+33 7 45 85 06 81', 8, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(147, 4, NULL, 1, 140, 3, 'Zacharie', 'Laine', '1994-09-25', 'Andre', 'FR8336838478483F2PUT6DEXD73', '21775', '04 161', '2008-10-08', 'Marié(e)', 'Masculin', 0, 'maggiedelorme-antoine@univ-thies.sn', 'colette91@live.com', NULL, NULL, '08 06 69 28 46', '0377305373', 8, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(148, 4, NULL, 1, 106, 4, 'Chantal', 'Nguyen', '1993-06-14', 'BoyerVille', 'FR30809701974068A02C1G9F786', '57 770', '34 842', '1996-09-21', 'Veuf(ve)', 'Féminin', 0, 'lucieleroux@univ-thies.sn', 'hcoulon@laroche.com', NULL, NULL, '+33 8 91 16 86 53', '+33 9 49 74 00 70', 5, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(149, 4, NULL, 1, 149, 2, 'Élodie', 'Carpentier', '1988-05-29', 'Maillot', 'FR9546515305996IK4SNGG62B75', '88 360', '71550', '1975-10-15', 'Veuf(ve)', 'Féminin', 0, 'mich', 'nath.lemaire@voila.fr', NULL, NULL, '+33 (0)7 66 53 06 84', '0445977016', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(150, 1, NULL, 1, 160, 4, 'Isabelle', 'Rolland', '2021-01-21', 'Gaillard', 'FR167887453562970275HFT3S77', '25 703', '70 189', '2004-09-09', 'Célibataire', 'Féminin', 0, 'christophedufour@univ-thies.sn', 'joseph.jules@noos.fr', NULL, NULL, '01 64 97 37 61', '08 97 50 33 70', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(151, 1, NULL, 1, 133, 1, 'Richard', 'Chauveau', '2021-01-21', 'Moreldan', 'FR848480986967S0LM7K1H45A68', '58209', '30239', '2012-01-29', 'Divorcé(e)', 'Masculin', 1, 'eug', 'renee40@garcia.org', NULL, NULL, '06 64 36 07 10', '0601315806', 6, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(152, 4, NULL, 1, 89, 4, 'Arnaude', 'Pichon', '1974-04-03', 'Pereira-sur-Faure', 'FR729260444735X9JW8F57S0M98', '09288', '68 942', '1975-05-25', 'Marié(e)', 'Masculin', 1, 'emmanuelmercier@univ-thies.sn', 'isaac.bouchet@wanadoo.fr', NULL, NULL, '02 03 24 82 96', '04 12 36 55 20', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(153, 4, NULL, 1, 205, 4, 'Louise', 'Fontaine', '1999-03-13', 'Becker', 'FR278012167739V58FT1GXMH596', '30 218', '58439', '1998-08-07', 'Célibataire', 'Féminin', 1, 'julieollivier@univ-thies.sn', 'craymond@yahoo.fr', NULL, NULL, '0934384592', '01 31 09 90 83', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(154, 4, NULL, 1, 202, 3, 'Benoît', 'Bourgeois', '2000-07-31', 'Launay-la-Forêt', 'FR947071948236C7R21E77WW623', '26310', '49736', '1983-05-28', 'Veuf(ve)', 'Masculin', 0, 'paulmendes-roche@univ-thies.sn', 'aime.dijoux@noos.fr', NULL, NULL, '+33 5 15 47 30 41', '0156478521', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(155, 4, NULL, 1, 173, 2, 'Colette', 'Pasquier', '2010-02-17', 'Gomes', 'FR7628733000536BGKV73V75T76', '11 678', '22572', '2000-12-06', 'Célibataire', 'Masculin', 1, 'mich', 'honore.paul@bouygtel.fr', NULL, NULL, '01 96 64 18 11', '0505462231', 4, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(156, 4, NULL, 1, 39, 3, 'Vincent', 'Costa', '2001-03-22', 'Leduc-la-Forêt', 'FR3991656648142WE0931098405', '17 423', '80 214', '2013-10-25', 'Célibataire', 'Féminin', 1, 'vincent-antoinegaillard@univ-thies.sn', 'celine.bernier@yahoo.fr', NULL, NULL, '0942539081', '07 61 31 81 13', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(157, 5, NULL, 1, 176, 2, 'Patrick', 'Gerard', '1976-04-07', 'Boucher-les-Bains', 'FR8028560972233253M9S672B91', '00 934', '35 583', '1978-10-06', 'Célibataire', 'Masculin', 0, 'vincentgarnier@univ-thies.sn', 'antoine.poulain@hotmail.fr', NULL, NULL, '+33 8 92 58 55 51', '08 95 36 80 03', 7, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(158, 1, NULL, 1, 98, 4, 'William', 'Vallee', '2016-11-21', 'Samson', 'FR789124750675VFPLW127HL512', '23 416', '21 393', '1999-11-10', 'Célibataire', 'Féminin', 1, 'josephlombard@univ-thies.sn', 'ubourgeois@moulin.fr', NULL, NULL, '+33 1 72 32 03 17', '0480831006', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL);
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(159, 4, NULL, 1, 102, 1, 'Céline', 'Guyon', '1972-01-20', 'BigotBourg', 'FR763875435248838E2SSZ39Z66', '24 309', '19540', '1986-11-20', 'Divorcé(e)', 'Féminin', 1, 'am', 'zferreira@dbmail.com', NULL, NULL, '+33 (0)6 57 57 84 54', '05 20 09 19 28', 9, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(160, 4, NULL, 1, 174, 4, 'Valentine', 'Ollivier', '1988-08-28', 'Simon-la-Forêt', 'FR416866216442F23ES5057O909', '93135', '46 446', '2004-08-21', 'Célibataire', 'Masculin', 1, 'ana', 'benoit78@gmail.com', NULL, NULL, '+33 3 33 74 24 15', '0572500083', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(161, 4, NULL, 1, 228, 3, 'Anastasie', 'Neveu', '2012-12-19', 'Antoine', 'FR4281939793691MZPI5O3XN733', '70128', '60501', '2009-11-10', 'Divorcé(e)', 'Féminin', 0, 'julesguillot@univ-thies.sn', 'noel.michaud@cousin.com', NULL, NULL, '+33 2 42 15 62 13', '0699780793', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(162, 4, NULL, 1, 157, 2, 'André', 'Berthelot', '1997-11-11', 'Moreau-les-Bains', 'FR910044415657XZ4SG79Y55O74', '19865', '91716', '1977-02-15', 'Marié(e)', 'Masculin', 1, 'nathaliedelannoy@univ-thies.sn', 'bertin.remy@picard.fr', NULL, NULL, '04 84 85 75 86', '+33 1 69 35 26 92', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(163, 5, NULL, 1, 51, 2, 'Philippine', 'Jourdan', '2001-11-22', 'Allardnec', 'FR8174738339867F451YJ43UA05', '26 699', '35 535', '2017-08-17', 'Divorcé(e)', 'Féminin', 0, 'fran', 'lucy46@laposte.net', NULL, NULL, '08 95 49 51 63', '+33 2 33 00 88 00', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(164, 5, NULL, 1, 134, 4, 'Louis', 'Leclerc', '2020-06-19', 'Lucas-sur-Mer', 'FR41860613246957NC012PLW513', '69 152', '26 389', '1989-04-25', 'Marié(e)', 'Masculin', 0, 'davidlaunay@univ-thies.sn', 'michelle.samson@live.com', NULL, NULL, '01 48 00 49 58', '0589633320', 1, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(165, 4, NULL, 1, 31, 1, 'Céline', 'Rey', '2017-04-24', 'Mary', 'FR66128327079496AE1I8YND891', '58 586', '60 649', '1996-10-26', 'Divorcé(e)', 'Féminin', 1, 'lucebaudry@univ-thies.sn', 'bbouvet@benoit.fr', NULL, NULL, '+33 (0)4 24 75 27 28', '+33 (0)1 49 24 97 86', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(166, 5, NULL, 1, 97, 3, 'Éléonore', 'Costa', '1977-03-29', 'Philippe-les-Bains', 'FR562492623649G9EBE93N47300', '37 571', '04 965', '1972-05-06', 'Célibataire', 'Masculin', 1, 'val', 'lucie.garnier@wanadoo.fr', NULL, NULL, '+33 1 02 10 67 00', '02 13 17 30 16', 2, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(167, 4, NULL, 1, 66, 1, 'Camille', 'Gallet', '2019-04-05', 'Ferrand-les-Bains', 'FR6981022954621R54HJLO6EM75', '13 704', '23264', '1975-09-01', 'Divorcé(e)', 'Masculin', 0, 'no', 'antoinette.dupont@hotmail.fr', NULL, NULL, '+33 (0)7 89 73 23 97', '07 46 03 15 82', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(168, 1, NULL, 1, 60, 4, 'Camille', 'Texier', '2008-11-14', 'Hardy', 'FR5729150013095L5C75C2CYX01', '29 048', '80 277', '1999-07-19', 'Marié(e)', 'Féminin', 0, 'aur', 'epeltier@tele2.fr', NULL, NULL, '+33 1 67 82 58 26', '03 30 98 20 62', 4, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(169, 4, NULL, 1, 3, 2, 'Renée', 'Lenoir', '2003-02-19', 'Munoz-sur-Martins', 'FR50146000241064DF2MD850432', '64 713', '42 582', '1979-01-17', 'Marié(e)', 'Féminin', 0, 'oliviemenard-guilbert@univ-thies.sn', 'nicole73@bertrand.com', NULL, NULL, '+33 9 00 73 78 09', '0338994320', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(170, 1, NULL, 1, 178, 2, 'Bernard', 'Laporte', '1981-06-09', 'Gay', 'FR578507464209602BO6AF97D05', '22195', '42698', '2003-06-01', 'Marié(e)', 'Féminin', 1, 'henrimathieu@univ-thies.sn', 'slegall@foucher.fr', NULL, NULL, '01 32 11 43 68', '0484465998', 4, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(171, 4, NULL, 1, 230, 2, 'Camille', 'Delannoy', '1985-07-18', 'Tanguy', 'FR17250018575316376TS8Z0116', '91452', '36900', '1983-11-21', 'Célibataire', 'Masculin', 0, 'henrifabre@univ-thies.sn', 'ucarpentier@courtois.org', NULL, NULL, '0731611837', '+33 1 12 75 29 81', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(172, 4, NULL, 1, 129, 4, 'Colette', 'Leduc', '1987-09-23', 'Blanchard-sur-Rocher', 'FR264935967014FKUCL9EU67669', '04137', '15396', '2017-09-19', 'Divorcé(e)', 'Féminin', 1, 'oliviercolas@univ-thies.sn', 'ucarlier@besnard.fr', NULL, NULL, '+33 (0)1 30 50 56 42', '0590887657', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(173, 4, NULL, 1, 133, 3, 'Claire', 'Blanc', '1970-10-23', 'Bouvet', 'FR672877666425CX88GF7D55276', '28 191', '76 373', '1986-08-22', 'Divorcé(e)', 'Masculin', 0, 'alexandriebarbier@univ-thies.sn', 'eugene.blondel@tele2.fr', NULL, NULL, '+33 (0)5 59 75 67 44', '+33 (0)5 12 46 32 05', 9, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(174, 1, NULL, 1, 231, 3, 'William', 'Humbert', '1997-03-14', 'Alves', 'FR021321845124L26T2806Z9224', '37 343', '52 771', '1997-09-23', 'Célibataire', 'Féminin', 0, 'lauregiraud@univ-thies.sn', 'meunier.lucy@ifrance.com', NULL, NULL, '04 20 13 51 47', '+33 (0)1 13 97 44 27', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(175, 1, NULL, 1, 220, 1, 'Raymond', 'Maillet', '2006-07-21', 'Blondel-les-Bains', 'FR4876621186938D793W89N1735', '12621', '96732', '2001-06-23', 'Célibataire', 'Masculin', 0, 'nathaliemunoz@univ-thies.sn', 'wpinto@benoit.fr', NULL, NULL, '0101439543', '0588158595', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(176, 4, NULL, 1, 125, 3, 'Caroline', 'Gautier', '2009-03-30', 'Hebert', 'FR5083124298559N476CZS1K313', '13205', '02761', '2017-08-17', 'Divorcé(e)', 'Féminin', 0, 'juliettedurenard@univ-thies.sn', 'aurelie.lemoine@noos.fr', NULL, NULL, '+33 (0)2 96 21 29 08', '+33 (0)2 96 19 55 16', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(177, 4, NULL, 1, 49, 3, 'Odette', 'Navarro', '2018-03-01', 'Ferrand', 'FR9284185506310I69GR81T8N97', '55 912', '38311', '1996-05-13', 'Célibataire', 'Masculin', 0, 'st', 'claude.valentin@foucher.com', NULL, NULL, '+33 (0)3 24 00 87 85', '0537639518', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(178, 1, NULL, 1, 136, 3, 'Martine', 'Garcia', '2009-03-28', 'Rodriguez', 'FR0541265899436B61582RS6N75', '58801', '20198', '1977-07-19', 'Divorcé(e)', 'Masculin', 0, 'lucaspetit@univ-thies.sn', 'lucie29@dbmail.com', NULL, NULL, '07 95 35 50 91', '0895832152', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(179, 4, NULL, 1, 29, 3, 'Noël', 'Mendes', '1999-06-27', 'Samson-sur-Lecomte', 'FR322959782238KNI0X00Q16J75', '71 321', '47467', '2004-12-04', 'Célibataire', 'Masculin', 0, 'raymondbruneau-tessier@univ-thies.sn', 'maryse.hamel@lejeune.org', NULL, NULL, '+33 7 97 52 70 97', '+33 5 25 45 14 84', 3, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(180, 4, NULL, 1, 122, 3, 'Guy', 'Perrin', '2003-11-07', 'Leveque', 'FR908656051297T58513A244C29', '10 461', '93380', '1989-10-24', 'Marié(e)', 'Féminin', 0, 'andr', 'elise04@gmail.com', NULL, NULL, '+33 1 08 63 74 55', '0907298102', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(181, 5, NULL, 1, 191, 3, 'Aurélie', 'Caron', '2019-07-31', 'Chevallier', 'FR8098616926132Y4X6VR9ZC152', '64 079', '84417', '1997-09-23', 'Marié(e)', 'Masculin', 0, 'charlesprevost@univ-thies.sn', 'kdelattre@free.fr', NULL, NULL, '+33 1 82 37 20 72', '+33 4 51 77 29 15', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(182, 5, NULL, 1, 143, 1, 'Claire', 'Blot', '2016-04-30', 'Coste', 'FR9416103908582TE0R3X1O5Z23', '36971', '83202', '2009-01-18', 'Célibataire', 'Masculin', 1, 'aim', 'laporte.lucie@live.com', NULL, NULL, '+33 (0)1 51 95 53 13', '+33 (0)4 77 82 34 80', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(183, 4, NULL, 1, 40, 2, 'Michel', 'Goncalves', '2008-05-01', 'Robin', 'FR759005499310W09X070BR1L42', '86 035', '18557', '1977-04-27', 'Marié(e)', 'Féminin', 0, 's', 'delmas.frederic@durand.com', NULL, NULL, '+33 3 92 67 11 29', '06 14 89 58 01', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(184, 5, NULL, 1, 207, 2, 'Laure', 'Millet', '2003-02-11', 'Boyer-la-Forêt', 'FR981409967143Y643IRND28V34', '28 706', '89991', '1986-06-24', 'Veuf(ve)', 'Masculin', 0, 'gabrieldupre@univ-thies.sn', 'adrienne27@lacroix.fr', NULL, NULL, '+33 (0)6 95 19 90 43', '+33 1 08 69 35 35', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(185, 4, NULL, 1, 159, 3, 'Arnaude', 'Duhamel', '1990-11-23', 'Lamy', 'FR823976730633U83T2H788T538', '76 277', '79967', '1974-01-13', 'Divorcé(e)', 'Masculin', 0, 'matthieurenault@univ-thies.sn', 'emile20@ifrance.com', NULL, NULL, '0789928505', '+33 (0)3 21 46 95 44', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(186, 4, NULL, 1, 126, 4, 'Lucas', 'Leclerc', '2006-09-07', 'TraoreBourg', 'FR361126421237RV2D35J35S246', '78780', '11 855', '2014-11-21', 'Veuf(ve)', 'Féminin', 1, 'alfreddelarossi@univ-thies.sn', 'colette.collet@free.fr', NULL, NULL, '08 99 60 36 27', '+33 6 19 90 91 41', 7, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(187, 4, NULL, 1, 203, 2, 'Michel', 'Pascal', '2014-09-04', 'Maurice', 'FR302507344322DSLF9NIDTN286', '11866', '01919', '2010-07-16', 'Veuf(ve)', 'Masculin', 0, 'christophe-christophesauvage@univ-thies.sn', 'raymond.joly@gmail.com', NULL, NULL, '09 58 37 81 96', '+33 (0)1 70 13 31 73', 3, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(188, 4, NULL, 1, 177, 2, 'Henri', 'Guillet', '1973-05-28', 'FouquetBourg', 'FR72439725595226827Q2517W27', '95324', '57290', '2011-03-04', 'Veuf(ve)', 'Féminin', 1, 'danielpires@univ-thies.sn', 'fmarin@teixeira.fr', NULL, NULL, '+33 (0)3 95 90 94 39', '+33 6 20 10 18 24', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(189, 1, NULL, 1, 84, 4, 'Jeannine', 'Gaudin', '1980-06-13', 'Bonnin', 'FR2798430180936386V8552ND23', '89 647', '70297', '1983-02-17', 'Divorcé(e)', 'Masculin', 0, 'adrienjoubert-leclercq@univ-thies.sn', 'paulette90@pierre.fr', NULL, NULL, '+33 9 05 67 24 78', '0331962844', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(190, 5, NULL, 1, 166, 2, 'Frédéric', 'Lagarde', '1983-02-27', 'Poiriernec', 'FR95641521286729B39L2IM9C76', '19 960', '91 253', '2006-08-24', 'Veuf(ve)', 'Masculin', 1, 'ren', 'honore.philippe@bouygtel.fr', NULL, NULL, '01 63 47 04 37', '0422795241', 1, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(191, 5, NULL, 1, 43, 4, 'Jules', 'Prevost', '1970-04-04', 'Payet-sur-Petit', 'FR394665919010NOXAR1PV43X56', '58 400', '85862', '2001-12-11', 'Célibataire', 'Masculin', 0, 'nicoledelaguyot@univ-thies.sn', 'adele.delattre@fouquet.com', NULL, NULL, '0737692584', '05 77 47 17 88', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(192, 4, NULL, 1, 178, 4, 'Arthur', 'Ramos', '1981-02-01', 'Guillaume', 'FR02780183511407513ME0J0G38', '04044', '88430', '2019-06-26', 'Célibataire', 'Masculin', 0, 'christine-st', 'nherve@nguyen.org', NULL, NULL, '+33 (0)5 47 86 09 79', '+33 2 31 87 53 27', 9, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(193, 4, NULL, 1, 157, 1, 'Joseph', 'Diallo', '2002-03-13', 'Lagarde', 'FR417566033251GF8N2EW7BU894', '04 653', '44 694', '2018-01-15', 'Marié(e)', 'Féminin', 0, 'capucinemarchand@univ-thies.sn', 'lucie64@wanadoo.fr', NULL, NULL, '0826805699', '+33 1 81 05 78 17', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(194, 4, NULL, 1, 233, 4, 'Arthur', 'Vincent', '1980-02-15', 'Collin', 'FR142818684329H6M955O985476', '76 050', '67256', '2008-08-20', 'Marié(e)', 'Masculin', 1, 'catherinedufour@univ-thies.sn', 'pierre.agnes@noos.fr', NULL, NULL, '+33 1 69 26 53 27', '0899377841', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(195, 5, NULL, 1, 120, 4, 'Geneviève', 'Nguyen', '1972-06-11', 'Pages', 'FR025474991671NFE907Q44OF99', '11 781', '55165', '2003-04-23', 'Marié(e)', 'Féminin', 1, 'madeleinejacquet@univ-thies.sn', 'guillot.thibaut@ruiz.org', NULL, NULL, '0607614858', '+33 (0)1 92 03 10 50', 5, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(196, 4, NULL, 1, 231, 3, 'Alix', 'Brun', '1977-03-23', 'Greniernec', 'FR5174093835082TM2PWYH86252', '72 520', '94 481', '2013-02-12', 'Marié(e)', 'Féminin', 1, 'nathdasilva@univ-thies.sn', 'oceane.chauveau@orange.fr', NULL, NULL, '+33 6 81 06 82 07', '+33 2 05 04 59 74', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(197, 5, NULL, 1, 34, 4, 'Henri', 'Boutin', '1972-06-30', 'Rey-sur-Monnier', 'FR037938699300K8N0Z45L6V566', '39247', '28 602', '1997-03-27', 'Célibataire', 'Masculin', 1, 'henriguilbert@univ-thies.sn', 'ivalentin@laposte.net', NULL, NULL, '03 12 88 22 31', '08 95 29 37 75', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(198, 1, NULL, 1, 238, 1, 'Susanne', 'Bailly', '1971-10-09', 'DeschampsBourg', 'FR939866546575F147F67149486', '06951', '33571', '1981-02-26', 'Marié(e)', 'Masculin', 1, 'mariannetorres@univ-thies.sn', 'chauvin.alphonse@tele2.fr', NULL, NULL, '0476443495', '04 10 15 78 69', 7, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(199, 4, NULL, 1, 138, 2, 'Nicolas', 'Rousset', '1986-01-18', 'Berger', 'FR5846357138230W6075A1NO123', '85 118', '31625', '2020-09-20', 'Célibataire', 'Masculin', 0, '', 'andre.georges@noos.fr', NULL, NULL, '+33 1 24 65 52 37', '+33 2 87 57 19 82', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(200, 4, NULL, 1, 18, 1, 'Susan', 'Marchand', '1980-10-08', 'Imbert', 'FR8690460496781Q9W8D5MS8656', '23 708', '43196', '1986-08-21', 'Veuf(ve)', 'Masculin', 0, 'philipperenaud@univ-thies.sn', 'gregoire49@rodriguez.org', NULL, NULL, '+33 9 94 73 40 31', '01 19 26 00 16', 7, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(201, 4, NULL, 1, 181, 1, 'Bernadette', 'Leger', '2006-03-07', 'Vincentdan', 'FR3713144534947KK82HI5AT381', '98172', '84 572', '2020-11-30', 'Veuf(ve)', 'Masculin', 0, 'nathpetit@univ-thies.sn', 'claudine89@free.fr', NULL, NULL, '+33 (0)2 25 66 15 64', '+33 (0)3 64 07 44 81', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(202, 4, NULL, 1, 93, 2, 'Roland', 'Millet', '1970-01-22', 'Leclercq', 'FR9681141161775F2R9V1767O06', '82 964', '01697', '1993-01-25', 'Marié(e)', 'Féminin', 0, 'clairelemonnier-chauveau@univ-thies.sn', 'guyot.christophe@duval.fr', NULL, NULL, '+33 (0)3 01 00 95 96', '+33 (0)2 95 45 88 90', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(203, 1, NULL, 1, 240, 3, 'André', 'Lemaitre', '1982-10-17', 'Maillot', 'FR3247842838964165MHPE5NB40', '27 977', '52 308', '2002-01-26', 'Célibataire', 'Féminin', 0, 'nicolasdelamenard@univ-thies.sn', 'blambert@hotmail.fr', NULL, NULL, '05 70 34 75 15', '+33 4 78 36 08 00', 4, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(204, 1, NULL, 1, 149, 2, 'Arthur', 'Le Roux', '1977-11-30', 'Chevallier-les-Bains', 'FR662270964024EV4J8GQ097R56', '26149', '43974', '2015-11-28', 'Divorcé(e)', 'Féminin', 1, 'patriciadelemaire@univ-thies.sn', 'erenard@guilbert.fr', NULL, NULL, '0813318429', '0178129691', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(205, 4, NULL, 1, 187, 2, 'Benoît', 'Blot', '2000-12-16', 'MarechalVille', 'FR1460081884442DVNW0171AA67', '29152', '69 512', '2001-08-26', 'Célibataire', 'Masculin', 0, 'colettegay@univ-thies.sn', 'martin.juliette@guyot.com', NULL, NULL, '+33 9 03 23 08 50', '+33 (0)2 36 06 49 25', 9, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(206, 1, NULL, 1, 169, 4, 'Gilbert', 'Bonnet', '1971-07-23', 'Dumont', 'FR5506847338832Y3MOXKK50P26', '11604', '42808', '1977-03-21', 'Veuf(ve)', 'Féminin', 1, 'alfredtanguy@univ-thies.sn', 'simone.francois@clement.com', NULL, NULL, '+33 2 52 96 69 37', '+33 6 21 06 80 42', 4, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(207, 1, NULL, 1, 189, 4, 'Vincent', 'Barbier', '2000-08-14', 'Chretien', 'FR1421888047756YX72M2QG4D73', '93098', '91 503', '1989-04-21', 'Divorcé(e)', 'Féminin', 1, 'francklaurent-bruneau@univ-thies.sn', 'noel.raynaud@wanadoo.fr', NULL, NULL, '+33 (0)5 76 37 87 82', '05 34 91 31 35', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(208, 4, NULL, 1, 73, 4, 'Colette', 'Chauvet', '1995-10-25', 'Philippe', 'FR624062722284FG09MS3BAD147', '33 566', '64 465', '2005-09-15', 'Marié(e)', 'Masculin', 0, 'claudinemeunier@univ-thies.sn', 'penelope.leclerc@voila.fr', NULL, NULL, '+33 2 10 88 73 16', '0656007226', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(209, 4, NULL, 1, 30, 1, 'Jérôme', 'Rey', '1998-07-26', 'Hubert', 'FR237735229670O64614BKC3142', '61 331', '22 643', '1993-03-03', 'Divorcé(e)', 'Féminin', 0, 'nathmaillard@univ-thies.sn', 'wdavid@dupre.net', NULL, NULL, '0482499830', '0897500975', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(210, 4, NULL, 1, 72, 2, 'Gabriel', 'Tessier', '2020-05-01', 'Aubert', 'FR197803506792Y06AE04TWFW42', '09083', '09 066', '2014-09-21', 'Veuf(ve)', 'Féminin', 0, 'jacquelinewagner@univ-thies.sn', 'nicolas.bonnet@jean.net', NULL, NULL, '+33 9 21 51 57 92', '+33 5 30 19 30 09', 7, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(211, 1, NULL, 1, 225, 1, 'Roland', 'Guillot', '2013-04-30', 'Moreauboeuf', 'FR963606483619DB8JURYL54070', '87 571', '16006', '1985-05-08', 'Divorcé(e)', 'Féminin', 0, 'maryseremy-verdier@univ-thies.sn', 'marianne.gilles@merle.com', NULL, NULL, '03 06 44 28 18', '+33 (0)5 94 89 02 67', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(212, 5, NULL, 1, 35, 2, 'Gabriel', 'Bouvier', '1994-12-30', 'Langlois', 'FR17428635515066G934N7ENV76', '26 781', '85043', '1975-01-22', 'Célibataire', 'Féminin', 0, 'aurorebourgeois@univ-thies.sn', 'allain.emmanuel@club-internet.fr', NULL, NULL, '+33 1 31 58 84 31', '0497566324', 9, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(213, 5, NULL, 1, 242, 3, 'Marcel', 'Leroux', '1989-12-17', 'Pascalnec', 'FR631443249551OC3993L3P9J71', '58 089', '71 468', '2020-12-09', 'Marié(e)', 'Masculin', 1, 'beno', 'philippine.neveu@herve.com', NULL, NULL, '+33 (0)2 51 32 99 92', '+33 4 26 90 95 18', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(214, 4, NULL, 1, 67, 1, 'Aurore', 'Lopez', '1981-04-21', 'Didier', 'FR844794818483UB6F1R256PT17', '55 702', '17 231', '1999-09-13', 'Marié(e)', 'Masculin', 1, 'simone-susanmeunier@univ-thies.sn', 'penelope00@berger.com', NULL, NULL, '01 18 50 15 35', '03 59 18 42 97', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(215, 5, NULL, 1, 202, 1, 'René', 'Gerard', '1995-11-23', 'Pottier', 'FR975312652048W7Z71286X3R49', '63249', '88 487', '2004-02-14', 'Célibataire', 'Féminin', 0, 'jos', 'elodie49@bouygtel.fr', NULL, NULL, '+33 (0)2 62 64 15 83', '+33 (0)1 94 84 14 74', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(216, 5, NULL, 1, 188, 1, 'Jérôme', 'Levy', '1970-01-19', 'Gautierboeuf', 'FR107224537467BUC7YD365M402', '85705', '21 277', '2001-04-27', 'Marié(e)', 'Féminin', 0, 'arnaudeparis@univ-thies.sn', 'claude.picard@laposte.net', NULL, NULL, '01 98 92 66 95', '0517579350', 7, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(217, 1, NULL, 1, 55, 4, 'Christiane', 'Weiss', '2015-04-02', 'Noel-sur-Chevallier', 'FR475014565499FY68D9M5C9J04', '89 105', '81241', '2013-12-27', 'Marié(e)', 'Féminin', 0, 'hortenseandre@univ-thies.sn', 'agnes52@lebreton.net', NULL, NULL, '+33 1 00 82 27 14', '+33 1 30 54 19 32', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(218, 1, NULL, 1, 201, 1, 'Astrid', 'Delaunay', '1970-11-12', 'Jourdan', 'FR352235707960W4AYH87PH7X45', '98529', '09961', '1993-04-01', 'Célibataire', 'Féminin', 0, 'victoirechevallier@univ-thies.sn', 'leconte.etienne@voila.fr', NULL, NULL, '+33 (0)4 65 11 06 77', '+33 4 31 25 73 61', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(219, 1, NULL, 1, 113, 3, 'Henri', 'Moreno', '2003-11-04', 'Daniel', 'FR7399222558999DWGO8RHSC008', '57079', '51 533', '2018-12-30', 'Célibataire', 'Masculin', 0, 'alainguyon@univ-thies.sn', 'zacharie.lebreton@hoareau.org', NULL, NULL, '+33 (0)9 98 52 08 81', '03 32 34 51 25', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(220, 4, NULL, 1, 236, 2, 'Adélaïde', 'Pottier', '2006-03-07', 'FaivreVille', 'FR711637082202TSJSA72611N12', '27895', '64003', '1972-08-23', 'Divorcé(e)', 'Masculin', 0, 'gabriellegodard@univ-thies.sn', 'nmarques@blanchet.org', NULL, NULL, '+33 (0)4 07 39 19 75', '+33 (0)6 11 87 01 33', 8, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(221, 4, NULL, 1, 147, 2, 'Sabine', 'Barbier', '1974-04-05', 'Maillard-les-Bains', 'FR760615412207B0H9S84YJCZ17', '02 678', '03297', '1977-03-14', 'Célibataire', 'Masculin', 0, 'dominiquelesage@univ-thies.sn', 'celina.perrot@live.com', NULL, NULL, '+33 (0)8 97 43 68 07', '03 81 13 11 75', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(222, 4, NULL, 1, 131, 2, 'Audrey', 'Letellier', '1974-03-29', 'Marty', 'FR49825778620603HYRPM7OD144', '03175', '73667', '2019-07-13', 'Marié(e)', 'Masculin', 0, 'isaac-lucasgrenier@univ-thies.sn', 'zremy@gillet.org', NULL, NULL, '04 84 99 36 75', '0619120311', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(223, 4, NULL, 1, 156, 2, 'Franck', 'Vincent', '2017-05-02', 'Maillardboeuf', 'FR7227329476693V90TYAIO5651', '86 845', '08 057', '2002-04-04', 'Divorcé(e)', 'Féminin', 1, 'mariebrunet@univ-thies.sn', 'marcel22@loiseau.fr', NULL, NULL, '09 71 53 61 34', '0790492200', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(224, 1, NULL, 1, 224, 2, 'Louis', 'Perrin', '2012-03-02', 'Cordier-la-Forêt', 'FR7027300725921P608O4084A73', '98 820', '82 087', '2004-08-29', 'Marié(e)', 'Féminin', 1, 'margaret-mariannefernandes@univ-thies.sn', 'poirier.benjamin@dasilva.com', NULL, NULL, '+33 1 65 55 78 77', '+33 2 65 90 43 44', 6, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(225, 1, NULL, 1, 67, 3, 'Aimé', 'Traore', '2010-05-12', 'DupuyVille', 'FR28138436214928Q4GNNN76C34', '37584', '81758', '2019-12-28', 'Divorcé(e)', 'Masculin', 0, 'th', 'anne.lopez@dijoux.com', NULL, NULL, '0248196049', '+33 8 95 85 48 22', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(226, 1, NULL, 1, 137, 1, 'Arthur', 'Diaz', '1988-07-16', 'BoulayBourg', 'FR404706710239GHA03QQ81DJ19', '41764', '47 813', '1978-12-06', 'Marié(e)', 'Féminin', 1, 'marysepayet@univ-thies.sn', 'laurent54@ifrance.com', NULL, NULL, '0902620229', '+33 (0)7 57 73 22 93', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(227, 1, NULL, 1, 163, 1, 'André', 'Maillet', '2007-04-28', 'Bernier-sur-Vincent', 'FR757588701364845U66N3VL777', '56 673', '54 400', '2000-08-09', 'Marié(e)', 'Féminin', 1, 'michellegarnier@univ-thies.sn', 'leon60@laposte.net', NULL, NULL, '05 42 84 12 16', '+33 (0)6 68 94 35 93', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(228, 1, NULL, 1, 9, 3, 'Laurence', 'Aubert', '1974-05-17', 'Fleury-sur-Royer', 'FR365438434723OO3N42348WX53', '56916', '96 637', '1990-12-04', 'Divorcé(e)', 'Féminin', 1, 'adrientoussaint@univ-thies.sn', 'boulanger.victor@navarro.fr', NULL, NULL, '+33 (0)8 92 69 42 69', '+33 1 21 88 15 08', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(229, 1, NULL, 1, 211, 3, 'Chantal', 'Blot', '2004-08-07', 'Martinezboeuf', 'FR757810676708822R7T864S846', '41 339', '05930', '1974-07-06', 'Divorcé(e)', 'Féminin', 0, 'auroregaillard@univ-thies.sn', 'frederique08@gmail.com', NULL, NULL, '+33 (0)6 11 75 46 18', '01 73 38 35 98', 9, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(230, 5, NULL, 1, 176, 3, 'Camille', 'Verdier', '1973-07-13', 'Delahaye', 'FR72416936053046LS8X0LQMP22', '08339', '80 410', '1997-07-18', 'Divorcé(e)', 'Masculin', 0, 'gillesdelarousset@univ-thies.sn', 'odacosta@gmail.com', NULL, NULL, '02 07 80 51 51', '0797322593', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(231, 5, NULL, 1, 215, 3, 'Nathalie', 'Dupont', '2008-09-01', 'Hamelboeuf', 'FR206578427571149BBG0K4IN27', '85 660', '82589', '1973-04-26', 'Divorcé(e)', 'Masculin', 1, 'genevi', 'gilbert62@delaunay.com', NULL, NULL, '+33 (0)6 46 72 69 35', '+33 2 58 70 61 65', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(232, 4, NULL, 1, 79, 3, 'Théodore', 'Gaillard', '2009-09-16', 'Leger', 'FR424265074120ZKV3V75DKZ435', '98840', '83924', '1990-05-14', 'Célibataire', 'Féminin', 1, 'anouk-mich', 'jacques.marie@laposte.net', NULL, NULL, '05 60 03 11 80', '+33 1 20 96 40 84', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(233, 4, NULL, 1, 101, 1, 'Honoré', 'Neveu', '2018-10-10', 'Coulon-la-Forêt', 'FR376834729704345MZ3F50B707', '14 677', '89 703', '2015-05-28', 'Célibataire', 'Féminin', 0, 'xavierrousseau@univ-thies.sn', 'alain82@free.fr', NULL, NULL, '+33 9 55 01 64 03', '05 04 59 87 85', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(234, 1, NULL, 1, 236, 1, 'Jean', 'Martin', '1993-07-11', 'Nicolas', 'FR4175932544593B55EP0290Y73', '67579', '31354', '1989-03-29', 'Divorcé(e)', 'Féminin', 0, 'eug', 'catherine09@jacob.org', NULL, NULL, '0747878471', '+33 (0)8 11 62 53 46', 6, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(235, 1, NULL, 1, 15, 4, 'Hugues', 'Delorme', '2003-03-18', 'Mathieu', 'FR574694143787YVNNWBN3E2109', '54411', '77 701', '1996-02-09', 'Marié(e)', 'Féminin', 0, 'augustinrossi@univ-thies.sn', 'uweber@tiscali.fr', NULL, NULL, '02 25 78 91 73', '0209935013', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(236, 4, NULL, 1, 45, 4, 'Astrid', 'Humbert', '1983-10-11', 'Leroux-les-Bains', 'FR6168108765704G2SN524R7101', '83336', '92556', '1978-04-22', 'Célibataire', 'Féminin', 1, 'vincentpascal@univ-thies.sn', 'joseph.roger@lefebvre.fr', NULL, NULL, '01 34 37 64 19', '02 54 56 70 83', 5, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(237, 1, NULL, 1, 57, 1, 'Véronique', 'Hamon', '2012-06-11', 'Ribeiro', 'FR1107361868714LKO3V8422428', '50 112', '08605', '1996-02-21', 'Divorcé(e)', 'Masculin', 0, 'patriciapottier@univ-thies.sn', 'nblondel@barbier.com', NULL, NULL, '+33 3 24 00 22 92', '09 50 56 17 68', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(238, 5, NULL, 1, 81, 2, 'Éléonore', 'Dias', '2010-12-14', 'Jacques-sur-Mer', 'FR199887212956F94N556GCUM43', '36 470', '65637', '1974-09-02', 'Divorcé(e)', 'Féminin', 0, '', 'laure.arnaud@free.fr', NULL, NULL, '+33 1 05 88 85 61', '+33 1 55 84 92 57', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(239, 5, NULL, 1, 129, 2, 'Marcelle', 'Bouchet', '1979-06-07', 'Becker-sur-Joseph', 'FR3697931146405D4HWJ19JML47', '69460', '73 892', '2016-04-20', 'Marié(e)', 'Féminin', 1, 'augustemarchal-mathieu@univ-thies.sn', 'thibaut42@gmail.com', NULL, NULL, '06 55 81 04 36', '0241049043', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(240, 5, NULL, 1, 178, 2, 'Victoire', 'Barre', '1978-11-03', 'Boutin', 'FR221719788416FN17J85L8SK91', '95065', '06 165', '1975-04-27', 'Célibataire', 'Féminin', 1, 'michelleturpin-barthelemy@univ-thies.sn', 'bpottier@voila.fr', NULL, NULL, '0220953940', '+33 3 35 06 97 05', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(241, 1, NULL, 1, 179, 2, 'Denise', 'Guichard', '1983-03-31', 'Lemonnierdan', 'FR593322880819WXK2X4K512557', '52024', '11472', '1982-01-17', 'Veuf(ve)', 'Féminin', 0, 's', 'suzanne96@benard.com', NULL, NULL, '+33 8 24 37 06 52', '08 98 67 05 52', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(242, 4, NULL, 1, 44, 3, 'Cécile', 'Leclerc', '2016-09-02', 'Poulain', 'FR2538408257062CFDMYZ689353', '26934', '23 628', '1980-05-19', 'Divorcé(e)', 'Masculin', 0, 'julieberger@univ-thies.sn', 'vgarnier@neveu.com', NULL, NULL, '+33 (0)9 08 94 95 62', '+33 (0)9 19 98 93 49', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(243, 4, NULL, 1, 149, 3, 'Manon', 'Lambert', '1973-12-02', 'Faure', 'FR5613852194653B7LVED680081', '90 401', '58620', '1980-08-20', 'Célibataire', 'Féminin', 1, 'catherinelegay@univ-thies.sn', 'franck85@lejeune.net', NULL, NULL, '+33 2 16 99 42 15', '04 11 44 76 22', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(244, 5, NULL, 1, 241, 4, 'Adrienne', 'De Oliveira', '2004-10-01', 'Greniernec', 'FR098937503901J5W0IP0T4R720', '81921', '21584', '1980-11-30', 'Veuf(ve)', 'Féminin', 0, 'mariannelegay@univ-thies.sn', 'therese.gilbert@yahoo.fr', NULL, NULL, '02 19 31 09 65', '0269167455', 4, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(245, 5, NULL, 1, 96, 2, 'Paulette', 'Diaz', '1983-10-05', 'Pinto-sur-Mer', 'FR951893656239NFD68B565F060', '04669', '30648', '1995-06-30', 'Célibataire', 'Féminin', 0, 'josettejacquot-perrier@univ-thies.sn', 'parent.charles@sfr.fr', NULL, NULL, '+33 (0)8 97 99 08 06', '+33 (0)3 14 72 82 74', 9, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(246, 5, NULL, 1, 116, 1, 'Suzanne', 'Gregoire', '2010-02-02', 'Colin', 'FR716855303542CAA1618XX7897', '09 436', '63880', '2018-09-02', 'Veuf(ve)', 'Féminin', 0, 'sophiecolas-baron@univ-thies.sn', 'hramos@tanguy.org', NULL, NULL, '0779926980', '01 67 67 10 27', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(247, 5, NULL, 1, 51, 1, 'Margot', 'Gay', '1999-08-13', 'Riviere-sur-Mer', 'FR034283191144Y9GJ5XQ677421', '76 325', '50 110', '1970-11-05', 'Divorcé(e)', 'Féminin', 0, 'zo', 'bernard.charpentier@laposte.net', NULL, NULL, '+33 (0)9 26 57 50 82', '+33 5 45 77 69 60', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(248, 4, NULL, 1, 71, 2, 'Vincent', 'Carlier', '2005-11-23', 'Lelievre', 'FR6694100172475790FQ53QV217', '88707', '83887', '1981-04-08', 'Célibataire', 'Féminin', 0, 'paulbecker@univ-thies.sn', 'dpayet@hotmail.fr', NULL, NULL, '+33 (0)7 88 31 98 98', '+33 (0)3 35 99 95 80', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(249, 4, NULL, 1, 31, 4, 'Nathalie', 'Carre', '2005-01-27', 'Pinto', 'FR614165346903I80NZUG5RYW09', '59323', '28844', '1985-07-09', 'Marié(e)', 'Masculin', 1, '', 'gerard.bodin@benoit.fr', NULL, NULL, '0220791162', '08 24 49 99 06', 9, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(250, 1, NULL, 1, 61, 3, 'Eugène', 'Noel', '2013-10-22', 'Gonzalez', 'FR279133071807550CIKA182Y00', '57245', '51077', '2001-11-24', 'Veuf(ve)', 'Masculin', 1, 'corinneturpin@univ-thies.sn', 'hamel.jeanne@tiscali.fr', NULL, NULL, '0263144618', '0184563706', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(251, 1, NULL, 1, 185, 1, 'Alain', 'Potier', '1971-08-25', 'Wagner', 'FR48577247250136651TP3P7322', '24998', '93629', '2018-11-28', 'Veuf(ve)', 'Féminin', 1, 'c', 'simone.didier@yahoo.fr', NULL, NULL, '0394586169', '05 80 19 90 46', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(252, 4, NULL, 1, 152, 2, 'Patricia', 'Richard', '1996-02-17', 'Le Gall-sur-Mer', 'FR034501288814G1B45367IX541', '86 514', '97 707', '1998-10-14', 'Divorcé(e)', 'Masculin', 1, 'emmanuelmarchal@univ-thies.sn', 'tgimenez@wanadoo.fr', NULL, NULL, '+33 (0)7 59 99 15 66', '03 10 95 30 80', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(253, 1, NULL, 1, 108, 4, 'Aurélie', 'Morvan', '1985-12-14', 'Berthelotdan', 'FR241035449647PQC8JUL92S720', '07119', '46471', '1972-07-06', 'Célibataire', 'Masculin', 1, 'christinelemaitre@univ-thies.sn', 'maubry@noos.fr', NULL, NULL, '07 47 03 34 22', '0475148619', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(254, 4, NULL, 1, 186, 4, 'Diane', 'Langlois', '1971-02-08', 'Roger', 'FR7363525865682KW10A73F7962', '53927', '89058', '1995-02-27', 'Marié(e)', 'Masculin', 0, 'huguesdumarchand@univ-thies.sn', 'pineau.margot@club-internet.fr', NULL, NULL, '0976903360', '08 14 88 14 08', 4, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(255, 1, NULL, 1, 145, 2, 'Jérôme', 'Perret', '1990-10-03', 'Louis-sur-Costa', 'FR3037869639136Q5A9535PZP68', '57 820', '43933', '1984-05-21', 'Marié(e)', 'Masculin', 1, 'margotolivier-petitjean@univ-thies.sn', 'daniel.edouard@renaud.com', NULL, NULL, '02 96 10 44 11', '+33 5 34 15 92 90', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(256, 1, NULL, 1, 235, 1, 'Thibaut', 'Gauthier', '2015-08-06', 'Techer', 'FR828640832443GX4W37S4J0M89', '33758', '44 305', '1975-01-23', 'Divorcé(e)', 'Féminin', 0, 'andr', 'nathalie.hernandez@rodrigues.fr', NULL, NULL, '+33 9 26 58 48 49', '+33 8 99 52 31 57', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(257, 1, NULL, 1, 6, 2, 'Bernadette', 'Robin', '1984-03-21', 'Mendes', 'FR50310270488337P98N8740X78', '30783', '25 327', '1995-02-12', 'Marié(e)', 'Féminin', 1, '', 'vduval@delaunay.com', NULL, NULL, '0321872782', '0791823312', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(258, 1, NULL, 1, 28, 3, 'Yves', 'Regnier', '2016-11-20', 'Bousquetboeuf', 'FR252242559918GX3S54RE49C16', '25 067', '59 007', '1988-06-06', 'Veuf(ve)', 'Masculin', 1, 'marcelle-nathaliemasson@univ-thies.sn', 'alice.ribeiro@tiscali.fr', NULL, NULL, '+33 8 19 21 23 39', '+33 4 60 26 41 90', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(259, 1, NULL, 1, 182, 2, 'Louis', 'Chauvet', '2001-02-15', 'Pottier', 'FR875153926035YVBITCR4JF561', '98 394', '49 287', '1990-01-25', 'Célibataire', 'Féminin', 0, 'jos', 'stephanie16@delaunay.fr', NULL, NULL, '05 22 13 80 00', '0337200832', 4, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(260, 4, NULL, 1, 44, 2, 'Raymond', 'Ruiz', '2004-09-30', 'Samson-la-Forêt', 'FR7542287001891O44O54SCM998', '30461', '26 639', '2015-06-20', 'Marié(e)', 'Masculin', 0, 'laurence-ren', 'morin.penelope@free.fr', NULL, NULL, '+33 (0)1 18 70 04 69', '+33 1 24 00 89 99', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(261, 4, NULL, 1, 145, 4, 'Édouard', 'Perrot', '2015-06-08', 'Noelboeuf', 'FR872916486498S17637ZY80Z05', '20 161', '91618', '2001-11-21', 'Veuf(ve)', 'Masculin', 0, 'susanlanglois@univ-thies.sn', 'dijoux.alix@orange.fr', NULL, NULL, '+33 (0)1 16 84 72 02', '+33 (0)4 90 34 50 32', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(262, 4, NULL, 1, 177, 4, 'Patrick', 'Weber', '1979-12-13', 'Rocher', 'FR821498500405Z551M9YH6U866', '04 558', '48 450', '1999-07-13', 'Veuf(ve)', 'Masculin', 0, 'susanne-lorrainemarion@univ-thies.sn', 'delahaye.richard@yahoo.fr', NULL, NULL, '+33 (0)7 43 74 80 12', '+33 7 53 75 55 39', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(263, 1, NULL, 1, 51, 4, 'Benoît', 'Dufour', '1971-01-20', 'BlondelBourg', 'FR869948410725209L884391255', '91 007', '11623', '1975-09-18', 'Veuf(ve)', 'Féminin', 0, 'marc-bernardraynaud@univ-thies.sn', 'bhubert@rousseau.com', NULL, NULL, '+33 (0)1 65 76 06 56', '0258427945', 4, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(264, 5, NULL, 1, 234, 2, 'Stéphane', 'Herve', '2009-02-07', 'Turpin', 'FR5244983619831T475B8132M31', '24 624', '01805', '1992-08-22', 'Marié(e)', 'Féminin', 0, 'ren', 'chauvet.edith@bazin.com', NULL, NULL, '0399705870', '08 91 71 92 71', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(265, 5, NULL, 1, 127, 1, 'Aurore', 'Rocher', '1990-07-24', 'Fourniernec', 'FR804980130569CNEVH54B1G823', '63764', '88 454', '2009-09-01', 'Célibataire', 'Masculin', 1, 'antoineleturpin@univ-thies.sn', 'gerard.becker@marchand.fr', NULL, NULL, '06 22 09 08 41', '0678742279', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(266, 5, NULL, 1, 13, 4, 'Michelle', 'Wagner', '1982-07-14', 'De Oliveira-les-Bains', 'FR907354062412Z6UA86EMC3873', '66 004', '63024', '2013-01-27', 'Divorcé(e)', 'Féminin', 1, 'anoukfournier@univ-thies.sn', 'honore.camus@bouygtel.fr', NULL, NULL, '02 41 26 76 98', '0397375652', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(267, 4, NULL, 1, 52, 2, 'Gilbert', 'Legrand', '1994-01-16', 'Charpentier', 'FR878311185245IOOIRMTQ2G300', '80 146', '32877', '1996-05-18', 'Veuf(ve)', 'Masculin', 0, '', 'madeleine.lebon@dbmail.com', NULL, NULL, '+33 9 15 66 05 11', '07 75 78 91 44', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(268, 5, NULL, 1, 131, 1, 'Pénélope', 'Lopes', '1987-10-11', 'Carpentierdan', 'FR8450829730707RK78E59RYJ24', '82 434', '72 908', '1994-11-19', 'Veuf(ve)', 'Masculin', 1, 'bernardbonnet@univ-thies.sn', 'francois96@noos.fr', NULL, NULL, '+33 (0)5 22 39 48 57', '+33 2 50 51 18 20', 4, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(269, 1, NULL, 1, 125, 2, 'Édith', 'Tessier', '2012-10-02', 'Baillyboeuf', 'FR0466486983013EV87M807JX89', '37077', '23 545', '2000-12-21', 'Divorcé(e)', 'Féminin', 0, 'margaud-luciebriand@univ-thies.sn', 'boucher.georges@pages.com', NULL, NULL, '0380228109', '+33 (0)4 31 95 74 44', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(270, 1, NULL, 1, 130, 2, 'Étienne', 'Fernandez', '2019-07-24', 'Marques', 'FR702325000984M824WZJU36517', '81086', '36 202', '1970-11-11', 'Marié(e)', 'Masculin', 0, 'henriettemonnier@univ-thies.sn', 'delahaye.aurore@club-internet.fr', NULL, NULL, '+33 (0)3 85 68 12 50', '+33 (0)6 24 96 65 87', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(271, 4, NULL, 1, 171, 1, 'Jeanne', 'Weber', '1979-02-09', 'Techer', 'FR182186961051KL89209G3O314', '78378', '09 417', '1994-09-02', 'Divorcé(e)', 'Féminin', 1, 'lucmichel@univ-thies.sn', 'cecile80@bouygtel.fr', NULL, NULL, '0195299970', '+33 (0)1 90 21 86 68', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(272, 5, NULL, 1, 103, 2, 'Maryse', 'Henry', '2000-01-05', 'Turpin', 'FR4436176117251E6BX7QGJ3336', '94 884', '04924', '1998-10-08', 'Marié(e)', 'Masculin', 1, 'nicoleblin@univ-thies.sn', 'xbodin@lopez.fr', NULL, NULL, '04 98 55 46 82', '+33 (0)2 33 90 47 05', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(273, 4, NULL, 1, 5, 1, 'Julie', 'Carre', '1984-03-25', 'Wagner', 'FR952598969685BJUFF1E3E3B65', '81 401', '41241', '2000-12-13', 'Marié(e)', 'Masculin', 1, 'louisedeschamps@univ-thies.sn', 'perrier.patrick@gmail.com', NULL, NULL, '+33 (0)1 43 02 71 80', '0484490576', 6, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(274, 5, NULL, 1, 183, 3, 'Inès', 'Brunet', '2001-03-12', 'Gomez-les-Bains', 'FR457879180671M97YD3PNON101', '32 595', '79 413', '1977-10-07', 'Marié(e)', 'Féminin', 1, 'nathalieblanchard@univ-thies.sn', 'michelle33@free.fr', NULL, NULL, '+33 5 50 92 33 70', '+33 7 73 35 56 29', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(275, 4, NULL, 1, 153, 3, 'Cécile', 'Pires', '2013-01-18', 'GuyonBourg', 'FR674767677877KJ530N81VU502', '64 908', '94 432', '2015-09-18', 'Célibataire', 'Masculin', 1, 'henrietteleroche@univ-thies.sn', 'nchartier@blot.org', NULL, NULL, '01 50 20 28 53', '0173077690', 9, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(276, 1, NULL, 1, 33, 4, 'Monique', 'Carlier', '2000-01-24', 'Deschamps', 'FR459156119318Q7Y1O7EG84W43', '43 680', '27433', '2019-11-27', 'Veuf(ve)', 'Masculin', 1, 'yvesseguin@univ-thies.sn', 'xdavid@brunel.com', NULL, NULL, '01 41 28 66 20', '01 47 56 69 44', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(277, 1, NULL, 1, 98, 2, 'Emmanuelle', 'Texier', '1986-12-28', 'LaporteVille', 'FR785576048886L3I7WG8B0X903', '70 671', '25748', '1995-06-12', 'Divorcé(e)', 'Masculin', 0, 'raymondribeiro@univ-thies.sn', 'bonnet.dominique@toussaint.fr', NULL, NULL, '0668413754', '+33 (0)8 98 70 28 15', 2, NULL, '2019-05-29', 'Démission', NULL, 9, NULL, NULL),
(278, 1, NULL, 1, 189, 3, 'Hugues', 'Lebreton', '1996-07-28', 'Blot', 'FR530711105198NT563M2L6EH63', '17 394', '18 750', '1996-10-18', 'Marié(e)', 'Féminin', 0, 'jos', 'fvidal@voila.fr', NULL, NULL, '+33 (0)8 06 63 85 94', '0441610092', 2, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(279, 4, NULL, 1, 49, 1, 'Céline', 'Bodin', '1991-10-11', 'Godard-la-Forêt', 'FR907396680333I86ZVS37YH645', '17103', '82 679', '2017-01-17', 'Veuf(ve)', 'Masculin', 1, 'oc', 'moreau.raymond@tele2.fr', NULL, NULL, '0327675674', '+33 (0)1 77 18 90 20', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(280, 1, NULL, 1, 234, 1, 'Camille', 'Marechal', '2015-07-12', 'Lopesboeuf', 'FR928339108714Z695778DWH723', '25 857', '26 717', '1995-04-08', 'Veuf(ve)', 'Féminin', 1, 'nicole-ad', 'leclerc.anne@collin.fr', NULL, NULL, '07 97 60 12 04', '+33 (0)2 87 18 32 95', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(281, 5, NULL, 1, 67, 1, 'Olivier', 'Descamps', '1985-12-02', 'MartyBourg', 'FR6705755288624H64A55HU1M48', '38369', '76 905', '1971-07-16', 'Divorcé(e)', 'Féminin', 0, 'no', 'qtoussaint@noos.fr', NULL, NULL, '+33 (0)2 94 34 76 88', '+33 4 81 55 71 27', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(282, 5, NULL, 1, 142, 1, 'Antoinette', 'Hebert', '1983-07-08', 'Garnier-la-Forêt', 'FR960840068276889I5S18H8688', '57437', '60289', '1982-04-01', 'Veuf(ve)', 'Féminin', 0, 'luciebegue@univ-thies.sn', 'victoire38@gerard.com', NULL, NULL, '+33 7 81 47 09 08', '08 23 87 65 73', 7, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(283, 4, NULL, 1, 88, 2, 'Denise', 'Gaillard', '1994-10-14', 'HernandezVille', 'FR548255459554F3850XP7NR181', '09743', '23 158', '1997-02-28', 'Célibataire', 'Féminin', 0, 'georgesjacquet@univ-thies.sn', 'stephanie.vasseur@guillet.com', NULL, NULL, '06 98 82 18 66', '+33 6 99 68 60 95', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(284, 1, NULL, 1, 66, 2, 'Thierry', 'Mahe', '2005-06-22', 'Weiss', 'FR2833329491346LBX1Z641GU82', '97 742', '08 704', '1975-09-04', 'Divorcé(e)', 'Masculin', 0, 'alain-andr', 'gchretien@yahoo.fr', NULL, NULL, '+33 1 01 84 97 29', '05 30 39 40 25', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(285, 4, NULL, 1, 229, 3, 'Virginie', 'Lopes', '1981-08-12', 'Hoarau-la-Forêt', 'FR4868994259908I20SC2659749', '58 253', '93850', '1988-07-11', 'Divorcé(e)', 'Masculin', 0, 'anoukbourgeois@univ-thies.sn', 'csanchez@club-internet.fr', NULL, NULL, '+33 (0)1 71 75 72 66', '+33 (0)6 05 78 54 28', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(286, 5, NULL, 1, 47, 4, 'Lucie', 'Guilbert', '1991-03-08', 'MorinVille', 'FR16969903249171WY6R9VQ7455', '46 756', '57 615', '2016-06-24', 'Célibataire', 'Féminin', 0, 'henrilebrun-bouvier@univ-thies.sn', 'noemi.blanchet@noos.fr', NULL, NULL, '08 99 51 91 42', '+33 6 58 41 59 81', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(287, 4, NULL, 1, 237, 4, 'Emmanuel', 'Labbe', '1997-08-10', 'Poulain', 'FR94187998906078W7W349Q0W59', '44782', '91 217', '2011-07-02', 'Veuf(ve)', 'Féminin', 0, 'th', 'margaret98@hoareau.fr', NULL, NULL, '+33 (0)1 27 79 90 38', '09 00 65 85 98', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(288, 5, NULL, 1, 60, 4, 'Richard', 'Robert', '1994-03-15', 'Gilles-sur-Delmas', 'FR3537426167496S4Q2FWGG7764', '44 815', '47 044', '2014-01-21', 'Célibataire', 'Féminin', 1, 'gilles-l', 'catherine.guillot@wanadoo.fr', NULL, NULL, '+33 7 96 11 38 68', '+33 (0)1 36 94 40 14', 5, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(289, 4, NULL, 1, 52, 2, 'Josette', 'Morin', '1971-01-30', 'Auger', 'FR598237024902E4IX0EKWF1561', '04736', '01 473', '2014-12-27', 'Marié(e)', 'Masculin', 0, 'gr', 'adele97@live.com', NULL, NULL, '+33 1 10 43 78 90', '+33 (0)4 15 55 24 05', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(290, 4, NULL, 1, 238, 2, 'Christiane', 'Renault', '1970-02-07', 'Garcia', 'FR3864045973346LK886Y67SP97', '63251', '35 183', '2000-01-17', 'Veuf(ve)', 'Féminin', 1, 'claudegiraud@univ-thies.sn', 'ejean@etienne.fr', NULL, NULL, '0548907723', '+33 8 03 28 26 90', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(291, 1, NULL, 1, 95, 1, 'Jacqueline', 'Mahe', '2017-02-25', 'Lecomte', 'FR740480264887074737672K497', '67 785', '66867', '2003-04-11', 'Marié(e)', 'Féminin', 0, 'michellemarechal@univ-thies.sn', 'jean53@chauvet.com', NULL, NULL, '+33 4 61 80 03 87', '06 10 75 75 17', 7, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(292, 4, NULL, 1, 78, 3, 'Jacques', 'Martin', '1975-02-25', 'HoareauVille', 'FR618012243862X22C18TE9W244', '38484', '14957', '1975-05-23', 'Divorcé(e)', 'Féminin', 1, 'laurentbarbe@univ-thies.sn', 'voisin.therese@club-internet.fr', NULL, NULL, '+33 4 34 36 82 40', '+33 5 49 31 86 26', 5, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(293, 4, NULL, 1, 150, 1, 'Gabriel', 'Chauvin', '1992-04-20', 'Pierre', 'FR190682951293V0L1E5U089W25', '12 543', '78 594', '1976-07-26', 'Divorcé(e)', 'Masculin', 1, 'fran', 'gcourtois@laposte.net', NULL, NULL, '0891010895', '01 00 05 50 83', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(294, 1, NULL, 1, 112, 4, 'Jeanne', 'Regnier', '2000-05-25', 'Salmon', 'FR4543815951681KCPNH38FPZ05', '26 052', '56118', '1984-12-19', 'Marié(e)', 'Féminin', 0, 'cl', 'emenard@wanadoo.fr', NULL, NULL, '0975672599', '+33 (0)3 16 70 28 92', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(295, 1, NULL, 1, 105, 4, 'Marianne', 'Laurent', '1996-07-13', 'Perez', 'FR5850928633768B7IJ82D0YN69', '25306', '94 566', '2014-10-11', 'Veuf(ve)', 'Féminin', 1, 'anoukrousset@univ-thies.sn', 'susanne.imbert@petitjean.com', NULL, NULL, '+33 3 00 44 58 01', '09 86 02 45 44', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(296, 4, NULL, 1, 53, 3, 'René', 'Buisson', '1987-09-10', 'PoirierBourg', 'FR7511940221065O4Z923S93G37', '03216', '33402', '1990-06-06', 'Veuf(ve)', 'Masculin', 0, 'marinevallee@univ-thies.sn', 'wlouis@monnier.com', NULL, NULL, '+33 9 41 74 22 71', '+33 (0)6 87 16 05 27', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(297, 4, NULL, 1, 155, 4, 'Christiane', 'Martel', '1999-08-16', 'Aubert-sur-Mer', 'FR915148697590PTC067611SR00', '57 057', '45 134', '2014-12-01', 'Divorcé(e)', 'Masculin', 1, 'georgesdelajoly@univ-thies.sn', 'tcohen@lecoq.fr', NULL, NULL, '+33 5 61 69 29 45', '+33 4 50 30 83 37', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(298, 4, NULL, 1, 210, 2, 'Clémence', 'Breton', '2018-02-07', 'FournierBourg', 'FR028445345554O3FFGY5099Q68', '75919', '80 359', '1980-06-30', 'Divorcé(e)', 'Masculin', 1, 'gr', 'adrienne80@guyon.net', NULL, NULL, '0463229052', '0266307520', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(299, 1, NULL, 1, 92, 2, 'Eugène', 'Michel', '2018-04-11', 'Guillou-sur-Jean', 'FR574394868762C2GNS1SM4VA49', '83903', '07 170', '1978-02-07', 'Marié(e)', 'Féminin', 0, 'zachariederodriguez@univ-thies.sn', 'gregoire20@yahoo.fr', NULL, NULL, '+33 1 38 85 99 58', '0130159285', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(300, 5, NULL, 1, 7, 4, 'Michel', 'Martinez', '2021-04-05', 'Benoit', 'FR282123266428T4LR1E8V9R205', '57 529', '81 076', '2012-07-07', 'Divorcé(e)', 'Féminin', 0, 'c', 'xnicolas@voila.fr', NULL, NULL, '+33 3 05 35 07 83', '0786842370', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(301, 5, NULL, 1, 196, 3, 'Roland', 'Dupre', '2019-07-18', 'MartineauVille', 'FR4842039777681D2P016USB021', '02 313', '84534', '2002-11-11', 'Divorcé(e)', 'Féminin', 0, 'alexandrianavarro@univ-thies.sn', 'bernard96@tiscali.fr', NULL, NULL, '07 44 27 12 58', '0512107786', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(302, 4, NULL, 1, 78, 3, 'Michèle', 'Boucher', '2017-04-26', 'Gerard', 'FR5714563689191C44245DP1M07', '63 751', '96 993', '2009-10-05', 'Veuf(ve)', 'Masculin', 0, 'philippemenard@univ-thies.sn', 'therese56@chevallier.fr', NULL, NULL, '08 20 61 12 95', '0647356585', 6, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(303, 4, NULL, 1, 55, 4, 'Michèle', 'Herve', '1970-11-29', 'Andredan', 'FR951118788716FRP04A4706716', '93894', '59 506', '1974-08-11', 'Célibataire', 'Féminin', 1, 'g', 'ribeiro.luce@noos.fr', NULL, NULL, '+33 1 39 43 85 78', '+33 7 64 82 11 63', 9, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(304, 4, NULL, 1, 124, 3, 'Antoine', 'Hebert', '1997-11-30', 'Marion', 'FR776263706841YX802X00M0C00', '34537', '54745', '1972-07-30', 'Veuf(ve)', 'Masculin', 1, 'laurentbreton-joubert@univ-thies.sn', 'pgillet@hotmail.fr', NULL, NULL, '01 33 38 35 24', '+33 9 53 05 76 92', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(305, 4, NULL, 1, 195, 1, 'Chantal', 'Fernandes', '2020-07-03', 'Lefort-sur-Perez', 'FR7675655387488PG08860B0898', '36003', '41225', '1984-03-28', 'Divorcé(e)', 'Féminin', 1, 'v', 'laetitia.richard@tiscali.fr', NULL, NULL, '0665381549', '0247779060', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(306, 1, NULL, 1, 78, 2, 'Zacharie', 'Moreau', '1976-09-27', 'Cousinnec', 'FR543141114198O1Q2AXA82D033', '66 848', '96 203', '1975-10-02', 'Marié(e)', 'Masculin', 0, 'honor', 'frederic95@gmail.com', NULL, NULL, '07 97 73 23 12', '+33 1 51 07 91 10', 9, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(307, 1, NULL, 1, 9, 4, 'Benoît', 'Baudry', '2014-05-20', 'Laurentdan', 'FR365747807386DV10BHT5CP475', '64335', '82920', '1974-10-18', 'Marié(e)', 'Féminin', 0, 'ren', 'kchevalier@gmail.com', NULL, NULL, '01 52 63 55 58', '+33 7 66 88 65 21', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(308, 5, NULL, 1, 110, 2, 'Lucas', 'Richard', '1994-08-30', 'Moreno-sur-Mer', 'FR285416799971HK06S2L865999', '93 561', '35685', '1998-01-28', 'Divorcé(e)', 'Masculin', 0, 'huguesrodriguez@univ-thies.sn', 'thibault.moreau@noel.org', NULL, NULL, '+33 1 23 06 51 13', '0747413448', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(309, 4, NULL, 1, 160, 2, 'Guy', 'Faivre', '2009-05-29', 'Devaux', 'FR079930449803N9Q29DG879B72', '51 257', '66 364', '2014-12-27', 'Marié(e)', 'Féminin', 1, 'marcel-julienmarchand@univ-thies.sn', 'audrey19@sfr.fr', NULL, NULL, '04 04 61 73 28', '+33 (0)5 21 45 28 64', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(310, 1, NULL, 1, 17, 1, 'Caroline', 'Rousset', '2000-08-24', 'Maillot', 'FR2798086333279MAHD38Y65156', '55068', '05367', '1993-02-10', 'Veuf(ve)', 'Féminin', 0, 'henrietteroger@univ-thies.sn', 'baudry.josette@chauvin.fr', NULL, NULL, '+33 (0)1 65 08 74 13', '0171122120', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(311, 4, NULL, 1, 157, 1, 'Julie', 'Charpentier', '2005-02-17', 'Meyer-les-Bains', 'FR951314533050HY2N68T1E6626', '23 216', '12 890', '2015-05-18', 'Célibataire', 'Féminin', 0, 'marthe-antoinettecollet@univ-thies.sn', 'lucas01@hotmail.fr', NULL, NULL, '+33 3 12 32 80 85', '+33 3 70 08 09 88', 5, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(312, 1, NULL, 1, 8, 4, 'Christelle', 'Leclerc', '2021-03-30', 'Henry-sur-Mer', 'FR8390384561196OY9D5X9C3147', '41651', '34982', '1996-12-04', 'Veuf(ve)', 'Masculin', 1, '', 'guillaume06@ifrance.com', NULL, NULL, '0984793640', '08 93 38 17 30', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(313, 5, NULL, 1, 166, 1, 'Laure', 'Remy', '1977-09-28', 'Dos Santos', 'FR5534822062294E099K065X267', '73494', '93237', '2021-01-25', 'Divorcé(e)', 'Féminin', 0, 'jacques-georgesroche@univ-thies.sn', 'emilie.lecomte@georges.fr', NULL, NULL, '0623365335', '+33 3 34 33 49 45', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(314, 4, NULL, 1, 29, 2, 'Agathe', 'Brunel', '1972-12-26', 'Hebert-la-Forêt', 'FR1646828800160L3FD1H1AU839', '71396', '52 195', '1998-05-18', 'Veuf(ve)', 'Masculin', 0, 'christianejacques@univ-thies.sn', 'bernadette04@delmas.net', NULL, NULL, '0974097394', '07 35 24 53 64', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(315, 5, NULL, 1, 145, 2, 'Nath', 'Gimenez', '1991-03-11', 'Besson-sur-Mer', 'FR279513064487V35HIKA14H688', '06906', '61365', '2007-07-25', 'Marié(e)', 'Féminin', 1, 'guillaumemarchal@univ-thies.sn', 'guillaume.poirier@wagner.com', NULL, NULL, '+33 (0)3 99 75 82 74', '0123782412', 9, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(316, 4, NULL, 1, 71, 1, 'Chantal', 'Rolland', '1996-04-29', 'Boulay', 'FR789563540460ED1QV7J4Z7D17', '01089', '60 164', '1996-05-07', 'Marié(e)', 'Féminin', 1, 'manonlopes@univ-thies.sn', 'guillaume.capucine@chauvet.fr', NULL, NULL, '09 04 13 32 52', '0316367692', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(317, 5, NULL, 1, 189, 4, 'Camille', 'Martineau', '1978-12-24', 'DelaunayVille', 'FR518895674158OJO7KKD9FQ313', '66531', '26453', '1985-06-09', 'Veuf(ve)', 'Féminin', 1, 'sabinedupre@univ-thies.sn', 'jtraore@club-internet.fr', NULL, NULL, '0973822320', '0892333566', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL);
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(318, 1, NULL, 1, 236, 1, 'Inès', 'Perrier', '1981-06-10', 'Gonzalez-les-Bains', 'FR9339998124035J1556OW9MF65', '90185', '07 981', '1974-10-16', 'Divorcé(e)', 'Féminin', 1, 'brigittedelahoareau@univ-thies.sn', 'nramos@ribeiro.net', NULL, NULL, '09 30 45 59 40', '06 61 85 58 85', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(319, 4, NULL, 1, 97, 1, 'Andrée', 'Benard', '1973-08-17', 'GilletVille', 'FR2077189472701B1VFA6847A66', '75 265', '57984', '2013-01-22', 'Marié(e)', 'Masculin', 0, 'susanneperrot@univ-thies.sn', 'denis.theophile@laposte.net', NULL, NULL, '+33 (0)5 14 13 06 56', '0121864697', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(320, 4, NULL, 1, 228, 4, 'René', 'Munoz', '2000-04-25', 'Gregoire-sur-Guyon', 'FR279142428367FUVDK1J9YAD15', '71 055', '10312', '1991-04-03', 'Divorcé(e)', 'Masculin', 0, 'lucyalves-martins@univ-thies.sn', 'paul96@club-internet.fr', NULL, NULL, '+33 (0)7 64 98 77 14', '04 94 71 46 22', 7, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(321, 1, NULL, 1, 71, 4, 'Hortense', 'Martins', '2005-07-09', 'Bonnin', 'FR781679531679LV2E3H489HL43', '47 537', '94168', '1981-12-30', 'Divorcé(e)', 'Masculin', 1, 'dianepineau@univ-thies.sn', 'bhamel@marie.fr', NULL, NULL, '+33 1 43 23 97 19', '01 82 21 56 67', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(322, 4, NULL, 1, 118, 3, 'Suzanne', 'Collin', '2001-11-04', 'Ribeiro', 'FR957127248644YJNPF2LDE7172', '80 122', '31 755', '1980-12-09', 'Veuf(ve)', 'Féminin', 1, 'martineleveque@univ-thies.sn', 'georges03@bouygtel.fr', NULL, NULL, '+33 2 97 51 76 44', '+33 6 13 75 53 35', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(323, 4, NULL, 1, 42, 2, 'Stéphanie', 'Blanchard', '1974-07-25', 'Tanguy', 'FR890370575888VM5YNF2OD3A22', '34 879', '47 785', '1994-04-25', 'Veuf(ve)', 'Masculin', 1, 'vincentaubert@univ-thies.sn', 'clerc.arnaude@legendre.net', NULL, NULL, '01 71 45 97 61', '+33 (0)3 13 24 13 22', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(324, 1, NULL, 1, 196, 1, 'Christiane', 'Denis', '1978-03-07', 'Barbe', 'FR086444189660330LZX9R5H734', '96 698', '06192', '2020-11-06', 'Marié(e)', 'Masculin', 1, '', 'blondel.valentine@brunel.fr', NULL, NULL, '+33 (0)5 21 59 65 97', '+33 (0)5 48 75 58 82', 2, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(325, 4, NULL, 1, 19, 1, 'Guillaume', 'Guillou', '2005-09-01', 'Julien-sur-Cordier', 'FR876657840115P5H9YV1E95V84', '08921', '28102', '2004-06-06', 'Célibataire', 'Féminin', 0, '', 'marion.xavier@live.com', NULL, NULL, '07 72 54 12 70', '04 73 49 21 15', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(326, 5, NULL, 1, 88, 3, 'Anaïs', 'Gonzalez', '1993-12-25', 'Martins-sur-Gregoire', 'FR5504276492422336FXZ197D46', '14018', '16 497', '1987-10-11', 'Marié(e)', 'Masculin', 1, 'fr', 'dfournier@barthelemy.fr', NULL, NULL, '01 11 04 55 18', '+33 1 58 04 91 79', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(327, 5, NULL, 1, 58, 1, 'Diane', 'Mathieu', '1997-04-16', 'Cohen-la-Forêt', 'FR060855330848EVUORK33M8638', '01711', '60 050', '2013-06-19', 'Célibataire', 'Féminin', 1, 'ad', 'denis.maillard@gros.fr', NULL, NULL, '+33 3 77 91 71 87', '05 10 07 03 09', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(328, 5, NULL, 1, 198, 1, 'Agnès', 'Bouvier', '1970-08-12', 'Lemaitre', 'FR165044653059589R9EL944821', '92909', '60175', '2020-09-07', 'Divorcé(e)', 'Masculin', 0, 'victor-nicolasjulien@univ-thies.sn', 'dominique.leduc@muller.net', NULL, NULL, '+33 1 42 96 71 86', '+33 5 34 05 72 76', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(329, 1, NULL, 1, 106, 2, 'Océane', 'Berger', '2017-04-26', 'Mahe', 'FR91457209185132ZJR9B1J8311', '22 908', '81 278', '1974-11-07', 'Célibataire', 'Féminin', 1, 'christelleribeiro@univ-thies.sn', 'camille.adam@free.fr', NULL, NULL, '+33 (0)1 24 45 71 54', '+33 1 59 60 78 75', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(330, 1, NULL, 1, 123, 1, 'Olivier', 'Lefevre', '2007-03-04', 'Peron-sur-Mer', 'FR6772620026088K41C6UGR2367', '52162', '32424', '1983-05-20', 'Marié(e)', 'Masculin', 1, 'arnaude-nicoleklein@univ-thies.sn', 'meyer.michele@dbmail.com', NULL, NULL, '0171439554', '+33 1 36 09 85 23', 3, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(331, 5, NULL, 1, 11, 4, 'Roland', 'Leclerc', '2020-05-25', 'Gallet', 'FR577241448778EG6TDH619E004', '94597', '53 689', '1980-08-10', 'Marié(e)', 'Féminin', 0, 'paulchauveau@univ-thies.sn', 'nchauveau@roche.com', NULL, NULL, '09 71 39 62 83', '+33 1 88 32 95 37', 7, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(332, 5, NULL, 1, 169, 2, 'Gilles', 'Bailly', '1985-12-17', 'Gonzalez-les-Bains', 'FR81425795395714F8EV0E7X958', '89646', '07 317', '1990-07-11', 'Veuf(ve)', 'Masculin', 0, 'th', 'idenis@free.fr', NULL, NULL, '+33 5 35 95 98 13', '+33 9 76 52 51 24', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(333, 5, NULL, 1, 153, 1, 'Cécile', 'Lebon', '2010-01-07', 'Morel', 'FR7203559882615Z3F1VNOBV617', '12 691', '57 537', '1977-07-30', 'Veuf(ve)', 'Masculin', 1, 'c', 'leleu.alphonse@noos.fr', NULL, NULL, '0817898356', '+33 9 56 25 16 14', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(334, 4, NULL, 1, 19, 2, 'Adrien', 'Neveu', '2013-03-15', 'Chevaliernec', 'FR688071282824BXTB46EJ6B512', '83 424', '48 836', '2015-03-15', 'Célibataire', 'Féminin', 1, 'luciebesson@univ-thies.sn', 'vaillant.gilbert@yahoo.fr', NULL, NULL, '+33 9 78 89 72 89', '+33 (0)4 64 97 32 62', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(335, 1, NULL, 1, 68, 4, 'Élisabeth', 'Verdier', '1984-02-05', 'Pascal', 'FR6953725601049DXWB6V1G2605', '78417', '98732', '1984-07-13', 'Célibataire', 'Féminin', 0, 'deniseremy@univ-thies.sn', 'capucine.gregoire@berthelot.fr', NULL, NULL, '0949496233', '07 64 15 20 95', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(336, 4, NULL, 1, 18, 1, 'Zacharie', 'Grenier', '1983-10-19', 'Legranddan', 'FR21150022455944F0S91549V26', '22 940', '78 049', '2001-01-26', 'Célibataire', 'Masculin', 1, 'timoth', 'perrier.suzanne@ifrance.com', NULL, NULL, '03 87 91 25 64', '+33 (0)4 21 97 19 30', 4, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(337, 4, NULL, 1, 30, 3, 'Eugène', 'Salmon', '1997-05-21', 'Fernandes', 'FR4522930244531UKD4RH5GD026', '80722', '04 657', '1989-03-31', 'Divorcé(e)', 'Masculin', 0, 'sylviemarie@univ-thies.sn', 'francoise.dupuis@alves.fr', NULL, NULL, '07 92 51 22 73', '02 28 93 62 78', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(338, 1, NULL, 1, 4, 2, 'Jacques', 'Foucher', '2005-08-25', 'Roche-sur-Leconte', 'FR7876398950446Z2B16Y92O468', '91351', '25 871', '2020-04-24', 'Divorcé(e)', 'Masculin', 1, 'ad', 'gabrielle.roger@ferrand.com', NULL, NULL, '09 36 51 09 62', '+33 2 99 62 14 96', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(339, 4, NULL, 1, 124, 2, 'Vincent', 'Aubert', '1973-05-07', 'Clement-sur-Thomas', 'FR9639743556968Y813ZGVKWW03', '33 406', '63 584', '2006-08-22', 'Marié(e)', 'Masculin', 1, 'marcelledurolland@univ-thies.sn', 'renaud.adele@valette.net', NULL, NULL, '+33 7 51 68 92 03', '+33 2 50 97 98 16', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(340, 4, NULL, 1, 16, 1, 'Denis', 'Laine', '1982-04-09', 'Noel', 'FR758212915427SWO6Q2E527301', '15597', '32 281', '2014-05-23', 'Marié(e)', 'Masculin', 1, 'patricialemaire-desousa@univ-thies.sn', 'hdavid@guerin.fr', NULL, NULL, '01 78 20 48 13', '08 99 45 79 51', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(341, 5, NULL, 1, 126, 3, 'Louis', 'Hubert', '1970-06-08', 'Meyer', 'FR3575706799576FN4U54QSMX99', '34 124', '50 461', '1983-04-03', 'Divorcé(e)', 'Féminin', 0, 'zacharieguillet@univ-thies.sn', 'cmartinez@yahoo.fr', NULL, NULL, '+33 2 67 40 38 87', '+33 4 35 40 23 30', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(342, 4, NULL, 1, 159, 1, 'Arthur', 'Mallet', '1978-07-16', 'BoulayBourg', 'FR8281577816795DRD5O2806I96', '21 833', '32867', '2001-01-09', 'Veuf(ve)', 'Masculin', 0, 'gr', 'hmorel@sfr.fr', NULL, NULL, '+33 (0)1 31 45 55 85', '0151477610', 8, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(343, 4, NULL, 1, 104, 1, 'Michèle', 'Gautier', '1999-10-20', 'Legendre', 'FR3638358305236GA1CYAN2O207', '28506', '67 584', '2000-11-24', 'Célibataire', 'Masculin', 0, 'juliejulien@univ-thies.sn', 'nathalie.guibert@wanadoo.fr', NULL, NULL, '0372059968', '0305843248', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(344, 1, NULL, 1, 135, 2, 'Michel', 'Alexandre', '1972-09-30', 'Charles', 'FR826291064413Y991Y6J6XCU71', '75676', '89 708', '1977-02-13', 'Veuf(ve)', 'Masculin', 0, 'suzannehuet@univ-thies.sn', 'etienne05@giraud.fr', NULL, NULL, '+33 4 41 29 21 36', '0605763188', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(345, 4, NULL, 1, 70, 4, 'Caroline', 'Leclerc', '1973-10-06', 'Germain', 'FR78597477666537G2BD3L19331', '86 128', '63 292', '2014-05-08', 'Divorcé(e)', 'Masculin', 0, 'victoirepons@univ-thies.sn', 'monique.alexandre@voila.fr', NULL, NULL, '09 18 98 47 30', '+33 9 16 68 64 92', 3, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(346, 4, NULL, 1, 91, 2, 'Maurice', 'Leleu', '1987-04-05', 'Letellier', 'FR57372186223441YV2XK8RD326', '35 250', '22633', '1997-07-22', 'Célibataire', 'Masculin', 1, 'claudebouchet@univ-thies.sn', 'gautier.nicole@noos.fr', NULL, NULL, '+33 3 09 20 68 71', '+33 (0)9 89 32 61 09', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(347, 1, NULL, 1, 200, 4, 'Émilie', 'Perez', '2016-12-18', 'Denis', 'FR592634510751QX980GLB42K26', '40 293', '46052', '1982-03-23', 'Veuf(ve)', 'Féminin', 0, 'agatheleroy@univ-thies.sn', 'philippine84@marin.org', NULL, NULL, '+33 2 18 05 53 17', '+33 (0)1 61 92 73 09', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(348, 4, NULL, 1, 170, 2, 'Joseph', 'Pereira', '2002-07-30', 'Allain', 'FR3094083415889OCOGGOCMCW57', '02157', '19 113', '1992-03-04', 'Divorcé(e)', 'Féminin', 0, 'fran', 'zseguin@tiscali.fr', NULL, NULL, '0175548105', '+33 (0)3 47 18 57 27', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(349, 4, NULL, 1, 206, 1, 'Lucas', 'Coste', '2013-05-18', 'Germain', 'FR763619040203Y44831H3C8604', '02119', '54 796', '2011-06-08', 'Célibataire', 'Féminin', 1, 'madeleinepons@univ-thies.sn', 'masse.alphonse@hotmail.fr', NULL, NULL, '+33 (0)5 02 47 99 75', '+33 7 96 03 01 99', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(350, 1, NULL, 1, 120, 4, 'Victor', 'Joseph', '1972-12-28', 'Gillet', 'FR462391846796O9VE05NPHDJ06', '70830', '23202', '1999-11-19', 'Célibataire', 'Féminin', 0, 'laure-marthelecoq@univ-thies.sn', 'suzanne.lopez@tiscali.fr', NULL, NULL, '0175128101', '+33 8 15 55 63 58', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(351, 5, NULL, 1, 153, 4, 'Amélie', 'Riou', '2006-08-13', 'Marion-sur-Lebrun', 'FR05952035914994I5354N6PK84', '50028', '96 083', '2018-10-08', 'Divorcé(e)', 'Féminin', 0, 'marthe-anoukhumbert@univ-thies.sn', 'william.jacques@yahoo.fr', NULL, NULL, '09 18 55 58 18', '01 55 36 12 32', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(352, 1, NULL, 1, 102, 2, 'Stéphanie', 'Leroux', '2011-03-25', 'Morenonec', 'FR578871231623D7I99NV72WE21', '01333', '70486', '1998-01-18', 'Veuf(ve)', 'Masculin', 0, 'cl', 'blanchard.sebastien@ifrance.com', NULL, NULL, '+33 (0)3 24 94 51 24', '+33 8 18 51 79 64', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(353, 5, NULL, 1, 223, 2, 'Gérard', 'Gimenez', '1990-04-25', 'Cordiernec', 'FR560026708772J4A9VG194V605', '21 945', '20 153', '1980-12-01', 'Célibataire', 'Féminin', 1, 'gilbertbenoit@univ-thies.sn', 'gilbert.blanchard@briand.fr', NULL, NULL, '+33 (0)3 89 69 57 69', '+33 3 61 40 42 75', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(354, 1, NULL, 1, 189, 3, 'Claire', 'Boulay', '2016-04-28', 'Galletnec', 'FR388547180295Y3ODL22613Q44', '79294', '68739', '1990-06-18', 'Veuf(ve)', 'Féminin', 1, 'emmanueldelanglois@univ-thies.sn', 'vgrenier@rousseau.net', NULL, NULL, '01 20 82 15 55', '0532532814', 5, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(355, 1, NULL, 1, 155, 4, 'Richard', 'Pottier', '2001-12-03', 'Morel-la-Forêt', 'FR0564385832275R15Y4JD5BL10', '73 813', '54 548', '1990-03-23', 'Célibataire', 'Féminin', 0, 'no', 'pjoseph@wanadoo.fr', NULL, NULL, '0455344964', '+33 (0)4 94 96 88 22', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(356, 5, NULL, 1, 62, 4, 'Emmanuel', 'Lenoir', '2019-10-26', 'Perez', 'FR140719604092MC9A2Q3VTS207', '97 580', '18 875', '1984-06-30', 'Marié(e)', 'Féminin', 1, 'timoth', 'franck57@ifrance.com', NULL, NULL, '+33 (0)5 69 34 08 30', '07 33 39 70 41', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(357, 1, NULL, 1, 85, 4, 'Louise', 'Rey', '1979-02-09', 'Lombardnec', 'FR490471869530R700N57I98C42', '27327', '59 232', '2020-12-16', 'Veuf(ve)', 'Féminin', 0, 'c', 'lucas.payet@raymond.com', NULL, NULL, '03 67 47 23 71', '07 73 21 95 77', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(358, 1, NULL, 1, 25, 4, 'Lorraine', 'Potier', '2014-11-18', 'Bouvetnec', 'FR384906427672XQ2PN9T1D6624', '37 990', '43 490', '1995-09-12', 'Célibataire', 'Féminin', 0, 'olivieteixeira@univ-thies.sn', 'marechal.marcel@noos.fr', NULL, NULL, '+33 (0)2 11 87 98 28', '+33 (0)8 15 71 54 49', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(359, 4, NULL, 1, 63, 2, 'Alice', 'Laine', '1980-01-14', 'Faure', 'FR054611336419J7QR713509R74', '24 208', '25 772', '1976-08-13', 'Divorcé(e)', 'Masculin', 0, 'emmanuelleschmitt@univ-thies.sn', 'susanne05@noos.fr', NULL, NULL, '+33 (0)8 13 49 76 09', '+33 (0)1 32 17 53 12', 5, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(360, 1, NULL, 1, 184, 1, 'Thibaut', 'Bertin', '1993-11-14', 'Gosselin', 'FR7318736851452982ONS941177', '05799', '24501', '1991-08-13', 'Divorcé(e)', 'Féminin', 0, 'matthieusalmon@univ-thies.sn', 'claude83@dbmail.com', NULL, NULL, '+33 (0)8 13 92 54 33', '0803394064', 9, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(361, 1, NULL, 1, 25, 2, 'Madeleine', 'Leroy', '1981-04-01', 'Ramos', 'FR718661083583144J9OZM9O882', '27951', '85 288', '1987-09-17', 'Marié(e)', 'Masculin', 0, 'gillesderousset@univ-thies.sn', 'nathalie38@tele2.fr', NULL, NULL, '01 34 38 85 36', '0189279512', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(362, 4, NULL, 1, 202, 1, 'François', 'Leroy', '1993-10-30', 'Launay-les-Bains', 'FR6490059406011M8094O00NM35', '58556', '54 500', '2007-08-27', 'Divorcé(e)', 'Féminin', 0, 'j', 'leclerc.elodie@gmail.com', NULL, NULL, '0157822517', '+33 5 96 64 99 70', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(363, 5, NULL, 1, 197, 2, 'Laetitia', 'Dubois', '1992-06-16', 'Gerardnec', 'FR079019552172498YTVNY2P107', '16 504', '88643', '1999-08-31', 'Marié(e)', 'Masculin', 0, 'in', 'amoulin@bouygtel.fr', NULL, NULL, '+33 (0)8 19 62 74 94', '+33 (0)8 98 28 65 25', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(364, 4, NULL, 1, 164, 2, 'Franck', 'Devaux', '2005-01-13', 'Benoit-la-Forêt', 'FR477120119662D01SI63MC0973', '85 264', '01286', '2001-11-16', 'Célibataire', 'Masculin', 1, 'augustethomas@univ-thies.sn', 'klein.penelope@bouygtel.fr', NULL, NULL, '0652439221', '0106295313', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(365, 1, NULL, 1, 140, 1, 'Frédéric', 'Schneider', '2003-03-02', 'Pierre', 'FR599069431850U3G84626AM708', '02 719', '43679', '2012-04-16', 'Marié(e)', 'Masculin', 1, 'laetitia-am', 'emmanuelle.riviere@lemaitre.com', NULL, NULL, '+33 3 30 70 72 33', '+33 (0)2 34 14 34 19', 7, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(366, 5, NULL, 1, 242, 2, 'Amélie', 'Durand', '1987-09-30', 'Dupre-la-Forêt', 'FR62365020938387C15WARZNN81', '52503', '19 132', '2002-04-25', 'Veuf(ve)', 'Masculin', 0, 'thierrybouvet@univ-thies.sn', 'maurice.frederic@descamps.com', NULL, NULL, '+33 9 45 91 45 75', '04 96 51 58 02', 1, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(367, 4, NULL, 1, 149, 2, 'Martine', 'Martel', '1976-06-28', 'Muller-sur-Diaz', 'FR1008026491811ZJNX6GGX0F06', '69 894', '96 865', '1983-04-25', 'Divorcé(e)', 'Féminin', 0, 'michelboulanger@univ-thies.sn', 'nguyen.danielle@brun.org', NULL, NULL, '0299718761', '0355148900', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(368, 1, NULL, 1, 191, 2, 'Susanne', 'Prevost', '1983-10-10', 'Renault-sur-Rousset', 'FR63078443082359U7JX8MFA691', '64431', '28797', '2016-04-23', 'Célibataire', 'Masculin', 0, 'paulineprevost-gaillard@univ-thies.sn', 'vmarques@free.fr', NULL, NULL, '05 56 70 61 75', '+33 9 98 08 97 83', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(369, 5, NULL, 1, 177, 2, 'Xavier', 'Roche', '1986-10-03', 'Paris', 'FR73978599000344S6T82R8XP74', '45154', '49 043', '2008-03-08', 'Marié(e)', 'Féminin', 0, 'gr', 'corinne24@club-internet.fr', NULL, NULL, '+33 4 98 47 30 69', '0399656949', 7, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(370, 5, NULL, 1, 187, 1, 'Mathilde', 'Dos Santos', '2001-05-08', 'Charles', 'FR185081610960V09C2GVO78029', '25 472', '93414', '1980-11-20', 'Marié(e)', 'Féminin', 1, 'denisefleury@univ-thies.sn', 'christophe76@carre.com', NULL, NULL, '+33 9 62 00 84 55', '0423712811', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(371, 5, NULL, 1, 160, 3, 'Étienne', 'De Sousa', '1983-01-28', 'Hebert-sur-Mer', 'FR722055087248UL9YBLK1O7628', '83029', '84 597', '1979-11-08', 'Marié(e)', 'Masculin', 0, 'colettevaillant@univ-thies.sn', 'ncolas@grondin.net', NULL, NULL, '+33 (0)5 87 20 80 25', '+33 2 63 17 19 94', 4, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(372, 4, NULL, 1, 217, 4, 'Eugène', 'Denis', '2011-09-07', 'Roche', 'FR6053893672859HK472GL6OI01', '52 786', '25 412', '1971-04-29', 'Veuf(ve)', 'Féminin', 0, 'fran', 'josette88@reynaud.org', NULL, NULL, '+33 (0)1 24 13 08 28', '+33 (0)6 63 34 43 20', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(373, 4, NULL, 1, 121, 3, 'Caroline', 'Martinez', '2000-01-30', 'Becker', 'FR6028761747979N44O3PBWD554', '99731', '96 876', '2010-05-24', 'Veuf(ve)', 'Masculin', 0, 'zo', 'claire11@lefevre.com', NULL, NULL, '01 39 67 45 00', '01 57 91 09 05', 2, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(374, 1, NULL, 1, 212, 3, 'Sylvie', 'Breton', '2011-01-04', 'Guillet', 'FR974084635792N540X4018BQ24', '55 752', '72939', '1985-07-15', 'Marié(e)', 'Masculin', 1, 'sylvie-christianeleveque@univ-thies.sn', 'bousquet.penelope@free.fr', NULL, NULL, '09 93 98 27 79', '+33 (0)1 42 25 14 33', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(375, 5, NULL, 1, 135, 4, 'Henri', 'Chauvin', '1983-05-21', 'Lefort-les-Bains', 'FR7039302650247213CY38S1B27', '32 063', '34 075', '2007-05-08', 'Veuf(ve)', 'Féminin', 0, 'juliette-', 'mathilde.boucher@joly.org', NULL, NULL, '+33 (0)5 27 76 97 25', '+33 (0)5 08 13 06 80', 2, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(376, 5, NULL, 1, 114, 1, 'Stéphane', 'Dupuis', '1998-01-06', 'Mailletnec', 'FR77531902154192293X43QNU70', '83 086', '42739', '1978-12-07', 'Divorcé(e)', 'Féminin', 0, 'th', 'hprevost@guillon.fr', NULL, NULL, '+33 (0)4 73 19 56 04', '0179670816', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(377, 1, NULL, 1, 81, 4, 'Édouard', 'Samson', '2001-11-10', 'Duhamel', 'FR0614276014528314J6Q5EP558', '25397', '56469', '1993-09-26', 'Célibataire', 'Féminin', 0, 'raymondmercier@univ-thies.sn', 'victoire.leclerc@gosselin.org', NULL, NULL, '06 37 63 57 76', '05 65 94 04 81', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(378, 4, NULL, 1, 210, 1, 'Margaux', 'Gomez', '1993-05-14', 'Lebrun', 'FR6381532263651UDNW3L20S931', '25495', '53 146', '1973-08-27', 'Célibataire', 'Féminin', 1, 'clairegarnier@univ-thies.sn', 'marcelle.bertin@tiscali.fr', NULL, NULL, '+33 (0)3 12 98 41 71', '+33 (0)5 49 71 75 27', 4, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(379, 5, NULL, 1, 27, 3, 'Céline', 'Rolland', '2012-05-18', 'Lefort', 'FR390833973468GAA0L49709623', '69498', '43049', '2005-12-18', 'Divorcé(e)', 'Masculin', 1, 'manondescamps@univ-thies.sn', 'aimee49@ribeiro.fr', NULL, NULL, '+33 (0)5 97 37 07 34', '+33 (0)4 30 20 02 34', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(380, 4, NULL, 1, 14, 4, 'Laetitia', 'Pelletier', '1999-01-04', 'Evrard', 'FR04663145079760FK9UR6F9A41', '18056', '40703', '1996-08-22', 'Divorcé(e)', 'Masculin', 1, 'thierry-adrienmaillet@univ-thies.sn', 'lebon.gregoire@wanadoo.fr', NULL, NULL, '+33 2 52 21 16 74', '06 70 55 75 02', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(381, 1, NULL, 1, 40, 2, 'Nath', 'Dos Santos', '2004-09-26', 'Carrenec', 'FR380013424057LYC0T632ND604', '80327', '20448', '1994-07-30', 'Marié(e)', 'Masculin', 1, 'daniellemarques@univ-thies.sn', 'susanne31@laposte.net', NULL, NULL, '+33 6 86 53 26 29', '+33 (0)6 65 14 61 86', 1, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(382, 5, NULL, 1, 110, 2, 'Renée', 'Colas', '1992-05-18', 'PerretBourg', 'FR827616960890RXV72GWI4M644', '93 715', '33052', '1987-11-13', 'Veuf(ve)', 'Féminin', 1, 'beno', 'poirier.guy@tiscali.fr', NULL, NULL, '0560239375', '0326890069', 5, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(383, 5, NULL, 1, 173, 1, 'Gabrielle', 'Marty', '1998-10-31', 'Marchal', 'FR365918726228O97NFQ899LU64', '98 572', '96485', '1999-08-06', 'Marié(e)', 'Féminin', 1, 'c', 'muller.olivie@ifrance.com', NULL, NULL, '0101006909', '0895828606', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(384, 5, NULL, 1, 55, 2, 'Jacques', 'Perez', '1975-08-25', 'Peltier', 'FR419324285826QT5Q42Y1A5563', '06 108', '36 135', '2014-07-23', 'Marié(e)', 'Masculin', 0, 'alexandriebouchet-guerin@univ-thies.sn', 'guillon.laetitia@bourgeois.com', NULL, NULL, '06 89 31 49 43', '+33 6 99 38 50 36', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(385, 5, NULL, 1, 202, 4, 'Roland', 'Wagner', '2020-12-17', 'Guilbert', 'FR174733496983M885JYA354N48', '57 218', '59209', '1999-10-12', 'Célibataire', 'Féminin', 0, 'odettedescamps@univ-thies.sn', 'kpereira@techer.com', NULL, NULL, '02 09 75 14 40', '04 03 24 56 84', 3, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(386, 4, NULL, 1, 41, 1, 'Stéphanie', 'Merle', '1978-11-10', 'Schmitt-sur-Mer', 'FR091843906522F02OJ2XBIB601', '16584', '08 907', '2006-07-01', 'Divorcé(e)', 'Masculin', 1, 'yvesraynaud@univ-thies.sn', 'adrien87@laposte.net', NULL, NULL, '0746691202', '08 24 60 59 33', 7, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(387, 1, NULL, 1, 219, 2, 'Michèle', 'Sauvage', '1993-03-23', 'Merledan', 'FR313856629716M8CJ2HDUBW549', '21 056', '86565', '2003-11-09', 'Veuf(ve)', 'Masculin', 0, '', 'marianne.deschamps@mathieu.fr', NULL, NULL, '0895681236', '+33 (0)4 70 50 59 90', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(388, 1, NULL, 1, 87, 4, 'Bertrand', 'Michaud', '1993-01-19', 'Gallet-la-Forêt', 'FR1639153744902003S0D3ZNC66', '84820', '08221', '1997-07-30', 'Veuf(ve)', 'Masculin', 1, 'michelledaniel-pruvost@univ-thies.sn', 'legendre.pauline@vasseur.fr', NULL, NULL, '0692022590', '0609469771', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(389, 1, NULL, 1, 58, 4, 'Noémi', 'Schneider', '1986-09-01', 'Rossiboeuf', 'FR796328106392594WH349P3924', '65371', '45 597', '1988-11-25', 'Divorcé(e)', 'Masculin', 0, 'denismaillot@univ-thies.sn', 'bteixeira@wanadoo.fr', NULL, NULL, '+33 4 81 48 79 21', '+33 (0)6 37 17 67 91', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(390, 4, NULL, 1, 64, 4, 'Daniel', 'Perret', '2003-07-15', 'Maillet', 'FR7910745101159X756V5UJ0740', '07 856', '82 344', '1981-07-11', 'Divorcé(e)', 'Féminin', 1, 'josette-jacquelinecouturier@univ-thies.sn', 'raynaud.louise@tiscali.fr', NULL, NULL, '+33 (0)4 53 76 18 88', '0682821606', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(391, 1, NULL, 1, 28, 2, 'Antoinette', 'Mahe', '1996-06-03', 'Navarro', 'FR109611674568RLPHXU8JDX375', '45 396', '98 907', '2004-09-10', 'Veuf(ve)', 'Féminin', 1, 'sylvie-anastasieberger@univ-thies.sn', 'alphonse.dubois@gmail.com', NULL, NULL, '+33 (0)9 94 68 96 15', '+33 3 76 13 95 06', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(392, 1, NULL, 1, 30, 1, 'Nathalie', 'Barbe', '1994-01-01', 'Lacroix', 'FR760078559979XS81R5D09QF64', '82 559', '11745', '2011-10-26', 'Célibataire', 'Féminin', 0, 'alix-lucecarre@univ-thies.sn', 'paris.nicolas@herve.com', NULL, NULL, '+33 (0)3 78 00 65 74', '+33 4 07 75 46 19', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(393, 5, NULL, 1, 100, 4, 'Adélaïde', 'Weber', '2017-11-14', 'Gilles', 'FR035264572984504TENNIC4800', '92056', '81702', '2017-11-05', 'Marié(e)', 'Féminin', 1, 'virginiehubert@univ-thies.sn', 'xavier.dufour@ifrance.com', NULL, NULL, '+33 (0)6 11 04 28 81', '+33 7 58 42 16 18', 1, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(394, 4, NULL, 1, 43, 1, 'Gilbert', 'Gaillard', '2007-06-01', 'Clercnec', 'FR919887754806C9TB2095A7372', '68 488', '28581', '1999-12-18', 'Marié(e)', 'Masculin', 0, 'daviddidier-delorme@univ-thies.sn', 'thierry51@rey.fr', NULL, NULL, '+33 1 10 72 46 89', '04 70 20 75 81', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(395, 5, NULL, 1, 147, 2, 'Adélaïde', 'Humbert', '2018-09-22', 'Blanchard-la-Forêt', 'FR3705511265524Q6QYSY8B4D72', '58798', '66610', '1990-08-09', 'Marié(e)', 'Féminin', 0, 'jacquesperrot@univ-thies.sn', 'hmercier@schneider.com', NULL, NULL, '03 16 03 66 37', '+33 (0)3 71 54 10 12', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(396, 5, NULL, 1, 178, 2, 'Timothée', 'Boulay', '1992-09-13', 'Charlesboeuf', 'FR46163182172990590EL609941', '02735', '09 803', '1997-08-06', 'Marié(e)', 'Masculin', 0, 'th', 'lucas.petitjean@robert.org', NULL, NULL, '01 49 47 42 14', '0635373661', 3, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(397, 5, NULL, 1, 142, 1, 'René', 'Boulay', '1977-10-27', 'Petit-sur-Collet', 'FR88988063472886P626IUPQ034', '50679', '20 433', '1971-03-26', 'Divorcé(e)', 'Féminin', 1, 'paulinedelaroux@univ-thies.sn', 'olivie34@tiscali.fr', NULL, NULL, '+33 2 67 16 78 18', '+33 (0)8 18 61 40 75', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(398, 1, NULL, 1, 234, 3, 'Alix', 'Sanchez', '1996-11-12', 'Raymond', 'FR224808543255F7531ZU2AWN20', '25316', '48914', '2010-12-06', 'Marié(e)', 'Masculin', 1, '', 'rocher.theophile@delaunay.com', NULL, NULL, '+33 (0)7 82 97 01 65', '+33 1 11 11 40 89', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(399, 4, NULL, 1, 126, 4, 'Paul', 'Mallet', '1995-07-20', 'Simon-sur-Allain', 'FR498446331322HEGI2U005W969', '82 055', '42 479', '1999-02-17', 'Divorcé(e)', 'Masculin', 1, 'hortensebreton-techer@univ-thies.sn', 'deoliveira.stephanie@remy.fr', NULL, NULL, '03 30 98 77 83', '06 28 48 70 61', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(400, 1, NULL, 1, 73, 1, 'Denis', 'Sanchez', '1974-08-12', 'Giraud', 'FR52157473750977BW9I7I44413', '75 797', '35002', '1996-10-18', 'Célibataire', 'Masculin', 1, 'anneleclercq@univ-thies.sn', 'arthur.bouchet@jourdan.net', NULL, NULL, '04 26 99 87 96', '08 97 86 57 79', 1, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(401, 5, NULL, 1, 101, 4, 'Denise', 'Guilbert', '1973-11-12', 'Leveque', 'FR410889172012329L2GLZKBU71', '08888', '32746', '2010-06-17', 'Célibataire', 'Féminin', 0, 'bertrand-eug', 'zvalentin@gimenez.org', NULL, NULL, '01 24 39 93 17', '+33 (0)6 57 01 81 06', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(402, 4, NULL, 1, 46, 3, 'Colette', 'Gomes', '2016-11-14', 'Renaud', 'FR716104264527CV7U9YO6CUE83', '63916', '96 167', '1984-01-01', 'Marié(e)', 'Féminin', 1, 'fr', 'corinne58@sfr.fr', NULL, NULL, '+33 2 39 67 37 90', '+33 8 97 25 99 66', 6, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(403, 1, NULL, 1, 242, 1, 'Adrienne', 'Renard', '2002-07-10', 'Vincent-la-Forêt', 'FR439454851420ZD6PE18U4K581', '31 349', '89067', '1987-11-16', 'Marié(e)', 'Féminin', 0, 'charlesmichel@univ-thies.sn', 'audrey59@gosselin.fr', NULL, NULL, '02 50 56 63 31', '0531561799', 9, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(404, 1, NULL, 1, 16, 4, 'Alfred', 'Letellier', '2019-07-20', 'Lenoir', 'FR33975204055904333YRCE2231', '84 053', '42105', '2007-06-12', 'Célibataire', 'Masculin', 0, 'anoukleblanc@univ-thies.sn', 'eric94@voila.fr', NULL, NULL, '+33 (0)7 51 86 27 91', '0142252177', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(405, 5, NULL, 1, 8, 1, 'Valentine', 'Morin', '1994-03-14', 'Legros-sur-Mer', 'FR6057038960318NUXQD1K8FJ27', '60922', '99 241', '1970-02-15', 'Divorcé(e)', 'Féminin', 1, 'thomasleveque@univ-thies.sn', 'isaac11@laposte.net', NULL, NULL, '+33 (0)9 21 50 77 84', '+33 (0)9 43 28 58 90', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(406, 1, NULL, 1, 131, 2, 'Robert', 'Delannoy', '2001-03-25', 'Rodrigues', 'FR834533540738B2C75NUW35387', '80 830', '19835', '2006-06-25', 'Veuf(ve)', 'Féminin', 0, 'charles-mauricelecoq@univ-thies.sn', 'marty.agathe@imbert.com', NULL, NULL, '0900279641', '04 29 42 23 71', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(407, 1, NULL, 1, 107, 4, 'Caroline', 'Allard', '2000-07-30', 'Didier', 'FR24554268597983TE5G975TG61', '48231', '77830', '1973-12-13', 'Célibataire', 'Masculin', 1, '', 'kriou@leveque.org', NULL, NULL, '+33 5 35 57 63 46', '+33 (0)1 08 53 86 49', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(408, 5, NULL, 1, 214, 2, 'Alfred', 'Benard', '1996-08-22', 'Mathieu-sur-Daniel', 'FR834278758605DLW3G47HCJ840', '22138', '98701', '2007-02-15', 'Marié(e)', 'Féminin', 1, '', 'christine.garcia@dijoux.com', NULL, NULL, '09 83 83 78 88', '0584541480', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(409, 4, NULL, 1, 41, 4, 'Anne', 'Maury', '2020-10-07', 'Dupre', 'FR10738384306576X57J7IGG479', '54 096', '82115', '1971-01-14', 'Marié(e)', 'Masculin', 1, 'margueritemallet@univ-thies.sn', 'audrey.samson@noos.fr', NULL, NULL, '05 96 96 79 58', '08 99 80 62 67', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(410, 4, NULL, 1, 210, 1, 'Gilbert', 'Denis', '2015-09-26', 'Baudry', 'FR370128696337G75S0CK0HVX70', '40859', '14 789', '1995-03-26', 'Divorcé(e)', 'Féminin', 0, 'charlotte-aim', 'imarty@wanadoo.fr', NULL, NULL, '+33 (0)1 05 70 64 10', '0658650185', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(411, 1, NULL, 1, 168, 2, 'Astrid', 'Bousquet', '2019-02-23', 'Fernandezdan', 'FR588113849828NR0P2052J4736', '75319', '48 528', '2020-06-24', 'Marié(e)', 'Féminin', 1, 'mauriceherve@univ-thies.sn', 'leger.amelie@tiscali.fr', NULL, NULL, '+33 (0)8 97 97 16 86', '05 55 14 30 10', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(412, 4, NULL, 1, 81, 2, 'Marine', 'Dijoux', '2016-04-26', 'Dupre', 'FR70997761646287QMN8XHEWW60', '98 845', '62311', '2006-08-23', 'Veuf(ve)', 'Féminin', 1, 'alix-audreynguyen@univ-thies.sn', 'amelie.cohen@bouygtel.fr', NULL, NULL, '0913643312', '+33 3 05 79 09 76', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(413, 5, NULL, 1, 184, 3, 'Raymond', 'Wagner', '1973-03-01', 'GosselinBourg', 'FR953054157226Y497P957R3351', '06 800', '71794', '1994-05-27', 'Célibataire', 'Féminin', 1, '', 'alexandria.guyon@lucas.net', NULL, NULL, '+33 5 31 43 43 16', '+33 (0)1 62 53 05 27', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(414, 1, NULL, 1, 220, 1, 'Antoine', 'Gay', '1977-09-18', 'Paul-sur-Mer', 'FR292768021101Q39F0P1687568', '64732', '99 374', '1986-08-15', 'Marié(e)', 'Féminin', 0, '', 'camille60@barbier.org', NULL, NULL, '0198805602', '+33 (0)6 20 82 37 72', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(415, 5, NULL, 1, 200, 4, 'Inès', 'Blot', '1977-08-03', 'Hamonboeuf', 'FR596673095433YR41GFE95ZB42', '82873', '80585', '1985-01-20', 'Divorcé(e)', 'Masculin', 1, 'gr', 'ylacombe@orange.fr', NULL, NULL, '08 18 01 20 02', '09 71 57 17 75', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(416, 1, NULL, 1, 147, 1, 'Philippe', 'Bertin', '2016-02-14', 'Cousin', 'FR4798895534579D9NB0JPFDD63', '33 499', '35801', '1993-04-29', 'Marié(e)', 'Féminin', 0, 'laetitiavincent-fernandez@univ-thies.sn', 'rmaillet@lefort.fr', NULL, NULL, '0640023140', '07 80 96 80 85', 9, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(417, 4, NULL, 1, 42, 4, 'Capucine', 'Alexandre', '2003-06-19', 'Perrot', 'FR783644410546DC7H2642IDC94', '03281', '05401', '1992-09-28', 'Divorcé(e)', 'Féminin', 0, 'bertrandlecarre@univ-thies.sn', 'laurent68@voila.fr', NULL, NULL, '+33 (0)9 89 36 03 39', '0913680733', 7, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(418, 5, NULL, 1, 150, 2, 'Grégoire', 'Vidal', '2004-12-01', 'Jacquot-sur-Gonzalez', 'FR847884843320D22M41546V514', '59482', '12050', '1990-01-31', 'Célibataire', 'Masculin', 0, 'susanneguillaume@univ-thies.sn', 'grenier.laure@voila.fr', NULL, NULL, '+33 (0)8 92 84 45 96', '+33 1 49 89 89 15', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(419, 5, NULL, 1, 214, 3, 'Claude', 'Faivre', '1996-12-16', 'Gaudin', 'FR5075713523810RW0N0FTJX018', '35 453', '44 688', '1985-08-03', 'Marié(e)', 'Masculin', 0, 'bernardmaillot@univ-thies.sn', 'gilles47@sfr.fr', NULL, NULL, '01 70 52 14 07', '+33 (0)6 52 90 30 91', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(420, 5, NULL, 1, 149, 3, 'Stéphanie', 'Leveque', '1990-11-26', 'Bailly', 'FR455991538439LY8674506G594', '79 582', '82 629', '2004-07-19', 'Divorcé(e)', 'Masculin', 1, 'juliebegue@univ-thies.sn', 'eric93@masson.org', NULL, NULL, '07 92 98 30 07', '+33 (0)8 28 18 11 42', 3, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(421, 1, NULL, 1, 51, 4, 'Astrid', 'Dubois', '1990-09-25', 'Henry', 'FR897712139011VCR09GIBXS936', '53 284', '14854', '2001-01-23', 'Marié(e)', 'Féminin', 1, '', 'trenaud@gimenez.com', NULL, NULL, '+33 (0)5 35 04 30 17', '+33 7 46 59 43 61', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(422, 5, NULL, 1, 223, 1, 'Martine', 'Chretien', '1993-07-15', 'Moulin-les-Bains', 'FR469545127477XA767WV5FK940', '50954', '46310', '1975-04-10', 'Marié(e)', 'Féminin', 1, 'emmanuellecarre@univ-thies.sn', 'tcolin@free.fr', NULL, NULL, '06 43 01 30 56', '02 82 79 29 46', 6, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(423, 1, NULL, 1, 6, 2, 'Patricia', 'Maillard', '2007-10-07', 'Kleinboeuf', 'FR8309504556532AYH8SAYF1N23', '03697', '75 643', '2017-09-22', 'Célibataire', 'Féminin', 1, '', 'duhamel.william@bouchet.fr', NULL, NULL, '0451202563', '+33 (0)6 91 91 65 79', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(424, 1, NULL, 1, 12, 3, 'Adrien', 'Tessier', '1987-09-29', 'Gautiernec', 'FR749659809655625Z17J813292', '10852', '02 201', '1986-07-18', 'Veuf(ve)', 'Féminin', 1, 'nathbailly-gauthier@univ-thies.sn', 'zcoulon@sfr.fr', NULL, NULL, '+33 (0)3 02 21 64 15', '+33 5 10 49 23 75', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(425, 4, NULL, 1, 226, 4, 'Benjamin', 'Besson', '1977-04-18', 'Martins-sur-Voisin', 'FR483241727638WQ97NA6C7SH09', '90417', '55982', '1974-05-03', 'Marié(e)', 'Féminin', 0, 'christellepierre@univ-thies.sn', 'catherine42@bousquet.org', NULL, NULL, '+33 1 89 84 10 10', '06 96 04 95 46', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(426, 5, NULL, 1, 49, 3, 'Vincent', 'Clerc', '1975-09-20', 'Prevost', 'FR025116352400I04LG44176B73', '22289', '14169', '2005-12-10', 'Marié(e)', 'Masculin', 0, 'michellecolas@univ-thies.sn', 'elebon@hotmail.fr', NULL, NULL, '09 25 23 30 06', '+33 2 81 91 02 48', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(427, 1, NULL, 1, 128, 2, 'Adrienne', 'Bouvier', '2014-12-06', 'Robert-sur-Gautier', 'FR2460732161706458R68UCD183', '66404', '47 391', '1994-10-03', 'Divorcé(e)', 'Masculin', 1, 'davidrossi@univ-thies.sn', 'augustin43@lecoq.com', NULL, NULL, '+33 (0)4 26 43 13 04', '+33 6 72 37 32 96', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(428, 4, NULL, 1, 151, 3, 'Dominique', 'Chretien', '1986-05-14', 'Legendre', 'FR7503874383046G49209X6DG70', '20 765', '31 323', '1991-12-31', 'Célibataire', 'Masculin', 1, 'paulduval@univ-thies.sn', 'marin.henriette@munoz.fr', NULL, NULL, '06 23 03 55 39', '0401886406', 1, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(429, 5, NULL, 1, 209, 4, 'Maurice', 'Lacroix', '1999-08-28', 'Boucher', 'FR819093240564EQ70WO00JND87', '38 838', '11 722', '1985-11-13', 'Célibataire', 'Masculin', 1, 'marine-oc', 'jean02@noos.fr', NULL, NULL, '07 47 03 50 09', '+33 3 69 03 40 04', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(430, 5, NULL, 1, 5, 4, 'Anaïs', 'Lesage', '1991-04-27', 'Boutin', 'FR541517367712HD2LSQL8YVM51', '57 144', '33 097', '2020-05-16', 'Marié(e)', 'Masculin', 0, 'bernadettegarnier@univ-thies.sn', 'boutin.andre@valette.net', NULL, NULL, '+33 (0)4 28 10 12 31', '07 48 28 82 14', 4, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(431, 1, NULL, 1, 116, 2, 'Gilbert', 'Vaillant', '1974-01-13', 'Toussaintboeuf', 'FR0665059955040H4CANSJTOQ28', '71813', '22222', '2007-07-05', 'Marié(e)', 'Féminin', 0, 'c', 'dhernandez@hotmail.fr', NULL, NULL, '09 08 72 91 07', '0770465965', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(432, 5, NULL, 1, 196, 2, 'Victor', 'Dupuis', '2010-05-30', 'Vallet-sur-Guillet', 'FR237793097564JRJX07MYIH033', '69 548', '64532', '1973-10-17', 'Marié(e)', 'Féminin', 1, 'nicoledidier-bigot@univ-thies.sn', 'pbonnin@club-internet.fr', NULL, NULL, '+33 3 37 15 33 38', '+33 8 11 74 58 50', 7, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(433, 5, NULL, 1, 211, 3, 'Marguerite', 'Benoit', '2011-08-30', 'Delannoy-sur-Mer', 'FR1510681470853J5999V5R6V70', '36787', '96 979', '2015-11-22', 'Célibataire', 'Féminin', 1, 'catherinebourgeois@univ-thies.sn', 'thomas11@vallet.fr', NULL, NULL, '0514911719', '+33 (0)1 16 22 49 53', 5, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(434, 1, NULL, 1, 38, 4, 'Gérard', 'Langlois', '2000-02-17', 'Dupuy-sur-Mer', 'FR103519401250N2XG4TYR55H05', '27 512', '26 642', '1986-02-11', 'Célibataire', 'Féminin', 0, 'nathalie-lucymarechal@univ-thies.sn', 'thierry.techer@sanchez.fr', NULL, NULL, '07 48 47 38 40', '+33 1 37 20 17 38', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(435, 4, NULL, 1, 6, 3, 'Olivier', 'Dupuy', '2004-06-05', 'Lejeune', 'FR764949139146M2RZ004099299', '70 966', '27 360', '2015-11-29', 'Veuf(ve)', 'Masculin', 0, 'juliengay-morel@univ-thies.sn', 'audrey80@wanadoo.fr', NULL, NULL, '0213766104', '+33 6 15 84 57 43', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(436, 1, NULL, 1, 75, 2, 'Charles', 'Boulanger', '2019-11-01', 'Jacquet', 'FR744161332485J3ST6Q175EF60', '73 353', '33 061', '1977-12-01', 'Veuf(ve)', 'Féminin', 0, 'corinnegautier@univ-thies.sn', 'odette.bouchet@baron.fr', NULL, NULL, '0956109329', '07 33 39 42 23', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(437, 1, NULL, 1, 224, 2, 'Martin', 'Barbier', '1975-07-18', 'Dupont', 'FR02947036497580D64ZR292701', '35 790', '75774', '1990-04-09', 'Célibataire', 'Masculin', 0, 'manonmichaud@univ-thies.sn', 'ifernandez@wanadoo.fr', NULL, NULL, '+33 5 08 40 35 26', '01 78 72 33 15', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(438, 1, NULL, 1, 109, 4, 'Virginie', 'Normand', '1975-08-10', 'Giraud', 'FR2121926780744R750S005S636', '93 936', '53 052', '2015-09-23', 'Marié(e)', 'Masculin', 0, 'franckmorel@univ-thies.sn', 'thierry.michelle@tiscali.fr', NULL, NULL, '06 44 57 37 24', '0800335323', 4, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(439, 5, NULL, 1, 91, 1, 'Gilbert', 'Bonneau', '1995-12-16', 'Jourdan-sur-Blot', 'FR9478062802035436BC8I8V171', '42 817', '80 983', '2021-04-11', 'Marié(e)', 'Masculin', 1, 'christophemonnier-delannoy@univ-thies.sn', 'albert.therese@charrier.fr', NULL, NULL, '+33 (0)1 93 87 11 82', '+33 (0)1 44 79 59 79', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(440, 5, NULL, 1, 207, 1, 'Olivier', 'Charpentier', '2014-08-12', 'Michel-sur-Pereira', 'FR3378422227590VJE6AQCYU600', '68 460', '33 251', '2006-05-23', 'Veuf(ve)', 'Masculin', 1, 'alphonsemarques-pires@univ-thies.sn', 'clerc.daniel@orange.fr', NULL, NULL, '+33 8 91 36 23 48', '08 17 76 39 43', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(441, 4, NULL, 1, 35, 1, 'Victoire', 'Collin', '1992-06-07', 'Laporte-sur-Faivre', 'FR094070079442354NY430M8878', '27561', '99 513', '1993-02-06', 'Veuf(ve)', 'Masculin', 1, 'beno', 'anouk00@hamon.fr', NULL, NULL, '0160004410', '0989274828', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(442, 4, NULL, 1, 71, 4, 'Maggie', 'Meyer', '2006-12-07', 'Cordier-sur-Charpentier', 'FR884513645286G896HT1J95D62', '37003', '21 495', '1997-05-16', 'Divorcé(e)', 'Masculin', 0, 'christianepasquier@univ-thies.sn', 'kpeltier@gmail.com', NULL, NULL, '04 50 54 46 65', '09 59 21 46 14', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(443, 4, NULL, 1, 145, 4, 'Lucie', 'Louis', '2020-02-11', 'Aubry', 'FR487397023655451D0VA0RDZ87', '74045', '95 908', '2002-07-16', 'Célibataire', 'Masculin', 1, 'ren', 'joseph.leduc@guichard.com', NULL, NULL, '0142447115', '+33 5 48 92 85 24', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(444, 1, NULL, 1, 12, 3, 'Stéphanie', 'Rey', '1993-11-29', 'Weiss', 'FR189523157745O29JT57TD8D09', '59415', '02105', '1990-12-15', 'Divorcé(e)', 'Masculin', 0, 'guydasilva@univ-thies.sn', 'gdeoliveira@tele2.fr', NULL, NULL, '02 67 12 11 41', '+33 (0)4 35 65 75 06', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(445, 4, NULL, 1, 84, 1, 'Marcel', 'Maillet', '1986-12-17', 'Philippenec', 'FR56469670393279Q2YHL0J2N61', '50 195', '70 897', '1994-12-29', 'Veuf(ve)', 'Féminin', 0, 'cl', 'antoine.celine@lebrun.com', NULL, NULL, '+33 (0)2 93 16 98 50', '0434604163', 8, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(446, 1, NULL, 1, 63, 2, 'Hélène', 'Lejeune', '2016-12-08', 'Marchand', 'FR834026713208SFCA9E9A3KT26', '19564', '70 208', '2005-09-27', 'Divorcé(e)', 'Féminin', 1, 'ren', 'capucine85@wanadoo.fr', NULL, NULL, '+33 5 16 41 08 36', '0945626160', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(447, 5, NULL, 1, 28, 1, 'Pauline', 'Teixeira', '2015-10-20', 'Gonzalez', 'FR397153803170IOBX172S60074', '51826', '21278', '1997-06-22', 'Marié(e)', 'Féminin', 1, '', 'hugues24@richard.fr', NULL, NULL, '+33 7 98 25 73 33', '+33 (0)4 50 92 81 60', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(448, 5, NULL, 1, 91, 2, 'Christine', 'Loiseau', '1971-05-28', 'Begue-sur-Rossi', 'FR67627332288274O8DU8TZUS07', '76852', '14 457', '2003-09-26', 'Célibataire', 'Masculin', 1, 'capucinemeunier@univ-thies.sn', 'breton.rene@besnard.fr', NULL, NULL, '+33 7 60 57 57 42', '0128985800', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(449, 5, NULL, 1, 2, 4, 'Jacqueline', 'Couturier', '1979-04-22', 'Lejeune', 'FR557162554658OY68A3W42QX91', '10 376', '90655', '1975-12-05', 'Veuf(ve)', 'Masculin', 1, 'zacharielaporte@univ-thies.sn', 'mathieu.raymond@bouygtel.fr', NULL, NULL, '0652249823', '+33 7 82 42 55 14', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(450, 4, NULL, 1, 84, 1, 'Eugène', 'Renault', '1973-10-20', 'Gaudin', 'FR4743479306616C2XHN8LPIJ07', '79 281', '80 402', '1987-07-23', 'Divorcé(e)', 'Masculin', 0, 'margaret-lucefouquet@univ-thies.sn', 'sebastien.perret@hotmail.fr', NULL, NULL, '+33 (0)1 98 11 39 09', '02 18 86 24 10', 4, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(451, 1, NULL, 1, 158, 1, 'Alexandre', 'De Oliveira', '2011-04-02', 'GomezVille', 'FR522758255837T9L1VKX8BIZ85', '77 494', '79266', '1993-09-05', 'Divorcé(e)', 'Masculin', 0, 'guillaume-victorbonnet@univ-thies.sn', 'sophie.jean@hamel.com', NULL, NULL, '0138697258', '+33 1 65 41 13 31', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(452, 5, NULL, 1, 41, 3, 'Catherine', 'Lesage', '2007-04-17', 'Gregoire', 'FR570529893583471EIKE647516', '12 610', '74299', '2007-04-01', 'Veuf(ve)', 'Masculin', 1, 'marie-susandacosta@univ-thies.sn', 'diane.gauthier@georges.com', NULL, NULL, '+33 1 49 80 03 94', '+33 (0)8 28 02 63 04', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(453, 4, NULL, 1, 26, 3, 'Renée', 'Fontaine', '1978-01-14', 'Carre', 'FR1630988976318942H37DYLW63', '05090', '22150', '1981-10-24', 'Veuf(ve)', 'Masculin', 0, 'simonelegall@univ-thies.sn', 'ines59@boulay.com', NULL, NULL, '0250505237', '+33 (0)7 90 79 04 95', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(454, 5, NULL, 1, 140, 3, 'Andrée', 'Collet', '2013-08-04', 'Hubert', 'FR059875206907WKIXUHB4NF342', '68 758', '02 216', '1991-03-13', 'Marié(e)', 'Masculin', 1, 'eug', 'agiraud@germain.fr', NULL, NULL, '0180988024', '+33 (0)4 32 89 85 65', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(455, 1, NULL, 1, 157, 4, 'Martine', 'Seguin', '2018-03-15', 'Grenier', 'FR7907287018689V7J61X561616', '21 033', '56984', '1984-09-24', 'Célibataire', 'Masculin', 0, 'jos', 'herve.martin@wanadoo.fr', NULL, NULL, '+33 6 84 63 34 78', '01 34 83 80 05', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(456, 5, NULL, 1, 208, 2, 'Thérèse', 'Dijoux', '1995-04-09', 'Louis', 'FR4370965414862L7I0NJ8MGG71', '34142', '99 589', '2003-01-28', 'Marié(e)', 'Féminin', 0, 'henrietteperrot@univ-thies.sn', 'ibertrand@club-internet.fr', NULL, NULL, '+33 (0)5 82 73 91 63', '+33 (0)1 66 66 37 37', 3, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(457, 4, NULL, 1, 109, 3, 'Hélène', 'Renaud', '2003-04-18', 'Klein-sur-Dupuy', 'FR7857641908788QBI0W9L8Q144', '71 213', '29 516', '2000-08-27', 'Célibataire', 'Masculin', 0, 'louise-lucierobert@univ-thies.sn', 'aimee.lagarde@david.fr', NULL, NULL, '+33 (0)5 79 02 91 64', '0982260827', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(458, 1, NULL, 1, 83, 1, 'Colette', 'Bernier', '2019-03-03', 'Descamps', 'FR4922277254378QXY5CEAH5142', '35 981', '39478', '1971-01-10', 'Divorcé(e)', 'Féminin', 1, 'thibaultbarbe@univ-thies.sn', 'michel72@voila.fr', NULL, NULL, '05 28 73 14 18', '+33 1 03 57 31 85', 5, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(459, 1, NULL, 1, 63, 3, 'Nathalie', 'Guibert', '1982-04-22', 'Renault', 'FR678866040541PY53T52SQ5524', '96883', '99924', '2008-01-22', 'Célibataire', 'Masculin', 0, 'marie-emmanuellewagner@univ-thies.sn', 'nleclerc@delmas.com', NULL, NULL, '+33 8 98 72 38 95', '+33 (0)3 03 71 29 86', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(460, 1, NULL, 1, 44, 2, 'Madeleine', 'Maillot', '1996-11-14', 'Carlier', 'FR203410285000XOH19C7J0AV07', '81 822', '66240', '1995-09-11', 'Divorcé(e)', 'Masculin', 1, 'margauxcordier@univ-thies.sn', 'stephane43@laposte.net', NULL, NULL, '0779949009', '+33 (0)1 50 80 60 44', 5, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(461, 1, NULL, 1, 232, 3, 'Franck', 'Lecoq', '1990-01-09', 'Boucher', 'FR6644978566172Z4B4EB87KC93', '31878', '28 404', '1991-09-06', 'Veuf(ve)', 'Masculin', 0, 'laurentdecohen@univ-thies.sn', 'aurore.masson@laposte.net', NULL, NULL, '+33 (0)6 51 78 55 80', '0325295530', 9, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(462, 4, NULL, 1, 183, 2, 'Capucine', 'Seguin', '1972-07-19', 'PetitVille', 'FR686841264991Z9567N891XI06', '38 087', '59 407', '1992-04-15', 'Marié(e)', 'Masculin', 0, 'gr', 'frederique60@carre.net', NULL, NULL, '01 11 29 19 08', '05 34 61 17 31', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(463, 4, NULL, 1, 3, 2, 'Michelle', 'Faure', '2001-12-06', 'Chartier', 'FR444850889611P34T62WU6PP97', '95 336', '50885', '2014-03-13', 'Divorcé(e)', 'Féminin', 1, 'patrickvallee@univ-thies.sn', 'fournier.cecile@cousin.fr', NULL, NULL, '+33 (0)1 87 10 17 33', '07 35 79 47 27', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(464, 5, NULL, 1, 19, 2, 'Gilles', 'Delorme', '1973-04-13', 'Colin', 'FR3396990916439U004O2M10810', '40209', '83990', '1999-08-05', 'Veuf(ve)', 'Masculin', 1, '', 'mdumas@dupont.fr', NULL, NULL, '0141594749', '+33 (0)7 75 82 94 91', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(465, 1, NULL, 1, 85, 2, 'Lucy', 'Chauvet', '1999-10-01', 'NguyenVille', 'FR19787744207008132CZ131U32', '38142', '33 005', '2012-11-06', 'Veuf(ve)', 'Féminin', 1, 'marinepruvost@univ-thies.sn', 'anouk.lemaitre@marion.com', NULL, NULL, '+33 3 18 37 33 40', '+33 (0)4 54 17 08 29', 4, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(466, 1, NULL, 1, 19, 4, 'Alexandre', 'Martineau', '1996-11-28', 'Hernandez-sur-Mer', 'FR17676459614881IRAUP004S31', '69 024', '98335', '2017-12-06', 'Célibataire', 'Masculin', 1, 'yvessalmon@univ-thies.sn', 'evrard.isaac@tele2.fr', NULL, NULL, '0898363886', '0749697270', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(467, 5, NULL, 1, 48, 3, 'Éric', 'Lemaire', '2003-03-04', 'Lecoq', 'FR93177341884884V4R1UA5OA01', '32037', '81900', '1995-02-13', 'Célibataire', 'Masculin', 1, '', 'robin.denis@texier.fr', NULL, NULL, '0430640745', '+33 (0)5 25 69 38 98', 4, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(468, 4, NULL, 1, 145, 4, 'Auguste', 'Colin', '1990-04-12', 'Gilbertdan', 'FR409774184636O51A5EAU8P826', '72 894', '81321', '2006-12-31', 'Marié(e)', 'Masculin', 0, 'matthieu-thomasbesson@univ-thies.sn', 'ines13@gmail.com', NULL, NULL, '+33 (0)5 94 94 14 36', '+33 1 10 24 70 55', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(469, 4, NULL, 1, 6, 4, 'Benoît', 'Pereira', '1993-10-27', 'Ledoux', 'FR490841839060CKN3C9P4C5390', '65 456', '26171', '1984-04-23', 'Marié(e)', 'Masculin', 1, 'patriciaregnier@univ-thies.sn', 'pineau.benoit@hotmail.fr', NULL, NULL, '+33 (0)8 99 55 27 38', '+33 3 25 84 56 16', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(470, 5, NULL, 1, 14, 1, 'Margaret', 'Regnier', '1995-04-25', 'Lebon', 'FR466444326155HL34KI4KI7P09', '82742', '65 611', '1994-12-17', 'Veuf(ve)', 'Féminin', 1, 'benjamin-ren', 'nicole.faivre@gilles.fr', NULL, NULL, '05 62 58 76 52', '0554191570', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(471, 4, NULL, 1, 43, 2, 'Roger', 'Guibert', '1988-01-12', 'Morvanboeuf', 'FR7480073284694W7MH4AJ17A63', '75718', '85 720', '2018-03-20', 'Célibataire', 'Féminin', 0, 'sylvieperrier-lamy@univ-thies.sn', 'carpentier.ines@voisin.org', NULL, NULL, '+33 6 17 35 27 02', '0267490005', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(472, 5, NULL, 1, 231, 2, 'Jérôme', 'Becker', '2003-01-21', 'Bernier-la-Forêt', 'FR1007400620371Z179MYJM7D74', '43651', '53 525', '1981-05-27', 'Veuf(ve)', 'Féminin', 0, 'hortenseimbert@univ-thies.sn', 'anais95@voila.fr', NULL, NULL, '0569405680', '+33 5 02 87 45 11', 5, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(473, 4, NULL, 1, 162, 3, 'Martin', 'Lemonnier', '1986-06-21', 'Rocher', 'FR6215539448358449962NERE90', '13927', '75 238', '1999-08-18', 'Célibataire', 'Féminin', 1, 'charlottedaniel-etienne@univ-thies.sn', 'emmanuel.duval@wanadoo.fr', NULL, NULL, '+33 1 98 65 22 79', '0561193905', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(474, 1, NULL, 1, 64, 2, 'Bernadette', 'Vaillant', '2009-06-19', 'BrunetVille', 'FR4282613942705KR5YS9837J20', '00610', '53263', '2005-09-08', 'Célibataire', 'Féminin', 0, 'r', 'fernandez.marthe@ifrance.com', NULL, NULL, '0181856965', '+33 1 13 32 38 37', 5, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(475, 1, NULL, 1, 21, 2, 'René', 'Fleury', '1998-05-28', 'Masse-la-Forêt', 'FR82074540264761I8CKWEI9349', '93338', '34003', '1971-12-08', 'Divorcé(e)', 'Masculin', 1, 'jeannechauvet@univ-thies.sn', 'xavier.maury@sfr.fr', NULL, NULL, '09 55 94 90 77', '05 66 90 08 26', 7, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(476, 4, NULL, 1, 145, 1, 'Capucine', 'Brunel', '1972-11-30', 'GomezBourg', 'FR6146090114435F89O82IU6347', '92635', '08 597', '1985-10-15', 'Veuf(ve)', 'Féminin', 0, 'odetteberger@univ-thies.sn', 'petit.frederique@colas.org', NULL, NULL, '+33 (0)9 41 70 78 97', '+33 3 74 06 41 96', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL);
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(477, 4, NULL, 1, 30, 4, 'Thibaut', 'Begue', '1999-10-11', 'Fleury-sur-Guichard', 'FR9696647337939P4693195C819', '83 922', '07 566', '2011-12-06', 'Célibataire', 'Féminin', 1, 'vincentpasquier@univ-thies.sn', 'jpoirier@valette.fr', NULL, NULL, '+33 (0)7 48 10 24 84', '+33 2 20 71 84 05', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(478, 4, NULL, 1, 115, 3, 'Laetitia', 'Clement', '1997-01-29', 'Guillaume', 'FR076566510502KLOS1H0L88020', '09713', '73 521', '1998-12-01', 'Célibataire', 'Féminin', 1, 'sophielemaitre@univ-thies.sn', 'francois.henry@voila.fr', NULL, NULL, '06 86 94 07 06', '02 83 20 18 23', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(479, 1, NULL, 1, 214, 2, 'Madeleine', 'Leblanc', '2001-01-10', 'Maillotnec', 'FR2254278643772D3Z3YPW12306', '45 150', '81008', '1980-02-13', 'Célibataire', 'Féminin', 1, 'in', 'susanne81@noos.fr', NULL, NULL, '0360478573', '+33 (0)1 47 56 97 44', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(480, 5, NULL, 1, 59, 1, 'Bernadette', 'Simon', '1979-03-22', 'Rolland-la-Forêt', 'FR943239432518984H322I49393', '79451', '79 492', '2009-12-17', 'Marié(e)', 'Féminin', 1, 'ren', 'marguerite05@peltier.org', NULL, NULL, '+33 (0)1 89 80 62 33', '09 89 93 94 63', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(481, 5, NULL, 1, 21, 3, 'Eugène', 'Legros', '1991-05-31', 'Toussaint', 'FR3815943036394D7Z7J193G628', '57974', '46 248', '2001-07-28', 'Marié(e)', 'Féminin', 1, 'denisbouvet-wagner@univ-thies.sn', 'bertin.danielle@lefevre.fr', NULL, NULL, '08 98 14 87 33', '+33 (0)4 96 88 42 34', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(482, 5, NULL, 1, 52, 1, 'Marthe', 'Clement', '1994-08-30', 'PhilippeVille', 'FR887926411175M490MYM8D8I78', '00 230', '16 619', '1971-05-13', 'Marié(e)', 'Masculin', 0, 'beno', 'antoine.vallee@tiscali.fr', NULL, NULL, '+33 4 10 34 10 78', '01 09 76 98 25', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(483, 5, NULL, 1, 129, 1, 'Monique', 'Hernandez', '2010-11-11', 'BarthelemyVille', 'FR1608936572613W8QTRVZQM494', '07 091', '65 937', '1975-09-26', 'Divorcé(e)', 'Masculin', 1, 'adriennedias-fernandez@univ-thies.sn', 'gilbert28@blanc.com', NULL, NULL, '05 28 72 34 95', '+33 1 93 97 51 65', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(484, 4, NULL, 1, 180, 4, 'Louise', 'Nguyen', '1987-12-19', 'Tanguy-sur-Ribeiro', 'FR435885014019767C7I05OX513', '15 148', '83377', '1997-09-23', 'Veuf(ve)', 'Masculin', 0, 'carolinedijoux@univ-thies.sn', 'dacosta.pierre@costa.fr', NULL, NULL, '09 75 09 88 13', '0672887868', 4, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(485, 4, NULL, 1, 39, 1, 'Honoré', 'Guillot', '1982-03-06', 'Devauxboeuf', 'FR067253491014OV7OWV0TIZ093', '77 347', '41 388', '2009-09-15', 'Marié(e)', 'Masculin', 0, 'christophedelamendes@univ-thies.sn', 'vcharrier@millet.net', NULL, NULL, '06 42 79 66 14', '0597132821', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(486, 5, NULL, 1, 233, 3, 'Jérôme', 'Henry', '1984-07-25', 'Maurynec', 'FR882763463161ZHLTR7V023A06', '09 190', '81 769', '1978-04-27', 'Veuf(ve)', 'Féminin', 0, 'isaacmeunier-pascal@univ-thies.sn', 'delmas.jean@carre.org', NULL, NULL, '+33 9 27 61 07 50', '0175692904', 9, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(487, 1, NULL, 1, 134, 2, 'Camille', 'Joseph', '2020-07-20', 'Poirier-sur-Ferreira', 'FR727873886350K462F7O0L2X13', '90 882', '19797', '1989-06-04', 'Célibataire', 'Féminin', 1, 'christelleguillon@univ-thies.sn', 'vfoucher@wanadoo.fr', NULL, NULL, '0895193918', '+33 8 19 28 22 41', 8, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(488, 4, NULL, 1, 4, 1, 'Suzanne', 'Levy', '1986-03-16', 'Marechal', 'FR61570505563106V9F85699350', '52188', '70 790', '2011-06-28', 'Marié(e)', 'Féminin', 1, 'antoinemasse@univ-thies.sn', 'veronique92@club-internet.fr', NULL, NULL, '+33 7 81 16 30 80', '+33 7 78 17 47 45', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(489, 4, NULL, 1, 102, 1, 'Philippe', 'Chauveau', '1988-12-11', 'Begue-sur-Guichard', 'FR6198777423721L2HX5K353550', '01219', '34120', '1980-02-13', 'Divorcé(e)', 'Masculin', 0, 'margueriteetienne@univ-thies.sn', 'benjamin.vasseur@lecoq.fr', NULL, NULL, '05 50 88 33 49', '+33 (0)7 60 41 25 00', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(490, 4, NULL, 1, 162, 2, 'Gilbert', 'Laurent', '2012-07-08', 'Klein', 'FR235416816143DAHHUX8XK2261', '52401', '76 004', '2014-05-02', 'Veuf(ve)', 'Féminin', 1, 'no', 'renard.isaac@free.fr', NULL, NULL, '+33 (0)7 98 22 03 58', '0578416439', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(491, 4, NULL, 1, 52, 2, 'Luc', 'Lambert', '2016-12-14', 'Dialloboeuf', 'FR885527074211BQ675ENR02T00', '16 588', '48 469', '1979-12-11', 'Célibataire', 'Masculin', 1, 'alfredvalentin@univ-thies.sn', 'victoire61@boulanger.fr', NULL, NULL, '03 51 44 81 86', '+33 (0)8 20 56 59 76', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(492, 5, NULL, 1, 87, 4, 'Capucine', 'Poirier', '1980-10-30', 'Jourdan', 'FR1903341726657E6BXQRZP0V46', '76700', '91199', '1972-11-23', 'Marié(e)', 'Masculin', 1, 'alexandremarin@univ-thies.sn', 'elisabeth64@club-internet.fr', NULL, NULL, '0981452819', '04 35 82 55 02', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(493, 5, NULL, 1, 129, 1, 'Isabelle', 'Pons', '2001-07-01', 'Samsonboeuf', 'FR646384350517622JDT97BG803', '29586', '75 615', '1970-09-01', 'Divorcé(e)', 'Masculin', 1, 'rogerberger@univ-thies.sn', 'emmanuelle78@laposte.net', NULL, NULL, '0789070343', '+33 9 49 75 76 89', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(494, 1, NULL, 1, 19, 4, 'Dorothée', 'Turpin', '1991-01-24', 'Brunet', 'FR7019133547315NVXFY02G3907', '67 259', '11134', '1994-04-29', 'Marié(e)', 'Masculin', 0, 'juliedebousquet@univ-thies.sn', 'astrid.didier@sauvage.fr', NULL, NULL, '02 60 02 97 91', '02 88 53 97 90', 1, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(495, 1, NULL, 1, 65, 3, 'Patrick', 'Salmon', '1999-12-26', 'Charpentier-sur-Mer', 'FR48770745747906F70J5315R37', '80 672', '80 809', '1971-05-11', 'Célibataire', 'Féminin', 0, 'marcellerenard@univ-thies.sn', 'gomez.leon@pascal.fr', NULL, NULL, '0803949798', '+33 4 42 14 21 56', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(496, 5, NULL, 1, 86, 2, 'Augustin', 'Brunel', '1999-09-07', 'Hoareau', 'FR2008214023257R63TPK9B9E95', '44 224', '74 668', '1986-05-24', 'Divorcé(e)', 'Féminin', 0, 'robertjourdan@univ-thies.sn', 'julien.bonneau@deschamps.fr', NULL, NULL, '+33 (0)9 93 88 54 40', '01 47 30 05 80', 7, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(497, 4, NULL, 1, 2, 1, 'Marine', 'Lebreton', '2000-06-12', 'Voisin', 'FR111641009896QD5GFHC4XSE37', '68719', '52720', '2000-01-24', 'Célibataire', 'Masculin', 1, 'thomasbonnin@univ-thies.sn', 'robert86@lamy.com', NULL, NULL, '02 80 59 64 07', '+33 (0)6 67 93 52 12', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(498, 1, NULL, 1, 92, 2, 'Benoît', 'Camus', '1976-02-13', 'Godard', 'FR382287698665T56UGFEU50Z33', '90 265', '79 728', '2010-11-12', 'Divorcé(e)', 'Féminin', 1, 'daniellevoisin@univ-thies.sn', 'ldufour@orange.fr', NULL, NULL, '+33 (0)6 85 14 76 54', '+33 1 22 63 96 78', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(499, 5, NULL, 1, 168, 3, 'Patricia', 'Moulin', '2016-03-15', 'Lemaire-sur-Mer', 'FR34703618166700G21UY3F8664', '33201', '27024', '1976-08-01', 'Célibataire', 'Féminin', 0, 'gilbert-eug', 'zacharie.pruvost@faivre.com', NULL, NULL, '+33 3 38 99 49 92', '0134198725', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(500, 4, NULL, 1, 54, 4, 'Danielle', 'Marin', '1994-07-28', 'Bertrand', 'FR909364192960YHJB2G0E21D38', '42762', '27 223', '1996-01-04', 'Marié(e)', 'Masculin', 1, 'susanetienne@univ-thies.sn', 'simon.helene@ifrance.com', NULL, NULL, '0172961714', '+33 (0)1 31 56 85 46', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(501, 5, NULL, 1, 148, 3, 'Valentine', 'Auger', '1972-08-11', 'Costa-la-Forêt', 'FR2845162471942B49290866669', '16 276', '99 074', '1979-09-11', 'Divorcé(e)', 'Masculin', 0, 'richardribeiro@univ-thies.sn', 'adrien26@tele2.fr', NULL, NULL, '+33 1 13 24 66 90', '+33 (0)8 99 28 71 21', 2, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(502, 5, NULL, 1, 91, 1, 'Alfred', 'Boulanger', '2007-05-26', 'Marie', 'FR6823646991800Z873256P0F00', '70 194', '93 832', '1991-09-21', 'Divorcé(e)', 'Masculin', 0, 'augustedudias@univ-thies.sn', 'charlotte65@bouygtel.fr', NULL, NULL, '+33 (0)1 84 28 33 05', '+33 (0)5 77 25 77 75', 9, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(503, 4, NULL, 1, 23, 4, 'Édouard', 'Leveque', '1973-04-24', 'Petitjean-les-Bains', 'FR579462155986SY9MJ1579JI53', '38 515', '26 382', '1987-07-12', 'Célibataire', 'Masculin', 1, 'th', 'arey@wanadoo.fr', NULL, NULL, '04 67 30 60 66', '+33 9 78 97 62 09', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(504, 5, NULL, 1, 25, 2, 'Guy', 'Masse', '2002-05-17', 'Samson-les-Bains', 'FR6012568766267379ROUL75319', '14913', '22106', '1982-06-24', 'Célibataire', 'Féminin', 0, 'hortensebecker@univ-thies.sn', 'leroux.louis@turpin.org', NULL, NULL, '0760187031', '+33 (0)9 65 46 81 42', 6, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(505, 4, NULL, 1, 159, 4, 'Bernard', 'Chretien', '1992-02-01', 'Delannoynec', 'FR141910869594DEN55K958U131', '20154', '55 362', '2017-08-03', 'Veuf(ve)', 'Masculin', 0, 'ren', 'isabelle57@allain.net', NULL, NULL, '+33 7 61 79 82 84', '+33 (0)1 58 72 55 91', 4, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(506, 4, NULL, 1, 206, 1, 'Louis', 'Lopes', '1999-07-13', 'Rodrigues', 'FR870586261962G0YARYR12I956', '57 856', '84 427', '2015-07-09', 'Divorcé(e)', 'Masculin', 1, 'bernardguillaume@univ-thies.sn', 'maurice.alain@noos.fr', NULL, NULL, '+33 2 59 34 15 29', '0755520599', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(507, 4, NULL, 1, 169, 3, 'Nicolas', 'Lebon', '2021-03-11', 'DescampsVille', 'FR076381519074227D1KOCE5107', '07 552', '64714', '1985-09-03', 'Marié(e)', 'Féminin', 0, 'franckvasseur@univ-thies.sn', 'paulette.gillet@voila.fr', NULL, NULL, '05 35 36 31 49', '0254688164', 9, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(508, 5, NULL, 1, 237, 3, 'Dominique', 'Michaud', '1994-10-27', 'Chauvin', 'FR925922041347KQ487RLHMN557', '17 116', '68 972', '1970-05-16', 'Célibataire', 'Féminin', 0, 'jacquelinedebarbier@univ-thies.sn', 'mperret@hotmail.fr', NULL, NULL, '0352110571', '+33 6 29 16 59 96', 4, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(509, 1, NULL, 1, 208, 1, 'Céline', 'Lucas', '1985-06-25', 'Letellier', 'FR14320754026945RSD6HJVTL38', '62 045', '15014', '1999-05-08', 'Célibataire', 'Masculin', 1, 'margauxroyer@univ-thies.sn', 'tlemonnier@orange.fr', NULL, NULL, '08 95 53 67 39', '02 69 03 62 52', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(510, 5, NULL, 1, 77, 1, 'Antoinette', 'Riviere', '1998-08-04', 'Lebreton', 'FR183732110724C9RDFE0O0Q409', '90 422', '53614', '2013-07-21', 'Marié(e)', 'Masculin', 0, 'aim', 'benjamin.barbe@michaud.com', NULL, NULL, '0600627994', '0149428052', 7, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(511, 4, NULL, 1, 5, 4, 'Marine', 'Leclercq', '1998-05-27', 'Le GoffBourg', 'FR9445088900788R7Y52D026021', '94 277', '89 229', '2005-02-19', 'Divorcé(e)', 'Féminin', 0, 'genevi', 'michel.simone@allain.net', NULL, NULL, '0529135972', '04 08 71 02 48', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(512, 5, NULL, 1, 167, 3, 'Audrey', 'Dias', '1982-10-21', 'Bourdon-sur-Turpin', 'FR351610643937YFZ4W95J01699', '92 874', '02773', '1986-03-14', 'Veuf(ve)', 'Féminin', 0, 'davidadam-buisson@univ-thies.sn', 'xclerc@lefevre.fr', NULL, NULL, '+33 (0)6 81 65 87 53', '0364421190', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(513, 1, NULL, 1, 104, 2, 'Élisabeth', 'Dupont', '1971-04-13', 'Delorme', 'FR242736767093N798M3TWUWG99', '89818', '43520', '1985-02-10', 'Divorcé(e)', 'Masculin', 1, 'benjaminleleu@univ-thies.sn', 'pinto.thierry@live.com', NULL, NULL, '+33 (0)3 53 52 76 98', '+33 (0)1 72 17 02 02', 8, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(514, 5, NULL, 1, 128, 2, 'Bernard', 'Lemaire', '1971-09-20', 'Moreno', 'FR84207458859921216P9H85E12', '71 559', '53182', '1994-05-22', 'Célibataire', 'Féminin', 1, 'arthur-patrickroger@univ-thies.sn', 'adele26@valette.fr', NULL, NULL, '+33 1 42 71 64 81', '03 94 32 79 71', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(515, 4, NULL, 1, 64, 4, 'Pénélope', 'Evrard', '2007-07-13', 'Laurent', 'FR439635102564QL5BO9FHSG691', '94668', '93332', '1990-05-12', 'Marié(e)', 'Masculin', 0, 'th', 'madeleine.lelievre@teixeira.fr', NULL, NULL, '07 86 14 17 02', '+33 1 39 32 16 54', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(516, 4, NULL, 1, 44, 2, 'Capucine', 'Lemaire', '1984-01-09', 'Guillet', 'FR7585694072603M61STUXD0572', '83 770', '06 491', '2006-04-20', 'Divorcé(e)', 'Féminin', 0, '', 'yfabre@hardy.fr', NULL, NULL, '+33 9 32 33 76 82', '+33 8 99 22 42 24', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(517, 5, NULL, 1, 223, 1, 'Claire', 'Texier', '1977-06-16', 'Lombard', 'FR309471026197J763DWGFOO130', '41278', '56002', '1970-03-07', 'Marié(e)', 'Masculin', 0, 'sabinedulecomte@univ-thies.sn', 'pauline.lesage@salmon.fr', NULL, NULL, '+33 (0)3 25 72 40 61', '+33 (0)2 82 60 22 02', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(518, 1, NULL, 1, 60, 3, 'Margot', 'Ledoux', '1988-02-26', 'Rodriguez', 'FR3811319890243239V6467LE16', '87 417', '97110', '2021-01-25', 'Divorcé(e)', 'Masculin', 0, 'adriennelefaivre@univ-thies.sn', 'raynaud.alfred@sfr.fr', NULL, NULL, '0922294921', '03 47 79 04 81', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(519, 4, NULL, 1, 219, 1, 'Noël', 'Laine', '1973-11-02', 'Robin-sur-Letellier', 'FR4679226198803M8002Q4W4Z27', '26473', '13 743', '1986-08-30', 'Divorcé(e)', 'Féminin', 0, 'guillaumeriou@univ-thies.sn', 'ypeltier@gregoire.net', NULL, NULL, '0532364444', '+33 (0)3 46 68 27 01', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(520, 5, NULL, 1, 198, 4, 'Paulette', 'Lemoine', '1976-04-08', 'BrunBourg', 'FR8827179725828JO4PW31TZ658', '63 389', '07 613', '1972-01-08', 'Célibataire', 'Masculin', 0, 'christianelevidal@univ-thies.sn', 'guillou.maggie@club-internet.fr', NULL, NULL, '+33 2 05 87 16 57', '0980509828', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(521, 4, NULL, 1, 214, 4, 'Madeleine', 'Hamon', '1999-02-23', 'Leroy', 'FR438914399092IHUL2TQQ56878', '26 787', '85526', '2002-07-05', 'Divorcé(e)', 'Masculin', 0, 'julienbruneau@univ-thies.sn', 'alain.lesage@dijoux.fr', NULL, NULL, '+33 9 98 19 11 46', '03 44 55 43 64', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(522, 5, NULL, 1, 98, 3, 'André', 'Salmon', '1977-12-16', 'Ledouxnec', 'FR899179338377QQL46047Z1813', '80 290', '30929', '2006-10-26', 'Célibataire', 'Féminin', 1, 'gilbertpruvost@univ-thies.sn', 'martin00@morvan.com', NULL, NULL, '0116321881', '07 33 00 73 52', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(523, 4, NULL, 1, 55, 2, 'Bernadette', 'Lacombe', '2007-12-06', 'Renault', 'FR723806047599J1KN3IPC8K906', '07 211', '69 341', '1996-09-08', 'Divorcé(e)', 'Masculin', 0, 'henriettedossantos@univ-thies.sn', 'cmarin@tiscali.fr', NULL, NULL, '+33 6 23 48 72 55', '03 11 81 13 55', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(524, 4, NULL, 1, 218, 4, 'Marc', 'Aubry', '2005-06-18', 'Leleu', 'FR98561402612487QTXKT6L4907', '57771', '46 023', '2019-10-20', 'Célibataire', 'Masculin', 1, '', 'frederic04@marechal.org', NULL, NULL, '+33 (0)4 14 49 68 28', '09 36 28 33 99', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(525, 1, NULL, 1, 60, 1, 'Françoise', 'Michaud', '2016-01-20', 'Colletnec', 'FR2621712580807F78J4TDD9682', '04 328', '77 141', '1996-02-07', 'Veuf(ve)', 'Féminin', 0, 'josephgirard@univ-thies.sn', 'pereira.nathalie@laposte.net', NULL, NULL, '+33 (0)1 82 99 91 18', '0126864583', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(526, 4, NULL, 1, 108, 4, 'Augustin', 'Marie', '2012-08-16', 'Fontaine-les-Bains', 'FR16825584515342C0KW17BI970', '76 772', '32180', '2014-11-17', 'Veuf(ve)', 'Masculin', 0, 'pierregaudin@univ-thies.sn', 'opereira@laposte.net', NULL, NULL, '+33 5 28 43 91 70', '+33 (0)1 35 45 45 90', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(527, 5, NULL, 1, 32, 2, 'Alain', 'Lamy', '2003-05-20', 'Pinto-sur-Adam', 'FR29878827084100F9654357W48', '55543', '82630', '1991-10-25', 'Divorcé(e)', 'Féminin', 1, 'valentinegirard@univ-thies.sn', 'antoinette10@yahoo.fr', NULL, NULL, '0148403537', '+33 (0)9 22 95 34 71', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(528, 1, NULL, 1, 100, 2, 'Lorraine', 'Barbier', '2013-12-28', 'Louis-sur-Imbert', 'FR55441768435049GREF5M83W43', '20649', '30 260', '1987-03-02', 'Veuf(ve)', 'Masculin', 0, 'tristanbrun@univ-thies.sn', 'cecile.maury@free.fr', NULL, NULL, '08 92 86 17 89', '+33 (0)4 67 55 86 12', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(529, 5, NULL, 1, 228, 2, 'Louis', 'Boulay', '2013-04-25', 'Brun-les-Bains', 'FR8001960917959H9G0A0CCID10', '65 997', '86247', '2007-07-22', 'Célibataire', 'Masculin', 0, 'constanceleroux@univ-thies.sn', 'michel41@mathieu.fr', NULL, NULL, '+33 (0)2 14 54 96 27', '0741644181', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(530, 1, NULL, 1, 159, 3, 'Marcel', 'Verdier', '1991-12-29', 'ChartierBourg', 'FR2650994740746F13DQULZWN87', '17623', '47839', '1989-07-24', 'Divorcé(e)', 'Masculin', 1, 'th', 'stephane.delannoy@hotmail.fr', NULL, NULL, '09 11 07 09 21', '0519941629', 7, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(531, 4, NULL, 1, 103, 2, 'Thierry', 'Garcia', '1983-06-12', 'Marchal-les-Bains', 'FR04482855010463P743X75FR31', '57 881', '48 252', '1990-12-17', 'Marié(e)', 'Féminin', 0, 'dianedulemonnier@univ-thies.sn', 'flamy@laposte.net', NULL, NULL, '01 34 72 63 81', '+33 (0)5 46 22 74 75', 7, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(532, 5, NULL, 1, 97, 3, 'Paul', 'Berthelot', '2020-09-25', 'Godardnec', 'FR194676116138I9AR624906Y57', '62108', '31 649', '2009-07-31', 'Divorcé(e)', 'Féminin', 0, 'laetitiahuet-legros@univ-thies.sn', 'mathieu.dominique@menard.net', NULL, NULL, '+33 (0)6 36 32 10 57', '0140500429', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(533, 5, NULL, 1, 158, 1, 'Juliette', 'Ruiz', '1999-10-23', 'Maillot', 'FR732905915428NCZO2MO246292', '66 944', '92392', '1992-01-10', 'Veuf(ve)', 'Masculin', 1, 'lauredelaunay@univ-thies.sn', 'denise23@tele2.fr', NULL, NULL, '0891870425', '+33 (0)9 94 06 85 31', 1, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(534, 1, NULL, 1, 152, 4, 'Diane', 'Klein', '1973-08-30', 'Devauxdan', 'FR956800376532A1HD61HT6X738', '02 033', '98 847', '2016-03-28', 'Célibataire', 'Féminin', 0, 'paulroyer@univ-thies.sn', 'claude14@ifrance.com', NULL, NULL, '+33 5 42 76 00 07', '+33 2 53 35 29 11', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(535, 4, NULL, 1, 136, 4, 'Thomas', 'Bertin', '2005-05-07', 'Masson', 'FR241226190605P2G59BZF03598', '81 625', '58755', '2006-09-29', 'Célibataire', 'Féminin', 1, 'martinmoulin-arnaud@univ-thies.sn', 'delmas.william@leger.fr', NULL, NULL, '+33 1 25 84 41 18', '+33 1 89 01 30 99', 2, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(536, 1, NULL, 1, 102, 2, 'Stéphane', 'Toussaint', '1983-04-13', 'Moulin', 'FR69239053068316Z6K07Z6C599', '67703', '39 581', '1994-01-15', 'Marié(e)', 'Féminin', 1, 's', 'andre.hoareau@live.com', NULL, NULL, '02 17 57 02 19', '0995648834', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(537, 5, NULL, 1, 164, 4, 'Laure', 'Lopes', '1986-11-17', 'Valentin', 'FR9003909510703OM1K18GHJ560', '18013', '10901', '2016-10-18', 'Célibataire', 'Féminin', 0, 'zo', 'xschmitt@normand.com', NULL, NULL, '02 30 98 85 35', '+33 7 85 79 80 64', 5, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(538, 1, NULL, 1, 101, 4, 'David', 'Buisson', '1975-08-24', 'Goncalves', 'FR047402932951T2N6K7ZF1O007', '57 221', '71 750', '1993-07-05', 'Marié(e)', 'Masculin', 0, 'andr', 'mrousset@hotmail.fr', NULL, NULL, '+33 (0)3 91 39 68 39', '+33 (0)9 93 85 52 52', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(539, 1, NULL, 1, 224, 4, 'Marie', 'Legros', '1999-08-29', 'GuilletVille', 'FR188710719820P37T9D4T5XK52', '92822', '50 148', '1978-04-22', 'Marié(e)', 'Féminin', 0, 'vincentdelaraymond@univ-thies.sn', 'colas.auguste@rey.org', NULL, NULL, '08 07 68 68 48', '0808303245', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(540, 4, NULL, 1, 194, 3, 'Joséphine', 'Guillot', '2016-08-13', 'Guyonnec', 'FR635517571369ITW6DS78AJ939', '81398', '94 050', '2003-10-11', 'Célibataire', 'Masculin', 0, 'thierrydelaunay@univ-thies.sn', 'corinne33@free.fr', NULL, NULL, '+33 (0)1 38 27 77 76', '+33 (0)7 80 17 37 26', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(541, 1, NULL, 1, 15, 1, 'Pénélope', 'Remy', '1975-01-17', 'Leclerc-sur-Lemoine', 'FR324827169843M0O5F67J5KV82', '47558', '53095', '2004-08-09', 'Divorcé(e)', 'Masculin', 0, 'sylviegarcia@univ-thies.sn', 'dumont.zoe@orange.fr', NULL, NULL, '+33 9 61 15 61 67', '+33 1 17 95 34 25', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(542, 5, NULL, 1, 181, 3, 'Gilbert', 'Marchal', '2003-08-11', 'PhilippeVille', 'FR681849615773UR4QJ1803EX45', '35382', '55 691', '1974-12-25', 'Veuf(ve)', 'Féminin', 0, 'martheblanchet@univ-thies.sn', 'guillou.valentine@live.com', NULL, NULL, '+33 (0)4 92 49 74 77', '01 45 87 00 74', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(543, 4, NULL, 1, 83, 3, 'Juliette', 'Blanchet', '1971-11-14', 'Alexandre', 'FR798340570092YM26M46HXG503', '72289', '96 661', '2014-12-05', 'Divorcé(e)', 'Masculin', 0, 'jean-arthurlecoq@univ-thies.sn', 'margot08@lagarde.fr', NULL, NULL, '0147087468', '08 97 83 74 79', 2, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(544, 4, NULL, 1, 8, 3, 'Jérôme', 'Hebert', '1982-08-23', 'Perez-les-Bains', 'FR9852624724638ROI80DFMRX86', '35 133', '48 272', '1974-05-08', 'Marié(e)', 'Masculin', 1, 'alexandriesamson-diallo@univ-thies.sn', 'wpaul@lambert.com', NULL, NULL, '0917639208', '07 86 47 26 67', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(545, 4, NULL, 1, 179, 3, 'Marie', 'Dumont', '2018-03-23', 'Bertrand', 'FR937839780701416ZL7G6O2W92', '64347', '35 078', '1974-10-28', 'Marié(e)', 'Masculin', 0, 'aim', 'dlesage@wanadoo.fr', NULL, NULL, '01 23 18 78 17', '+33 9 64 12 93 49', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(546, 4, NULL, 1, 54, 4, 'Adrienne', 'Bernard', '2003-01-29', 'Bouchet', 'FR7530516371952Q253F01NA291', '75 843', '74 172', '2006-05-10', 'Veuf(ve)', 'Féminin', 1, '', 'nicole50@foucher.com', NULL, NULL, '+33 (0)6 56 14 49 38', '0373141471', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(547, 4, NULL, 1, 189, 3, 'Pauline', 'Diaz', '2017-09-15', 'Gomes-sur-Besson', 'FR4025362496090CUG2582E0Z05', '67196', '90 621', '1972-01-27', 'Marié(e)', 'Masculin', 0, 'agathelerenaud@univ-thies.sn', 'olivie92@tele2.fr', NULL, NULL, '+33 1 03 14 62 74', '03 76 12 25 81', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(548, 4, NULL, 1, 80, 2, 'Patrick', 'Pichon', '1985-04-15', 'Hebert', 'FR3143997719170798CC82X4271', '14749', '80 018', '2019-01-10', 'Célibataire', 'Féminin', 1, '', 'renaud.margot@gauthier.com', NULL, NULL, '0612594385', '+33 2 84 58 58 99', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(549, 4, NULL, 1, 193, 2, 'René', 'Leconte', '2011-03-04', 'BonninVille', 'FR879171287776D0W151BH25R46', '09 918', '47243', '1972-05-12', 'Célibataire', 'Masculin', 1, 'rogermace@univ-thies.sn', 'jeanne.lacroix@yahoo.fr', NULL, NULL, '03 34 69 81 86', '08 95 70 48 19', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(550, 5, NULL, 1, 180, 4, 'Constance', 'Fouquet', '1992-11-30', 'Labbe-les-Bains', 'FR36901391448526QHF19RCT402', '14 930', '36 656', '2000-10-07', 'Marié(e)', 'Masculin', 1, 'st', 'pons.thibault@dubois.com', NULL, NULL, '0309734809', '01 42 44 08 88', 7, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(551, 5, NULL, 1, 88, 4, 'Brigitte', 'Le Gall', '2009-01-11', 'Torres', 'FR4430048669364X4158TV43241', '31266', '97568', '2012-10-25', 'Célibataire', 'Féminin', 0, 'marc-josephdeschamps@univ-thies.sn', 'uregnier@wanadoo.fr', NULL, NULL, '+33 4 60 39 07 26', '0240323538', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(552, 1, NULL, 1, 130, 3, 'Martine', 'Thomas', '1985-03-07', 'MichaudVille', 'FR362096345595Z28S06VAVMI94', '26 633', '25696', '2010-08-30', 'Divorcé(e)', 'Féminin', 1, 'v', 'mendes.auguste@benoit.com', NULL, NULL, '+33 (0)1 63 88 62 78', '+33 (0)1 67 01 56 96', 9, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(553, 5, NULL, 1, 14, 4, 'Alain', 'Gomes', '2002-09-27', 'FaureVille', 'FR7240179471256PTK7823QDZ69', '84737', '50 935', '2008-02-08', 'Célibataire', 'Masculin', 1, 'henrietteleleblanc@univ-thies.sn', 'daniel18@laporte.com', NULL, NULL, '0150427549', '+33 1 46 74 65 61', 5, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(554, 1, NULL, 1, 182, 1, 'Susanne', 'Sauvage', '1975-10-01', 'Maillet-sur-Lagarde', 'FR481689675215X4MUY646I1K55', '44 029', '07629', '1998-12-17', 'Célibataire', 'Féminin', 1, 'zacharielemaitre@univ-thies.sn', 'alix.blanchet@dbmail.com', NULL, NULL, '+33 (0)9 07 67 87 20', '+33 (0)1 00 13 58 38', 4, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(555, 5, NULL, 1, 100, 4, 'Catherine', 'Diaz', '1995-01-26', 'TeixeiraVille', 'FR6562781778099E7V206JJ1294', '16956', '15212', '2012-12-13', 'Marié(e)', 'Masculin', 0, 'alixchauvet-bernier@univ-thies.sn', 'paul98@yahoo.fr', NULL, NULL, '+33 (0)7 93 10 86 43', '+33 1 94 55 93 33', 4, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(556, 5, NULL, 1, 14, 2, 'Robert', 'Lebon', '2010-08-17', 'Perrier', 'FR52289754772029S0I3JN7SD38', '02423', '32904', '2002-11-28', 'Veuf(ve)', 'Masculin', 1, 'thierryhubert-roussel@univ-thies.sn', 'thibault.gimenez@live.com', NULL, NULL, '+33 (0)7 87 31 21 36', '+33 (0)2 44 13 32 68', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(557, 4, NULL, 1, 178, 1, 'Philippine', 'Lambert', '1995-04-24', 'Gros', 'FR338419844231A67FKA9ABKR63', '17 325', '59668', '1987-07-02', 'Célibataire', 'Féminin', 0, 'alexandriamorvan-lefebvre@univ-thies.sn', 'margaret90@weber.fr', NULL, NULL, '05 84 03 26 12', '0337180006', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(558, 1, NULL, 1, 116, 2, 'Arthur', 'Adam', '1991-01-07', 'David', 'FR603052284021U3812CV26M310', '05097', '40 097', '1989-01-27', 'Marié(e)', 'Masculin', 0, 'gabrieldelabenoit@univ-thies.sn', 'jacques32@boucher.fr', NULL, NULL, '+33 9 81 39 38 86', '+33 6 06 11 89 87', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(559, 5, NULL, 1, 130, 4, 'Maurice', 'Clerc', '1985-10-27', 'Pereira', 'FR6431706683115469G08920497', '00 418', '71 979', '1990-03-14', 'Divorcé(e)', 'Masculin', 0, 'aim', 'normand.clemence@yahoo.fr', NULL, NULL, '0172041358', '+33 (0)7 45 38 15 87', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(560, 5, NULL, 1, 20, 2, 'Antoinette', 'Chartier', '2005-02-11', 'Perrotnec', 'FR986252476219OP5OBF5B4A130', '67 558', '90 067', '1973-04-25', 'Marié(e)', 'Masculin', 0, 'philippine-hortensepichon@univ-thies.sn', 'andre55@tiscali.fr', NULL, NULL, '02 73 65 71 19', '+33 (0)4 41 29 70 15', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(561, 4, NULL, 1, 106, 2, 'Thomas', 'Charles', '1986-07-01', 'Morindan', 'FR56163612364411MEX366NVF88', '26 738', '87 392', '2014-02-28', 'Divorcé(e)', 'Féminin', 0, 'st', 'elodie40@orange.fr', NULL, NULL, '+33 2 63 95 76 15', '01 06 95 27 88', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(562, 1, NULL, 1, 69, 2, 'Dominique', 'Schmitt', '2011-11-09', 'Paris-sur-Aubert', 'FR476362243936R6ZREJAMY8866', '06 844', '94641', '1993-06-15', 'Divorcé(e)', 'Féminin', 1, 'j', 'claude59@yahoo.fr', NULL, NULL, '0678837166', '0677349683', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(563, 4, NULL, 1, 134, 4, 'Olivie', 'Fontaine', '1993-01-13', 'Fontainedan', 'FR725459107386ZW3KM67H4CY56', '38101', '80 208', '1993-11-03', 'Divorcé(e)', 'Masculin', 1, 'aur', 'thierry.hamon@poulain.net', NULL, NULL, '+33 (0)8 27 05 40 99', '+33 8 92 02 60 26', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(564, 4, NULL, 1, 135, 2, 'Charles', 'Morin', '1976-10-14', 'Henry-la-Forêt', 'FR798851236048TWMTCQ2QNT051', '67370', '94 013', '1990-01-28', 'Veuf(ve)', 'Féminin', 1, 'alexandrelopez@univ-thies.sn', 'mahe.michelle@normand.com', NULL, NULL, '+33 (0)4 29 45 06 50', '01 23 00 13 76', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(565, 5, NULL, 1, 233, 4, 'Luce', 'Benoit', '1982-07-28', 'Vidal', 'FR757148566846RU460DG766T14', '32889', '49 139', '1998-06-20', 'Veuf(ve)', 'Masculin', 0, 'charlesboutin@univ-thies.sn', 'chantal45@live.com', NULL, NULL, '07 40 75 98 90', '0180568408', 6, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(566, 4, NULL, 1, 123, 3, 'Roger', 'Vincent', '1997-04-30', 'Moulin-la-Forêt', 'FR026897025375068H4H01U1689', '77244', '33 724', '2013-10-27', 'Marié(e)', 'Féminin', 1, 'henribourgeois@univ-thies.sn', 'pauline95@dbmail.com', NULL, NULL, '+33 9 45 61 40 46', '+33 8 99 00 24 64', 4, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(567, 4, NULL, 1, 89, 1, 'Édouard', 'Pichon', '2000-02-17', 'Munoz', 'FR56960962641006B43JI8N2P53', '40612', '49230', '1994-04-07', 'Divorcé(e)', 'Masculin', 1, 'alexandriadelacosta@univ-thies.sn', 'ugallet@valette.com', NULL, NULL, '+33 9 57 18 17 11', '+33 (0)4 81 95 76 34', 8, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(568, 4, NULL, 1, 27, 3, 'Stéphane', 'Etienne', '2002-06-11', 'BonninVille', 'FR326813627462SE4F9IGTH3I54', '28543', '26 490', '1972-02-20', 'Célibataire', 'Masculin', 0, 'adrien-', 'guyot.yves@tiscali.fr', NULL, NULL, '+33 5 09 43 01 19', '0590577837', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(569, 5, NULL, 1, 190, 2, 'Patrick', 'Brunel', '2010-02-07', 'Leroy', 'FR64080517718624KXI4F5X5A21', '85 752', '10099', '1994-05-16', 'Marié(e)', 'Féminin', 1, 'margaretclement@univ-thies.sn', 'frederique27@sfr.fr', NULL, NULL, '0983624035', '+33 2 50 99 67 18', 3, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(570, 5, NULL, 1, 31, 4, 'Christophe', 'Guichard', '1999-11-21', 'Girard', 'FR452888488332318826Y1S2191', '65 643', '48 499', '2010-05-25', 'Veuf(ve)', 'Féminin', 0, 'dominiqueruiz@univ-thies.sn', 'gosselin.claude@voisin.fr', NULL, NULL, '08 92 04 05 64', '0502725905', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(571, 1, NULL, 1, 147, 1, 'Henri', 'Delaunay', '2008-02-27', 'Guillaume', 'FR713658375855562Y4V9YJ0923', '05587', '16423', '2010-11-22', 'Veuf(ve)', 'Masculin', 1, 'gilbertdegay@univ-thies.sn', 'franck77@dbmail.com', NULL, NULL, '0819347566', '06 88 83 21 60', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(572, 4, NULL, 1, 69, 2, 'Alain', 'Gilles', '2013-03-22', 'Berger-les-Bains', 'FR15266594677149E6PP4I9N601', '54 511', '05270', '1983-07-16', 'Divorcé(e)', 'Masculin', 0, 'aim', 'louise73@noos.fr', NULL, NULL, '+33 9 35 65 41 70', '+33 7 81 71 43 78', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(573, 4, NULL, 1, 82, 3, 'Françoise', 'Hardy', '2008-02-22', 'Raynaud', 'FR706681535620L0HS8310IK866', '83321', '78099', '1972-01-05', 'Célibataire', 'Masculin', 1, 'andr', 'jacques.alfred@mercier.com', NULL, NULL, '+33 (0)5 05 53 34 96', '01 66 91 44 50', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(574, 5, NULL, 1, 190, 4, 'Chantal', 'Valette', '1986-02-14', 'LecoqVille', 'FR7310129827616C20D3848YE20', '37469', '63004', '1986-08-07', 'Marié(e)', 'Masculin', 0, 'yvesleduc@univ-thies.sn', 'madeleine.cordier@free.fr', NULL, NULL, '08 14 85 13 07', '+33 (0)9 36 58 21 07', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(575, 1, NULL, 1, 5, 1, 'Frédérique', 'Rey', '1983-04-19', 'Marechal', 'FR4538475510534C8PDXNKXNE69', '07 116', '70319', '1998-03-13', 'Célibataire', 'Masculin', 1, 'zo', 'dmaillet@chretien.com', NULL, NULL, '01 06 52 00 87', '01 16 44 13 31', 7, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(576, 4, NULL, 1, 184, 2, 'Pénélope', 'Boucher', '2005-01-16', 'Guerin', 'FR236037402779XKGZ5Q89P2V83', '64 047', '07684', '1992-10-17', 'Divorcé(e)', 'Féminin', 1, 'catherinebrunet@univ-thies.sn', 'cjean@peltier.net', NULL, NULL, '0501835234', '+33 9 65 91 87 55', 6, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(577, 4, NULL, 1, 111, 3, 'Étienne', 'Petit', '2004-11-10', 'Gauthiernec', 'FR356017827942YH2OYYACS3D91', '62532', '25 007', '2019-06-02', 'Marié(e)', 'Féminin', 0, 'oc', 'ramos.stephanie@roussel.com', NULL, NULL, '+33 (0)6 39 57 32 17', '+33 (0)1 52 73 49 76', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(578, 1, NULL, 1, 147, 2, 'Léon', 'Ferreira', '1980-06-15', 'Payetdan', 'FR753680118591M4329937KL705', '37 481', '98 156', '1982-05-30', 'Célibataire', 'Féminin', 1, 'agathe-adriennefernandez@univ-thies.sn', 'agonzalez@gonzalez.net', NULL, NULL, '+33 1 30 00 17 87', '+33 1 24 85 03 30', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(579, 4, NULL, 1, 101, 1, 'Colette', 'Sanchez', '1999-08-19', 'Delattre', 'FR210058980048S2WOQQ5SN1085', '87648', '28 048', '1983-07-04', 'Divorcé(e)', 'Masculin', 0, 'honor', 'bgros@carlier.net', NULL, NULL, '+33 (0)2 37 26 47 60', '03 31 22 43 24', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(580, 4, NULL, 1, 22, 3, 'Xavier', 'Gillet', '2021-01-08', 'Joseph-sur-Marchal', 'FR776254411573O1DI89873T554', '01557', '78 737', '1991-08-20', 'Célibataire', 'Féminin', 1, 'lucroche@univ-thies.sn', 'morvan.manon@gautier.fr', NULL, NULL, '04 71 13 06 04', '0977473800', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(581, 4, NULL, 1, 162, 4, 'Brigitte', 'Bernier', '1984-07-01', 'Begue', 'FR3098898387654RUQ2C8400B07', '84269', '27 134', '2008-01-06', 'Marié(e)', 'Masculin', 1, 'philippine-susannemoreno@univ-thies.sn', 'guy.gros@club-internet.fr', NULL, NULL, '0601278125', '0911896967', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(582, 1, NULL, 1, 203, 2, 'Thibaut', 'Bertrand', '2010-11-24', 'Petit', 'FR435005808370AG476569PE165', '17 389', '21656', '1970-10-27', 'Veuf(ve)', 'Masculin', 0, 'christinegonzalez@univ-thies.sn', 'andree83@colin.fr', NULL, NULL, '+33 (0)8 09 90 99 50', '+33 8 92 80 59 60', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(583, 1, NULL, 1, 158, 2, 'Christelle', 'Leblanc', '2017-11-20', 'Guichard', 'FR9895596842288B85YQ5B9I263', '27 050', '18 060', '1992-03-18', 'Célibataire', 'Masculin', 1, 'ad', 'oguerin@boulanger.com', NULL, NULL, '09 51 30 87 46', '0965683062', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(584, 1, NULL, 1, 39, 2, 'Madeleine', 'Leleu', '1976-11-15', 'Maillard', 'FR4432953056750JAJQ83BG7F77', '20 247', '00 440', '1975-04-20', 'Veuf(ve)', 'Féminin', 0, 'olivierboucher@univ-thies.sn', 'marcel.jacquot@tele2.fr', NULL, NULL, '+33 (0)6 13 66 50 58', '+33 7 86 35 73 61', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(585, 1, NULL, 1, 134, 4, 'Anaïs', 'Camus', '2016-08-18', 'SauvageVille', 'FR100532879252BYD13AHO72292', '97595', '00399', '1994-05-14', 'Veuf(ve)', 'Féminin', 0, 'cl', 'bazin.frederique@lefort.fr', NULL, NULL, '01 27 93 99 26', '02 46 23 82 91', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(586, 5, NULL, 1, 98, 2, 'Émile', 'Becker', '1977-09-06', 'Pons-sur-Perret', 'FR0700699857509VS36UP9ZHW24', '11 661', '00 746', '2018-04-11', 'Divorcé(e)', 'Masculin', 1, 'philippinevalentin@univ-thies.sn', 'cjoly@orange.fr', NULL, NULL, '+33 8 27 51 92 95', '09 43 32 22 26', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(587, 5, NULL, 1, 109, 3, 'Benoît', 'Diaz', '1971-06-01', 'Bernardnec', 'FR341209599464OPT23ZM759259', '93104', '16890', '1993-12-01', 'Veuf(ve)', 'Féminin', 0, 'r', 'lambert.arthur@potier.fr', NULL, NULL, '0780755261', '+33 (0)1 19 63 59 73', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(588, 5, NULL, 1, 24, 2, 'Clémence', 'Dubois', '1995-06-16', 'Leclercq-sur-Loiseau', 'FR379109238654323YJ51G6M300', '09 668', '54661', '2006-04-01', 'Veuf(ve)', 'Masculin', 0, 'chantalmuller@univ-thies.sn', 'schneider.thibaut@tele2.fr', NULL, NULL, '0947985658', '+33 4 63 28 09 14', 8, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(589, 1, NULL, 1, 232, 1, 'Roger', 'Fabre', '2019-03-23', 'Bourgeoisnec', 'FR870034072043A987U8EV5WB97', '05 990', '85136', '1988-06-30', 'Célibataire', 'Féminin', 1, 'marcelarnaud@univ-thies.sn', 'carpentier.capucine@hernandez.fr', NULL, NULL, '0504107510', '+33 (0)5 43 95 59 93', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(590, 5, NULL, 1, 182, 1, 'Constance', 'Antoine', '1980-10-28', 'Barthelemy', 'FR487766146909L92P4JPR64A77', '76 014', '09 576', '2010-03-10', 'Marié(e)', 'Féminin', 1, 'isaacjourdan@univ-thies.sn', 'ldavid@briand.net', NULL, NULL, '+33 9 28 57 39 30', '0453892613', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(591, 1, NULL, 1, 111, 3, 'Adrien', 'Fontaine', '1973-04-24', 'Lecomte-sur-Lenoir', 'FR036153539426LJ6O54W70Y910', '60206', '78 071', '1991-01-26', 'Célibataire', 'Masculin', 0, 'alainlecomte@univ-thies.sn', 'claire32@guyon.com', NULL, NULL, '09 15 90 01 07', '+33 1 13 64 68 11', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(592, 5, NULL, 1, 68, 2, 'Dominique', 'Ramos', '1998-05-01', 'Paul', 'FR70070277003290KYW8WWVWT57', '62336', '33 558', '1985-02-14', 'Veuf(ve)', 'Féminin', 0, 'g', 'jleclerc@free.fr', NULL, NULL, '0243341512', '+33 8 95 26 55 23', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(593, 5, NULL, 1, 74, 4, 'Pénélope', 'Barbier', '1977-11-20', 'Roy-sur-Dupuis', 'FR3862272262070N2SKT7N1K786', '97924', '82467', '1983-09-08', 'Marié(e)', 'Masculin', 0, 'yvesgillet@univ-thies.sn', 'laine.veronique@lemoine.org', NULL, NULL, '09 08 45 00 61', '+33 (0)1 82 98 95 18', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(594, 4, NULL, 1, 177, 2, 'Victor', 'Launay', '2015-10-09', 'Benard', 'FR35980155963684NK725HY6W93', '28 176', '83 413', '1995-06-24', 'Célibataire', 'Féminin', 0, 'doroth', 'roy.susan@dbmail.com', NULL, NULL, '+33 3 05 54 60 85', '+33 (0)4 14 25 68 05', 1, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(595, 5, NULL, 1, 137, 2, 'Jacques', 'Duhamel', '2010-07-14', 'Jacques', 'FR23410141646651038ESRE0107', '20 138', '60 552', '2012-07-14', 'Veuf(ve)', 'Féminin', 0, 'jacques-jeanpicard@univ-thies.sn', 'celina.boulanger@free.fr', NULL, NULL, '+33 (0)8 05 88 05 42', '09 12 06 27 73', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(596, 5, NULL, 1, 73, 3, 'Xavier', 'Chevalier', '1992-01-30', 'Pereznec', 'FR206488413913A3766H1JPYV37', '36776', '64421', '2009-06-25', 'Veuf(ve)', 'Féminin', 0, 'dominiqueroger@univ-thies.sn', 'graymond@orange.fr', NULL, NULL, '02 76 29 59 17', '0496116960', 2, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(597, 1, NULL, 1, 221, 4, 'Suzanne', 'Loiseau', '2018-06-10', 'Godard', 'FR039852568472A4OA54N972200', '06 998', '16 427', '1973-06-04', 'Marié(e)', 'Masculin', 0, 'margaretdelorme@univ-thies.sn', 'dmichel@tiscali.fr', NULL, NULL, '+33 (0)6 18 38 82 70', '+33 6 56 69 91 17', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(598, 1, NULL, 1, 44, 3, 'Louise', 'Le Gall', '1991-12-19', 'Hardy-les-Bains', 'FR923881157882BS56R849PQD17', '85140', '34 876', '2019-06-22', 'Divorcé(e)', 'Féminin', 1, 'chantaldumasse@univ-thies.sn', 'andre66@maurice.com', NULL, NULL, '01 67 46 00 12', '0584866385', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(599, 4, NULL, 1, 110, 2, 'Capucine', 'Wagner', '2009-08-22', 'Costa-sur-Mer', 'FR934581277528S3YG2I2U99D08', '98 056', '78622', '1983-09-26', 'Veuf(ve)', 'Féminin', 1, 'j', 'germain.vincent@gmail.com', NULL, NULL, '0286601365', '+33 (0)2 45 48 61 62', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(600, 5, NULL, 1, 84, 1, 'Aimée', 'Duhamel', '1975-02-10', 'Gay', 'FR546866045476EXQ3Y1W44X819', '65216', '46518', '1976-11-15', 'Marié(e)', 'Féminin', 0, 'simonemoulin@univ-thies.sn', 'olivie21@laposte.net', NULL, NULL, '+33 4 35 42 74 18', '0151622650', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(601, 4, NULL, 1, 159, 4, 'Aimée', 'Bourgeois', '1987-10-29', 'Bruneau-les-Bains', 'FR373920500692046ZLM2AT6965', '07 083', '55104', '1977-03-08', 'Célibataire', 'Féminin', 1, 'nathdedeoliveira@univ-thies.sn', 'lorraine10@orange.fr', NULL, NULL, '09 70 85 55 24', '01 82 84 71 91', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(602, 4, NULL, 1, 72, 2, 'Zoé', 'Ruiz', '1973-05-17', 'Auger', 'FR756717857772F481Y0ZINK711', '13 167', '36 145', '1996-11-29', 'Célibataire', 'Féminin', 0, 'thomasdenis-louis@univ-thies.sn', 'ehoareau@sfr.fr', NULL, NULL, '+33 4 09 95 37 52', '+33 (0)9 53 76 35 01', 1, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(603, 1, NULL, 1, 68, 4, 'Zacharie', 'Mace', '1990-02-25', 'Lecomtedan', 'FR194944449981M9UYOQYZ8AF29', '21 728', '48 123', '1982-02-06', 'Célibataire', 'Masculin', 0, 'charlesvalentin@univ-thies.sn', 'michel76@noos.fr', NULL, NULL, '+33 (0)5 72 04 51 86', '0617498725', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(604, 5, NULL, 1, 89, 3, 'Stéphanie', 'Dumas', '1971-09-29', 'Da Costa-sur-Mer', 'FR2337358904148748P21U0LW67', '29039', '98 118', '2005-02-03', 'Veuf(ve)', 'Féminin', 1, 'charlesjacob@univ-thies.sn', 'david48@lacroix.net', NULL, NULL, '0407418308', '01 07 10 17 91', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(605, 1, NULL, 1, 32, 4, 'Joseph', 'Guyot', '2004-09-05', 'Denis', 'FR5667150377780242M62THCJ85', '52 007', '09771', '1975-09-10', 'Veuf(ve)', 'Masculin', 0, 'odettereynaud@univ-thies.sn', 'francois78@noos.fr', NULL, NULL, '+33 (0)1 92 78 68 96', '02 32 21 61 51', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(606, 4, NULL, 1, 234, 2, 'Étienne', 'Dupuy', '1988-11-14', 'Georges', 'FR41580765099574C351771SZ01', '26 955', '13438', '2012-09-11', 'Veuf(ve)', 'Masculin', 0, 'margotlaine-hamon@univ-thies.sn', 'adam.emile@orange.fr', NULL, NULL, '01 43 45 49 40', '+33 8 98 34 82 11', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(607, 1, NULL, 1, 6, 4, 'Lucy', 'Pages', '1982-04-14', 'Lambert-sur-Salmon', 'FR9427972958986ZSOZHY5XGB82', '77532', '21 009', '1979-09-12', 'Divorcé(e)', 'Féminin', 1, 'augustinaubry@univ-thies.sn', 'astrid.blanchard@blanchard.net', NULL, NULL, '09 89 70 16 71', '01 74 71 35 57', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(608, 4, NULL, 1, 160, 4, 'Christiane', 'Hebert', '2006-04-14', 'Gauthier', 'FR7592140393646GHEY7WH04T65', '28483', '25 771', '1983-05-03', 'Veuf(ve)', 'Masculin', 0, 'c', 'bonnin.louis@noel.com', NULL, NULL, '+33 7 60 02 68 10', '01 13 92 48 66', 9, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(609, 4, NULL, 1, 199, 2, 'Christelle', 'Gonzalez', '1979-05-16', 'Clerc-sur-Guibert', 'FR386889754384SLN0917G1GV98', '72852', '61 216', '1974-09-20', 'Divorcé(e)', 'Féminin', 1, 'gillesbenard@univ-thies.sn', 'nathalie56@club-internet.fr', NULL, NULL, '0225137437', '08 25 99 05 84', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(610, 5, NULL, 1, 202, 3, 'Franck', 'Olivier', '2018-12-12', 'Fontaine-sur-Mer', 'FR268247576520MTCP88O870S75', '44067', '40 645', '2014-01-03', 'Veuf(ve)', 'Masculin', 0, 'xavierlemonnier@univ-thies.sn', 'helene64@gmail.com', NULL, NULL, '0145795884', '07 76 52 12 74', 7, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(611, 4, NULL, 1, 114, 1, 'Suzanne', 'Delannoy', '1998-03-19', 'Cordier', 'FR8474086449983QQ2TW9K5AP24', '20550', '93424', '1972-10-05', 'Divorcé(e)', 'Féminin', 0, 'luceferrand@univ-thies.sn', 'epetit@free.fr', NULL, NULL, '+33 (0)9 07 11 36 56', '01 23 92 63 03', 1, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(612, 1, NULL, 1, 66, 1, 'Sébastien', 'Nguyen', '1972-03-20', 'Gillesboeuf', 'FR44287226892329T831319BV93', '99148', '47 485', '1973-06-29', 'Célibataire', 'Masculin', 0, 'sabinedupuis@univ-thies.sn', 'rdesousa@yahoo.fr', NULL, NULL, '+33 (0)6 42 95 73 15', '0112663778', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(613, 1, NULL, 1, 97, 1, 'Maurice', 'Besson', '2015-12-23', 'Lemonnier', 'FR057281898795HK3OZP42FOW68', '00 500', '30 960', '1993-12-14', 'Divorcé(e)', 'Féminin', 1, 'nathaliedelabuisson@univ-thies.sn', 'gregoire03@pages.com', NULL, NULL, '06 24 50 87 23', '+33 5 53 11 16 35', 4, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(614, 5, NULL, 1, 93, 2, 'Marc', 'Pruvost', '1974-07-12', 'Prevost-les-Bains', 'FR80679409234344NX02828ED77', '63 029', '41785', '2019-05-08', 'Célibataire', 'Masculin', 1, 'fr', 'lucas.thibaut@robin.fr', NULL, NULL, '+33 9 80 51 88 17', '0259594808', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(615, 4, NULL, 1, 125, 1, 'Isabelle', 'Chevalier', '1997-08-15', 'Germain-sur-Lemonnier', 'FR563024344905G273SPO7TAZ30', '98 607', '47897', '1982-01-24', 'Divorcé(e)', 'Féminin', 1, 'fran', 'marthe.chauvet@bouygtel.fr', NULL, NULL, '+33 (0)5 33 40 16 39', '09 16 72 36 07', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(616, 1, NULL, 1, 112, 2, 'Mathilde', 'Boulay', '1992-11-01', 'Fischer-la-Forêt', 'FR143621218686733JZ09I2R147', '34442', '83095', '2013-06-21', 'Veuf(ve)', 'Féminin', 1, 'thomasboulanger@univ-thies.sn', 'nboulay@renaud.org', NULL, NULL, '+33 (0)9 34 67 92 90', '01 63 21 49 03', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(617, 4, NULL, 1, 105, 3, 'Frédéric', 'Mace', '1986-11-19', 'Dias', 'FR6368812706011Q4E0BG1X5342', '46 091', '72542', '1993-05-26', 'Marié(e)', 'Masculin', 1, 'am', 'thierry.gimenez@ifrance.com', NULL, NULL, '+33 (0)8 02 66 64 49', '+33 (0)1 04 67 75 93', 9, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(618, 1, NULL, 1, 103, 2, 'Susanne', 'Caron', '1983-05-08', 'Fabre', 'FR0758026291296P0607S307Z81', '03342', '37917', '1985-09-18', 'Veuf(ve)', 'Masculin', 1, 'g', 'auguste33@techer.org', NULL, NULL, '03 05 37 73 13', '03 34 10 73 19', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(619, 1, NULL, 1, 146, 2, 'Maggie', 'Vallee', '1974-11-19', 'Jean-sur-Bousquet', 'FR1896601730164DDBQ96DF6Z36', '99237', '73820', '1973-08-08', 'Divorcé(e)', 'Masculin', 1, 'alicepires@univ-thies.sn', 'picard.xavier@laposte.net', NULL, NULL, '0681629452', '+33 7 39 96 36 15', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(620, 5, NULL, 1, 164, 4, 'Nath', 'Thibault', '2000-06-24', 'Pottier-les-Bains', 'FR86337796769453KC213S21100', '32 312', '40 938', '1982-12-20', 'Veuf(ve)', 'Masculin', 0, 'martinelopez@univ-thies.sn', 'meyer.adrienne@reynaud.com', NULL, NULL, '+33 1 29 43 98 33', '+33 5 57 83 55 38', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(621, 5, NULL, 1, 130, 1, 'Charles', 'Foucher', '1981-01-28', 'Da Silva-la-Forêt', 'FR675276455396D798X71M17477', '39991', '19071', '1980-10-24', 'Divorcé(e)', 'Féminin', 0, 'yvesdurand@univ-thies.sn', 'lorraine90@maillard.org', NULL, NULL, '0154352430', '+33 1 58 70 40 22', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(622, 1, NULL, 1, 101, 3, 'Nathalie', 'Alexandre', '1987-07-28', 'Da Costa', 'FR403494645503UIF18RCO9NF54', '79 666', '70434', '2015-10-01', 'Célibataire', 'Masculin', 0, '', 'pires.guillaume@yahoo.fr', NULL, NULL, '+33 6 48 51 24 92', '+33 (0)4 14 60 42 64', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(623, 5, NULL, 1, 123, 1, 'Thibault', 'Langlois', '2015-06-07', 'Legendre-les-Bains', 'FR104077746044F64PLHOR1YK66', '94083', '81616', '2010-05-12', 'Marié(e)', 'Féminin', 1, 'cl', 'qbenoit@barre.fr', NULL, NULL, '0997504405', '+33 (0)1 22 86 24 88', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(624, 1, NULL, 1, 232, 2, 'René', 'Pages', '1987-03-24', 'Blin', 'FR0878133176914XXHP4526D770', '30 036', '49801', '2007-11-14', 'Divorcé(e)', 'Masculin', 1, 'olivierdebriand@univ-thies.sn', 'vbonneau@leroux.fr', NULL, NULL, '+33 (0)1 96 31 83 54', '06 85 02 92 47', 5, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(625, 4, NULL, 1, 124, 1, 'Nathalie', 'Blanchet', '1973-04-08', 'LacombeVille', 'FR274715011471MY981UVD6L169', '13795', '74 239', '2020-08-17', 'Marié(e)', 'Masculin', 1, 'odettevalette@univ-thies.sn', 'leveque.daniel@lambert.fr', NULL, NULL, '0113615561', '02 66 13 18 72', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(626, 4, NULL, 1, 18, 4, 'Benoît', 'Lopes', '2021-04-02', 'Weber-sur-Charpentier', 'FR1430767204720G58W1KNI3900', '66665', '86 281', '1974-07-03', 'Célibataire', 'Masculin', 0, 'rolandlegoff@univ-thies.sn', 'gauthier.vincent@laposte.net', NULL, NULL, '+33 (0)7 92 88 04 92', '0210606589', 6, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(627, 4, NULL, 1, 47, 2, 'Timothée', 'Blanchet', '1982-09-03', 'Dos Santos-sur-Lejeune', 'FR359156495545N563664R19D94', '50 900', '21847', '2015-12-17', 'Divorcé(e)', 'Féminin', 0, 'val', 'christelle.gomez@club-internet.fr', NULL, NULL, '+33 9 61 42 63 69', '+33 (0)4 89 76 37 77', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(628, 5, NULL, 1, 107, 4, 'Grégoire', 'Guillet', '2003-01-05', 'EvrardBourg', 'FR75081752853276A3US3947S75', '90618', '90 481', '2018-07-27', 'Marié(e)', 'Féminin', 1, 'alexandrialaporte@univ-thies.sn', 'lenoir.andree@coste.com', NULL, NULL, '+33 9 56 03 17 62', '0747440099', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(629, 5, NULL, 1, 171, 2, 'Michel', 'Chauveau', '1971-02-06', 'Pons', 'FR91548709228871562826T7S78', '94 988', '47 580', '2005-10-11', 'Marié(e)', 'Féminin', 0, 'thomasdesousa@univ-thies.sn', 'perrot.claudine@tele2.fr', NULL, NULL, '+33 9 81 28 40 13', '+33 1 89 81 54 40', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(630, 1, NULL, 1, 2, 3, 'Vincent', 'Legrand', '1993-12-04', 'Masseboeuf', 'FR831575653769LH1S0DRD2B166', '57 361', '61567', '2007-01-04', 'Marié(e)', 'Féminin', 0, 'carolinedelaolivier@univ-thies.sn', 'renaud.timothee@dacosta.fr', NULL, NULL, '+33 (0)2 12 71 90 00', '06 08 48 58 46', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(631, 4, NULL, 1, 153, 3, 'Gilbert', 'Charles', '2019-06-29', 'Munoz', 'FR42835537749595RL8QPT0GF07', '49522', '79403', '1981-05-23', 'Marié(e)', 'Masculin', 0, 'adrienleaubert@univ-thies.sn', 'lagarde.maggie@voila.fr', NULL, NULL, '+33 5 36 90 48 94', '+33 4 97 61 41 21', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(632, 1, NULL, 1, 134, 1, 'Anne', 'Perrin', '1971-12-05', 'Gonzalez-sur-Renard', 'FR902495576182OL178Z66LC803', '62595', '38526', '2005-08-25', 'Veuf(ve)', 'Féminin', 0, 'josephgodard@univ-thies.sn', 'foucher.theodore@gmail.com', NULL, NULL, '02 92 31 13 32', '+33 6 94 83 70 88', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(633, 4, NULL, 1, 64, 1, 'Alfred', 'Gosselin', '1997-11-01', 'Legendrenec', 'FR581283197237N386VKA1Y8248', '59 565', '48385', '1970-01-20', 'Marié(e)', 'Féminin', 1, '', 'laurence46@chartier.org', NULL, NULL, '+33 2 65 68 18 51', '+33 (0)5 32 83 02 10', 7, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(634, 5, NULL, 1, 39, 3, 'Jacques', 'Gonzalez', '1995-07-08', 'Lelievre', 'FR473157352263YV8X27O2W0O98', '76 633', '88 570', '2017-04-14', 'Marié(e)', 'Féminin', 1, 'jeannormand@univ-thies.sn', 'dominique60@navarro.fr', NULL, NULL, '+33 2 51 17 68 49', '+33 7 87 62 76 99', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(635, 1, NULL, 1, 114, 4, 'Timothée', 'Chretien', '1977-02-26', 'Merle', 'FR535212755353C28S0P0628783', '07970', '65 973', '1994-10-15', 'Marié(e)', 'Féminin', 1, 'pierre-', 'hugues44@tele2.fr', NULL, NULL, '+33 5 36 38 06 46', '+33 7 82 71 46 07', 3, NULL, NULL, NULL, NULL, 6, NULL, NULL);
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(636, 1, NULL, 1, 133, 1, 'Laurent', 'Legendre', '1974-12-16', 'Dialloboeuf', 'FR0935368048566QOI2KPZMO407', '62 148', '92263', '2006-09-23', 'Divorcé(e)', 'Masculin', 0, 'paulettepeltier@univ-thies.sn', 'sdevaux@legoff.com', NULL, NULL, '+33 (0)3 32 81 98 61', '0124124272', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(637, 5, NULL, 1, 141, 2, 'René', 'Maillot', '1971-10-03', 'Chauveau', 'FR2854130582197K0Q521060801', '04 246', '15 617', '2000-02-09', 'Célibataire', 'Féminin', 1, 'laetitialeclerc@univ-thies.sn', 'renee58@roussel.com', NULL, NULL, '+33 2 30 34 71 16', '0645496478', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(638, 4, NULL, 1, 140, 1, 'Paul', 'Leger', '2015-05-31', 'Le Gall', 'FR822497512105U8Z0IL65OJA44', '55 490', '92 435', '2012-04-10', 'Divorcé(e)', 'Masculin', 1, 'manonjacob@univ-thies.sn', 'ymeunier@live.com', NULL, NULL, '+33 7 38 44 81 05', '+33 (0)9 36 96 23 15', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(639, 5, NULL, 1, 226, 1, 'Odette', 'Pages', '2000-03-21', 'Garnier-sur-Poulain', 'FR103729223916HD20M4L396141', '77494', '24736', '1973-07-03', 'Veuf(ve)', 'Masculin', 1, 'marcellebreton@univ-thies.sn', 'marcel51@pottier.net', NULL, NULL, '+33 8 99 60 61 13', '0158685073', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(640, 4, NULL, 1, 202, 2, 'Thibault', 'Bouchet', '2009-07-25', 'Pottier-sur-Mer', 'FR256297273790L399WE469GY49', '53 217', '05843', '1972-07-29', 'Célibataire', 'Féminin', 1, 'nathrousset@univ-thies.sn', 'maurice44@simon.com', NULL, NULL, '+33 2 84 98 18 44', '+33 (0)9 03 48 47 07', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(641, 4, NULL, 1, 205, 4, 'Élisabeth', 'Merle', '1972-08-29', 'Lambertnec', 'FR2014330603907NH04XG68D248', '68 854', '17611', '2005-03-02', 'Marié(e)', 'Féminin', 0, '', 'chantal.brunel@charrier.com', NULL, NULL, '08 11 79 07 78', '04 99 13 80 59', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(642, 5, NULL, 1, 76, 3, 'Nathalie', 'Morvan', '2001-06-27', 'Lesage-sur-Texier', 'FR6043569216055I130GNWSJ790', '58705', '96 903', '1998-05-05', 'Veuf(ve)', 'Féminin', 1, 'no', 'odette.humbert@club-internet.fr', NULL, NULL, '0292352294', '+33 (0)7 80 82 00 77', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(643, 5, NULL, 1, 17, 2, 'Véronique', 'Alexandre', '2016-11-07', 'Huet', 'FR240372185568Y4L27026S3271', '05 089', '27 167', '2004-09-23', 'Marié(e)', 'Féminin', 1, 'zachariedurand@univ-thies.sn', 'nicolas92@normand.fr', NULL, NULL, '+33 3 81 32 21 80', '0640126275', 2, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(644, 1, NULL, 1, 123, 2, 'Émile', 'Mary', '2005-03-16', 'Barthelemy-sur-Mer', 'FR160315695167RYLN4713A6U94', '15455', '18 170', '1978-01-04', 'Divorcé(e)', 'Féminin', 0, 'auroredelalacombe@univ-thies.sn', 'marie.christiane@millet.fr', NULL, NULL, '+33 (0)3 02 18 86 18', '05 20 23 91 00', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(645, 1, NULL, 1, 73, 4, 'Victor', 'David', '2005-04-25', 'Le Gall', 'FR337230698750I661Q4FL9M294', '01664', '01984', '2007-12-24', 'Divorcé(e)', 'Masculin', 1, 'jacquesbonnin@univ-thies.sn', 'andree.guillaume@parent.fr', NULL, NULL, '+33 3 03 69 49 70', '07 95 94 90 37', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(646, 4, NULL, 1, 22, 3, 'Georges', 'Fournier', '1990-05-05', 'Georges-sur-Mer', 'FR502651622913CSBNWY5806I79', '43 648', '82 893', '2020-12-24', 'Veuf(ve)', 'Féminin', 0, 'georgesbreton@univ-thies.sn', 'levy.tristan@gerard.org', NULL, NULL, '05 23 95 06 10', '+33 (0)5 77 89 54 47', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(647, 1, NULL, 1, 59, 4, 'Marc', 'Peron', '1978-02-02', 'Ribeiro', 'FR2672933125370IHYN71I28V76', '49546', '18620', '1976-12-06', 'Veuf(ve)', 'Féminin', 0, 'denisefabre@univ-thies.sn', 'michele.poulain@meyer.org', NULL, NULL, '01 51 30 44 26', '06 81 91 00 84', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(648, 4, NULL, 1, 239, 2, 'Valérie', 'Torres', '1974-05-12', 'Massenec', 'FR6370707328720SQ617HS36084', '99 713', '33339', '1980-08-26', 'Veuf(ve)', 'Masculin', 1, 'isaacgiraud@univ-thies.sn', 'roussel.zoe@orange.fr', NULL, NULL, '+33 (0)3 63 97 80 65', '0153760619', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(649, 5, NULL, 1, 130, 1, 'Eugène', 'Devaux', '1979-03-09', 'Gros-sur-Letellier', 'FR445764731458N641V80L5FN25', '81 080', '64 291', '2020-08-05', 'Marié(e)', 'Féminin', 1, 'paulbodin-durand@univ-thies.sn', 'tdaniel@voila.fr', NULL, NULL, '+33 7 89 62 63 42', '+33 (0)9 50 75 99 11', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(650, 5, NULL, 1, 181, 3, 'Élise', 'Bonneau', '1997-09-14', 'Fouquet', 'FR127419438161FDLT2GM2T8355', '04 489', '34 575', '2014-02-12', 'Divorcé(e)', 'Féminin', 1, 'henriperrin@univ-thies.sn', 'philippine.dossantos@henry.org', NULL, NULL, '0618600651', '0596251675', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(651, 1, NULL, 1, 182, 1, 'Inès', 'Martineau', '1979-05-04', 'Rousset', 'FR719188354048130U838CGE048', '14 195', '63 800', '1985-08-10', 'Divorcé(e)', 'Masculin', 0, 'lorrainehumbert@univ-thies.sn', 'guillaume.hernandez@bruneau.fr', NULL, NULL, '04 61 62 08 43', '03 19 52 90 64', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(652, 1, NULL, 1, 165, 4, 'Victoire', 'Marie', '2005-10-06', 'Gay', 'FR675558201408G98U18HX15661', '42 672', '28 520', '2016-02-10', 'Veuf(ve)', 'Féminin', 0, 'paulinepelletier@univ-thies.sn', 'nicole.muller@sfr.fr', NULL, NULL, '+33 (0)6 97 58 36 12', '+33 7 73 93 05 57', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(653, 4, NULL, 1, 114, 1, 'Daniel', 'Pires', '2002-01-22', 'Navarro-sur-Blot', 'FR188481677247MU2OV94E79754', '32 259', '80724', '2002-02-12', 'Marié(e)', 'Féminin', 0, 'juliethierry@univ-thies.sn', 'gvalette@moulin.com', NULL, NULL, '+33 (0)2 93 24 49 64', '0892876417', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(654, 5, NULL, 1, 195, 1, 'Marc', 'Le Roux', '1993-07-25', 'Oliviernec', 'FR0634263457594C0PI8EN06790', '27 208', '98 052', '1976-11-01', 'Veuf(ve)', 'Féminin', 1, 'danielcordier@univ-thies.sn', 'gilbert.pierre@rossi.fr', NULL, NULL, '0781640618', '+33 4 00 83 27 67', 1, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(655, 1, NULL, 1, 5, 2, 'Charles', 'Lacroix', '1984-12-16', 'Fleury', 'FR335840047452IQE24OL4S2Z09', '96 151', '44702', '2017-03-26', 'Marié(e)', 'Masculin', 1, 'pierrefischer@univ-thies.sn', 'michele.dupuy@tele2.fr', NULL, NULL, '+33 (0)6 34 94 92 38', '0797270203', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(656, 1, NULL, 1, 56, 3, 'Alice', 'Pereira', '1995-09-16', 'Lebreton-sur-Arnaud', 'FR49999645885659R84Y9J7PG19', '47 227', '33529', '2008-11-10', 'Veuf(ve)', 'Masculin', 0, 'zachariegarnier-reynaud@univ-thies.sn', 'elisabeth.jean@gmail.com', NULL, NULL, '0911702281', '0102594961', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(657, 5, NULL, 1, 58, 4, 'Capucine', 'Duhamel', '1983-09-29', 'Denisnec', 'FR148039419089FC5CRCQ8NIF42', '05 371', '22036', '1980-08-12', 'Marié(e)', 'Féminin', 0, 'christopheleramos@univ-thies.sn', 'thibaut46@pinto.com', NULL, NULL, '+33 (0)5 60 46 07 55', '0468242104', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(658, 5, NULL, 1, 56, 1, 'Claude', 'Jacques', '2020-05-20', 'Blancnec', 'FR19303880963085473X68NWF49', '87 471', '78143', '1981-08-20', 'Veuf(ve)', 'Masculin', 1, 'antoinemartinez@univ-thies.sn', 'tdelaunay@rolland.com', NULL, NULL, '+33 6 13 62 18 54', '0353907020', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(659, 5, NULL, 1, 95, 4, 'Michel', 'Turpin', '2005-04-26', 'HoarauBourg', 'FR957986571105K39849P163446', '73 877', '67595', '1971-01-25', 'Veuf(ve)', 'Masculin', 0, 'marcellegiraud@univ-thies.sn', 'alphonse04@vasseur.fr', NULL, NULL, '+33 5 13 25 88 96', '0472841640', 7, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(660, 1, NULL, 1, 154, 4, 'Philippine', 'Moreno', '1994-10-10', 'Aubert', 'FR780157648539B75NYSC0W3V48', '88 894', '14654', '1988-09-06', 'Célibataire', 'Féminin', 0, 'fran', 'elodie.delorme@dbmail.com', NULL, NULL, '+33 9 96 19 74 80', '+33 4 18 26 37 27', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(661, 1, NULL, 1, 69, 1, 'Astrid', 'Potier', '1972-12-26', 'Le Gall', 'FR6833033057582NR6H425G8M20', '53515', '59 626', '1995-08-08', 'Divorcé(e)', 'Masculin', 1, 'alice-arnaudechauvet@univ-thies.sn', 'robert.sabine@live.com', NULL, NULL, '02 77 94 06 84', '+33 1 55 93 65 07', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(662, 1, NULL, 1, 33, 1, 'Julien', 'Girard', '1980-06-02', 'Collin', 'FR334328288266PH965X735KJ48', '72 405', '04 820', '2013-09-25', 'Divorcé(e)', 'Masculin', 0, 'fr', 'laurent.giraud@deschamps.fr', NULL, NULL, '08 91 79 50 34', '+33 (0)3 71 69 21 85', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(663, 1, NULL, 1, 40, 2, 'Maryse', 'Morin', '1993-01-09', 'Dupont', 'FR1730621154847TTJ2U823T735', '29 356', '59208', '1972-09-12', 'Divorcé(e)', 'Masculin', 0, 'jeannegarcia-michel@univ-thies.sn', 'vletellier@david.com', NULL, NULL, '03 97 32 66 72', '+33 3 24 09 23 78', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(664, 5, NULL, 1, 79, 3, 'Vincent', 'Vincent', '1988-03-14', 'Gimenez', 'FR872568355085Y2K882S704G83', '56 560', '86180', '1985-06-09', 'Veuf(ve)', 'Masculin', 0, 'georges-louisduhamel@univ-thies.sn', 'eleonore65@joubert.net', NULL, NULL, '+33 (0)2 71 43 98 78', '0346453674', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(665, 4, NULL, 1, 157, 3, 'Emmanuelle', 'Gregoire', '1998-08-31', 'Brunel-sur-Bouchet', 'FR965540997526VJ4G20N5IHA24', '22278', '29 150', '2004-06-25', 'Marié(e)', 'Masculin', 0, 'christelle-aim', 'roussel.gabrielle@bouygtel.fr', NULL, NULL, '+33 (0)1 21 11 76 46', '+33 1 86 06 35 19', 9, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(666, 4, NULL, 1, 117, 2, 'Guy', 'Merle', '2012-07-08', 'DuhamelBourg', 'FR65704908228869OV58SS1N360', '36495', '07 336', '1990-10-15', 'Veuf(ve)', 'Masculin', 0, 'louis-gr', 'zdeschamps@tele2.fr', NULL, NULL, '+33 (0)5 65 89 36 92', '+33 (0)2 73 18 77 50', 8, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(667, 1, NULL, 1, 53, 2, 'Gérard', 'Cousin', '2019-01-10', 'AndreVille', 'FR830784073862302E7KCFZ0466', '23 507', '58331', '1986-11-23', 'Veuf(ve)', 'Féminin', 1, 'emmanuelchartier@univ-thies.sn', 'yseguin@collet.fr', NULL, NULL, '+33 8 22 97 30 41', '+33 (0)1 01 50 93 87', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(668, 1, NULL, 1, 242, 2, 'Margaux', 'Daniel', '1997-11-02', 'Weiss', 'FR3247788876912N06R34OFNC51', '32515', '01625', '2016-04-28', 'Divorcé(e)', 'Féminin', 0, 'jacquesdacosta@univ-thies.sn', 'plemaitre@maillard.fr', NULL, NULL, '08 91 49 53 74', '07 80 73 47 21', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(669, 5, NULL, 1, 20, 1, 'Bertrand', 'Pottier', '1971-09-30', 'Carlier', 'FR08727278251793M2N4750T522', '86 097', '49931', '2011-07-16', 'Divorcé(e)', 'Masculin', 1, '', 'cpasquier@voila.fr', NULL, NULL, '0377140838', '08 91 19 73 57', 3, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(670, 4, NULL, 1, 233, 4, 'André', 'Jacquet', '1974-01-25', 'Renaud', 'FR1485879957263V36BTT5A3P46', '10 115', '06 407', '2019-05-24', 'Célibataire', 'Féminin', 0, 'ad', 'astrid.noel@lebon.fr', NULL, NULL, '05 16 76 82 16', '+33 (0)6 37 29 76 28', 1, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(671, 4, NULL, 1, 226, 4, 'Honoré', 'Camus', '2001-01-29', 'Roy-sur-Traore', 'FR651933120510S7B3S7S2D0V96', '18916', '76754', '1987-12-13', 'Veuf(ve)', 'Masculin', 0, 'paulinelecomte@univ-thies.sn', 'amelie32@chauvin.fr', NULL, NULL, '0214189735', '+33 (0)7 57 03 78 89', 4, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(672, 1, NULL, 1, 159, 3, 'Édith', 'Giraud', '2010-04-14', 'Hamel-sur-Bonnet', 'FR145597292199Y2173KP95K662', '53520', '79 985', '1990-03-02', 'Célibataire', 'Masculin', 1, 'paulinecolin@univ-thies.sn', 'ftexier@bouygtel.fr', NULL, NULL, '+33 4 33 77 60 74', '+33 (0)2 34 02 14 25', 1, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(673, 5, NULL, 1, 141, 3, 'Emmanuelle', 'Devaux', '1980-01-29', 'Gaudin-sur-Mer', 'FR5551829287031658787VS5516', '00052', '22093', '1995-12-27', 'Divorcé(e)', 'Masculin', 0, 'pauline-', 'inoel@live.com', NULL, NULL, '01 52 55 33 42', '06 38 64 35 82', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(674, 5, NULL, 1, 173, 4, 'Martin', 'David', '2017-07-21', 'Traore', 'FR9368059140964P249L3289658', '45 845', '73186', '1970-02-18', 'Célibataire', 'Féminin', 1, 'margaretguyon@univ-thies.sn', 'margot95@hotmail.fr', NULL, NULL, '+33 5 83 67 20 09', '+33 1 51 63 68 99', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(675, 5, NULL, 1, 52, 3, 'Emmanuelle', 'Lacroix', '1986-08-07', 'Pichon-sur-Perrot', 'FR4531954381971UL9E4MUAEC94', '02 223', '76884', '2010-09-28', 'Marié(e)', 'Masculin', 1, 'g', 'brunet.olivie@orange.fr', NULL, NULL, '0172838247', '01 51 79 63 36', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(676, 1, NULL, 1, 77, 3, 'Théophile', 'Bigot', '2014-03-04', 'Cohen', 'FR734803096310Q6TTRGL5T2U61', '15 819', '30 734', '1986-08-08', 'Marié(e)', 'Féminin', 1, '', 'xavier.hardy@fernandes.fr', NULL, NULL, '06 37 32 17 98', '0926607454', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(677, 1, NULL, 1, 181, 3, 'Yves', 'Cousin', '1996-06-26', 'Robert', 'FR4468092845046304DO533KK03', '41 906', '60 826', '1995-01-03', 'Veuf(ve)', 'Masculin', 0, 'nathaliefaure@univ-thies.sn', 'dnavarro@gmail.com', NULL, NULL, '+33 (0)1 95 33 64 70', '0956881326', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(678, 1, NULL, 1, 219, 1, 'Jeanne', 'Rodriguez', '1987-07-11', 'Martel', 'FR52858120865951W9FYSV17R33', '67 828', '39 540', '1977-11-25', 'Célibataire', 'Féminin', 1, 'margauxthibault@univ-thies.sn', 'simone.lemaire@hamon.fr', NULL, NULL, '0829073234', '08 92 12 63 06', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(679, 1, NULL, 1, 51, 4, 'Jérôme', 'Berger', '1987-03-07', 'Roussel', 'FR614437589339UN2459540BN69', '21 940', '45062', '1987-09-01', 'Marié(e)', 'Masculin', 0, 'ren', 'sdaniel@bouygtel.fr', NULL, NULL, '+33 4 06 55 57 92', '+33 4 59 41 42 75', 3, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(680, 5, NULL, 1, 205, 2, 'William', 'Germain', '1976-11-29', 'Besnard-les-Bains', 'FR445400714612FMV6396JP4E41', '33 211', '46 688', '1972-06-15', 'Veuf(ve)', 'Féminin', 1, 'thierryjulien@univ-thies.sn', 'ngirard@faure.fr', NULL, NULL, '0897789747', '0771243718', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(681, 5, NULL, 1, 183, 3, 'Martin', 'Tessier', '2008-06-23', 'Alexandre', 'FR628160603384815N26830ZO03', '68 525', '57556', '1990-10-11', 'Célibataire', 'Féminin', 1, 'madeleinedelamorel@univ-thies.sn', 'pichon.capucine@laposte.net', NULL, NULL, '0893758665', '04 34 50 40 28', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(682, 1, NULL, 1, 169, 1, 'Claude', 'Neveu', '2012-06-13', 'PruvostBourg', 'FR540246055754176XSQ7BIC691', '32 209', '15642', '2013-05-27', 'Veuf(ve)', 'Masculin', 0, 'claudepetit-dubois@univ-thies.sn', 'rodriguez.benjamin@voila.fr', NULL, NULL, '04 47 04 98 07', '0395518374', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(683, 5, NULL, 1, 236, 4, 'Thomas', 'Garnier', '2001-11-13', 'Legros', 'FR29042701248926AE3CTB67Y23', '80 137', '37 317', '2005-11-19', 'Veuf(ve)', 'Féminin', 0, 'juliettelenavarro@univ-thies.sn', 'paul90@club-internet.fr', NULL, NULL, '+33 (0)2 94 60 14 96', '06 89 36 20 46', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(684, 1, NULL, 1, 5, 3, 'Geneviève', 'Rey', '2000-10-18', 'Caron', 'FR2587908569426E958RQVOEU34', '72694', '78 414', '1982-09-04', 'Célibataire', 'Féminin', 1, 'honor', 'louise.fontaine@chauveau.net', NULL, NULL, '08 95 99 16 44', '09 79 11 99 35', 7, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(685, 1, NULL, 1, 46, 3, 'Charles', 'Techer', '1982-06-24', 'Marechaldan', 'FR419782248084P89CB484G0637', '15 158', '68 440', '1971-01-20', 'Veuf(ve)', 'Féminin', 1, 'oc', 'cecile23@gmail.com', NULL, NULL, '+33 1 87 26 25 73', '+33 7 36 38 64 68', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(686, 4, NULL, 1, 73, 2, 'Dominique', 'Martins', '1975-07-09', 'Perret', 'FR6000374000047S21884267942', '61084', '26 476', '1995-01-30', 'Célibataire', 'Masculin', 0, 'genevi', 'louise29@tiscali.fr', NULL, NULL, '0548375625', '0646931185', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(687, 4, NULL, 1, 204, 4, 'Olivier', 'Raymond', '1970-10-18', 'Reynaud', 'FR742224471013462XWQN8MES28', '60 102', '60608', '1991-11-08', 'Célibataire', 'Masculin', 1, 'pierredurand@univ-thies.sn', 'frederic59@club-internet.fr', NULL, NULL, '+33 8 93 47 65 27', '+33 (0)1 37 54 38 84', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(688, 1, NULL, 1, 25, 1, 'Laurent', 'Delorme', '1979-06-16', 'Weiss', 'FR4721008857198663Z729T2548', '61 519', '49 202', '1990-05-17', 'Divorcé(e)', 'Masculin', 1, '', 'gerard76@guillon.com', NULL, NULL, '06 27 06 62 99', '+33 8 21 14 44 22', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(689, 1, NULL, 1, 218, 4, 'Adrien', 'Fontaine', '1980-09-14', 'Sanchez', 'FR835093971643705Z1Q4KG2P31', '70831', '52637', '2016-10-17', 'Divorcé(e)', 'Masculin', 0, 'louis-ren', 'charlotte57@bouygtel.fr', NULL, NULL, '08 23 65 72 79', '02 57 64 18 64', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(690, 1, NULL, 1, 50, 1, 'Corinne', 'Mary', '1989-10-14', 'Chartier-sur-Mer', 'FR8643911441998MJFS9798BJ56', '56 554', '06651', '1970-01-24', 'Célibataire', 'Féminin', 1, 'marine-antoinettehuet@univ-thies.sn', 'louis.pichon@laposte.net', NULL, NULL, '+33 3 97 66 41 50', '+33 6 84 76 02 44', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(691, 5, NULL, 1, 106, 3, 'Thierry', 'Joubert', '2018-05-24', 'Lucas', 'FR1965304585517AJL3YW51R916', '16541', '33900', '1983-09-28', 'Célibataire', 'Féminin', 0, 'in', 'marcel.boulay@perrot.com', NULL, NULL, '0125796563', '+33 (0)1 83 48 42 72', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(692, 4, NULL, 1, 98, 3, 'Rémy', 'Faivre', '1998-06-30', 'Lefebvre', 'FR356394713294UI8688HR52N12', '64906', '69184', '1977-05-18', 'Marié(e)', 'Masculin', 0, 'augustepasquier@univ-thies.sn', 'vincent01@olivier.com', NULL, NULL, '0769620356', '0895022822', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(693, 5, NULL, 1, 49, 3, 'Charles', 'Diallo', '1970-09-12', 'Lainenec', 'FR5055517803011Y9U4H799JM95', '99638', '65191', '2009-02-28', 'Célibataire', 'Masculin', 1, 'adriennephilippe-boyer@univ-thies.sn', 'vasseur.lucy@besnard.fr', NULL, NULL, '0453685910', '0133264971', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(694, 5, NULL, 1, 182, 2, 'Aimée', 'Langlois', '1982-11-15', 'Lecomte', 'FR1318081393357D7EXWT538S20', '98672', '02780', '1991-02-27', 'Célibataire', 'Masculin', 0, 'isabelle-emmanuellealexandre@univ-thies.sn', 'xpires@yahoo.fr', NULL, NULL, '+33 (0)7 53 28 16 47', '+33 3 49 02 43 68', 5, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(695, 1, NULL, 1, 76, 4, 'Maggie', 'Pelletier', '2017-06-28', 'ColinBourg', 'FR77102611665406Y9YXQ400836', '21433', '98852', '1970-02-19', 'Divorcé(e)', 'Féminin', 0, 'hortenseguyon@univ-thies.sn', 'uallard@yahoo.fr', NULL, NULL, '0417261446', '+33 (0)1 44 64 53 70', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(696, 5, NULL, 1, 176, 4, 'Zacharie', 'Pierre', '2016-01-14', 'AlvesVille', 'FR02533590493889G76S4RH9V70', '74428', '60 171', '2005-10-19', 'Divorcé(e)', 'Masculin', 0, 'benjaminleveque@univ-thies.sn', 'theophile.dossantos@dubois.net', NULL, NULL, '+33 2 92 20 86 93', '+33 5 93 99 74 23', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(697, 4, NULL, 1, 133, 1, 'Thérèse', 'Riviere', '2018-11-13', 'De Oliveira-sur-Mer', 'FR302436859185830P2ZATF9I82', '87781', '74948', '1978-05-11', 'Divorcé(e)', 'Masculin', 0, 'thierryhamon@univ-thies.sn', 'kberthelot@bertin.fr', NULL, NULL, '+33 4 85 47 74 70', '+33 (0)8 98 74 18 18', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(698, 1, NULL, 1, 13, 3, 'Colette', 'Dumas', '2004-10-23', 'Le Gall', 'FR786940087833KHUY1742SY868', '08967', '67733', '1984-12-11', 'Divorcé(e)', 'Masculin', 0, 'hortenselepicard@univ-thies.sn', 'krodrigues@torres.net', NULL, NULL, '0897361014', '05 24 48 10 14', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(699, 1, NULL, 1, 133, 4, 'Manon', 'Lacroix', '1988-06-29', 'Leduc', 'FR133704068831D3ZB5SBIIM250', '84924', '08 591', '1982-05-22', 'Célibataire', 'Masculin', 0, 'simonedumasse@univ-thies.sn', 'auger.lorraine@techer.fr', NULL, NULL, '+33 (0)7 87 75 16 68', '0324995493', 8, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(700, 4, NULL, 1, 18, 2, 'Édouard', 'Ferrand', '2013-01-22', 'Gilles', 'FR038684661871Z2YVN8RJXCD06', '71992', '27 365', '1994-04-18', 'Veuf(ve)', 'Féminin', 1, 'victorrey@univ-thies.sn', 'david48@gmail.com', NULL, NULL, '+33 (0)4 61 01 67 86', '0121187161', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(701, 1, NULL, 1, 43, 1, 'Jacqueline', 'Bonnet', '1996-10-17', 'Colin', 'FR459052450871FTF76CJ59Q484', '40763', '26 274', '1979-05-26', 'Célibataire', 'Féminin', 1, 'lucasbouvier@univ-thies.sn', 'thierry.diaz@gallet.fr', NULL, NULL, '0443000178', '0354476415', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(702, 1, NULL, 1, 136, 3, 'Antoine', 'Vincent', '1987-03-22', 'Masse', 'FR599393711831DP3H016DZL109', '24583', '22706', '2009-06-06', 'Célibataire', 'Masculin', 0, 'charlesmoreno-regnier@univ-thies.sn', 'valentine32@cordier.com', NULL, NULL, '+33 4 86 96 05 83', '0340540677', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(703, 5, NULL, 1, 32, 2, 'Stéphanie', 'Prevost', '2015-12-15', 'Boutin', 'FR729526874940V04U30IPE6147', '51136', '46846', '1981-12-03', 'Célibataire', 'Masculin', 1, 'chantalandre@univ-thies.sn', 'dbenoit@sfr.fr', NULL, NULL, '+33 (0)3 80 80 39 22', '+33 8 02 60 18 10', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(704, 5, NULL, 1, 124, 1, 'Thierry', 'Coulon', '1973-06-07', 'BegueBourg', 'FR9525142482141U9EP12246308', '08 069', '58071', '1978-02-10', 'Veuf(ve)', 'Masculin', 1, 'adrienvoisin@univ-thies.sn', 'lorraine04@fournier.com', NULL, NULL, '+33 1 81 15 46 08', '0183805779', 9, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(705, 4, NULL, 1, 227, 1, 'Gabrielle', 'Thibault', '1975-02-15', 'Collet', 'FR586362494072Q04R94FOS5962', '93452', '46728', '1977-08-01', 'Marié(e)', 'Masculin', 0, 'louisdacosta@univ-thies.sn', 'vincent78@diaz.fr', NULL, NULL, '+33 1 63 83 82 22', '0774295231', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(706, 1, NULL, 1, 154, 3, 'Véronique', 'Fouquet', '2019-11-03', 'Morel-sur-Guillon', 'FR705846344071UO7B36J947521', '60 480', '86943', '1991-05-29', 'Veuf(ve)', 'Féminin', 1, 'c', 'lucas.gaudin@orange.fr', NULL, NULL, '+33 (0)6 91 59 50 89', '+33 1 78 63 86 47', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(707, 4, NULL, 1, 84, 3, 'Denise', 'Petitjean', '2011-01-13', 'De Sousadan', 'FR493209499177W10KA44U8OD93', '21358', '92 044', '2004-02-10', 'Marié(e)', 'Masculin', 0, 'bernardaubert@univ-thies.sn', 'alain38@club-internet.fr', NULL, NULL, '+33 (0)2 75 76 49 89', '02 49 10 69 13', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(708, 5, NULL, 1, 241, 1, 'Marine', 'Launay', '2014-03-18', 'Letellier-la-Forêt', 'FR5259441567500LS4Q356GA027', '63 109', '25212', '1994-09-23', 'Veuf(ve)', 'Masculin', 1, 'c', 'lbaudry@brunet.fr', NULL, NULL, '+33 (0)5 38 31 59 98', '0976516698', 1, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(709, 5, NULL, 1, 31, 1, 'Frédéric', 'Grondin', '1979-10-02', 'Launay', 'FR7524543051116GFQQ4O36OE89', '79881', '06 195', '2001-12-27', 'Marié(e)', 'Masculin', 1, 'rolandallard@univ-thies.sn', 'marcel62@bernard.net', NULL, NULL, '07 46 43 79 58', '+33 (0)9 41 21 86 73', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(710, 4, NULL, 1, 224, 2, 'Madeleine', 'Charrier', '2001-05-26', 'Bouchet', 'FR2457572136436W176J08YK948', '47990', '42 994', '1992-05-02', 'Célibataire', 'Féminin', 1, 'luce-lucygerard@univ-thies.sn', 'renee80@rolland.com', NULL, NULL, '03 51 70 58 31', '+33 2 58 84 07 93', 1, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(711, 4, NULL, 1, 17, 2, 'Roland', 'Guillou', '1991-12-03', 'Fabre', 'FR649600067161XS55A5TC6V171', '57 263', '86150', '2013-01-06', 'Veuf(ve)', 'Masculin', 0, 'charlotteduweiss@univ-thies.sn', 'lberthelot@tele2.fr', NULL, NULL, '+33 (0)7 75 75 88 55', '+33 (0)6 18 60 19 97', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(712, 5, NULL, 1, 47, 2, 'Charles', 'Gros', '2002-09-10', 'Hernandezdan', 'FR88436823320414596151K7640', '96 709', '71391', '1992-11-02', 'Veuf(ve)', 'Masculin', 1, 'aliceollivier@univ-thies.sn', 'nath.roger@voila.fr', NULL, NULL, '0588015440', '03 39 58 76 60', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(713, 5, NULL, 1, 210, 1, 'Joseph', 'Payet', '2016-06-06', 'Bouchet', 'FR4654390898605364U219BNA22', '64 272', '90 891', '1991-05-07', 'Célibataire', 'Féminin', 1, 'michellemichaud@univ-thies.sn', 'philippine40@gmail.com', NULL, NULL, '+33 9 14 52 59 14', '+33 3 50 58 96 00', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(714, 1, NULL, 1, 140, 3, 'Josette', 'Legendre', '1970-05-28', 'Hardy', 'FR4611132466745323104F51407', '16 923', '06331', '2008-09-08', 'Marié(e)', 'Féminin', 1, 'th', 'rlelievre@tele2.fr', NULL, NULL, '+33 (0)6 64 72 52 05', '+33 (0)7 81 15 01 45', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(715, 4, NULL, 1, 233, 2, 'Nathalie', 'Gauthier', '1988-06-06', 'LaporteBourg', 'FR253934568674QN42RP5KJY818', '85175', '11 761', '1981-10-29', 'Célibataire', 'Féminin', 1, 'margueriteferrand@univ-thies.sn', 'olamy@fontaine.fr', NULL, NULL, '+33 1 01 02 97 76', '+33 2 15 24 53 98', 7, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(716, 5, NULL, 1, 107, 4, 'Margot', 'Lesage', '1971-09-02', 'Jourdan-la-Forêt', 'FR408996285896C547SW0WJ5L49', '54874', '60 007', '2015-02-13', 'Veuf(ve)', 'Féminin', 0, 'th', 'eugene.lebreton@pinto.net', NULL, NULL, '0101037455', '+33 (0)2 93 61 33 38', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(717, 5, NULL, 1, 200, 3, 'Françoise', 'Navarro', '1975-07-24', 'Le Roux', 'FR3773699264826YQSN530O7A31', '11 051', '38 829', '2002-07-07', 'Marié(e)', 'Masculin', 0, '', 'paulette.perret@gmail.com', NULL, NULL, '+33 (0)6 63 78 32 86', '0989088550', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(718, 4, NULL, 1, 218, 1, 'Michelle', 'Samson', '2013-05-15', 'Bousquetboeuf', 'FR187073690206R77YO594FY130', '00 898', '87 551', '1978-03-11', 'Marié(e)', 'Féminin', 0, 'astridroy@univ-thies.sn', 'charrier.helene@orange.fr', NULL, NULL, '0405998302', '05 23 27 46 72', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(719, 1, NULL, 1, 82, 2, 'Christelle', 'Mercier', '1988-05-17', 'Texier-sur-Lambert', 'FR66595273969162SWSV7DRQ864', '82430', '08377', '1984-12-26', 'Divorcé(e)', 'Féminin', 0, 'louisebesson@univ-thies.sn', 'andre.philippine@courtois.fr', NULL, NULL, '0338029375', '+33 (0)4 76 69 63 93', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(720, 5, NULL, 1, 10, 1, 'Frédéric', 'Leblanc', '1996-08-18', 'Pottier-les-Bains', 'FR9670934242416VWTJWZT86742', '68 451', '89 243', '1991-03-22', 'Marié(e)', 'Féminin', 0, 'l', 'qpereira@tiscali.fr', NULL, NULL, '05 33 25 12 92', '+33 4 12 73 77 73', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(721, 1, NULL, 1, 204, 4, 'Margot', 'Guichard', '1995-03-23', 'Simon-sur-Bonneau', 'FR687229601537DF2C944836P93', '85517', '43 493', '1991-02-13', 'Marié(e)', 'Féminin', 1, 'patricklebreton-boyer@univ-thies.sn', 'bbouvet@costa.fr', NULL, NULL, '+33 (0)4 14 06 16 48', '+33 1 38 20 43 50', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(722, 5, NULL, 1, 79, 1, 'Philippe', 'Antoine', '2002-03-21', 'Pasquierdan', 'FR85127192745606FNJ22QS0303', '26013', '98293', '1992-04-25', 'Célibataire', 'Masculin', 1, 'richarddujoseph@univ-thies.sn', 'ltorres@laposte.net', NULL, NULL, '+33 9 84 75 64 84', '02 18 42 27 60', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(723, 4, NULL, 1, 10, 3, 'Jacques', 'Etienne', '1991-11-16', 'Faivre-sur-Dias', 'FR464127941625D0CP3J12E8042', '55 902', '16112', '2013-01-14', 'Célibataire', 'Féminin', 0, 'jeanmorin-roger@univ-thies.sn', 'georges.gabriel@wanadoo.fr', NULL, NULL, '04 53 40 37 65', '04 96 13 06 94', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(724, 4, NULL, 1, 36, 2, 'Nath', 'Menard', '2003-08-30', 'Marty', 'FR680388335257654TPE9G23686', '76524', '98 533', '2001-11-21', 'Célibataire', 'Masculin', 1, 'raymondgallet-henry@univ-thies.sn', 'laurent.perrin@barthelemy.org', NULL, NULL, '+33 3 12 81 27 18', '+33 (0)2 61 86 25 91', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(725, 4, NULL, 1, 211, 1, 'Claudine', 'Levy', '2001-11-08', 'Delorme', 'FR6557259602964AI6CQNW15230', '25189', '90143', '2012-07-10', 'Divorcé(e)', 'Féminin', 0, 'timoth', 'jules35@rocher.com', NULL, NULL, '+33 (0)8 23 38 01 76', '0616593423', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(726, 4, NULL, 1, 167, 4, 'Jacques', 'Diaz', '1981-08-05', 'Vidal', 'FR276636071552HZFJZ7R0ZE568', '12681', '37420', '2000-10-25', 'Marié(e)', 'Féminin', 1, 'adrienpaul-charrier@univ-thies.sn', 'raymond.monique@live.com', NULL, NULL, '04 79 66 63 08', '0643273355', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(727, 4, NULL, 1, 132, 2, 'André', 'Gallet', '2015-01-26', 'Imbert-sur-Mer', 'FR481742485751N3CDHR1I6W173', '17628', '90368', '2007-03-13', 'Veuf(ve)', 'Féminin', 1, 'juliettelagarde-henry@univ-thies.sn', 'alain64@marchal.com', NULL, NULL, '01 23 90 55 83', '+33 (0)1 88 92 38 69', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(728, 4, NULL, 1, 40, 4, 'Lucas', 'Renard', '2004-07-27', 'Charpentier', 'FR69004572262420P3P22885979', '14 724', '62313', '1989-07-18', 'Veuf(ve)', 'Féminin', 1, 'bertrandweiss@univ-thies.sn', 'thubert@joseph.net', NULL, NULL, '0186342530', '+33 (0)2 27 26 13 62', 7, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(729, 5, NULL, 1, 203, 1, 'Alix', 'Lecomte', '2015-09-29', 'Ruiz-les-Bains', 'FR110695824282K5761E0SRI748', '53770', '70 819', '2016-12-21', 'Marié(e)', 'Féminin', 0, 'nathaliedelagarde@univ-thies.sn', 'ines94@club-internet.fr', NULL, NULL, '+33 7 53 07 44 27', '0772663909', 8, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(730, 5, NULL, 1, 201, 4, 'Aimé', 'Guyon', '1985-11-08', 'Ollivier', 'FR2862822419441VR8954X4EP32', '05971', '38 732', '2003-11-27', 'Veuf(ve)', 'Féminin', 0, 'marthegrenier@univ-thies.sn', 'wleroux@gimenez.fr', NULL, NULL, '+33 3 51 95 35 47', '0542914405', 4, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(731, 5, NULL, 1, 122, 2, 'Paulette', 'Guyon', '1992-11-13', 'Lejeune', 'FR221072637453X5KJ4627S3958', '35316', '46606', '1986-11-29', 'Marié(e)', 'Féminin', 0, 'robertlanglois@univ-thies.sn', 'maryse05@orange.fr', NULL, NULL, '0188626381', '0302346165', 6, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(732, 5, NULL, 1, 158, 4, 'Raymond', 'Berger', '1994-06-24', 'Guichardnec', 'FR966746450042LR83VKE30LE55', '55735', '06506', '2019-06-09', 'Célibataire', 'Féminin', 0, 'louisboucher@univ-thies.sn', 'michele67@sfr.fr', NULL, NULL, '01 02 67 13 63', '0517362205', 8, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(733, 1, NULL, 1, 153, 2, 'Agnès', 'Navarro', '1977-05-17', 'Gilles-les-Bains', 'FR791652347498S6437PHUQGO55', '62 682', '78 901', '2005-09-12', 'Divorcé(e)', 'Masculin', 1, '', 'boutin.renee@maury.com', NULL, NULL, '04 93 58 23 32', '+33 (0)2 47 76 57 17', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(734, 5, NULL, 1, 30, 2, 'Louis', 'Ramos', '2002-08-28', 'Marques', 'FR182506088398497J37G7WNX74', '53 848', '49 981', '1978-02-18', 'Célibataire', 'Féminin', 0, 'nicolasalves@univ-thies.sn', 'noel.anastasie@caron.fr', NULL, NULL, '+33 (0)1 91 54 88 52', '+33 (0)6 44 08 80 26', 3, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(735, 1, NULL, 1, 98, 2, 'Roger', 'Bertin', '1990-11-08', 'Fabre', 'FR270736832175R6W84565OTL84', '59 776', '63922', '1989-01-19', 'Célibataire', 'Masculin', 0, 'daniellecousin@univ-thies.sn', 'flemaitre@sfr.fr', NULL, NULL, '03 55 46 73 47', '+33 (0)5 70 85 49 51', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(736, 5, NULL, 1, 8, 4, 'Anaïs', 'Fournier', '1985-08-26', 'Gosselin', 'FR714152432198SLIEO8WJ9IJ74', '47 979', '69119', '1991-08-03', 'Marié(e)', 'Féminin', 1, 'vincentherve@univ-thies.sn', 'margaud.mallet@descamps.org', NULL, NULL, '+33 (0)4 07 65 60 38', '+33 (0)4 40 72 43 12', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(737, 4, NULL, 1, 66, 1, 'Zoé', 'Fontaine', '1994-05-29', 'LemonnierVille', 'FR659846682608BD94ZAM8A4U98', '71 001', '34 253', '1984-09-12', 'Divorcé(e)', 'Masculin', 1, 'michelle-margarethumbert@univ-thies.sn', 'julie.gauthier@gmail.com', NULL, NULL, '+33 (0)5 07 96 09 51', '07 89 05 31 10', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(738, 5, NULL, 1, 78, 2, 'Geneviève', 'Mahe', '1972-07-06', 'Breton', 'FR9649696500739Z3A44828FP87', '84945', '11 209', '2010-02-15', 'Veuf(ve)', 'Masculin', 0, 'antoinettechauvet@univ-thies.sn', 'alexandre.desousa@laposte.net', NULL, NULL, '0998631875', '03 26 09 19 46', 1, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(739, 4, NULL, 1, 4, 2, 'Guy', 'Delorme', '2011-01-12', 'Gimeneznec', 'FR8275871028541QTL35J3G5040', '92 097', '27 381', '2004-05-30', 'Célibataire', 'Féminin', 1, 'gilbertmeyer-breton@univ-thies.sn', 'lucas60@wanadoo.fr', NULL, NULL, '+33 9 98 04 00 62', '0998383429', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(740, 4, NULL, 1, 67, 3, 'Inès', 'Simon', '1991-02-19', 'Martin-sur-Grenier', 'FR24871441565246F4M82IC8C15', '77 107', '51416', '2003-11-19', 'Marié(e)', 'Masculin', 1, 'alfredcarre@univ-thies.sn', 'lemaire.alfred@voila.fr', NULL, NULL, '+33 5 89 14 91 35', '06 83 07 06 26', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(741, 5, NULL, 1, 237, 3, 'Michel', 'Morel', '2005-01-13', 'Lenoir-sur-Rolland', 'FR509401812714LVLX04M08E031', '28719', '22300', '1971-10-06', 'Veuf(ve)', 'Féminin', 1, 'patricksamson@univ-thies.sn', 'mbrunel@live.com', NULL, NULL, '+33 (0)3 18 88 75 23', '+33 (0)1 96 21 42 64', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(742, 1, NULL, 1, 62, 1, 'Clémence', 'Fabre', '2004-02-03', 'Muller-sur-Gautier', 'FR962861555132IQU4GBL549316', '94 262', '55 616', '1992-12-19', 'Divorcé(e)', 'Féminin', 0, 'hortense-alixbrunet@univ-thies.sn', 'qmaillet@free.fr', NULL, NULL, '0329384707', '04 32 38 70 64', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(743, 1, NULL, 1, 211, 2, 'Éric', 'Hoareau', '2009-12-25', 'Garnierdan', 'FR266342417571O47VS48IZ8927', '18141', '27634', '2009-05-15', 'Marié(e)', 'Féminin', 1, 'richardjoly@univ-thies.sn', 'laurent.riou@orange.fr', NULL, NULL, '09 18 72 20 96', '+33 4 05 66 31 28', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(744, 4, NULL, 1, 233, 4, 'Marie', 'Colas', '1974-08-01', 'Weissdan', 'FR3026915127310J4W69LQ01B39', '59746', '61957', '1995-06-27', 'Divorcé(e)', 'Masculin', 1, 'huguesbruneau@univ-thies.sn', 'jacquet.eleonore@noos.fr', NULL, NULL, '+33 (0)7 71 61 62 15', '0265850765', 6, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(745, 4, NULL, 1, 217, 3, 'Marianne', 'Mace', '1985-02-10', 'RodriguezVille', 'FR268614392648R1798T5ZCJ040', '13 588', '01 963', '2018-05-02', 'Célibataire', 'Féminin', 1, 'davidcollin@univ-thies.sn', 'kfernandez@sfr.fr', NULL, NULL, '+33 (0)6 00 33 88 23', '0513330594', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(746, 1, NULL, 1, 208, 1, 'Véronique', 'Blanchard', '2008-01-26', 'Samsondan', 'FR669655305829DH9TYB1C1WV39', '44 342', '90 825', '1982-11-16', 'Célibataire', 'Féminin', 1, 'adriendufoucher@univ-thies.sn', 'martine02@chauvin.fr', NULL, NULL, '09 34 75 92 01', '08 95 92 95 13', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(747, 5, NULL, 1, 134, 3, 'Gabrielle', 'Pinto', '2015-03-13', 'Lambert', 'FR4828365617265L14S396E0X00', '73924', '94970', '2001-12-31', 'Veuf(ve)', 'Masculin', 0, 'sophiebernard@univ-thies.sn', 'xgrondin@hotmail.fr', NULL, NULL, '0330339864', '0157768227', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(748, 5, NULL, 1, 12, 4, 'André', 'Rey', '2005-12-19', 'Guyotnec', 'FR956207714289Z6P4O5GKT4N92', '80 169', '39 980', '2011-03-13', 'Divorcé(e)', 'Féminin', 0, 'brigitte-laurebruneau@univ-thies.sn', 'hphilippe@tiscali.fr', NULL, NULL, '07 88 06 16 26', '07 72 84 73 83', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(749, 4, NULL, 1, 73, 4, 'Marguerite', 'Riou', '1970-05-06', 'Foucher', 'FR602030821092I69MJ5PST4S44', '25203', '57 066', '2012-02-25', 'Marié(e)', 'Féminin', 1, 'doroth', 'ffournier@descamps.com', NULL, NULL, '03 26 19 17 38', '+33 (0)8 95 60 30 77', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(750, 4, NULL, 1, 18, 2, 'Marianne', 'Buisson', '1988-04-06', 'Leroy-sur-Dufour', 'FR64957471141417R6SQ000FE04', '87 925', '54 412', '1973-02-18', 'Marié(e)', 'Masculin', 1, 'suzannecordier@univ-thies.sn', 'hortense.boucher@pineau.com', NULL, NULL, '+33 7 32 88 06 80', '+33 (0)6 98 27 49 74', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(751, 5, NULL, 1, 13, 1, 'Sébastien', 'Boucher', '2014-06-06', 'Lucas', 'FR849350872432R1OS2VKPAVJ28', '13 173', '46670', '1975-06-15', 'Marié(e)', 'Féminin', 1, 'alphonseribeiro@univ-thies.sn', 'riou.noemi@clement.com', NULL, NULL, '+33 5 49 83 35 40', '+33 (0)5 65 33 07 34', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(752, 1, NULL, 1, 103, 1, 'Martin', 'Blanc', '2002-09-09', 'Potier', 'FR50758354962012BYS89983326', '51 023', '44580', '2009-11-25', 'Divorcé(e)', 'Masculin', 0, 'r', 'nath77@wanadoo.fr', NULL, NULL, '+33 (0)1 77 85 97 64', '+33 6 27 09 04 05', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(753, 5, NULL, 1, 202, 4, 'Daniel', 'Martin', '1990-11-18', 'Brun-sur-Parent', 'FR3345413636198088U0UV1EP25', '39813', '06 705', '2014-07-24', 'Marié(e)', 'Féminin', 0, 'thomasmeyer-delannoy@univ-thies.sn', 'mathilde.dufour@georges.com', NULL, NULL, '+33 1 52 90 20 05', '+33 6 67 51 73 62', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(754, 5, NULL, 1, 35, 1, 'Véronique', 'Fabre', '1982-09-11', 'Leduc-sur-Girard', 'FR808885601066G4A8VSY15V898', '06956', '82 026', '2009-10-08', 'Veuf(ve)', 'Féminin', 0, '', 'thibault.maggie@free.fr', NULL, NULL, '+33 (0)6 54 68 06 32', '03 95 30 62 81', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(755, 1, NULL, 1, 46, 4, 'Nathalie', 'Humbert', '1987-07-29', 'Chevalier-sur-Besson', 'FR298206079489V60XB49D3K097', '09 751', '18520', '2010-12-23', 'Célibataire', 'Féminin', 0, 'philippinecaron@univ-thies.sn', 'maury.nathalie@tiscali.fr', NULL, NULL, '0955319175', '0629175386', 4, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(756, 5, NULL, 1, 233, 3, 'Édith', 'Denis', '2007-04-01', 'Leveque', 'FR768372342239254W43F469X27', '08614', '40233', '1972-11-02', 'Divorcé(e)', 'Masculin', 0, 'agn', 'bbertin@poulain.fr', NULL, NULL, '0474500960', '0927445633', 7, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(757, 5, NULL, 1, 134, 3, 'Arnaude', 'Joly', '2014-05-26', 'Fontainedan', 'FR402646528722962173M8NR215', '18243', '89 737', '2001-12-06', 'Veuf(ve)', 'Masculin', 0, 'christopheguillou@univ-thies.sn', 'catherine.masse@benard.com', NULL, NULL, '0162955224', '06 92 09 94 21', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(758, 1, NULL, 1, 132, 3, 'Astrid', 'Samson', '1996-09-26', 'Boulangernec', 'FR796436276428877GX0H4QNX40', '70 211', '65 576', '2001-12-11', 'Célibataire', 'Masculin', 1, 'paulpayet-samson@univ-thies.sn', 'wthibault@aubry.com', NULL, NULL, '0546203817', '04 60 75 46 16', 2, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(759, 4, NULL, 1, 192, 2, 'Dominique', 'Delattre', '2004-11-20', 'Hebert', 'FR052144197358W65775CW64167', '34 006', '68 305', '1973-10-27', 'Veuf(ve)', 'Masculin', 0, 'brigittebarthelemy@univ-thies.sn', 'georges36@lagarde.net', NULL, NULL, '0185650362', '+33 (0)5 37 25 14 27', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(760, 1, NULL, 1, 18, 2, 'Georges', 'Gaudin', '2011-12-25', 'Thierry', 'FR951588254752078Q34K6Y2X57', '61 809', '32 976', '2013-02-21', 'Divorcé(e)', 'Masculin', 1, '', 'audrey.meyer@ifrance.com', NULL, NULL, '0183188424', '0119384784', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(761, 1, NULL, 1, 98, 2, 'Hortense', 'Gomez', '2013-08-01', 'Regnier-sur-Mer', 'FR772227543961BMPDCD23CEO61', '44 071', '24897', '1984-10-03', 'Divorcé(e)', 'Féminin', 0, 'louislecoq@univ-thies.sn', 'cberthelot@legendre.net', NULL, NULL, '01 60 08 43 23', '+33 9 90 81 48 09', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(762, 1, NULL, 1, 59, 2, 'Anaïs', 'Pires', '2011-02-10', 'MasseVille', 'FR512006808103QFW1136ENMF17', '92851', '28944', '1978-01-18', 'Veuf(ve)', 'Masculin', 0, 'arthurmaillard-joseph@univ-thies.sn', 'faure.julie@tiscali.fr', NULL, NULL, '0442009913', '+33 7 35 18 07 04', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(763, 5, NULL, 1, 11, 4, 'Emmanuel', 'Pineau', '1981-12-07', 'Fouquet', 'FR668882695344C5329O244FJ71', '80 328', '26921', '1982-07-14', 'Célibataire', 'Masculin', 1, 'louisparis@univ-thies.sn', 'guichard.alexandre@bernier.com', NULL, NULL, '0125014071', '+33 9 23 68 43 79', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(764, 5, NULL, 1, 27, 2, 'Éric', 'Michaud', '2003-08-05', 'Germain-la-Forêt', 'FR25238613501953LNG2T1IDB16', '98828', '81 109', '1974-07-29', 'Divorcé(e)', 'Féminin', 0, 'guydufour@univ-thies.sn', 'kgrondin@munoz.net', NULL, NULL, '+33 2 47 15 82 20', '09 28 71 38 62', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(765, 1, NULL, 1, 204, 4, 'Grégoire', 'Caron', '1977-07-09', 'Bourgeois-sur-Nguyen', 'FR2440704474375FVYOXM792I50', '11 279', '25869', '1986-02-09', 'Divorcé(e)', 'Féminin', 0, 'louis-yvestecher@univ-thies.sn', 'paul55@tiscali.fr', NULL, NULL, '03 23 29 52 33', '+33 (0)1 33 56 12 47', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(766, 1, NULL, 1, 16, 4, 'Grégoire', 'Salmon', '1985-01-19', 'Briand', 'FR96409741673241BD2J46NW504', '13 178', '72632', '1997-12-17', 'Veuf(ve)', 'Masculin', 0, 'pauldudidier@univ-thies.sn', 'edouard.meyer@laposte.net', NULL, NULL, '08 97 12 22 39', '04 28 23 64 78', 6, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(767, 4, NULL, 1, 193, 2, 'Richard', 'Benard', '1971-03-02', 'Thibault-sur-Alexandre', 'FR472614966145353UFLY068H29', '54 505', '20 171', '1981-02-20', 'Marié(e)', 'Masculin', 1, 'michellemartins@univ-thies.sn', 'daniel.henri@free.fr', NULL, NULL, '+33 (0)5 38 61 15 37', '+33 (0)3 42 13 12 94', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(768, 4, NULL, 1, 45, 4, 'Anouk', 'Leveque', '1970-06-26', 'BaudryBourg', 'FR7428789962233612G460NKV19', '12 078', '42 763', '2020-01-04', 'Célibataire', 'Masculin', 0, 'thierryguillot@univ-thies.sn', 'bvalentin@orange.fr', NULL, NULL, '+33 (0)6 82 94 59 59', '04 21 86 78 74', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(769, 4, NULL, 1, 118, 2, 'Marcel', 'Andre', '2005-08-26', 'Lebreton', 'FR02821955837916377EO513742', '70 863', '41713', '2010-05-09', 'Divorcé(e)', 'Féminin', 1, 'andr', 'maillard.adele@orange.fr', NULL, NULL, '+33 (0)6 87 52 30 74', '05 75 48 63 48', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(770, 4, NULL, 1, 205, 2, 'Honoré', 'Devaux', '1992-05-03', 'Massonboeuf', 'FR413745664412QS63LY4976K04', '50 281', '70623', '1986-03-22', 'Divorcé(e)', 'Féminin', 0, 'alphonsegaillard-bertin@univ-thies.sn', 'dominique.hoareau@bouygtel.fr', NULL, NULL, '+33 1 97 73 16 72', '+33 2 54 82 77 55', 4, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(771, 4, NULL, 1, 80, 3, 'Jules', 'Raynaud', '2000-11-29', 'Hebert-sur-Mer', 'FR217255249838V836A484LO542', '25774', '90 416', '1971-05-19', 'Divorcé(e)', 'Féminin', 1, 'isabelledidier@univ-thies.sn', 'luce49@live.com', NULL, NULL, '0126269784', '+33 (0)2 55 09 41 81', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(772, 4, NULL, 1, 117, 2, 'Gabriel', 'Guilbert', '1987-06-25', 'Breton-sur-Mer', 'FR7732111496025E407PX7MEC60', '83053', '76 104', '2017-05-10', 'Veuf(ve)', 'Féminin', 0, 'thomasdefontaine@univ-thies.sn', 'nathalie.jacob@wanadoo.fr', NULL, NULL, '+33 1 03 06 33 78', '+33 (0)1 78 02 98 40', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(773, 5, NULL, 1, 204, 2, 'Richard', 'Delannoy', '1992-01-26', 'Monnier', 'FR1079914321200OJ9O9EFKOH27', '89 104', '91840', '2006-12-01', 'Veuf(ve)', 'Féminin', 0, 'camillevallet@univ-thies.sn', 'frederic.benoit@tiscali.fr', NULL, NULL, '+33 7 34 62 60 20', '0669319834', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(774, 1, NULL, 1, 142, 2, 'Joséphine', 'Boucher', '2014-06-01', 'Moulin', 'FR699858048159J024551506P90', '51 469', '26329', '1989-08-18', 'Divorcé(e)', 'Masculin', 0, 'juliettelacombe@univ-thies.sn', 'aurore.blanc@voila.fr', NULL, NULL, '0903683967', '01 78 07 64 35', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(775, 5, NULL, 1, 16, 3, 'Julien', 'Germain', '1988-07-31', 'Lecomte', 'FR0345617337894N69E1W8L0805', '63992', '16 029', '2012-03-24', 'Divorcé(e)', 'Féminin', 1, 'alexandriadualexandre@univ-thies.sn', 'etienne.catherine@ferrand.net', NULL, NULL, '09 04 79 30 87', '0743409078', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(776, 4, NULL, 1, 134, 4, 'Sébastien', 'Pages', '2009-01-06', 'Wagner', 'FR2005150359863643152696174', '58 395', '70271', '2016-08-20', 'Divorcé(e)', 'Féminin', 0, 'henriadam@univ-thies.sn', 'jacob.arthur@bazin.fr', NULL, NULL, '+33 (0)2 50 42 81 37', '+33 5 48 72 65 56', 4, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(777, 5, NULL, 1, 97, 2, 'Julie', 'Jourdan', '2012-03-25', 'Blanc', 'FR3982159599927FSGH60ID9151', '33885', '28 480', '1994-01-26', 'Célibataire', 'Masculin', 1, 'charlesberthelot@univ-thies.sn', 'lperez@orange.fr', NULL, NULL, '+33 (0)1 04 56 21 91', '03 81 66 77 61', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(778, 4, NULL, 1, 65, 2, 'Geneviève', 'Gomez', '1987-10-13', 'Blanchard', 'FR827277226580551M6RK1E3R98', '17795', '32 622', '1971-11-11', 'Divorcé(e)', 'Féminin', 0, 'henridelahumbert@univ-thies.sn', 'denise.alexandre@orange.fr', NULL, NULL, '+33 7 66 98 52 47', '02 14 59 16 56', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(779, 1, NULL, 1, 34, 4, 'Anastasie', 'Roche', '1977-09-12', 'Dos Santos-la-Forêt', 'FR3807066442219S5O6IRP99931', '48046', '25 072', '1978-02-13', 'Veuf(ve)', 'Féminin', 1, 'suzannebaron@univ-thies.sn', 'thierry30@club-internet.fr', NULL, NULL, '+33 5 83 36 81 89', '+33 (0)7 90 58 66 87', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(780, 1, NULL, 1, 123, 3, 'Margaux', 'Blot', '1991-05-22', 'Costa-les-Bains', 'FR605050877590EMT3E77788254', '64 586', '71 502', '1993-03-27', 'Veuf(ve)', 'Féminin', 1, 'pierre-thierrylombard@univ-thies.sn', 'louis45@parent.fr', NULL, NULL, '01 48 04 79 80', '0470085985', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(781, 1, NULL, 1, 180, 4, 'Denise', 'Berger', '1989-12-12', 'Le Roux', 'FR118280322585T7AJ6D5421C39', '05 652', '60 443', '1979-09-26', 'Veuf(ve)', 'Masculin', 1, 'isabelleraymond@univ-thies.sn', 'denis.lucy@voila.fr', NULL, NULL, '+33 (0)2 22 39 68 94', '+33 (0)1 90 64 72 44', 8, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(782, 5, NULL, 1, 205, 2, 'Zoé', 'Bruneau', '1998-03-22', 'JacquetVille', 'FR327532361063UT81T45478S21', '71633', '58 485', '1973-08-27', 'Divorcé(e)', 'Masculin', 1, 'emmanuellemaillet@univ-thies.sn', 'bertrand.joly@delorme.com', NULL, NULL, '08 09 68 91 41', '+33 9 69 91 81 73', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(783, 1, NULL, 1, 182, 1, 'Benjamin', 'Lecoq', '1996-10-06', 'BessonBourg', 'FR976595982860R9XIU6GTWI153', '68122', '79 581', '2003-04-23', 'Célibataire', 'Féminin', 0, 'gr', 'paulette82@tiscali.fr', NULL, NULL, '+33 (0)5 64 19 75 41', '+33 2 29 09 83 90', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(784, 4, NULL, 1, 81, 1, 'Roland', 'Allard', '2020-06-03', 'Ruiz', 'FR9741821821184F1FYWO790769', '92005', '19 162', '1970-10-08', 'Divorcé(e)', 'Masculin', 1, 'victormoreno@univ-thies.sn', 'valentin.noemi@dbmail.com', NULL, NULL, '+33 3 39 03 05 42', '0471935163', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(785, 4, NULL, 1, 26, 4, 'Alice', 'Morvan', '2009-11-14', 'Torres', 'FR142925720717P5120X8WJDF32', '07 914', '04 523', '2011-05-15', 'Veuf(ve)', 'Féminin', 1, 'robertmahe@univ-thies.sn', 'valentine82@ifrance.com', NULL, NULL, '0898246324', '07 52 37 32 31', 9, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(786, 1, NULL, 1, 103, 2, 'Antoine', 'Muller', '2012-04-19', 'Legros', 'FR927739261323Q62KMVU1CC280', '26938', '48247', '1977-12-02', 'Veuf(ve)', 'Féminin', 0, '', 'simone68@marchand.org', NULL, NULL, '+33 (0)2 81 67 03 63', '0402469927', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(787, 1, NULL, 1, 202, 4, 'Frédérique', 'Clerc', '2020-03-29', 'Da Silva', 'FR744434581671O6NN802765O43', '03710', '38494', '1974-06-18', 'Veuf(ve)', 'Féminin', 0, 'gabriel-georgesleroy@univ-thies.sn', 'rfaivre@yahoo.fr', NULL, NULL, '+33 4 78 83 28 39', '+33 (0)1 26 06 66 30', 8, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(788, 4, NULL, 1, 84, 2, 'Guillaume', 'Legendre', '1999-08-11', 'Benoit-sur-De Oliveira', 'FR58204171536722BFZ4VOU5H90', '14 681', '22983', '1988-10-21', 'Marié(e)', 'Féminin', 0, 'fr', 'augustin.michel@dupuis.fr', NULL, NULL, '0182621829', '07 68 05 86 13', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(789, 5, NULL, 1, 239, 4, 'Sabine', 'Martins', '1996-05-01', 'Marty-sur-Da Silva', 'FR8661489826112HUS784FEH636', '94354', '94 157', '2016-12-26', 'Veuf(ve)', 'Masculin', 0, 'thierrycarlier@univ-thies.sn', 'zneveu@leconte.com', NULL, NULL, '+33 (0)1 81 69 32 39', '+33 (0)7 56 56 24 02', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(790, 5, NULL, 1, 168, 2, 'Suzanne', 'Marie', '1988-06-10', 'Vallee', 'FR598889473637H976647AQ5N92', '82 797', '85 235', '1991-04-10', 'Marié(e)', 'Masculin', 1, 'auroremaillard-renault@univ-thies.sn', 'hperez@alves.fr', NULL, NULL, '+33 (0)2 91 41 82 39', '01 08 66 92 55', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(791, 5, NULL, 1, 29, 4, 'Nathalie', 'Maurice', '1978-10-07', 'Riou', 'FR104923046846IM005KB3XLP03', '71 161', '29 834', '2005-09-29', 'Célibataire', 'Féminin', 0, 'aur', 'benard.brigitte@tiscali.fr', NULL, NULL, '0630931390', '+33 (0)1 02 31 70 17', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(792, 1, NULL, 1, 192, 4, 'Laurent', 'Brun', '1995-06-12', 'CarreVille', 'FR515538645344T2O592P4D3X32', '11 854', '50 989', '2000-09-05', 'Célibataire', 'Masculin', 1, 'maggie-alexandriaboutin@univ-thies.sn', 'regnier.victor@lagarde.com', NULL, NULL, '09 21 05 84 53', '+33 7 56 29 51 54', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(793, 1, NULL, 1, 187, 4, 'Anastasie', 'Besson', '1980-12-05', 'Wagner', 'FR168724085001A08597Q2R0D05', '39 045', '00212', '1980-10-23', 'Veuf(ve)', 'Masculin', 1, 'fr', 'josephine.boutin@charpentier.net', NULL, NULL, '+33 (0)4 77 20 78 73', '06 94 52 35 84', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(794, 4, NULL, 1, 176, 2, 'Éric', 'Guilbert', '2003-12-16', 'BoyerVille', 'FR1159357130127X33W6V3ZSP18', '48803', '23 352', '2001-10-16', 'Divorcé(e)', 'Féminin', 0, 'alexandriedurand@univ-thies.sn', 'mjacquot@rolland.net', NULL, NULL, '+33 (0)2 59 75 29 25', '+33 6 85 07 04 96', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL);
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(795, 1, NULL, 1, 84, 2, 'Valérie', 'Baron', '1988-07-26', 'Dos Santos-sur-Chauvin', 'FR087320766998Z128398396602', '08 960', '42 359', '1975-04-22', 'Célibataire', 'Féminin', 0, 'jeanninepayet@univ-thies.sn', 'xavier.goncalves@morvan.com', NULL, NULL, '0990959584', '0933586274', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(796, 4, NULL, 1, 143, 1, 'Laurent', 'Pichon', '1987-08-17', 'Lefebvre-sur-Aubert', 'FR35086674426263XH200004562', '21348', '99735', '1985-03-30', 'Marié(e)', 'Masculin', 1, 'jacqueshenry@univ-thies.sn', 'delannoy.isaac@rossi.com', NULL, NULL, '+33 7 62 22 69 25', '0791619232', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(797, 4, NULL, 1, 148, 1, 'Henri', 'Gay', '2003-10-06', 'AntoineVille', 'FR252339244839G9HH85YHG2897', '60 521', '37 813', '2013-04-16', 'Divorcé(e)', 'Masculin', 1, 'cl', 'xmace@lacroix.fr', NULL, NULL, '+33 (0)7 67 81 70 19', '+33 2 38 85 02 22', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(798, 1, NULL, 1, 200, 4, 'Susanne', 'Ollivier', '2007-06-15', 'Leduc', 'FR6114742988339SU0G2287R949', '49 624', '15 711', '2000-08-26', 'Divorcé(e)', 'Masculin', 0, 'victoiredegirard@univ-thies.sn', 'elisabeth54@jacquet.fr', NULL, NULL, '+33 3 23 14 42 22', '+33 2 63 71 63 56', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(799, 4, NULL, 1, 183, 1, 'Jeannine', 'Dias', '2000-06-10', 'Pages', 'FR7025719961406N63451Y3O832', '55397', '98441', '1990-06-17', 'Célibataire', 'Féminin', 1, 'guy-pierredenis@univ-thies.sn', 'noel.begue@denis.org', NULL, NULL, '+33 7 46 39 45 00', '+33 5 68 10 35 71', 5, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(800, 5, NULL, 1, 22, 3, 'Joseph', 'Bonnet', '2012-06-11', 'Vincent', 'FR0431018707072AQH2V501IJ53', '41133', '18800', '1974-08-05', 'Veuf(ve)', 'Féminin', 0, 'nicolaslaunay-langlois@univ-thies.sn', 'garcia.benjamin@free.fr', NULL, NULL, '0261161802', '03 98 86 74 12', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(801, 4, NULL, 1, 58, 3, 'Emmanuel', 'Ferreira', '1970-01-28', 'Mercierboeuf', 'FR650650600304R711HM4366402', '62328', '59181', '1980-10-24', 'Divorcé(e)', 'Féminin', 1, 'susanlecousin@univ-thies.sn', 'denis.lenoir@carre.org', NULL, NULL, '+33 7 51 46 50 65', '01 51 52 32 11', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(802, 5, NULL, 1, 65, 1, 'Marie', 'Bouvet', '1988-05-05', 'Goncalves', 'FR179705043140BUPV3O07Y7R17', '70350', '27 137', '1972-09-12', 'Divorcé(e)', 'Féminin', 0, 'richardcoste@univ-thies.sn', 'udeschamps@bouygtel.fr', NULL, NULL, '+33 6 20 28 25 51', '0355264283', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(803, 1, NULL, 1, 21, 3, 'François', 'Humbert', '1971-08-30', 'Bonneau-la-Forêt', 'FR060591687089809AN71PY9V30', '51 886', '07 488', '1989-10-07', 'Veuf(ve)', 'Masculin', 1, 'christelleroussel@univ-thies.sn', 'ahamon@tele2.fr', NULL, NULL, '06 40 53 12 50', '+33 (0)4 08 50 13 76', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(804, 4, NULL, 1, 185, 2, 'Susan', 'Dumont', '1982-09-29', 'Legendre-la-Forêt', 'FR318566648377RF703336Y5P64', '97536', '51 234', '2015-01-12', 'Veuf(ve)', 'Masculin', 0, 'laurehernandez@univ-thies.sn', 'thibault50@maurice.net', NULL, NULL, '0815629556', '+33 (0)8 95 17 97 11', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(805, 1, NULL, 1, 242, 2, 'Patrick', 'Carpentier', '1995-04-11', 'Guillot-les-Bains', 'FR0769898078074H8CBYA1PKL96', '11 775', '76 527', '1993-07-14', 'Marié(e)', 'Masculin', 0, 'louismoulin@univ-thies.sn', 'michel.pruvost@alves.org', NULL, NULL, '0477481267', '01 04 22 79 07', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(806, 5, NULL, 1, 236, 1, 'Élodie', 'Joseph', '1974-03-11', 'Marechal', 'FR294028621983E92YF422NCU03', '47 588', '34 092', '1972-07-21', 'Célibataire', 'Féminin', 0, 'jean-arthurboulanger@univ-thies.sn', 'alabbe@reynaud.com', NULL, NULL, '01 24 82 61 28', '+33 (0)5 18 46 97 89', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(807, 5, NULL, 1, 24, 1, 'Frédéric', 'Guillon', '2001-07-21', 'LelievreVille', 'FR6537088568004420HDJ1QM484', '24363', '50612', '2011-06-13', 'Célibataire', 'Féminin', 0, '', 'couturier.marcelle@ifrance.com', NULL, NULL, '+33 1 30 12 56 61', '+33 (0)8 26 25 47 08', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(808, 4, NULL, 1, 211, 2, 'Margaux', 'Hamon', '2003-03-21', 'Parent-la-Forêt', 'FR494139972195D07IKVZ183683', '15 844', '85 255', '2005-11-13', 'Célibataire', 'Féminin', 0, 'thomasrobin@univ-thies.sn', 'bbuisson@moreau.com', NULL, NULL, '+33 (0)5 41 06 96 29', '+33 (0)7 41 19 78 88', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(809, 5, NULL, 1, 138, 2, 'Dominique', 'Lenoir', '2009-01-10', 'Martinez', 'FR370702355796Z6VM4J44K0813', '12 037', '11952', '1971-01-07', 'Célibataire', 'Féminin', 1, 'yvesroger@univ-thies.sn', 'josephine22@laposte.net', NULL, NULL, '0316003934', '0550334622', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(810, 5, NULL, 1, 53, 2, 'Gabriel', 'Dupre', '2005-05-14', 'Courtois', 'FR208626370766F5OX66TUT0593', '22 465', '59972', '1974-06-19', 'Divorcé(e)', 'Masculin', 1, 'sophieboulanger@univ-thies.sn', 'adele33@gosselin.fr', NULL, NULL, '0562335446', '0991437903', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(811, 5, NULL, 1, 120, 4, 'Alix', 'Bernard', '2001-01-07', 'Gerardnec', 'FR401702753930522AXN5R13Y07', '38020', '89 396', '1976-01-23', 'Marié(e)', 'Masculin', 1, 'fr', 'louise89@wanadoo.fr', NULL, NULL, '01 70 39 64 72', '0753597604', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(812, 1, NULL, 1, 74, 4, 'Maryse', 'Pages', '2016-09-29', 'BodinBourg', 'FR961558766657A2788MS840E58', '42415', '14 931', '2010-10-11', 'Marié(e)', 'Féminin', 0, 'c', 'leclerc.dominique@bouchet.fr', NULL, NULL, '05 61 95 34 17', '+33 (0)1 21 05 68 96', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(813, 1, NULL, 1, 131, 3, 'Roger', 'Fouquet', '1983-07-27', 'Leroy', 'FR632858479207HJ08U44XNIT37', '41 780', '68 307', '1974-05-23', 'Veuf(ve)', 'Masculin', 0, 'oc', 'jpasquier@ifrance.com', NULL, NULL, '01 72 22 97 18', '04 74 13 59 36', 8, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(814, 4, NULL, 1, 49, 4, 'Laetitia', 'Clement', '1977-12-22', 'Gautier-sur-Prevost', 'FR25385233859675148G569IU29', '29645', '75 429', '2010-01-12', 'Veuf(ve)', 'Féminin', 1, 'hortenseprevost@univ-thies.sn', 'laurent65@hotmail.fr', NULL, NULL, '+33 3 64 94 58 99', '+33 8 98 40 92 36', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(815, 4, NULL, 1, 1, 2, 'Marie', 'Parent', '2014-11-07', 'Cousin', 'FR51260203308746B98U4R39196', '64464', '14891', '2006-08-29', 'Veuf(ve)', 'Masculin', 0, 'yvesbouvier@univ-thies.sn', 'ulelievre@benard.fr', NULL, NULL, '0155400733', '+33 4 08 95 28 49', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(816, 4, NULL, 1, 116, 4, 'Hugues', 'Teixeira', '1985-04-28', 'Gonzalez', 'FR612430669171956G741CYP914', '11098', '47340', '2014-08-06', 'Marié(e)', 'Féminin', 1, 'dominiqueblin@univ-thies.sn', 'masson.emile@bertin.org', NULL, NULL, '06 48 18 34 66', '+33 (0)7 31 06 92 84', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(817, 5, NULL, 1, 121, 1, 'Nicolas', 'Remy', '2012-03-28', 'Guilbert', 'FR8754897248667BFQK782IMW42', '75331', '24288', '2011-12-23', 'Célibataire', 'Masculin', 1, 'r', 'fgallet@marques.fr', NULL, NULL, '+33 8 99 67 49 77', '0246284309', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(818, 5, NULL, 1, 28, 1, 'Marcelle', 'Marchand', '1985-06-17', 'Clement', 'FR1297487061308J9L1R047R285', '75870', '94414', '1975-02-13', 'Divorcé(e)', 'Masculin', 0, 'paulinepages@univ-thies.sn', 'madeleine.lambert@bouvet.com', NULL, NULL, '05 98 87 46 32', '0369591483', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(819, 4, NULL, 1, 136, 1, 'Camille', 'Gallet', '2000-08-16', 'Leroux', 'FR3276265943091762RQ7CXR420', '69334', '35082', '1975-04-13', 'Divorcé(e)', 'Masculin', 0, 'ren', 'elodie14@clerc.fr', NULL, NULL, '09 63 00 55 55', '0777062314', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(820, 1, NULL, 1, 199, 4, 'Margaud', 'Fournier', '1982-05-07', 'Reynaudnec', 'FR025971675998NFY9580F9G844', '81947', '90 757', '1996-10-28', 'Célibataire', 'Masculin', 1, '', 'clerc.nicolas@ifrance.com', NULL, NULL, '+33 (0)1 66 57 24 75', '+33 2 11 35 31 96', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(821, 1, NULL, 1, 204, 3, 'Jeannine', 'Gilbert', '2012-01-12', 'Normanddan', 'FR808861327716D6N2169K96R33', '76 285', '43150', '2012-12-04', 'Veuf(ve)', 'Masculin', 0, 'aim', 'giraud.theodore@guillaume.net', NULL, NULL, '+33 (0)1 09 41 25 20', '+33 (0)8 06 07 54 52', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(822, 1, NULL, 1, 94, 2, 'Virginie', 'Bonnin', '2003-12-08', 'Clerc-les-Bains', 'FR5449141975503AWXUZ3U87A52', '04346', '11 664', '2000-07-17', 'Marié(e)', 'Féminin', 0, 'ren', 'gauthier.thibaut@ifrance.com', NULL, NULL, '0188767027', '04 07 32 93 33', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(823, 5, NULL, 1, 43, 2, 'Frédéric', 'Morvan', '2007-04-22', 'Pelletier', 'FR739088313562756056A85RJ89', '31944', '14586', '1971-07-13', 'Divorcé(e)', 'Masculin', 1, '', 'elegendre@bouchet.com', NULL, NULL, '0660709183', '+33 (0)8 07 93 83 45', 1, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(824, 1, NULL, 1, 72, 4, 'Anastasie', 'Roussel', '1979-09-11', 'Nicolas', 'FR741525446943G9UPNH85E1537', '74821', '84167', '1970-11-20', 'Marié(e)', 'Féminin', 1, 'isaacsamson@univ-thies.sn', 'valerie71@wanadoo.fr', NULL, NULL, '+33 1 79 65 37 78', '+33 6 96 00 95 16', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(825, 5, NULL, 1, 141, 4, 'Jules', 'Marie', '2015-12-08', 'PineauVille', 'FR068450878402E44Y649P98T43', '70 003', '03 784', '1987-02-04', 'Célibataire', 'Féminin', 0, 'jacquespascal@univ-thies.sn', 'lbriand@bousquet.fr', NULL, NULL, '+33 1 48 88 37 74', '0306723283', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(826, 1, NULL, 1, 120, 1, 'Émile', 'Nguyen', '1993-05-03', 'Martin-la-Forêt', 'FR0558794136388S2H916T2VI26', '76 697', '36753', '1983-05-14', 'Veuf(ve)', 'Masculin', 1, 'daviddiaz@univ-thies.sn', 'yhamel@weber.org', NULL, NULL, '0605747194', '+33 3 67 60 64 33', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(827, 5, NULL, 1, 46, 1, 'William', 'Ferreira', '1975-04-08', 'Guichard', 'FR444459946535P5Z20735Y0L58', '20 047', '44915', '1977-08-02', 'Divorcé(e)', 'Féminin', 0, 'hortensegirard-gay@univ-thies.sn', 'antoinette.godard@yahoo.fr', NULL, NULL, '+33 2 83 89 94 17', '+33 5 18 09 13 73', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(828, 1, NULL, 1, 214, 4, 'Laurence', 'Blot', '2004-06-13', 'Laurent', 'FR917303486449S7NX7J63TL773', '99 323', '03 426', '1974-03-01', 'Marié(e)', 'Féminin', 1, 'emmanuelleduollivier@univ-thies.sn', 'josephine.noel@gmail.com', NULL, NULL, '08 09 52 01 41', '+33 (0)9 33 28 05 32', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(829, 1, NULL, 1, 140, 2, 'Thibault', 'Daniel', '2016-01-06', 'ValletVille', 'FR1202166225427V19GK738HL96', '70 345', '42 028', '2001-02-21', 'Veuf(ve)', 'Masculin', 0, 'lucepaul@univ-thies.sn', 'goncalves.martine@riviere.fr', NULL, NULL, '01 64 10 87 32', '0308823968', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(830, 1, NULL, 1, 15, 3, 'Jeanne', 'Chevallier', '1994-05-18', 'Joubert', 'FR109891741701411GHM2PFO452', '73 267', '82720', '1980-07-31', 'Divorcé(e)', 'Féminin', 0, 'susandupotier@univ-thies.sn', 'berger.adele@perrot.com', NULL, NULL, '0477183179', '0250663787', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(831, 5, NULL, 1, 7, 3, 'Marguerite', 'Boucher', '1991-04-08', 'Muller', 'FR846462764193766B45358DQ33', '66077', '05010', '2006-04-09', 'Célibataire', 'Féminin', 1, 'julienlegiraud@univ-thies.sn', 'pierre.verdier@jean.fr', NULL, NULL, '+33 (0)1 56 85 45 86', '0933851400', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(832, 1, NULL, 1, 212, 2, 'Sébastien', 'Buisson', '2006-04-15', 'Guillaumedan', 'FR3619711720089E40IQ05ASM28', '99159', '10 542', '2013-12-09', 'Célibataire', 'Féminin', 0, 'deniselevasseur@univ-thies.sn', 'denis.perez@free.fr', NULL, NULL, '0138838510', '04 31 43 75 02', 7, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(833, 1, NULL, 1, 72, 2, 'Lucie', 'Pruvost', '1986-07-28', 'Samson', 'FR3418773277213PJ457F5S3523', '02 668', '53 823', '1993-04-05', 'Veuf(ve)', 'Masculin', 0, 'arnaudelebrun@univ-thies.sn', 'lucie65@delorme.org', NULL, NULL, '+33 1 39 57 14 98', '03 95 96 44 24', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(834, 5, NULL, 1, 65, 1, 'Bernadette', 'Sanchez', '1995-11-09', 'Wagner', 'FR239202667311D3SF704V16442', '91 917', '54279', '2009-07-22', 'Veuf(ve)', 'Féminin', 0, 'paulinelopes@univ-thies.sn', 'caroline.noel@guillon.net', NULL, NULL, '+33 (0)6 54 65 50 53', '03 77 61 59 90', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(835, 1, NULL, 1, 103, 2, 'Daniel', 'Paris', '1976-08-26', 'Mathieu', 'FR273380782562WJG3218NW9H17', '90501', '57 673', '1997-05-21', 'Veuf(ve)', 'Masculin', 0, 'capucinemartinez@univ-thies.sn', 'roche.camille@live.com', NULL, NULL, '+33 4 91 53 10 16', '04 17 81 44 83', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(836, 5, NULL, 1, 161, 2, 'Chantal', 'Michaud', '2004-02-03', 'Valleenec', 'FR0298177910756MV96X2P8O507', '55 161', '37 052', '2002-10-23', 'Célibataire', 'Féminin', 0, 'antoineweber@univ-thies.sn', 'anais.humbert@tele2.fr', NULL, NULL, '06 79 74 28 88', '03 57 87 88 84', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(837, 1, NULL, 1, 21, 1, 'Amélie', 'Didier', '2013-10-04', 'Dupuis', 'FR589374932226L58MGO3L8L398', '96068', '32786', '1993-12-07', 'Célibataire', 'Masculin', 0, 'ren', 'jerome.marques@levy.com', NULL, NULL, '+33 8 02 29 31 55', '0263849814', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(838, 1, NULL, 1, 109, 3, 'Michel', 'Seguin', '1999-04-16', 'Martinnec', 'FR761097077299P318YBH35LO52', '04 759', '68953', '2008-03-21', 'Veuf(ve)', 'Féminin', 0, 'paulduguibert@univ-thies.sn', 'maillot.therese@renard.fr', NULL, NULL, '01 23 37 74 80', '09 60 20 34 68', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(839, 4, NULL, 1, 166, 3, 'Manon', 'Joubert', '1970-07-10', 'Jourdan-la-Forêt', 'FR684649099008Y1CQ683555834', '33 384', '17145', '2005-07-27', 'Marié(e)', 'Masculin', 1, 'timoth', 'timothee25@wanadoo.fr', NULL, NULL, '+33 (0)6 96 88 48 96', '08 09 96 48 81', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(840, 5, NULL, 1, 99, 4, 'Julie', 'Adam', '2014-08-07', 'Garciadan', 'FR2092790381969Z35FEK3Z8583', '21 936', '23 324', '1989-03-25', 'Célibataire', 'Masculin', 0, 'guylegros@univ-thies.sn', 'becker.laurence@noos.fr', NULL, NULL, '+33 6 35 59 92 80', '0597964424', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(841, 1, NULL, 1, 184, 2, 'Olivie', 'Lemoine', '2009-08-23', 'Normand', 'FR622189439788699RY65120948', '92 171', '00769', '1993-01-31', 'Marié(e)', 'Masculin', 0, 'marcelpotier@univ-thies.sn', 'ujean@voila.fr', NULL, NULL, '+33 5 60 35 04 30', '05 21 28 51 96', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(842, 4, NULL, 1, 234, 2, 'Benjamin', 'Leroy', '2013-07-21', 'Sanchez', 'FR830743010978PJ497Q0ZYA959', '30 580', '60853', '2009-06-04', 'Veuf(ve)', 'Masculin', 0, 'yvesclerc@univ-thies.sn', 'dijoux.laurent@hotmail.fr', NULL, NULL, '+33 9 29 86 65 93', '09 33 33 18 11', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(843, 1, NULL, 1, 43, 1, 'Alexandre', 'Philippe', '1972-12-03', 'Chevallier', 'FR7509362960225V2RV88T1Z227', '48883', '57082', '1976-02-27', 'Marié(e)', 'Féminin', 0, 'jacquelinedufour@univ-thies.sn', 'ibuisson@sanchez.net', NULL, NULL, '01 83 07 52 80', '0148811880', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(844, 1, NULL, 1, 180, 3, 'Benoît', 'Martinez', '1983-08-17', 'Baudry-la-Forêt', 'FR192708185660F6M7S8432GB51', '05989', '16503', '1975-11-25', 'Marié(e)', 'Masculin', 0, 'tristanroux@univ-thies.sn', 'mvalette@vallee.com', NULL, NULL, '+33 (0)2 11 83 57 03', '01 98 33 42 63', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(845, 4, NULL, 1, 68, 2, 'Gilles', 'Germain', '1972-05-30', 'Bousquet', 'FR6181355529660D3R1UFJ9NF54', '48 082', '25239', '2003-11-27', 'Divorcé(e)', 'Féminin', 1, 'raymondparis@univ-thies.sn', 'emmanuel31@bouvet.org', NULL, NULL, '+33 (0)7 73 41 38 21', '+33 8 11 23 77 69', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(846, 5, NULL, 1, 209, 2, 'Philippe', 'Chevallier', '1981-01-28', 'Garcia', 'FR81683513009146QYUW9959X36', '24164', '21 905', '1992-02-21', 'Célibataire', 'Masculin', 0, 'marcelledelahaye@univ-thies.sn', 'pierre37@yahoo.fr', NULL, NULL, '+33 (0)6 68 18 47 79', '+33 1 61 63 05 56', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(847, 5, NULL, 1, 184, 4, 'Louis', 'Delannoy', '1985-11-24', 'VoisinVille', 'FR250466601786HSF61JI013619', '20 585', '34477', '1989-03-21', 'Célibataire', 'Féminin', 1, 'oliviedupuis@univ-thies.sn', 'nicolas.noel@delattre.fr', NULL, NULL, '0826746252', '01 95 02 89 83', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(848, 1, NULL, 1, 225, 1, 'Danielle', 'Delorme', '2019-08-09', 'Prevost', 'FR428339880894DS6C3TJC70338', '15811', '23 019', '2009-12-17', 'Veuf(ve)', 'Masculin', 1, 'alexandreblin@univ-thies.sn', 'nath.dupont@michel.org', NULL, NULL, '+33 1 58 44 14 03', '05 47 30 75 84', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(849, 1, NULL, 1, 194, 4, 'William', 'Valette', '2004-11-13', 'Deschampsdan', 'FR842397870512G0C50L94V0Q71', '55972', '54 745', '2021-01-06', 'Veuf(ve)', 'Masculin', 0, 'margaret-', 'franck87@gmail.com', NULL, NULL, '03 72 30 96 75', '+33 1 21 89 43 96', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(850, 5, NULL, 1, 29, 1, 'Tristan', 'Mary', '1994-08-27', 'Delorme-sur-Hebert', 'FR80120564354600J3UXC539441', '97 878', '78105', '1985-06-11', 'Divorcé(e)', 'Féminin', 0, 'fran', 'evrard.laetitia@delannoy.fr', NULL, NULL, '04 14 25 52 01', '+33 5 85 37 44 17', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(851, 5, NULL, 1, 53, 2, 'Vincent', 'Menard', '1993-07-16', 'Duhamel-les-Bains', 'FR18661229101564BN4D41A5418', '57382', '09602', '1988-01-27', 'Marié(e)', 'Masculin', 1, 'yvesalves@univ-thies.sn', 'michelle.couturier@diaz.com', NULL, NULL, '+33 (0)3 30 78 46 64', '+33 (0)5 52 30 64 75', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(852, 4, NULL, 1, 102, 4, 'Philippine', 'Guerin', '2017-11-06', 'BlinVille', 'FR360753583570092OP6442Q142', '45 608', '66 640', '1985-03-20', 'Divorcé(e)', 'Masculin', 1, 'louisgermain@univ-thies.sn', 'thibault10@gomes.com', NULL, NULL, '+33 8 12 91 31 89', '+33 1 08 61 36 75', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(853, 5, NULL, 1, 110, 2, 'Louise', 'Vallee', '1974-04-12', 'Lemonnier-sur-Lucas', 'FR280293526011JCJ8J876E1165', '04 247', '24190', '2011-07-15', 'Veuf(ve)', 'Féminin', 0, 'nicolas-robertschneider@univ-thies.sn', 'tristan69@sfr.fr', NULL, NULL, '0326274082', '+33 (0)2 65 77 63 96', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(854, 1, NULL, 1, 241, 4, 'Adèle', 'Maillot', '1977-02-07', 'Poirier', 'FR789897660170HC3V2FKNM4E47', '40 344', '56339', '2013-07-10', 'Veuf(ve)', 'Masculin', 0, 'thomaslegrand@univ-thies.sn', 'celina68@roger.fr', NULL, NULL, '+33 (0)8 20 57 94 73', '+33 1 77 11 09 82', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(855, 1, NULL, 1, 181, 4, 'Léon', 'Gosselin', '2014-02-14', 'Hubert', 'FR312665165462235777IF6ZP41', '39282', '28817', '1994-07-24', 'Divorcé(e)', 'Masculin', 1, 'victorrousset@univ-thies.sn', 'fournier.helene@legoff.com', NULL, NULL, '+33 9 98 37 73 35', '08 11 69 86 36', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(856, 5, NULL, 1, 35, 4, 'Nathalie', 'Fournier', '2019-11-22', 'Fournier-la-Forêt', 'FR3895014160637K60KO671J510', '55920', '63 740', '1984-09-21', 'Veuf(ve)', 'Féminin', 0, 'mauricedelafischer@univ-thies.sn', 'besson.josette@orange.fr', NULL, NULL, '+33 6 41 25 01 28', '0636070262', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(857, 4, NULL, 1, 34, 4, 'Caroline', 'Bigot', '1970-01-11', 'Lefortdan', 'FR9405492253008326367ES8852', '41716', '49 890', '2014-11-07', 'Marié(e)', 'Féminin', 0, '', 'nath44@hotmail.fr', NULL, NULL, '03 69 14 56 00', '+33 (0)3 71 97 18 21', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(858, 5, NULL, 1, 79, 2, 'Jeannine', 'Lagarde', '2003-06-03', 'Petitjean', 'FR93530024355567R4OOIO24706', '89 285', '18 489', '1990-07-09', 'Célibataire', 'Masculin', 0, '', 'honore33@laposte.net', NULL, NULL, '+33 6 84 57 85 77', '+33 1 89 34 67 48', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(859, 1, NULL, 1, 177, 2, 'Thomas', 'Martin', '2010-04-08', 'Lopez-sur-Tessier', 'FR898987652314YC42Z3XI9SW93', '59 242', '47568', '1998-12-30', 'Veuf(ve)', 'Masculin', 1, 'marcmarie@univ-thies.sn', 'arthur81@wagner.fr', NULL, NULL, '01 06 30 49 14', '0747453851', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(860, 5, NULL, 1, 219, 1, 'Thibaut', 'Jacquet', '2015-04-20', 'Dupont-sur-Pierre', 'FR40189268534017P4MD0U1CZ34', '87 401', '24 635', '2005-07-01', 'Marié(e)', 'Masculin', 1, 'xavierdelalecomte@univ-thies.sn', 'zaubry@normand.fr', NULL, NULL, '0512972024', '+33 (0)1 55 30 20 46', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(861, 5, NULL, 1, 109, 1, 'Roger', 'Raynaud', '2003-07-26', 'Lelievre', 'FR0785942569674104NQ0U86163', '67 148', '52383', '2008-10-04', 'Célibataire', 'Féminin', 0, 'j', 'hugues19@free.fr', NULL, NULL, '0544160614', '08 99 85 20 78', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(862, 1, NULL, 1, 132, 3, 'Julie', 'Raynaud', '2018-10-26', 'Blanchet', 'FR78562002747935QS504WVNS06', '96380', '41198', '2002-02-07', 'Marié(e)', 'Féminin', 1, '', 'augustin57@potier.com', NULL, NULL, '+33 1 28 29 87 29', '+33 5 48 66 72 12', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(863, 1, NULL, 1, 194, 1, 'Aurore', 'Lemonnier', '2003-06-06', 'Gomes-sur-Faure', 'FR2678763829254711EH76U1T87', '01186', '51 233', '1977-09-13', 'Marié(e)', 'Masculin', 1, 'c', 'guillaume13@lacroix.org', NULL, NULL, '+33 7 91 43 40 65', '+33 8 97 88 16 71', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(864, 1, NULL, 1, 148, 3, 'Claudine', 'Leroux', '2014-08-09', 'Lainenec', 'FR5701992641088471ZXCQW4Y24', '93085', '94876', '2004-04-15', 'Veuf(ve)', 'Masculin', 0, 'tristancoulon-duhamel@univ-thies.sn', 'riviere.camille@klein.fr', NULL, NULL, '+33 9 63 99 51 62', '08 99 03 21 95', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(865, 5, NULL, 1, 90, 4, 'Raymond', 'Cousin', '1990-03-26', 'BodinVille', 'FR161430032914837Z1503P4180', '75270', '38057', '1988-01-14', 'Célibataire', 'Féminin', 1, '', 'hugues.pereira@free.fr', NULL, NULL, '0552718106', '+33 (0)1 75 63 80 73', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(866, 5, NULL, 1, 166, 3, 'Patrick', 'Pages', '2014-06-11', 'Vaillantdan', 'FR443200650073H84WPWJHVRE46', '87 226', '47 004', '1984-12-12', 'Célibataire', 'Féminin', 0, 'emmanueldebouchet@univ-thies.sn', 'juliette18@arnaud.fr', NULL, NULL, '04 20 58 01 36', '01 91 53 44 19', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(867, 1, NULL, 1, 14, 2, 'Alex', 'Le Goff', '2015-08-01', 'Boulay', 'FR966468731205B3X41DV69VW71', '68308', '92 508', '1993-03-01', 'Divorcé(e)', 'Féminin', 0, 'isaacclerc@univ-thies.sn', 'kperrot@live.com', NULL, NULL, '+33 7 99 29 35 84', '03 03 14 11 27', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(868, 1, NULL, 1, 149, 4, 'Adrienne', 'Gillet', '2009-04-06', 'RibeiroVille', 'FR211375090401AUFD2FD458258', '84 657', '00 865', '2020-01-12', 'Veuf(ve)', 'Masculin', 0, '', 'arnaud.nicole@torres.fr', NULL, NULL, '+33 (0)1 61 58 79 05', '+33 (0)6 00 82 59 64', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(869, 5, NULL, 1, 68, 3, 'Émile', 'Voisin', '2010-05-01', 'Maillet', 'FR710303606212QLH95V40HXC90', '04 087', '54 653', '1978-09-29', 'Veuf(ve)', 'Féminin', 0, 'sophiedebruneau@univ-thies.sn', 'fabre.constance@hotmail.fr', NULL, NULL, '0167735772', '08 10 93 66 87', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(870, 4, NULL, 1, 72, 3, 'Robert', 'Peltier', '1981-10-12', 'Diaz', 'FR86254763953891E1332D57388', '31172', '02730', '2005-02-05', 'Marié(e)', 'Féminin', 1, 'p', 'leduc.rene@reynaud.com', NULL, NULL, '0761944779', '05 23 13 64 63', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(871, 5, NULL, 1, 8, 1, 'Nathalie', 'Legendre', '2020-06-15', 'Barrenec', 'FR38198776046533384LM7A0895', '64 584', '83 258', '1974-05-30', 'Marié(e)', 'Féminin', 0, 'chantalgerard@univ-thies.sn', 'thomas.germain@orange.fr', NULL, NULL, '+33 (0)5 12 62 37 71', '+33 (0)9 73 49 50 12', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(872, 1, NULL, 1, 79, 1, 'Olivie', 'Sauvage', '1998-08-01', 'Brunetboeuf', 'FR438152718182016IOJAXK8K75', '60433', '53451', '1991-06-10', 'Marié(e)', 'Masculin', 1, 'patrickgodard@univ-thies.sn', 'lucie.mendes@yahoo.fr', NULL, NULL, '+33 (0)9 87 60 68 75', '03 59 87 48 14', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(873, 5, NULL, 1, 36, 3, 'Édouard', 'Joubert', '2014-12-07', 'Gregoire-la-Forêt', 'FR664814995093610022T803398', '13 448', '58 399', '1985-04-21', 'Veuf(ve)', 'Masculin', 1, 'alainweiss@univ-thies.sn', 'colin.alain@free.fr', NULL, NULL, '+33 1 66 20 47 46', '+33 (0)3 22 18 65 93', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(874, 4, NULL, 1, 178, 3, 'Éric', 'Leclercq', '2019-07-02', 'Dupont-sur-Julien', 'FR901676323051E6V9726R7W813', '54 688', '07141', '1989-10-12', 'Célibataire', 'Féminin', 1, 'aim', 'tdumas@ifrance.com', NULL, NULL, '0196821633', '05 20 44 16 33', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(875, 4, NULL, 1, 126, 4, 'Gilles', 'Colas', '1983-02-02', 'Perrier-sur-Mer', 'FR154737088248685E888R34335', '38853', '96 201', '2004-02-15', 'Marié(e)', 'Féminin', 0, 'danielmoreno@univ-thies.sn', 'legoff.valerie@hotmail.fr', NULL, NULL, '+33 3 97 08 19 41', '0895440086', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(876, 4, NULL, 1, 64, 3, 'Olivier', 'Bouvet', '1990-03-31', 'Bouvet', 'FR392771409587O6ZPW930B1D53', '77 452', '10636', '2011-09-22', 'Célibataire', 'Féminin', 1, 'simonegarcia@univ-thies.sn', 'alphonse20@millet.com', NULL, NULL, '+33 (0)4 93 62 71 65', '05 56 82 65 18', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(877, 5, NULL, 1, 74, 3, 'Michel', 'Alexandre', '1977-02-18', 'Masse', 'FR701331739870G8G88A5G5BP90', '35424', '23565', '2007-12-16', 'Divorcé(e)', 'Féminin', 1, 'xaviermartel@univ-thies.sn', 'penelope.normand@gillet.org', NULL, NULL, '+33 4 12 88 00 41', '01 38 67 51 42', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(878, 1, NULL, 1, 16, 3, 'Élodie', 'Fontaine', '1991-07-16', 'Coulon-la-Forêt', 'FR2612850545224L9GPA8OUNK56', '72 081', '19088', '2020-10-05', 'Marié(e)', 'Féminin', 1, 'rogersauvage@univ-thies.sn', 'gilbert.fernandes@bouygtel.fr', NULL, NULL, '0141713428', '0776448458', 7, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(879, 1, NULL, 1, 232, 1, 'Xavier', 'Lefort', '1980-01-26', 'Joubert', 'FR923779250626B9H5U8GYOS347', '27169', '81 167', '1998-06-17', 'Veuf(ve)', 'Féminin', 1, 'louisdesousa@univ-thies.sn', 'henry.suzanne@tiscali.fr', NULL, NULL, '+33 8 06 30 72 38', '+33 (0)7 50 81 75 07', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(880, 1, NULL, 1, 113, 3, 'Laure', 'Royer', '1998-12-06', 'Leveque-sur-Da Costa', 'FR1063604799152L3MR8MUDQW38', '03 831', '43 576', '1993-06-24', 'Divorcé(e)', 'Féminin', 1, 'isabellemahe@univ-thies.sn', 'gerard74@voila.fr', NULL, NULL, '0656950641', '07 56 30 48 60', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(881, 4, NULL, 1, 164, 4, 'Arnaude', 'Girard', '2021-04-05', 'Dupontboeuf', 'FR755986683496R24VR5EAN3074', '88959', '56 001', '1984-07-01', 'Veuf(ve)', 'Féminin', 1, 'nathaliemartinez@univ-thies.sn', 'marcel.michel@yahoo.fr', NULL, NULL, '+33 4 20 12 02 39', '+33 (0)9 53 24 77 33', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(882, 1, NULL, 1, 126, 2, 'Guy', 'Da Silva', '2000-02-16', 'Bretonnec', 'FR203497820296KI4KN049Z6362', '42653', '64164', '2003-03-05', 'Veuf(ve)', 'Féminin', 1, 'r', 'colas.aurelie@lacroix.fr', NULL, NULL, '+33 8 95 97 72 15', '+33 3 06 36 71 74', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(883, 4, NULL, 1, 39, 2, 'Richard', 'Fontaine', '1979-06-30', 'Brunel', 'FR816874253462D13F1CFFQIE57', '65 718', '76 098', '1995-09-05', 'Divorcé(e)', 'Masculin', 1, 'gabriellemarie@univ-thies.sn', 'patricia36@sfr.fr', NULL, NULL, '0499525237', '+33 9 31 71 34 57', 6, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(884, 1, NULL, 1, 73, 4, 'Stéphanie', 'Valette', '2019-05-13', 'Bousquetnec', 'FR864713231599T64QLQ428XC07', '81626', '29096', '1994-12-17', 'Marié(e)', 'Féminin', 1, 'hortenselemaitre@univ-thies.sn', 'jacqueline77@gmail.com', NULL, NULL, '0107145099', '01 13 24 41 11', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(885, 4, NULL, 1, 48, 1, 'Andrée', 'Leclercq', '1982-06-29', 'Cousin', 'FR4901110089028EFHM43E03992', '57 860', '77 414', '1981-01-23', 'Divorcé(e)', 'Féminin', 0, 'in', 'jean.jourdan@charrier.fr', NULL, NULL, '07 83 94 62 05', '0269122116', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(886, 1, NULL, 1, 207, 1, 'Alphonse', 'Chretien', '1987-08-26', 'AugerBourg', 'FR11850716734264M4WXF3F8K51', '98 128', '88674', '2004-09-10', 'Marié(e)', 'Masculin', 0, 'st', 'chauveau.astrid@bigot.com', NULL, NULL, '01 40 28 93 38', '+33 (0)3 07 49 69 47', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(887, 5, NULL, 1, 58, 4, 'Anaïs', 'Valette', '1992-01-21', 'Mathieu', 'FR807175298352IM809L0CE5500', '62 389', '54 928', '1994-04-03', 'Célibataire', 'Masculin', 1, 'zo', 'olivier.lecoq@benoit.fr', NULL, NULL, '+33 3 43 25 71 86', '+33 (0)3 77 95 01 80', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(888, 4, NULL, 1, 6, 4, 'Emmanuel', 'Gay', '1996-05-04', 'MorvanBourg', 'FR640896105260N9SOI4825K673', '41 202', '21 809', '1997-10-04', 'Célibataire', 'Féminin', 1, 'juliette-fran', 'caron.pauline@roussel.org', NULL, NULL, '+33 (0)8 23 91 44 66', '03 50 88 90 78', 6, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(889, 4, NULL, 1, 199, 4, 'Tristan', 'Peltier', '1986-02-04', 'EvrardVille', 'FR934441692768TGB82E71X0165', '81 075', '25986', '2013-12-05', 'Veuf(ve)', 'Féminin', 0, 'nathalielegrand@univ-thies.sn', 'foucher.marthe@tele2.fr', NULL, NULL, '0826576069', '04 42 12 53 83', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(890, 4, NULL, 1, 180, 4, 'Gabriel', 'Didier', '1985-08-23', 'Bousquet', 'FR7467331532103Y6G56556II97', '31771', '82012', '2016-02-21', 'Divorcé(e)', 'Féminin', 0, 'michelgirard@univ-thies.sn', 'parent.gilles@free.fr', NULL, NULL, '+33 3 40 46 81 08', '+33 3 43 87 85 70', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(891, 1, NULL, 1, 11, 1, 'Léon', 'Weber', '2016-11-24', 'Fernandez', 'FR650265397369298OM18G1KW76', '33179', '98521', '2019-03-05', 'Divorcé(e)', 'Féminin', 0, 'nathaliemoreno@univ-thies.sn', 'bernard.christophe@laposte.net', NULL, NULL, '+33 (0)4 26 49 16 32', '05 94 13 59 77', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(892, 4, NULL, 1, 129, 3, 'Bernadette', 'Legendre', '2002-06-04', 'Bruneaudan', 'FR1436647208684V19132AGF624', '52 143', '02 505', '1980-02-01', 'Divorcé(e)', 'Féminin', 0, 'odetteklein@univ-thies.sn', 'ecarre@lebreton.com', NULL, NULL, '+33 (0)7 66 45 28 17', '+33 (0)7 51 76 75 52', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(893, 5, NULL, 1, 215, 4, 'Véronique', 'Pichon', '2006-09-01', 'Pelletier-les-Bains', 'FR104365057666AK5LTM0MX8H55', '53 031', '19336', '2017-02-02', 'Veuf(ve)', 'Masculin', 1, 'arnaudecouturier@univ-thies.sn', 'nloiseau@bonneau.net', NULL, NULL, '07 98 49 63 78', '+33 (0)7 49 82 43 07', 2, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(894, 4, NULL, 1, 6, 4, 'Frédéric', 'Martin', '1988-06-16', 'Valette', 'FR313318259769HLKF5MS3LYQ32', '34371', '30960', '1985-05-08', 'Célibataire', 'Masculin', 1, 'christellefernandez@univ-thies.sn', 'eriviere@yahoo.fr', NULL, NULL, '+33 5 30 86 40 10', '01 67 86 52 69', 1, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(895, 1, NULL, 1, 79, 3, 'Camille', 'Bousquet', '1988-01-03', 'NguyenBourg', 'FR6878523730201JG8UT23NY473', '41 839', '59 528', '2011-04-26', 'Veuf(ve)', 'Féminin', 1, 'ad', 'nbrunet@bouygtel.fr', NULL, NULL, '+33 2 93 19 03 47', '07 60 08 10 23', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(896, 4, NULL, 1, 16, 2, 'Élisabeth', 'Gonzalez', '1978-12-31', 'Leroux', 'FR777353043832X1G179AGJSJ65', '09 060', '71167', '1986-08-29', 'Marié(e)', 'Féminin', 1, 'andr', 'penelope.valentin@bouygtel.fr', NULL, NULL, '06 58 11 42 79', '+33 1 62 19 01 81', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(897, 4, NULL, 1, 56, 4, 'Jacqueline', 'Vallet', '2006-02-17', 'Courtois', 'FR1844057891398C8JE50BH9R78', '56221', '66037', '2012-09-03', 'Divorcé(e)', 'Féminin', 1, 'patrickmaury@univ-thies.sn', 'luc.ruiz@david.com', NULL, NULL, '08 99 45 08 42', '08 98 76 94 27', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(898, 5, NULL, 1, 240, 2, 'Louis', 'Bazin', '2016-02-28', 'Picard-sur-Dumont', 'FR625866568356KWXVZK0R6Q985', '37 623', '63 866', '2003-05-06', 'Marié(e)', 'Masculin', 0, 'th', 'bigot.gregoire@michaud.fr', NULL, NULL, '+33 (0)2 59 66 08 50', '07 85 46 03 99', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(899, 5, NULL, 1, 103, 4, 'Laurent', 'Didier', '1989-06-11', 'Poirierboeuf', 'FR1258001358882RGC2XK7Q0Z72', '24 613', '00063', '1980-05-29', 'Veuf(ve)', 'Féminin', 1, 'lucasmonnier@univ-thies.sn', 'julie67@live.com', NULL, NULL, '09 88 83 85 63', '+33 9 34 79 21 32', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(900, 4, NULL, 1, 174, 2, 'Anaïs', 'Le Goff', '2005-03-02', 'DuvalVille', 'FR976142279668MC23073EH6Y12', '72948', '89101', '1996-11-01', 'Veuf(ve)', 'Masculin', 0, 'victoire-mathildepascal@univ-thies.sn', 'tjoubert@laposte.net', NULL, NULL, '0251186470', '0227463636', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(901, 5, NULL, 1, 141, 3, 'Dominique', 'Cohen', '2012-07-04', 'Ribeiroboeuf', 'FR5985225357253YX0862J72288', '64 726', '77 794', '1997-10-05', 'Veuf(ve)', 'Masculin', 1, 'daniellebourgeois@univ-thies.sn', 'auguste.barre@gmail.com', NULL, NULL, '0625558739', '0125152006', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(902, 1, NULL, 1, 167, 2, 'François', 'Voisin', '1982-03-18', 'David', 'FR121471075291658P312P1CJ83', '64447', '68 492', '1997-04-26', 'Divorcé(e)', 'Féminin', 0, 'franck-michellelievre@univ-thies.sn', 'thibault.lombard@sanchez.com', NULL, NULL, '+33 9 19 67 51 68', '+33 (0)5 69 00 60 49', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(903, 5, NULL, 1, 59, 2, 'Gilbert', 'Petit', '1971-12-16', 'Laine', 'FR243114228719112OP0Q42D200', '21 391', '83 169', '2006-08-02', 'Veuf(ve)', 'Féminin', 1, 'yveslebourdon@univ-thies.sn', 'kcharrier@live.com', NULL, NULL, '09 00 12 02 39', '0242564275', 5, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(904, 5, NULL, 1, 54, 4, 'Jacqueline', 'Couturier', '2020-09-02', 'Parisboeuf', 'FR466130569485HU95KX98Y4306', '06930', '90969', '2008-04-24', 'Marié(e)', 'Féminin', 0, 'madeleinealexandre@univ-thies.sn', 'chevallier.georges@lefort.com', NULL, NULL, '+33 (0)5 96 66 74 43', '0446793622', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(905, 4, NULL, 1, 227, 2, 'Benjamin', 'Chauveau', '1977-02-04', 'Hoareau-sur-Mer', 'FR45099585661659MXWF7CFC990', '83436', '95 691', '1981-04-16', 'Célibataire', 'Masculin', 0, 'hortenseweiss@univ-thies.sn', 'pierre.garnier@barbe.fr', NULL, NULL, '+33 1 40 85 91 62', '0266642876', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(906, 4, NULL, 1, 65, 1, 'Laetitia', 'Legros', '1976-09-25', 'Meunier-sur-Meyer', 'FR2982935469545WCL479E56804', '71213', '19 010', '1979-03-09', 'Veuf(ve)', 'Masculin', 0, 'thibaultweber@univ-thies.sn', 'dacosta.martin@dubois.net', NULL, NULL, '09 19 18 73 26', '04 79 35 82 59', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(907, 1, NULL, 1, 142, 4, 'Manon', 'Ramos', '1991-02-18', 'Guillou', 'FR024624286121728CN0T71A320', '65899', '30 370', '2006-07-18', 'Célibataire', 'Masculin', 0, 'margaret-laurencemorin@univ-thies.sn', 'rbegue@cordier.org', NULL, NULL, '0892700958', '+33 7 53 25 56 01', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(908, 5, NULL, 1, 154, 4, 'Virginie', 'Gimenez', '2011-07-17', 'Lagarde', 'FR139764372750J87UD52UCZP22', '75 579', '73 081', '1994-01-27', 'Divorcé(e)', 'Féminin', 0, 'williamvoisin@univ-thies.sn', 'robin.adrien@dbmail.com', NULL, NULL, '03 37 38 20 50', '0810646200', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(909, 1, NULL, 1, 235, 2, 'Joseph', 'Collin', '1997-12-26', 'Perrin', 'FR102741928311H1G3EU477L592', '26 437', '92 569', '1997-10-26', 'Veuf(ve)', 'Masculin', 1, 'susannechevallier@univ-thies.sn', 'timothee67@wanadoo.fr', NULL, NULL, '+33 (0)4 79 97 15 83', '0373684448', 8, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(910, 4, NULL, 1, 81, 2, 'Rémy', 'Laine', '1991-02-11', 'Delaunay-sur-Bonnin', 'FR4796495591770W1V5MSH01F53', '15944', '50374', '1971-01-25', 'Veuf(ve)', 'Masculin', 0, 'adrienne-laurenceblondel@univ-thies.sn', 'martine.teixeira@club-internet.fr', NULL, NULL, '02 43 22 81 72', '0677985517', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(911, 4, NULL, 1, 38, 1, 'Arthur', 'Guillot', '2019-07-31', 'Dubois', 'FR70461363043669641G5545069', '72496', '74039', '2011-10-18', 'Veuf(ve)', 'Féminin', 0, 'lucypelletier@univ-thies.sn', 'raymond56@benoit.com', NULL, NULL, '0753666239', '0740051360', 8, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(912, 1, NULL, 1, 89, 3, 'Robert', 'Lacroix', '2010-07-17', 'Gautier', 'FR53210215968454A3Z7I689I25', '91 851', '24333', '1988-07-31', 'Célibataire', 'Masculin', 0, 'josephdeschamps@univ-thies.sn', 'martin.arthur@lemaitre.com', NULL, NULL, '+33 (0)3 53 53 15 45', '09 59 71 55 67', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(913, 5, NULL, 1, 229, 3, 'Stéphanie', 'Foucher', '2015-05-14', 'Bernardboeuf', 'FR8147750603602R4460336M344', '92 219', '61 944', '2004-12-11', 'Marié(e)', 'Féminin', 0, 'raymondtraore@univ-thies.sn', 'zvasseur@simon.fr', NULL, NULL, '08 10 85 41 34', '0459414197', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(914, 4, NULL, 1, 141, 1, 'Rémy', 'Petitjean', '2006-04-08', 'Lecomte', 'FR768061795374DX9J16C6Z4S59', '35 811', '38628', '2020-04-25', 'Veuf(ve)', 'Masculin', 1, 'catherine-lucypoirier@univ-thies.sn', 'jerome.mallet@yahoo.fr', NULL, NULL, '0785859956', '+33 7 69 62 11 25', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(915, 4, NULL, 1, 79, 3, 'Georges', 'Michel', '1995-06-24', 'Raymonddan', 'FR040147790001097T9H4B02F14', '99 846', '42250', '1993-12-12', 'Marié(e)', 'Féminin', 0, 'marc-beno', 'imartel@tiscali.fr', NULL, NULL, '08 92 35 17 04', '06 70 46 40 32', 1, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(916, 4, NULL, 1, 205, 3, 'François', 'Munoz', '1974-10-03', 'De Oliveira-la-Forêt', 'FR757417740688SAP2R6774P326', '24737', '84056', '1980-09-21', 'Marié(e)', 'Féminin', 1, 'ana', 'stephane73@wanadoo.fr', NULL, NULL, '0535703652', '+33 4 58 42 99 00', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(917, 1, NULL, 1, 32, 3, 'Marguerite', 'Daniel', '1975-11-09', 'Hebert', 'FR4369215024258YQ0INHR6Z758', '52001', '48 153', '2017-11-15', 'Veuf(ve)', 'Féminin', 1, 'raymondmasson@univ-thies.sn', 'ines.huet@ifrance.com', NULL, NULL, '+33 (0)8 95 38 53 08', '+33 (0)6 20 69 17 81', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(918, 4, NULL, 1, 171, 1, 'Dominique', 'Begue', '2001-04-17', 'Gerard-sur-Gauthier', 'FR3849055549890XKI16FL21A65', '65 895', '99415', '1995-03-24', 'Marié(e)', 'Féminin', 1, 'laure-juliettelacroix@univ-thies.sn', 'cfleury@bouvet.org', NULL, NULL, '+33 (0)4 18 34 38 63', '0545168578', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(919, 1, NULL, 1, 237, 3, 'Alain', 'Hebert', '1991-06-20', 'Grondin', 'FR835013103540261P5A7DY3556', '90477', '16348', '2017-09-08', 'Célibataire', 'Masculin', 1, 'manonberthelot@univ-thies.sn', 'rocher.capucine@hotmail.fr', NULL, NULL, '0585926310', '+33 (0)3 88 24 65 87', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(920, 4, NULL, 1, 32, 4, 'Élodie', 'Carlier', '2014-07-19', 'Guerindan', 'FR809327109238650NM60AL0W39', '56100', '71482', '1982-06-15', 'Veuf(ve)', 'Féminin', 1, 'philippinejacques@univ-thies.sn', 'yleroy@free.fr', NULL, NULL, '03 98 17 55 11', '+33 (0)9 88 03 82 69', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(921, 4, NULL, 1, 146, 2, 'Tristan', 'Girard', '2019-11-21', 'Berthelot-sur-Antoine', 'FR760500206407KE949R5C01A90', '41933', '88136', '1999-09-22', 'Marié(e)', 'Féminin', 0, 'claudinededelmas@univ-thies.sn', 'christelle.mathieu@sfr.fr', NULL, NULL, '+33 7 54 97 78 24', '0132048870', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(922, 1, NULL, 1, 54, 4, 'Josette', 'Laporte', '1972-04-13', 'Herve-sur-Cousin', 'FR6936453752102S532SZ8W0393', '08650', '31 634', '1998-10-10', 'Veuf(ve)', 'Féminin', 1, 'alainguillou@univ-thies.sn', 'hortense.julien@voila.fr', NULL, NULL, '01 19 76 58 12', '+33 7 60 26 82 18', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(923, 5, NULL, 1, 29, 3, 'Noël', 'Hubert', '1971-12-01', 'Brunel', 'FR303996517752C90VW8D748A34', '18 670', '22 710', '1990-09-09', 'Veuf(ve)', 'Féminin', 0, 'augustinleger@univ-thies.sn', 'vmillet@reynaud.com', NULL, NULL, '+33 3 89 16 78 30', '+33 (0)7 95 15 44 28', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(924, 4, NULL, 1, 57, 2, 'Hugues', 'Costa', '2010-05-21', 'Benard-sur-Mer', 'FR5416223425154SMOJQE62U120', '10 918', '06314', '1984-08-22', 'Veuf(ve)', 'Masculin', 0, 's', 'fboulanger@ifrance.com', NULL, NULL, '0965655459', '+33 (0)2 57 29 26 80', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(925, 4, NULL, 1, 109, 3, 'Émile', 'Buisson', '1972-06-16', 'Lombard', 'FR322881499990SZOS734T97Y84', '85 989', '68954', '1987-05-25', 'Célibataire', 'Féminin', 0, 'h', 'marguerite50@hotmail.fr', NULL, NULL, '+33 (0)2 75 57 23 54', '0525389773', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(926, 1, NULL, 1, 211, 1, 'Bertrand', 'Gautier', '1985-10-28', 'Martineauboeuf', 'FR231042396129Y86FS264CHF63', '16 184', '97 776', '1984-07-05', 'Veuf(ve)', 'Masculin', 0, 'guyjacob@univ-thies.sn', 'marie45@bertrand.net', NULL, NULL, '+33 1 59 61 32 37', '0642473484', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(927, 1, NULL, 1, 242, 2, 'Robert', 'Henry', '1995-02-16', 'Francois', 'FR2587601963129CZ576708FH17', '17 132', '69074', '1984-04-19', 'Veuf(ve)', 'Masculin', 0, 'sophiemaillet@univ-thies.sn', 'roy.matthieu@gosselin.net', NULL, NULL, '0592341956', '0143619744', 5, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(928, 1, NULL, 1, 21, 4, 'Louise', 'Simon', '1999-10-04', 'Fabredan', 'FR1365110266479DQ5O2Q56EU48', '18 733', '64384', '2018-09-04', 'Veuf(ve)', 'Masculin', 1, 'gabrieljacob@univ-thies.sn', 'oboulay@tele2.fr', NULL, NULL, '02 86 93 87 15', '+33 1 10 77 53 61', 6, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(929, 1, NULL, 1, 22, 1, 'Nicolas', 'Labbe', '1981-06-20', 'Charles', 'FR0936525915835E0T829G04K83', '36424', '96630', '2004-06-07', 'Marié(e)', 'Féminin', 1, 'astridgilbert@univ-thies.sn', 'michele.chartier@roche.fr', NULL, NULL, '+33 9 78 20 52 22', '+33 (0)2 68 01 05 29', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(930, 5, NULL, 1, 137, 3, 'Zacharie', 'Benard', '2012-02-13', 'Lombard', 'FR740897031595IBU053688V902', '05788', '95227', '1974-06-01', 'Veuf(ve)', 'Masculin', 1, 'marie-agn', 'dupuy.bernard@yahoo.fr', NULL, NULL, '+33 4 13 50 62 97', '0742342616', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(931, 4, NULL, 1, 68, 2, 'Patricia', 'Auger', '1991-03-23', 'Da Silvanec', 'FR627122947358O2XJ53Q078H44', '30843', '75039', '1978-01-08', 'Célibataire', 'Féminin', 0, 'thomasmarion@univ-thies.sn', 'hroux@pruvost.com', NULL, NULL, '0738864980', '0897247224', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(932, 1, NULL, 1, 78, 4, 'Valérie', 'Cordier', '1988-03-11', 'Bailly-sur-Perret', 'FR571178028348E35HRZN06IH79', '79749', '99 006', '1981-09-15', 'Veuf(ve)', 'Masculin', 0, '', 'marguerite.jourdan@hotmail.fr', NULL, NULL, '+33 4 15 63 94 68', '04 69 61 10 17', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(933, 5, NULL, 1, 57, 2, 'Guy', 'Gregoire', '1978-05-02', 'Germainboeuf', 'FR221331411517UYT90271VDD06', '02091', '83891', '2012-05-16', 'Veuf(ve)', 'Masculin', 0, 'daviddacosta@univ-thies.sn', 'nguyen.daniel@dbmail.com', NULL, NULL, '+33 (0)8 23 98 13 35', '0325995969', 1, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(934, 5, NULL, 1, 181, 3, 'Alex', 'Giraud', '2006-07-10', 'Grenierboeuf', 'FR22779058708227092EH379F63', '87306', '63 546', '1984-07-20', 'Veuf(ve)', 'Masculin', 0, 'augusteleroux@univ-thies.sn', 'qfouquet@bonneau.org', NULL, NULL, '+33 (0)1 34 08 45 27', '0149199696', 8, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(935, 5, NULL, 1, 89, 2, 'Lucas', 'Andre', '2021-03-14', 'Tessier-sur-Martel', 'FR932897293755QCOH90HGC7F47', '29189', '93 060', '1992-08-06', 'Marié(e)', 'Masculin', 0, 'tristanblanchet@univ-thies.sn', 'qgauthier@teixeira.net', NULL, NULL, '+33 (0)8 93 04 49 75', '0962296055', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(936, 1, NULL, 1, 171, 3, 'Raymond', 'Carre', '2014-11-14', 'Marie', 'FR6081617436513YWX1HGI0KT22', '82 740', '05354', '2014-02-07', 'Marié(e)', 'Féminin', 0, 'moniqueweber@univ-thies.sn', 'gabriel.cordier@tiscali.fr', NULL, NULL, '0496111506', '0779679363', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(937, 4, NULL, 1, 1, 3, 'Thibaut', 'Fernandez', '1987-11-01', 'Herve', 'FR41994471633887Q2V2Y5NIC26', '20 813', '03 159', '1998-10-17', 'Veuf(ve)', 'Féminin', 0, 'th', 'dupont.claire@live.com', NULL, NULL, '+33 7 70 58 49 23', '+33 5 06 60 47 87', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(938, 1, NULL, 1, 31, 3, 'Guy', 'Hamel', '2012-06-24', 'Millet-sur-Mer', 'FR738095129384XA9943V9G8P75', '71895', '67574', '2007-04-22', 'Veuf(ve)', 'Féminin', 0, 'patriciaberger@univ-thies.sn', 'rpineau@bouygtel.fr', NULL, NULL, '+33 (0)9 23 37 40 18', '+33 4 72 78 01 42', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(939, 4, NULL, 1, 19, 3, 'Pierre', 'Weber', '1972-06-25', 'Petit-la-Forêt', 'FR4779415591372300699VNJ787', '67 820', '41667', '1970-01-24', 'Marié(e)', 'Féminin', 0, 'isaaclamy@univ-thies.sn', 'plambert@club-internet.fr', NULL, NULL, '+33 (0)2 17 93 85 98', '+33 3 03 26 34 27', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(940, 4, NULL, 1, 191, 3, 'Adèle', 'Petitjean', '2008-09-08', 'Legros-sur-Mathieu', 'FR587832683982HY7DL23PFHF41', '95783', '72223', '2004-01-29', 'Marié(e)', 'Féminin', 0, '', 'qollivier@delattre.org', NULL, NULL, '+33 (0)8 18 97 49 80', '+33 4 65 98 88 75', 6, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(941, 1, NULL, 1, 54, 2, 'Margaud', 'Rodrigues', '1981-05-31', 'Pascalboeuf', 'FR693021119520ENX8Q33RXUL74', '88 303', '03 073', '1974-01-07', 'Divorcé(e)', 'Féminin', 1, 'georgescousin-guibert@univ-thies.sn', 'yblot@tele2.fr', NULL, NULL, '0286983212', '+33 6 27 10 59 37', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(942, 5, NULL, 1, 70, 4, 'Gabriel', 'Girard', '2001-09-10', 'GuillaumeBourg', 'FR874761463353UQSOODU35FQ04', '61 104', '23811', '1970-02-18', 'Célibataire', 'Féminin', 0, 'ad', 'laurent51@dumas.com', NULL, NULL, '0135500420', '02 57 20 49 62', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(943, 5, NULL, 1, 83, 1, 'Anastasie', 'Ollivier', '1982-04-13', 'Pasquier', 'FR830201643570XSFVOD0POA242', '63 113', '47 400', '2014-10-05', 'Veuf(ve)', 'Féminin', 1, 'zacharieguillaume@univ-thies.sn', 'royer.jerome@bigot.org', NULL, NULL, '+33 3 21 94 56 21', '+33 (0)6 85 97 84 51', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(944, 4, NULL, 1, 216, 4, 'Christophe', 'Thomas', '1980-06-29', 'Jacques-sur-Rey', 'FR114347063744435S106C6TO78', '08 985', '27 565', '1975-06-15', 'Veuf(ve)', 'Masculin', 1, 'alphonsejacquet-tessier@univ-thies.sn', 'osamson@andre.com', NULL, NULL, '+33 (0)6 62 76 56 28', '+33 (0)4 05 16 18 51', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(945, 5, NULL, 1, 110, 4, 'Astrid', 'Navarro', '1997-01-19', 'Fournier', 'FR82954267838108OC069P71702', '71 565', '19281', '1987-05-23', 'Marié(e)', 'Masculin', 1, 'timoth', 'philippine97@bouygtel.fr', NULL, NULL, '06 58 77 24 97', '05 75 06 23 36', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(946, 4, NULL, 1, 226, 3, 'Michelle', 'Delattre', '2013-05-15', 'Boulangernec', 'FR927794359146X534UNDV1M973', '87 907', '66 946', '1990-04-26', 'Marié(e)', 'Féminin', 1, 'moniquemercier-masson@univ-thies.sn', 'valexandre@foucher.net', NULL, NULL, '+33 7 84 84 77 69', '+33 3 31 19 15 66', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(947, 1, NULL, 1, 68, 3, 'Gilbert', 'Lecomte', '2002-03-09', 'Rocher', 'FR2713862043917BBFV4804FX03', '21212', '60660', '2009-11-25', 'Marié(e)', 'Féminin', 1, 'rogergillet@univ-thies.sn', 'corinne14@pierre.com', NULL, NULL, '09 56 07 85 46', '01 00 42 86 65', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(948, 5, NULL, 1, 169, 2, 'Jacqueline', 'Marchand', '2014-07-24', 'Camus', 'FR747926828815K142GXR6SP420', '74661', '94229', '2009-12-26', 'Marié(e)', 'Féminin', 1, 'bertranddeoliveira@univ-thies.sn', 'carlier.bernard@ferreira.fr', NULL, NULL, '0745685623', '+33 (0)1 80 35 83 71', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(949, 1, NULL, 1, 88, 3, 'Hugues', 'Masse', '1996-12-23', 'Guilbertdan', 'FR8556151706668048GLVRNN602', '10009', '91206', '1973-03-31', 'Divorcé(e)', 'Masculin', 1, 'margauxcharles@univ-thies.sn', 'xfernandez@lemaire.org', NULL, NULL, '0619122206', '+33 (0)8 95 42 73 11', 9, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(950, 1, NULL, 1, 176, 1, 'Lucie', 'Picard', '2014-02-14', 'Fournier-les-Bains', 'FR299097182999758ZB5QWBCE59', '26 128', '52858', '2012-08-21', 'Marié(e)', 'Féminin', 1, 'g', 'zacharie.teixeira@gros.com', NULL, NULL, '+33 5 80 42 19 22', '0736114232', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(951, 4, NULL, 1, 19, 3, 'Susanne', 'Berger', '1992-09-05', 'Payet', 'FR208321793826UC7KCBOZPW411', '19 554', '55 673', '2004-05-01', 'Veuf(ve)', 'Féminin', 1, 'alexandriadelacamus@univ-thies.sn', 'adele.boyer@dbmail.com', NULL, NULL, '+33 (0)6 27 62 58 61', '05 80 57 57 53', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(952, 5, NULL, 1, 204, 1, 'Marianne', 'Thomas', '2002-07-19', 'Charrier', 'FR100116898079FH03VY46X9757', '25 667', '95 597', '2020-09-08', 'Célibataire', 'Masculin', 1, 'nathaliebourgeois@univ-thies.sn', 'therese69@wanadoo.fr', NULL, NULL, '04 39 03 64 93', '03 88 79 31 41', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(953, 4, NULL, 1, 20, 4, 'Catherine', 'Bailly', '2021-02-10', 'Le Gallboeuf', 'FR47437465735594236798K0301', '36 536', '83244', '2018-02-14', 'Marié(e)', 'Féminin', 1, '', 'margot.guichard@robert.org', NULL, NULL, '+33 2 05 03 96 45', '+33 2 10 98 43 80', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL);
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(954, 5, NULL, 1, 211, 4, 'Marine', 'Maillet', '2001-07-17', 'Gaillard-sur-Peltier', 'FR10255213840886FUZNQ8FBJ11', '99 059', '62 989', '1982-04-23', 'Divorcé(e)', 'Féminin', 0, 'bertrandpons-marques@univ-thies.sn', 'valerie27@didier.com', NULL, NULL, '+33 2 16 54 26 75', '+33 3 81 40 60 41', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(955, 4, NULL, 1, 191, 4, 'Yves', 'Etienne', '1988-07-15', 'Grenier-les-Bains', 'FR17035852368075JZJ36SMKH87', '71 648', '18 923', '2010-06-13', 'Marié(e)', 'Masculin', 0, 'anastasiedelalagarde@univ-thies.sn', 'sthierry@rocher.org', NULL, NULL, '0908060809', '04 86 16 20 22', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(956, 1, NULL, 1, 15, 3, 'Madeleine', 'Gauthier', '2002-05-02', 'Coste', 'FR493454914962R1S1393SMN814', '37912', '36 763', '1990-07-08', 'Célibataire', 'Masculin', 0, 'ren', 'zoe11@grondin.com', NULL, NULL, '0421662175', '+33 1 92 27 37 18', 9, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(957, 1, NULL, 1, 1, 3, 'Suzanne', 'Chauvin', '1973-04-13', 'RousseauVille', 'FR795591241249211Y3LT6IW438', '58238', '17592', '1992-10-25', 'Divorcé(e)', 'Féminin', 1, 'th', 'jerome07@bouygtel.fr', NULL, NULL, '0470035948', '+33 (0)4 50 66 50 05', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(958, 5, NULL, 1, 237, 1, 'Benoît', 'Lesage', '1994-02-19', 'Noelnec', 'FR9752136837633B8U02FC5TS78', '42 756', '93 467', '1983-03-05', 'Célibataire', 'Féminin', 1, 'richard-michellambert@univ-thies.sn', 'vbonnin@laposte.net', NULL, NULL, '0498020570', '+33 (0)2 77 55 23 47', 4, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(959, 1, NULL, 1, 116, 3, 'Antoine', 'Vaillant', '2005-05-15', 'MasseBourg', 'FR8361845138421YL7MJ86QL823', '06 832', '69 132', '2004-02-16', 'Veuf(ve)', 'Masculin', 0, 'carolinedacosta@univ-thies.sn', 'alexandrie31@rey.com', NULL, NULL, '+33 6 90 76 52 16', '+33 3 24 54 74 41', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(960, 5, NULL, 1, 147, 2, 'Luc', 'Jacob', '2000-07-28', 'Legrosboeuf', 'FR121904573225695GF2C9MZ292', '51 825', '95 847', '1996-03-27', 'Marié(e)', 'Masculin', 0, 'antoinegiraud@univ-thies.sn', 'klein.christelle@jean.com', NULL, NULL, '01 96 35 42 08', '0516153809', 7, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(961, 5, NULL, 1, 122, 3, 'Sylvie', 'Chauvin', '1985-04-13', 'Diallonec', 'FR649332487334JO4T44E9WCJ88', '52438', '65 586', '2005-07-25', 'Divorcé(e)', 'Masculin', 0, '', 'sophie38@coulon.org', NULL, NULL, '09 74 45 63 81', '01 12 41 27 01', 9, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(962, 5, NULL, 1, 201, 2, 'Édouard', 'Petit', '2009-08-23', 'Bernard', 'FR927124826987FH1V95VJCD867', '20 493', '41 725', '2008-12-22', 'Célibataire', 'Masculin', 0, 'bertrandbouchet@univ-thies.sn', 'hgautier@laposte.net', NULL, NULL, '+33 (0)1 87 14 17 54', '0426775150', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(963, 5, NULL, 1, 228, 3, 'Zacharie', 'Grondin', '1986-03-08', 'Boucher-sur-Mer', 'FR4528473373012JZC43VMK8Y24', '38 166', '78689', '2010-03-08', 'Divorcé(e)', 'Féminin', 0, 'marinediaz@univ-thies.sn', 'fsauvage@maury.com', NULL, NULL, '0918702542', '08 97 20 66 50', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(964, 4, NULL, 1, 144, 4, 'Charles', 'Riou', '1996-05-30', 'Descamps', 'FR671899946792UVU4KA6UQH872', '74557', '24924', '1992-10-04', 'Veuf(ve)', 'Féminin', 1, 'danielleleroux-duval@univ-thies.sn', 'christine.hernandez@laposte.net', NULL, NULL, '+33 (0)5 23 11 16 34', '0733420998', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(965, 5, NULL, 1, 38, 1, 'Nicolas', 'Grondin', '1971-09-28', 'Baudryboeuf', 'FR302540938863NZK3MAX1H0E40', '51807', '07501', '1972-09-15', 'Célibataire', 'Féminin', 0, 'henrideblanc@univ-thies.sn', 'david.didier@jacquet.fr', NULL, NULL, '+33 (0)8 95 19 73 69', '01 18 37 94 97', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(966, 4, NULL, 1, 186, 4, 'Tristan', 'Herve', '2000-01-03', 'Leleu', 'FR78092803684249H9I9NCFBI76', '91287', '41788', '1974-04-21', 'Marié(e)', 'Féminin', 1, 'claudinelecomte@univ-thies.sn', 'lfernandez@orange.fr', NULL, NULL, '+33 1 92 54 35 44', '+33 2 79 49 21 74', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(967, 5, NULL, 1, 38, 3, 'Agnès', 'Bigot', '1994-08-16', 'Mace-les-Bains', 'FR5637360180392O447K6JS4P25', '76 191', '69575', '1978-09-13', 'Célibataire', 'Féminin', 1, 'rogerjacquet@univ-thies.sn', 'thierry.torres@ifrance.com', NULL, NULL, '+33 (0)7 40 71 06 60', '+33 (0)6 84 65 37 70', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(968, 5, NULL, 1, 174, 4, 'Lucas', 'Hardy', '1994-09-22', 'Devaux', 'FR69971649139366DDMSV846526', '81422', '15529', '2013-08-06', 'Divorcé(e)', 'Féminin', 0, 'martingomez@univ-thies.sn', 'julie69@bonnin.com', NULL, NULL, '0916072676', '+33 (0)1 77 05 13 47', 9, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(969, 4, NULL, 1, 61, 3, 'Océane', 'Guyon', '1979-12-11', 'Marty-les-Bains', 'FR332016624623M84Z415E29263', '15 171', '75 202', '1970-11-23', 'Célibataire', 'Masculin', 0, 'martinemoulin@univ-thies.sn', 'mahe.aurore@sfr.fr', NULL, NULL, '0259162662', '0163916588', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(970, 4, NULL, 1, 153, 3, 'Odette', 'Pierre', '2001-07-16', 'Louis', 'FR456134308916BJH094OS3U666', '23185', '13048', '1996-04-24', 'Divorcé(e)', 'Féminin', 0, 'robertblot@univ-thies.sn', 'paulette68@guyon.com', NULL, NULL, '05 01 08 59 88', '+33 9 85 36 14 67', 1, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(971, 5, NULL, 1, 199, 4, 'Audrey', 'Richard', '2004-08-26', 'Arnauddan', 'FR761455052984CA39840Z3PG07', '69955', '98320', '1981-12-23', 'Marié(e)', 'Féminin', 0, 'aurore-olivieroussel@univ-thies.sn', 'lecoq.christiane@wanadoo.fr', NULL, NULL, '0168242968', '0385570680', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(972, 5, NULL, 1, 200, 1, 'Denise', 'Klein', '1986-06-20', 'Goncalves', 'FR0717987512316C9FG3647EZ60', '31 353', '37 839', '2011-08-15', 'Divorcé(e)', 'Féminin', 0, 'no', 'roland.petitjean@dbmail.com', NULL, NULL, '0891949907', '+33 9 07 24 06 50', 8, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(973, 4, NULL, 1, 202, 2, 'Olivier', 'Jourdan', '2019-04-30', 'Francois', 'FR838872596134005MA0T66DA25', '52 688', '37847', '1995-07-19', 'Marié(e)', 'Féminin', 1, '', 'vcoulon@dasilva.fr', NULL, NULL, '03 38 32 61 35', '+33 1 35 72 22 48', 9, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(974, 5, NULL, 1, 173, 4, 'Marianne', 'Gauthier', '2017-06-01', 'Da Costa-sur-Collet', 'FR511968662566KL63FZ9U0C038', '03008', '01 239', '1970-08-12', 'Divorcé(e)', 'Masculin', 0, 'xavierbaudry-aubry@univ-thies.sn', 'joubert.stephanie@sfr.fr', NULL, NULL, '+33 (0)9 05 66 89 71', '+33 (0)1 85 14 83 32', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(975, 1, NULL, 1, 123, 1, 'Valérie', 'Vallet', '1977-08-17', 'Gauthier', 'FR202236127487195477U888235', '95 407', '54 911', '1988-08-16', 'Célibataire', 'Féminin', 0, 'valentinemoreau@univ-thies.sn', 'antoine.mendes@levy.com', NULL, NULL, '+33 (0)2 20 55 55 05', '+33 9 94 62 41 09', 1, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(976, 5, NULL, 1, 95, 4, 'Benjamin', 'Lacroix', '1978-09-06', 'LebretonVille', 'FR085937959381126V7M92K1E03', '04506', '46445', '1973-11-13', 'Marié(e)', 'Féminin', 0, 'timoth', 'jules.richard@peron.fr', NULL, NULL, '0921710701', '03 40 73 14 26', 9, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(977, 1, NULL, 1, 111, 4, 'Stéphane', 'Samson', '1978-05-27', 'Dumas-les-Bains', 'FR4604234778143LI546Q27E067', '21 448', '63250', '2001-09-09', 'Veuf(ve)', 'Féminin', 0, 'antoinedescamps@univ-thies.sn', 'antoine.gomez@bouygtel.fr', NULL, NULL, '0364190117', '+33 (0)6 48 16 39 42', 4, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(978, 4, NULL, 1, 182, 3, 'Christophe', 'Rousseau', '2006-06-18', 'Germain-sur-Gerard', 'FR682502661126K4T3Q22I5QC63', '45316', '21482', '1977-04-27', 'Divorcé(e)', 'Féminin', 0, 'no', 'rhubert@bouygtel.fr', NULL, NULL, '+33 9 82 09 91 37', '0778777152', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(979, 5, NULL, 1, 102, 3, 'Gilles', 'Legendre', '1977-03-18', 'Briand', 'FR223738417497FT0C6EQFQ7761', '46 895', '97 091', '2001-01-22', 'Veuf(ve)', 'Féminin', 0, 'dominiqueantoine-moreno@univ-thies.sn', 'denis01@dbmail.com', NULL, NULL, '0506396497', '+33 (0)9 10 42 81 66', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(980, 1, NULL, 1, 223, 3, 'Matthieu', 'Deschamps', '2000-12-02', 'Begue-les-Bains', 'FR147949968609ZJ24L6Z5MM605', '18501', '27658', '1975-04-18', 'Marié(e)', 'Masculin', 0, 'luc-', 'daniel.lamy@garnier.fr', NULL, NULL, '+33 3 94 93 25 13', '+33 (0)8 13 25 71 70', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(981, 5, NULL, 1, 216, 1, 'Simone', 'Pierre', '1997-09-29', 'Martinez', 'FR1210839803114LHMLA5PQ1803', '89 386', '41147', '1987-02-23', 'Célibataire', 'Féminin', 0, 'laurencedelucas@univ-thies.sn', 'techer.aimee@noos.fr', NULL, NULL, '+33 (0)7 85 48 70 26', '03 54 34 19 15', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(982, 4, NULL, 1, 86, 4, 'Anouk', 'Petit', '1984-08-22', 'Michaud', 'FR9687737732273X03S87W76855', '13734', '54463', '2001-11-25', 'Divorcé(e)', 'Masculin', 1, 'julietteduledoux@univ-thies.sn', 'handre@wanadoo.fr', NULL, NULL, '0257690599', '+33 5 22 20 08 69', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(983, 4, NULL, 1, 155, 1, 'Roland', 'Ramos', '1975-11-11', 'Lombard', 'FR957226956101F1PV75T545M27', '71 876', '51 747', '1972-01-26', 'Veuf(ve)', 'Féminin', 1, 'sylvielejeune@univ-thies.sn', 'bernard.mace@orange.fr', NULL, NULL, '0108182664', '0146481031', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(984, 1, NULL, 1, 77, 4, 'Margaret', 'Le Gall', '2012-07-28', 'Auger', 'FR739255212848F1GA2397X5300', '79325', '62592', '1985-06-21', 'Veuf(ve)', 'Féminin', 1, 'matthieuvidal@univ-thies.sn', 'hoarau.josephine@live.com', NULL, NULL, '0823814419', '0236250295', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(985, 5, NULL, 1, 86, 2, 'Lucas', 'Wagner', '2012-06-07', 'Muller-sur-Levy', 'FR77801566070240MV48V17H503', '99778', '58723', '1977-04-04', 'Marié(e)', 'Féminin', 0, 'eug', 'andree.lebrun@wanadoo.fr', NULL, NULL, '+33 (0)2 07 04 72 32', '04 99 26 77 64', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(986, 5, NULL, 1, 28, 1, 'Monique', 'Denis', '1979-12-01', 'Lemaitre', 'FR12459941516498SCOYU1T6987', '49436', '24 305', '1992-01-05', 'Veuf(ve)', 'Masculin', 1, 'colettepayet@univ-thies.sn', 'corinne.joubert@yahoo.fr', NULL, NULL, '+33 2 94 84 74 88', '05 58 72 03 04', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(987, 5, NULL, 1, 23, 3, 'Anouk', 'Denis', '2021-03-11', 'Gomes', 'FR67861181220627WSF6W300068', '61 433', '60202', '1993-08-31', 'Veuf(ve)', 'Féminin', 1, 'camillegimenez@univ-thies.sn', 'suzanne27@perez.com', NULL, NULL, '+33 (0)1 23 79 83 03', '+33 5 29 77 50 42', 9, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(988, 4, NULL, 1, 49, 1, 'Émile', 'Levy', '2017-07-08', 'Lemonnier', 'FR6084070512162208SPCQ41M46', '39682', '42 889', '1974-07-28', 'Veuf(ve)', 'Masculin', 1, 'marcelbourdon@univ-thies.sn', 'alix.fernandez@noos.fr', NULL, NULL, '0456754133', '+33 (0)6 51 22 02 53', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(989, 5, NULL, 1, 114, 2, 'Arthur', 'Berger', '1979-08-19', 'Voisin', 'FR508142678589J31MZ34TXW297', '37 732', '87861', '2002-01-31', 'Divorcé(e)', 'Masculin', 0, 'thomasdubois@univ-thies.sn', 'aurelie05@bouygtel.fr', NULL, NULL, '0419578754', '0791864766', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(990, 1, NULL, 1, 71, 1, 'Jeanne', 'Guilbert', '1970-02-18', 'MenardVille', 'FR65254706151208L0C6MQDLU47', '70 836', '03 839', '1985-10-05', 'Divorcé(e)', 'Masculin', 0, 'ren', 'frolland@laposte.net', NULL, NULL, '07 56 91 20 78', '+33 (0)5 89 87 05 20', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(991, 1, NULL, 1, 54, 4, 'Lucie', 'Samson', '1971-01-31', 'Lambert', 'FR1943101162085UK647093LP25', '05 012', '62748', '2009-02-19', 'Célibataire', 'Féminin', 0, 'ana', 'dnguyen@sfr.fr', NULL, NULL, '+33 7 37 93 23 14', '0626003627', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(992, 1, NULL, 1, 89, 1, 'Geneviève', 'Martel', '2010-04-06', 'Renauddan', 'FR826296877048VFW16A4VANL68', '38077', '77 282', '1990-04-03', 'Divorcé(e)', 'Masculin', 0, 'adrienneramos@univ-thies.sn', 'abonnin@renaud.com', NULL, NULL, '+33 4 84 80 70 63', '+33 3 94 76 93 91', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(993, 4, NULL, 1, 80, 3, 'Valérie', 'Lebon', '1975-10-12', 'Renard', 'FR7965811668051H668WZN13335', '60250', '61434', '2019-11-14', 'Divorcé(e)', 'Féminin', 0, 'franckleger@univ-thies.sn', 'grondin.martin@pons.com', NULL, NULL, '+33 6 36 40 42 89', '0615245459', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(994, 1, NULL, 1, 45, 3, 'Gilles', 'Goncalves', '2020-08-14', 'Tanguy-sur-Barbier', 'FR689009808756U94TSKZV3CU27', '65553', '51 072', '1988-08-08', 'Marié(e)', 'Féminin', 0, 'julesjacquot@univ-thies.sn', 'elise72@voila.fr', NULL, NULL, '01 69 68 39 56', '+33 6 36 91 89 90', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(995, 4, NULL, 1, 196, 3, 'William', 'Royer', '1982-07-09', 'Laroche', 'FR12868821342425E276PP0PB45', '79 550', '55545', '2015-11-13', 'Marié(e)', 'Masculin', 0, 'nathalierenaud-jacquet@univ-thies.sn', 'maryse.renault@dbmail.com', NULL, NULL, '+33 9 36 52 37 36', '0347031333', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(996, 5, NULL, 1, 224, 4, 'Léon', 'Chauvin', '2002-01-27', 'Normand', 'FR3154123585862RRBR967XJ555', '39157', '36 376', '1981-08-10', 'Marié(e)', 'Féminin', 1, 'martine-in', 'denise.fabre@allard.fr', NULL, NULL, '06 76 87 41 62', '+33 (0)4 71 44 06 34', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(997, 1, NULL, 1, 233, 3, 'Adèle', 'Rolland', '1997-02-24', 'Bourgeois-les-Bains', 'FR4146049890410HKIF1WX9Z117', '76 955', '20 368', '1987-09-27', 'Célibataire', 'Masculin', 1, 'vincentfouquet@univ-thies.sn', 'victor.renault@chauvet.com', NULL, NULL, '+33 (0)8 14 63 95 07', '06 94 26 88 71', 6, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(998, 5, NULL, 1, 36, 1, 'Grégoire', 'Bertrand', '1979-10-16', 'Potier', 'FR027853839298P11Z1KVD9UN04', '38 333', '14 583', '1995-06-27', 'Divorcé(e)', 'Masculin', 1, 'virginieroux@univ-thies.sn', 'vthomas@tele2.fr', NULL, NULL, '+33 7 56 54 34 96', '+33 7 52 40 72 33', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(999, 1, NULL, 1, 152, 1, 'René', 'Rodrigues', '1994-04-01', 'Roche', 'FR25005427542139W2C2FONS166', '96002', '05554', '1982-04-29', 'Marié(e)', 'Féminin', 0, 'odettebreton@univ-thies.sn', 'matthieu73@yahoo.fr', NULL, NULL, '04 42 16 81 61', '+33 8 26 75 68 98', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1000, 4, NULL, 1, 177, 3, 'Anouk', 'Gros', '1985-09-02', 'Remy', 'FR349877124667E7V578W8L3477', '16 041', '26 135', '1997-08-08', 'Divorcé(e)', 'Masculin', 0, 'no', 'mchretien@leconte.net', NULL, NULL, '+33 (0)6 34 00 08 83', '02 26 18 48 92', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1001, 5, NULL, 1, 21, 4, 'Louise', 'Laurent', '1970-10-24', 'Royer-sur-Baudry', 'FR342840014191TTOQ6E8259487', '60709', '57393', '2000-07-31', 'Marié(e)', 'Masculin', 0, 'alexandriaetienne-alves@univ-thies.sn', 'roger10@pinto.com', NULL, NULL, '+33 3 57 74 04 24', '03 26 63 34 97', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1002, 1, NULL, 1, 224, 2, 'Nath', 'Chauvet', '2001-07-16', 'Begue', 'FR7713752024726H31I277VZW25', '60 902', '11 338', '2009-07-09', 'Marié(e)', 'Masculin', 1, 'nathaliebaudry@univ-thies.sn', 'rhamon@yahoo.fr', NULL, NULL, '02 82 55 81 36', '+33 (0)9 53 70 58 57', 5, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1003, 5, NULL, 1, 147, 2, 'Franck', 'Ledoux', '2000-03-15', 'Lecoq-la-Forêt', 'FR4897446843117647MC2I7VT01', '26342', '92 918', '2017-09-07', 'Marié(e)', 'Féminin', 0, 'martinthibault@univ-thies.sn', 'maillet.claude@sfr.fr', NULL, NULL, '0750815892', '+33 7 45 62 45 28', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1004, 1, NULL, 1, 217, 4, 'Guy', 'Albert', '1987-10-31', 'BruneauBourg', 'FR508135230993PF2J6WKZ59P53', '01 877', '33 811', '2009-06-27', 'Divorcé(e)', 'Féminin', 0, 'chantal-cl', 'ygomez@labbe.org', NULL, NULL, '+33 (0)1 16 13 14 77', '06 47 68 53 71', 2, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1005, 5, NULL, 1, 176, 3, 'Patrick', 'Leblanc', '1995-05-23', 'Muller-sur-Mer', 'FR179349543996G94OZO4T67R09', '68 567', '25 252', '2019-10-10', 'Marié(e)', 'Masculin', 1, 'andr', 'louis.rousseau@tessier.fr', NULL, NULL, '+33 (0)2 57 96 08 09', '+33 (0)6 16 80 37 36', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1006, 5, NULL, 1, 125, 3, 'Marcelle', 'Le Goff', '1987-04-02', 'Chretien-sur-Mer', 'FR730653127159483D316ZJS642', '64480', '50018', '1991-11-25', 'Divorcé(e)', 'Féminin', 0, 'c', 'maryse.francois@sfr.fr', NULL, NULL, '07 51 68 88 36', '0672039457', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1007, 5, NULL, 1, 134, 2, 'Élise', 'Renault', '2014-06-06', 'MercierVille', 'FR263645270704ZLK0923JL8627', '91 412', '59 612', '1983-02-26', 'Célibataire', 'Féminin', 0, 'nathaliedumont@univ-thies.sn', 'lebrun.alexandrie@paris.com', NULL, NULL, '01 95 42 13 56', '+33 (0)3 80 22 02 70', 6, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1008, 5, NULL, 1, 170, 1, 'Édouard', 'Dias', '1977-01-31', 'Dumasboeuf', 'FR959928198849M6A60BAOL3P48', '04766', '08744', '2004-09-22', 'Célibataire', 'Masculin', 0, 'sylvie-alixperret@univ-thies.sn', 'noemi.berthelot@paris.fr', NULL, NULL, '09 32 89 95 51', '+33 (0)4 26 87 25 03', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1009, 5, NULL, 1, 227, 2, 'Louis', 'Daniel', '1970-06-04', 'Laroche', 'FR6864550130653H76E3O9Z4421', '94584', '97589', '2013-12-02', 'Veuf(ve)', 'Masculin', 1, 'richard-ren', 'bourgeois.constance@lucas.fr', NULL, NULL, '0105991089', '02 00 65 45 48', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1010, 4, NULL, 1, 178, 2, 'Louis', 'Guillou', '2006-10-06', 'Boyer', 'FR0245103901429X2271H248M91', '55 941', '49735', '1986-11-18', 'Veuf(ve)', 'Féminin', 0, 'lorrainedubigot@univ-thies.sn', 'juliette.cordier@gmail.com', NULL, NULL, '0917386686', '04 58 33 49 30', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1011, 1, NULL, 1, 55, 1, 'Antoine', 'Giraud', '2015-05-20', 'Morel-sur-Launay', 'FR05368258082499LA6X33TH725', '68449', '09 264', '2007-12-12', 'Veuf(ve)', 'Féminin', 0, 'aur', 'lucie.martineau@gallet.org', NULL, NULL, '0790561459', '+33 2 99 10 97 17', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1012, 4, NULL, 1, 49, 4, 'Véronique', 'Pruvost', '2008-10-11', 'Ferrand', 'FR207609774787J9KE94KV61G19', '49960', '72 668', '1995-11-18', 'Célibataire', 'Masculin', 0, 'susancaron@univ-thies.sn', 'ujean@gmail.com', NULL, NULL, '0753763688', '0788464736', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1013, 5, NULL, 1, 212, 4, 'Capucine', 'Baudry', '1988-06-14', 'Francois', 'FR475058590289N18495D3L3L91', '70 097', '35854', '2012-09-14', 'Divorcé(e)', 'Féminin', 1, 'margueritebailly@univ-thies.sn', 'letellier.jean@olivier.fr', NULL, NULL, '+33 (0)9 12 77 94 89', '01 37 29 83 87', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1014, 1, NULL, 1, 168, 2, 'Charles', 'Menard', '1983-03-13', 'Weber', 'FR81859379171796663KP51IU90', '30 923', '69 561', '1976-10-17', 'Célibataire', 'Féminin', 0, 'beno', 'celina.remy@hotmail.fr', NULL, NULL, '05 14 49 84 93', '05 05 49 56 26', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1015, 4, NULL, 1, 111, 1, 'Bertrand', 'Marques', '2015-10-04', 'Dupuis', 'FR88122888922512KTAU21K0881', '38852', '30 137', '2005-03-11', 'Divorcé(e)', 'Féminin', 0, 'olivierlelacombe@univ-thies.sn', 'noel32@bouchet.com', NULL, NULL, '0748821312', '03 44 28 79 38', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1016, 4, NULL, 1, 9, 1, 'Océane', 'Muller', '1993-07-16', 'Leduc', 'FR337248165770TP88NK92N1842', '15 088', '64 107', '2017-01-20', 'Divorcé(e)', 'Masculin', 0, 'yvesandre@univ-thies.sn', 'guillaume.chauvin@boucher.com', NULL, NULL, '+33 (0)6 95 33 28 65', '0135048992', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1017, 5, NULL, 1, 223, 1, 'Robert', 'Aubert', '2009-12-21', 'Maury-les-Bains', 'FR747935742410A116921ZLBE63', '69 804', '99 404', '1984-10-31', 'Célibataire', 'Féminin', 1, 'no', 'breton.bernard@club-internet.fr', NULL, NULL, '+33 6 87 29 71 14', '0774792982', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1018, 4, NULL, 1, 197, 2, 'Christiane', 'Georges', '2016-05-04', 'Chauveau', 'FR627710499444M645HR6SJ7935', '78735', '30 562', '2002-01-31', 'Célibataire', 'Masculin', 0, 'pierremaury@univ-thies.sn', 'monique.camus@delaunay.fr', NULL, NULL, '04 88 76 90 16', '02 85 94 52 88', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1019, 4, NULL, 1, 240, 3, 'Augustin', 'Teixeira', '2006-05-06', 'Boyer-sur-Mer', 'FR198657784592J0OL384000168', '98 332', '81 758', '1972-09-22', 'Célibataire', 'Féminin', 1, 'moniquegirard-leveque@univ-thies.sn', 'victor.pichon@voila.fr', NULL, NULL, '05 62 51 91 42', '0549205186', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1020, 5, NULL, 1, 131, 2, 'Paulette', 'Devaux', '1989-03-01', 'Gonzaleznec', 'FR855529767277PKWEPYBC1G950', '52283', '53 544', '2003-03-05', 'Célibataire', 'Masculin', 1, 'julesdelannoy@univ-thies.sn', 'ycordier@teixeira.fr', NULL, NULL, '+33 3 07 41 77 09', '+33 1 57 73 23 03', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1021, 4, NULL, 1, 216, 3, 'Christophe', 'Marchand', '2020-11-19', 'Leduc-la-Forêt', 'FR462052010277D367THDTOKN74', '58 348', '61120', '2020-09-10', 'Marié(e)', 'Féminin', 0, 'pierreleschmitt@univ-thies.sn', 'didier.daniel@hotmail.fr', NULL, NULL, '0572223246', '+33 (0)3 05 89 04 97', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1022, 1, NULL, 1, 195, 3, 'Caroline', 'Laporte', '2015-10-31', 'Hebert', 'FR882037466609DF20KZ1794857', '96 978', '75552', '2003-02-24', 'Marié(e)', 'Masculin', 0, 'aim', 'julien.samson@ifrance.com', NULL, NULL, '0281920587', '+33 (0)3 66 79 95 45', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1023, 4, NULL, 1, 220, 3, 'Alfred', 'Coulon', '1995-08-08', 'Robin', 'FR2211499058966S29L13SP5U68', '71 169', '17305', '2014-05-24', 'Veuf(ve)', 'Féminin', 1, 'cl', 'gaudin.guy@orange.fr', NULL, NULL, '+33 7 54 06 73 49', '+33 3 75 68 75 59', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1024, 5, NULL, 1, 109, 2, 'Clémence', 'Valentin', '1971-12-02', 'Gaudin-les-Bains', 'FR495734804508I75XN62160238', '40411', '17882', '2006-03-03', 'Célibataire', 'Masculin', 1, 'ad', 'margot06@wanadoo.fr', NULL, NULL, '+33 (0)1 39 02 55 54', '+33 1 10 30 70 55', 5, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1025, 1, NULL, 1, 114, 4, 'Capucine', 'Boulanger', '2002-09-01', 'Boyer', 'FR9303028589191H04BMT3H9Y60', '04788', '92 153', '1972-09-21', 'Divorcé(e)', 'Féminin', 0, 'robert-christophelabbe@univ-thies.sn', 'grenier.brigitte@laurent.org', NULL, NULL, '+33 3 45 54 07 01', '+33 7 78 22 26 88', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1026, 5, NULL, 1, 20, 2, 'Patrick', 'Ferreira', '2013-06-23', 'Colas-la-Forêt', 'FR585929544973A7D1KM031SN48', '19193', '25 827', '1992-02-26', 'Divorcé(e)', 'Féminin', 0, 'th', 'clemence.neveu@noos.fr', NULL, NULL, '0823341605', '+33 8 91 20 62 63', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1027, 1, NULL, 1, 231, 4, 'Inès', 'Evrard', '1993-10-10', 'Guibertboeuf', 'FR40275698324375C3F65BNM745', '92774', '32360', '1998-12-05', 'Célibataire', 'Féminin', 1, 'adrienrenault@univ-thies.sn', 'vaillant.raymond@yahoo.fr', NULL, NULL, '+33 (0)9 73 98 61 22', '+33 7 76 27 67 80', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1028, 5, NULL, 1, 160, 1, 'Simone', 'Diallo', '2011-12-07', 'LemoineBourg', 'FR5474036981873H6O7Q6RM5897', '60323', '90333', '1998-08-12', 'Célibataire', 'Féminin', 1, 'matthieufrancois@univ-thies.sn', 'jjacques@prevost.com', NULL, NULL, '+33 6 09 14 50 09', '+33 1 11 81 39 63', 4, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1029, 5, NULL, 1, 223, 4, 'Thérèse', 'Gauthier', '1994-03-23', 'Barthelemydan', 'FR6250924786886B19G663B4N15', '20054', '85965', '2015-03-19', 'Célibataire', 'Féminin', 1, 'juliettesimon-schmitt@univ-thies.sn', 'adrienne.lesage@morvan.org', NULL, NULL, '+33 8 95 05 45 67', '+33 1 86 37 44 06', 6, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1030, 4, NULL, 1, 14, 1, 'Thérèse', 'Boyer', '2013-04-20', 'Boucher', 'FR9630869483687ZW07T814HC14', '77 956', '83455', '2014-10-24', 'Célibataire', 'Féminin', 1, 'oc', 'sabine.leroux@jacob.net', NULL, NULL, '+33 (0)3 30 30 71 78', '06 77 70 92 72', 9, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1031, 5, NULL, 1, 234, 2, 'Emmanuel', 'Chauvin', '2007-05-06', 'BaudryBourg', 'FR400327625585N1N25OSCX0554', '69 305', '42568', '2005-08-11', 'Divorcé(e)', 'Féminin', 0, 'th', 'lucas64@gillet.com', NULL, NULL, '09 33 88 37 14', '+33 (0)6 78 26 88 46', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1032, 4, NULL, 1, 225, 4, 'Xavier', 'Durand', '1978-03-29', 'Roger', 'FR4966233911541466VBS97FO19', '80348', '14068', '2021-04-24', 'Célibataire', 'Masculin', 1, 'alexdelablot@univ-thies.sn', 'alfred57@orange.fr', NULL, NULL, '02 84 70 12 80', '+33 (0)1 83 01 05 44', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1033, 1, NULL, 1, 200, 2, 'Christiane', 'Lecomte', '1977-09-01', 'Mathieu', 'FR31962815094140ZX8E198HQ24', '05154', '14743', '2008-01-08', 'Célibataire', 'Féminin', 1, 'augustebarthelemy@univ-thies.sn', 'rgrenier@marie.fr', NULL, NULL, '0413694905', '0693769679', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1034, 1, NULL, 1, 59, 3, 'Thomas', 'Lamy', '2012-09-11', 'Martineau', 'FR3472412943933K66WS691A928', '72 868', '38 845', '2009-10-02', 'Célibataire', 'Féminin', 0, 'xavierrodriguez@univ-thies.sn', 'sabine04@orange.fr', NULL, NULL, '04 42 38 64 45', '0185240651', 3, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1035, 5, NULL, 1, 191, 3, 'Valentine', 'Dupont', '2020-09-09', 'Guillaume', 'FR325301834158W451422DB8052', '43 074', '49 409', '2004-05-23', 'Célibataire', 'Féminin', 0, 'valentineperrier@univ-thies.sn', 'marine06@bouchet.com', NULL, NULL, '+33 (0)2 88 53 86 16', '+33 (0)3 52 33 52 61', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1036, 1, NULL, 1, 79, 4, 'Thibaut', 'Dumas', '2018-03-23', 'Normanddan', 'FR303737292946TLTU770XJ6410', '74 643', '32519', '2017-09-13', 'Marié(e)', 'Féminin', 0, 'robertblanc@univ-thies.sn', 'gnicolas@vaillant.net', NULL, NULL, '+33 7 52 43 26 17', '05 99 38 30 79', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1037, 4, NULL, 1, 174, 2, 'Adrien', 'Normand', '1975-09-05', 'Salmon-sur-Rossi', 'FR6034334040390S733VY28X770', '71508', '57216', '2019-07-22', 'Marié(e)', 'Masculin', 1, 'matthieuleblanc@univ-thies.sn', 'bchretien@tiscali.fr', NULL, NULL, '0981596452', '0198798298', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1038, 5, NULL, 1, 36, 4, 'Hortense', 'Pires', '1994-07-15', 'Pruvost', 'FR696631442504PLS8EWFJ22739', '32325', '23222', '1977-05-14', 'Célibataire', 'Féminin', 0, 'simonecolas@univ-thies.sn', 'guilbert.jacqueline@nicolas.fr', NULL, NULL, '03 71 02 12 02', '07 42 79 74 80', 9, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1039, 4, NULL, 1, 45, 2, 'Roger', 'Delmas', '2015-06-24', 'PrevostBourg', 'FR693234180478N4E2603VSEQ06', '53943', '56326', '1985-08-31', 'Célibataire', 'Féminin', 1, 'oc', 'avallee@gaudin.net', NULL, NULL, '0168700938', '+33 (0)7 74 41 24 74', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1040, 5, NULL, 1, 134, 4, 'Thibaut', 'Monnier', '1986-03-01', 'Labbe-sur-Rousset', 'FR583042250827AL1CV0MJBVT28', '94 441', '70 285', '2017-01-19', 'Veuf(ve)', 'Masculin', 1, 'margotseguin-grenier@univ-thies.sn', 'lucy44@besson.org', NULL, NULL, '02 70 16 44 22', '+33 2 98 79 50 97', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1041, 1, NULL, 1, 53, 1, 'Arnaude', 'Voisin', '2010-10-08', 'LetellierVille', 'FR4644921107937UMS2T8QY8J42', '20 145', '78525', '2007-11-11', 'Divorcé(e)', 'Masculin', 0, 'c', 'charlotte69@tele2.fr', NULL, NULL, '+33 9 52 64 45 97', '+33 6 27 69 05 19', 5, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1042, 5, NULL, 1, 50, 3, 'Étienne', 'Grenier', '1980-11-16', 'Blancdan', 'FR82923885269565EDQR1FX6675', '70714', '85374', '1983-11-06', 'Célibataire', 'Masculin', 1, 'g', 'nathalie47@loiseau.com', NULL, NULL, '+33 8 19 91 22 15', '0547715944', 9, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1043, 4, NULL, 1, 23, 2, 'Alice', 'Michaud', '2017-09-04', 'Meunier', 'FR2121047190747102083TAY116', '85 807', '67 826', '2012-04-20', 'Veuf(ve)', 'Masculin', 0, 'patriciafournier@univ-thies.sn', 'margaux26@gmail.com', NULL, NULL, '+33 (0)2 49 19 51 06', '0699495598', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1044, 5, NULL, 1, 35, 3, 'Arthur', 'Lambert', '1976-08-18', 'Faivre', 'FR433007871206KBL8W2UA5CI41', '44401', '08562', '1989-11-20', 'Marié(e)', 'Masculin', 0, 'auroremichaud@univ-thies.sn', 'amaillot@tiscali.fr', NULL, NULL, '0162169345', '+33 (0)9 66 45 96 79', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1045, 5, NULL, 1, 166, 2, 'Thomas', 'Aubert', '1984-05-28', 'Seguinnec', 'FR486387709376AS0B097G5L115', '37 645', '30 538', '1990-04-27', 'Divorcé(e)', 'Masculin', 1, 'chantalduguichard@univ-thies.sn', 'blanchard.elodie@bailly.com', NULL, NULL, '06 71 40 57 02', '+33 (0)6 59 12 18 14', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1046, 4, NULL, 1, 69, 3, 'Olivier', 'Potier', '2019-05-27', 'Thomas-les-Bains', 'FR824715678318DYD9YF1A1Z655', '06 190', '92299', '1971-05-20', 'Divorcé(e)', 'Féminin', 0, 'auguste-nicolasgermain@univ-thies.sn', 'margaud.guillot@gmail.com', NULL, NULL, '09 75 13 29 79', '0352676081', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1047, 1, NULL, 1, 177, 2, 'Alice', 'Denis', '2000-01-07', 'Le Gall-les-Bains', 'FR036421700095A42D41I2RLI05', '05063', '95 715', '1987-04-24', 'Divorcé(e)', 'Féminin', 1, 'guylegendre@univ-thies.sn', 'thomas72@ribeiro.fr', NULL, NULL, '0315842014', '+33 9 17 47 53 76', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1048, 5, NULL, 1, 63, 3, 'Louis', 'Gimenez', '1991-10-18', 'Benarddan', 'FR768848003894W2DH7ICR1OK96', '38 693', '25757', '1972-03-31', 'Célibataire', 'Féminin', 0, 'marceldedelattre@univ-thies.sn', 'guillot.michelle@gmail.com', NULL, NULL, '+33 7 41 81 87 58', '+33 (0)1 31 26 54 31', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1049, 5, NULL, 1, 53, 3, 'Jules', 'Guerin', '2008-07-11', 'Bousquet-sur-Baudry', 'FR132033339459L73USK2T29227', '39 007', '34 686', '2008-02-09', 'Marié(e)', 'Féminin', 0, 'mauricepetitjean@univ-thies.sn', 'benjamin.aubert@yahoo.fr', NULL, NULL, '+33 (0)9 66 21 28 84', '02 90 57 29 12', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1050, 5, NULL, 1, 145, 1, 'Monique', 'Mary', '2003-03-16', 'Benard', 'FR247273622268EBSW699WNBP47', '24 884', '30885', '1974-07-10', 'Veuf(ve)', 'Féminin', 1, 'charlottemorin@univ-thies.sn', 'pottier.jules@dbmail.com', NULL, NULL, '+33 (0)1 15 30 15 81', '+33 (0)8 22 90 73 10', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1051, 4, NULL, 1, 68, 3, 'Éléonore', 'Francois', '1999-08-04', 'HuetBourg', 'FR3622766569486UJEY6377K104', '57 135', '91 734', '2012-05-30', 'Veuf(ve)', 'Masculin', 0, 'no', 'augustin.pineau@sfr.fr', NULL, NULL, '01 63 65 09 17', '+33 3 73 28 88 88', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1052, 5, NULL, 1, 112, 3, 'Émilie', 'Albert', '1982-11-26', 'Pires', 'FR7964146193343L5I965LPL479', '63612', '03 505', '2000-11-22', 'Célibataire', 'Féminin', 0, 'mauricecarre-simon@univ-thies.sn', 'patricia.bonneau@raynaud.fr', NULL, NULL, '07 52 54 54 59', '+33 2 22 88 42 40', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1053, 5, NULL, 1, 115, 1, 'Louis', 'Barthelemy', '1995-08-18', 'Grenier-sur-Perrot', 'FR51151451190122ASO4TW5L072', '89471', '80580', '1988-05-05', 'Divorcé(e)', 'Masculin', 1, 'oliviedelattre-laporte@univ-thies.sn', 'timothee.bigot@bouygtel.fr', NULL, NULL, '+33 (0)1 81 01 89 17', '02 83 42 44 50', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1054, 1, NULL, 1, 222, 4, 'Astrid', 'Guibert', '1992-07-18', 'Rousseau-sur-Mer', 'FR949871238594Y8JGD21X95N17', '27 345', '93 757', '2008-07-25', 'Célibataire', 'Féminin', 1, '', 'diallo.margot@gimenez.fr', NULL, NULL, '0292165596', '0335467243', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1055, 4, NULL, 1, 107, 1, 'Jules', 'Fontaine', '2005-12-22', 'Valletdan', 'FR7605718492230TJ77EP45FH15', '86410', '75658', '1980-05-15', 'Célibataire', 'Féminin', 0, 'timoth', 'kferreira@dias.org', NULL, NULL, '0811576716', '+33 (0)3 23 22 32 01', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1056, 4, NULL, 1, 160, 1, 'Denis', 'Gilbert', '1995-12-12', 'Pascal', 'FR0217610287140X25F963Y3W45', '30570', '03 420', '1998-11-30', 'Marié(e)', 'Féminin', 0, 'mich', 'constance.lemonnier@bouygtel.fr', NULL, NULL, '0519663412', '+33 2 72 66 24 02', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1057, 5, NULL, 1, 22, 3, 'Émilie', 'De Sousa', '1997-07-14', 'GeorgesBourg', 'FR2678671730899C73XZ13BB561', '54238', '38928', '1988-03-31', 'Veuf(ve)', 'Masculin', 1, 'andr', 'dominique19@lefevre.com', NULL, NULL, '04 04 92 06 74', '+33 (0)1 77 12 50 45', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1058, 1, NULL, 1, 43, 2, 'Monique', 'Fleury', '2008-11-20', 'Marie', 'FR603893967306ZW38YSM379P41', '70 405', '85 682', '1978-12-08', 'Marié(e)', 'Féminin', 1, 'alfredbodin@univ-thies.sn', 'theodore55@bouygtel.fr', NULL, NULL, '0469988821', '0964133433', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1059, 5, NULL, 1, 203, 1, 'Pierre', 'Letellier', '2018-08-29', 'Roux-sur-Chauvin', 'FR750858651601JQW16ANQBH634', '09224', '97 865', '1992-01-12', 'Divorcé(e)', 'Féminin', 0, 'mauricelelievre@univ-thies.sn', 'alexandre.fleury@club-internet.fr', NULL, NULL, '+33 6 84 97 70 83', '+33 9 93 17 38 97', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1060, 5, NULL, 1, 104, 2, 'Franck', 'Arnaud', '1990-09-17', 'Lebreton', 'FR9696776575518B1U6DVI30U47', '20946', '80 395', '1991-09-25', 'Veuf(ve)', 'Féminin', 0, '', 'wmartins@ifrance.com', NULL, NULL, '08 11 16 74 83', '+33 (0)8 95 30 56 39', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1061, 4, NULL, 1, 70, 2, 'Dorothée', 'Delattre', '1990-01-06', 'Adam', 'FR585594905140O24LQS1065Q38', '22324', '63 662', '2015-09-19', 'Célibataire', 'Masculin', 0, 'michelle-alexandrielemaire@univ-thies.sn', 'lmartins@ifrance.com', NULL, NULL, '+33 6 86 82 37 68', '+33 9 99 96 39 89', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1062, 5, NULL, 1, 200, 1, 'Xavier', 'Brunel', '2020-02-02', 'Aubry', 'FR198246997395B8PKY0E82ZG46', '17 403', '42393', '2011-07-21', 'Célibataire', 'Masculin', 0, 'c', 'olenoir@hotmail.fr', NULL, NULL, '0346997442', '09 40 20 19 01', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1063, 4, NULL, 1, 231, 3, 'Daniel', 'Toussaint', '1970-10-05', 'Descamps', 'FR924977234733R0GS0659C7565', '07 474', '60525', '1987-05-01', 'Marié(e)', 'Masculin', 0, 'ana', 'corinne.pruvost@live.com', NULL, NULL, '+33 (0)1 69 74 07 30', '0804142607', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1064, 5, NULL, 1, 230, 4, 'Astrid', 'Bazin', '1974-06-11', 'Bretonnec', 'FR981069830699RWESN78N7QC86', '14 190', '16676', '1989-07-27', 'Célibataire', 'Masculin', 1, 'sabinejoly@univ-thies.sn', 'claude30@ifrance.com', NULL, NULL, '+33 9 57 23 09 95', '+33 (0)9 63 16 78 51', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1065, 1, NULL, 1, 19, 1, 'Danielle', 'Gaillard', '2020-12-14', 'Gauthier', 'FR8308655554940E691TG2O1005', '27 019', '73817', '2019-12-28', 'Divorcé(e)', 'Féminin', 1, 'val', 'gilbert.pinto@ifrance.com', NULL, NULL, '06 55 72 05 69', '05 44 16 42 10', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1066, 1, NULL, 1, 3, 1, 'Danielle', 'Tanguy', '2020-11-06', 'Renard-sur-Guillou', 'FR053230951185HMPT58SGN7Y83', '63 499', '89399', '2002-03-21', 'Célibataire', 'Masculin', 1, '', 'franck71@orange.fr', NULL, NULL, '+33 3 05 48 51 18', '03 10 27 56 35', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1067, 4, NULL, 1, 152, 2, 'Antoine', 'Samson', '1978-02-01', 'Poulain-la-Forêt', 'FR45522145613009FOK3D7R3U53', '65 637', '72425', '1997-04-29', 'Divorcé(e)', 'Féminin', 1, 'williamnormand-baudry@univ-thies.sn', 'germain.gabriel@cordier.fr', NULL, NULL, '+33 4 27 14 66 89', '09 28 59 17 15', 3, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1068, 4, NULL, 1, 199, 2, 'Dominique', 'Begue', '2000-02-17', 'Lefevre', 'FR043054996829NEF3XVKQ8O351', '67846', '52975', '1997-04-08', 'Marié(e)', 'Masculin', 0, 'michelberger@univ-thies.sn', 'procher@wanadoo.fr', NULL, NULL, '+33 (0)5 58 51 77 42', '01 12 36 21 12', 7, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1069, 4, NULL, 1, 126, 4, 'Antoine', 'Marin', '2004-10-10', 'SchneiderBourg', 'FR240599009504WE04YAX6I7707', '03 873', '17 830', '1973-06-01', 'Veuf(ve)', 'Féminin', 0, 'capucinebouchet@univ-thies.sn', 'joseph57@tiscali.fr', NULL, NULL, '01 34 34 66 15', '+33 (0)7 33 27 84 54', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1070, 5, NULL, 1, 156, 1, 'Constance', 'Girard', '2005-08-10', 'Perez', 'FR2767384135539F1I575O7W621', '29 173', '44 790', '1997-03-10', 'Marié(e)', 'Féminin', 1, 'paulinefouquet-lejeune@univ-thies.sn', 'ymaurice@guilbert.fr', NULL, NULL, '0299266669', '0157163130', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1071, 1, NULL, 1, 164, 1, 'Claudine', 'Bouvet', '1981-01-20', 'Salmon-sur-Bonneau', 'FR958227240248OBH559BBMIL30', '17913', '22868', '2003-01-11', 'Veuf(ve)', 'Féminin', 0, 'bernadette-brigittebenoit@univ-thies.sn', 'stephanie.garnier@tele2.fr', NULL, NULL, '+33 (0)8 23 05 18 12', '+33 4 48 37 13 16', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1072, 4, NULL, 1, 9, 1, 'Marine', 'Blondel', '1992-01-21', 'Colletboeuf', 'FR69834559193744441E2I58V33', '56039', '90145', '1990-02-03', 'Célibataire', 'Masculin', 1, 'rolanddecosta@univ-thies.sn', 'boucher.jeanne@dbmail.com', NULL, NULL, '08 13 60 94 00', '+33 2 42 35 50 54', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1073, 4, NULL, 1, 204, 3, 'Éléonore', 'Evrard', '1982-02-09', 'Hardy-sur-Hamon', 'FR565271585372XT7SGKWF3CT49', '72 309', '10690', '2014-09-06', 'Marié(e)', 'Féminin', 0, 'augustedelabaron@univ-thies.sn', 'klegros@yahoo.fr', NULL, NULL, '+33 (0)2 38 33 31 21', '0131701740', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1074, 5, NULL, 1, 164, 4, 'Isaac', 'Rodriguez', '2009-09-17', 'Regnier', 'FR512016564358LPO7L7TIH7L47', '38 300', '60461', '2001-01-17', 'Veuf(ve)', 'Masculin', 0, 'thomasgilles@univ-thies.sn', 'caron.simone@benoit.fr', NULL, NULL, '+33 (0)8 14 75 92 82', '+33 (0)1 38 15 14 93', 4, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1075, 4, NULL, 1, 211, 1, 'Paul', 'Pascal', '1987-06-17', 'Lucasdan', 'FR4816811700739Z7J5WZ2E6E81', '38613', '40 854', '1982-12-07', 'Marié(e)', 'Masculin', 1, 'xavierdemoulin@univ-thies.sn', 'jbernier@free.fr', NULL, NULL, '+33 4 69 52 68 96', '0548001149', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1076, 5, NULL, 1, 228, 4, 'Isaac', 'Diaz', '1970-05-08', 'Didier', 'FR7986292265708MUXKC7E8B139', '18678', '05134', '2012-10-28', 'Marié(e)', 'Féminin', 0, 'thierrylouis@univ-thies.sn', 'charrier.isabelle@merle.com', NULL, NULL, '+33 (0)8 20 89 53 64', '+33 2 19 74 76 44', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1077, 4, NULL, 1, 122, 3, 'André', 'Klein', '2014-09-20', 'Dias', 'FR270970390774LT11P3XQ1J111', '75 990', '67 485', '1975-09-19', 'Marié(e)', 'Féminin', 0, 'moniquebegue-thibault@univ-thies.sn', 'david99@julien.fr', NULL, NULL, '01 88 35 60 22', '0330539459', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1078, 4, NULL, 1, 75, 2, 'Laure', 'Leleu', '2011-05-06', 'Leclerc', 'FR192643546834LBIXLDB481J29', '55004', '52899', '1980-05-21', 'Divorcé(e)', 'Féminin', 1, 'valentinehamon@univ-thies.sn', 'alain.pierre@laposte.net', NULL, NULL, '+33 (0)7 68 27 64 81', '0551495074', 5, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1079, 4, NULL, 1, 24, 4, 'Emmanuelle', 'Schneider', '1988-06-24', 'Lagarde-sur-Vasseur', 'FR728845617524OM0Y97I582G90', '47610', '01 266', '2017-11-02', 'Célibataire', 'Masculin', 0, 'claudinenguyen@univ-thies.sn', 'veronique.leroux@dasilva.com', NULL, NULL, '0596196589', '+33 (0)9 52 75 77 73', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1080, 4, NULL, 1, 144, 3, 'Augustin', 'Gilles', '2004-07-07', 'Robinnec', 'FR741688642315E14L1A363Q859', '45 788', '12 589', '1988-09-16', 'Divorcé(e)', 'Masculin', 0, 'emmanuellecaron@univ-thies.sn', 'fernandes.nathalie@besson.fr', NULL, NULL, '+33 (0)3 19 60 14 97', '+33 (0)5 93 87 49 76', 4, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1081, 4, NULL, 1, 75, 4, 'Maggie', 'Thibault', '1985-03-10', 'Alves', 'FR6655871254644602M96IY0855', '21605', '96839', '1995-10-09', 'Veuf(ve)', 'Féminin', 0, 'arnaudeleconte@univ-thies.sn', 'elise.devaux@pineau.fr', NULL, NULL, '0290278041', '+33 (0)4 55 23 64 91', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1082, 4, NULL, 1, 197, 2, 'Virginie', 'Arnaud', '2003-11-06', 'Prevost', 'FR425433747025UGTK082Q9EZ98', '58104', '14 722', '1988-08-08', 'Marié(e)', 'Masculin', 1, 'patricklefevre@univ-thies.sn', 'celine.jourdan@club-internet.fr', NULL, NULL, '07 87 43 84 88', '0174946752', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1083, 1, NULL, 1, 149, 3, 'Grégoire', 'Rodriguez', '2021-01-13', 'Jacquet', 'FR686359125702DP3FS8O8DR963', '78 387', '90488', '1971-12-28', 'Divorcé(e)', 'Masculin', 0, 'isabellealexandre@univ-thies.sn', 'roy.augustin@gosselin.com', NULL, NULL, '+33 (0)7 82 39 26 58', '+33 (0)6 62 99 24 52', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1084, 1, NULL, 1, 140, 1, 'Sébastien', 'Voisin', '2017-07-16', 'Carpentierboeuf', 'FR394501198142D959F2TZ1M605', '24 523', '14 369', '1986-11-21', 'Veuf(ve)', 'Féminin', 0, 'audreyduhamel@univ-thies.sn', 'morel.richard@guibert.org', NULL, NULL, '0978034555', '+33 1 87 87 51 46', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1085, 1, NULL, 1, 106, 3, 'Benoît', 'Buisson', '2014-12-13', 'Bailly', 'FR0392828327487E19ZL2T39390', '37 775', '79711', '2009-12-05', 'Veuf(ve)', 'Masculin', 0, 'matthieupetit@univ-thies.sn', 'brunel.emmanuel@ifrance.com', NULL, NULL, '0950539048', '+33 1 29 02 83 83', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1086, 1, NULL, 1, 58, 4, 'Thierry', 'Pelletier', '1988-04-13', 'PierreVille', 'FR9628650569055B0C9ZXXWK196', '52 995', '60 159', '2015-02-22', 'Marié(e)', 'Masculin', 0, 'louiscolin-guerin@univ-thies.sn', 'mdufour@hotmail.fr', NULL, NULL, '04 00 57 77 14', '+33 6 38 19 74 41', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1087, 5, NULL, 1, 83, 3, 'Arthur', 'Grenier', '1972-03-21', 'RodriguezVille', 'FR875293437098806FG87C93V15', '51646', '15 738', '2016-03-17', 'Célibataire', 'Masculin', 1, 'nicolelejulien@univ-thies.sn', 'celine.munoz@tiscali.fr', NULL, NULL, '0917282141', '+33 8 07 84 12 04', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1088, 1, NULL, 1, 211, 2, 'Océane', 'Blanchet', '1999-09-15', 'Jean', 'FR395742080666J49D8F973T233', '82 108', '70 977', '2013-12-16', 'Célibataire', 'Masculin', 1, 'victorlucas@univ-thies.sn', 'zacharie31@voila.fr', NULL, NULL, '+33 2 83 50 01 28', '01 24 35 09 19', 1, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1089, 5, NULL, 1, 184, 4, 'Capucine', 'Lefevre', '1980-01-02', 'Laurent', 'FR361283690447234OH3255KF16', '32044', '38 108', '2020-04-02', 'Divorcé(e)', 'Masculin', 0, 'eug', 'laetitia.fernandes@voila.fr', NULL, NULL, '+33 1 83 41 04 99', '+33 4 78 40 28 45', 2, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1090, 1, NULL, 1, 14, 4, 'Andrée', 'Meunier', '1976-06-08', 'Da Costa', 'FR17304436151760D91A0D4WX46', '31930', '33740', '1993-12-24', 'Marié(e)', 'Féminin', 1, 'eug', 'timothee.pinto@wanadoo.fr', NULL, NULL, '09 51 43 69 26', '0965736936', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1091, 4, NULL, 1, 101, 3, 'Lucas', 'Mendes', '2007-10-26', 'Ollivier', 'FR270450340662TF73S8L07LP74', '27862', '76 213', '2004-10-04', 'Célibataire', 'Féminin', 0, 'thibaultpayet@univ-thies.sn', 'gblin@bouygtel.fr', NULL, NULL, '0453919832', '0679946414', 8, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1092, 4, NULL, 1, 108, 2, 'Benoît', 'Gaudin', '2008-07-09', 'Pineau-sur-Seguin', 'FR211653382018J9UJY03MS4D23', '88903', '14 420', '1976-02-27', 'Veuf(ve)', 'Masculin', 1, 'thomasdeoliveira@univ-thies.sn', 'ymartineau@yahoo.fr', NULL, NULL, '+33 (0)5 43 17 71 34', '+33 1 92 80 92 53', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1093, 1, NULL, 1, 14, 4, 'Philippe', 'Sauvage', '2019-02-27', 'Cohen-la-Forêt', 'FR843221446413LCHEX9BM30897', '23708', '06782', '1999-08-08', 'Divorcé(e)', 'Féminin', 1, 'gilbertbarbe@univ-thies.sn', 'tanguy.gilles@wanadoo.fr', NULL, NULL, '0227537418', '04 29 92 46 64', 4, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1094, 4, NULL, 1, 116, 2, 'Frédéric', 'Benard', '1994-08-20', 'Leroy', 'FR810825758111Q65S94EJF6K96', '52 778', '50287', '1984-03-25', 'Célibataire', 'Masculin', 1, 'olivierjourdan@univ-thies.sn', 'vchauveau@ifrance.com', NULL, NULL, '+33 (0)1 30 73 41 62', '+33 5 91 71 44 72', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1095, 4, NULL, 1, 215, 3, 'Daniel', 'Charrier', '1991-06-10', 'Bertrand-sur-Ferreira', 'FR641749324816PRD234ZD0YQ33', '96721', '55206', '1970-07-02', 'Marié(e)', 'Masculin', 0, 'lucbrunel-vincent@univ-thies.sn', 'caroline67@blondel.net', NULL, NULL, '+33 1 95 92 82 76', '0172543940', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1096, 5, NULL, 1, 176, 4, 'Jeannine', 'Garcia', '2015-01-21', 'TorresBourg', 'FR620825730846EC917Z468WJ78', '36934', '90 515', '2001-06-16', 'Marié(e)', 'Masculin', 1, 'l', 'timothee61@hotmail.fr', NULL, NULL, '+33 4 66 37 38 64', '+33 (0)9 15 86 75 01', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1097, 4, NULL, 1, 140, 3, 'Sébastien', 'Blanchard', '1995-06-07', 'Marion-sur-Briand', 'FR0275364626327D328KULH2H89', '01 581', '61 601', '1988-10-29', 'Célibataire', 'Féminin', 0, 'j', 'david10@voila.fr', NULL, NULL, '+33 6 51 38 95 38', '0699982744', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1098, 4, NULL, 1, 198, 1, 'Josette', 'Bertin', '2012-08-19', 'Michel-sur-Mer', 'FR5432336295508A28W0H5BSR00', '36 509', '31 356', '1980-04-04', 'Divorcé(e)', 'Masculin', 0, 'rolandweber@univ-thies.sn', 'hriviere@guillou.fr', NULL, NULL, '+33 (0)1 02 40 39 47', '+33 6 59 74 31 21', 2, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1099, 5, NULL, 1, 67, 2, 'Étienne', 'Charpentier', '2008-01-12', 'Roux', 'FR286929963483QPH86O3Q0DG32', '44668', '31 686', '2005-06-26', 'Divorcé(e)', 'Féminin', 1, 'cl', 'celine.martel@bouygtel.fr', NULL, NULL, '0788225826', '+33 9 27 61 63 53', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1100, 1, NULL, 1, 11, 4, 'Corinne', 'Traore', '2011-12-17', 'Martins', 'FR4576556531021K8U02TC79838', '75 895', '71991', '2016-08-27', 'Divorcé(e)', 'Masculin', 1, 'oliviedossantos@univ-thies.sn', 'andre.leblanc@blanchard.com', NULL, NULL, '05 16 19 58 17', '0495148092', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1101, 5, NULL, 1, 110, 4, 'Odette', 'Simon', '1971-08-26', 'Maillet', 'FR278491732321OD40654292626', '19174', '31 757', '1979-09-01', 'Célibataire', 'Masculin', 1, 'alexandrelecoq@univ-thies.sn', 'odijoux@wanadoo.fr', NULL, NULL, '0633161686', '+33 (0)7 96 53 24 75', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1102, 1, NULL, 1, 190, 1, 'Marianne', 'Hardy', '2003-11-25', 'Potier-les-Bains', 'FR228020487718X73Z8EN1UP330', '85294', '45 308', '2006-06-24', 'Célibataire', 'Masculin', 0, 'paulhamon@univ-thies.sn', 'paul.caron@bonnet.fr', NULL, NULL, '+33 6 25 79 14 02', '+33 (0)9 46 69 15 24', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1103, 4, NULL, 1, 154, 4, 'Benoît', 'Lefebvre', '2019-10-27', 'Hardy', 'FR67412003212817941668J8W99', '68 306', '92 358', '2016-10-28', 'Veuf(ve)', 'Masculin', 0, 'tristanbazin-vincent@univ-thies.sn', 'christelle10@carre.org', NULL, NULL, '+33 9 24 63 70 26', '+33 (0)7 53 25 15 94', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1104, 4, NULL, 1, 135, 3, 'Édith', 'Valette', '2010-12-28', 'Louis', 'FR92511757012232BGV71N42187', '33238', '71868', '1998-01-18', 'Veuf(ve)', 'Masculin', 0, 'nathaliedossantos@univ-thies.sn', 'tgarnier@cousin.org', NULL, NULL, '06 42 85 42 44', '+33 8 95 26 03 68', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1105, 5, NULL, 1, 48, 1, 'Charles', 'Ribeiro', '2012-04-14', 'Bousquet', 'FR63334315729649FUI37RS7G16', '75 540', '29758', '2003-07-08', 'Divorcé(e)', 'Masculin', 1, 'th', 'sroche@riviere.org', NULL, NULL, '0607880798', '+33 (0)1 46 06 40 28', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1106, 1, NULL, 1, 214, 1, 'Gilles', 'Jacquot', '1984-04-20', 'Pelletierdan', 'FR2377227815275TAFY3NBAW081', '27 211', '72 140', '1990-10-07', 'Divorcé(e)', 'Masculin', 1, 'richardblin@univ-thies.sn', 'mgarnier@wanadoo.fr', NULL, NULL, '0107267672', '04 97 44 30 33', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1107, 5, NULL, 1, 76, 4, 'Thibault', 'Renard', '1981-05-08', 'Pelletier', 'FR848769009062YK9ELFH300W38', '04 284', '01043', '2011-01-23', 'Célibataire', 'Féminin', 0, 'th', 'theophile61@lefevre.fr', NULL, NULL, '+33 3 21 84 60 24', '0979107566', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1108, 5, NULL, 1, 73, 1, 'Gilles', 'Blanchet', '1998-04-25', 'Barbier-la-Forêt', 'FR342320847737512L06864O130', '20598', '63 480', '1970-11-14', 'Veuf(ve)', 'Féminin', 1, 'guyroy@univ-thies.sn', 'leon.ollivier@marin.fr', NULL, NULL, '0613257360', '+33 4 82 83 77 04', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1109, 1, NULL, 1, 199, 2, 'Denis', 'Devaux', '1983-10-18', 'Barbe', 'FR9504511345623F58P25I7C811', '88482', '04797', '1989-04-04', 'Célibataire', 'Masculin', 0, 'th', 'guy.tanguy@teixeira.com', NULL, NULL, '+33 (0)6 26 72 81 08', '01 49 78 64 54', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1110, 5, NULL, 1, 217, 2, 'Diane', 'De Oliveira', '2021-04-16', 'Hoareauboeuf', 'FR5596090953489LJ999F07A590', '22675', '06 253', '1992-08-15', 'Célibataire', 'Masculin', 0, 'thibaultperrot-royer@univ-thies.sn', 'julie.marchal@dupont.org', NULL, NULL, '03 65 52 10 58', '+33 1 25 57 07 92', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1111, 4, NULL, 1, 32, 3, 'Jérôme', 'Guyon', '2000-07-29', 'Marques', 'FR5437492875969Y27M0V56H909', '35179', '17990', '1972-04-06', 'Veuf(ve)', 'Masculin', 1, 'alexandreguillot@univ-thies.sn', 'julien.benjamin@dijoux.net', NULL, NULL, '+33 (0)8 95 98 15 21', '+33 (0)1 29 81 74 56', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1112, 4, NULL, 1, 186, 2, 'Anastasie', 'Roux', '1979-09-10', 'Langlois-les-Bains', 'FR8503439709648UMC8QXES1523', '62 964', '97144', '1995-02-14', 'Marié(e)', 'Féminin', 0, 'rolanddijoux@univ-thies.sn', 'collet.laurence@voila.fr', NULL, NULL, '08 97 92 92 37', '05 54 69 41 18', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL);
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(1113, 1, NULL, 1, 4, 1, 'Benjamin', 'Chevallier', '1974-02-28', 'Guerin-sur-Pinto', 'FR35647622801366QJX0FCRYA72', '00705', '58 803', '2002-02-13', 'Veuf(ve)', 'Féminin', 1, 'margueritemillet@univ-thies.sn', 'joseph.josette@yahoo.fr', NULL, NULL, '0146925711', '0915309199', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1114, 5, NULL, 1, 108, 1, 'Étienne', 'Lenoir', '1989-05-01', 'Delattre-sur-Mer', 'FR541562233739P5V91D9Z2OH88', '83 969', '03 095', '1974-11-10', 'Divorcé(e)', 'Féminin', 1, 'guyhoarau@univ-thies.sn', 'eric.leconte@orange.fr', NULL, NULL, '05 77 04 47 20', '02 12 99 28 92', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1115, 1, NULL, 1, 104, 2, 'Richard', 'Gilbert', '2001-08-09', 'Fischer', 'FR4873580620717B8RM15WT6587', '93 463', '27 747', '2015-08-08', 'Célibataire', 'Masculin', 0, 'augustindupuis@univ-thies.sn', 'rblanchard@yahoo.fr', NULL, NULL, '06 44 95 41 14', '+33 (0)5 37 18 67 12', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1116, 1, NULL, 1, 218, 4, 'Laetitia', 'Brun', '1973-09-14', 'Leblanc', 'FR3370889432382VF37KP86R413', '19 713', '12 679', '2011-05-12', 'Marié(e)', 'Féminin', 0, 'v', 'marc44@free.fr', NULL, NULL, '+33 4 94 76 49 44', '+33 3 99 35 83 57', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1117, 1, NULL, 1, 155, 4, 'Alexandrie', 'Guilbert', '1974-04-15', 'Dijoux', 'FR804997813084WKP71O3242G58', '86 264', '22620', '1971-10-15', 'Divorcé(e)', 'Masculin', 0, 'dominiquemorvan@univ-thies.sn', 'richard.dupont@pruvost.fr', NULL, NULL, '0110871744', '+33 (0)6 73 05 62 09', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1118, 1, NULL, 1, 168, 1, 'Luce', 'Coste', '2005-06-29', 'Martinez', 'FR721857692899A972K5NSIDB84', '18142', '14 367', '1995-02-15', 'Divorcé(e)', 'Masculin', 1, 'jacqueshoarau@univ-thies.sn', 'gerard02@lenoir.org', NULL, NULL, '02 55 02 87 97', '0380965212', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1119, 1, NULL, 1, 46, 2, 'Charlotte', 'Marchal', '1982-05-03', 'Caron', 'FR336549027653Z5581469IVH98', '81 650', '24465', '2011-10-24', 'Célibataire', 'Masculin', 1, 'bernadettepruvost@univ-thies.sn', 'andre.hernandez@collin.com', NULL, NULL, '04 20 67 10 29', '+33 (0)2 03 67 98 78', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1120, 4, NULL, 1, 176, 4, 'Martine', 'Hamel', '2018-09-10', 'Mallet', 'FR0389530675744FO0211262071', '08 165', '89019', '2018-12-11', 'Marié(e)', 'Féminin', 1, 'lorraineaubert-maurice@univ-thies.sn', 'patricia08@albert.fr', NULL, NULL, '+33 7 45 34 23 09', '0979378109', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1121, 1, NULL, 1, 120, 3, 'Anouk', 'Foucher', '1994-03-25', 'TecherBourg', 'FR553862614147DO8CE09JB2N82', '39740', '51074', '2006-02-07', 'Célibataire', 'Masculin', 1, 'fran', 'daniel.vaillant@didier.fr', NULL, NULL, '07 60 91 69 61', '0484586073', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1122, 5, NULL, 1, 204, 1, 'Arnaude', 'Teixeira', '1990-12-01', 'Riou', 'FR901674742028P3197E3NDV441', '02825', '05 777', '1974-08-20', 'Célibataire', 'Féminin', 0, 's', 'alfred63@noos.fr', NULL, NULL, '0300854352', '05 50 90 66 11', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1123, 1, NULL, 1, 44, 1, 'Éléonore', 'Ribeiro', '1988-05-18', 'BesnardVille', 'FR53249832090367R416219TA87', '43 774', '46 578', '1999-02-13', 'Marié(e)', 'Masculin', 0, 'claudebouvet@univ-thies.sn', 'guilbert.cecile@laposte.net', NULL, NULL, '+33 2 01 18 30 85', '+33 (0)5 82 40 38 84', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1124, 5, NULL, 1, 83, 1, 'Dominique', 'Boucher', '1976-10-10', 'PottierBourg', 'FR3939582751520SVQ6VSK95T00', '08 075', '97 176', '1983-07-30', 'Divorcé(e)', 'Masculin', 1, 'josettecoulon-muller@univ-thies.sn', 'nrey@rousset.org', NULL, NULL, '+33 (0)2 12 85 19 66', '+33 (0)8 97 93 26 14', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1125, 5, NULL, 1, 55, 2, 'Danielle', 'Chretien', '1989-10-24', 'MunozBourg', 'FR49629399103512X47N3N3E897', '46235', '50888', '1971-06-04', 'Divorcé(e)', 'Féminin', 1, '', 'hugues.philippe@hotmail.fr', NULL, NULL, '+33 3 38 52 29 10', '0526125476', 6, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1126, 1, NULL, 1, 5, 4, 'Mathilde', 'Lemaitre', '2020-01-18', 'DupuyBourg', 'FR3579213337565YA313E891H08', '09387', '37911', '2013-08-28', 'Marié(e)', 'Féminin', 0, 'thierrylevy@univ-thies.sn', 'nlecomte@vaillant.com', NULL, NULL, '+33 6 20 32 09 33', '01 51 93 47 94', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1127, 5, NULL, 1, 193, 2, 'Émilie', 'Teixeira', '1993-07-04', 'Durand', 'FR598212798309395WY61B53704', '00 532', '76 172', '2000-07-31', 'Marié(e)', 'Féminin', 0, 'no', 'hpoirier@lecomte.fr', NULL, NULL, '01 75 93 59 25', '+33 9 29 14 20 57', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1128, 4, NULL, 1, 135, 4, 'Joseph', 'Raymond', '1994-06-16', 'Hardydan', 'FR143382063563P712BL1YI9T57', '22603', '35577', '1974-05-24', 'Divorcé(e)', 'Féminin', 1, 'michellebouchet@univ-thies.sn', 'roland44@live.com', NULL, NULL, '+33 5 33 61 63 81', '0146196073', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1129, 5, NULL, 1, 207, 1, 'Martin', 'Lesage', '1999-11-12', 'Blondelboeuf', 'FR308695087059Q93UN40H3X784', '93 971', '78 119', '2008-09-30', 'Divorcé(e)', 'Masculin', 1, 'gillesrolland-dubois@univ-thies.sn', 'rmarchal@charles.fr', NULL, NULL, '01 65 11 37 80', '02 58 02 71 44', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1130, 4, NULL, 1, 171, 4, 'Lucas', 'Delannoy', '2000-05-13', 'Albertboeuf', 'FR349800142836T73S88067FY55', '74 611', '87392', '1971-08-04', 'Marié(e)', 'Féminin', 0, 'alicelegonzalez@univ-thies.sn', 'danielle94@tiscali.fr', NULL, NULL, '03 80 87 11 48', '+33 (0)4 31 52 31 94', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1131, 4, NULL, 1, 6, 4, 'Nicolas', 'Riviere', '1987-05-19', 'Leblanc', 'FR481136063824HP07042OLZE89', '05858', '79944', '1986-04-19', 'Divorcé(e)', 'Féminin', 1, 'denisdelagosselin@univ-thies.sn', 'kweiss@yahoo.fr', NULL, NULL, '+33 (0)1 39 62 51 67', '08 95 56 94 39', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1132, 4, NULL, 1, 169, 3, 'Charles', 'Clerc', '2016-08-04', 'Martineau', 'FR959651585099EAO67M38K8U21', '96 812', '12616', '2010-05-29', 'Veuf(ve)', 'Masculin', 0, 'julesraymond-paris@univ-thies.sn', 'louis50@bouygtel.fr', NULL, NULL, '+33 (0)4 68 30 37 38', '+33 (0)7 93 12 14 79', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1133, 5, NULL, 1, 41, 3, 'Constance', 'Joubert', '2016-07-09', 'Le Goff', 'FR869548491682QBG91DN1S5667', '27154', '97 932', '1984-10-18', 'Divorcé(e)', 'Féminin', 0, 'vincentdupires@univ-thies.sn', 'fischer.clemence@pires.com', NULL, NULL, '0119442970', '+33 (0)9 31 66 12 73', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1134, 4, NULL, 1, 18, 3, 'Margot', 'Hardy', '1982-02-17', 'Baron-sur-Chauveau', 'FR49626905877124QRXE12BDM34', '86819', '95 615', '1984-11-20', 'Divorcé(e)', 'Masculin', 1, 'xavierpoirier-leconte@univ-thies.sn', 'alex68@maillard.fr', NULL, NULL, '+33 1 32 54 12 67', '+33 7 35 27 86 89', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1135, 4, NULL, 1, 111, 4, 'Gérard', 'Paul', '1980-02-09', 'Marinnec', 'FR4899510579753ZQHEF0N5OL94', '48 741', '60480', '2009-02-08', 'Célibataire', 'Masculin', 1, 'victoiremasse-chretien@univ-thies.sn', 'blanchet.eugene@wanadoo.fr', NULL, NULL, '+33 (0)6 85 62 01 95', '0653204552', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1136, 4, NULL, 1, 229, 2, 'Margaux', 'Guillou', '1998-12-05', 'Maury-la-Forêt', 'FR258794773929WPM8D7NAC8A66', '59 995', '73 056', '2006-04-27', 'Divorcé(e)', 'Masculin', 1, 'danieldesousa-collet@univ-thies.sn', 'guillaume72@ferrand.fr', NULL, NULL, '0694996402', '0730373056', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1137, 5, NULL, 1, 36, 4, 'Élisabeth', 'Roussel', '1988-02-01', 'Ledoux', 'FR654742579776H90PQ3D9R2989', '31 865', '04 832', '1996-10-04', 'Veuf(ve)', 'Féminin', 1, 'adrienmeunier@univ-thies.sn', 'joly.anouk@sfr.fr', NULL, NULL, '01 89 90 49 02', '0127787318', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1138, 4, NULL, 1, 64, 3, 'Alix', 'Dupuy', '1970-12-30', 'Chauvinnec', 'FR029801078750U0Z8Z7DL90789', '58 553', '56 248', '2008-03-14', 'Marié(e)', 'Masculin', 1, 'lucyjoseph@univ-thies.sn', 'arnaude45@tele2.fr', NULL, NULL, '0576158722', '0124612385', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1139, 4, NULL, 1, 54, 4, 'Gérard', 'Dupuis', '2011-07-30', 'Parent', 'FR717025586294YYC49BOA2IR90', '44 808', '81 416', '2014-03-07', 'Marié(e)', 'Féminin', 1, 'thierrycoulon@univ-thies.sn', 'bmorin@free.fr', NULL, NULL, '04 87 72 04 74', '+33 (0)1 61 11 08 31', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1140, 4, NULL, 1, 179, 3, 'Gérard', 'Mendes', '1996-06-01', 'Hamon-les-Bains', 'FR632876447208XN78BI2P98418', '02 639', '49 576', '2004-06-13', 'Célibataire', 'Masculin', 0, 'pierreolivier@univ-thies.sn', 'tschmitt@toussaint.com', NULL, NULL, '+33 1 57 21 34 92', '+33 4 59 05 37 86', 7, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1141, 5, NULL, 1, 106, 1, 'Henri', 'Thibault', '1973-09-29', 'Roche', 'FR4865231908471AYV56513F084', '89 172', '54747', '1988-10-26', 'Marié(e)', 'Masculin', 0, 'marysedelaweiss@univ-thies.sn', 'tgosselin@hoareau.fr', NULL, NULL, '05 77 68 38 00', '+33 (0)7 67 51 54 37', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1142, 4, NULL, 1, 236, 3, 'Jérôme', 'Lucas', '2000-09-29', 'Perez', 'FR3172879058488CY21FU96C834', '72 855', '34 335', '1995-07-09', 'Marié(e)', 'Masculin', 0, 'in', 'diane03@cordier.org', NULL, NULL, '+33 5 15 43 24 40', '07 99 57 53 33', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1143, 5, NULL, 1, 170, 3, 'Suzanne', 'Roussel', '1973-05-17', 'Torresdan', 'FR0437827344597KEI27HD92Y29', '59 580', '27166', '1976-10-20', 'Célibataire', 'Féminin', 1, 'doroth', 'alfred.mathieu@delahaye.com', NULL, NULL, '+33 (0)6 62 68 42 78', '02 07 57 42 09', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1144, 5, NULL, 1, 229, 2, 'Marcel', 'Thibault', '2007-05-09', 'Guillondan', 'FR7328299974514Y9LY6C846756', '62 483', '86 244', '1985-04-01', 'Marié(e)', 'Féminin', 0, 'aim', 'aime.navarro@ifrance.com', NULL, NULL, '+33 5 91 74 67 78', '+33 1 20 35 19 98', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1145, 1, NULL, 1, 118, 1, 'Éric', 'Leclerc', '2013-03-01', 'Guillon', 'FR2320759269436G6E74X615O74', '44 403', '79304', '1995-07-06', 'Marié(e)', 'Féminin', 1, 'zo', 'dijoux.edith@tiscali.fr', NULL, NULL, '02 46 67 01 66', '0174535736', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1146, 1, NULL, 1, 91, 4, 'Corinne', 'De Oliveira', '2004-07-14', 'Monnier', 'FR08758338446532A93O435O488', '36 772', '15 056', '2009-07-23', 'Célibataire', 'Féminin', 0, 'jacquesdelagarde@univ-thies.sn', 'louis31@couturier.fr', NULL, NULL, '+33 6 91 14 15 88', '+33 (0)1 69 88 28 82', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1147, 5, NULL, 1, 191, 2, 'Marine', 'Michel', '2000-03-05', 'Goncalves', 'FR34007690664055P05OF0ZZQ28', '42760', '14103', '2014-02-01', 'Veuf(ve)', 'Masculin', 1, 'bertrand-adrienleclerc@univ-thies.sn', 'roger.lacombe@mahe.net', NULL, NULL, '0260236056', '0674270064', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1148, 5, NULL, 1, 86, 4, 'Adrien', 'Bigot', '1975-08-22', 'Toussaint', 'FR749137190168X4VE093S58X31', '32 389', '11 020', '1972-07-17', 'Veuf(ve)', 'Masculin', 0, 'simonelacombe@univ-thies.sn', 'sabine19@tele2.fr', NULL, NULL, '+33 (0)3 95 18 76 61', '07 38 67 05 53', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1149, 4, NULL, 1, 215, 4, 'Yves', 'Guyot', '1984-09-17', 'De Oliveira', 'FR633661263996Z8EZDS76Q4N59', '46237', '44 443', '1979-01-03', 'Marié(e)', 'Féminin', 1, 'josettelelievre@univ-thies.sn', 'lenoir.alix@jourdan.org', NULL, NULL, '05 49 37 58 91', '+33 1 29 64 31 36', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1150, 4, NULL, 1, 201, 4, 'Marcel', 'Le Gall', '1983-05-15', 'Leroux', 'FR213010304557DK186069VT156', '66 496', '87948', '2003-01-23', 'Marié(e)', 'Masculin', 1, '', 'hortense.menard@laposte.net', NULL, NULL, '+33 (0)1 73 96 24 01', '+33 (0)4 01 60 31 18', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1151, 5, NULL, 1, 91, 1, 'Marcelle', 'Morin', '2019-06-11', 'Fischer', 'FR987057212076WDB057W0LS931', '25 207', '87 086', '1990-12-25', 'Divorcé(e)', 'Masculin', 0, 'l', 'lucas05@bernier.com', NULL, NULL, '+33 1 07 11 16 75', '0103365092', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1152, 4, NULL, 1, 195, 4, 'Antoinette', 'Gros', '1977-07-20', 'Collin-la-Forêt', 'FR576746723416AOWQCJT179O03', '38 328', '33141', '1983-09-04', 'Marié(e)', 'Féminin', 0, 'arthurboucher@univ-thies.sn', 'kmahe@gmail.com', NULL, NULL, '09 39 19 51 63', '0122863080', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1153, 1, NULL, 1, 214, 4, 'Roland', 'Charles', '2018-08-12', 'Riviere', 'FR20232460208252243NM5WYO04', '88 581', '63 761', '1972-11-22', 'Célibataire', 'Féminin', 1, 'daniellepeltier@univ-thies.sn', 'antoine97@hotmail.fr', NULL, NULL, '+33 (0)4 27 38 26 75', '+33 (0)7 97 05 09 18', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1154, 5, NULL, 1, 214, 4, 'Bernadette', 'Jacob', '1970-09-08', 'Mahe', 'FR94073677990929LNNO16UP921', '71639', '36 053', '1996-03-27', 'Veuf(ve)', 'Féminin', 0, 'robertbrunet@univ-thies.sn', 'renee.laroche@noos.fr', NULL, NULL, '0617441235', '+33 (0)6 01 22 90 28', 4, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1155, 4, NULL, 1, 96, 4, 'Hugues', 'Grondin', '2015-07-10', 'Riviere', 'FR1085667330611U57ZBCW51683', '83502', '17 832', '2017-11-24', 'Divorcé(e)', 'Masculin', 0, 'marc-rolandcarlier@univ-thies.sn', 'guibert.augustin@club-internet.fr', NULL, NULL, '07 49 41 82 40', '0253714940', 5, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1156, 4, NULL, 1, 58, 2, 'Véronique', 'Maillot', '2000-03-02', 'Millet', 'FR0810112038533O5FGIJ96M307', '15156', '94 530', '1979-07-21', 'Veuf(ve)', 'Féminin', 0, 'philippelopes-ruiz@univ-thies.sn', 'fmoulin@guillot.com', NULL, NULL, '08 08 56 79 01', '08 95 71 12 93', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1157, 5, NULL, 1, 1, 3, 'Madeleine', 'Ferrand', '1994-06-24', 'Guichardboeuf', 'FR9315144612849HLHJWYC2VM78', '63 313', '42 834', '2005-04-28', 'Divorcé(e)', 'Féminin', 1, 'dianerolland@univ-thies.sn', 'roland.michel@lebreton.com', NULL, NULL, '+33 2 86 62 32 68', '+33 (0)6 10 80 48 90', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1158, 5, NULL, 1, 82, 4, 'Vincent', 'Payet', '1982-04-14', 'Laurent', 'FR06002044674246IPFLL03I697', '46 466', '20 277', '1973-02-28', 'Divorcé(e)', 'Féminin', 1, 'manoncousin@univ-thies.sn', 'william.laine@tiscali.fr', NULL, NULL, '+33 6 87 02 36 89', '+33 (0)1 45 08 82 42', 4, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1159, 4, NULL, 1, 47, 1, 'Victoire', 'Berger', '2016-12-05', 'FleuryBourg', 'FR669031912761257GI11BL5495', '98865', '46 848', '2004-03-07', 'Veuf(ve)', 'Masculin', 1, 'jeanlaporte-alves@univ-thies.sn', 'emile.besson@tiscali.fr', NULL, NULL, '+33 1 79 08 12 29', '02 81 04 79 03', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1160, 4, NULL, 1, 109, 4, 'Denis', 'Chartier', '1979-03-15', 'Duvalnec', 'FR7531637358411GU3U4BXJE945', '54 295', '10639', '2003-05-03', 'Divorcé(e)', 'Masculin', 1, 'lucpasquier@univ-thies.sn', 'simone41@diaz.org', NULL, NULL, '+33 8 93 46 64 27', '0124465468', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1161, 5, NULL, 1, 78, 4, 'Anouk', 'Riou', '1970-02-02', 'Rousseau', 'FR374400236741J1L60O9S64851', '64 133', '01 718', '1991-09-06', 'Célibataire', 'Masculin', 0, '', 'martin.clemence@barbe.com', NULL, NULL, '07 89 82 35 40', '+33 6 00 18 25 21', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1162, 4, NULL, 1, 196, 2, 'Inès', 'Pages', '2012-06-20', 'Barbenec', 'FR93331212283579830ABOO9720', '02 763', '13 539', '1996-05-02', 'Célibataire', 'Masculin', 0, 'louisrenaud@univ-thies.sn', 'maurice69@bazin.fr', NULL, NULL, '09 26 68 78 54', '01 01 00 54 23', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1163, 5, NULL, 1, 199, 3, 'Adèle', 'Lejeune', '1970-07-03', 'ReynaudBourg', 'FR3826256105715XQ7444472816', '28503', '46 227', '2016-12-17', 'Célibataire', 'Masculin', 1, 'jeanne-valentinelaporte@univ-thies.sn', 'ssalmon@club-internet.fr', NULL, NULL, '+33 (0)7 51 93 07 82', '0207929295', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1164, 5, NULL, 1, 12, 3, 'Élise', 'Faure', '1970-06-21', 'Bourdon', 'FR248821058073PW6R2208PA559', '15666', '84856', '1970-03-24', 'Veuf(ve)', 'Féminin', 1, 'marcelle-paulettedurand@univ-thies.sn', 'amelie.bigot@club-internet.fr', NULL, NULL, '04 96 23 67 71', '+33 (0)1 34 67 25 25', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1165, 5, NULL, 1, 45, 4, 'Jacqueline', 'Teixeira', '2008-12-14', 'Pelletier', 'FR67592935193120QQE07B53J73', '83 232', '92 470', '2012-11-25', 'Veuf(ve)', 'Féminin', 0, 'bertrandclement@univ-thies.sn', 'gilles.moreau@jourdan.fr', NULL, NULL, '+33 5 01 46 86 28', '01 66 75 22 67', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1166, 5, NULL, 1, 188, 4, 'Julien', 'Adam', '2016-05-15', 'Perrot', 'FR1783810052022VQ6XW5KG0D87', '36313', '11933', '1975-02-10', 'Célibataire', 'Masculin', 0, 'g', 'pineau.antoine@couturier.fr', NULL, NULL, '06 45 02 73 23', '0573759374', 7, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1167, 1, NULL, 1, 225, 4, 'Xavier', 'Fernandes', '2003-10-21', 'Guillot-la-Forêt', 'FR85636054024550ZHYP22QPW01', '90 513', '54 832', '1982-12-19', 'Veuf(ve)', 'Féminin', 1, 'madeleinecolas@univ-thies.sn', 'timothee26@dacosta.fr', NULL, NULL, '+33 9 59 75 13 54', '03 16 47 75 30', 7, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1168, 5, NULL, 1, 165, 1, 'Antoinette', 'Verdier', '1992-09-23', 'Vincent', 'FR9024805398221K9TZM76ZZ140', '65690', '59572', '2013-03-30', 'Célibataire', 'Masculin', 0, 'jacqueline-corinneroussel@univ-thies.sn', 'gregoire.dubois@gay.fr', NULL, NULL, '+33 2 20 22 69 00', '+33 1 54 66 98 37', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1169, 1, NULL, 1, 40, 2, 'Michel', 'Regnier', '1980-09-22', 'Blondel-sur-Blondel', 'FR2552143123031O056Y8473S41', '20 972', '73 539', '1985-03-17', 'Marié(e)', 'Masculin', 0, 'raymonddelaperret@univ-thies.sn', 'langlois.catherine@gmail.com', NULL, NULL, '+33 (0)1 13 83 19 68', '02 75 65 12 65', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1170, 4, NULL, 1, 64, 2, 'Pénélope', 'Paul', '2000-03-06', 'Mace', 'FR107737000102NSKL557B09982', '71697', '41076', '1994-04-29', 'Célibataire', 'Masculin', 1, 'arthurmaillot@univ-thies.sn', 'falbert@leclercq.com', NULL, NULL, '+33 9 80 49 17 44', '+33 2 11 43 20 12', 7, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1171, 1, NULL, 1, 185, 1, 'Margaud', 'Baron', '2009-10-06', 'Sanchez', 'FR83606507765987H4VCGPC3B09', '74696', '97664', '1976-12-02', 'Veuf(ve)', 'Masculin', 0, 'ad', 'ysimon@noos.fr', NULL, NULL, '+33 4 65 89 91 10', '+33 (0)5 36 17 02 30', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1172, 4, NULL, 1, 234, 2, 'Michel', 'Georges', '2016-02-14', 'Philippeboeuf', 'FR682772317811Q9866M1T7ZN12', '79 945', '18984', '2000-03-22', 'Divorcé(e)', 'Féminin', 0, 'juliettedesousa@univ-thies.sn', 'pauline11@besson.fr', NULL, NULL, '01 89 88 35 29', '0444499330', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1173, 5, NULL, 1, 184, 3, 'Aimé', 'Fernandes', '1989-11-23', 'Weiss', 'FR727610905567R1VIQU2954T31', '69794', '48970', '1973-05-17', 'Marié(e)', 'Féminin', 1, 'gr', 'nath.jacquot@noos.fr', NULL, NULL, '02 70 97 98 77', '05 54 83 82 41', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1174, 5, NULL, 1, 166, 2, 'Charles', 'Dupont', '1982-01-17', 'Joly', 'FR966368342858S14DC2P0T0M09', '25471', '02244', '2008-05-20', 'Célibataire', 'Féminin', 0, 'victordumathieu@univ-thies.sn', 'claire.pascal@wanadoo.fr', NULL, NULL, '+33 (0)5 10 91 53 70', '06 81 03 28 08', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1175, 1, NULL, 1, 122, 1, 'Éric', 'Olivier', '2004-04-03', 'Imbert', 'FR17649908146225I19VVJF1E22', '10 408', '06543', '1992-11-28', 'Veuf(ve)', 'Masculin', 0, 'no', 'emilie60@traore.fr', NULL, NULL, '04 55 18 00 65', '07 94 08 64 34', 8, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1176, 1, NULL, 1, 199, 1, 'Jeannine', 'Becker', '1985-11-29', 'Jourdan-les-Bains', 'FR7004128171047D40N18IG6E18', '71052', '75860', '2008-03-27', 'Divorcé(e)', 'Féminin', 0, 'philippineledidier@univ-thies.sn', 'cgauthier@legendre.com', NULL, NULL, '+33 (0)1 76 52 48 91', '+33 (0)7 85 73 61 77', 6, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1177, 4, NULL, 1, 160, 2, 'Arthur', 'Lambert', '1993-07-26', 'Gomez-la-Forêt', 'FR6427439040451EXXU0N708503', '57 471', '54 128', '1979-07-07', 'Marié(e)', 'Masculin', 0, 'margauxdecarpentier@univ-thies.sn', 'zherve@orange.fr', NULL, NULL, '06 88 41 03 74', '03 36 83 96 31', 1, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1178, 1, NULL, 1, 4, 1, 'Gilbert', 'Blanchet', '1984-06-09', 'Traore-les-Bains', 'FR4450475310769Z3U0D5IUX431', '75007', '51 451', '2001-12-25', 'Veuf(ve)', 'Masculin', 1, 'danielduledoux@univ-thies.sn', 'cdelorme@robin.com', NULL, NULL, '0463832644', '02 58 03 01 02', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1179, 4, NULL, 1, 142, 2, 'Roland', 'Garcia', '1993-04-15', 'Caron-sur-Diallo', 'FR3671785796994260F6FN9E841', '05061', '27 620', '1992-03-28', 'Divorcé(e)', 'Masculin', 1, 'claudelaporte@univ-thies.sn', 'thibaut.richard@voila.fr', NULL, NULL, '06 01 51 31 61', '+33 1 23 65 72 40', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1180, 1, NULL, 1, 155, 2, 'Marie', 'Chevallier', '2012-03-23', 'De Sousa-sur-Leleu', 'FR1170563736610IO206O2T3S01', '24 084', '55 421', '1984-12-26', 'Marié(e)', 'Masculin', 1, 'nicolasguillet-costa@univ-thies.sn', 'gabriel68@lecoq.com', NULL, NULL, '+33 7 46 74 25 50', '0984675202', 6, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1181, 4, NULL, 1, 193, 3, 'Capucine', 'Vasseur', '2014-06-05', 'Barbedan', 'FR325378418381CV657E603M706', '22993', '21363', '2019-08-31', 'Divorcé(e)', 'Féminin', 0, 'oc', 'philippe.vaillant@perret.com', NULL, NULL, '+33 4 88 57 56 82', '+33 5 66 24 32 10', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1182, 1, NULL, 1, 1, 3, 'Valentine', 'Bousquet', '1998-03-04', 'Hoarau', 'FR5260054689036195YCH8AG354', '17 276', '22776', '2004-11-24', 'Veuf(ve)', 'Masculin', 1, 'nicolebrun@univ-thies.sn', 'alacombe@blanchet.fr', NULL, NULL, '06 54 16 76 53', '+33 1 73 51 24 52', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1183, 4, NULL, 1, 55, 2, 'Marthe', 'Dumont', '2006-05-01', 'Mercier', 'FR1021840717062B67093413977', '35278', '34641', '2019-10-09', 'Veuf(ve)', 'Féminin', 0, 'adriennedupuis@univ-thies.sn', 'tmartel@poulain.com', NULL, NULL, '02 92 78 09 34', '03 34 98 18 08', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1184, 5, NULL, 1, 183, 4, 'Aimé', 'Monnier', '1994-10-11', 'Deschamps', 'FR393407102969216I69XJ72802', '11 928', '44841', '2005-05-10', 'Marié(e)', 'Féminin', 1, 'fran', 'frederic48@tele2.fr', NULL, NULL, '+33 (0)7 85 48 53 40', '0807881016', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1185, 1, NULL, 1, 44, 2, 'Aimé', 'Guilbert', '1987-04-16', 'Renard-sur-Mer', 'FR988853794673629044PM6V024', '03 116', '78 256', '1974-05-06', 'Divorcé(e)', 'Féminin', 0, 'philippineduhamel@univ-thies.sn', 'sylvie33@voila.fr', NULL, NULL, '+33 7 59 23 79 07', '05 16 93 60 32', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1186, 1, NULL, 1, 217, 4, 'Agathe', 'Dupre', '1998-05-29', 'Clerc', 'FR9146947596250H9P8NC1V5296', '36 981', '02897', '1990-08-21', 'Marié(e)', 'Masculin', 1, 'ana', 'jean.masse@hotmail.fr', NULL, NULL, '01 55 97 80 14', '+33 3 48 37 83 11', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1187, 4, NULL, 1, 91, 1, 'Lucy', 'Dias', '2002-10-02', 'Picard', 'FR336491747626C57P1U1BE9950', '14 687', '18545', '1970-03-01', 'Célibataire', 'Féminin', 1, 'oliviebrun@univ-thies.sn', 'lorraine.petitjean@live.com', NULL, NULL, '+33 4 97 07 13 12', '04 89 28 63 21', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1188, 5, NULL, 1, 45, 2, 'Zacharie', 'Mahe', '2020-12-13', 'Mahe', 'FR6066737055237J2VJ29943952', '80 171', '15 454', '2011-08-07', 'Marié(e)', 'Masculin', 1, 'olivierlegros-poirier@univ-thies.sn', 'adelaide.jacob@live.com', NULL, NULL, '03 15 77 05 09', '06 71 95 71 86', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1189, 5, NULL, 1, 197, 3, 'Jeannine', 'Vidal', '2019-03-03', 'Leclerc', 'FR44240545363204S56U14B0D79', '27871', '31 330', '1990-09-24', 'Divorcé(e)', 'Féminin', 1, 'laurentlelievre@univ-thies.sn', 'rvidal@lebon.com', NULL, NULL, '+33 7 89 37 22 62', '+33 (0)4 62 76 09 54', 4, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1190, 1, NULL, 1, 172, 4, 'Valentine', 'Millet', '2013-03-10', 'Mary', 'FR680439206155GBL70N6Q4A733', '06012', '26 089', '1995-12-21', 'Marié(e)', 'Masculin', 1, 'gilbertbernard@univ-thies.sn', 'valentin.celine@wanadoo.fr', NULL, NULL, '+33 (0)9 33 48 86 39', '+33 1 80 51 98 37', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1191, 4, NULL, 1, 87, 3, 'Brigitte', 'Gautier', '1996-09-21', 'Guichard-les-Bains', 'FR544045263859N3UHR0I554645', '82 772', '15256', '2005-09-02', 'Marié(e)', 'Féminin', 1, 'bernadettedelasanchez@univ-thies.sn', 'peltier.timothee@dbmail.com', NULL, NULL, '+33 (0)1 84 02 52 98', '+33 (0)9 48 07 91 78', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1192, 1, NULL, 1, 8, 4, 'Olivie', 'Rossi', '1980-03-02', 'Costa', 'FR817512809250H0M534ZR99095', '49291', '85 630', '1998-09-03', 'Divorcé(e)', 'Féminin', 0, 'martinebouchet@univ-thies.sn', 'benard.arnaude@dbmail.com', NULL, NULL, '+33 1 17 46 13 58', '0891927534', 7, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1193, 4, NULL, 1, 151, 1, 'Paulette', 'Texier', '1974-01-30', 'RobinVille', 'FR769143198391716U385C4Q590', '11 985', '23163', '1998-01-19', 'Veuf(ve)', 'Masculin', 0, 'claudine-paulinejourdan@univ-thies.sn', 'ilanglois@garnier.com', NULL, NULL, '0941777610', '0618325936', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1194, 1, NULL, 1, 205, 4, 'Dominique', 'Traore', '1992-06-19', 'Bouvet-sur-Mer', 'FR793444596944576YH88M0H495', '05 703', '30 873', '2019-08-11', 'Marié(e)', 'Féminin', 0, '', 'jules.rousset@faivre.fr', NULL, NULL, '06 52 39 90 72', '09 40 05 34 86', 6, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1195, 1, NULL, 1, 96, 3, 'Marie', 'Alexandre', '2001-03-04', 'Valentin', 'FR862624278855CL98I37YUFO75', '45421', '94674', '2013-05-02', 'Marié(e)', 'Féminin', 0, 'agatheschmitt@univ-thies.sn', 'philippe66@lambert.com', NULL, NULL, '09 83 40 98 67', '+33 8 04 05 07 47', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1196, 4, NULL, 1, 31, 2, 'Marc', 'Marion', '1986-02-26', 'Etienne', 'FR916214146601EPQ0XVDJQ5W86', '22095', '58816', '1986-09-30', 'Veuf(ve)', 'Masculin', 1, 'ren', 'bboucher@voila.fr', NULL, NULL, '+33 (0)1 85 48 23 64', '0659340431', 7, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1197, 1, NULL, 1, 75, 1, 'Guillaume', 'Menard', '1974-10-04', 'Vallet-sur-Bouvet', 'FR669552691515L6B6I2A8DIS90', '55930', '64 365', '1974-07-24', 'Marié(e)', 'Féminin', 0, 'gabriel-alexandremary@univ-thies.sn', 'yfischer@tele2.fr', NULL, NULL, '0498704718', '05 18 67 02 33', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1198, 4, NULL, 1, 208, 4, 'Marthe', 'Fouquet', '1993-03-11', 'Delmasnec', 'FR933548435193615F9A4Y0S130', '72857', '86896', '1998-08-07', 'Divorcé(e)', 'Féminin', 0, 'michellemartinez@univ-thies.sn', 'valentin.william@gimenez.org', NULL, NULL, '0979563715', '0304131553', 2, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1199, 4, NULL, 1, 109, 4, 'Georges', 'Grondin', '2020-02-04', 'Leleu', 'FR667185693174556H687N1Y873', '64007', '95946', '1974-04-10', 'Marié(e)', 'Féminin', 0, 'nicolasgilbert@univ-thies.sn', 'alexandre14@bouygtel.fr', NULL, NULL, '+33 5 62 27 16 89', '+33 (0)9 92 61 42 78', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1200, 5, NULL, 1, 215, 1, 'Augustin', 'Perrin', '2005-02-19', 'CarlierVille', 'FR1164051932768061Z0VK88888', '36653', '13 238', '2010-06-25', 'Divorcé(e)', 'Masculin', 1, 'victoiredelamasson@univ-thies.sn', 'eleonore59@gmail.com', NULL, NULL, '04 10 35 80 48', '09 99 15 14 75', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1201, 5, NULL, 1, 151, 1, 'Auguste', 'Joly', '1981-02-24', 'Le GoffBourg', 'FR161014209284IL9LKQKV9S311', '00776', '25768', '2012-04-08', 'Marié(e)', 'Féminin', 1, 'marine-oc', 'helene.loiseau@voila.fr', NULL, NULL, '0454514190', '0264527719', 6, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1202, 1, NULL, 1, 165, 4, 'Noël', 'Valentin', '1992-06-04', 'Baudrydan', 'FR686945890804EFWW95QGQ2530', '65 147', '01467', '1981-07-02', 'Célibataire', 'Féminin', 0, 'sylviebriand@univ-thies.sn', 'tperrot@bonnet.com', NULL, NULL, '0981279024', '+33 (0)7 72 69 62 72', 1, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1203, 5, NULL, 1, 153, 4, 'Jeanne', 'Giraud', '2003-01-02', 'LoiseauVille', 'FR1820531845867JV9EQ3N96U44', '45 000', '80 962', '2006-09-10', 'Divorcé(e)', 'Masculin', 1, 'margaretcohen-levy@univ-thies.sn', 'emartin@berthelot.com', NULL, NULL, '+33 (0)2 11 02 07 62', '01 98 12 74 48', 9, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1204, 4, NULL, 1, 146, 3, 'Catherine', 'Allard', '1973-12-14', 'Tessier', 'FR8275687626166YIBW2I6K1Y22', '61 667', '67199', '1979-01-10', 'Veuf(ve)', 'Féminin', 1, 'audreydiaz@univ-thies.sn', 'michele41@club-internet.fr', NULL, NULL, '01 70 54 90 79', '+33 (0)1 63 28 06 34', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1205, 1, NULL, 1, 238, 1, 'Thibault', 'Gros', '2004-05-10', 'Lemaire-sur-Jean', 'FR07600999342291UR72G052D79', '51432', '16175', '1979-11-15', 'Veuf(ve)', 'Masculin', 1, 'gabrielledelahubert@univ-thies.sn', 'fournier.lucas@sfr.fr', NULL, NULL, '06 80 84 45 82', '+33 (0)3 24 57 90 53', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1206, 4, NULL, 1, 170, 4, 'Suzanne', 'Merle', '2013-05-22', 'PascalBourg', 'FR35070897204183V4YX1H7BM08', '50844', '83 806', '1998-02-09', 'Veuf(ve)', 'Féminin', 1, 'julienbrunet@univ-thies.sn', 'christiane57@georges.org', NULL, NULL, '04 89 43 35 85', '+33 1 25 43 26 53', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1207, 5, NULL, 1, 156, 3, 'Adélaïde', 'Rocher', '1999-10-09', 'Riviere', 'FR6325160166455E03DY306P209', '27 501', '04 776', '2015-04-01', 'Divorcé(e)', 'Féminin', 0, 'p', 'benjamin93@club-internet.fr', NULL, NULL, '+33 1 52 79 49 65', '07 83 90 04 37', 9, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1208, 5, NULL, 1, 10, 1, 'Sophie', 'Riou', '2015-06-06', 'Chauvin', 'FR823153071765GACI240I75762', '53 248', '46 415', '2014-09-07', 'Célibataire', 'Masculin', 0, 'laurencesanchez@univ-thies.sn', 'agnes90@delahaye.com', NULL, NULL, '+33 7 35 62 45 43', '0565070137', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1209, 5, NULL, 1, 64, 4, 'Guillaume', 'Etienne', '2019-11-11', 'Laurent', 'FR86999421377563O5484276L60', '68956', '94 452', '2014-03-19', 'Marié(e)', 'Féminin', 1, 'alicedenis@univ-thies.sn', 'lucas.hardy@bouygtel.fr', NULL, NULL, '03 66 33 87 92', '0351355780', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1210, 5, NULL, 1, 89, 4, 'Stéphane', 'Raymond', '2020-12-17', 'Micheldan', 'FR1390876876374VQGF361LZD47', '13 424', '25 320', '1972-03-20', 'Veuf(ve)', 'Féminin', 0, 'gillesgrenier@univ-thies.sn', 'arthur.hubert@wanadoo.fr', NULL, NULL, '+33 3 29 90 04 85', '+33 5 91 52 23 83', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1211, 5, NULL, 1, 184, 3, 'Guy', 'Gomes', '1980-04-17', 'Peron', 'FR1642091298878G7XU1E12S526', '57001', '72 732', '2005-12-08', 'Veuf(ve)', 'Féminin', 1, 'aur', 'jacqueline.louis@albert.fr', NULL, NULL, '+33 (0)8 21 41 00 42', '+33 (0)4 76 28 28 30', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1212, 4, NULL, 1, 18, 2, 'Charles', 'Martin', '1971-04-12', 'Mathieuboeuf', 'FR16372947349584887O4P3U521', '47103', '93 296', '2016-12-08', 'Célibataire', 'Féminin', 1, 'margot-adriennemarie@univ-thies.sn', 'andre.clemence@yahoo.fr', NULL, NULL, '01 48 60 44 80', '05 14 68 08 30', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1213, 1, NULL, 1, 17, 2, 'Jeannine', 'Cohen', '1996-02-24', 'Marques-sur-Mathieu', 'FR037242557132497RM44262497', '50 098', '98 631', '2005-02-22', 'Divorcé(e)', 'Féminin', 0, 'claudinedavid-becker@univ-thies.sn', 'bonnin.tristan@ifrance.com', NULL, NULL, '+33 1 82 75 81 56', '+33 (0)6 17 77 65 55', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1214, 5, NULL, 1, 11, 3, 'Agathe', 'Mallet', '2001-02-05', 'Ruiz-sur-Mer', 'FR367486742215TL3940GD01L82', '82129', '88449', '2012-02-14', 'Marié(e)', 'Féminin', 1, 'astridklein@univ-thies.sn', 'eblot@vaillant.com', NULL, NULL, '0158914071', '07 32 64 31 91', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1215, 1, NULL, 1, 169, 3, 'Aimée', 'Pruvost', '2021-01-11', 'Turpin', 'FR279075868155W1XQ45SO51256', '56681', '95 160', '1983-07-11', 'Divorcé(e)', 'Féminin', 1, 's', 'ovalette@lagarde.fr', NULL, NULL, '01 97 33 32 14', '+33 (0)8 02 67 69 99', 5, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1216, 1, NULL, 1, 101, 2, 'Denise', 'Leger', '1999-03-16', 'Peltier', 'FR045463638246612740RO16J55', '87 635', '40026', '1985-05-23', 'Célibataire', 'Féminin', 0, 'margotfischer@univ-thies.sn', 'olaroche@laurent.org', NULL, NULL, '+33 1 79 29 57 87', '+33 (0)1 37 51 62 51', 7, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1217, 4, NULL, 1, 88, 4, 'Franck', 'Michel', '1985-06-14', 'Royer', 'FR56719257433685SHN251DJ892', '03827', '34802', '2018-02-02', 'Marié(e)', 'Féminin', 1, 'dominique-mariecosta@univ-thies.sn', 'barre.alain@leroux.net', NULL, NULL, '02 60 29 26 01', '+33 (0)1 47 80 16 25', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1218, 1, NULL, 1, 33, 2, 'Léon', 'Becker', '1984-09-21', 'Masse', 'FR393528223601X66ZN1YR8TJ24', '38 706', '82124', '2011-02-27', 'Marié(e)', 'Masculin', 1, 'odettelelegros@univ-thies.sn', 'gerard.leroy@sfr.fr', NULL, NULL, '0129067888', '+33 (0)7 36 49 86 55', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1219, 4, NULL, 1, 194, 3, 'François', 'Giraud', '1980-11-15', 'Ruiz-sur-Lefevre', 'FR036137240380363GG55011N49', '12559', '44587', '2010-08-31', 'Marié(e)', 'Masculin', 1, 'paulgilbert-alves@univ-thies.sn', 'aimee76@pereira.com', NULL, NULL, '04 57 67 98 58', '01 83 01 91 89', 5, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1220, 5, NULL, 1, 89, 1, 'Astrid', 'Humbert', '2021-04-28', 'Leduc', 'FR2414756544940LN90R3O7V039', '88 827', '51 055', '1970-06-19', 'Célibataire', 'Masculin', 0, 'alphonsemaillet@univ-thies.sn', 'hugues08@gmail.com', NULL, NULL, '+33 (0)3 19 93 78 61', '+33 (0)8 15 01 20 64', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1221, 1, NULL, 1, 37, 2, 'Laetitia', 'Labbe', '2015-07-03', 'Pruvost-sur-Michaud', 'FR493380439486JGI930FAH1197', '54011', '71 149', '1977-01-30', 'Divorcé(e)', 'Féminin', 1, 'fr', 'jerome.noel@wanadoo.fr', NULL, NULL, '07 52 21 26 94', '+33 (0)6 79 30 48 55', 9, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1222, 1, NULL, 1, 180, 2, 'Jeannine', 'Faivre', '1970-10-03', 'Couturier-sur-Schmitt', 'FR279639211249NY1P79OR4V460', '33860', '17061', '1993-03-12', 'Divorcé(e)', 'Féminin', 1, 'andr', 'christine44@tiscali.fr', NULL, NULL, '08 24 38 33 60', '0380670588', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1223, 4, NULL, 1, 117, 1, 'Benoît', 'Lecomte', '2000-11-19', 'JacquotVille', 'FR45998058990388C2893252899', '90 904', '92 525', '1997-11-08', 'Divorcé(e)', 'Féminin', 0, 'mich', 'zgarcia@club-internet.fr', NULL, NULL, '+33 (0)1 78 04 10 05', '0131347249', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1224, 4, NULL, 1, 144, 2, 'Dominique', 'Pascal', '1972-11-09', 'De Sousa', 'FR86926562714158LCU75U71N28', '88 242', '56957', '1991-12-03', 'Marié(e)', 'Masculin', 0, 'agn', 'jules.marty@jean.com', NULL, NULL, '0269287992', '+33 7 36 00 76 55', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1225, 5, NULL, 1, 72, 2, 'Sylvie', 'Alexandre', '1996-02-06', 'Millet-sur-Colin', 'FR165500729312CHQTC98S5A997', '41 491', '05 567', '2013-04-18', 'Célibataire', 'Masculin', 0, 'philippinelacombe-lemaire@univ-thies.sn', 'fchevallier@hotmail.fr', NULL, NULL, '+33 (0)1 97 46 35 60', '+33 (0)3 83 56 98 32', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1226, 4, NULL, 1, 104, 3, 'Daniel', 'Thomas', '1980-06-13', 'Bodin', 'FR694843171972C7E182783R744', '50 114', '74030', '1975-07-11', 'Veuf(ve)', 'Féminin', 1, 'nathaliedelannoy-reynaud@univ-thies.sn', 'michel89@yahoo.fr', NULL, NULL, '08 99 56 66 81', '0225212510', 6, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1227, 1, NULL, 1, 45, 3, 'Laurent', 'Pons', '1999-02-18', 'Perez-sur-Maillard', 'FR5743421047527B3E5X2200774', '29 020', '41 550', '2003-06-27', 'Marié(e)', 'Féminin', 1, 'h', 'marine10@yahoo.fr', NULL, NULL, '+33 (0)1 64 23 20 24', '+33 8 92 55 01 19', 8, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1228, 4, NULL, 1, 170, 1, 'Alain', 'Perrot', '1974-05-27', 'Jacquesdan', 'FR873177592316Y5SC4V2476682', '53 501', '57534', '1998-09-16', 'Célibataire', 'Masculin', 0, '', 'charpentier.gilles@voila.fr', NULL, NULL, '04 35 53 46 93', '+33 6 35 75 68 49', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1229, 1, NULL, 1, 50, 4, 'Arthur', 'Maurice', '1980-08-10', 'Humbert-les-Bains', 'FR885382183877PFQ6IL0Y34S64', '12296', '65684', '2000-11-03', 'Veuf(ve)', 'Féminin', 0, '', 'khumbert@gmail.com', NULL, NULL, '04 33 95 50 30', '0156642917', 6, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1230, 4, NULL, 1, 228, 4, 'Adrien', 'Jean', '1987-02-15', 'Briand-la-Forêt', 'FR4983032141834P26DE43B5909', '64 032', '18 686', '1992-12-27', 'Célibataire', 'Féminin', 0, '', 'edouard.bailly@laporte.com', NULL, NULL, '0811128729', '08 95 87 00 86', 8, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1231, 4, NULL, 1, 21, 4, 'Xavier', 'Gimenez', '1975-10-15', 'Sauvage', 'FR662609396727NZ1MD992DJ080', '49 410', '06 952', '1998-09-30', 'Marié(e)', 'Féminin', 1, 'arnaudeleletellier@univ-thies.sn', 'boutin.isabelle@ifrance.com', NULL, NULL, '03 43 50 94 51', '+33 (0)3 94 51 45 48', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1232, 1, NULL, 1, 123, 4, 'Clémence', 'Guichard', '1991-05-26', 'Renault', 'FR404692634501756974LT5DV56', '79201', '45532', '1985-04-29', 'Divorcé(e)', 'Féminin', 0, 'andr', 'vincent.arnaude@tiscali.fr', NULL, NULL, '+33 (0)1 61 12 87 96', '+33 (0)8 05 41 83 05', 5, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1233, 1, NULL, 1, 43, 3, 'Maryse', 'Renaud', '1999-11-17', 'Perrier-sur-Mer', 'FR7938767441701831X27096D61', '03 022', '77 695', '1974-10-31', 'Célibataire', 'Féminin', 1, 'mauriceramos@univ-thies.sn', 'dasilva.celine@ramos.com', NULL, NULL, '+33 (0)7 77 09 94 06', '+33 2 30 56 35 67', 7, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1234, 5, NULL, 1, 210, 3, 'Stéphanie', 'Labbe', '1989-03-20', 'Caron', 'FR730577258328X3H72W8T7G445', '63763', '92 765', '2004-05-13', 'Veuf(ve)', 'Masculin', 1, 'nathcharles-guilbert@univ-thies.sn', 'remy.bourdon@voila.fr', NULL, NULL, '0774842330', '0958565177', 8, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1235, 4, NULL, 1, 71, 2, 'Luc', 'Bazin', '2016-04-01', 'Lemonnier-la-Forêt', 'FR501730414800WE295B9DA7M03', '31 455', '44 417', '2016-05-03', 'Marié(e)', 'Masculin', 0, 'thibautjoly@univ-thies.sn', 'camille18@marchal.com', NULL, NULL, '03 77 93 86 80', '0897913867', 3, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1236, 1, NULL, 1, 158, 2, 'Patrick', 'Martinez', '2020-06-05', 'Lemaire', 'FR685477945265B0O47S24VP040', '60372', '48035', '2004-06-18', 'Divorcé(e)', 'Masculin', 1, 'zo', 'sebastien.nguyen@club-internet.fr', NULL, NULL, '+33 (0)5 83 03 28 69', '+33 6 03 82 03 38', 8, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1237, 5, NULL, 1, 156, 2, 'Amélie', 'Hernandez', '2000-06-27', 'BoulangerBourg', 'FR336884209392A90M5S3F35889', '47847', '16960', '2003-12-22', 'Célibataire', 'Masculin', 0, 'adriendelahaye@univ-thies.sn', 'dias.david@courtois.fr', NULL, NULL, '03 03 40 94 64', '+33 (0)1 13 28 95 26', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1238, 1, NULL, 1, 88, 4, 'Nicolas', 'Lenoir', '2013-12-17', 'David', 'FR1776966011677BRRHD2HCHT32', '94492', '27 407', '1987-12-06', 'Célibataire', 'Masculin', 0, 'susannehuet@univ-thies.sn', 'patrick.laroche@voila.fr', NULL, NULL, '0960700551', '+33 9 50 33 40 67', 6, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1239, 1, NULL, 1, 226, 2, 'François', 'Ledoux', '2002-07-01', 'Etiennedan', 'FR552760645418L3RO445LMF237', '39 873', '72 526', '1972-03-14', 'Divorcé(e)', 'Féminin', 1, 'beno', 'qguilbert@couturier.com', NULL, NULL, '+33 3 37 66 09 36', '+33 8 02 24 77 36', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1240, 5, NULL, 1, 38, 1, 'Adèle', 'Guerin', '2019-12-23', 'Courtoisnec', 'FR410403002511M8PO9WDW8O382', '00 888', '44652', '2013-07-31', 'Veuf(ve)', 'Masculin', 0, 'constancebonneau@univ-thies.sn', 'jeanne57@laposte.net', NULL, NULL, '+33 4 92 11 04 07', '+33 (0)2 90 08 07 30', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1241, 4, NULL, 1, 13, 2, 'Henriette', 'Moreau', '1970-11-22', 'Petit', 'FR5704196986441699P270Q4862', '28 599', '06 243', '2001-10-30', 'Marié(e)', 'Masculin', 0, '', 'kbrunel@live.com', NULL, NULL, '06 27 78 69 03', '+33 (0)1 99 79 07 98', 9, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1242, 1, NULL, 1, 97, 3, 'Théodore', 'Pires', '1991-01-28', 'Garcia', 'FR561555862308384W438837D97', '76 858', '27769', '1988-10-07', 'Divorcé(e)', 'Féminin', 0, 'no', 'herve.sylvie@nicolas.com', NULL, NULL, '+33 (0)3 29 83 81 54', '+33 (0)8 14 43 35 38', 6, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1243, 1, NULL, 1, 150, 3, 'Adèle', 'Diallo', '1975-01-02', 'Olliviernec', 'FR86350462670188LP453IQT966', '87 025', '34189', '2006-03-13', 'Célibataire', 'Féminin', 0, 'dominiquelacroix@univ-thies.sn', 'pleconte@martins.org', NULL, NULL, '0168211429', '0622128552', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1244, 1, NULL, 1, 200, 3, 'Julien', 'Bourgeois', '1974-05-29', 'Besson', 'FR367102102084K2598317HK562', '78839', '87 966', '2020-10-14', 'Veuf(ve)', 'Masculin', 1, 'th', 'bonnet.jean@ifrance.com', NULL, NULL, '+33 1 40 86 16 20', '06 00 28 94 60', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1245, 1, NULL, 1, 44, 2, 'Michelle', 'Perez', '2006-08-12', 'Mahe-les-Bains', 'FR21952913375102KA0FA170G69', '35215', '44 205', '2010-01-17', 'Marié(e)', 'Féminin', 1, 'julienguillet@univ-thies.sn', 'margot.petit@yahoo.fr', NULL, NULL, '+33 (0)1 98 14 96 45', '+33 1 95 34 24 41', 1, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1246, 5, NULL, 1, 235, 1, 'Joséphine', 'Bousquet', '1999-06-14', 'Letellier', 'FR8401301182630I4ZHPELKYG51', '11 023', '25 055', '1995-10-21', 'Célibataire', 'Féminin', 0, 'pauline-margotguillot@univ-thies.sn', 'masse.agathe@barthelemy.fr', NULL, NULL, '+33 (0)2 57 09 81 04', '+33 (0)6 17 47 05 51', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1247, 4, NULL, 1, 172, 3, 'Alex', 'Descamps', '1982-04-01', 'Torres', 'FR094229065481E5K088455B402', '25872', '59271', '1990-03-30', 'Divorcé(e)', 'Féminin', 0, 'val', 'theophile.perrin@ifrance.com', NULL, NULL, '+33 2 34 37 40 83', '+33 (0)2 10 95 52 48', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1248, 1, NULL, 1, 178, 3, 'Grégoire', 'Pons', '2010-05-17', 'Gilbert', 'FR726860944320LWGK096VJK003', '15002', '42195', '1980-02-24', 'Marié(e)', 'Féminin', 0, 'timoth', 'diaz.mathilde@hardy.fr', NULL, NULL, '01 30 12 22 93', '09 44 93 16 39', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1249, 1, NULL, 1, 196, 2, 'Olivier', 'Lopes', '2008-01-22', 'Fournier', 'FR9762427840711DI0G482A5A46', '98 555', '57 224', '1998-03-05', 'Célibataire', 'Masculin', 0, 'in', 'pbrunel@hotmail.fr', NULL, NULL, '+33 6 23 78 43 88', '09 55 02 49 80', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1250, 1, NULL, 1, 129, 3, 'Odette', 'Le Gall', '1975-07-21', 'Dos Santosnec', 'FR926927614854MM66T79ERJ264', '67827', '42861', '1983-07-07', 'Veuf(ve)', 'Féminin', 0, 'no', 'theophile60@orange.fr', NULL, NULL, '0588723231', '+33 (0)4 12 83 62 05', 9, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1251, 4, NULL, 1, 86, 1, 'Hugues', 'Gay', '1991-06-20', 'Brun-la-Forêt', 'FR220582819320WQM0K28SH7Y11', '84 948', '75 847', '1996-07-09', 'Veuf(ve)', 'Féminin', 0, 'emmanueldeguillaume@univ-thies.sn', 'martine.fabre@sfr.fr', NULL, NULL, '0616607133', '+33 (0)3 31 54 88 02', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1252, 5, NULL, 1, 76, 2, 'Dominique', 'Schmitt', '1986-04-04', 'Normand', 'FR87288204355919785XS2WG297', '95 201', '54 329', '1990-06-17', 'Divorcé(e)', 'Féminin', 1, 'michellevoisin@univ-thies.sn', 'marc20@faure.com', NULL, NULL, '+33 (0)7 75 85 55 79', '04 77 91 51 55', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1253, 5, NULL, 1, 83, 1, 'Édouard', 'Payet', '1972-09-11', 'Bousquet', 'FR3821896412418UG381V892840', '65905', '28 617', '1995-11-27', 'Célibataire', 'Féminin', 1, 'gr', 'auguste.rolland@hotmail.fr', NULL, NULL, '0454021035', '+33 (0)1 75 20 10 16', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1254, 5, NULL, 1, 103, 1, 'Marcel', 'Bazin', '2018-05-13', 'Royerboeuf', 'FR0357825644854P44DD3Q4WM83', '64 774', '74143', '1997-07-15', 'Marié(e)', 'Masculin', 0, 'valentinedelaunay@univ-thies.sn', 'auguste.vallee@tele2.fr', NULL, NULL, '+33 (0)3 95 79 64 47', '0734767605', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1255, 1, NULL, 1, 5, 4, 'Laurence', 'Poulain', '1981-07-04', 'Colindan', 'FR4938190796392ZZ9F08D8A958', '25 960', '77 779', '1975-03-27', 'Veuf(ve)', 'Féminin', 0, 'timoth', 'morel.margot@bouygtel.fr', NULL, NULL, '0757233040', '04 24 91 83 63', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1256, 5, NULL, 1, 137, 4, 'Guy', 'Fouquet', '1991-06-18', 'Michaud-sur-Mer', 'FR920164536191HDHTO0P4Q8929', '46 767', '60521', '1997-07-12', 'Divorcé(e)', 'Masculin', 0, 's', 'vincent.eugene@renaud.fr', NULL, NULL, '0898661071', '03 16 82 37 65', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1257, 4, NULL, 1, 32, 1, 'Anastasie', 'Leger', '1979-11-28', 'Joly-sur-Mer', 'FR1427146766825E21823QR2917', '78 102', '51 109', '1994-10-20', 'Divorcé(e)', 'Masculin', 1, 'emmanuelblin@univ-thies.sn', 'didier.sylvie@ramos.org', NULL, NULL, '+33 (0)1 56 10 26 77', '+33 2 78 58 62 90', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1258, 5, NULL, 1, 222, 2, 'Véronique', 'Guerin', '1988-12-22', 'Le Gall-sur-Begue', 'FR187477449144S1U76S7AV0790', '11 911', '36 445', '1982-06-19', 'Divorcé(e)', 'Masculin', 1, 'williampruvost@univ-thies.sn', 'vlopez@martin.com', NULL, NULL, '+33 3 61 29 00 68', '08 23 10 99 39', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1259, 1, NULL, 1, 94, 2, 'Thibaut', 'Dos Santos', '1970-02-02', 'JacquetBourg', 'FR0472113582460F1I0XC014971', '39 089', '63043', '2008-10-14', 'Veuf(ve)', 'Masculin', 0, 'laurelegoff-lelievre@univ-thies.sn', 'clemence.vidal@dufour.com', NULL, NULL, '+33 (0)1 07 67 78 52', '0493805532', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1260, 5, NULL, 1, 106, 3, 'Bernard', 'Gimenez', '2002-02-02', 'Alves', 'FR640565601133B658S1U657C03', '75624', '04 205', '1978-12-01', 'Marié(e)', 'Masculin', 0, 'thierrylamy@univ-thies.sn', 'gmasson@noos.fr', NULL, NULL, '+33 (0)3 06 84 44 94', '04 00 51 89 45', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1261, 1, NULL, 1, 71, 4, 'Thérèse', 'Hamel', '1997-02-23', 'Parent', 'FR7820051379012K498DA3OQ418', '05 759', '22951', '1989-10-08', 'Veuf(ve)', 'Masculin', 1, 'odettelenoir@univ-thies.sn', 'frederic85@hebert.com', NULL, NULL, '+33 (0)2 34 22 95 44', '0560005734', 5, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1262, 5, NULL, 1, 228, 3, 'Emmanuelle', 'Andre', '1973-08-08', 'Leduc', 'FR6491419214798BFKZ0L57X967', '64 386', '62 683', '2016-01-20', 'Célibataire', 'Masculin', 1, 'henri-no', 'cdumont@brun.com', NULL, NULL, '+33 (0)1 53 06 43 20', '+33 5 62 15 69 77', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1263, 5, NULL, 1, 226, 3, 'Édouard', 'Leconte', '1989-09-19', 'Deschamps', 'FR724371184681U87TI58PS6D19', '38 822', '71 610', '1986-10-16', 'Divorcé(e)', 'Féminin', 0, 'agn', 'lucy54@louis.net', NULL, NULL, '0262388822', '07 95 60 54 85', 7, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1264, 1, NULL, 1, 162, 2, 'Édith', 'Brun', '1971-07-03', 'Le Gall', 'FR4051940444182Y046D6983864', '15 762', '39271', '1990-08-23', 'Divorcé(e)', 'Masculin', 1, 'tristanthomas-barthelemy@univ-thies.sn', 'christelle83@bernier.fr', NULL, NULL, '+33 7 84 21 72 49', '05 94 77 19 74', 2, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1265, 5, NULL, 1, 199, 4, 'Louise', 'Alves', '1979-04-05', 'Durand-la-Forêt', 'FR205632762032LL6862W9COG51', '79737', '18832', '1990-08-03', 'Marié(e)', 'Féminin', 0, 'xavierguerin@univ-thies.sn', 'blanchard.emilie@tele2.fr', NULL, NULL, '+33 (0)6 04 65 54 64', '+33 (0)1 65 30 06 71', 5, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1266, 1, NULL, 1, 91, 4, 'Vincent', 'Pinto', '2020-12-25', 'Guillet-sur-Breton', 'FR41611001714867D8C1QJ85G84', '84873', '10727', '2001-09-21', 'Divorcé(e)', 'Masculin', 0, 'alexandremorin-legrand@univ-thies.sn', 'matthieu02@laposte.net', NULL, NULL, '+33 (0)7 67 83 73 81', '+33 8 93 43 53 11', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1267, 1, NULL, 1, 116, 4, 'Monique', 'Martineau', '1974-10-16', 'Pineau-sur-Chartier', 'FR72783866049719HB0Y7J8O719', '38046', '75 991', '1971-01-07', 'Célibataire', 'Féminin', 0, 'patrickbrun-rey@univ-thies.sn', 'olegros@orange.fr', NULL, NULL, '08 03 21 36 37', '+33 (0)8 05 23 85 35', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1268, 5, NULL, 1, 158, 4, 'Nathalie', 'Royer', '2016-03-12', 'Martelnec', 'FR287557215563R6F43RBC08872', '40491', '77 037', '2004-10-08', 'Marié(e)', 'Masculin', 0, 'r', 'philippe.laine@toussaint.net', NULL, NULL, '+33 (0)2 44 79 05 70', '05 91 49 73 49', 5, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1269, 1, NULL, 1, 78, 2, 'Michel', 'Bodin', '1993-09-25', 'Levy', 'FR434649701774W79JM8UK86079', '81888', '28621', '2010-03-29', 'Divorcé(e)', 'Masculin', 0, 'georges-st', 'barbier.odette@tiscali.fr', NULL, NULL, '0614025573', '+33 (0)3 96 33 67 95', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1270, 5, NULL, 1, 211, 2, 'Geneviève', 'Maillot', '1989-10-15', 'Mace', 'FR667108991033PB1H3R2V3TS62', '96387', '70894', '1986-10-26', 'Divorcé(e)', 'Masculin', 0, 'anouk-', 'denise.leleu@sfr.fr', NULL, NULL, '0368317307', '+33 (0)7 36 14 99 40', 6, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1271, 5, NULL, 1, 180, 1, 'Anouk', 'Letellier', '2016-04-05', 'BrunetVille', 'FR953338126130BE478AQMO1128', '30759', '11652', '1979-12-03', 'Célibataire', 'Féminin', 1, 'p', 'ines.guillou@noos.fr', NULL, NULL, '+33 9 47 20 97 10', '+33 (0)1 70 47 56 03', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL);
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(1272, 5, NULL, 1, 75, 3, 'Gabriel', 'Dumont', '1983-10-14', 'Perez-la-Forêt', 'FR7564443009270Z1N17QH2FE56', '24657', '32516', '1973-08-19', 'Divorcé(e)', 'Masculin', 0, 'audreydeschamps@univ-thies.sn', 'elise02@dbmail.com', NULL, NULL, '+33 5 83 67 64 72', '+33 (0)7 87 77 79 22', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1273, 1, NULL, 1, 197, 2, 'Élisabeth', 'Chauvin', '1980-02-09', 'Lefevre', 'FR8399244666063GQQ518751794', '40 680', '60 399', '1989-08-26', 'Divorcé(e)', 'Féminin', 0, 'rolandclement@univ-thies.sn', 'thuet@navarro.fr', NULL, NULL, '+33 1 18 73 45 40', '04 06 98 54 98', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1274, 4, NULL, 1, 205, 4, 'Olivier', 'Poulain', '2008-02-13', 'Lebon', 'FR7317533797480E80C78LETD86', '49938', '22060', '1999-12-19', 'Divorcé(e)', 'Féminin', 1, 'andr', 'virginie.besnard@gmail.com', NULL, NULL, '0440960198', '01 06 94 85 21', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1275, 5, NULL, 1, 154, 2, 'Christine', 'Pasquier', '2011-05-14', 'Barbier-sur-Perrin', 'FR0779988022099KQ457XT78272', '00 511', '22 674', '2019-02-07', 'Célibataire', 'Masculin', 0, 'p', 'wjoubert@brunel.fr', NULL, NULL, '+33 8 09 18 68 72', '06 61 87 26 08', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1276, 5, NULL, 1, 75, 4, 'Aimé', 'Lemaire', '2008-10-16', 'Bousquet', 'FR922479547854169853R566961', '31 430', '48 571', '1982-02-08', 'Marié(e)', 'Masculin', 1, 'adrienneroger@univ-thies.sn', 'maryse35@bodin.fr', NULL, NULL, '+33 2 85 96 48 02', '+33 (0)7 51 83 13 21', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1277, 4, NULL, 1, 161, 1, 'Antoine', 'Marie', '2017-08-12', 'KleinBourg', 'FR950655534369KCIQT7320H683', '44 580', '66 444', '2016-03-20', 'Veuf(ve)', 'Féminin', 1, 'anouk-st', 'marcelle.pages@simon.fr', NULL, NULL, '0449873135', '+33 (0)3 23 50 45 17', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1278, 4, NULL, 1, 102, 2, 'Daniel', 'Lamy', '2012-07-29', 'Fernandezdan', 'FR2522817783904EG8R3NP83K01', '20 370', '23541', '1993-05-01', 'Divorcé(e)', 'Féminin', 1, 'carolinesamson@univ-thies.sn', 'lucas37@mace.net', NULL, NULL, '+33 4 64 62 43 45', '05 24 76 33 68', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1279, 5, NULL, 1, 171, 1, 'Augustin', 'Ollivier', '1971-08-20', 'Daniel-sur-Breton', 'FR352838794332RUANMLRPJMQ55', '81 696', '89079', '2010-02-17', 'Veuf(ve)', 'Féminin', 1, 'r', 'michele.bouvier@live.com', NULL, NULL, '03 86 30 40 96', '+33 (0)5 54 90 54 58', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1280, 1, NULL, 1, 110, 4, 'Denis', 'Roy', '1985-01-28', 'Berthelot', 'FR877077605520X88KHK7679G09', '49 214', '92608', '1979-02-17', 'Divorcé(e)', 'Masculin', 0, 'henrisanchez@univ-thies.sn', 'alex.henry@hotmail.fr', NULL, NULL, '+33 (0)7 68 25 83 81', '0341641971', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1281, 1, NULL, 1, 144, 1, 'Denis', 'Lesage', '2009-11-11', 'Clerc', 'FR3260789520934F54GTYQU2482', '32 284', '82 481', '1980-10-01', 'Marié(e)', 'Féminin', 1, 'lucaspierre@univ-thies.sn', 'eguyot@sfr.fr', NULL, NULL, '+33 (0)5 17 18 60 59', '+33 (0)9 10 44 04 81', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1282, 1, NULL, 1, 164, 1, 'Agathe', 'Perrin', '2007-02-01', 'Barbier-les-Bains', 'FR947881149178967959228BX63', '32910', '24980', '2010-09-08', 'Veuf(ve)', 'Féminin', 1, 'augustelegautier@univ-thies.sn', 'francoise.legoff@rocher.fr', NULL, NULL, '0504048667', '+33 (0)5 94 69 04 33', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1283, 4, NULL, 1, 176, 3, 'Denise', 'Jacquet', '1994-05-08', 'Martins', 'FR0938681567990CBY24LX16I86', '70358', '55 838', '1999-07-07', 'Veuf(ve)', 'Masculin', 1, 'j', 'clemence91@brun.com', NULL, NULL, '0139939503', '09 42 38 93 27', 6, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1284, 4, NULL, 1, 128, 1, 'Alexandre', 'Becker', '1978-01-12', 'BoulayVille', 'FR317959414554EM7K5S61A8110', '97 022', '65639', '1991-01-23', 'Marié(e)', 'Féminin', 0, 'tristan-adrienpetit@univ-thies.sn', 'laurent96@durand.fr', NULL, NULL, '+33 3 05 90 53 39', '0380081483', 8, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1285, 4, NULL, 1, 145, 3, 'Théodore', 'Gauthier', '1972-03-28', 'Valentin', 'FR0929982181239N35OU8GILT53', '95411', '44434', '1973-12-22', 'Célibataire', 'Masculin', 1, 'manonimbert@univ-thies.sn', 'monique88@sfr.fr', NULL, NULL, '0139902620', '0184281437', 3, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1286, 1, NULL, 1, 209, 3, 'Margaud', 'Royer', '1986-09-24', 'Ledoux-les-Bains', 'FR223871876335IBRLFT670J544', '95 760', '53 889', '1999-06-27', 'Divorcé(e)', 'Féminin', 1, 'emmanuellehumbert@univ-thies.sn', 'christophe40@guilbert.com', NULL, NULL, '+33 3 20 68 75 94', '0109650104', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1287, 5, NULL, 1, 140, 4, 'Antoinette', 'Imbert', '1989-03-04', 'Giraud-les-Bains', 'FR688983842992P572RCZJ53X65', '32 811', '28301', '1994-06-13', 'Célibataire', 'Féminin', 0, 'richard-xavierjean@univ-thies.sn', 'blanchard.antoinette@henry.org', NULL, NULL, '0377023020', '+33 2 61 12 82 81', 4, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1288, 1, NULL, 1, 171, 3, 'Susanne', 'Lemaitre', '1994-01-08', 'Techerboeuf', 'FR598659886855PSVP1UG0WJ027', '62232', '53 466', '1997-07-11', 'Marié(e)', 'Féminin', 0, 'luchuet@univ-thies.sn', 'evrard.henriette@remy.org', NULL, NULL, '+33 1 76 78 48 66', '0931801961', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1289, 5, NULL, 1, 187, 4, 'Hugues', 'Pasquier', '1975-04-17', 'Guyotboeuf', 'FR938172690751HP0HPW3HM9D63', '77914', '22662', '1996-09-11', 'Célibataire', 'Masculin', 0, 'lucasvallet@univ-thies.sn', 'vroyer@yahoo.fr', NULL, NULL, '09 01 21 58 85', '0553794746', 4, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1290, 5, NULL, 1, 15, 2, 'Christophe', 'Raynaud', '2011-11-25', 'Lambert', 'FR8411244934642300J4LDT0223', '68466', '92415', '1999-05-22', 'Marié(e)', 'Masculin', 0, 'alaincoste@univ-thies.sn', 'christiane16@ifrance.com', NULL, NULL, '+33 (0)7 98 04 21 53', '+33 (0)8 10 24 20 62', 8, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1291, 1, NULL, 1, 122, 1, 'Aurélie', 'Nguyen', '1996-12-28', 'Berger', 'FR250043559435Q1W4V3852Z050', '62264', '72 036', '1981-02-05', 'Marié(e)', 'Féminin', 1, 'georgespereira@univ-thies.sn', 'troger@ferreira.fr', NULL, NULL, '+33 8 99 62 09 66', '0625548790', 8, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1292, 1, NULL, 1, 142, 3, 'Maggie', 'Sauvage', '2013-05-24', 'Martinsdan', 'FR607960513297S5AY7429XGB53', '45253', '88885', '2014-10-24', 'Célibataire', 'Masculin', 1, 'alfreddesousa@univ-thies.sn', 'theophile.michaud@laroche.com', NULL, NULL, '0219329170', '+33 (0)3 99 67 67 07', 7, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1293, 1, NULL, 1, 177, 4, 'Eugène', 'Pruvost', '2012-01-06', 'Perrin-sur-Pinto', 'FR030315145334L98975FA7M940', '84564', '66451', '1994-06-07', 'Célibataire', 'Féminin', 1, 'lucebecker@univ-thies.sn', 'hguillon@desousa.org', NULL, NULL, '+33 (0)6 71 45 20 05', '+33 9 72 49 05 81', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1294, 4, NULL, 1, 19, 4, 'Éric', 'Ribeiro', '1996-02-15', 'Blanchetnec', 'FR07306501922139V19ZUU7QS07', '57201', '44090', '1994-04-11', 'Divorcé(e)', 'Masculin', 1, 'arnaudecousin@univ-thies.sn', 'georges.maillet@bertin.fr', NULL, NULL, '02 28 75 78 66', '+33 (0)1 36 53 13 19', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1295, 5, NULL, 1, 39, 1, 'Claire', 'Rodrigues', '2011-03-17', 'Pagesnec', 'FR878459666840711287Y508I25', '39 888', '54 614', '2008-09-03', 'Divorcé(e)', 'Féminin', 0, 'maggie-paulinerobin@univ-thies.sn', 'anouk36@ifrance.com', NULL, NULL, '+33 2 48 54 63 59', '0111241064', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1296, 1, NULL, 1, 8, 3, 'Henri', 'Coulon', '1994-11-04', 'Maillet-sur-Collet', 'FR962014362037H86ZYC7726082', '39942', '10 476', '1993-02-22', 'Célibataire', 'Masculin', 1, 'astridmarin-perret@univ-thies.sn', 'rloiseau@dbmail.com', NULL, NULL, '+33 1 33 92 55 00', '+33 8 98 98 22 11', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1297, 1, NULL, 1, 147, 3, 'Joseph', 'Marques', '2008-01-08', 'Weiss', 'FR361099022514G397R5NG56P33', '67197', '90731', '1981-06-17', 'Divorcé(e)', 'Féminin', 1, 'laurelebreton@univ-thies.sn', 'monique35@carpentier.com', NULL, NULL, '0128965986', '+33 4 21 07 18 16', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1298, 1, NULL, 1, 68, 3, 'Alain', 'Descamps', '1993-06-21', 'Pineaunec', 'FR33584141138493YAM06W60440', '82097', '29 501', '2005-05-11', 'Veuf(ve)', 'Masculin', 0, 'dominiquegomez@univ-thies.sn', 'deoliveira.marc@wanadoo.fr', NULL, NULL, '+33 4 96 44 83 86', '0947751216', 1, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1299, 1, NULL, 1, 24, 2, 'Benjamin', 'Guyon', '2014-04-23', 'Thibault', 'FR6367100749097M3J2D78I4037', '16618', '47247', '1973-08-01', 'Marié(e)', 'Masculin', 0, '', 'alex97@vasseur.fr', NULL, NULL, '+33 4 42 22 38 39', '0181299672', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1300, 4, NULL, 1, 54, 1, 'Robert', 'Martin', '1990-05-02', 'Nguyenboeuf', 'FR364853759989854JM09I48M83', '38 299', '57843', '2000-06-18', 'Divorcé(e)', 'Masculin', 0, 'robertdubois@univ-thies.sn', 'blondel.daniel@legrand.org', NULL, NULL, '0549706825', '04 49 06 33 60', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1301, 5, NULL, 1, 69, 3, 'Paul', 'Peltier', '2014-07-26', 'Besnard', 'FR446149745645EN3U25BE1LS48', '94 017', '04816', '1981-09-21', 'Célibataire', 'Masculin', 0, 'claire-alicedidier@univ-thies.sn', 'qbegue@laurent.com', NULL, NULL, '+33 (0)7 32 10 48 12', '0933364229', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1302, 1, NULL, 1, 35, 2, 'Virginie', 'Vasseur', '1997-08-04', 'Turpin', 'FR084812394921XQV8J12IM8G16', '25425', '31334', '1999-01-15', 'Célibataire', 'Féminin', 0, 'juliettelemonnier@univ-thies.sn', 'rbarbe@colin.org', NULL, NULL, '+33 (0)7 84 79 68 01', '01 96 05 94 76', 6, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1303, 1, NULL, 1, 52, 4, 'Patrick', 'Roux', '1988-07-02', 'Ruiz', 'FR374549054980RQC0VF1G30611', '19212', '07 718', '1977-12-15', 'Célibataire', 'Masculin', 1, 'alphonsemasson@univ-thies.sn', 'laurent.sauvage@live.com', NULL, NULL, '0956159022', '+33 4 17 22 90 73', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1304, 4, NULL, 1, 242, 2, 'Denise', 'Legendre', '2003-05-08', 'Gauthier-sur-Huet', 'FR423968955365J8U6B02S8AG06', '35 364', '68 463', '1972-03-01', 'Célibataire', 'Masculin', 0, 'josephpicard@univ-thies.sn', 'roland.laroche@club-internet.fr', NULL, NULL, '+33 (0)7 47 77 25 52', '+33 (0)1 62 95 74 07', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1305, 5, NULL, 1, 164, 1, 'Lucas', 'Fernandez', '2013-04-19', 'Laroche', 'FR340719308913N5P99U96W1377', '84 198', '40740', '1984-10-01', 'Célibataire', 'Féminin', 1, 'victorbesnard@univ-thies.sn', 'jerome.morvan@live.com', NULL, NULL, '08 98 67 40 51', '+33 5 24 62 07 78', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1306, 5, NULL, 1, 235, 1, 'Jean', 'Faivre', '1971-12-06', 'Delahaye-sur-Mer', 'FR4962655073101IN93HR0QZ318', '67978', '63 587', '1979-11-18', 'Veuf(ve)', 'Féminin', 0, 'gilbertleger@univ-thies.sn', 'odescamps@sfr.fr', NULL, NULL, '06 16 42 23 16', '+33 4 72 71 86 19', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1307, 5, NULL, 1, 91, 2, 'Isaac', 'Laporte', '1987-02-17', 'Maillot', 'FR947075287160G0OWKH8GC7127', '96 096', '78 279', '1974-05-30', 'Marié(e)', 'Masculin', 0, 'margaretlebarbe@univ-thies.sn', 'bpascal@diallo.com', NULL, NULL, '+33 (0)6 07 44 14 78', '+33 (0)1 76 14 37 61', 3, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1308, 1, NULL, 1, 238, 2, 'Philippe', 'Vallee', '1980-10-07', 'Rocher', 'FR735221688057798EIZ3A91L70', '49164', '07377', '1989-06-01', 'Veuf(ve)', 'Masculin', 0, 'marcel-andr', 'alfred78@orange.fr', NULL, NULL, '+33 7 78 63 86 92', '07 35 21 05 25', 8, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1309, 1, NULL, 1, 83, 2, 'Vincent', 'Toussaint', '2015-06-04', 'Maillard', 'FR908046207727SH549KINTQJ85', '86 104', '62 089', '1988-01-16', 'Divorcé(e)', 'Féminin', 1, 'sylviepereira@univ-thies.sn', 'victoire.boutin@dbmail.com', NULL, NULL, '+33 6 25 55 55 23', '02 49 36 90 09', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1310, 4, NULL, 1, 10, 4, 'Bernard', 'Philippe', '2011-05-16', 'Bernard', 'FR076186355901X3X34QL9Z7160', '36629', '06 941', '1981-10-26', 'Célibataire', 'Masculin', 0, 'xavierrobert@univ-thies.sn', 'paulette45@free.fr', NULL, NULL, '+33 (0)7 70 17 67 46', '0443993194', 8, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1311, 5, NULL, 1, 183, 1, 'Philippine', 'Prevost', '2015-06-25', 'Pasquier', 'FR1537765000559B36MSWZAKQ01', '54530', '39 134', '1976-04-20', 'Marié(e)', 'Masculin', 1, '', 'denis74@noos.fr', NULL, NULL, '03 10 85 29 17', '0439035911', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1312, 5, NULL, 1, 66, 1, 'Gilbert', 'Pruvost', '2004-02-19', 'Gregoire', 'FR499546447161Z52D7U5749287', '86 511', '95852', '2013-01-22', 'Célibataire', 'Féminin', 1, 'susan-colettepierre@univ-thies.sn', 'anais.gimenez@bernard.com', NULL, NULL, '0580845414', '+33 (0)2 85 14 90 25', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1313, 4, NULL, 1, 152, 2, 'Arnaude', 'Marchal', '2014-03-28', 'Besson-les-Bains', 'FR52924517530888KYW4XL79738', '01386', '51 307', '1993-08-15', 'Veuf(ve)', 'Féminin', 0, 'ren', 'jbousquet@couturier.com', NULL, NULL, '05 63 58 78 10', '+33 (0)4 98 07 14 57', 8, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1314, 4, NULL, 1, 93, 1, 'Roger', 'Germain', '2001-10-21', 'Martineau', 'FR905891647114O3V6VNAJ99463', '79542', '76 115', '2017-11-23', 'Veuf(ve)', 'Masculin', 0, 'augusteperon@univ-thies.sn', 'raymond72@club-internet.fr', NULL, NULL, '+33 1 85 78 95 99', '0342851470', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1315, 1, NULL, 1, 99, 4, 'Caroline', 'Aubry', '1971-03-11', 'Begue', 'FR728732937585667OEK93DSD21', '15 214', '67 870', '2014-06-12', 'Célibataire', 'Féminin', 0, 'philippemerle@univ-thies.sn', 'marcel.collet@dbmail.com', NULL, NULL, '+33 4 43 27 00 50', '+33 8 27 64 01 48', 4, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1316, 5, NULL, 1, 81, 2, 'Luc', 'Gautier', '2019-08-05', 'Martineauboeuf', 'FR16807873094476R4MMYD19I50', '10 545', '59411', '2008-02-28', 'Marié(e)', 'Masculin', 0, 'jeannerichard@univ-thies.sn', 'margaux.chauvin@live.com', NULL, NULL, '0246444574', '0622918366', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1317, 4, NULL, 1, 98, 3, 'Paul', 'Blondel', '2008-11-23', 'Dupre', 'FR6343945376028P3406J52R885', '92 704', '16 532', '1995-03-29', 'Célibataire', 'Masculin', 1, 'brigittecolas@univ-thies.sn', 'marcelle.thibault@gmail.com', NULL, NULL, '+33 (0)5 08 95 61 11', '0140919085', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1318, 5, NULL, 1, 143, 4, 'Rémy', 'Imbert', '2014-08-17', 'Picard-sur-Mer', 'FR10559681475539UBLGPJS1558', '49 959', '98146', '1978-12-25', 'Célibataire', 'Féminin', 1, '', 'bazin.franck@roux.org', NULL, NULL, '05 37 30 85 60', '01 47 58 18 86', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1319, 1, NULL, 1, 80, 1, 'Adèle', 'Morvan', '2018-02-09', 'Arnaud', 'FR1690257792992G2O76X81VA75', '30561', '40722', '1991-06-29', 'Célibataire', 'Féminin', 1, 'doroth', 'dleleu@laine.fr', NULL, NULL, '+33 (0)1 27 26 45 47', '+33 6 81 86 57 18', 7, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1320, 1, NULL, 1, 224, 1, 'Catherine', 'Coulon', '1999-03-30', 'Mathieu', 'FR5727992826509BJ5H63S6V233', '06910', '22399', '2009-02-27', 'Célibataire', 'Féminin', 0, 's', 'antoine33@teixeira.com', NULL, NULL, '02 55 56 71 67', '+33 4 90 72 70 67', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1321, 5, NULL, 1, 104, 4, 'Yves', 'Colas', '2014-02-15', 'Menard', 'FR302981931532ZTDJFN65S6Y25', '72183', '40 278', '2009-05-02', 'Veuf(ve)', 'Masculin', 1, 'fran', 'eugene52@letellier.net', NULL, NULL, '+33 1 91 63 52 28', '0121616495', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1322, 4, NULL, 1, 30, 2, 'Luc', 'Laroche', '1975-07-02', 'Alves-les-Bains', 'FR94798318846567PYRNM18G392', '13 932', '25 266', '1984-03-09', 'Veuf(ve)', 'Masculin', 1, 'marcellelemaitre@univ-thies.sn', 'denise.moreno@tiscali.fr', NULL, NULL, '+33 9 86 31 63 61', '07 72 91 50 20', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1323, 4, NULL, 1, 82, 4, 'Maurice', 'Mary', '1986-11-01', 'Launay-les-Bains', 'FR029583780491C998QIW804406', '39 388', '28 403', '1984-10-23', 'Marié(e)', 'Féminin', 0, 'virginieguerin@univ-thies.sn', 'chauvet.alphonse@free.fr', NULL, NULL, '+33 9 99 77 99 14', '+33 (0)1 43 14 93 59', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1324, 4, NULL, 1, 87, 4, 'Robert', 'Morvan', '2008-03-30', 'BourgeoisBourg', 'FR480861942024M91W8NV295461', '58875', '25512', '1979-07-15', 'Marié(e)', 'Masculin', 1, 'p', 'olivier06@vaillant.fr', NULL, NULL, '+33 8 14 51 62 70', '0478242323', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1325, 1, NULL, 1, 42, 2, 'Claude', 'Renard', '2016-10-16', 'Pons', 'FR8817034764308R6QR7Y001Y00', '55 513', '67 311', '1980-08-23', 'Célibataire', 'Féminin', 1, 'antoinettevallee@univ-thies.sn', 'marine06@dossantos.com', NULL, NULL, '0153762021', '+33 5 77 03 58 58', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1326, 4, NULL, 1, 43, 3, 'Xavier', 'Bousquet', '1990-04-18', 'Thibault-la-Forêt', 'FR9693022245114D6O0S6E84Y56', '95095', '91 973', '2010-09-13', 'Divorcé(e)', 'Féminin', 0, 'no', 'marcel.morin@brun.fr', NULL, NULL, '0358295158', '+33 (0)9 85 00 75 15', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1327, 5, NULL, 1, 109, 3, 'Aurélie', 'Da Costa', '1975-01-25', 'Faivre', 'FR8003402328212O7OLSV3Z4783', '15591', '88 155', '2006-10-27', 'Marié(e)', 'Masculin', 1, 'jacquelineboutin@univ-thies.sn', 'wlegall@laposte.net', NULL, NULL, '0133777844', '+33 (0)7 38 35 13 83', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1328, 1, NULL, 1, 236, 1, 'Louis', 'Bourdon', '2007-11-07', 'MailletVille', 'FR414242650501REH1LEPM53384', '22749', '76762', '1985-07-05', 'Veuf(ve)', 'Masculin', 1, 'alixfournier@univ-thies.sn', 'jourdan.juliette@martineau.fr', NULL, NULL, '+33 (0)5 93 90 39 04', '+33 2 66 31 59 33', 1, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1329, 5, NULL, 1, 235, 2, 'Christine', 'Delmas', '1987-02-21', 'Baudry', 'FR49476091521157R16L6T17E78', '15 782', '70772', '2005-12-01', 'Marié(e)', 'Masculin', 0, 'anoukpelletier@univ-thies.sn', 'nbrun@noos.fr', NULL, NULL, '+33 5 41 40 25 45', '+33 (0)3 84 46 17 26', 7, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1330, 5, NULL, 1, 37, 4, 'Adrienne', 'Faivre', '2001-01-01', 'Thibault', 'FR453101346088UD052QU117211', '37 508', '33728', '2000-12-05', 'Divorcé(e)', 'Masculin', 1, 'st', 'nrenard@moreno.com', NULL, NULL, '+33 1 46 08 45 32', '+33 1 07 97 97 91', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1331, 5, NULL, 1, 55, 3, 'Caroline', 'Durand', '1997-09-06', 'Chauvet', 'FR204128259470SSUB3CXW5BX78', '72952', '24994', '2017-10-20', 'Veuf(ve)', 'Féminin', 0, 'julessanchez-prevost@univ-thies.sn', 'lucie25@denis.fr', NULL, NULL, '+33 (0)2 64 12 59 73', '02 65 76 05 50', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1332, 5, NULL, 1, 43, 2, 'Margot', 'Hardy', '1970-12-19', 'Morvandan', 'FR3946597508168UUT5D4EE8163', '49279', '88379', '1976-01-01', 'Marié(e)', 'Masculin', 1, 'corinnedelahaye@univ-thies.sn', 'louis39@ifrance.com', NULL, NULL, '+33 1 45 21 12 80', '+33 (0)6 78 57 83 10', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1333, 4, NULL, 1, 112, 4, 'Alain', 'Leroy', '1972-03-07', 'Bonnin-sur-Picard', 'FR18912664479847W0QX9C04485', '26083', '41 061', '1990-02-15', 'Divorcé(e)', 'Féminin', 1, 'diane-moniquelegrand@univ-thies.sn', 'jacques.henriette@hamon.fr', NULL, NULL, '+33 (0)3 10 66 20 49', '+33 (0)4 08 49 24 61', 8, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1334, 1, NULL, 1, 122, 3, 'Hortense', 'Philippe', '2007-02-10', 'Mercier-la-Forêt', 'FR185187600987O781Y1505N785', '51957', '14736', '2001-02-24', 'Célibataire', 'Masculin', 0, 'susan-in', 'smarques@renault.fr', NULL, NULL, '+33 (0)6 40 82 46 95', '0538329511', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1335, 4, NULL, 1, 187, 3, 'Gilbert', 'Lacombe', '2017-05-09', 'Levy', 'FR55982556291840M0VT4R9FW70', '56314', '29 459', '2015-02-18', 'Divorcé(e)', 'Féminin', 1, 'andr', 'lesage.paul@hotmail.fr', NULL, NULL, '+33 2 77 39 98 57', '0149639303', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1336, 5, NULL, 1, 159, 1, 'Michèle', 'Lacroix', '2010-03-05', 'Costa-sur-Peron', 'FR759019830182296G49PQ9F055', '62 790', '97553', '1989-12-26', 'Veuf(ve)', 'Féminin', 0, 'jos', 'bbarthelemy@dbmail.com', NULL, NULL, '02 27 53 89 83', '+33 (0)6 64 40 38 94', 8, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1337, 4, NULL, 1, 95, 3, 'Luc', 'De Sousa', '2003-01-21', 'Marchandnec', 'FR508275447901ALZ7A8JBG3718', '17 584', '79706', '1976-03-10', 'Marié(e)', 'Masculin', 1, 'arnaudedelalecoq@univ-thies.sn', 'glouis@bonnet.com', NULL, NULL, '+33 7 51 65 97 03', '03 29 61 44 26', 6, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1338, 4, NULL, 1, 1, 3, 'Monique', 'Bigot', '2008-05-17', 'Ramosdan', 'FR36717245047121SJUDC6UW490', '91902', '00 570', '2007-11-22', 'Célibataire', 'Masculin', 0, 'andr', 'seguin.colette@orange.fr', NULL, NULL, '0689021178', '04 77 38 56 12', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1339, 4, NULL, 1, 126, 4, 'Robert', 'Hoarau', '2019-02-18', 'Chartier-la-Forêt', 'FR909111644799H0A70HGP0OX15', '34766', '42901', '2010-10-29', 'Marié(e)', 'Masculin', 0, 'simonearnaud@univ-thies.sn', 'brigitte93@wanadoo.fr', NULL, NULL, '07 93 89 34 39', '+33 5 67 50 87 24', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1340, 4, NULL, 1, 173, 3, 'Sylvie', 'Francois', '2016-08-08', 'Cousin-sur-Valentin', 'FR76224418952239VB1LC0H7D93', '66 545', '48 883', '1971-02-01', 'Divorcé(e)', 'Masculin', 0, 'am', 'uprevost@sfr.fr', NULL, NULL, '0255332831', '01 12 58 49 40', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1341, 4, NULL, 1, 226, 2, 'Emmanuel', 'Salmon', '1983-07-11', 'Fischer-sur-Rousseau', 'FR1680965306325W1C6WYM4L145', '23 200', '46 157', '2013-04-10', 'Marié(e)', 'Masculin', 1, 'richardbarbe@univ-thies.sn', 'besson.marguerite@voila.fr', NULL, NULL, '01 34 73 77 11', '+33 (0)5 69 89 90 99', 7, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1342, 1, NULL, 1, 145, 4, 'Daniel', 'Allain', '2003-07-14', 'Bailly-sur-Delattre', 'FR043747384174R8YZ04H9ET263', '61 330', '56 734', '1984-09-09', 'Divorcé(e)', 'Masculin', 1, 'suzannelegrand-hubert@univ-thies.sn', 'rene.rocher@boucher.com', NULL, NULL, '+33 1 79 99 17 71', '+33 (0)1 30 38 21 81', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1343, 4, NULL, 1, 72, 3, 'Alix', 'Valette', '2009-07-11', 'GilletVille', 'FR459982192853L9J93UHY86854', '43262', '31503', '1987-03-31', 'Célibataire', 'Féminin', 0, 'georgescollet@univ-thies.sn', 'henri38@gmail.com', NULL, NULL, '0814645678', '+33 (0)2 19 31 72 57', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1344, 1, NULL, 1, 101, 2, 'Patrick', 'Remy', '2010-03-16', 'Berger', 'FR100495672892Y5610N45N6O38', '74 444', '56884', '1982-03-27', 'Marié(e)', 'Féminin', 0, 'marineperrier@univ-thies.sn', 'alice28@faure.com', NULL, NULL, '+33 4 24 42 76 57', '03 35 64 34 78', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1345, 5, NULL, 1, 76, 1, 'Zoé', 'Pelletier', '1988-04-26', 'Chauvet-la-Forêt', 'FR2332769919904HFC80K0G6486', '93902', '50265', '1983-05-03', 'Divorcé(e)', 'Masculin', 0, 'gabrieldulebon@univ-thies.sn', 'qgeorges@noos.fr', NULL, NULL, '0983023436', '+33 7 38 06 48 26', 9, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1346, 1, NULL, 1, 118, 2, 'Françoise', 'Henry', '1977-04-05', 'Riou-les-Bains', 'FR2206507529361ND08J95D2394', '33 689', '03087', '2010-09-05', 'Marié(e)', 'Masculin', 1, 'marcellebarre-lefebvre@univ-thies.sn', 'nmarion@thierry.com', NULL, NULL, '04 52 28 10 40', '+33 6 50 29 10 48', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1347, 1, NULL, 1, 155, 3, 'Joséphine', 'Blin', '2017-04-27', 'Lefevre', 'FR1306251449376DM48LB640714', '48 433', '06547', '2017-06-01', 'Marié(e)', 'Masculin', 0, 'daniellemorin@univ-thies.sn', 'thomas.dominique@auger.com', NULL, NULL, '+33 (0)2 87 19 22 74', '0785483215', 2, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1348, 5, NULL, 1, 195, 2, 'Maggie', 'Bouvier', '1995-09-23', 'Perrinboeuf', 'FR616054607946E49150PL4QB19', '89361', '98289', '1993-08-24', 'Veuf(ve)', 'Féminin', 0, 'olivierdelanguyen@univ-thies.sn', 'margaret.blin@lamy.fr', NULL, NULL, '+33 (0)8 97 73 13 20', '0968132947', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1349, 5, NULL, 1, 5, 2, 'Jacques', 'Diallo', '2008-05-01', 'Etiennedan', 'FR193336269193SJBBY915XR710', '63755', '62980', '2009-11-04', 'Divorcé(e)', 'Masculin', 1, 'maggieseguin@univ-thies.sn', 'mendes.adrien@tele2.fr', NULL, NULL, '+33 2 54 47 57 53', '+33 (0)3 41 90 94 08', 4, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1350, 1, NULL, 1, 208, 3, 'Louis', 'Rocher', '1984-02-17', 'Gaillard', 'FR434060878777O543B5YA30T14', '62 456', '19 967', '2012-04-13', 'Divorcé(e)', 'Féminin', 1, 'capucineleroux@univ-thies.sn', 'gilbert84@yahoo.fr', NULL, NULL, '+33 4 94 63 33 93', '+33 8 98 45 84 44', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1351, 1, NULL, 1, 130, 3, 'Tristan', 'Pires', '2019-12-21', 'Moreau-sur-Bourgeois', 'FR4986721911434R07U2EO88534', '07315', '53 568', '2017-11-14', 'Divorcé(e)', 'Masculin', 0, 'louisbesson@univ-thies.sn', 'jean97@marchal.com', NULL, NULL, '0199481039', '+33 (0)2 27 83 10 12', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1352, 5, NULL, 1, 155, 3, 'Eugène', 'Traore', '2000-12-06', 'Bonnet', 'FR8475037102746OJT2195ZPY38', '51124', '78961', '1983-12-04', 'Veuf(ve)', 'Masculin', 1, '', 'thibault.michel@wanadoo.fr', NULL, NULL, '+33 1 09 69 46 86', '05 21 28 29 50', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1353, 1, NULL, 1, 205, 4, 'Marthe', 'Delmas', '2014-11-16', 'De Sousaboeuf', 'FR226808758968BQAS985RFD602', '93807', '76967', '2009-10-04', 'Célibataire', 'Féminin', 1, 'th', 'coste.diane@dbmail.com', NULL, NULL, '+33 (0)9 98 50 73 30', '0231153062', 9, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1354, 1, NULL, 1, 92, 3, 'Nathalie', 'Duval', '1978-03-12', 'Guyon', 'FR618153576247X565GUS0U8722', '75360', '52 384', '2021-02-06', 'Veuf(ve)', 'Masculin', 1, 'odettedelahaye@univ-thies.sn', 'madeleine72@garnier.fr', NULL, NULL, '+33 (0)1 19 10 39 52', '+33 (0)3 34 36 53 34', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1355, 1, NULL, 1, 83, 1, 'Tristan', 'Bouvet', '2019-09-22', 'Joubert-sur-Lebreton', 'FR0772244503722L895TJJG1O56', '69971', '03751', '1999-09-02', 'Célibataire', 'Masculin', 0, 'marielaurent@univ-thies.sn', 'edouard.paul@clerc.org', NULL, NULL, '07 76 30 71 58', '+33 9 88 15 67 35', 4, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1356, 1, NULL, 1, 87, 2, 'Hugues', 'Pottier', '1994-10-29', 'Parent', 'FR2567240304626Q201I5R1LB23', '99951', '21766', '2007-06-27', 'Veuf(ve)', 'Masculin', 0, 'ad', 'jgirard@blanc.fr', NULL, NULL, '+33 (0)8 92 93 64 96', '+33 (0)9 23 33 20 32', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1357, 1, NULL, 1, 13, 1, 'Martin', 'Bousquet', '1998-06-08', 'Lejeune', 'FR981336412260TKM68R9I51W01', '84 937', '15906', '2012-10-22', 'Marié(e)', 'Masculin', 0, 'laure-hortensebaron@univ-thies.sn', 'danielle51@david.net', NULL, NULL, '+33 (0)2 27 14 51 51', '+33 (0)3 46 10 65 74', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1358, 1, NULL, 1, 28, 1, 'Christine', 'Blanchet', '2001-08-30', 'Legros', 'FR144175048285JIE24C9310E09', '36189', '75329', '1997-08-31', 'Marié(e)', 'Féminin', 1, 'luccharrier@univ-thies.sn', 'hardy.cecile@voila.fr', NULL, NULL, '02 17 85 48 75', '0101631432', 9, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1359, 5, NULL, 1, 116, 3, 'Michel', 'Richard', '1997-01-02', 'Michel', 'FR305492927495VT43609M06Q22', '81646', '33737', '1982-09-29', 'Divorcé(e)', 'Masculin', 1, 'margueritelemichaud@univ-thies.sn', 'alphonse.gregoire@legrand.com', NULL, NULL, '01 35 67 58 62', '03 69 17 96 09', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1360, 1, NULL, 1, 206, 2, 'Dominique', 'Fleury', '1977-12-30', 'Delattre', 'FR4241446756798B7OXEFAV4R79', '36225', '76 327', '2015-11-25', 'Célibataire', 'Masculin', 1, 'agn', 'robert.launay@dbmail.com', NULL, NULL, '0199938814', '+33 (0)8 07 97 74 00', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1361, 5, NULL, 1, 112, 4, 'Michelle', 'Martineau', '1983-01-03', 'Pichon', 'FR33799853576480FM3ZJ61RJ12', '69644', '82 848', '1996-03-03', 'Divorcé(e)', 'Masculin', 0, 'alfredblin-clement@univ-thies.sn', 'rene63@guichard.net', NULL, NULL, '02 67 32 28 80', '+33 4 35 91 22 42', 5, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1362, 1, NULL, 1, 123, 4, 'Adélaïde', 'Bonnet', '2012-11-08', 'Lemaire', 'FR044018812423E7X472JM0M979', '17939', '55421', '1977-10-12', 'Marié(e)', 'Féminin', 0, 'alexandria-constanceboucher@univ-thies.sn', 'adrien.olivier@hotmail.fr', NULL, NULL, '+33 4 26 90 45 51', '+33 (0)3 70 06 55 76', 7, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1363, 1, NULL, 1, 182, 2, 'Nicole', 'Launay', '2011-02-19', 'Masse', 'FR20585189692710QQ1U0TD8V15', '60 623', '25 859', '2019-03-30', 'Veuf(ve)', 'Féminin', 0, 'doroth', 'meunier.anastasie@sfr.fr', NULL, NULL, '0908116131', '+33 (0)7 53 45 44 15', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1364, 4, NULL, 1, 157, 2, 'Monique', 'Perrot', '2014-11-11', 'Albertnec', 'FR330972322429L72938194Z524', '95018', '45493', '1999-09-16', 'Marié(e)', 'Masculin', 0, 'marcelcarre@univ-thies.sn', 'noel.leclerc@club-internet.fr', NULL, NULL, '+33 9 03 21 80 78', '0602320067', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1365, 4, NULL, 1, 193, 4, 'Philippe', 'Alexandre', '1989-03-14', 'Dias-la-Forêt', 'FR845848854360Q997P3Q04PC42', '64202', '42701', '1998-12-20', 'Célibataire', 'Masculin', 0, 'h', 'valerie.bousquet@bailly.org', NULL, NULL, '+33 3 98 84 90 94', '+33 6 82 59 95 22', 7, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1366, 5, NULL, 1, 90, 4, 'Catherine', 'Parent', '1999-03-30', 'Mendesboeuf', 'FR100747140709304E17QF8T455', '71297', '89606', '1998-04-29', 'Célibataire', 'Féminin', 1, 'antoinerodrigues@univ-thies.sn', 'nicolas31@tele2.fr', NULL, NULL, '+33 6 72 22 77 90', '+33 1 87 61 31 93', 6, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1367, 1, NULL, 1, 54, 3, 'Alphonse', 'Lopez', '2007-04-27', 'MerleBourg', 'FR872376139201D9WL17784WQ84', '41005', '76 073', '2006-01-14', 'Veuf(ve)', 'Féminin', 1, 'ad', 'marchal.isaac@laporte.fr', NULL, NULL, '+33 (0)4 57 82 73 57', '0239972429', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1368, 1, NULL, 1, 129, 1, 'Alphonse', 'Bernier', '2012-02-11', 'MarieVille', 'FR8139187907585L1X1YW406946', '35759', '00666', '1983-04-12', 'Veuf(ve)', 'Féminin', 1, 'dianechauvet@univ-thies.sn', 'henry.georges@baudry.fr', NULL, NULL, '+33 3 74 30 27 77', '+33 (0)4 19 47 06 84', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1369, 1, NULL, 1, 69, 4, 'Georges', 'Perrot', '1981-01-14', 'Gaillard', 'FR94381196376496B061X11P974', '74 869', '81090', '2014-11-02', 'Divorcé(e)', 'Masculin', 0, 'gilbertleroy-lagarde@univ-thies.sn', 'robert.chauveau@noos.fr', NULL, NULL, '03 52 42 11 95', '+33 2 13 37 26 48', 3, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1370, 5, NULL, 1, 51, 3, 'Amélie', 'Gilles', '2018-01-29', 'Richardboeuf', 'FR036938934221N5Q0DP85C2911', '92957', '91095', '2019-12-06', 'Célibataire', 'Masculin', 1, 'tristangoncalves@univ-thies.sn', 'paul72@colin.com', NULL, NULL, '05 54 64 38 75', '04 88 03 43 52', 1, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1371, 5, NULL, 1, 76, 4, 'Océane', 'Rodrigues', '1973-08-26', 'Allain-sur-Seguin', 'FR602001610585SL1LDF9DHIW16', '58499', '43 062', '1982-02-25', 'Célibataire', 'Masculin', 0, 'dominiquedebecker@univ-thies.sn', 'xavier14@dbmail.com', NULL, NULL, '+33 6 69 74 55 40', '04 54 56 13 79', 7, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1372, 1, NULL, 1, 52, 2, 'Étienne', 'Traore', '2000-10-01', 'Godard-sur-Baudry', 'FR1664613869679J9GFUO0C4V76', '80 915', '39 352', '1997-08-11', 'Marié(e)', 'Masculin', 0, 'isabelledurolland@univ-thies.sn', 'chauvet.marthe@tele2.fr', NULL, NULL, '+33 (0)1 67 60 59 23', '08 28 96 06 09', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1373, 5, NULL, 1, 60, 1, 'Gabrielle', 'Torres', '1980-11-03', 'Marchand', 'FR384192050163W531HC9WKL335', '79 609', '86 012', '2010-12-25', 'Marié(e)', 'Féminin', 1, 'jeannineseguin@univ-thies.sn', 'remy32@laposte.net', NULL, NULL, '06 19 99 92 03', '0115895790', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1374, 1, NULL, 1, 210, 4, 'Renée', 'Gilles', '2008-09-04', 'Rodrigues', 'FR9626155954788OJ0FSKF2M902', '63586', '66 589', '1971-05-19', 'Marié(e)', 'Féminin', 0, 'paulinegoncalves@univ-thies.sn', 'opoulain@leblanc.fr', NULL, NULL, '03 94 82 15 66', '+33 3 24 49 62 34', 3, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1375, 4, NULL, 1, 202, 4, 'Michelle', 'Hubert', '1979-12-12', 'Guillou', 'FR9680774986432DUUNKL750106', '56204', '27 295', '1993-12-23', 'Célibataire', 'Masculin', 0, 'marcellegermain@univ-thies.sn', 'morvan.rene@tele2.fr', NULL, NULL, '+33 4 12 43 79 93', '+33 7 85 72 54 27', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1376, 5, NULL, 1, 97, 2, 'Clémence', 'Chauveau', '1991-01-25', 'Boulanger-sur-Loiseau', 'FR914243206714577L2K8H81L12', '74578', '34 412', '2019-09-11', 'Veuf(ve)', 'Féminin', 0, 's', 'victoire04@lemonnier.fr', NULL, NULL, '0934641501', '+33 3 79 89 82 81', 3, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1377, 4, NULL, 1, 213, 4, 'Monique', 'Lefevre', '2014-05-20', 'Lecomte', 'FR2298484686997HPF6UT650G52', '40 622', '83239', '1988-06-21', 'Divorcé(e)', 'Masculin', 1, 'josephchauvin@univ-thies.sn', 'patrick78@noos.fr', NULL, NULL, '+33 2 52 39 53 53', '0659915332', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1378, 4, NULL, 1, 151, 3, 'Margaret', 'Ollivier', '2003-01-01', 'Langlois-sur-Francois', 'FR93185859431454A2ATHKRN787', '75393', '21748', '2009-12-05', 'Divorcé(e)', 'Masculin', 0, 'martinthierry@univ-thies.sn', 'honore33@dupuis.fr', NULL, NULL, '+33 1 28 59 83 94', '02 75 29 23 75', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1379, 1, NULL, 1, 137, 3, 'Bertrand', 'Roy', '1984-06-11', 'Ollivier-sur-Mer', 'FR950395190457AE5QMCHV9F685', '24199', '81 217', '2000-06-15', 'Veuf(ve)', 'Masculin', 0, 'richardcollet@univ-thies.sn', 'thernandez@goncalves.com', NULL, NULL, '07 85 20 83 06', '0486942836', 6, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1380, 1, NULL, 1, 68, 1, 'Raymond', 'Louis', '2001-11-30', 'Pineau', 'FR552209641189O3C7DI6R49172', '39 242', '22092', '1980-11-30', 'Célibataire', 'Féminin', 1, 'madeleine-lucehebert@univ-thies.sn', 'david.valette@bouygtel.fr', NULL, NULL, '+33 (0)4 75 70 38 18', '+33 (0)2 98 12 59 59', 2, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1381, 1, NULL, 1, 17, 3, 'Manon', 'Legendre', '2001-04-24', 'Fontainenec', 'FR181652591584842491G98R976', '26 544', '74276', '1970-06-18', 'Divorcé(e)', 'Féminin', 1, '', 'breynaud@free.fr', NULL, NULL, '+33 5 00 15 95 45', '05 43 14 35 59', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1382, 5, NULL, 1, 58, 3, 'Christelle', 'Fournier', '2016-07-20', 'Le Goff', 'FR493506921314R6V43E0FURV29', '76833', '50006', '1983-05-13', 'Marié(e)', 'Masculin', 1, 'thomasmillet-guichard@univ-thies.sn', 'lesage.andre@noos.fr', NULL, NULL, '+33 (0)9 27 93 34 12', '+33 (0)8 92 12 74 29', 4, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1383, 1, NULL, 1, 140, 2, 'Laetitia', 'Leclercq', '1996-06-09', 'Baron', 'FR5771326374743I8U8658H5J05', '10399', '84 253', '1996-11-14', 'Veuf(ve)', 'Féminin', 1, 'r', 'eric.colas@tele2.fr', NULL, NULL, '01 80 50 08 81', '+33 (0)2 20 05 45 58', 5, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1384, 5, NULL, 1, 82, 4, 'Richard', 'Ferrand', '2021-04-28', 'Chretiendan', 'FR873316988517WB0490V6YMA92', '78812', '27814', '1984-08-10', 'Divorcé(e)', 'Masculin', 1, 'ana', 'madeleine76@live.com', NULL, NULL, '+33 (0)4 91 98 05 30', '+33 (0)9 26 98 10 09', 5, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1385, 4, NULL, 1, 135, 3, 'Arthur', 'Delorme', '2013-07-17', 'Bodin', 'FR3567162607478TK9OX30U6945', '31760', '29739', '1983-04-17', 'Veuf(ve)', 'Féminin', 0, 'simonerousseau@univ-thies.sn', 'pottier.astrid@morel.fr', NULL, NULL, '+33 5 37 00 53 38', '01 66 33 37 81', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1386, 1, NULL, 1, 5, 4, 'Thierry', 'Moreno', '1989-01-31', 'CharlesBourg', 'FR683294515286S8VQ636J1J627', '00617', '23314', '2016-11-11', 'Veuf(ve)', 'Masculin', 1, 'juleslegall@univ-thies.sn', 'gilles.descamps@samson.org', NULL, NULL, '08 16 81 26 62', '+33 8 13 21 25 05', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1387, 5, NULL, 1, 240, 2, 'Suzanne', 'Caron', '1987-07-04', 'Baron', 'FR777730013787Q9C22FVZS6970', '54 709', '53 895', '2010-04-22', 'Célibataire', 'Masculin', 1, 'alicecarlier@univ-thies.sn', 'zacharie.bourdon@berthelot.org', NULL, NULL, '02 57 13 49 35', '0321570367', 6, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1388, 4, NULL, 1, 127, 3, 'Marc', 'Lesage', '2014-11-09', 'Laurent', 'FR76931211679573513H01S1188', '63 460', '99 180', '2005-01-08', 'Marié(e)', 'Masculin', 1, '', 'elesage@morel.net', NULL, NULL, '+33 9 16 43 90 61', '01 87 30 55 65', 6, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1389, 1, NULL, 1, 6, 3, 'Hortense', 'Guillaume', '2002-06-19', 'Marchand', 'FR6272327751349U5J2N474TV68', '99135', '66 420', '2019-08-15', 'Célibataire', 'Féminin', 1, 'christophelemoine-costa@univ-thies.sn', 'catherine77@gomes.fr', NULL, NULL, '+33 (0)7 57 32 35 40', '+33 4 41 81 73 13', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1390, 1, NULL, 1, 127, 4, 'Gabriel', 'Cordier', '2013-01-14', 'WeissBourg', 'FR40349588524662M6I78SOBF27', '53 364', '09487', '2010-01-23', 'Divorcé(e)', 'Féminin', 1, 'margauddutorres@univ-thies.sn', 'charles.sebastien@sfr.fr', NULL, NULL, '0940165086', '+33 1 13 61 28 91', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1391, 5, NULL, 1, 192, 2, 'Martin', 'Besson', '1976-11-05', 'Laine', 'FR1643454498819143T90Q0V579', '25161', '19657', '1993-05-13', 'Divorcé(e)', 'Féminin', 0, 'lucasolivier@univ-thies.sn', 'fernandez.patrick@charles.com', NULL, NULL, '+33 1 76 05 27 56', '01 62 70 41 97', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1392, 4, NULL, 1, 202, 3, 'Aimée', 'Bonnin', '1981-07-13', 'Caron', 'FR85453935811114MV5S071NK18', '04841', '24283', '2008-06-07', 'Divorcé(e)', 'Féminin', 1, 'claudinedelarobert@univ-thies.sn', 'alexandrie16@roussel.fr', NULL, NULL, '0760663367', '+33 7 85 88 84 37', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1393, 1, NULL, 1, 219, 3, 'Richard', 'Diallo', '2013-04-14', 'Dumontboeuf', 'FR654568454859EFJ80EH907Q20', '81549', '67 582', '2007-05-12', 'Marié(e)', 'Féminin', 0, 'jeanallard@univ-thies.sn', 'elise64@tanguy.fr', NULL, NULL, '0158700533', '+33 (0)2 04 62 68 21', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1394, 1, NULL, 1, 143, 4, 'Véronique', 'Laurent', '1971-01-15', 'DescampsVille', 'FR83225333305258785G366EY43', '96 766', '17 959', '1986-02-18', 'Veuf(ve)', 'Féminin', 1, 'augustinbodin@univ-thies.sn', 'hugues80@lebon.com', NULL, NULL, '03 74 03 46 55', '+33 5 59 71 73 77', 1, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1395, 4, NULL, 1, 78, 2, 'Roger', 'Rodrigues', '1991-06-07', 'Gilles', 'FR443218286529NZ2F121J5G604', '86823', '98885', '2004-07-09', 'Divorcé(e)', 'Masculin', 0, 'christelleleveque@univ-thies.sn', 'claudine12@meunier.org', NULL, NULL, '+33 2 44 26 76 86', '0542898554', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1396, 4, NULL, 1, 140, 1, 'Vincent', 'Merle', '1986-05-03', 'Gauthier-sur-Mer', 'FR466225818658I6V4A04599111', '22755', '72 074', '1982-05-10', 'Veuf(ve)', 'Masculin', 1, 'olivierlegoff@univ-thies.sn', 'elegendre@laporte.com', NULL, NULL, '+33 (0)3 36 84 78 62', '0794065803', 6, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1397, 4, NULL, 1, 138, 4, 'Capucine', 'Lucas', '2018-10-05', 'Colin', 'FR7115990895786E53G10RHZC66', '54897', '39 733', '2015-09-04', 'Veuf(ve)', 'Masculin', 0, 'huguesgodard@univ-thies.sn', 'brun.alexandria@levy.com', NULL, NULL, '0520082512', '03 14 72 01 94', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1398, 5, NULL, 1, 172, 4, 'Philippe', 'Martins', '1985-04-27', 'Bertinnec', 'FR81764476729793S64Y1G8FO81', '59462', '73 510', '1986-05-14', 'Divorcé(e)', 'Masculin', 0, 'marthedijoux@univ-thies.sn', 'meyer.pierre@live.com', NULL, NULL, '0898676875', '+33 3 41 43 30 28', 6, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1399, 1, NULL, 1, 44, 4, 'Christophe', 'Gregoire', '1993-06-16', 'Lagarde', 'FR18284826347960SAF504E4312', '53 256', '24241', '1989-05-15', 'Divorcé(e)', 'Masculin', 1, 'antoinecolin@univ-thies.sn', 'suzanne.hamel@tiscali.fr', NULL, NULL, '+33 5 58 73 44 44', '02 37 09 03 73', 4, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1400, 4, NULL, 1, 217, 3, 'Édouard', 'Marechal', '2004-03-14', 'Sanchez', 'FR279672583037AU25LCWV05531', '88 712', '43162', '1978-08-30', 'Veuf(ve)', 'Féminin', 1, 'chantalcourtois@univ-thies.sn', 'nlebrun@wanadoo.fr', NULL, NULL, '+33 (0)8 97 20 14 08', '0789294193', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1401, 4, NULL, 1, 47, 1, 'Benoît', 'Raymond', '1998-08-01', 'Laporte', 'FR611547199140667UT5G511018', '77740', '37639', '2019-10-15', 'Marié(e)', 'Féminin', 1, 'davidhuet@univ-thies.sn', 'grenier.alfred@orange.fr', NULL, NULL, '+33 1 49 77 24 70', '04 11 38 13 25', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1402, 5, NULL, 1, 64, 2, 'Gérard', 'Peltier', '1970-06-09', 'Gosselin', 'FR90560060839704N26G0TQXI00', '15426', '13 383', '1985-05-15', 'Marié(e)', 'Féminin', 0, 'hortensedescamps@univ-thies.sn', 'theodore20@robin.fr', NULL, NULL, '0115039359', '0949858150', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1403, 1, NULL, 1, 107, 3, 'Anaïs', 'Moulin', '1997-09-29', 'Delmas-les-Bains', 'FR285731050290X27Q0CB1RC395', '45 760', '46259', '2018-01-07', 'Veuf(ve)', 'Masculin', 1, 'vincent-lucascharrier@univ-thies.sn', 'leclercq.manon@free.fr', NULL, NULL, '04 44 61 32 93', '06 67 61 42 18', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1404, 5, NULL, 1, 26, 4, 'Jérôme', 'Denis', '1999-08-03', 'David', 'FR898571702850O75VB3ULTT472', '58 306', '73 201', '1976-11-17', 'Célibataire', 'Masculin', 1, 'thomaschretien-martins@univ-thies.sn', 'nath.ribeiro@live.com', NULL, NULL, '09 41 28 84 00', '0232495433', 2, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1405, 1, NULL, 1, 39, 2, 'Gilbert', 'Bodin', '2008-01-10', 'Guyon', 'FR63595513657253969TL09J138', '32 448', '31315', '2015-09-18', 'Divorcé(e)', 'Masculin', 1, 'zacharieallard@univ-thies.sn', 'texier.jeanne@levy.com', NULL, NULL, '+33 (0)4 76 13 88 56', '06 17 08 36 54', 2, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1406, 4, NULL, 1, 46, 2, 'Andrée', 'Bonnin', '2003-10-09', 'Josephnec', 'FR869813082269A91V53B3D6719', '79068', '45892', '2015-04-18', 'Veuf(ve)', 'Masculin', 1, 'hortenserocher-muller@univ-thies.sn', 'royer.noel@mercier.com', NULL, NULL, '+33 (0)1 51 51 18 42', '+33 (0)5 73 12 89 76', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1407, 5, NULL, 1, 115, 3, 'Hélène', 'Henry', '1998-05-29', 'Leclerc-sur-Vidal', 'FR591106943250F50QH1LK03546', '83 750', '33147', '1989-03-15', 'Veuf(ve)', 'Féminin', 0, 'aur', 'jacques.gaillard@adam.fr', NULL, NULL, '+33 (0)1 19 01 29 92', '07 88 07 44 99', 7, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1408, 4, NULL, 1, 58, 3, 'Paul', 'Cordier', '1971-01-06', 'Didier-les-Bains', 'FR67773653152305M76O963PJ01', '99853', '34 015', '1983-12-15', 'Marié(e)', 'Masculin', 0, 'aur', 'gregoire83@neveu.com', NULL, NULL, '+33 3 86 80 94 43', '+33 9 88 82 07 47', 2, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1409, 4, NULL, 1, 47, 1, 'Claudine', 'Masse', '1982-07-27', 'Guillaume-sur-Mer', 'FR6283644191432S78SFX63B469', '77 578', '12 474', '2001-02-15', 'Divorcé(e)', 'Féminin', 1, 'gabrielleboutin@univ-thies.sn', 'ypascal@goncalves.fr', NULL, NULL, '+33 9 71 72 97 64', '0179151579', 7, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1410, 4, NULL, 1, 4, 3, 'Eugène', 'Barre', '1990-03-14', 'Pichon', 'FR703856783524639766L4S9E45', '51785', '82948', '1986-11-12', 'Divorcé(e)', 'Masculin', 0, '', 'hdupuis@wanadoo.fr', NULL, NULL, '+33 8 99 52 91 44', '+33 (0)6 57 69 33 98', 8, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1411, 1, NULL, 1, 46, 2, 'Alexandre', 'Olivier', '2014-11-25', 'Munoz-sur-Mer', 'FR681853458888595V0QK7H4C51', '32992', '53 156', '1972-04-01', 'Veuf(ve)', 'Masculin', 1, 'constancemichaud@univ-thies.sn', 'pleroy@raynaud.com', NULL, NULL, '0895112848', '0214230611', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1412, 5, NULL, 1, 166, 1, 'Danielle', 'Renault', '2002-05-27', 'Lejeune', 'FR916130644312283H4Z41Z3B27', '00708', '41410', '2010-09-19', 'Veuf(ve)', 'Masculin', 1, 'claire-c', 'pascal.jacqueline@dossantos.fr', NULL, NULL, '+33 1 90 22 02 02', '06 73 46 82 67', 7, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1413, 5, NULL, 1, 90, 3, 'Louise', 'Normand', '2011-04-19', 'Reynaud', 'FR979710053481912IEDJYY1W90', '89526', '45445', '1990-10-03', 'Marié(e)', 'Masculin', 0, 'augustinjoly@univ-thies.sn', 'rleclercq@roy.fr', NULL, NULL, '+33 2 28 00 82 63', '+33 9 06 45 72 43', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1414, 1, NULL, 1, 211, 3, 'Luce', 'Albert', '2006-12-16', 'Benard', 'FR755665938918JOC2F0UYJ5T35', '24400', '35 677', '2004-10-08', 'Célibataire', 'Masculin', 0, 'michelleguyot@univ-thies.sn', 'tlelievre@gmail.com', NULL, NULL, '+33 (0)8 26 87 80 51', '+33 (0)1 27 03 51 06', 5, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1415, 5, NULL, 1, 11, 4, 'Roland', 'Gros', '2003-06-07', 'Lemaire-sur-Bourgeois', 'FR53359955704750Y6602IAG583', '65 552', '77 193', '2015-06-20', 'Veuf(ve)', 'Masculin', 1, 'camilledufour-lelievre@univ-thies.sn', 'bvalette@hotmail.fr', NULL, NULL, '04 61 33 08 54', '+33 (0)6 81 11 32 09', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1416, 1, NULL, 1, 30, 3, 'René', 'Imbert', '1997-11-29', 'Rousset', 'FR4411244236830K82LLBYPS674', '92 924', '53405', '2014-08-04', 'Célibataire', 'Masculin', 1, 'bernadettecaron@univ-thies.sn', 'brigitte54@barre.com', NULL, NULL, '07 42 14 76 32', '+33 (0)2 58 44 98 74', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1417, 1, NULL, 1, 101, 3, 'Aimé', 'Remy', '1980-04-23', 'Albert', 'FR553403526783M82S86X7OR905', '50669', '44 733', '1981-12-01', 'Divorcé(e)', 'Féminin', 0, 'th', 'cecile.dumont@roussel.com', NULL, NULL, '0898320198', '+33 (0)2 96 18 39 87', 1, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1418, 5, NULL, 1, 240, 1, 'Jérôme', 'Lebreton', '1986-07-16', 'Le Goff-les-Bains', 'FR041591182386797J17737AB09', '03978', '17 756', '1971-03-17', 'Célibataire', 'Féminin', 0, 'michelpineau@univ-thies.sn', 'mgilles@perrin.fr', NULL, NULL, '+33 8 03 19 02 29', '+33 6 74 73 66 66', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1419, 5, NULL, 1, 58, 3, 'Roland', 'Hubert', '1976-06-29', 'Marchal-sur-Delannoy', 'FR304567581324VZFJO5VDCEU59', '88483', '41333', '1976-08-15', 'Divorcé(e)', 'Masculin', 1, 'eug', 'devaux.marcelle@maury.com', NULL, NULL, '+33 (0)7 48 65 47 32', '+33 5 97 74 90 08', 9, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1420, 4, NULL, 1, 98, 2, 'Renée', 'Pascal', '1987-06-11', 'Nicolas-sur-Fernandez', 'FR699875418132V523I2558P701', '16 854', '62139', '1982-01-02', 'Divorcé(e)', 'Masculin', 1, 'franckleduc@univ-thies.sn', 'nath05@lombard.fr', NULL, NULL, '06 88 59 51 25', '+33 1 15 08 80 88', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1421, 1, NULL, 1, 37, 1, 'Guy', 'Riviere', '2008-04-19', 'Prevost', 'FR246187232514665BHN00D2C52', '63839', '30200', '2009-08-31', 'Marié(e)', 'Féminin', 0, '', 'victoire78@bouygtel.fr', NULL, NULL, '+33 5 37 26 99 20', '+33 5 42 49 03 11', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1422, 4, NULL, 1, 158, 3, 'Caroline', 'Renault', '1982-07-15', 'Rey-la-Forêt', 'FR7586451616716423MMK8IOS23', '06622', '85771', '1974-04-10', 'Célibataire', 'Féminin', 0, 'fran', 'palbert@yahoo.fr', NULL, NULL, '0536819565', '+33 6 26 41 35 38', 4, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1423, 4, NULL, 1, 112, 2, 'Pierre', 'Hoareau', '1996-02-22', 'Payet', 'FR94961849085919RO5B20I5K43', '56 276', '86 560', '2018-01-21', 'Marié(e)', 'Féminin', 0, 'anastasiefischer@univ-thies.sn', 'victor42@yahoo.fr', NULL, NULL, '+33 (0)7 74 80 96 57', '+33 (0)1 45 20 73 20', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1424, 1, NULL, 1, 115, 2, 'Guy', 'Denis', '2009-08-27', 'Besson-la-Forêt', 'FR4013709958244OQ6902MTCO92', '50955', '95452', '1998-11-05', 'Divorcé(e)', 'Féminin', 1, '', 'richard68@bouygtel.fr', NULL, NULL, '04 26 91 94 12', '0651718842', 2, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1425, 4, NULL, 1, 89, 2, 'Nicole', 'Guilbert', '1999-07-10', 'Navarro', 'FR117935334084T81R978PFZA39', '28617', '98 897', '1979-03-30', 'Veuf(ve)', 'Masculin', 0, 'gilbertduklein@univ-thies.sn', 'wreynaud@tiscali.fr', NULL, NULL, '+33 1 51 64 29 58', '+33 4 26 08 31 92', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1426, 5, NULL, 1, 185, 3, 'Laurence', 'Nicolas', '2017-04-11', 'Thierryboeuf', 'FR3792167213162V9UG77X30220', '29 246', '92 547', '1978-09-02', 'Veuf(ve)', 'Masculin', 1, '', 'hugues91@neveu.com', NULL, NULL, '+33 7 66 27 68 00', '0211791803', 3, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1427, 1, NULL, 1, 45, 3, 'Emmanuelle', 'Pineau', '1976-07-22', 'Le Gall', 'FR2570007848439EZ07Z3IOP502', '76397', '67129', '2011-12-01', 'Célibataire', 'Féminin', 0, 'tristanleraymond@univ-thies.sn', 'adelaide80@martin.net', NULL, NULL, '0546570050', '+33 4 50 52 47 71', 6, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1428, 1, NULL, 1, 148, 4, 'Marc', 'Techer', '1995-02-16', 'Martel-sur-Mer', 'FR63147921706422N44F8X70400', '43864', '02 886', '2006-02-26', 'Célibataire', 'Féminin', 0, 'lucyperrin@univ-thies.sn', 'vcoste@hotmail.fr', NULL, NULL, '0138699942', '0891415519', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1429, 5, NULL, 1, 87, 1, 'Luc', 'Valette', '1984-04-20', 'Gaudin-sur-Lelievre', 'FR3859054242405W8N0XLBU4863', '01355', '48 181', '2009-10-08', 'Veuf(ve)', 'Féminin', 1, 'v', 'simone08@carlier.com', NULL, NULL, '+33 (0)8 17 92 19 98', '05 26 12 77 72', 5, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1430, 5, NULL, 1, 66, 2, 'Jacques', 'Teixeira', '2012-04-11', 'Moulin', 'FR0636461100434O40LGKC1T744', '23 435', '38550', '1975-08-12', 'Marié(e)', 'Masculin', 1, 'fr', 'tledoux@lemaire.net', NULL, NULL, '06 27 43 93 49', '+33 (0)3 85 02 42 08', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL);
INSERT INTO `employe` (`id`, `caisse_sociale`, `grade`, `mutuelle_sante`, `nationalite`, `type_employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `cni`, `matricule`, `matricule_caisse_sociale`, `date_recrutement`, `situtation_matrimoniale`, `genre`, `etat`, `email_univ`, `email`, `filename`, `filepath`, `telephone_primaire`, `telephone_secondaire`, `profession_id`, `date_prise_service`, `date_sortie`, `motif_sortie`, `numero_main_oeuvre`, `structure_id`, `numero_affiliation_ipres`, `commentaire_sortie`) VALUES
(1431, 1, NULL, 1, 185, 2, 'Renée', 'Leclercq', '1980-10-10', 'Begue', 'FR515261751010V38P98571E057', '34 862', '05 455', '1980-12-26', 'Marié(e)', 'Féminin', 1, 'benjamindupont@univ-thies.sn', 'noemi.perrier@orange.fr', NULL, NULL, '+33 7 61 43 83 25', '+33 (0)3 98 84 98 15', 1, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1432, 5, NULL, 1, 16, 2, 'Alix', 'Loiseau', '1978-04-30', 'Morin', 'FR359174910193A8E39SZ68FN07', '71243', '45 080', '2018-10-01', 'Divorcé(e)', 'Masculin', 1, 'matthieudulemaitre@univ-thies.sn', 'patrick.michel@auger.com', NULL, NULL, '+33 (0)5 24 10 32 58', '08 28 31 33 79', 8, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1433, 1, NULL, 1, 102, 4, 'Christelle', 'Guillot', '2005-04-30', 'Lenoir-sur-Mer', 'FR102250110727K7748K616UI21', '66 133', '67 668', '1985-01-01', 'Célibataire', 'Masculin', 1, 'andr', 'kgarcia@hotmail.fr', NULL, NULL, '04 44 90 44 41', '+33 (0)3 56 77 35 95', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1434, 5, NULL, 1, 181, 3, 'Colette', 'Cousin', '1993-06-25', 'Lemairenec', 'FR522753656028OPFDVAR601E82', '46 074', '57727', '1975-03-30', 'Marié(e)', 'Féminin', 0, 'danielledeladasilva@univ-thies.sn', 'hortense40@gros.com', NULL, NULL, '02 68 65 42 60', '+33 (0)1 99 31 69 58', 4, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1435, 1, NULL, 1, 173, 3, 'Nicole', 'Rodriguez', '1976-12-09', 'Rodrigues', 'FR4353482646342FBZ7O7602907', '09 191', '71 039', '2006-09-19', 'Célibataire', 'Masculin', 0, 'victoireleclerc-lecoq@univ-thies.sn', 'lejeune.christelle@coste.com', NULL, NULL, '+33 (0)9 23 07 69 59', '+33 (0)2 84 11 62 06', 6, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1436, 5, NULL, 1, 77, 3, 'Sylvie', 'Peltier', '2003-01-27', 'Petit', 'FR808670075173NL75B538RLE44', '65 614', '28885', '2000-07-30', 'Marié(e)', 'Masculin', 1, 'christine-', 'charpentier.michele@hotmail.fr', NULL, NULL, '+33 1 53 15 96 75', '+33 1 88 02 62 93', 3, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1437, 1, NULL, 1, 179, 1, 'Suzanne', 'Bonneau', '1980-01-17', 'Poulainnec', 'FR7812618703198L905FL870843', '07709', '00226', '1970-07-06', 'Veuf(ve)', 'Masculin', 1, 'eug', 'boutin.alix@dbmail.com', NULL, NULL, '+33 (0)7 30 70 15 05', '02 46 24 07 43', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1438, 5, NULL, 1, 16, 3, 'Jacqueline', 'Tanguy', '2004-03-18', 'Pereira', 'FR764139643920XJKX6J93L9040', '89 377', '54245', '1983-01-23', 'Célibataire', 'Féminin', 0, 'genevi', 'charles.voisin@michel.fr', NULL, NULL, '02 72 42 49 01', '0142815975', 5, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1439, 5, NULL, 1, 27, 3, 'Dominique', 'Dufour', '1974-08-10', 'Marchand', 'FR326884602897JCW3OCG538M86', '03023', '67 999', '1977-01-30', 'Veuf(ve)', 'Féminin', 0, 'laurenceleclercq@univ-thies.sn', 'hnicolas@live.com', NULL, NULL, '04 82 42 34 32', '01 39 95 79 01', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1440, 5, NULL, 1, 58, 2, 'Hélène', 'Baron', '1990-08-02', 'David', 'FR891889408750932Y0X97K0539', '43711', '62877', '1987-07-21', 'Divorcé(e)', 'Féminin', 1, 'eug', 'dominique.joubert@neveu.com', NULL, NULL, '+33 (0)8 93 68 68 78', '+33 (0)1 68 50 23 62', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1441, 4, NULL, 1, 90, 2, 'Édith', 'Thomas', '2009-02-13', 'WeissVille', 'FR61125812702309Y5J00GDZ361', '89 345', '35915', '2009-04-02', 'Divorcé(e)', 'Masculin', 1, 'ad', 'peron.jeanne@guillaume.org', NULL, NULL, '+33 1 42 33 07 29', '+33 4 08 52 52 58', 8, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1442, 5, NULL, 1, 11, 2, 'Margot', 'Fontaine', '1990-09-05', 'Da SilvaBourg', 'FR255501220546Q026R1JYLQT72', '23 433', '49205', '2010-05-01', 'Veuf(ve)', 'Féminin', 1, 'georgesallain@univ-thies.sn', 'smeyer@tiscali.fr', NULL, NULL, '+33 4 91 75 07 64', '+33 4 98 73 45 07', 4, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1443, 4, NULL, 1, 33, 4, 'Claire', 'Ledoux', '2017-05-28', 'Lefebvre', 'FR314772966295LQTI181Y24W24', '37 309', '02 522', '2019-02-17', 'Marié(e)', 'Féminin', 1, 'mariannemoreno@univ-thies.sn', 'ybailly@dacosta.org', NULL, NULL, '+33 (0)4 37 52 76 54', '0892812445', 1, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1444, 1, NULL, 1, 182, 3, 'Élodie', 'Bourdon', '1983-10-18', 'Lamydan', 'FR35143067385256K1AORM3HT43', '56863', '52198', '2019-09-26', 'Divorcé(e)', 'Masculin', 1, 'matthieuevrard@univ-thies.sn', 'leduc.benoit@vaillant.fr', NULL, NULL, '02 71 12 71 19', '01 49 68 07 28', 9, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1445, 1, NULL, 1, 208, 4, 'Stéphane', 'Antoine', '1977-04-13', 'Ramosboeuf', 'FR697532722648AYOUN7AF81F91', '21127', '66220', '1971-08-26', 'Veuf(ve)', 'Masculin', 1, 'paulettechevalier@univ-thies.sn', 'alain63@sanchez.net', NULL, NULL, '09 15 30 73 08', '0345966164', 9, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1446, 4, NULL, 1, 137, 1, 'Théodore', 'Joubert', '1984-10-06', 'Richard-les-Bains', 'FR3221601005974K9X12YB69684', '82479', '27 469', '1993-07-19', 'Divorcé(e)', 'Masculin', 1, 'juliettemartineau@univ-thies.sn', 'gerard.sanchez@wanadoo.fr', NULL, NULL, '0136244382', '0113606929', 1, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1447, 1, NULL, 1, 242, 2, 'René', 'Remy', '2016-09-18', 'Toussaint-sur-Mer', 'FR719570536360KBFT2231US931', '68 973', '30766', '2020-01-25', 'Marié(e)', 'Masculin', 1, 'laetitiadupre@univ-thies.sn', 'nbertin@tiscali.fr', NULL, NULL, '+33 4 86 33 84 66', '+33 2 42 96 44 69', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1448, 4, NULL, 1, 82, 2, 'Cécile', 'Hubert', '1992-10-20', 'Collin-sur-Rousset', 'FR9512118777370368939913E09', '62 104', '52524', '1978-06-25', 'Marié(e)', 'Féminin', 0, 'agatheguyot@univ-thies.sn', 'gerard.leconte@noos.fr', NULL, NULL, '+33 (0)4 33 34 17 89', '05 98 54 54 67', 1, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1449, 1, NULL, 1, 77, 4, 'Michelle', 'Bouchet', '1985-01-11', 'AlexandreVille', 'FR249996576507JQXC5758XHZ60', '91 994', '66428', '1991-03-23', 'Marié(e)', 'Masculin', 0, 'nicolasmoreno@univ-thies.sn', 'guillon.jules@dossantos.fr', NULL, NULL, '+33 5 70 51 84 09', '01 07 23 77 70', 6, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1450, 1, NULL, 1, 53, 1, 'Martin', 'Bernard', '1988-12-25', 'Aubert', 'FR642638995705Z708YKUMAO373', '67643', '49 113', '1990-05-31', 'Veuf(ve)', 'Féminin', 1, 'josephdubois-maillet@univ-thies.sn', 'camille.lamy@humbert.net', NULL, NULL, '0675684903', '09 93 28 09 90', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1451, 1, NULL, 1, 104, 1, 'Brigitte', 'Techer', '2016-11-24', 'Duval-sur-Mer', 'FR148912735782EDT47AKX6J765', '42043', '79009', '1975-01-30', 'Célibataire', 'Masculin', 0, 'josephlanglois@univ-thies.sn', 'vferrand@meunier.com', NULL, NULL, '01 54 97 19 61', '+33 (0)8 14 53 52 10', 7, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(1452, 1, NULL, 1, 183, 3, 'Clémence', 'Lacombe', '1995-06-27', 'Roy', 'FR241308048861V2B75V6P41640', '99 598', '61 110', '2010-08-19', 'Marié(e)', 'Féminin', 0, 'williamsanchez@univ-thies.sn', 'elisabeth.robin@orange.fr', NULL, NULL, '+33 (0)1 65 20 52 15', '08 23 98 86 49', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1453, 1, NULL, 1, 71, 3, 'Claire', 'Diallo', '1999-10-12', 'Etienne', 'FR3339453187117JXUBGGH82C52', '71187', '38 054', '1981-01-15', 'Célibataire', 'Masculin', 0, 'doroth', 'peron.francois@vaillant.com', NULL, NULL, '+33 1 84 84 78 80', '+33 7 52 74 43 78', 8, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1454, 5, NULL, 1, 192, 3, 'Lucy', 'Pons', '1990-03-28', 'Lagarde-sur-Mer', 'FR894623731289TIRD6OD099L30', '75 151', '32880', '1984-02-16', 'Divorcé(e)', 'Féminin', 0, 'adrienferrand@univ-thies.sn', 'hugues15@camus.net', NULL, NULL, '+33 4 70 72 98 39', '09 31 17 92 88', 8, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1455, 4, NULL, 1, 210, 1, 'Marcel', 'Le Roux', '1975-02-22', 'MenardVille', 'FR100928116459BIT14TG356478', '52363', '86 493', '1976-05-02', 'Divorcé(e)', 'Féminin', 1, 'josephdupaul@univ-thies.sn', 'nathalie42@petit.com', NULL, NULL, '09 99 60 20 05', '+33 (0)4 11 45 35 95', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1456, 5, NULL, 1, 42, 1, 'Olivier', 'Allard', '1974-04-27', 'Besson', 'FR480347525460C6G6H84Y32W61', '14759', '83 634', '1978-04-07', 'Veuf(ve)', 'Féminin', 0, 'th', 'jjourdan@orange.fr', NULL, NULL, '+33 (0)1 15 11 77 14', '0810032476', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1457, 1, NULL, 1, 93, 4, 'Joseph', 'Peron', '2002-07-21', 'Faivrenec', 'FR6439607714198GR51SUZECZ38', '54618', '70 025', '2001-08-03', 'Divorcé(e)', 'Féminin', 1, 'daniellefournier@univ-thies.sn', 'lagarde.emmanuelle@merle.com', NULL, NULL, '+33 2 42 62 90 74', '+33 8 99 62 18 66', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1458, 5, NULL, 1, 135, 2, 'Laurence', 'Morel', '2008-06-15', 'Boyer', 'FR29357463901967WYIM97G1080', '66058', '77609', '1982-02-20', 'Divorcé(e)', 'Féminin', 0, 'christellelemaitre@univ-thies.sn', 'gilbert.pineau@wanadoo.fr', NULL, NULL, '01 65 59 52 69', '+33 (0)5 97 78 60 09', 2, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1459, 4, NULL, 1, 25, 2, 'Xavier', 'Boulay', '1990-04-10', 'Gillet', 'FR59690343855806OKVJ4OS2261', '80007', '25 263', '1984-10-08', 'Célibataire', 'Féminin', 1, 'huguesloiseau@univ-thies.sn', 'claudine.verdier@tiscali.fr', NULL, NULL, '01 76 38 83 51', '+33 (0)6 56 46 06 65', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1460, 5, NULL, 1, 58, 4, 'Maggie', 'Ferrand', '1984-02-21', 'Diallo', 'FR396372983296B8QQEE9WG6629', '63 045', '06 538', '2019-01-15', 'Divorcé(e)', 'Masculin', 1, 'patricialeleroux@univ-thies.sn', 'nathalie92@live.com', NULL, NULL, '0784102504', '+33 2 77 61 79 01', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1461, 5, NULL, 1, 207, 4, 'Benjamin', 'Breton', '1996-04-12', 'Morin', 'FR7005959537324D2506MX0ET81', '04368', '67 760', '2001-02-09', 'Célibataire', 'Féminin', 1, 'r', 'marques.claudine@lemonnier.com', NULL, NULL, '08 12 37 42 24', '+33 1 28 39 24 25', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1462, 1, NULL, 1, 23, 4, 'Virginie', 'Blanchard', '1983-06-25', 'Dupuis', 'FR886176888248TW9M383Z00106', '17370', '64 262', '1981-01-09', 'Marié(e)', 'Masculin', 0, 'lorrainealbert@univ-thies.sn', 'moreau.gabriel@lebreton.com', NULL, NULL, '0413700544', '0762532978', 7, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1463, 4, NULL, 1, 47, 1, 'Marc', 'Raynaud', '1974-02-04', 'Alexandre-les-Bains', 'FR0827707348000DYQ01W5G1261', '74536', '06615', '1999-01-19', 'Veuf(ve)', 'Féminin', 0, 'christophedacosta@univ-thies.sn', 'susan.martins@chauveau.net', NULL, NULL, '+33 2 10 21 39 05', '0118152479', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1464, 5, NULL, 1, 172, 4, 'Manon', 'Jacob', '2011-07-28', 'Royer', 'FR835943013927GZ72E903VZF10', '99451', '80468', '2011-05-13', 'Veuf(ve)', 'Féminin', 1, 'simonesalmon@univ-thies.sn', 'mhoareau@voila.fr', NULL, NULL, '0499798872', '+33 7 80 33 75 01', 9, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1465, 4, NULL, 1, 16, 4, 'Franck', 'Grondin', '1980-05-27', 'ReynaudBourg', 'FR172386112784RRL0118M15364', '34521', '00170', '2002-08-10', 'Marié(e)', 'Masculin', 0, 'louispoirier@univ-thies.sn', 'agregoire@tele2.fr', NULL, NULL, '0385745085', '0755727423', 2, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(1466, 4, NULL, 1, 212, 1, 'Philippe', 'Bruneau', '1987-04-24', 'Thibault', 'FR801058660396NGAG0992V6420', '93 654', '20 211', '1981-07-09', 'Célibataire', 'Féminin', 1, 'daniellefouquet@univ-thies.sn', 'bertin.francoise@yahoo.fr', NULL, NULL, '0401318718', '0373730585', 6, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1467, 5, NULL, 1, 16, 4, 'Matthieu', 'Rocher', '1999-08-18', 'Marie', 'FR1383368311217NFOWW3977X10', '07105', '58 765', '2010-05-14', 'Marié(e)', 'Masculin', 1, '', 'lambert.sophie@noos.fr', NULL, NULL, '+33 4 47 71 15 54', '+33 (0)2 45 48 87 64', 9, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1468, 4, NULL, 1, 137, 2, 'Léon', 'Charrier', '2006-08-08', 'Colin', 'FR1099917128028803P9GT0A444', '19254', '24230', '1980-11-30', 'Célibataire', 'Féminin', 0, 'martinsimon@univ-thies.sn', 'marc07@bouvet.fr', NULL, NULL, '0186737162', '+33 (0)6 97 22 17 43', 7, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1469, 4, NULL, 1, 26, 3, 'Pierre', 'Guillou', '2019-05-21', 'Bertin', 'FR233489519607FF691XQP6R544', '81 091', '93 549', '1974-10-07', 'Marié(e)', 'Féminin', 0, 'carolinedelannoy-guillet@univ-thies.sn', 'martin68@ollivier.fr', NULL, NULL, '+33 (0)3 05 28 21 65', '04 29 24 33 40', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1470, 5, NULL, 1, 190, 3, 'Alexandrie', 'Dijoux', '1979-12-02', 'Muller', 'FR838592383662113JBT3VY7299', '62129', '83 633', '2014-09-15', 'Divorcé(e)', 'Masculin', 1, 'xavier-honor', 'agnes83@ifrance.com', NULL, NULL, '0493814986', '+33 (0)6 35 75 51 41', 2, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1471, 1, NULL, 1, 121, 3, 'Joséphine', 'Robin', '1990-01-15', 'Delormeboeuf', 'FR3433610836301D71TU2MRHQ10', '75 994', '04490', '1983-09-21', 'Divorcé(e)', 'Féminin', 1, 'michellebesnard-bourgeois@univ-thies.sn', 'vjourdan@dbmail.com', NULL, NULL, '+33 (0)4 31 41 43 86', '+33 1 92 38 10 53', 6, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1472, 5, NULL, 1, 180, 4, 'Honoré', 'Petit', '1999-09-25', 'Olivier-sur-Jourdan', 'FR236339560539KQZS7OONQL822', '96 100', '22205', '1992-08-27', 'Veuf(ve)', 'Masculin', 1, 'l', 'raymond13@hotmail.fr', NULL, NULL, '04 51 49 34 40', '+33 3 67 29 14 76', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1473, 1, NULL, 1, 37, 2, 'Vincent', 'Costa', '2010-04-06', 'Picard-sur-Michaud', 'FR23982398934993V9L1S0UH940', '79454', '54 260', '1973-12-12', 'Veuf(ve)', 'Féminin', 0, 'jacquesdupont@univ-thies.sn', 'jlebreton@collin.fr', NULL, NULL, '+33 (0)2 72 57 06 45', '+33 (0)2 85 50 49 49', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1474, 5, NULL, 1, 140, 4, 'Gilles', 'Roux', '1979-11-03', 'Picard', 'FR807098424495UTMRO9HIQ5862', '49 679', '36863', '2016-01-25', 'Divorcé(e)', 'Féminin', 0, 'juliencolin@univ-thies.sn', 'lucas.blondel@marchal.com', NULL, NULL, '0733198513', '+33 (0)1 68 08 02 18', 7, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1475, 4, NULL, 1, 242, 4, 'Pierre', 'Mercier', '1993-07-20', 'Renault', 'FR7879797731112JD6FP7C3C041', '24 146', '80 933', '2021-01-21', 'Veuf(ve)', 'Féminin', 1, 'michelrolland@univ-thies.sn', 'marchal.aime@yahoo.fr', NULL, NULL, '0808096905', '0527588594', 9, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1476, 5, NULL, 1, 238, 2, 'Marc', 'Tessier', '2017-06-02', 'Gonzalez', 'FR235631760795VAZ95LWKBFB57', '42 750', '86 950', '1974-11-24', 'Marié(e)', 'Masculin', 0, 'margauxguichard@univ-thies.sn', 'wcarpentier@tanguy.fr', NULL, NULL, '0787077758', '06 35 39 13 42', 3, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1477, 1, NULL, 1, 20, 3, 'Célina', 'Becker', '2001-09-20', 'Jacques-les-Bains', 'FR456027503029PBH8Z1I7FCT64', '59547', '03 570', '2000-12-29', 'Divorcé(e)', 'Masculin', 0, 'augustinschmitt@univ-thies.sn', 'constance72@tele2.fr', NULL, NULL, '+33 (0)8 95 65 23 42', '08 93 77 11 38', 3, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1478, 5, NULL, 1, 63, 4, 'Gabriel', 'Jacquet', '2015-04-22', 'Boulay-sur-Mer', 'FR568387461726QN38WAI8I1P08', '86 199', '29042', '1994-05-17', 'Veuf(ve)', 'Masculin', 0, 'alixlaunay@univ-thies.sn', 'oblot@bertin.com', NULL, NULL, '07 68 11 30 21', '+33 6 70 82 42 37', 4, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1479, 5, NULL, 1, 103, 3, 'Philippe', 'Fleury', '1983-02-06', 'Fernandez', 'FR145245595885KDTH84PZ5LT33', '84 225', '92 651', '2010-09-12', 'Marié(e)', 'Masculin', 0, 'yvesfouquet-laroche@univ-thies.sn', 'hortense57@tiscali.fr', NULL, NULL, '0926774572', '0224212717', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1480, 4, NULL, 1, 140, 1, 'Agnès', 'Martinez', '2008-01-03', 'Mauricenec', 'FR218293709896N261V9UZDE477', '88789', '60925', '1978-10-11', 'Célibataire', 'Masculin', 0, 'guillaume-christophebarbier@univ-thies.sn', 'matthieu.laporte@orange.fr', NULL, NULL, '01 49 29 64 82', '0992226592', 1, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1481, 4, NULL, 1, 66, 4, 'Constance', 'Legrand', '1982-01-08', 'Brunelnec', 'FR1715563340858JYNOM9128400', '56200', '04 869', '1992-03-21', 'Divorcé(e)', 'Féminin', 0, 'xavierlefevre@univ-thies.sn', 'camus.etienne@lombard.com', NULL, NULL, '+33 1 77 61 84 58', '05 85 39 72 35', 4, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1482, 4, NULL, 1, 205, 1, 'Michelle', 'Pages', '1980-12-15', 'BoyerVille', 'FR9774156361170AU17V3CS3846', '03 026', '64 915', '2007-06-24', 'Célibataire', 'Masculin', 1, 'j', 'lbesnard@laposte.net', NULL, NULL, '+33 (0)6 52 63 17 91', '+33 (0)1 89 74 45 93', 8, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1483, 4, NULL, 1, 25, 2, 'Martin', 'Menard', '1998-10-03', 'Legros', 'FR087089237703U3E1TFDOI6179', '85 641', '92 198', '1990-01-18', 'Divorcé(e)', 'Masculin', 1, 'dominiqueleroy@univ-thies.sn', 'slacombe@noel.com', NULL, NULL, '+33 6 26 85 73 25', '0822887330', 3, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1484, 1, NULL, 1, 102, 2, 'Antoinette', 'Guibert', '1984-08-03', 'Guillaume', 'FR6562480789710423ERG303640', '76963', '41 122', '2020-04-07', 'Marié(e)', 'Masculin', 0, 'adrien-rogerroger@univ-thies.sn', 'maurice.daniel@besnard.fr', NULL, NULL, '+33 8 98 21 92 22', '+33 (0)1 98 83 78 77', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1485, 4, NULL, 1, 235, 3, 'Patricia', 'Leroy', '2008-04-21', 'Baron', 'FR815462317184DRLI3PDV2L481', '38 691', '70205', '2016-01-07', 'Divorcé(e)', 'Féminin', 1, 'christineallard@univ-thies.sn', 'ivallet@orange.fr', NULL, NULL, '+33 (0)8 18 79 69 29', '+33 9 76 85 33 72', 4, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1486, 1, NULL, 1, 204, 1, 'Patricia', 'De Oliveira', '2008-02-01', 'BarbierVille', 'FR75708674953798LAQ03DFLE88', '80 085', '53 825', '2009-03-04', 'Marié(e)', 'Masculin', 0, 'dominiquebouvier-girard@univ-thies.sn', 'adelaide57@carlier.org', NULL, NULL, '+33 5 60 74 32 18', '0529013242', 8, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(1487, 4, NULL, 1, 228, 3, 'Éléonore', 'Langlois', '1972-08-11', 'Lebon-sur-Berthelot', 'FR814889197833KGZ429P638D89', '10482', '14454', '1984-07-18', 'Célibataire', 'Masculin', 1, 'sabinegallet-pereira@univ-thies.sn', 'legrand.suzanne@free.fr', NULL, NULL, '0214027964', '09 74 71 80 07', 5, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1488, 1, NULL, 1, 117, 1, 'Lucas', 'Hernandez', '1982-11-10', 'HoareauVille', 'FR6314432075293BJBOU2R0MV67', '81 234', '63 540', '2012-10-25', 'Veuf(ve)', 'Masculin', 1, 's', 'mribeiro@tessier.com', NULL, NULL, '+33 6 81 23 24 05', '+33 7 30 27 83 42', 2, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1489, 4, NULL, 1, 212, 3, 'Benoît', 'Faivre', '1980-08-25', 'Faure', 'FR572116982953V5NVO0SB2CS69', '90610', '77 753', '2010-01-25', 'Divorcé(e)', 'Féminin', 1, '', 'yroyer@aubry.fr', NULL, NULL, '+33 (0)4 57 74 89 62', '+33 (0)9 27 88 57 97', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1490, 1, NULL, 1, 1, 3, 'Honoré', 'Michel', '2006-12-05', 'Bourgeois', 'FR9600367008667C254T34N0P39', '14272', '95 894', '1978-01-14', 'Célibataire', 'Féminin', 1, 'rogerlegendre@univ-thies.sn', 'qmonnier@gaillard.fr', NULL, NULL, '+33 7 69 18 38 71', '06 46 56 93 45', 1, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1491, 1, NULL, 1, 141, 3, 'Patricia', 'Garnier', '1982-07-01', 'Remydan', 'FR3011345197414UTJ57TC14T81', '34500', '14 062', '2020-02-19', 'Divorcé(e)', 'Féminin', 1, 'alexandriaperret@univ-thies.sn', 'amelie.dasilva@peltier.com', NULL, NULL, '+33 4 47 40 20 27', '+33 1 79 70 22 62', 1, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1492, 1, NULL, 1, 58, 3, 'Émilie', 'Remy', '1995-05-09', 'Allain', 'FR5631380150591K8800J9YZE78', '87 570', '28 189', '1983-11-12', 'Célibataire', 'Masculin', 1, 'alexandreduhuet@univ-thies.sn', 'william.masson@bouygtel.fr', NULL, NULL, '+33 7 87 94 07 21', '+33 1 30 07 65 42', 3, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1493, 1, NULL, 1, 25, 1, 'Gabrielle', 'Nicolas', '2009-08-15', 'Guilletnec', 'FR094875829370RV660LAG3H486', '23 572', '44 236', '2000-04-21', 'Célibataire', 'Masculin', 0, 'dianemorvan@univ-thies.sn', 'francoise.maury@cordier.net', NULL, NULL, '09 74 90 38 76', '01 13 78 52 00', 4, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(1494, 4, NULL, 1, 209, 2, 'Henriette', 'Boucher', '1990-02-10', 'Lemaitre-sur-Vincent', 'FR652869442287A6U1KC3SN5M14', '77 464', '62 874', '1999-03-27', 'Divorcé(e)', 'Féminin', 1, 'laurent-gillespoirier@univ-thies.sn', 'hugues.roux@live.com', NULL, NULL, '+33 (0)4 83 42 49 14', '+33 3 30 41 96 12', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1495, 1, NULL, 1, 154, 2, 'Guillaume', 'Thibault', '2019-01-25', 'Lelievre', 'FR56470080289162M864F1R1233', '90204', '99 174', '1983-03-01', 'Veuf(ve)', 'Masculin', 0, 'dominiquemaury@univ-thies.sn', 'fgirard@club-internet.fr', NULL, NULL, '+33 (0)1 74 91 96 93', '0358410134', 5, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1496, 5, NULL, 1, 174, 2, 'Margot', 'Pasquier', '1982-05-14', 'Clement-sur-Lopes', 'FR337173966359GL74Z77FCHX75', '26974', '55016', '2021-03-21', 'Veuf(ve)', 'Masculin', 0, 'guydelagillet@univ-thies.sn', 'zlejeune@noos.fr', NULL, NULL, '02 67 23 61 88', '+33 (0)1 72 34 80 37', 7, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1497, 1, NULL, 1, 21, 4, 'Benoît', 'Lejeune', '1974-12-18', 'CouturierVille', 'FR706905161077IQ69YP38WD307', '10 338', '04 441', '1975-07-29', 'Divorcé(e)', 'Masculin', 0, '', 'nicolas33@gonzalez.net', NULL, NULL, '0453707496', '+33 (0)4 05 54 24 02', 2, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1498, 4, NULL, 1, 130, 4, 'Frédéric', 'Dubois', '1982-09-12', 'Perrin-sur-Allard', 'FR280283008605ZG6568S284121', '58 745', '95129', '1989-05-05', 'Célibataire', 'Masculin', 1, 'laurebonnet-turpin@univ-thies.sn', 'agnes66@free.fr', NULL, NULL, '+33 (0)6 06 52 26 70', '02 93 66 27 24', 3, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1499, 5, NULL, 1, 20, 1, 'Valentine', 'Breton', '2018-09-26', 'Lemoine', 'FR022572877369033I9JV97K232', '31 150', '38105', '1990-06-15', 'Veuf(ve)', 'Masculin', 0, 'anastasierenard@univ-thies.sn', 'charrier.philippe@club-internet.fr', NULL, NULL, '+33 (0)1 72 11 01 46', '0168685958', 7, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1500, 4, NULL, 1, 71, 4, 'Brigitte', 'Guillet', '2019-08-14', 'Lopez', 'FR38601484011841JM401UEPE32', '94299', '90893', '1975-12-17', 'Veuf(ve)', 'Féminin', 1, 'anoukmartin-tessier@univ-thies.sn', 'eric39@orange.fr', NULL, NULL, '02 46 84 69 00', '+33 (0)3 56 98 51 75', 7, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(1501, 5, NULL, 1, 82, 2, 'Sébastien', 'Lopes', '2013-06-09', 'Benard-sur-Meyer', 'FR8029204789155H1FH263N9R86', '08 296', '98733', '1984-08-26', 'Divorcé(e)', 'Féminin', 0, 'c', 'benoit.blanchet@dbmail.com', NULL, NULL, '03 65 24 26 28', '06 45 05 24 05', 9, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1502, 1, NULL, 1, 195, 3, 'Sabine', 'Gomes', '2005-10-20', 'Baudry-sur-Costa', 'FR0439159567519IP3USB8J4062', '64875', '41135', '1983-06-10', 'Divorcé(e)', 'Féminin', 1, 'julierobert-leblanc@univ-thies.sn', 'franck.bailly@noos.fr', NULL, NULL, '+33 1 11 46 28 73', '0133954804', 5, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(1503, 4, NULL, 1, 193, 2, 'Aminata', 'Samb', '2009-04-28', 'Thiès', '1916200200000', '120285/D', NULL, '2021-05-13', 'Marié(e)', 'Féminin', 1, 'aminata.samb@univ-thies.sn', 'aminadmwm@gmail.com', NULL, NULL, '773509313', NULL, 2, '2021-05-13', NULL, NULL, '1200000', 3, '152025', NULL);
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`id`, `nom`, `etat`, `rang`) VALUES
(1, 'Assistante SG', 1, 2),
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
(97, 'Directeur DSI', NULL, 0),
(98, 'DPS', 0, 5);

-- --------------------------------------------------------

--
-- Structure de la table `fonction_employe`
--

DROP TABLE IF EXISTS `fonction_employe`;
CREATE TABLE IF NOT EXISTS `fonction_employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe` int(11) DEFAULT NULL,
  `date_prise_fonction` date NOT NULL,
  `etat` tinyint(1) DEFAULT NULL COMMENT 'true ou false pour savoir si la fonction est toujours d''actualité Donner la possibilité de définir une fonction comme étant la courante',
  `date_fin` date DEFAULT NULL,
  `responsabilite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fonction_employe_employe1_idx` (`employe`),
  KEY `fk_fonction_employe_responsabilite_idx` (`responsabilite`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

--
-- Déchargement des données de la table `fonction_employe`
--

INSERT INTO `fonction_employe` (`id`, `employe`, `date_prise_fonction`, `etat`, `date_fin`, `responsabilite`) VALUES
<<<<<<< HEAD
(8, 1, '2021-05-18', 0, NULL, 1),
(9, 1, '2021-05-28', 0, NULL, 1),
(10, 1, '2021-05-28', 0, NULL, 1),
(11, 1, '2021-05-18', 0, NULL, 1),
(13, 1, '2021-05-30', 0, NULL, 1),
(14, 1, '2021-05-24', 0, '2021-05-16', 1),
(15, 1, '2021-05-17', 0, NULL, 1),
(16, 1, '2021-05-17', 0, NULL, 1);
=======
(3, 1, '2018-05-01', 0, '2019-05-01', 1),
(4, 1, '2019-05-01', 0, '2021-05-25', 4),
(5, 1, '2021-05-25', 1, NULL, 7),
(6, 2, '2021-05-25', 1, NULL, 9),
(7, 1, '2021-05-25', 0, NULL, 9),
(8, 4, '2021-05-26', 1, NULL, 1);
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

-- --------------------------------------------------------

--
-- Structure de la table `fos_group`
--

DROP TABLE IF EXISTS `fos_group`;
CREATE TABLE IF NOT EXISTS `fos_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `code` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4B019DDB5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fos_group`
--

INSERT INTO `fos_group` (`id`, `name`, `roles`, `code`) VALUES
<<<<<<< HEAD
(1, 'Super Administrateur', 'a:174:{i:0;s:17:\"ROLE_GROUP_CREATE\";i:1;s:16:\"ROLE_GROUP_INDEX\";i:2;s:15:\"ROLE_GROUP_SHOW\";i:3;s:16:\"ROLE_GROUP_CLONE\";i:4;s:17:\"ROLE_GROUP_DELETE\";i:5;s:15:\"ROLE_GROUP_EDIT\";i:6;s:16:\"ROLE_USER_CREATE\";i:7;s:15:\"ROLE_USER_INDEX\";i:8;s:14:\"ROLE_USER_SHOW\";i:9;s:15:\"ROLE_USER_CLONE\";i:10;s:16:\"ROLE_USER_DELETE\";i:11;s:14:\"ROLE_USER_EDIT\";i:12;s:22:\"ROLE_TYPEENTITE_CREATE\";i:13;s:21:\"ROLE_TYPEENTITE_INDEX\";i:14;s:20:\"ROLE_TYPEENTITE_SHOW\";i:15;s:21:\"ROLE_TYPEENTITE_CLONE\";i:16;s:22:\"ROLE_TYPEENTITE_DELETE\";i:17;s:20:\"ROLE_TYPEENTITE_EDIT\";i:18;s:24:\"ROLE_TYPEDOCUMENT_CREATE\";i:19;s:23:\"ROLE_TYPEDOCUMENT_INDEX\";i:20;s:22:\"ROLE_TYPEDOCUMENT_SHOW\";i:21;s:23:\"ROLE_TYPEDOCUMENT_CLONE\";i:22;s:24:\"ROLE_TYPEDOCUMENT_DELETE\";i:23;s:22:\"ROLE_TYPEDOCUMENT_EDIT\";i:24;s:23:\"ROLE_TYPECONTRAT_CREATE\";i:25;s:22:\"ROLE_TYPECONTRAT_INDEX\";i:26;s:21:\"ROLE_TYPECONTRAT_SHOW\";i:27;s:22:\"ROLE_TYPECONTRAT_CLONE\";i:28;s:23:\"ROLE_TYPECONTRAT_DELETE\";i:29;s:21:\"ROLE_TYPECONTRAT_EDIT\";i:30;s:20:\"ROLE_FONCTION_CREATE\";i:31;s:19:\"ROLE_FONCTION_INDEX\";i:32;s:18:\"ROLE_FONCTION_SHOW\";i:33;s:19:\"ROLE_FONCTION_CLONE\";i:34;s:20:\"ROLE_FONCTION_DELETE\";i:35;s:18:\"ROLE_FONCTION_EDIT\";i:36;s:16:\"ROLE_PAYS_CREATE\";i:37;s:15:\"ROLE_PAYS_INDEX\";i:38;s:14:\"ROLE_PAYS_SHOW\";i:39;s:15:\"ROLE_PAYS_CLONE\";i:40;s:16:\"ROLE_PAYS_DELETE\";i:41;s:14:\"ROLE_PAYS_EDIT\";i:42;s:25:\"ROLE_CAISSESOCIALE_CREATE\";i:43;s:24:\"ROLE_CAISSESOCIALE_INDEX\";i:44;s:23:\"ROLE_CAISSESOCIALE_SHOW\";i:45;s:24:\"ROLE_CAISSESOCIALE_CLONE\";i:46;s:25:\"ROLE_CAISSESOCIALE_DELETE\";i:47;s:23:\"ROLE_CAISSESOCIALE_EDIT\";i:48;s:25:\"ROLE_MUTUELLESANTE_CREATE\";i:49;s:24:\"ROLE_MUTUELLESANTE_INDEX\";i:50;s:23:\"ROLE_MUTUELLESANTE_SHOW\";i:51;s:24:\"ROLE_MUTUELLESANTE_CLONE\";i:52;s:25:\"ROLE_MUTUELLESANTE_DELETE\";i:53;s:23:\"ROLE_MUTUELLESANTE_EDIT\";i:54;s:23:\"ROLE_TYPEEMPLOYE_CREATE\";i:55;s:22:\"ROLE_TYPEEMPLOYE_INDEX\";i:56;s:21:\"ROLE_TYPEEMPLOYE_SHOW\";i:57;s:22:\"ROLE_TYPEEMPLOYE_CLONE\";i:58;s:23:\"ROLE_TYPEEMPLOYE_DELETE\";i:59;s:21:\"ROLE_TYPEEMPLOYE_EDIT\";i:60;s:21:\"ROLE_STRUCTURE_CREATE\";i:61;s:20:\"ROLE_STRUCTURE_INDEX\";i:62;s:19:\"ROLE_STRUCTURE_SHOW\";i:63;s:20:\"ROLE_STRUCTURE_CLONE\";i:64;s:21:\"ROLE_STRUCTURE_DELETE\";i:65;s:19:\"ROLE_STRUCTURE_EDIT\";i:66;s:20:\"ROLE_SYNDICAT_CREATE\";i:67;s:19:\"ROLE_SYNDICAT_INDEX\";i:68;s:18:\"ROLE_SYNDICAT_SHOW\";i:69;s:19:\"ROLE_SYNDICAT_CLONE\";i:70;s:20:\"ROLE_SYNDICAT_DELETE\";i:71;s:18:\"ROLE_SYNDICAT_EDIT\";i:72;s:22:\"ROLE_PROFESSION_CREATE\";i:73;s:21:\"ROLE_PROFESSION_INDEX\";i:74;s:20:\"ROLE_PROFESSION_SHOW\";i:75;s:21:\"ROLE_PROFESSION_CLONE\";i:76;s:22:\"ROLE_PROFESSION_DELETE\";i:77;s:20:\"ROLE_PROFESSION_EDIT\";i:78;s:19:\"ROLE_DIPLOME_CREATE\";i:79;s:18:\"ROLE_DIPLOME_INDEX\";i:80;s:17:\"ROLE_DIPLOME_SHOW\";i:81;s:18:\"ROLE_DIPLOME_CLONE\";i:82;s:19:\"ROLE_DIPLOME_DELETE\";i:83;s:17:\"ROLE_DIPLOME_EDIT\";i:84;s:29:\"ROLE_STRUCTUREFONCTION_CREATE\";i:85;s:28:\"ROLE_STRUCTUREFONCTION_INDEX\";i:86;s:27:\"ROLE_STRUCTUREFONCTION_SHOW\";i:87;s:28:\"ROLE_STRUCTUREFONCTION_CLONE\";i:88;s:29:\"ROLE_STRUCTUREFONCTION_DELETE\";i:89;s:27:\"ROLE_STRUCTUREFONCTION_EDIT\";i:90;s:19:\"ROLE_GCLASSE_CREATE\";i:91;s:18:\"ROLE_GCLASSE_INDEX\";i:92;s:17:\"ROLE_GCLASSE_SHOW\";i:93;s:18:\"ROLE_GCLASSE_CLONE\";i:94;s:19:\"ROLE_GCLASSE_DELETE\";i:95;s:17:\"ROLE_GCLASSE_EDIT\";i:96;s:22:\"ROLE_GCATEGORIE_CREATE\";i:97;s:21:\"ROLE_GCATEGORIE_INDEX\";i:98;s:20:\"ROLE_GCATEGORIE_SHOW\";i:99;s:21:\"ROLE_GCATEGORIE_CLONE\";i:100;s:22:\"ROLE_GCATEGORIE_DELETE\";i:101;s:20:\"ROLE_GCATEGORIE_EDIT\";i:102;s:19:\"ROLE_GNIVEAU_CREATE\";i:103;s:18:\"ROLE_GNIVEAU_INDEX\";i:104;s:17:\"ROLE_GNIVEAU_SHOW\";i:105;s:18:\"ROLE_GNIVEAU_CLONE\";i:106;s:19:\"ROLE_GNIVEAU_DELETE\";i:107;s:17:\"ROLE_GNIVEAU_EDIT\";i:108;s:20:\"ROLE_GECHELON_CREATE\";i:109;s:19:\"ROLE_GECHELON_INDEX\";i:110;s:18:\"ROLE_GECHELON_SHOW\";i:111;s:19:\"ROLE_GECHELON_CLONE\";i:112;s:20:\"ROLE_GECHELON_DELETE\";i:113;s:18:\"ROLE_GECHELON_EDIT\";i:114;s:17:\"ROLE_GRADE_CREATE\";i:115;s:16:\"ROLE_GRADE_INDEX\";i:116;s:15:\"ROLE_GRADE_SHOW\";i:117;s:16:\"ROLE_GRADE_CLONE\";i:118;s:17:\"ROLE_GRADE_DELETE\";i:119;s:15:\"ROLE_GRADE_EDIT\";i:120;s:19:\"ROLE_EMPLOYE_CREATE\";i:121;s:18:\"ROLE_EMPLOYE_INDEX\";i:122;s:17:\"ROLE_EMPLOYE_SHOW\";i:123;s:18:\"ROLE_EMPLOYE_CLONE\";i:124;s:19:\"ROLE_EMPLOYE_DELETE\";i:125;s:17:\"ROLE_EMPLOYE_EDIT\";i:126;s:19:\"ROLE_ADRESSE_CREATE\";i:127;s:18:\"ROLE_ADRESSE_INDEX\";i:128;s:17:\"ROLE_ADRESSE_SHOW\";i:129;s:18:\"ROLE_ADRESSE_CLONE\";i:130;s:19:\"ROLE_ADRESSE_DELETE\";i:131;s:17:\"ROLE_ADRESSE_EDIT\";i:132;s:25:\"ROLE_MEMBREFAMILLE_CREATE\";i:133;s:24:\"ROLE_MEMBREFAMILLE_INDEX\";i:134;s:23:\"ROLE_MEMBREFAMILLE_SHOW\";i:135;s:24:\"ROLE_MEMBREFAMILLE_CLONE\";i:136;s:25:\"ROLE_MEMBREFAMILLE_DELETE\";i:137;s:23:\"ROLE_MEMBREFAMILLE_EDIT\";i:138;s:26:\"ROLE_MEMBRESYNDICAT_CREATE\";i:139;s:25:\"ROLE_MEMBRESYNDICAT_INDEX\";i:140;s:24:\"ROLE_MEMBRESYNDICAT_SHOW\";i:141;s:25:\"ROLE_MEMBRESYNDICAT_CLONE\";i:142;s:26:\"ROLE_MEMBRESYNDICAT_DELETE\";i:143;s:24:\"ROLE_MEMBRESYNDICAT_EDIT\";i:144;s:20:\"ROLE_DOCUMENT_CREATE\";i:145;s:19:\"ROLE_DOCUMENT_INDEX\";i:146;s:18:\"ROLE_DOCUMENT_SHOW\";i:147;s:19:\"ROLE_DOCUMENT_CLONE\";i:148;s:20:\"ROLE_DOCUMENT_DELETE\";i:149;s:18:\"ROLE_DOCUMENT_EDIT\";i:150;s:27:\"ROLE_FONCTIONEMPLOYE_CREATE\";i:151;s:26:\"ROLE_FONCTIONEMPLOYE_INDEX\";i:152;s:25:\"ROLE_FONCTIONEMPLOYE_SHOW\";i:153;s:26:\"ROLE_FONCTIONEMPLOYE_CLONE\";i:154;s:27:\"ROLE_FONCTIONEMPLOYE_DELETE\";i:155;s:25:\"ROLE_FONCTIONEMPLOYE_EDIT\";i:156;s:26:\"ROLE_DIPLOMEEMPLOYE_CREATE\";i:157;s:25:\"ROLE_DIPLOMEEMPLOYE_INDEX\";i:158;s:24:\"ROLE_DIPLOMEEMPLOYE_SHOW\";i:159;s:25:\"ROLE_DIPLOMEEMPLOYE_CLONE\";i:160;s:26:\"ROLE_DIPLOMEEMPLOYE_DELETE\";i:161;s:24:\"ROLE_DIPLOMEEMPLOYE_EDIT\";i:162;s:19:\"ROLE_CONTRAT_CREATE\";i:163;s:18:\"ROLE_CONTRAT_INDEX\";i:164;s:17:\"ROLE_CONTRAT_SHOW\";i:165;s:18:\"ROLE_CONTRAT_CLONE\";i:166;s:19:\"ROLE_CONTRAT_DELETE\";i:167;s:17:\"ROLE_CONTRAT_EDIT\";i:168;s:23:\"ROLE_Affectation_CREATE\";i:169;s:22:\"ROLE_Affectation_INDEX\";i:170;s:21:\"ROLE_Affectation_SHOW\";i:171;s:22:\"ROLE_Affectation_CLONE\";i:172;s:23:\"ROLE_Affectation_DELETE\";i:173;s:21:\"ROLE_Affectation_EDIT\";}', 'SA'),
=======
(1, 'Super Administrateur', 'a:174:{i:0;s:17:\"ROLE_GROUP_CREATE\";i:1;s:16:\"ROLE_GROUP_INDEX\";i:2;s:15:\"ROLE_GROUP_SHOW\";i:3;s:16:\"ROLE_GROUP_CLONE\";i:4;s:17:\"ROLE_GROUP_DELETE\";i:5;s:15:\"ROLE_GROUP_EDIT\";i:6;s:16:\"ROLE_USER_CREATE\";i:7;s:15:\"ROLE_USER_INDEX\";i:8;s:14:\"ROLE_USER_SHOW\";i:9;s:15:\"ROLE_USER_CLONE\";i:10;s:16:\"ROLE_USER_DELETE\";i:11;s:14:\"ROLE_USER_EDIT\";i:12;s:22:\"ROLE_TYPEENTITE_CREATE\";i:13;s:21:\"ROLE_TYPEENTITE_INDEX\";i:14;s:20:\"ROLE_TYPEENTITE_SHOW\";i:15;s:21:\"ROLE_TYPEENTITE_CLONE\";i:16;s:22:\"ROLE_TYPEENTITE_DELETE\";i:17;s:20:\"ROLE_TYPEENTITE_EDIT\";i:18;s:24:\"ROLE_TYPEDOCUMENT_CREATE\";i:19;s:23:\"ROLE_TYPEDOCUMENT_INDEX\";i:20;s:22:\"ROLE_TYPEDOCUMENT_SHOW\";i:21;s:23:\"ROLE_TYPEDOCUMENT_CLONE\";i:22;s:24:\"ROLE_TYPEDOCUMENT_DELETE\";i:23;s:22:\"ROLE_TYPEDOCUMENT_EDIT\";i:24;s:23:\"ROLE_TYPECONTRAT_CREATE\";i:25;s:22:\"ROLE_TYPECONTRAT_INDEX\";i:26;s:21:\"ROLE_TYPECONTRAT_SHOW\";i:27;s:22:\"ROLE_TYPECONTRAT_CLONE\";i:28;s:23:\"ROLE_TYPECONTRAT_DELETE\";i:29;s:21:\"ROLE_TYPECONTRAT_EDIT\";i:30;s:20:\"ROLE_FONCTION_CREATE\";i:31;s:19:\"ROLE_FONCTION_INDEX\";i:32;s:18:\"ROLE_FONCTION_SHOW\";i:33;s:19:\"ROLE_FONCTION_CLONE\";i:34;s:20:\"ROLE_FONCTION_DELETE\";i:35;s:18:\"ROLE_FONCTION_EDIT\";i:36;s:16:\"ROLE_PAYS_CREATE\";i:37;s:15:\"ROLE_PAYS_INDEX\";i:38;s:14:\"ROLE_PAYS_SHOW\";i:39;s:15:\"ROLE_PAYS_CLONE\";i:40;s:16:\"ROLE_PAYS_DELETE\";i:41;s:14:\"ROLE_PAYS_EDIT\";i:42;s:25:\"ROLE_CAISSESOCIALE_CREATE\";i:43;s:24:\"ROLE_CAISSESOCIALE_INDEX\";i:44;s:23:\"ROLE_CAISSESOCIALE_SHOW\";i:45;s:24:\"ROLE_CAISSESOCIALE_CLONE\";i:46;s:25:\"ROLE_CAISSESOCIALE_DELETE\";i:47;s:23:\"ROLE_CAISSESOCIALE_EDIT\";i:48;s:25:\"ROLE_MUTUELLESANTE_CREATE\";i:49;s:24:\"ROLE_MUTUELLESANTE_INDEX\";i:50;s:23:\"ROLE_MUTUELLESANTE_SHOW\";i:51;s:24:\"ROLE_MUTUELLESANTE_CLONE\";i:52;s:25:\"ROLE_MUTUELLESANTE_DELETE\";i:53;s:23:\"ROLE_MUTUELLESANTE_EDIT\";i:54;s:23:\"ROLE_TYPEEMPLOYE_CREATE\";i:55;s:22:\"ROLE_TYPEEMPLOYE_INDEX\";i:56;s:21:\"ROLE_TYPEEMPLOYE_SHOW\";i:57;s:22:\"ROLE_TYPEEMPLOYE_CLONE\";i:58;s:23:\"ROLE_TYPEEMPLOYE_DELETE\";i:59;s:21:\"ROLE_TYPEEMPLOYE_EDIT\";i:60;s:21:\"ROLE_STRUCTURE_CREATE\";i:61;s:20:\"ROLE_STRUCTURE_INDEX\";i:62;s:19:\"ROLE_STRUCTURE_SHOW\";i:63;s:20:\"ROLE_STRUCTURE_CLONE\";i:64;s:21:\"ROLE_STRUCTURE_DELETE\";i:65;s:19:\"ROLE_STRUCTURE_EDIT\";i:66;s:20:\"ROLE_SYNDICAT_CREATE\";i:67;s:19:\"ROLE_SYNDICAT_INDEX\";i:68;s:18:\"ROLE_SYNDICAT_SHOW\";i:69;s:19:\"ROLE_SYNDICAT_CLONE\";i:70;s:20:\"ROLE_SYNDICAT_DELETE\";i:71;s:18:\"ROLE_SYNDICAT_EDIT\";i:72;s:22:\"ROLE_PROFESSION_CREATE\";i:73;s:21:\"ROLE_PROFESSION_INDEX\";i:74;s:20:\"ROLE_PROFESSION_SHOW\";i:75;s:21:\"ROLE_PROFESSION_CLONE\";i:76;s:22:\"ROLE_PROFESSION_DELETE\";i:77;s:20:\"ROLE_PROFESSION_EDIT\";i:78;s:19:\"ROLE_DIPLOME_CREATE\";i:79;s:18:\"ROLE_DIPLOME_INDEX\";i:80;s:17:\"ROLE_DIPLOME_SHOW\";i:81;s:18:\"ROLE_DIPLOME_CLONE\";i:82;s:19:\"ROLE_DIPLOME_DELETE\";i:83;s:17:\"ROLE_DIPLOME_EDIT\";i:84;s:29:\"ROLE_STRUCTUREFONCTION_CREATE\";i:85;s:28:\"ROLE_STRUCTUREFONCTION_INDEX\";i:86;s:27:\"ROLE_STRUCTUREFONCTION_SHOW\";i:87;s:28:\"ROLE_STRUCTUREFONCTION_CLONE\";i:88;s:29:\"ROLE_STRUCTUREFONCTION_DELETE\";i:89;s:27:\"ROLE_STRUCTUREFONCTION_EDIT\";i:90;s:19:\"ROLE_GCLASSE_CREATE\";i:91;s:18:\"ROLE_GCLASSE_INDEX\";i:92;s:17:\"ROLE_GCLASSE_SHOW\";i:93;s:18:\"ROLE_GCLASSE_CLONE\";i:94;s:19:\"ROLE_GCLASSE_DELETE\";i:95;s:17:\"ROLE_GCLASSE_EDIT\";i:96;s:22:\"ROLE_GCATEGORIE_CREATE\";i:97;s:21:\"ROLE_GCATEGORIE_INDEX\";i:98;s:20:\"ROLE_GCATEGORIE_SHOW\";i:99;s:21:\"ROLE_GCATEGORIE_CLONE\";i:100;s:22:\"ROLE_GCATEGORIE_DELETE\";i:101;s:20:\"ROLE_GCATEGORIE_EDIT\";i:102;s:19:\"ROLE_GNIVEAU_CREATE\";i:103;s:18:\"ROLE_GNIVEAU_INDEX\";i:104;s:17:\"ROLE_GNIVEAU_SHOW\";i:105;s:18:\"ROLE_GNIVEAU_CLONE\";i:106;s:19:\"ROLE_GNIVEAU_DELETE\";i:107;s:17:\"ROLE_GNIVEAU_EDIT\";i:108;s:20:\"ROLE_GECHELON_CREATE\";i:109;s:19:\"ROLE_GECHELON_INDEX\";i:110;s:18:\"ROLE_GECHELON_SHOW\";i:111;s:19:\"ROLE_GECHELON_CLONE\";i:112;s:20:\"ROLE_GECHELON_DELETE\";i:113;s:18:\"ROLE_GECHELON_EDIT\";i:114;s:17:\"ROLE_GRADE_CREATE\";i:115;s:16:\"ROLE_GRADE_INDEX\";i:116;s:15:\"ROLE_GRADE_SHOW\";i:117;s:16:\"ROLE_GRADE_CLONE\";i:118;s:17:\"ROLE_GRADE_DELETE\";i:119;s:15:\"ROLE_GRADE_EDIT\";i:120;s:19:\"ROLE_EMPLOYE_CREATE\";i:121;s:18:\"ROLE_EMPLOYE_INDEX\";i:122;s:17:\"ROLE_EMPLOYE_SHOW\";i:123;s:18:\"ROLE_EMPLOYE_CLONE\";i:124;s:19:\"ROLE_EMPLOYE_DELETE\";i:125;s:17:\"ROLE_EMPLOYE_EDIT\";i:126;s:19:\"ROLE_ADRESSE_CREATE\";i:127;s:18:\"ROLE_ADRESSE_INDEX\";i:128;s:17:\"ROLE_ADRESSE_SHOW\";i:129;s:18:\"ROLE_ADRESSE_CLONE\";i:130;s:19:\"ROLE_ADRESSE_DELETE\";i:131;s:17:\"ROLE_ADRESSE_EDIT\";i:132;s:25:\"ROLE_MEMBREFAMILLE_CREATE\";i:133;s:24:\"ROLE_MEMBREFAMILLE_INDEX\";i:134;s:23:\"ROLE_MEMBREFAMILLE_SHOW\";i:135;s:24:\"ROLE_MEMBREFAMILLE_CLONE\";i:136;s:25:\"ROLE_MEMBREFAMILLE_DELETE\";i:137;s:23:\"ROLE_MEMBREFAMILLE_EDIT\";i:138;s:26:\"ROLE_MEMBRESYNDICAT_CREATE\";i:139;s:25:\"ROLE_MEMBRESYNDICAT_INDEX\";i:140;s:24:\"ROLE_MEMBRESYNDICAT_SHOW\";i:141;s:25:\"ROLE_MEMBRESYNDICAT_CLONE\";i:142;s:26:\"ROLE_MEMBRESYNDICAT_DELETE\";i:143;s:24:\"ROLE_MEMBRESYNDICAT_EDIT\";i:144;s:20:\"ROLE_DOCUMENT_CREATE\";i:145;s:19:\"ROLE_DOCUMENT_INDEX\";i:146;s:18:\"ROLE_DOCUMENT_SHOW\";i:147;s:19:\"ROLE_DOCUMENT_CLONE\";i:148;s:20:\"ROLE_DOCUMENT_DELETE\";i:149;s:18:\"ROLE_DOCUMENT_EDIT\";i:150;s:27:\"ROLE_FONCTIONEMPLOYE_CREATE\";i:151;s:26:\"ROLE_FONCTIONEMPLOYE_INDEX\";i:152;s:25:\"ROLE_FONCTIONEMPLOYE_SHOW\";i:153;s:26:\"ROLE_FONCTIONEMPLOYE_CLONE\";i:154;s:27:\"ROLE_FONCTIONEMPLOYE_DELETE\";i:155;s:25:\"ROLE_FONCTIONEMPLOYE_EDIT\";i:156;s:26:\"ROLE_DIPLOMEEMPLOYE_CREATE\";i:157;s:25:\"ROLE_DIPLOMEEMPLOYE_INDEX\";i:158;s:24:\"ROLE_DIPLOMEEMPLOYE_SHOW\";i:159;s:25:\"ROLE_DIPLOMEEMPLOYE_CLONE\";i:160;s:26:\"ROLE_DIPLOMEEMPLOYE_DELETE\";i:161;s:24:\"ROLE_DIPLOMEEMPLOYE_EDIT\";i:162;s:19:\"ROLE_CONTRAT_CREATE\";i:163;s:18:\"ROLE_CONTRAT_INDEX\";i:164;s:17:\"ROLE_CONTRAT_SHOW\";i:165;s:18:\"ROLE_CONTRAT_CLONE\";i:166;s:19:\"ROLE_CONTRAT_DELETE\";i:167;s:17:\"ROLE_CONTRAT_EDIT\";i:168;s:23:\"ROLE_AFFECTATION_CREATE\";i:169;s:22:\"ROLE_AFFECTATION_INDEX\";i:170;s:21:\"ROLE_AFFECTATION_SHOW\";i:171;s:22:\"ROLE_AFFECTATION_CLONE\";i:172;s:23:\"ROLE_AFFECTATION_DELETE\";i:173;s:21:\"ROLE_AFFECTATION_EDIT\";}', 'SA'),
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d
(2, 'Directrice des Ressources Humaines', 'a:60:{i:0;s:17:\"ROLE_GROUP_CREATE\";i:1;s:16:\"ROLE_GROUP_INDEX\";i:2;s:15:\"ROLE_GROUP_SHOW\";i:3;s:16:\"ROLE_USER_CREATE\";i:4;s:15:\"ROLE_USER_INDEX\";i:5;s:14:\"ROLE_USER_SHOW\";i:6;s:25:\"ROLE_CAISSESOCIALE_CREATE\";i:7;s:24:\"ROLE_CAISSESOCIALE_INDEX\";i:8;s:23:\"ROLE_CAISSESOCIALE_SHOW\";i:9;s:25:\"ROLE_CAISSESOCIALE_DELETE\";i:10;s:23:\"ROLE_CAISSESOCIALE_EDIT\";i:11;s:25:\"ROLE_MUTUELLESANTE_CREATE\";i:12;s:24:\"ROLE_MUTUELLESANTE_INDEX\";i:13;s:23:\"ROLE_MUTUELLESANTE_SHOW\";i:14;s:25:\"ROLE_MUTUELLESANTE_DELETE\";i:15;s:23:\"ROLE_MUTUELLESANTE_EDIT\";i:16;s:21:\"ROLE_STRUCTURE_CREATE\";i:17;s:20:\"ROLE_STRUCTURE_INDEX\";i:18;s:19:\"ROLE_STRUCTURE_SHOW\";i:19;s:21:\"ROLE_STRUCTURE_DELETE\";i:20;s:19:\"ROLE_STRUCTURE_EDIT\";i:21;s:20:\"ROLE_SYNDICAT_CREATE\";i:22;s:19:\"ROLE_SYNDICAT_INDEX\";i:23;s:18:\"ROLE_SYNDICAT_SHOW\";i:24;s:18:\"ROLE_SYNDICAT_EDIT\";i:25;s:17:\"ROLE_GRADE_CREATE\";i:26;s:16:\"ROLE_GRADE_INDEX\";i:27;s:15:\"ROLE_GRADE_SHOW\";i:28;s:17:\"ROLE_GRADE_DELETE\";i:29;s:15:\"ROLE_GRADE_EDIT\";i:30;s:19:\"ROLE_EMPLOYE_CREATE\";i:31;s:18:\"ROLE_EMPLOYE_INDEX\";i:32;s:17:\"ROLE_EMPLOYE_SHOW\";i:33;s:19:\"ROLE_EMPLOYE_DELETE\";i:34;s:17:\"ROLE_EMPLOYE_EDIT\";i:35;s:19:\"ROLE_ADRESSE_CREATE\";i:36;s:18:\"ROLE_ADRESSE_INDEX\";i:37;s:17:\"ROLE_ADRESSE_SHOW\";i:38;s:19:\"ROLE_ADRESSE_DELETE\";i:39;s:17:\"ROLE_ADRESSE_EDIT\";i:40;s:25:\"ROLE_MEMBREFAMILLE_CREATE\";i:41;s:24:\"ROLE_MEMBREFAMILLE_INDEX\";i:42;s:23:\"ROLE_MEMBREFAMILLE_SHOW\";i:43;s:25:\"ROLE_MEMBREFAMILLE_DELETE\";i:44;s:23:\"ROLE_MEMBREFAMILLE_EDIT\";i:45;s:26:\"ROLE_MEMBRESYNDICAT_CREATE\";i:46;s:25:\"ROLE_MEMBRESYNDICAT_INDEX\";i:47;s:24:\"ROLE_MEMBRESYNDICAT_SHOW\";i:48;s:26:\"ROLE_MEMBRESYNDICAT_DELETE\";i:49;s:24:\"ROLE_MEMBRESYNDICAT_EDIT\";i:50;s:20:\"ROLE_DOCUMENT_CREATE\";i:51;s:19:\"ROLE_DOCUMENT_INDEX\";i:52;s:18:\"ROLE_DOCUMENT_SHOW\";i:53;s:20:\"ROLE_DOCUMENT_DELETE\";i:54;s:18:\"ROLE_DOCUMENT_EDIT\";i:55;s:27:\"ROLE_FONCTIONEMPLOYE_CREATE\";i:56;s:26:\"ROLE_FONCTIONEMPLOYE_INDEX\";i:57;s:25:\"ROLE_FONCTIONEMPLOYE_SHOW\";i:58;s:27:\"ROLE_FONCTIONEMPLOYE_DELETE\";i:59;s:25:\"ROLE_FONCTIONEMPLOYE_EDIT\";}', 'DRH');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_canonical` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `prenom` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fonction` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `prenom`, `nom`, `telephone`, `source`, `path_image`, `file_name`, `fonction`) VALUES
<<<<<<< HEAD
(1, 'bamboguirassy', 'bamboguirassy', 'didegassama@gmail.com', 'didegassama@gmail.com', 1, 'KpIYER.RcKmWSDCiwKAnNSvcJxDIOCg8EZ7H5nM2nCs', '$2y$13$R04XxI29Cw3S5HoKXqHeKuEXU1JO7orWek/UoLOLYG.ocGOGgQhZ6', '2021-05-17 13:10:42', NULL, NULL, 'a:0:{}', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 1, 'xiAQMhJrdX/dcHEd8UHmhDYCWZSdydnTofkyJm316TM', '$2y$13$I7YYxxJCYjrfuwTuPaq9LuvbCmOf5CaHLr9ekaI3yozkjEfoyeaQy', '2020-09-15 17:27:03', 'f474311a869aa7697c690125d85b9ecd', '2020-09-13 13:37:57', 'a:0:{}', 'Moussa', 'Fofana', '780165026', 'sm', 'http://127.0.0.1:8000/uploads/user/profil/5f5e20b5d03fc.jpeg', '5f5e20b5d03fc.jpeg', 'Chef de Projet - CDD'),
(3, 'aminata.samb@univ-thies.sn', 'aminata.samb@univ-thies.sn', 'aminata.samb@univ-thies.sn', 'aminata.samb@univ-thies.sn', 1, NULL, '$2y$13$b93owv6K.C/3Trqn3KRc7u9YdZo9TTBF0ZjmGMnuRJGwjOOiyoU8W', '2021-05-04 11:58:09', '0e8d2419812f164e94da02d216e88aa7', '2021-05-03 14:18:16', 'a:0:{}', 'Aminata', 'Samb', '773509313', 'sm', NULL, NULL, 'developpeur');
=======
(1, 'bamboguirassy', 'bamboguirassy', 'didegassama@gmail.com', 'didegassama@gmail.com', 1, 'Z/gyBaBwxhKdslRLxGEGISo2d1Ri9rQZV2rRXUJrFk4', '$2y$13$NtjJGxfgCmKZg92USbU1DezMcJJ/QQG1Pu3t.gRdhT2TI72Dfcg3m', '2021-05-27 08:37:08', NULL, NULL, 'a:0:{}', NULL, NULL, NULL, NULL, 'http://127.0.0.1:8000/uploads/user/profil/609c60d32bd14.png', '609c60d32bd14.png', NULL),
(2, 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 1, 'xiAQMhJrdX/dcHEd8UHmhDYCWZSdydnTofkyJm316TM', '$2y$13$I7YYxxJCYjrfuwTuPaq9LuvbCmOf5CaHLr9ekaI3yozkjEfoyeaQy', '2021-04-29 12:00:47', 'f474311a869aa7697c690125d85b9ecd', '2020-09-13 13:37:57', 'a:0:{}', 'Moussa', 'Fofana', '780165026', 'sm', 'http://127.0.0.1:8000/uploads/user/profil/5f5e20b5d03fc.jpeg', '5f5e20b5d03fc.jpeg', 'Chef de Projet - CDD');
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

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
<<<<<<< HEAD
(2, 1),
(3, 2);
=======
(2, 1);
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

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
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

--
-- Déchargement des données de la table `gcategorie`
--

INSERT INTO `gcategorie` (`id`, `suivant_id`, `nom`, `indice`, `ordre`) VALUES
<<<<<<< HEAD
(1, 7, 'catégorie 1', 'z', 2),
(2, 1, 'eaz', 'azee', 1),
(3, NULL, 'a', 'eed', 1),
(4, 2, 'dd', 'd', 1),
(5, NULL, 's', 'sdqs', 1),
(6, NULL, 'ere', 'er', 1),
(7, NULL, 'gjehgzkfzel', 'z', 1);
=======
(1, NULL, '1', '1', 1),
(2, NULL, '2', '2', 2),
(3, NULL, '3', '3', 3),
(4, NULL, '4', '4', 4),
(5, NULL, '5', '5', 5),
(7, NULL, '10', '10', 10),
(13, 15, '11', '11', 11),
(15, NULL, '12', '12', 12),
(16, NULL, '13', '13', 13),
(22, 23, 'Deuxieme Classe', '14', 14),
(23, NULL, 'Première classe', '15', 15),
(24, 25, 'assimilés', '16', 16),
(25, 26, 'titulaires', '17', 17),
(26, 27, 'classe normale', '18', 18),
(27, NULL, 'classe exceptionnelle', '19', 19);
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

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
  `type_employe` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ED38B3209C2BB0CC` (`suivant_id`),
  KEY `IDX_ED38B320D025BC4C` (`type_employe`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

--
-- Déchargement des données de la table `gclasse`
--

INSERT INTO `gclasse` (`id`, `suivant_id`, `nom`, `indice`, `ordre`, `type_employe`) VALUES
<<<<<<< HEAD
(1, 40, 'Classe 1', '2', 1, 2),
(2, 41, 'Classe 2', '2', 3, 1),
(32, 36, 'Classe 3', 'aze', 1, 4),
(33, 42, 'classe 4', '2', 1, 1),
(34, NULL, 'Classe 5', 'AEA', 1, 4),
(35, NULL, 'Classe 7', 'AZEZA', 1, 3),
(36, 32, 'Classe 6', 'ERFE', 1, 2),
(40, NULL, 'ClasseZ', '2', 2, 2),
(41, NULL, 'Classe 8', '2', 4, 3),
(42, NULL, 'Classe 9', 'indice 2', 3, 1);
=======
(1, NULL, 'CLASSE I', '1', 1, 2),
(2, NULL, 'CLASSE II', '2', 2, 2),
(3, NULL, 'CLASSE III', '3', 3, 2),
(4, NULL, 'CLASSE IV', '4', 4, 2),
(5, NULL, 'INF', 'INF', 5, 2),
(13, 14, 'Assistants', 'A', 1, 1),
(14, 15, 'Maitres de Conférences', 'MC', 2, 1),
(15, NULL, 'Professeurs', 'P', 3, 1),
(16, NULL, 'class vac', '20', 1, 4);
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

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

--
-- Déchargement des données de la table `gclasse_gcategorie`
--

INSERT INTO `gclasse_gcategorie` (`gclasse_id`, `gcategorie_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(13, 22),
(13, 23),
(14, 24),
(14, 25),
(15, 24),
(15, 26),
(15, 27);

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

--
-- Déchargement des données de la table `gclasse_gniveau`
--

INSERT INTO `gclasse_gniveau` (`gclasse_id`, `gniveau_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 5),
(13, 1),
(14, 1),
(15, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gechelon`
--

INSERT INTO `gechelon` (`id`, `suivant_id`, `nom`, `indice`, `ordre`) VALUES
(10, 11, 'Echelon 1', '1', 1),
(11, 12, 'Echelon 2', '2', 2),
(12, 13, 'Echelon 3', '3', 3),
(13, NULL, 'Echelon 4', '4', 4),
(14, NULL, 'Stagiaire', '0', 5);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gniveau`
--

INSERT INTO `gniveau` (`id`, `suivant_id`, `nom`, `indice`, `ordre`) VALUES
(1, 2, 'I', '1', 1),
(2, NULL, '2', '2', 2),
(3, 5, '3', '3', 3),
(5, 6, '4', '4', 4),
(6, 7, '5', '5', 5),
(7, NULL, '6', '6', 6);

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `echelon_id` int(11) NOT NULL,
  `niveau_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
<<<<<<< HEAD
=======
  `classification` varchar(45) NOT NULL,
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d
  `classe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_595AAE344D8771C0` (`echelon_id`),
  KEY `IDX_595AAE34B3E9C81` (`niveau_id`),
  KEY `IDX_595AAE34BCF5E72D` (`categorie_id`),
  KEY `IDX_595AAE348F5EA509` (`classe_id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `grade`
--

INSERT INTO `grade` (`id`, `echelon_id`, `niveau_id`, `categorie_id`, `classification`, `classe_id`) VALUES
(1, 10, 1, 1, '1111', 1),
(2, 11, 1, 1, '1112', 1),
(3, 12, 1, 1, '1113', 1),
(4, 10, 2, 1, '1121', 1),
(5, 11, 2, 1, '1122', 1),
(6, 12, 2, 1, '1123', 1),
(7, 10, 5, 1, '1141', 1),
(8, 11, 5, 1, '1142', 1),
(9, 12, 5, 1, '1143', 1),
(10, 10, 1, 2, '1211', 1),
(11, 11, 1, 2, '1212', 1),
(12, 10, 3, 2, '1231', 1),
(13, 11, 3, 2, '1232', 1),
(14, 12, 3, 2, '1233', 1),
(15, 10, 5, 3, '1341', 1),
(16, 10, 3, 4, '1431', 1),
(17, 10, 2, 3, '1321', 1),
(18, 11, 2, 3, '1322', 1),
(19, 10, 3, 1, '1131', 1),
(20, 11, 3, 1, '1132', 1),
(21, 12, 3, 1, '1133', 1),
(22, 13, 3, 1, '1134', 1),
(23, 10, 2, 2, '1221', 1),
(24, 11, 2, 2, '1222', 1),
(25, 12, 2, 2, '1223', 1),
(26, 10, 5, 2, '1241', 1),
(27, 11, 5, 2, '1242', 1),
(28, 12, 5, 2, '1243', 1),
(29, 10, 1, 3, '1311', 1),
(30, 11, 1, 3, '1312', 1),
(31, 10, 1, 22, 'A1411', 13),
(32, 11, 1, 22, 'A1412', 13),
(33, 12, 1, 22, 'A1413', 13),
(34, 14, 1, 22, 'A1410', 13),
(35, 10, 1, 23, 'A1511', 13),
(36, 11, 1, 23, 'A1512', 13),
(37, 12, 1, 23, 'A1513', 13),
(38, 10, 1, 24, '1611', 14),
(39, 11, 1, 24, '1612', 14),
(40, 12, 1, 24, '1613', 14),
(41, 10, 1, 25, '1711', 14),
(42, 11, 1, 25, '1712', 14),
(43, 12, 1, 25, '1713', 14),
(44, 10, 1, 4, '1411', 1),
(45, 11, 1, 4, '1412', 1);
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

-- --------------------------------------------------------

--
-- Structure de la table `membre_famille`
--

DROP TABLE IF EXISTS `membre_famille`;
CREATE TABLE IF NOT EXISTS `membre_famille` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employe` int(11) DEFAULT NULL,
  `prenoms` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Homme ou Femme',
  `lien_parente` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'enfant, epoux',
  `telephone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_membre_famille_employe1_idx` (`employe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `membre_famille`
--

INSERT INTO `membre_famille` (`id`, `employe`, `prenoms`, `nom`, `date_naissance`, `lieu_naissance`, `genre`, `lien_parente`, `telephone`) VALUES
(1, 1, 'Aminata', 'Samb', '1991-11-11', 'Thiès', 'Femme', 'épouse', '+221773509313'),
(2, 1, 'Hawa', 'Fofana', '2019-05-01', 'Thiès', 'Femme', 'fille', NULL),
(3, 1503, 'Moussa', 'Fofana', '2021-05-03', 'Didé Gassama', 'Homme', 'époux', '780165026');

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
  `etat` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_membre_syndicat_syndicat1_idx` (`syndicat`),
  KEY `fk_membre_syndicat_employe1_idx` (`employe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `membre_syndicat`
--

INSERT INTO `membre_syndicat` (`id`, `employe`, `syndicat`, `date_enregistrement`, `etat`) VALUES
(1, 1, 2, '2018-12-12', 1),
(2, 1, 3, '2021-01-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
<<<<<<< HEAD
('20210505110513', '2021-05-05 11:10:24'),
('20210505142059', '2021-05-05 14:21:48'),
('20210505234143', '2021-05-06 00:00:00'),
('20210506213614', '2021-05-07 08:40:21'),
('20210506222727', '2021-05-07 08:40:36'),
('20210506234347', '2021-05-07 08:40:42'),
('20210507000225', '2021-05-07 08:40:43'),
('20210507081856', '0000-00-00 00:00:00'),
('20210507100246', '2021-05-10 09:40:27'),
('20210507120628', '2021-05-10 09:40:28'),
('20210507124006', '2021-05-10 09:40:30'),
('20210507130404', '0000-00-00 00:00:00'),
('20210509140901', '2021-05-10 09:41:04'),
('20210510085457', '0000-00-00 00:00:00'),
('20210510141347', '0000-00-00 00:00:00'),
('20210510143616', '2021-05-11 08:45:16'),
('20210510143722', '2021-05-11 08:45:17'),
('20210510144259', '2021-05-11 08:45:21'),
('20210510155714', '0000-00-00 00:00:00'),
('20210511001047', '0000-00-00 00:00:00'),
('20210511083043', '2021-05-14 16:05:19'),
('20210511104920', '0000-00-00 00:00:00'),
('20210512002832', '0000-00-00 00:00:00'),
('20210512122625', '0000-00-00 00:00:00'),
('20210513014837', '2021-05-14 16:07:26'),
('20210514221306', '2021-05-14 22:14:57'),
('20210515164218', '2021-05-16 16:10:39'),
('20210516120600', '2021-05-16 16:10:39'),
('20210516121459', '2021-05-16 16:10:41'),
('20210516130237', '2021-05-16 16:10:41'),
('20210516160950', '0000-00-00 00:00:00'),
('20210517140553', '0000-00-00 00:00:00');
=======
('20210505110513', '2021-05-05 13:31:19'),
('20210505142059', '2021-05-05 14:51:53'),
('20210505234143', '2021-05-06 00:00:00'),
('20210506213614', '2021-05-06 21:43:35'),
('20210506222727', '2021-05-06 22:27:58'),
('20210506234347', '2021-05-06 23:44:06'),
('20210507000225', '2021-05-07 00:02:39'),
('20210507081856', '2021-05-07 00:00:00'),
('20210507091025', '2021-05-07 09:44:06'),
('20210507100246', '2021-05-07 12:13:54'),
('20210507120628', '2021-05-07 12:13:55'),
('20210507124006', '2021-05-10 14:14:15'),
('20210507130404', '2021-05-10 00:00:00'),
('20210509140901', '2021-05-10 14:17:18'),
('20210510085457', '2021-05-10 00:00:00'),
('20210510141347', '2021-05-10 00:00:00'),
('20210510143616', '2021-05-10 14:36:47'),
('20210510143722', '2021-05-10 14:37:34'),
('20210510144259', '2021-05-10 14:43:12'),
('20210510155714', '2021-05-10 16:14:09'),
('20210511001047', '0000-00-00 00:00:00'),
('20210511083043', '2021-05-11 08:31:24'),
('20210511104920', '0000-00-00 00:00:00'),
('20210512002832', '0000-00-00 00:00:00'),
('20210512122625', '0000-00-00 00:00:00'),
('20210513014837', '2021-05-13 01:49:07'),
('20210514221306', '0000-00-00 00:00:00'),
('20210515164218', '2021-05-15 16:42:54'),
('20210516115328', '2021-05-16 11:54:15'),
('20210516120123', '2021-05-16 12:01:42'),
('20210516120600', '2021-05-16 12:07:17'),
('20210516121459', '2021-05-16 12:15:21'),
('20210516130237', '2021-05-16 13:02:45'),
('20210516160950', '0000-00-00 00:00:00'),
('20210517140553', '2021-05-17 14:07:44'),
('20210518180141', '2021-05-18 18:02:45'),
('20210520090428', '2021-05-21 10:45:18'),
('20210520144838', '2021-05-21 10:45:22'),
('20210520145748', '2021-05-21 10:45:23'),
('20210521122438', '2021-05-21 17:28:48'),
('20210524131750', '2021-05-24 13:20:29');
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

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
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

--
-- Déchargement des données de la table `profession`
--

INSERT INTO `profession` (`id`, `classe_id`, `nom`) VALUES
<<<<<<< HEAD
(1, NULL, 'Assistante'),
(2, 1, 'zz'),
(3, 2, 'dfdf'),
(4, NULL, 'ff');
=======
(1, NULL, 'Chauffeur'),
(2, NULL, 'Informaticien'),
(3, NULL, 'Comptable'),
(4, NULL, 'Maçon'),
(5, NULL, 'Menuisier'),
(6, NULL, 'Ingénieur de conception'),
(7, 2, 'Electricien'),
(8, 1, 'Chauffeur Permis B'),
(9, 2, 'Plombier');
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

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
  `adresse` text,
  `telephone` varchar(45) DEFAULT NULL,
  `type_entite` int(11) DEFAULT NULL,
  `structure_parente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_structure_typeentite_idx` (`type_entite`),
  KEY `fk_structure_structure1_idx` (`structure_parente`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
=======
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

--
-- Déchargement des données de la table `structure`
--

INSERT INTO `structure` (`id`, `nom`, `code`, `adresse`, `telephone`, `type_entite`, `structure_parente`) VALUES
(1, 'Université de Thiès', 'UT', 'Cité Malick SY, 2 voix prison MAC THIES', '339518569', 1, NULL),
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
<<<<<<< HEAD
(14, 'Agence Comptable Principale', 'ACP', NULL, '339854774', 8, 2);
=======
(14, 'Agence Comptable Principale', 'ACP', NULL, '339854774', 8, 2),
(15, 'Division Développement et Innovation Technologique', 'DIT', NULL, '339511844', 9, 3),
(16, 'Division Ingénierie et Exploitation', 'DIE', NULL, NULL, 9, 3);
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

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
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

--
-- Déchargement des données de la table `structure_fonction`
--

INSERT INTO `structure_fonction` (`id`, `structure_id`, `fonction_id`, `etat`) VALUES
<<<<<<< HEAD
(1, 14, 25, 23);
=======
(1, 15, 43, 1),
(4, 3, 97, 1),
(5, 3, 38, 1),
(7, 5, 3, 1),
(8, 5, 11, 1),
(9, 5, 17, 1),
(10, 5, 22, 1),
(11, 5, 30, 1),
(12, 5, 34, 1),
(13, 5, 38, 1),
(14, 5, 51, 1);
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d

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
  `filepath` text,
  `montant_cotisation_mensuelle` int(5) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_syndicat_type_employe1_idx` (`type_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `syndicat`
--

INSERT INTO `syndicat` (`id`, `nom`, `code`, `type_employe`, `filename`, `filepath`, `montant_cotisation_mensuelle`, `type`) VALUES
(1, 'Syndicat Autonome des Enseignants du Supérieur', 'SAES', 1, '5f60f96bb657f.png', 'http://127.0.0.1:8000/uploads/syndicat/5f60f96bb657f.png', 0, ''),
(2, 'Syndicat Autonome des Travailleurs des universités et des centres universitaires', 'SATUC', 2, '5f622beec0fa3.png', 'http://127.0.0.1:8000/uploads/syndicat/5f622beec0fa3.png', 2500, 'syndicat'),
(3, 'ATUT', 'ATUT', 2, '60a984dc7ff1e.jpeg', 'http://127.0.0.1:8000/uploads/syndicat/60a984dc7ff1e.jpeg', 1000, 'amicale');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_contrat`
--

INSERT INTO `type_contrat` (`id`, `nom`, `code`) VALUES
(1, 'CDD - Contrat à Durée Déterminée', 'CDD'),
(2, 'CDI - Contrat à Durée Indéterminée', 'CDI'),
(3, 'CTT - Contrat de travail temporaire ou Intéri', 'CTT'),
(4, 'Contrat d’apprentissage (alternance)', 'CA'),
(5, 'Contrat de professionnalisation (alternance)', 'CP'),
(6, 'CUI - Contrat unique d’insertion', 'CUI'),
(7, 'CAE - Contrat d’accompagnement dans l’emploi', 'CAE');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
(8, 'Agence', 'AGENCE'),
(9, 'Division', 'DIV'),
(10, 'Service', 'SRV');

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
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `FK_603499931B65292` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`),
  ADD CONSTRAINT `FK_60349993520D03A` FOREIGN KEY (`type_contrat_id`) REFERENCES `type_contrat` (`id`);

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
<<<<<<< HEAD
  ADD CONSTRAINT `FK_F804D3B92534008B` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`),
  ADD CONSTRAINT `FK_F804D3B9595AAE34` FOREIGN KEY (`grade`) REFERENCES `grade` (`id`),
=======
  ADD CONSTRAINT `FK_F804D3B92534008B` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`) ON DELETE RESTRICT,
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d
  ADD CONSTRAINT `FK_F804D3B99EC4D73F` FOREIGN KEY (`nationalite`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `FK_F804D3B9A6CE7BD9` FOREIGN KEY (`caisse_sociale`) REFERENCES `caisse_sociale` (`id`),
  ADD CONSTRAINT `FK_F804D3B9C2DF197E` FOREIGN KEY (`mutuelle_sante`) REFERENCES `mutuelle_sante` (`id`),
  ADD CONSTRAINT `FK_F804D3B9D025BC4C` FOREIGN KEY (`type_employe`) REFERENCES `type_employe` (`id`),
  ADD CONSTRAINT `FK_F804D3B9FDEF8996` FOREIGN KEY (`profession_id`) REFERENCES `profession` (`id`);

--
-- Contraintes pour la table `fonction_employe`
--
ALTER TABLE `fonction_employe`
<<<<<<< HEAD
  ADD CONSTRAINT `FK_3554BF214EA09820` FOREIGN KEY (`responsabilite`) REFERENCES `structure_fonction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
=======
  ADD CONSTRAINT `FK_3554BF214EA09820` FOREIGN KEY (`responsabilite`) REFERENCES `structure_fonction` (`id`),
>>>>>>> 84d747ea6544b43592585f128d4d5f82fae6979d
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
  ADD CONSTRAINT `gclasse_ibfk_1` FOREIGN KEY (`type_employe`) REFERENCES `type_employe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
-- Contraintes pour la table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `FK_595AAE344D8771C0` FOREIGN KEY (`echelon_id`) REFERENCES `gechelon` (`id`),
  ADD CONSTRAINT `FK_595AAE348F5EA509` FOREIGN KEY (`classe_id`) REFERENCES `gclasse` (`id`),
  ADD CONSTRAINT `FK_595AAE34B3E9C81` FOREIGN KEY (`niveau_id`) REFERENCES `gniveau` (`id`),
  ADD CONSTRAINT `FK_595AAE34BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `gcategorie` (`id`);

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
  ADD CONSTRAINT `fk_structure_structure1` FOREIGN KEY (`structure_parente`) REFERENCES `structure` (`id`),
  ADD CONSTRAINT `fk_structure_typeentite` FOREIGN KEY (`type_entite`) REFERENCES `type_entite` (`id`);

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
  ADD CONSTRAINT `fk_syndicat_type_employe1` FOREIGN KEY (`type_employe`) REFERENCES `type_employe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
