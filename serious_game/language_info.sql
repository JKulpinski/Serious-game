-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 30 Sty 2019, 16:17
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
  `info_pl` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `language_info`
--

INSERT INTO `language_info` (`id`, `info`, `level`, `info_pl`) VALUES
(1, 'That day we will take care of food and drink, which are essential in our journey. It is known that man is able to survive only a week without water and a month without food. That is why it is very important to collect some food!', 1, 'Tego dnia zajmiemy się jedzeniem i piciem, które są niezbędne w naszej podróży. Wiadomo, że człowiek jest w stanie przeżyć jedynie tydzień bez wody i miesiąc bez jedzenia. Dlatego jest bardzo ważne, żeby zebrać trochę prowiantu!'),
(2, 'Every banana you eat is a clone. All bananas are genetic clones of the Cavendish variety.\r\n', 1, 'Każdy banan, którego jesz, jest klonem. Wszystkie banany są genetycznymi klonami odmiany Cavendish.'),
(3, 'Potatoes can absorb and reflect Wi-Fi signals.\r\n', 1, 'Ziemniaki mogą wchłaniać i odbijać sygnały Wi-Fi.'),
(4, 'Honey will never ever go bad.\r\n', 1, 'Miód nigdy się nie zepsuje.'),
(5, 'Animals are human friends, let\'s get to know their English names! They can be friendly and dangerous. You need to know what are occurring in distant countries to deal with.\r\n', 2, 'Zwierzęta są przyjaciółmi człowieka, poznajmy ich angielskie nazwy! Potrafią być przyjazne i niebezpieczne. Trzeba wiedzieć jakie występują w dalekich krajach aby sobie poradzić.'),
(6, 'Dogs\' sense of smell is about 100,000 times stronger than humans\', but they have just one-sixth our number of taste buds.\r\n', 2, 'Węch psów jest około 100 000 razy silniejszy od ludzi, ale mają tylko jedną szóstą naszej liczby kubków smakowych.'),
(7, 'Sharks kill fewer than 10 people per year. Humans kill about 100 million sharks per year.\r\n', 2, 'Rekiny zabijają mniej niż 10 osób rocznie. Ludzie zabijają około 100 milionów rekinów rocznie.'),
(8, 'Wild dolphins call each other by name.\r\n', 2, 'Delfiny mówią do siebie po imieniu.'),
(9, 'Now we will know the names of objects in the house and the names of the different rooms.\r\n', 3, 'Teraz poznamy nazwy przedmiotów w domu i  pomieszczeń.'),
(10, 'The Sultan of Brunei’s 2,152,782-square-foot, marble-laden home is the biggest house in the World.\r\n', 3, 'Dwupiętrowy dom w stylu sułtana Brunei o powierzchni 2152 tys. stóp kwadratowych to największy dom na świecie.'),
(11, 'NASA Vehicle Assembly Building (32,374 square metres) is the biggest room in the World.\r\n', 3, 'Budynek Zgromadzenia Pojazdów NASA (32 374 metry kwadratowe) to największy pokój na świecie.'),
(12, 'Measuring 124 feet high, Falcon Nest in Prescott, Arizona is called \'the world\'s tallest single-family house\'.\r\n', 3, 'Mierzący 124 stopy Falcon Nest w Prescott w Arizonie jest nazywany \"największym na świecie domem jednorodzinnym\".'),
(13, 'Everyone needs friends and family to be happy. Today we will learn English words related to relationships to get friends in other countries.\r\n', 4, 'Każdy potrzebuje przyjaciół i rodziny aby być szczęśliwym. Dzisiaj nauczymy się angielskich słów związanych z relacjami, aby zdobywać przyjaciół w innych krajach.'),
(14, 'More people in the world have learned English as a second language than there are native English speakers.\r\n', 4, 'Więcej ludzi na świecie nauczyło się angielskiego jako drugiego języka, niż jest rodowitych Anglików.'),
(15, 'The letter \"e\" is the most commonly used letter in the English language.\r\n', 4, 'Litera \"e\" jest najczęściej używaną literą w języku angielskim.'),
(16, 'The US doesn’t have an official language.\r\n', 4, 'Stany Zjednoczone nie mają języka urzędowego.'),
(17, 'Going to school and work is needed to live with dignity, although it is hard for many people. You will get acquainted with the most needed words.\r\n', 5, 'Pójście do szkoły i pracy jest potrzebne, żeby godnie żyć, choć jest to dla wielu osób ciężka praca. Zapoznasz się z najbardziej potrzebnymi słówkami.'),
(18, 'The students in China receive the most homework in the world. At an average, teenagers do a whopping 14 hours of homework in a week.\r\n', 5, 'Uczniowie w Chinach otrzymują najwięcej zadań domowych na świecie. Przeciętnie nastolatkowie mają w ciągu tygodnia 14 godzin pracy domowej.'),
(19, 'Summer vacations in Chile start from mid-December and end in early March. That\'s 3 whole months away from school.\r\n', 5, 'Letnie wakacje w Chile rozpoczynają się od połowy grudnia i kończą na początku marca. To 3 miesiące od szkoły.'),
(20, 'Iran is one country where girls and boys are educated separately till the time they reach college.\r\n', 5, 'Iran jest jednym krajem, w którym dziewczęta i chłopcy kształcą się oddzielnie, aż do studiów.'),
(21, 'After work, there must be time for fun and rest! A portion of words related to entertainment.\r\n', 6, 'Po pracy musi być czas na zabawę i odpoczynek! Porcja wyrazów związanych z rozrywką.'),
(22, 'President Obama gets to watch advanced episodes of \'Game of Thrones\' episodes before the rest of the world.\r\n', 6, 'Prezydent Obama ogląda rozszerzone wersje odcinków \"Game of Thrones\" szybciej niż reszta świata.'),
(23, 'Mickey Mouse has a sister named Amelia Fieldmouse.\r\n', 6, 'Mickey Mouse ma siostrę o imieniu Amelia Fieldmouse.'),
(24, 'The television show \'Dexter\' has been linked to 3 real life crimes.\r\n', 6, 'Program telewizyjny \"Dexter\" został powiązany z 3 prawdziwymi zbrodniami.'),
(25, 'Health is the most important, so let\'s learn the names of diseases and ailments to be able to say abroad what\'s hurting us.', 7, 'Zdrowie jest najważniejsze, więc nauczmy się nazw chorób i dolegliwości, żeby móc powiedzieć za granicą, co nam dolega.'),
(26, 'Laughing is good for the heart and can increase blood flow by 20 percent.\r\n', 7, 'Śmiech jest dobry dla serca i może zwiększyć przepływ krwi o 20 procent.'),
(27, 'A lack of exercise now causes as many deaths as smoking.\r\n', 7, 'Brak ruchu powoduje obecnie tyle zgonów, co palenie.'),
(28, 'Writing things out by hand will help you remember them.\r\n', 7, 'Pisanie informacji odręcznie pomoże Ci je zapamiętać.'),
(29, 'Congratulations! You finished our game! See curiosities!', 8, 'Brawo! Ukończyłeś naszą grę! Zobacz ciekawostki!'),
(30, 'You received extra 25 points for complete the game!', 8, 'Otrzymujesz 25 punktów ekstra za ukończenie gry!'),
(31, 'This game was made for Agile Programming course.', 8, 'Ta gra została przygotowana na kurs Agile Programming.'),
(32, 'Greetings from Heraklion! :)', 8, 'Pozdrowienia z Heraklionu! :)');

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
