-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 31 mai 2019 à 13:18
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `parcours_java_p5`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_rue` varchar(100) DEFAULT NULL,
  `nom_rue` varchar(100) DEFAULT NULL,
  `numero` varchar(10) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `pays` varchar(50) NOT NULL DEFAULT 'FRANCE',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `type_rue`, `nom_rue`, `numero`, `code_postal`, `ville`, `pays`) VALUES
(1, 'allée', 'mille et une nuits', '4', '77184', 'Emerainville', 'FRANCE'),
(2, 'rue', 'lapin vert', '17', '77184', 'Emerainville', 'FRANCE'),
(3, 'Impasse', 'du postier', '52', '77400', 'Pontault-combault', 'FRANCE'),
(4, 'avenue', 'du général de gaulle', '21', '77400', 'Pontault-combault', 'FRANCE'),
(5, NULL, 'ZI du clos du chêne', '84', '77144', 'Montévrain', 'FRANCE');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adresse_client_fk` (`id_adresse`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `id_adresse`, `mail`, `password`) VALUES
(1, 'Doe', 'John', 2, 'john.doe@gmail.com', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08'),
(2, '1', 'Piste 1', 3, 'test@test.fr', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08'),
(3, '2', 'Piste 2', 3, 'test@test.fr', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08'),
(4, 'Potter', 'Harry', 4, 'harry.potter@hogwart.uk', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08'),
(5, 'Weasley', 'Ron', 5, 'ronald.weasley@hogwart.uk', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_payed` tinyint(1) NOT NULL DEFAULT '0',
  `etat` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `is_payed`, `etat`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 0, 5),
(6, 1, 6),
(7, 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `composition`
--

DROP TABLE IF EXISTS `composition`;
CREATE TABLE IF NOT EXISTS `composition` (
  `id_pizza` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL,
  PRIMARY KEY (`id_pizza`,`id_ingredient`),
  KEY `ingredient_recette_fk` (`id_ingredient`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `composition`
--

INSERT INTO `composition` (`id_pizza`, `id_ingredient`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name_etat_uindex` (`etat`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `etat`) VALUES
(1, 'en cours'),
(2, 'attente'),
(3, 'preparation'),
(4, 'preparee'),
(5, 'annule'),
(6, 'modifie'),
(7, 'livre');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `nom`) VALUES
(1, 'tomate'),
(2, 'champignons'),
(3, 'oignons'),
(4, 'fromage'),
(5, 'jambon');

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commande_livraison_fk` (`id_commande`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id`, `id_commande`) VALUES
(1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `id_pizza` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pizza_menu_fk` (`id_pizza`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `nom`, `id_pizza`) VALUES
(1, 'midi', 1),
(2, 'midi', 2),
(3, 'midi', 3),
(4, 'midi', 4),
(5, 'midi', 5),
(6, 'soir', 1),
(7, 'soir', 2),
(8, 'soir', 3);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `id_commande` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commande_paiement_fk` (`id_commande`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id`, `date`, `id_commande`) VALUES
(1, '2019-05-28', 1),
(2, '2019-05-28', 2),
(3, '2019-05-28', 3),
(4, '2019-05-31', 4),
(5, '2019-05-31', 6),
(6, '2019-05-31', 7);

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` smallint(6) NOT NULL DEFAULT '0',
  `id_restaurant` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `restaurant_personnel_fk` (`id_restaurant`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`id`, `nom`, `prenom`, `mail`, `password`, `role`, `id_restaurant`) VALUES
(1, 'Dumbledore', 'Albus', 'albus.hogwart.uk', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08', 1, 1),
(2, 'Mcgonagall', 'Minerva', 'minerva_du_91@gmail.com', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08', 2, 1),
(3, 'Rogue', 'Severus', 'rogue@forcedumal.com', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08', 3, 1),
(4, 'Edwige', 'chouette', 'chouette@prestataire.uk', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
CREATE TABLE IF NOT EXISTS `pizza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `prixHT` double NOT NULL,
  `menu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pizza`
--

INSERT INTO `pizza` (`id`, `nom`, `disponible`, `prixHT`, `menu`) VALUES
(1, 'Queen', 1, 14.99, 1),
(2, 'Vegetarienne', 1, 14.99, 1),
(3, 'Hawaienne', 1, 14.99, 1),
(4, '4 fromages', 1, 14.99, 1),
(5, 'classique', 1, 14.99, 2);

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

DROP TABLE IF EXISTS `recette`;
CREATE TABLE IF NOT EXISTS `recette` (
  `id_pizza` int(11) NOT NULL AUTO_INCREMENT,
  `recette` text,
  PRIMARY KEY (`id_pizza`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `recette`
--

INSERT INTO `recette` (`id_pizza`, `recette`) VALUES
(1, 'Préparez la pate à pizza, Mettez la au four, ajouter les ingredients.\r\nFaites revenir l\'oignon pendant 10 minutes');

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL DEFAULT 'OC Pizza',
  `id_adresse` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adresse_restaurant_fk` (`id_adresse`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `restaurant`
--

INSERT INTO `restaurant` (`id`, `nom`, `id_adresse`) VALUES
(1, 'OC Pizza', 1);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id_restaurant` smallint(6) NOT NULL,
  `id_ingredient` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_restaurant`,`id_ingredient`),
  KEY `ingredient_stock_fk` (`id_ingredient`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id_restaurant`, `id_ingredient`, `quantite`) VALUES
(1, 1, 10),
(1, 2, 22),
(1, 3, 11),
(1, 4, 21),
(1, 5, 21);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
