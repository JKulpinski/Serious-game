-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Sty 2019, 18:15
-- Wersja serwera: 5.5.54
-- Wersja PHP: 7.2.12

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
                         `id`          bigint(20) NOT NULL,
                         `answer`      varchar(255) DEFAULT NULL,
                         `level`       bigint(20)   DEFAULT NULL,
                         `translation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `hangman`
--

INSERT INTO `hangman` (`id`, `answer`, `level`, `translation`)
VALUES (1, 'I am still learning...', 1, 'Wciaz sie ucze...'),
       (2, 'Do you have a minute?', 1, 'Czy masz chwile?'),
       (3, 'Hi, nice to meet you!', 1, 'Czesc, milo cie poznac!'),
       (4, 'Have a nice weekend.', 2, 'Milego weekendu.'),
       (5, 'No pain no gain.', 2, 'Bez pracy nie ma kolaczy'),
       (6, 'How are you?', 3, 'Jak sie masz?');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `language_info`
--

CREATE TABLE `language_info` (
                               `id`    bigint(20) NOT NULL,
                               `info`  varchar(255) DEFAULT NULL,
                               `level` bigint(20)   DEFAULT NULL
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
                         `id`     bigint(20) NOT NULL,
                         `answer` varchar(255) DEFAULT NULL,
                         `level`  bigint(20)   DEFAULT NULL,
                         `text`   varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `picture`
--

INSERT INTO `picture` (`id`, `answer`, `level`, `text`)
VALUES (1, 'one', 1, '1'),
       (2, 'two', 1, '2'),
       (3, 'three', 1, '3'),
       (4, 'four', 1, '4'),
       (5, 'five', 1, '5'),
       (6, 'six', 1, '6'),
       (7, 'seven', 1, '7'),
       (8, 'eight', 1, '8'),
       (9, 'nine', 1, '9'),
       (10, 'ten', 1, '10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rebus`
--

CREATE TABLE `rebus` (
                       `id`     bigint(20) NOT NULL,
                       `answer` varchar(255) DEFAULT NULL,
                       `level`  bigint(20)   DEFAULT NULL,
                       `rebus`  varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `rebus`
--

INSERT INTO `rebus` (`id`, `answer`, `level`, `rebus`)
VALUES (1, 'sandwich', 1, '1111.jpg'),
       (2, 'honey', 1, '1112.jpg'),
       (3, 'gooseberry', 1, '1113.jpg'),
       (4, 'jam', 1, '1114.jpg'),
       (5, 'carrot', 1, '1115.jpg'),
       (6, 'pineapple', 1, '1116.jpg'),
       (7, 'hotdog', 1, '1117.jpg'),
       (8, 'strawberry', 1, '1118.jpg'),
       (9, 'butterfly', 2, '2111.jpg'),
       (10, 'carpet', 3, '3111.jpg'),
       (11, 'doorbell', 3, '3112.jpg'),
       (12, 'cupboard', 3, '3113.jpg'),
       (13, 'bookshelf', 3, '3114.jpg'),
       (14, 'doormat', 3, '3115.jpg'),
       (15, 'armchair', 3, '3116.jpg'),
       (16, 'stepfather', 4, '4111.jpg'),
       (17, 'honeymoon', 4, '4112.jpg'),
       (18, 'childhood', 4, '4113.jpg'),
       (19, 'friendship', 4, '4114.jpg'),
       (20, 'triangle', 5, '5111.jpg'),
       (21, 'homework', 5, '5112.jpg'),
       (22, 'alphabet', 5, '5113.jpg'),
       (23, 'office', 5, '5114.jpg'),
       (24, 'feedback', 5, '5115.jpg'),
       (25, 'keyboard', 5, '5116.jpg'),
       (26, 'spacebar', 5, '5117.jpg'),
       (27, 'spiderman', 6, '6111.jpg'),
       (28, 'rebus', 6, '6112.jpg'),
       (29, 'sunbathe', 6, '6113.jpg'),
       (30, 'batman', 6, '6115.jpg'),
       (31, 'island', 6, '6116.jpg'),
       (32, 'pills', 7, '7111.jpg'),
       (33, 'heart', 7, '7112.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
                       `id`      bigint(20) NOT NULL,
                       `login`   varchar(255) DEFAULT NULL,
                       `email`   varchar(255) DEFAULT NULL,
                       `pass`    varchar(255) DEFAULT NULL,
                       `level`   bigint(20)   DEFAULT NULL,
                       `points`  int(11)      DEFAULT NULL,
                       `picture` bit(1)       DEFAULT NULL,
                       `hangman` bit(1)       DEFAULT NULL,
                       `rebus`   bit(1)       DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `pass`, `level`, `points`, `picture`, `hangman`, `rebus`)
VALUES (1, 'jonasz', 'jonkul001@gmail.com', 'aaa', 2, 22, b'0', b'1', b'1'),
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
       (24, 'naka', 'huc@utp.pl', 'aaa', 2, 11, b'0', b'0', b'0');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `language_info`
--
ALTER TABLE `language_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `picture`
--
ALTER TABLE `picture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;

--
-- AUTO_INCREMENT dla tabeli `rebus`
--
ALTER TABLE `rebus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 34;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
