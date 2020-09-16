-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 16 sep. 2020 à 12:33
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

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
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(145) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`id`, `nom`) VALUES
(1, 'Assistante SG'),
(2, 'Chef du service juridique'),
(3, 'Chauffeur'),
(4, 'Directrice de la Communication, du Marketing et de l\'Audiovisuel'),
(5, 'Standardiste'),
(6, 'SAU'),
(7, 'Agent de service'),
(8, 'DRHF'),
(9, 'Chef de bureau Sécurité'),
(10, 'Chef de bureau soldes et dépenses de personnel'),
(11, 'Chef de Bureau/comptabilité'),
(12, 'Secrétaire Général'),
(13, 'Chef de service aux étudiants'),
(14, 'Caissière Principale'),
(15, 'Chef de Division PATS'),
(16, 'Assistante ACP'),
(17, 'Comptable'),
(18, 'ACP'),
(19, 'Controleur de Gestion'),
(20, 'Directrice Bibliothéque'),
(21, 'Assistante de Direction'),
(22, 'Electricien'),
(23, 'Assistante Recteur'),
(24, 'Chef de Division CDP'),
(25, 'AAU'),
(26, 'DFC'),
(27, 'Chef de Division Marketing'),
(28, 'Chargé du bureau  d\'accueil'),
(29, 'Responsable Approvisionnement'),
(30, 'Comptable Matières'),
(31, 'Médecin'),
(32, 'Chef de Division Vie Universitaire'),
(33, 'Archiviste'),
(34, 'Documentaliste'),
(35, 'Reprographe'),
(36, 'Vaguemestre'),
(37, 'Agent de liaison'),
(38, 'Assistante'),
(39, 'Secrétaire'),
(40, 'infirmière'),
(41, 'Technicienne informaticienne'),
(42, 'Technicien Informaticien'),
(43, 'Chef de Division de l\'Innovation et de la Pédagogie'),
(44, 'Directeur DSOS'),
(45, 'CSA BC'),
(46, 'Assistant social'),
(47, 'Conservateur'),
(48, 'secrétaire d\'Administration Universitaire'),
(49, 'Agent administratif'),
(50, 'Chef de service scolarité'),
(51, 'CSA'),
(52, 'Secrétaire de Direction'),
(53, 'Chef de service financier'),
(54, 'CSA UFR SES'),
(55, 'Technicien supérieur'),
(56, 'Secrétaire bureautique'),
(57, 'Chef Service Scolarité'),
(58, 'Secrétaire sténodactylo'),
(59, 'Aide Comptable'),
(60, 'Rénéotipyste'),
(61, 'Chef de service Bibliothèque'),
(62, 'Chef Scolarité'),
(63, 'Technicien de laboratoire'),
(64, 'Chef des services administratifs'),
(65, 'Chef de Scolarité'),
(66, 'Chef du Service des Finances'),
(67, 'Technicien en Maintenance'),
(68, 'Bibliothécaire'),
(69, 'Ouvrier agricole'),
(70, 'Technicien horticole'),
(71, 'Mécanicien'),
(72, 'Menuisier bois'),
(73, 'Manœuvre'),
(74, 'Femme de ménage'),
(75, 'Menuisier métallique'),
(76, 'Gardien'),
(77, 'Commis d’administration'),
(78, 'Jardinier'),
(79, 'Berger'),
(80, 'SECRETAIRE DACTYLO'),
(81, 'AIDE INFIRMIERE'),
(82, 'COMPTABLE MATIERE'),
(83, 'COMMIS D\'ADMINISTRATION'),
(84, 'INFIRMIER'),
(85, 'INFIRMIERE D\'ETAT'),
(86, 'PLOMBIER'),
(87, 'INFORMATICIEN'),
(88, 'TECHNICIENNE SUPERIEURE'),
(89, 'Employé d\'Administration'),
(90, 'Chef de service finances'),
(91, 'Professeur Titulaire'),
(92, 'Professeur assimilé'),
(93, 'Maitre de Conférences titulaire'),
(94, 'Assistant'),
(95, 'Maître de Conférences assimilé'),
(96, 'Professeur technique'),
(97, 'Directeur');

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
(1, 'Super Administrateur', 'a:72:{i:0;s:17:\"ROLE_GROUP_CREATE\";i:1;s:16:\"ROLE_GROUP_INDEX\";i:2;s:15:\"ROLE_GROUP_SHOW\";i:3;s:16:\"ROLE_GROUP_CLONE\";i:4;s:17:\"ROLE_GROUP_DELETE\";i:5;s:15:\"ROLE_GROUP_EDIT\";i:6;s:16:\"ROLE_USER_CREATE\";i:7;s:15:\"ROLE_USER_INDEX\";i:8;s:14:\"ROLE_USER_SHOW\";i:9;s:15:\"ROLE_USER_CLONE\";i:10;s:16:\"ROLE_USER_DELETE\";i:11;s:14:\"ROLE_USER_EDIT\";i:12;s:22:\"ROLE_TYPEENTITE_CREATE\";i:13;s:21:\"ROLE_TYPEENTITE_INDEX\";i:14;s:20:\"ROLE_TYPEENTITE_SHOW\";i:15;s:21:\"ROLE_TYPEENTITE_CLONE\";i:16;s:22:\"ROLE_TYPEENTITE_DELETE\";i:17;s:20:\"ROLE_TYPEENTITE_EDIT\";i:18;s:24:\"ROLE_TYPEDOCUMENT_CREATE\";i:19;s:23:\"ROLE_TYPEDOCUMENT_INDEX\";i:20;s:22:\"ROLE_TYPEDOCUMENT_SHOW\";i:21;s:23:\"ROLE_TYPEDOCUMENT_CLONE\";i:22;s:24:\"ROLE_TYPEDOCUMENT_DELETE\";i:23;s:22:\"ROLE_TYPEDOCUMENT_EDIT\";i:24;s:23:\"ROLE_TYPECONTRAT_CREATE\";i:25;s:22:\"ROLE_TYPECONTRAT_INDEX\";i:26;s:21:\"ROLE_TYPECONTRAT_SHOW\";i:27;s:22:\"ROLE_TYPECONTRAT_CLONE\";i:28;s:23:\"ROLE_TYPECONTRAT_DELETE\";i:29;s:21:\"ROLE_TYPECONTRAT_EDIT\";i:30;s:20:\"ROLE_FONCTION_CREATE\";i:31;s:19:\"ROLE_FONCTION_INDEX\";i:32;s:18:\"ROLE_FONCTION_SHOW\";i:33;s:19:\"ROLE_FONCTION_CLONE\";i:34;s:20:\"ROLE_FONCTION_DELETE\";i:35;s:18:\"ROLE_FONCTION_EDIT\";i:36;s:16:\"ROLE_PAYS_CREATE\";i:37;s:15:\"ROLE_PAYS_INDEX\";i:38;s:14:\"ROLE_PAYS_SHOW\";i:39;s:15:\"ROLE_PAYS_CLONE\";i:40;s:16:\"ROLE_PAYS_DELETE\";i:41;s:14:\"ROLE_PAYS_EDIT\";i:42;s:25:\"ROLE_CAISSESOCIALE_CREATE\";i:43;s:24:\"ROLE_CAISSESOCIALE_INDEX\";i:44;s:23:\"ROLE_CAISSESOCIALE_SHOW\";i:45;s:24:\"ROLE_CAISSESOCIALE_CLONE\";i:46;s:25:\"ROLE_CAISSESOCIALE_DELETE\";i:47;s:23:\"ROLE_CAISSESOCIALE_EDIT\";i:48;s:25:\"ROLE_MUTUELLESANTE_CREATE\";i:49;s:24:\"ROLE_MUTUELLESANTE_INDEX\";i:50;s:23:\"ROLE_MUTUELLESANTE_SHOW\";i:51;s:24:\"ROLE_MUTUELLESANTE_CLONE\";i:52;s:25:\"ROLE_MUTUELLESANTE_DELETE\";i:53;s:23:\"ROLE_MUTUELLESANTE_EDIT\";i:54;s:23:\"ROLE_TYPEEMPLOYE_CREATE\";i:55;s:22:\"ROLE_TYPEEMPLOYE_INDEX\";i:56;s:21:\"ROLE_TYPEEMPLOYE_SHOW\";i:57;s:22:\"ROLE_TYPEEMPLOYE_CLONE\";i:58;s:23:\"ROLE_TYPEEMPLOYE_DELETE\";i:59;s:21:\"ROLE_TYPEEMPLOYE_EDIT\";i:60;s:21:\"ROLE_STRUCTURE_CREATE\";i:61;s:20:\"ROLE_STRUCTURE_INDEX\";i:62;s:19:\"ROLE_STRUCTURE_SHOW\";i:63;s:20:\"ROLE_STRUCTURE_CLONE\";i:64;s:21:\"ROLE_STRUCTURE_DELETE\";i:65;s:19:\"ROLE_STRUCTURE_EDIT\";i:66;s:20:\"ROLE_SYNDICAT_CREATE\";i:67;s:19:\"ROLE_SYNDICAT_INDEX\";i:68;s:18:\"ROLE_SYNDICAT_SHOW\";i:69;s:19:\"ROLE_SYNDICAT_CLONE\";i:70;s:20:\"ROLE_SYNDICAT_DELETE\";i:71;s:18:\"ROLE_SYNDICAT_EDIT\";}', 'SA'),
(2, 'Directrice des Ressources Humaines', 'a:3:{i:0;s:16:\"ROLE_USER_CREATE\";i:1;s:15:\"ROLE_USER_INDEX\";i:2;s:14:\"ROLE_USER_SHOW\";}', 'DRH');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `prenom`, `nom`, `telephone`, `source`, `path_image`, `file_name`, `fonction`) VALUES
(1, 'bamboguirassy', 'bamboguirassy', 'didegassama@gmail.com', 'didegassama@gmail.com', 1, 'Z/gyBaBwxhKdslRLxGEGISo2d1Ri9rQZV2rRXUJrFk4', '$2y$13$NtjJGxfgCmKZg92USbU1DezMcJJ/QQG1Pu3t.gRdhT2TI72Dfcg3m', '2020-09-13 13:37:51', NULL, NULL, 'a:0:{}', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 'moussa.fofana@univ-thies.sn', 1, 'xiAQMhJrdX/dcHEd8UHmhDYCWZSdydnTofkyJm316TM', '$2y$13$I7YYxxJCYjrfuwTuPaq9LuvbCmOf5CaHLr9ekaI3yozkjEfoyeaQy', '2020-09-15 17:27:03', 'f474311a869aa7697c690125d85b9ecd', '2020-09-13 13:37:57', 'a:0:{}', 'Moussa', 'Fofana', '780165026', 'sm', 'http://127.0.0.1:8000/uploads/user/profil/5f5e20b5d03fc.jpeg', '5f5e20b5d03fc.jpeg', 'Chef de Projet - CDD');

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
(2, 1);

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
('20200913162947', '2020-09-13 16:30:11');

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
-- Structure de la table `structure`
--

