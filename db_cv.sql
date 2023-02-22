-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Lut 2023, 09:59
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `db_cv`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(10) NOT NULL,
  `activity` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `activities`
--

INSERT INTO `activities` (`activity_id`, `activity`) VALUES
(1, 'Rakrutacja osob'),
(1, 'Pomoc w zarzadzaniu'),
(2, 'Naprawa kompoterow'),
(2, 'Rozwiazywanie problemow z siecia'),
(3, 'Praca na kasie'),
(3, 'Ukladanie na polkach'),
(4, 'Sprzedawca'),
(4, 'Tworzenie bukietow');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `education`
--

CREATE TABLE `education` (
  `user_id` int(10) NOT NULL,
  `school_name` varchar(50) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `course_name` varchar(50) NOT NULL,
  `diploma` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `education`
--

INSERT INTO `education` (`user_id`, `school_name`, `address`, `course_name`, `diploma`, `start_date`, `end_date`) VALUES
(1, 'Wyzsza szkola informatyki', NULL, 'Technikum informatyczne', NULL, '2017-02-01', '2018-02-08'),
(1, NULL, NULL, 'Kurs naprawy kompoterow', NULL, '2020-02-13', '2020-08-20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `experience`
--

CREATE TABLE `experience` (
  `user_id` int(10) NOT NULL,
  `activity_id` int(10) NOT NULL,
  `company_name` varchar(35) NOT NULL,
  `locality` varchar(35) DEFAULT NULL,
  `job_position` varchar(35) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `experience`
--

INSERT INTO `experience` (`user_id`, `activity_id`, `company_name`, `locality`, `job_position`, `start_date`, `end_date`) VALUES
(1, 1, 'BIG company', 'Warszawa', 'IT_rekrutant', '2020-01-01', '2021-05-01'),
(1, 2, 'small company', 'Warszawa', 'IT_support', '2021-07-01', '2022-02-10'),
(2, 3, 'LIDL', 'Olsztyn', 'Sprzedawca', '2018-10-03', '2019-06-19'),
(2, 4, 'KwiacierniaSPRL', 'Ketrzyn', 'Sprzedawca', '2020-02-06', '2021-02-12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hobby`
--

CREATE TABLE `hobby` (
  `user_id` int(10) NOT NULL,
  `hobby` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `hobby`
--

INSERT INTO `hobby` (`user_id`, `hobby`) VALUES
(1, 'Czytanie ksiazek'),
(1, 'Podroze'),
(2, 'Lowienie ryb'),
(2, 'Kuchnia wloska');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_ID` int(10) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `login` varchar(25) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone_num` varchar(20) DEFAULT NULL,
  `e-mail` varchar(60) NOT NULL,
  `photo` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_ID`, `first_name`, `surname`, `login`, `password`, `phone_num`, `e-mail`, `photo`) VALUES
(1, 'Anna', 'Przybylska', 'AnitkaP', 'db43a87fe798d3e20c1dc43237e8d9518ee16064', '1111111111', 'Panna12@wp.pl', NULL),
(2, 'Brayan', 'Kowalski', 'Brayan12', '9f22900584e7fb469a526a53fd1f98bc62722fda', '2222222222', 'brayanC56@onet.pl', NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `activities`
--
ALTER TABLE `activities`
  ADD KEY `activity_id` (`activity_id`);

--
-- Indeksy dla tabeli `education`
--
ALTER TABLE `education`
  ADD KEY `education_id` (`user_id`);

--
-- Indeksy dla tabeli `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `hobby`
--
ALTER TABLE `hobby`
  ADD KEY `hobby_id` (`user_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `experience`
--
ALTER TABLE `experience`
  MODIFY `activity_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `experience` (`activity_id`);

--
-- Ograniczenia dla tabeli `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Ograniczenia dla tabeli `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Ograniczenia dla tabeli `hobby`
--
ALTER TABLE `hobby`
  ADD CONSTRAINT `hobby_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
