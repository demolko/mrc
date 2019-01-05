-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Gru 2018, 20:48
-- Wersja serwera: 10.1.30-MariaDB
-- Wersja PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mrc`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attention_crm`
--

CREATE TABLE `attention_crm` (
  `attention_crm_id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `state_attention_crm_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `attention_crm`
--

INSERT INTO `attention_crm` (`attention_crm_id`, `description`, `add_date`, `comment`, `comment_date`, `user_id`, `state_attention_crm_id`) VALUES
(1, 'Zbyt mała ilość rekordów na stronie głównej', '2018-02-17', 'Wykonane', '2018-02-19', 4, 1),
(2, 'Proszę o możliwość zmiany haseł u użytkowników', '2018-03-05', 'Hasła mogą być zmieniane jedynie przez administratora systemu', '2018-03-05', 3, 3),
(3, 'Mogę zmienić kolorek interfejsu na różowy?', '2018-03-11', '', '0000-00-00', 5, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attention_vr`
--

CREATE TABLE `attention_vr` (
  `attention_vr_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vr_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `attention_vr`
--

INSERT INTO `attention_vr` (`attention_vr_id`, `name`, `description`, `date`, `user_id`, `vr_id`) VALUES
(1, 'Mokra podłoga', 'Klient prosi o usunięcie mokrych plam z podłóg', '2018-06-05', 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `call_diary`
--

CREATE TABLE `call_diary` (
  `diary_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `change_info` varchar(255) DEFAULT NULL,
  `state_status_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `call_diary`
--

INSERT INTO `call_diary` (`diary_id`, `datetime`, `change_info`, `state_status_id`, `customer_id`, `user_id`) VALUES
(1, '2018-06-12 15:22:00', 'Klient chce oferte na wszystkie lokalizacje', 2, 1, 1),
(2, '2018-06-14 10:01:00', 'Bez zmian', 8, 1, 1),
(3, '2018-06-17 14:52:00', 'Bez zmian', 10, 1, 1),
(4, '2018-06-11 11:14:00', 'Brak', 5, 2, 1),
(5, '2018-05-22 12:52:00', 'Brak', 1, 3, 1),
(6, '2018-08-03 11:23:00', 'Zdjęcia nocne', 1, 4, 1),
(7, '2018-08-05 06:03:00', 'Bez zmian', 8, 4, 1),
(8, '2018-08-06 13:45:00', 'Należy dodać gwiazdy na niebie', 10, 4, 1),
(9, '2018-08-06 13:45:00', 'Bez zmian', 7, 4, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `computer_station`
--

CREATE TABLE `computer_station` (
  `computer_station_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `computer_station`
--

INSERT INTO `computer_station` (`computer_station_id`, `name`, `user_id`) VALUES
(1, 'Mac', 3),
(2, 'Studio', 2),
(3, 'Grafik', 4),
(4, 'Warsztat', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `e_mail` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `code_post` int(11) DEFAULT NULL,
  `trade` varchar(255) DEFAULT NULL,
  `www` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `phone`, `e_mail`, `street`, `city`, `province`, `code_post`, `trade`, `www`, `user_id`) VALUES
(1, 'Lidl', 123456789, 'info@lidl.com', 'Borowa', 'Rzeszów', 'Podkarpacie', 35, 'Sklep', 'www.lidl.com', 1),
(2, 'Auchan', 857151556, 'biuro@auchan.pl', 'Zygmuntowska', 'Krosno', 'Podkarpacie', 33, 'Sklep', 'www.auchan.pl', 1),
(3, 'Szew Sp. z o.o.', 657835638, 'szew@gmail.com', 'Polna', 'Katowice', 'Śląsk', 24, 'Pasmanteria', 'www.pasmanteria-szew.pl', 1),
(4, 'X-com', 853535753, 'pomoc@x-com.com', 'Franciszkańska', 'Warszawa', 'Mazowieckie', 32, 'Sklep', 'www.x-com.com', 1),
(5, 'Apollo', 598734853, 'apollo@wp.pl', 'Grunwaldzka', 'Rzeszów', 'Podkarpackie', 35, 'Sklep', 'www.apollo.pl', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `invoice_data`
--

CREATE TABLE `invoice_data` (
  `invoice_data_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nip` int(11) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `number_of_days` int(11) DEFAULT NULL,
  `cash` tinyint(1) DEFAULT NULL,
  `attention` varchar(255) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `edit_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `without_invoice` tinyint(1) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `invoice_data`
--

INSERT INTO `invoice_data` (`invoice_data_id`, `name`, `nip`, `street`, `city`, `province`, `amount`, `number_of_days`, `cash`, `attention`, `add_date`, `edit_date`, `end_date`, `without_invoice`, `customer_id`) VALUES
(1, 'Lidl', 111222333, 'Borowa', 'Rzeszów', 'Podkarpacie', 750, 7, 0, 'Brak', '2018-06-12', '2018-06-13', '2018-06-13', 0, 1),
(2, 'Auchan', 123098567, 'Zygmuntowska', 'Krosno', 'Podkarpacie', 1100, 7, 0, 'Brak', '2018-06-12', '2018-06-14', '2018-06-17', 0, 2),
(3, 'Szew Sp. z o.o.', 890567243, 'Polna', 'Katowice', 'Śląsk', 350, 7, 0, 'Brak', '2018-06-12', '2018-05-21', '2018-06-02', 0, 3),
(4, 'X-com', 579834573, 'Franciszkańska', 'Warszawa', 'Podkarpacie', 600, 7, 0, 'Faktura będzie wystawiona na inne dane', '2018-06-15', '2018-06-19', '2018-06-13', 1, 4),
(5, 'Apollo', 800900200, 'Grunwaldzka', 'Rzeszów', 'Mazowieckie', 3500, 7, 0, 'Brak', '2018-08-12', '2018-06-13', '2018-06-14', 0, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `messages`
--

CREATE TABLE `messages` (
  `messages_id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `read_date` date DEFAULT NULL,
  `star_memory` tinyint(1) DEFAULT NULL,
  `add_user_id` int(11) DEFAULT NULL,
  `receiving_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `messages`
--

INSERT INTO `messages` (`messages_id`, `subject`, `contents`, `add_date`, `read_date`, `star_memory`, `add_user_id`, `receiving_user_id`) VALUES
(1, 'Cześć', 'Witam wszystkim w MRC', '2018-05-05', '2018-05-05', 0, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mini_task`
--

CREATE TABLE `mini_task` (
  `mini_task_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `edit_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `adding_user_id` int(11) DEFAULT NULL,
  `edit_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `mini_task`
--

INSERT INTO `mini_task` (`mini_task_id`, `name`, `description`, `add_date`, `edit_date`, `end_date`, `status`, `adding_user_id`, `edit_user_id`) VALUES
(1, 'Wycena', '1000 szt. DL połysk 350g', '2018-05-12', '2018-05-17', '2018-05-16', 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders_crm`
--

CREATE TABLE `orders_crm` (
  `orders_crm_id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `orders_crm`
--

INSERT INTO `orders_crm` (`orders_crm_id`, `subject`, `contents`, `priority`, `add_date`, `end_date`) VALUES
(1, 'Lista użytkowników', 'Należy wyświetlić listę użytkowników na nowej podstronie.', 'end', '2018-08-04', '0000-00-00'),
(2, 'Dodawanie użytkowników', 'Należy utworzyć opcję dodawania nowych użytkowników do bazy.', 'end', '2018-08-05', '0000-00-00'),
(3, 'Usuwanie użytkowników', 'Należy utworzyć opcję usuwania użytkowników z bazy.', 'end', '2018-08-06', '0000-00-00'),
(4, 'Edycja użytkownika', 'Edycja', 'end', '2018-08-04', '0000-00-00'),
(5, 'Panel logowania', 'Panel logowania', 'end', '2018-08-04', '0000-00-00'),
(6, 'Wyświetlanie firm', ' dla poszczególnych użytkowników', 'end', '2018-08-04', '0000-00-00'),
(7, 'Dodawanie firm', 'Dodawanie firm', 'end', '2018-08-04', '0000-00-00'),
(8, 'Usuwanie firm', 'Usuwanie firm', 'end', '2018-08-04', '0000-00-00'),
(9, 'Edycja firm', 'Edycja firm', 'end', '2018-08-04', '0000-00-00'),
(10, 'Zarządzanie firmom', 'Zarządzanie firmom', 'end', '2018-08-04', '0000-00-00'),
(11, 'Dodanie do kokpitu ikon', 'Dodanie do kokpitu ikon', 'end', '2018-08-04', '0000-00-00'),
(12, 'Szukajka', 'Szukajka', 'end', '2018-08-04', '0000-00-00'),
(16, 'Naprawa przycisku dodaj zadanie CRM', 'Naprawa przycisku dodaj zadanie CRM', 'end', '2018-11-12', '0000-00-00'),
(17, 'Szukajka. Możliwe tylko jedno wyszukiwanie w tym samym oknie.', 'Szukajka. Możliwe tylko jedno wyszukiwanie w tym samym oknie.', 'end', '2018-11-12', '0000-00-00'),
(18, 'Szukajka. Obsługa graficzna brak wyników oraz gdy jest ich mało.', 'Szukajka. Obsługa graficzna brak wyników oraz gdy jest ich mało.', 'end', '2018-11-12', '0000-00-00'),
(19, 'Zmiana loga.', 'Zmiana loga.', 'end', '2018-11-12', '0000-00-00'),
(20, 'Baza firm. Możliwość aktualizacji stanu. [zobacz]', 'Baza firm. Możliwość aktualizacji stanu. [zobacz]', 'end', '2018-11-12', '0000-00-00'),
(21, 'Odświeżanie po akcjach.', 'Odświeżanie po akcjach.', 'end', '2018-11-12', '0000-00-00'),
(22, 'Ładniejsze komunikaty.', 'Ładniejsze komunikaty.', 'end', '2018-11-12', '0000-00-00'),
(23, 'Zmiana wyglądu dodawanie firmy.', 'Zmiana wyglądu dodawanie firmy.', 'end', '2018-11-12', '0000-00-00'),
(24, 'Zmiana wyglądu edytuj użytkownika.', 'Zmiana wyglądu edytuj użytkownika.', 'end', '2018-11-12', '0000-00-00'),
(25, 'Potwierdzenie przy usuwaniu użytkowników.', 'Potwierdzenie przy usuwaniu użytkowników.', 'end', '2018-11-12', '0000-00-00'),
(26, 'Zmiana wyglądu przy dodawaniu użytkownika.', 'Zmiana wyglądu przy dodawaniu użytkownika.', 'end', '2018-11-12', '0000-00-00'),
(27, 'Edycja użytkownika. Hasło zmieniane osobno.', 'Edycja użytkownika. Hasło zmieniane osobno.', 'end', '2018-11-12', '0000-00-00'),
(28, 'Refactoring', 'Refactoring', 'end', '2018-08-04', '0000-00-00'),
(29, 'Git', 'Git', 'normal', '2018-08-04', '0000-00-00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders_crm_list`
--

CREATE TABLE `orders_crm_list` (
  `orders_crm_list_id` int(11) NOT NULL,
  `orders_crm_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `orders_crm_list`
--

INSERT INTO `orders_crm_list` (`orders_crm_list_id`, `orders_crm_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `state_attention_crm`
--

CREATE TABLE `state_attention_crm` (
  `state_attention_crm_id` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `state_attention_crm`
--

INSERT INTO `state_attention_crm` (`state_attention_crm_id`, `state`) VALUES
(1, 'Zrealizowano'),
(2, 'Oczekujące'),
(3, 'Odmowa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `state_status`
--

CREATE TABLE `state_status` (
  `state_status_id` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `state_status`
--

INSERT INTO `state_status` (`state_status_id`, `state`) VALUES
(1, 'Zlecenie'),
(2, 'Rokujące'),
(3, 'Oferta podstawowa'),
(4, 'Odmowa'),
(5, 'Nie odbiera'),
(6, 'Nie aktualne'),
(7, 'Zrealizowano'),
(8, 'Zdjęcia'),
(9, 'Brak zdjęć'),
(10, 'Obróbka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `add_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `action_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `edit_time` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `date_e_mail` date DEFAULT NULL,
  `state_status_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `status`
--

INSERT INTO `status` (`status_id`, `add_date`, `end_date`, `action_date`, `action_time`, `edit_time`, `amount`, `description`, `date_e_mail`, `state_status_id`, `customer_id`) VALUES
(1, '2018-06-12', '2018-06-16', '2018-06-15', '2018-12-02 21:49:59', '0000-00-00', 754, 'Klient chce zdjęcia POI', '2018-06-08', 8, 1),
(2, '2018-06-14', '2018-06-21', '2018-06-15', '0000-00-00 00:00:00', '0000-00-00', 1100, 'Brak', '2018-06-01', 5, 2),
(3, '2018-05-21', '2018-05-28', '2018-05-21', '0000-00-00 00:00:00', '0000-00-00', 350, 'Brak', '2018-05-28', 1, 3),
(4, '2018-08-03', '2018-08-10', '2018-08-04', '0000-00-00 00:00:00', '0000-00-00', 3500, 'Należy zamazać plakat w wejściu.', '2018-06-07', 7, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_of_tasks`
--

CREATE TABLE `status_of_tasks` (
  `status_of_tasks_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `status_of_tasks`
--

INSERT INTO `status_of_tasks` (`status_of_tasks_id`, `name`) VALUES
(1, 'Pilne'),
(2, 'Normal'),
(3, 'Oczekujące'),
(4, 'Zakończone'),
(5, 'Nie zrealizowane');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tasks`
--

CREATE TABLE `tasks` (
  `tasks_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `edit_date` date DEFAULT NULL,
  `implementation_date` date DEFAULT NULL,
  `status_of_tasks_id` int(11) DEFAULT NULL,
  `adding_user_id` int(11) DEFAULT NULL,
  `responsible_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `tasks`
--

INSERT INTO `tasks` (`tasks_id`, `name`, `customer`, `add_date`, `end_date`, `edit_date`, `implementation_date`, `status_of_tasks_id`, `adding_user_id`, `responsible_user_id`) VALUES
(1, 'Ulotki', 'ModeCom', '2018-05-12', '2018-05-17', '2018-05-16', '2018-05-17', 2, 1, 1),
(2, 'Strona www', 'Accantus', '2018-06-11', '2018-06-27', '2018-06-16', '2018-06-17', 1, 2, 1),
(3, 'SEO', 'Pogromcy Sp. z o.o.', '2018-05-22', '2018-05-27', '2018-05-26', '2018-05-27', 3, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `task_comment`
--

CREATE TABLE `task_comment` (
  `task_comment_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `task_comment`
--

INSERT INTO `task_comment` (`task_comment_id`, `description`, `user_id`) VALUES
(1, 'Klient mówił coś o czerwieni i błękicie.', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `e_mail` varchar(255) DEFAULT NULL,
  `user_position_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `login`, `pass`, `name`, `surname`, `phone`, `e_mail`, `user_position_id`) VALUES
(1, 'MrcSystem', '$2y$10$2GFWYuErlUBSGssfO41Yt.eQAfCnl7lpkOeiIs2qm9ZAk5LYmrQlG', 'Michal', 'Knight', 123456789, 'michael@gmail.com', 1),
(2, 'Adminos', '$2y$10$3SC1ldsalMYxHj2FYF8Rj.uLf07Nupc/tDdpQkY3p9yGW1cpszi1i', 'Zofia', 'Mysza', 741258963, 'zos@onet.pl', 2),
(3, 'Spawacz', '$2y$10$8ILq2DKFKbydoYCggEu8m.zD9pPBC/hYiTYlxkHsFh1pk4qgMTCtm', 'Grzegorz', 'Fiołek', 987456321, 'garo@chata.de', 3),
(4, 'Iphone', '$2y$10$quKd6oZcz.9ueo6ORwNVaeqSfj1STA3ePrhz9tKbRvTGLi/ZfCbIq', 'Bartlomiej', 'Szyszak', 2147483647, 'baron@wp.pl', 4),
(5, 'Fotomaniak', '$2y$10$5xg2YGT8pLjRk3hesGBSFuS3GJbAvlI.w3SHAQPw.gmRlG/Khr8Iy', 'Patrycja', 'Sosna', 654789321, 'sosek@gmail.com', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_position`
--

CREATE TABLE `user_position` (
  `user_position_id` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `user_position`
--

INSERT INTO `user_position` (`user_position_id`, `position`) VALUES
(1, 'tworca'),
(2, 'adminek'),
(3, 'sprzedaz'),
(4, 'it'),
(5, 'fotograf');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vr`
--

CREATE TABLE `vr` (
  `vr_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `card_date` date DEFAULT NULL,
  `retouch_date` date DEFAULT NULL,
  `export_date` date DEFAULT NULL,
  `selection_date` date DEFAULT NULL,
  `render_date` date DEFAULT NULL,
  `nadir_date` date DEFAULT NULL,
  `panotour_date` date DEFAULT NULL,
  `serwer_date` date DEFAULT NULL,
  `link_serwer` varchar(255) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `link_zip` varchar(255) DEFAULT NULL,
  `google_link` varchar(255) DEFAULT NULL,
  `panoskin_data` date DEFAULT NULL,
  `vr_priority_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `computer_station_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `vr`
--

INSERT INTO `vr` (`vr_id`, `name`, `card_date`, `retouch_date`, `export_date`, `selection_date`, `render_date`, `nadir_date`, `panotour_date`, `serwer_date`, `link_serwer`, `payment_date`, `link_zip`, `google_link`, `panoskin_data`, `vr_priority_id`, `customer_id`, `computer_station_id`) VALUES
(1, 'Polańczyk', '2018-06-03', '2018-06-04', '2018-06-04', '2018-06-05', '2018-06-05', '2018-06-06', '2018-06-06', '2018-06-06', 'fotoklika.pl/myk.html', '2018-06-04', 'fotoklika.pl/myk.zip', 'google.com/spacer123321', '2018-06-08', 2, 2, 3),
(2, 'Mzaur', '2018-07-03', '2018-07-04', '2018-07-04', '2018-07-05', '2018-07-05', '2018-07-06', '2018-07-06', '2018-07-06', 'fotoklika.pl/myk2.html', '2018-07-04', 'fotoklika.pl/myk2.zip', 'google.com/spacer2222123321', '2018-07-08', 1, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vr_priority`
--

CREATE TABLE `vr_priority` (
  `vr_priority_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `vr_priority`
--

INSERT INTO `vr_priority` (`vr_priority_id`, `name`) VALUES
(1, 'Pilne'),
(2, 'Normal'),
(3, 'Oczekujące'),
(4, 'Zakończone');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `attention_crm`
--
ALTER TABLE `attention_crm`
  ADD PRIMARY KEY (`attention_crm_id`),
  ADD KEY `FK_user_id` (`user_id`),
  ADD KEY `FK_state_attention_crm_id` (`state_attention_crm_id`);

--
-- Indexes for table `attention_vr`
--
ALTER TABLE `attention_vr`
  ADD PRIMARY KEY (`attention_vr_id`),
  ADD KEY `FK_user_id_attention_vr` (`user_id`),
  ADD KEY `FK_vr_id_attention_vr` (`vr_id`);

--
-- Indexes for table `call_diary`
--
ALTER TABLE `call_diary`
  ADD PRIMARY KEY (`diary_id`),
  ADD KEY `FK_state_status_id_diary` (`state_status_id`),
  ADD KEY `FK_customer_id_diary` (`customer_id`),
  ADD KEY `FK_user_id_diary` (`user_id`);

--
-- Indexes for table `computer_station`
--
ALTER TABLE `computer_station`
  ADD PRIMARY KEY (`computer_station_id`),
  ADD KEY `FK_user_id_computer_station` (`user_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `FK_user_id_customer` (`user_id`);

--
-- Indexes for table `invoice_data`
--
ALTER TABLE `invoice_data`
  ADD PRIMARY KEY (`invoice_data_id`),
  ADD KEY `FK_customer_id_invoice_data` (`customer_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messages_id`),
  ADD KEY `FK_add_user_id_messages` (`add_user_id`),
  ADD KEY `FK_receiving_user_id_messages` (`receiving_user_id`);

--
-- Indexes for table `mini_task`
--
ALTER TABLE `mini_task`
  ADD PRIMARY KEY (`mini_task_id`),
  ADD KEY `FK_adding_user_id_mini_task` (`adding_user_id`),
  ADD KEY `FK_edit_user_id_mini_taks` (`edit_user_id`);

--
-- Indexes for table `orders_crm`
--
ALTER TABLE `orders_crm`
  ADD PRIMARY KEY (`orders_crm_id`);

--
-- Indexes for table `orders_crm_list`
--
ALTER TABLE `orders_crm_list`
  ADD PRIMARY KEY (`orders_crm_list_id`),
  ADD KEY `FK_orders_crm_id_orders_crm_list` (`orders_crm_id`);

--
-- Indexes for table `state_attention_crm`
--
ALTER TABLE `state_attention_crm`
  ADD PRIMARY KEY (`state_attention_crm_id`);

--
-- Indexes for table `state_status`
--
ALTER TABLE `state_status`
  ADD PRIMARY KEY (`state_status_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`),
  ADD KEY `FK_state_status_id_status` (`state_status_id`),
  ADD KEY `FK_customer_id_status` (`customer_id`);

--
-- Indexes for table `status_of_tasks`
--
ALTER TABLE `status_of_tasks`
  ADD PRIMARY KEY (`status_of_tasks_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`tasks_id`),
  ADD KEY `FK_status_of_tasks_id_tasks` (`status_of_tasks_id`),
  ADD KEY `FK_adding_user_id_tasks` (`adding_user_id`),
  ADD KEY `FK_responsible_user_id_taska` (`responsible_user_id`);

--
-- Indexes for table `task_comment`
--
ALTER TABLE `task_comment`
  ADD PRIMARY KEY (`task_comment_id`),
  ADD KEY `FK_user_id_task_comment` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_user_position` (`user_position_id`);

--
-- Indexes for table `user_position`
--
ALTER TABLE `user_position`
  ADD PRIMARY KEY (`user_position_id`);

--
-- Indexes for table `vr`
--
ALTER TABLE `vr`
  ADD PRIMARY KEY (`vr_id`),
  ADD KEY `FK_vr_priority_id_vr` (`vr_priority_id`),
  ADD KEY `FK_customer_id_vr` (`customer_id`),
  ADD KEY `FK_computer_station_id_vr` (`computer_station_id`);

--
-- Indexes for table `vr_priority`
--
ALTER TABLE `vr_priority`
  ADD PRIMARY KEY (`vr_priority_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `attention_crm`
--
ALTER TABLE `attention_crm`
  MODIFY `attention_crm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `attention_vr`
--
ALTER TABLE `attention_vr`
  MODIFY `attention_vr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `call_diary`
--
ALTER TABLE `call_diary`
  MODIFY `diary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `computer_station`
--
ALTER TABLE `computer_station`
  MODIFY `computer_station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `invoice_data`
--
ALTER TABLE `invoice_data`
  MODIFY `invoice_data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `messages`
--
ALTER TABLE `messages`
  MODIFY `messages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `mini_task`
--
ALTER TABLE `mini_task`
  MODIFY `mini_task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `orders_crm`
--
ALTER TABLE `orders_crm`
  MODIFY `orders_crm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `orders_crm_list`
--
ALTER TABLE `orders_crm_list`
  MODIFY `orders_crm_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `state_attention_crm`
--
ALTER TABLE `state_attention_crm`
  MODIFY `state_attention_crm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `state_status`
--
ALTER TABLE `state_status`
  MODIFY `state_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `status_of_tasks`
--
ALTER TABLE `status_of_tasks`
  MODIFY `status_of_tasks_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `tasks`
--
ALTER TABLE `tasks`
  MODIFY `tasks_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `task_comment`
--
ALTER TABLE `task_comment`
  MODIFY `task_comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `user_position`
--
ALTER TABLE `user_position`
  MODIFY `user_position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `vr`
--
ALTER TABLE `vr`
  MODIFY `vr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `vr_priority`
--
ALTER TABLE `vr_priority`
  MODIFY `vr_priority_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `attention_crm`
--
ALTER TABLE `attention_crm`
  ADD CONSTRAINT `FK_state_attention_crm_id` FOREIGN KEY (`state_attention_crm_id`) REFERENCES `state_attention_crm` (`state_attention_crm_id`),
  ADD CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `attention_vr`
--
ALTER TABLE `attention_vr`
  ADD CONSTRAINT `FK_user_id_attention_vr` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FK_vr_id_attention_vr` FOREIGN KEY (`vr_id`) REFERENCES `vr` (`vr_id`);

--
-- Ograniczenia dla tabeli `call_diary`
--
ALTER TABLE `call_diary`
  ADD CONSTRAINT `FK_customer_id_diary` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `FK_state_status_id_diary` FOREIGN KEY (`state_status_id`) REFERENCES `state_status` (`state_status_id`),
  ADD CONSTRAINT `FK_user_id_diary` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `computer_station`
--
ALTER TABLE `computer_station`
  ADD CONSTRAINT `FK_user_id_computer_station` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_user_id_customer` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `invoice_data`
--
ALTER TABLE `invoice_data`
  ADD CONSTRAINT `FK_customer_id_invoice_data` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Ograniczenia dla tabeli `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `FK_add_user_id_messages` FOREIGN KEY (`add_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FK_receiving_user_id_messages` FOREIGN KEY (`receiving_user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `mini_task`
--
ALTER TABLE `mini_task`
  ADD CONSTRAINT `FK_adding_user_id_mini_task` FOREIGN KEY (`adding_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FK_edit_user_id_mini_taks` FOREIGN KEY (`edit_user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `orders_crm_list`
--
ALTER TABLE `orders_crm_list`
  ADD CONSTRAINT `FK_orders_crm_id_orders_crm_list` FOREIGN KEY (`orders_crm_id`) REFERENCES `orders_crm` (`orders_crm_id`);

--
-- Ograniczenia dla tabeli `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `FK_customer_id_status` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `FK_state_status_id_status` FOREIGN KEY (`state_status_id`) REFERENCES `state_status` (`state_status_id`);

--
-- Ograniczenia dla tabeli `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `FK_adding_user_id_tasks` FOREIGN KEY (`adding_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FK_responsible_user_id_taska` FOREIGN KEY (`responsible_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FK_status_of_tasks_id_tasks` FOREIGN KEY (`status_of_tasks_id`) REFERENCES `status_of_tasks` (`status_of_tasks_id`);

--
-- Ograniczenia dla tabeli `task_comment`
--
ALTER TABLE `task_comment`
  ADD CONSTRAINT `FK_user_id_task_comment` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_user_position` FOREIGN KEY (`user_position_id`) REFERENCES `user_position` (`user_position_id`);

--
-- Ograniczenia dla tabeli `vr`
--
ALTER TABLE `vr`
  ADD CONSTRAINT `FK_computer_station_id_vr` FOREIGN KEY (`computer_station_id`) REFERENCES `computer_station` (`computer_station_id`),
  ADD CONSTRAINT `FK_customer_id_vr` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `FK_vr_priority_id_vr` FOREIGN KEY (`vr_priority_id`) REFERENCES `vr_priority` (`vr_priority_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
