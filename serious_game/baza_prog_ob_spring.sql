-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Sty 2019, 20:47
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
(9, 'Do you have a minute?', 3, 'Czy masz chwilę?'),
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
(21, 'Hi, nice to meet you!', 5, 'Cześć, miło cię poznać!'),
(22, 'Have a nice weekend.', 5, 'Miłego weekendu.'),
(23, 'Let\'s go for a walk on the beach.', 5, 'Chodźmy na plażę na spacer.'),
(24, 'The children are playing in a garden.', 5, 'Dzieci bawią się w ogrodzie.'),
(25, 'His body was strong and healthy.', 6, 'Jego ciało było silne i zdrowe.'),
(26, 'I\'ll take you to a doctor.', 6, 'Wezmę cię do doktora.'),
(27, 'I have a sore throat.', 6, 'Mam bolące gardło.'),
(28, 'Vegetables are very healthy.', 6, 'Warzywa są bardzo zdrowe.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `language_info`
--

CREATE TABLE `language_info` (
  `id` bigint(20) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `level` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `language_info`
--

INSERT INTO `language_info` (`id`, `info`, `level`) VALUES
(1, 'Hello World!', 1),
(2, 'English is strange', 1),
(3, 'And hard', 1),
(4, 'And easy', 1),
(5, 'This is second level!', 2),
(6, 'Very hard', 2),
(7, 'Harder', 2),
(8, 'The hardest', 2);

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rebus`
--

CREATE TABLE `rebus` (
  `id` bigint(20) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `level` bigint(20) DEFAULT NULL,
  `rebus` varchar(255) DEFAULT NULL,
  `translation_pl` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `rebus`
--

INSERT INTO `rebus` (`id`, `answer`, `level`, `rebus`, `translation_pl`) VALUES
(1, 'sandwich', 1, '1111.jpg', 'kanapka'),
(2, 'honey', 1, '1112.jpg', 'miód'),
(3, 'gooseberry', 1, '1113.jpg', 'agrest'),
(4, 'jam', 1, '1114.jpg', 'dżem'),
(5, 'carrot', 1, '1115.jpg', 'marchewka'),
(6, 'pineapple', 1, '1116.jpg', 'ananas'),
(7, 'hotdog', 1, '1117.jpg', 'hotdog'),
(8, 'strawberry', 1, '1118.jpg', 'truskawka'),
(9, 'butterfly', 2, '2111.jpg', 'motyl'),
(10, 'carpet', 3, '3111.jpg', 'dywan'),
(11, 'doorbell', 3, '3112.jpg', 'dzwonek do drzwi'),
(12, 'cupboard', 3, '3113.jpg', 'szafka kuchenna, kredens'),
(13, 'bookshelf', 3, '3114.jpg', 'półka na książki'),
(14, 'doormat', 3, '3115.jpg', 'wycieraczka'),
(15, 'armchair', 3, '3116.jpg', 'fotel'),
(16, 'stepfather', 4, '4111.jpg', 'ojczym'),
(17, 'honeymoon', 4, '4112.jpg', 'miesiąc miodowy'),
(18, 'childhood', 4, '4113.jpg', 'dzieciństwo'),
(19, 'friendship', 4, '4114.jpg', 'przyjaźń'),
(20, 'triangle', 5, '5111.jpg', 'trójkąt'),
(21, 'homework', 5, '5112.jpg', 'praca domowa'),
(22, 'alphabet', 5, '5113.jpg', 'alfabet'),
(23, 'office', 5, '5114.jpg', 'biuro'),
(24, 'feedback', 5, '5115.jpg', 'informacja zwrotna'),
(25, 'keyboard', 5, '5116.jpg', 'klawiatura'),
(26, 'spacebar', 5, '5117.jpg', 'klawisz spacji'),
(27, 'spiderman', 6, '6111.jpg', 'spiderman'),
(28, 'rebus', 6, '6112.jpg', 'rebus'),
(29, 'sunbathe', 6, '6113.jpg', 'opalać się'),
(30, 'batman', 6, '6115.jpg', 'batman'),
(31, 'island', 6, '6116.jpg', 'wyspa'),
(32, 'pills', 7, '7111.jpg', 'tabletki'),
(33, 'heart', 7, '7112.jpg', 'serce'),
(34, 'icecream', 6, '6114.jpg', 'lody'),
(35, 'familytree', 6, '4115.jpg', 'drzewo genealogiczne');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `level` bigint(20) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `picture` bit(1) DEFAULT NULL,
  `hangman` bit(1) DEFAULT NULL,
  `rebus` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `pass`, `level`, `points`, `picture`, `hangman`, `rebus`) VALUES
(1, 'jonasz', 'jonkul001@gmail.com', 'aaa', 2, 22, b'0', b'1', b'1'),
(2, 'nalia', 'jonakul001@gmail.com', 'aaa', 2, 3, b'0', b'0', b'0'),
(3, 'sss', 'arybka68@gmail.com', 'aaa', 2, 11, b'0', b'0', b'1'),
(4, 'aaa1', 'jonkul001a@gmail.com', 'aaa1', 1, 0, b'0', b'0', b'0'),
(5, 'gds', 'jonaakul001@gmail.com', 'aaa', 1, 2, b'0', b'1', b'0'),
(6, 'aaaa', 'aaaa@aa.com', 'aaaa', 1, 0, b'0', b'0', b'0'),
(7, 'rwq', 'jonkul44001@gmail.com', 'bbb', 1, 0, b'0', b'0', b'0'),
(8, 'aaaaa', 'jonkuaaal001@gmail.com', 'aaa', 1, 2, b'0', b'1', b'0'),
(9, 'ssss', 'jonkwfwul001@gmail.com', 'aaa', 1, 0, b'0', b'0', b'0'),
(10, 'zzz', 'jonddkul001@gmail.com', 'aaa', 1, 3, b'1', b'0', b'0'),
(11, 'ggg', 'jonkugggl001@gmail.com', 'aaa', 2, 8, b'0', b'0', b'0'),
(12, 'jonasz11', 'jonkulggdsg001@gmail.com', '1111', 1, 0, b'0', b'0', b'0'),
(13, 'qqq', 'jonkul0ddd01@gmail.com', 'aaa', 1, 5, b'1', b'1', b'0'),
(14, 'reyy44', 'jonkusssl001@gmail.com', 'aaa', 1, 0, b'0', b'0', b'0'),
(15, 'tasos', 'tasos@bile.gr', '123456', 2, 7, b'0', b'0', b'0'),
(16, 'aaa111111', 'jo44445nkul001@gmail.com', 'aaa', 2, 7, b'0', b'0', b'0'),
(17, 'aaaaaaaaaaaa', 'jonkul00gggggg1@gmail.com', 'aaa', 1, 3, b'1', b'0', b'0'),
(18, 'qqqqq', 'jonddddfesgekul001@gmail.com', 'aaa', 1, 5, b'1', b'0', b'1'),
(19, 'jon', 'aaaa@gt.po', 'aaa', 1, 2, b'0', b'1', b'0'),
(20, 'ttt', 'jonkul0gdshddsj01@gmail.com', 'aaaa', 2, 8, b'0', b'0', b'0'),
(21, 'iop', 'jonk54757584ul001@gmail.com', 'aaa', 1, 0, b'0', b'0', b'0'),
(22, 'bbb', 'bbb@wp.com', 'aaa', 1, 2, b'0', b'0', b'1'),
(23, 'abb', 'jonkul0gwewhwehewhewrsdfc01@gmail.com', 'aaa', 1, 5, b'1', b'0', b'1'),
(24, 'naka', 'huc@utp.pl', 'aaa', 2, 11, b'0', b'0', b'0'),
(25, 'admin', 'admin@gmail.com', 'admin', 1, 7, b'0', b'0', b'1');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `hangman`
--
ALTER TABLE `hangman`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `language_info`
--
ALTER TABLE `language_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rebus`
--
ALTER TABLE `rebus`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `hangman`
--
ALTER TABLE `hangman`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT dla tabeli `language_info`
--
ALTER TABLE `language_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `picture`
--
ALTER TABLE `picture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `rebus`
--
ALTER TABLE `rebus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
