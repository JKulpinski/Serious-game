-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Sty 2019, 10:47
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `baza_prog_ob_spring`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `picture`
--

CREATE TABLE `picture` (
  `id` bigint(20) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `level` bigint(20) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `picture`
--

INSERT INTO `picture` (`id`, `answer`, `level`, `text`) VALUES
(1, 'jam', 1, 'food made from fruit'),
(2, 'honey', 1, 'sweet food made by bees'),
(3, 'sandwich', 1, 'slices of bread with ham'),
(4, 'berry', 1, 'small, round fruit'),
(5, 'carrot', 1, 'vegetable'),
(6, 'pine', 1, 'type of tall tree'),
(7, 'gooseberry', 1, 'fruit with a hairy skin'),
(8, 'rot', 1, 'fruit that starts to break'),
(9, 'ham', 1, 'meat'),
(10, 'pear', 1, 'oval-shaped, pale fruit');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `picture`
--
ALTER TABLE `picture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
