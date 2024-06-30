-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2024 at 11:57 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bertea`
--

-- --------------------------------------------------------

--
-- Table structure for table `corectiva`
--

CREATE TABLE `corectiva` (
  `cod_cerere` int(11) NOT NULL,
  `inventar` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `cine` varchar(255) DEFAULT NULL,
  `descriere` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `corectiva`
--

INSERT INTO `corectiva` (`cod_cerere`, `inventar`, `data`, `cine`, `descriere`) VALUES
(1, 'Inventar1', '2024-06-01', 'Cineva1', 'Descriere1'),
(2, 'Inventar2', '2024-07-01', 'Cineva2', 'Descriere2');

-- --------------------------------------------------------

--
-- Table structure for table `echipament`
--

CREATE TABLE `echipament` (
  `cod_echipament` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `denumire` varchar(255) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL,
  `inventar` varchar(255) DEFAULT NULL,
  `destinatie` varchar(255) DEFAULT NULL,
  `destinatie_de_baza` varchar(255) DEFAULT NULL,
  `destinatie_secundara` varchar(255) DEFAULT NULL,
  `data_cumparare` date DEFAULT NULL,
  `data_intare_in_serv` date DEFAULT NULL,
  `sfarsit_garantie` date DEFAULT NULL,
  `pret_achizitie` decimal(10,2) DEFAULT NULL,
  `cod_furnizor` int(11) DEFAULT NULL,
  `cod_producator` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `echipament`
--

INSERT INTO `echipament` (`cod_echipament`, `model`, `tip`, `marca`, `denumire`, `serie`, `inventar`, `destinatie`, `destinatie_de_baza`, `destinatie_secundara`, `data_cumparare`, `data_intare_in_serv`, `sfarsit_garantie`, `pret_achizitie`, `cod_furnizor`, `cod_producator`) VALUES
(1, 'Model1', 'Tip1', 'Marca1', 'Denumire1', 'Serie1', 'Inventar1', 'Destinatie1', 'DestinatieBaza1', 'DestinatieSecundara1', '2024-01-01', '2024-02-01', '2025-01-01', 1000.00, 1, 1),
(2, 'Model2', 'Tip2', 'Marca2', 'Denumire2', 'Serie2', 'Inventar2', 'Destinatie2', 'DestinatieBaza2', 'DestinatieSecundara2', '2024-03-01', '2024-04-01', '2025-03-01', 2000.00, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `furnizor`
--

CREATE TABLE `furnizor` (
  `cod_furnizor` int(11) NOT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `adresa` varchar(255) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `persoana_de_contact` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `furnizor`
--

INSERT INTO `furnizor` (`cod_furnizor`, `nume`, `adresa`, `telefon`, `persoana_de_contact`) VALUES
(1, 'Furnizor1', 'Adresa1', '0123456789', 'Contact1'),
(2, 'Furnizor2', 'Adresa2', '9876543210', 'Contact2');

-- --------------------------------------------------------

--
-- Table structure for table `interventie`
--

CREATE TABLE `interventie` (
  `cod_interventie` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `nume_firma` varchar(255) DEFAULT NULL,
  `nume_muncitor` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `specializare` varchar(255) DEFAULT NULL,
  `pret_manopera` decimal(10,2) DEFAULT NULL,
  `cod_tip` int(11) DEFAULT NULL,
  `descriere_operatii` varchar(255) DEFAULT NULL,
  `cod_piesa1` int(11) DEFAULT NULL,
  `cod_piesa2` int(11) DEFAULT NULL,
  `cod_piesa3` int(11) DEFAULT NULL,
  `cod_piesa4` int(11) DEFAULT NULL,
  `cod_piesa5` int(11) DEFAULT NULL,
  `cod_echipament` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `interventie`
--

INSERT INTO `interventie` (`cod_interventie`, `data`, `nume_firma`, `nume_muncitor`, `marca`, `specializare`, `pret_manopera`, `cod_tip`, `descriere_operatii`, `cod_piesa1`, `cod_piesa2`, `cod_piesa3`, `cod_piesa4`, `cod_piesa5`, `cod_echipament`) VALUES
(1, '2024-06-20', 'Firma1', 'Muncitor1', 'Marca1', 'Specializare1', 500.00, 1, 'DescriereOperatii1', 1, 2, NULL, NULL, NULL, 1),
(2, '2024-07-20', 'Firma2', 'Muncitor2', 'Marca2', 'Specializare2', 600.00, 2, 'DescriereOperatii2', 2, 1, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mesaje`
--

