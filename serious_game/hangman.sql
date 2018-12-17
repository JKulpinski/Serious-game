-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Gru 2018, 10:05
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
-- Struktura tabeli dla tabeli `hangman`
--

CREATE TABLE `hangman` (
  `id` bigint(20) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `level` bigint(20) DEFAULT NULL,
  `translation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `hangman`
--

INSERT INTO `hangman` (`id`, `answer`, `level`, `translation`) VALUES
(1, 'I am still learning...', 1, 'Wciaz sie ucze...'),
(2, 'Do you have a minute?', 1, 'Czy masz chwile?'),
(3, 'Hi, nice to meet you!', 1, 'Czesc, milo cie poznac!'),
(4, 'Have a nice weekend.', 2, 'Milego weekendu.'),
(5, 'No pain no gain.', 2, 'Bez pracy nie ma kolaczy'),
(6, 'How are you?', 3, 'Jak sie masz?');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `hangman`
--
ALTER TABLE `hangman`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `hangman`
--
ALTER TABLE `hangman`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
