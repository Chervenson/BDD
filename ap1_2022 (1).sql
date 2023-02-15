-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 15 fév. 2023 à 16:08
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ap1_2022`
--

-- --------------------------------------------------------

--
-- Structure de la table `cr`
--

CREATE TABLE `cr` (
  `num` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vu` tinyint(1) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `note` int(1) NOT NULL,
  `num_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `cr`
--

INSERT INTO `cr` (`num`, `date`, `description`, `vu`, `datetime`, `note`, `num_utilisateur`) VALUES
(1, '2022-09-05', 'Compte rendu n1 OO', 0, '2022-09-05 15:48:15', 0, 1),
(2, '2022-09-12', 'Comtpe rendu numero 2 TTTTTTTTTTTTTTTT', 0, '2022-09-12 14:03:42', 0, 1),
(5, '2022-09-06', 'Compte rendu numero 5', NULL, '2022-09-26 15:17:44', 0, 1),
(6, '2022-11-10', 'TEST', NULL, '2022-11-07 13:12:56', 0, 1),
(7, '2022-11-04', 'FGFSDGFS', NULL, '2022-11-07 13:28:22', 3, 1),
(8, '2022-11-03', 'compte rendu 1ere note', NULL, '2022-11-07 13:33:08', 1, 1),
(9, '2022-11-18', ' dolor sit amet, consectetur adipiscing elit. Duis imperdiet velit ut lorem faucibus pulvinar. Cras et fringilla enim, ac commodo mauris. Fusce fringilla ex at aliquet scelerisque. Nullam ut nibh rhoncus dolor sagittis porta et ut sem. Aenean suscipit placerat ullamcorper.', NULL, '2022-11-07 13:54:01', 5, 1),
(11, '2022-11-11', 'martin test', NULL, '2022-11-07 14:02:45', 0, 1),
(12, '2023-01-04', 'je suis la LA LA', NULL, '2023-01-16 15:44:43', 3, 1),
(13, '2023-01-05', 'rive', NULL, '2023-01-16 15:48:15', 4, 2),
(14, '2023-01-05', 'rive', NULL, '2023-01-16 15:48:23', 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE `stage` (
  `num` int(10) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `CP` int(10) DEFAULT NULL,
  `ville` varchar(40) DEFAULT NULL,
  `tel` int(30) DEFAULT NULL,
  `libelleStage` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `num_tuteur` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `stage`
--

INSERT INTO `stage` (`num`, `nom`, `adresse`, `CP`, `ville`, `tel`, `libelleStage`, `email`, `num_tuteur`) VALUES
(1, 'taf', '1 rue generale de gaule', 92600, 'Asnieres', 749584475, 'info', 'stage@gmail.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tuteur`
--

CREATE TABLE `tuteur` (
  `num` int(10) NOT NULL,
  `nom` varchar(40) DEFAULT NULL,
  `prenom` varchar(40) DEFAULT NULL,
  `tel` int(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `tuteur`
--

INSERT INTO `tuteur` (`num`, `nom`, `prenom`, `tel`, `email`) VALUES
(1, 'tuteur', 'destage', 651231450, 'tuteurdestage@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `num` int(10) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `dateNaissance` date NOT NULL,
  `tel` int(20) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `motdepasse` varchar(100) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `option` int(1) NOT NULL,
  `num_stage` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`num`, `nom`, `prenom`, `dateNaissance`, `tel`, `login`, `motdepasse`, `type`, `email`, `option`, `num_stage`) VALUES
(1, 'martin', 'prevot', '2003-01-18', 6254064, 'martin', '098f6bcd4621d373cade4e832627b4f6', 0, 'test@test.fr', 1, 1),
(2, 'armand', 'rive', '2002-09-06', 756457910, 'rive', '098f6bcd4621d373cade4e832627b4f6', 0, 'rive@gmail.com', 1, 1),
(3, 'Gravouil', 'Benjamin', '1982-05-10', 756457911, 'prof', '098f6bcd4621d373cade4e832627b4f6', 1, 'prof@gmail.com', 0, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cr`
--
ALTER TABLE `cr`
  ADD PRIMARY KEY (`num`),
  ADD KEY `FK_CR` (`num_utilisateur`);

--
-- Index pour la table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`num`),
  ADD KEY `FK_stage` (`num_tuteur`);

--
-- Index pour la table `tuteur`
--
ALTER TABLE `tuteur`
  ADD PRIMARY KEY (`num`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`num`),
  ADD KEY `FK_Uuser` (`num_stage`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cr`
--
ALTER TABLE `cr`
  MODIFY `num` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `stage`
--
ALTER TABLE `stage`
  MODIFY `num` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `tuteur`
--
ALTER TABLE `tuteur`
  MODIFY `num` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `num` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cr`
--
ALTER TABLE `cr`
  ADD CONSTRAINT `FK_CR` FOREIGN KEY (`num_utilisateur`) REFERENCES `utilisateur` (`num`);

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `FK_stage` FOREIGN KEY (`num_tuteur`) REFERENCES `tuteur` (`num`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_Uuser` FOREIGN KEY (`num_stage`) REFERENCES `stage` (`num`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