DROP TABLE IF EXISTS `structure`;
CREATE TABLE IF NOT EXISTS `structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(145) NOT NULL,
  `code` varchar(45) NOT NULL,
  `adresse` text,
  `telephone` varchar(45) DEFAULT NULL,
  `type_entite` int(11) NOT NULL,
  `structure_parente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_structure_typeentite_idx` (`type_entite`),
  KEY `fk_structure_structure1_idx` (`structure_parente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
(8, 'Sante', 'SANTE', NULL, '33 982 96 85', 3, 2),
(9, 'Ecole Normale Supérieure d\'Agriculture', 'ENSA', NULL, '339815874', 5, 1),
(10, 'Institut Universitaire de Technologie', 'IUT', NULL, '339547856', 1, 1),
(11, 'Bibliothèque Centrale', 'BU', NULL, '339215896', 7, 2),
(12, 'Direction des Finances et de la Comptabilité', 'DFC', NULL, '339854785', 6, 2),
(13, 'Direction des Ressources Humaines', 'DRH', NULL, '339854785', 6, 2),
(14, 'Agence Comptable Principale', 'ACP', NULL, '339854774', 8, 2);

-- --------------------------------------------------------

--
-- Structure de la table `syndicat`
--

DROP TABLE IF EXISTS `syndicat`;
CREATE TABLE IF NOT EXISTS `syndicat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(245) NOT NULL,
  `code` varchar(45) NOT NULL,
  `type_employe` int(11) NOT NULL,
  `filename` varchar(145) DEFAULT NULL,
  `filepath` text,
  `montant_cotisation_mensuelle` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_syndicat_type_employe1_idx` (`type_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `syndicat`
--

INSERT INTO `syndicat` (`id`, `nom`, `code`, `type_employe`, `filename`, `filepath`, `montant_cotisation_mensuelle`) VALUES
(1, 'Syndicat Autonome des Enseignants du Supérieur', 'SAES', 1, '5f60f96bb657f.png', 'http://127.0.0.1:8000/uploads/syndicat/5f60f96bb657f.png', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_employe`
--

INSERT INTO `type_employe` (`id`, `nom`, `code`) VALUES
(1, 'Personnel Enseignement et de Recherche', 'PER'),
(2, 'Personnel Administratif Technique et des Services', 'PATS');

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
-- Contraintes pour la table `fos_user_group`
--
ALTER TABLE `fos_user_group`
  ADD CONSTRAINT `FK_583D1F3EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_583D1F3EFE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_group` (`id`);

--
-- Contraintes pour la table `structure`
--
ALTER TABLE `structure`
  ADD CONSTRAINT `fk_structure_structure1` FOREIGN KEY (`structure_parente`) REFERENCES `structure` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_structure_typeentite` FOREIGN KEY (`type_entite`) REFERENCES `type_entite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `syndicat`
--
ALTER TABLE `syndicat`
  ADD CONSTRAINT `fk_syndicat_type_employe1` FOREIGN KEY (`type_employe`) REFERENCES `type_employe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
