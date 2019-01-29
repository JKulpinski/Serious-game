-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Sty 2019, 15:13
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
(10, 'pear', 1, 'oval-shaped, pale fruit'),
(11, 'fly', 2, 'moves through the air'),
(12, 'bird', 2, 'has wings and feathers'),
(13, 'pet', 2, 'animal in a home'),
(14, 'bat', 2, 'flies at night'),
(15, 'spider', 2, 'creature with eight legs'),
(16, 'feed', 2, 'give food to animal'),
(17, 'turtle', 2, 'slow-moving reptile'),
(18, 'caterpillar', 2, 'long animal with many legs'),
(19, 'hamster', 2, 'pet similar to a mouse'),
(20, 'snake', 2, 'creature with no legs'),
(21, 'basement, cellar', 3, 'underneath the house'),
(22, 'bulb', 3, 'glass object'),
(23, 'library', 3, 'room with books'),
(24, 'attic', 3, 'under the roof'),
(25, 'shelf', 3, 'flat, horizontal board'),
(26, 'carpet', 3, 'cover floors'),
(27, 'flat', 3, 'set of rooms to live in'),
(28, 'laundry', 3, 'clothes need to be washed'),
(29, 'towel', 3, 'use for drying yourself'),
(30, 'bell', 3, 'make a ringing sound'),
(31, 'honeymoon', 4, 'after the wedding'),
(32, 'child', 4, 'young person'),
(33, 'family', 4, 'people who are related'),
(34, 'stepmother', 4, 'married your father'),
(35, 'sibling', 4, 'sister or brother'),
(36, 'relative', 4, 'member of your family'),
(37, 'marriage', 4, 'ceremony'),
(38, 'uncle', 4, 'brother of your mother'),
(39, 'grandfather', 4, 'father of your father'),
(40, 'spouse', 4, 'your husband or wife'),
(41, 'angle', 5, 'measure in degrees'),
(42, 'spacebar', 5, 'key on a keyboard'),
(43, 'employee', 5, 'is paid to work'),
(44, 'job, occupation', 5, 'regular work'),
(45, 'principal', 5, 'headteacher'),
(46, 'board', 5, 'flat piece of cut wood'),
(47, 'hood', 5, 'cover the head'),
(48, 'eraser, rubber', 5, 'remove the marks'),
(49, 'sharpener', 5, 'make pencils sharper'),
(50, 'desk', 5, 'you can work at it'),
(51, 'sunbathe', 6, 'lie in the sun'),
(52, 'hike', 6, 'long walk'),
(53, 'island', 6, 'land surrounded by water'),
(54, 'beach', 6, 'area with sand and sea'),
(55, 'straw', 6, 'tube made of plastic'),
(56, 'swim', 6, 'move through water'),
(57, 'funfair', 6, 'amusement park'),
(58, 'playground', 6, 'area where children play'),
(59, 'leisure', 6, 'free time'),
(60, 'run', 6, 'fast move'),
(61, 'health', 7, 'free from illness'),
(62, 'pill', 7, 'medicine'),
(63, 'blood', 7, 'red liquid'),
(64, 'throat', 7, 'front of the neck'),
(65, 'sore', 7, 'painful'),
(66, 'ill', 7, 'not feeling well'),
(67, 'nurse', 7, 'work in hospital'),
(68, 'headache', 7, 'pain inside a head'),
(69, 'hospital', 7, 'place for sick people'),
(70, 'flu', 7, 'infectious illness');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

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
