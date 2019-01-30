-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 30 Sty 2019, 13:38
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
-- Struktura tabeli dla tabeli `language_info`
--

CREATE TABLE `language_info` (
  `id` bigint(20) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `level` bigint(20) DEFAULT NULL,
  `info_pl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `language_info`
--

INSERT INTO `language_info` (`id`, `info`, `level`, `info_pl`) VALUES
(1, 'That day we will take care of food and drink, which are essential in our journey. It is known that man is able to survive only a week without water and a month without food. That is why it is very important to collect some food!', 1, 'bla bla bla'),
(2, 'Every banana you eat is a clone. All bananas are genetic clones of the Cavendish variety.\r\n', 1, NULL),
(3, 'Potatoes can absorb and reflect Wi-fi signals.\r\n', 1, NULL),
(4, 'Honey will never ever go bad.\r\n', 1, NULL),
(5, 'Animals are human friends, let\'s get to know their English names! They can be friendly and dangerous. You need to know what are occurring in distant countries to deal with.\r\n', 2, NULL),
(6, 'Dogs\' sense of smell is about 100,000 times stronger than humans\', but they have just one-sixth our number of taste buds.\r\n', 2, NULL),
(7, 'Sharks kill fewer than 10 people per year. Humans kill about 100 million sharks per year.\r\n', 2, NULL),
(8, 'Wild dolphins call each other by name.\r\n', 2, NULL),
(9, 'Now we will know the names of objects in the house and the names of the different rooms.\r\n', 3, NULL),
(10, 'The Sultan of Brunei’s 2,152,782-square-foot, marble-laden home is the biggest house in the World.\r\n', 3, NULL),
(11, 'NASA Vehicle Assembly Building (32,374 square metres) is the biggest room in the World.\r\n', 3, NULL),
(12, 'Measuring 124 feet high, Falcon Nest in Prescott, Arizona is called \'the world\'s tallest single-family house\'.\r\n', 3, NULL),
(13, 'Everyone needs friends and family to be happy. Today we will learn English words related to relationships to get friends in other countries.\r\n', 4, NULL),
(14, 'More people in the world have learned English as a second language than there are native English speakers.\r\n', 4, NULL),
(15, 'The letter \"e\" is the most commonly used letter in the English language.\r\n', 4, NULL),
(16, 'The US doesn’t have an official language.\r\n', 4, NULL),
(17, 'Going to school and work is needed to live with dignity, although it is hard for many people. You will get acquainted with the most needed words.\r\n', 5, NULL),
(18, 'The students in China receive the most homework in the world. At an average, teenagers do a whopping 14 hours of homework in a week.\r\n', 5, NULL),
(19, 'Summer vacations in Chile start from mid-December and end in early March. That\'s 3 whole months away from school.\r\n', 5, NULL),
(20, 'Iran is one country where girls and boys are educated separately till the time they reach college.\r\n', 5, NULL),
(21, 'After work, there must be time for fun and rest! A portion of words related to entertainment.\r\n', 6, NULL),
(22, 'President Obama gets to watch advanced episodes of \'Game of Thrones\' episodes before the rest of the world.\r\n', 6, NULL),
(23, 'Mickey Mouse has a sister named Amelia Fieldmouse.\r\n', 6, NULL),
(24, 'The television show \'Dexter\' has been linked to 3 real life crimes.\r\n', 6, NULL),
(25, 'Health is the most important, so let\'s learn the names of diseases and ailments to be able to say abroad what\'s hurting us.', 7, NULL),
(26, 'Laughing is good for the heart and can increase blood flow by 20 percent.\r\n', 7, NULL),
(27, 'A lack of exercise now causes as many deaths as smoking.\r\n', 7, NULL),
(28, 'Writing things out by hand will help you remember them.\r\n', 7, NULL),
(29, 'Congratulations! You finished game! See curiosities!', 8, NULL),
(30, 'You received extra 25 points for complete the game!', 8, NULL),
(31, 'This game was made for Agile Programming course', 8, NULL),
(32, 'Greetings from Heraklion!', 8, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `language_info`
--
ALTER TABLE `language_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `language_info`
--
ALTER TABLE `language_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
