-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 30 Sty 2019, 19:40
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
  `answer` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `level` bigint(20) DEFAULT NULL,
  `translation` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `hangman`
--

INSERT INTO `hangman` (`id`, `answer`, `level`, `translation`) VALUES
(1, 'Would you like something to eat?', 1, 'Czy chciałbyś coś do jedzenia?'),
(2, 'She is cooking dinner.', 1, 'Ona gotuje obiad.'),
(3, 'I will prepare the food.', 1, 'Przygotuję jedzenie.'),
(4, 'He\'s eating an apple.', 1, 'On je jabłko.'),
(5, 'How many animals do you have?', 2, 'Ile masz zwierząt?'),
(6, 'I walk my dog every day.', 2, 'Codziennie chodzę z psem na spacer.'),
(7, 'She has two cats and three dogs.', 2, 'Ona ma dwa koty i trzy psy.'),
(8, 'I don\'t like birds.', 2, 'Nie lubię ptaków.'),
(9, 'Can I have breakfast in my room?', 3, 'Czy mogę zjeść śniadanie w swoim pokoju?'),
(10, 'We\'ll meet at your house.', 3, 'Spotkamy się w twoim domu.'),
(11, 'There\'s no place like home!', 3, 'Nie ma jak w domu!'),
(12, 'His flat is very big.', 3, 'To mieszkanie jest bardzo duże'),
(13, 'My father works in a bank.', 4, 'Mój ojciec pracuje w banku.'),
(14, 'I\'m going shopping with my mother.', 4, 'Jadę na zakupy z moją mamą.'),
(15, 'How old is your brother?', 4, 'Ile lat ma twój brat?'),
(16, 'I\'ll always be your friend.', 4, 'Zawszę będę twoim przyjacielem.'),
(17, 'I am still learning...', 5, 'Wciąż się uczę...'),
(18, 'No pain no gain.', 5, 'Bez pracy nie ma kołaczy.'),
(19, 'How was school today?', 5, 'Jak minął dzień zajęć w szkole?'),
(20, 'Where do you work?', 5, 'Gdzie pracujesz?'),
(21, 'Hi, nice to meet you!', 6, 'Cześć, miło cię poznać!'),
(22, 'Have a nice weekend.', 6, 'Miłego weekendu.'),
(23, 'Let\'s go for a walk on the beach.', 6, 'Chodźmy na plażę na spacer.'),
(24, 'The children are playing in a garden.', 6, 'Dzieci bawią się w ogrodzie.'),
(25, 'His body was strong and healthy.', 7, 'Jego ciało było silne i zdrowe.'),
(26, 'I\'ll take you to a doctor.', 7, 'Wezmę cię do doktora.'),
(27, 'I have a sore throat.', 7, 'Mam bolące gardło.'),
(28, 'Vegetables are very healthy.', 7, 'Warzywa są bardzo zdrowe.');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