CREATE TABLE `mesaje` (
  `cod_mesaj` int(11) NOT NULL,
  `cine_trimite` int(11) DEFAULT NULL,
  `catre_cine` int(11) DEFAULT NULL,
  `continut` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mesaje`
--

INSERT INTO `mesaje` (`cod_mesaj`, `cine_trimite`, `catre_cine`, `continut`) VALUES
(1, 1, 2, 'Mesaj1'),
(2, 2, 1, 'Mesaj2');

-- --------------------------------------------------------

--
-- Table structure for table `piese`
--

CREATE TABLE `piese` (
  `cod_piesa` int(11) NOT NULL,
  `cod_producator` int(11) DEFAULT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL,
  `conditii_pastrare` varchar(255) DEFAULT NULL,
  `descriere` varchar(255) DEFAULT NULL,
  `inmagazinare` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `piese`
--

INSERT INTO `piese` (`cod_piesa`, `cod_producator`, `nume`, `serie`, `conditii_pastrare`, `descriere`, `inmagazinare`) VALUES
(1, 1, 'Piesa1', 'Serie1', 'Conditii1', 'Descriere1', 'Inmagazinare1'),
(2, 2, 'Piesa2', 'Serie2', 'Conditii2', 'Descriere2', 'Inmagazinare2');

-- --------------------------------------------------------

--
-- Table structure for table `preventiva`
--

CREATE TABLE `preventiva` (
  `cod_preventiva` int(11) NOT NULL,
  `inventar` varchar(255) DEFAULT NULL,
  `descriere` varchar(255) DEFAULT NULL,
  `data_programarii` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `preventiva`
--

INSERT INTO `preventiva` (`cod_preventiva`, `inventar`, `descriere`, `data_programarii`) VALUES
(1, 'Inventar1', 'DescrierePreventiva1', '2024-06-15'),
(2, 'Inventar2', 'DescrierePreventiva2', '2024-07-15');

-- --------------------------------------------------------

--
-- Table structure for table `producator`
--

CREATE TABLE `producator` (
  `cod_producator` int(11) NOT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `adresa` varchar(255) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `persoana_de_contact` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `producator`
--

INSERT INTO `producator` (`cod_producator`, `nume`, `adresa`, `telefon`, `persoana_de_contact`) VALUES
(1, 'Producator1', 'Adresa1', '0123456789', 'Contact1'),
(2, 'Producator2', 'Adresa2', '9876543210', 'Contact2');

-- --------------------------------------------------------

--
-- Table structure for table `stoc`
--

CREATE TABLE `stoc` (
  `cod_stoc` int(11) NOT NULL,
  `cod_furnizor` int(11) DEFAULT NULL,
  `cod_piesa` int(11) DEFAULT NULL,
  `cantitate` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stoc`
--

INSERT INTO `stoc` (`cod_stoc`, `cod_furnizor`, `cod_piesa`, `cantitate`) VALUES
(1, 1, 1, 100),
(2, 2, 2, 200);

-- --------------------------------------------------------

--
-- Table structure for table `tip`
--

CREATE TABLE `tip` (
  `cod_tip` int(11) NOT NULL,
  `cod_cerere` int(11) DEFAULT NULL,
  `cod_preventiva` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tip`
--

INSERT INTO `tip` (`cod_tip`, `cod_cerere`, `cod_preventiva`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `utilizator`
--

CREATE TABLE `utilizator` (
  `cod_utilizator` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `parola` varchar(255) DEFAULT NULL,
  `drepturi_acces` varchar(255) DEFAULT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `functie` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilizator`
--

INSERT INTO `utilizator` (`cod_utilizator`, `username`, `parola`, `drepturi_acces`, `nume`, `functie`) VALUES
(1, 'user1', 'parola1', 'admin', 'Nume1', 'Functie1'),
(2, 'user2', 'parola2', 'user', 'Nume2', 'Functie2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `corectiva`
--
ALTER TABLE `corectiva`
  ADD PRIMARY KEY (`cod_cerere`);

--
-- Indexes for table `echipament`
--
ALTER TABLE `echipament`
  ADD PRIMARY KEY (`cod_echipament`),
  ADD KEY `cod_furnizor` (`cod_furnizor`),
  ADD KEY `cod_producator` (`cod_producator`);

--
-- Indexes for table `furnizor`
--
ALTER TABLE `furnizor`
  ADD PRIMARY KEY (`cod_furnizor`);

--
-- Indexes for table `interventie`
--
ALTER TABLE `interventie`
  ADD PRIMARY KEY (`cod_interventie`),
  ADD KEY `cod_tip` (`cod_tip`),
  ADD KEY `cod_piesa1` (`cod_piesa1`),
  ADD KEY `cod_piesa2` (`cod_piesa2`),
  ADD KEY `cod_piesa3` (`cod_piesa3`),
  ADD KEY `cod_piesa4` (`cod_piesa4`),
  ADD KEY `cod_piesa5` (`cod_piesa5`),
  ADD KEY `cod_echipament` (`cod_echipament`);

--
-- Indexes for table `mesaje`
--
ALTER TABLE `mesaje`
  ADD PRIMARY KEY (`cod_mesaj`),
  ADD KEY `cine_trimite` (`cine_trimite`),
  ADD KEY `catre_cine` (`catre_cine`);

--
-- Indexes for table `piese`
--
ALTER TABLE `piese`
  ADD PRIMARY KEY (`cod_piesa`),
  ADD KEY `cod_producator` (`cod_producator`);

--
-- Indexes for table `preventiva`
--
ALTER TABLE `preventiva`
  ADD PRIMARY KEY (`cod_preventiva`);

--
-- Indexes for table `producator`
--
ALTER TABLE `producator`
  ADD PRIMARY KEY (`cod_producator`);

--
-- Indexes for table `stoc`
--
ALTER TABLE `stoc`
  ADD PRIMARY KEY (`cod_stoc`),
  ADD KEY `cod_furnizor` (`cod_furnizor`),
  ADD KEY `cod_piesa` (`cod_piesa`);

--
-- Indexes for table `tip`
--
ALTER TABLE `tip`
  ADD PRIMARY KEY (`cod_tip`),
  ADD KEY `cod_cerere` (`cod_cerere`),
  ADD KEY `cod_preventiva` (`cod_preventiva`);

--
-- Indexes for table `utilizator`
--
ALTER TABLE `utilizator`
  ADD PRIMARY KEY (`cod_utilizator`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
