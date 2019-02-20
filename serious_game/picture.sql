-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Lut 2019, 22:09
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
(8, 'rot', 1, 'fruit starts to break'),
(9, 'ham', 1, 'meat'),
(10, 'pear', 1, 'oval-shaped, pale fruit'),
(11, 'fly', 2, 'moves through the air'),
(12, 'bird', 2, 'has wings and feathers'),
(13, 'pet', 2, 'animal in a home'),
(14, 'bat', 2, 'flies at night'),
(15, 'spider', 2, 'creature with eight legs'),
(16, 'feed', 2, 'give food to animal'),
(17, 'turtle', 2, 'slow-moving reptile'),
(18, 'caterpillar', 2, 'long with many legs'),
(19, 'hamster', 2, 'pet similar to a mouse'),
(20, 'snake', 2, 'creature with no legs'),
(21, 'basement, cellar', 3, 'underneath the house'),
(22, 'bulb', 3, 'glass object'),
(23, 'library', 3, 'room with books'),
(24, 'attic', 3, 'under the roof'),
(25, 'shelf', 3, 'flat, horizontal board'),
(26, 'carpet', 3, 'cover floors'),
(27, 'flat', 3, 'set of rooms to live in'),
(28, 'laundry', 3, 'clothes to be washed'),
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
