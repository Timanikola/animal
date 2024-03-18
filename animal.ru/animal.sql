-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 18 2024 г., 16:46
-- Версия сервера: 10.4.25-MariaDB
-- Версия PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `animal`
--

-- --------------------------------------------------------

--
-- Структура таблицы `animals`
--

CREATE TABLE `animals` (
  `id_animal` int(11) NOT NULL,
  `lenth` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `lifeStatus` int(1) DEFAULT NULL,
  `chipperId` int(11) DEFAULT NULL,
  `chippingLocationId` int(11) DEFAULT NULL,
  `chippingDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `deathDateTime` datetime DEFAULT NULL,
  `type_animal` int(11) DEFAULT NULL,
  `name_animal` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `animals`
--

INSERT INTO `animals` (`id_animal`, `lenth`, `height`, `gender`, `lifeStatus`, `chipperId`, `chippingLocationId`, `chippingDateTime`, `deathDateTime`, `type_animal`, `name_animal`) VALUES
(52, 23, 35, 1, 1, 1, NULL, '2023-07-04 00:59:03', NULL, 2, 'Skyline Gtr r34'),
(53, 301, 51, 1, 1, 1, NULL, '2023-07-04 01:45:34', NULL, 20, 'Silvia s15'),
(54, 290, 90, 1, 1, 1, NULL, '2023-07-04 01:49:08', NULL, 1, 'Skyline Gtr r32'),
(55, 20, 200, 1, 1, 1, NULL, '2023-07-05 15:40:10', NULL, 5, 'Пантера'),
(56, 50, 20, 0, 1, 40, NULL, '2023-07-06 23:47:18', NULL, 1, 'буся');

-- --------------------------------------------------------

--
-- Структура таблицы `location_animal`
--

CREATE TABLE `location_animal` (
  `id` int(11) NOT NULL,
  `id_animal` int(11) DEFAULT NULL,
  `visitedLocations` varchar(250) DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT current_timestamp(),
  `end_date` datetime DEFAULT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `location_animal`
--

INSERT INTO `location_animal` (`id`, `id_animal`, `visitedLocations`, `start_date`, `end_date`, `latitude`, `longitude`) VALUES
(52, 52, NULL, '2023-07-04 00:59:03', NULL, 16, 44),
(53, 53, NULL, '2023-07-04 01:45:34', NULL, 67, 77),
(54, 54, NULL, '2023-07-04 01:49:08', NULL, 60, 40),
(55, 55, NULL, '2023-07-05 15:40:10', NULL, 25, 50),
(56, 56, NULL, '2023-07-06 23:47:18', NULL, 55, 88);

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `path` varchar(250) NOT NULL,
  `id_animal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `photos`
--

INSERT INTO `photos` (`id`, `path`, `id_animal`) VALUES
(1, 'nissan-skyline-gtr-r34-v-spec-6008.jpg', 52),
(2, 'nissan-silvia-s15-spec-r-jdm.jpg', 53),
(3, 'gtr32.jpg', 54),
(4, '8874-744de-8148603-m750x740-ufca35.jpg', 55),
(5, 'i.jpeg', 56);

-- --------------------------------------------------------

--
-- Структура таблицы `types_animal`
--

CREATE TABLE `types_animal` (
  `typeId` int(11) NOT NULL,
  `typeName` varchar(100) DEFAULT NULL,
  `path` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `types_animal`
--

INSERT INTO `types_animal` (`typeId`, `typeName`, `path`) VALUES
(1, 'кошка', '17b100a0bcbc6e5e8d11101cde21aca7.jpeg'),
(2, 'собака', '1ad32de01c3b5950abdab32cf250a1cd.jpeg'),
(3, 'белка', '1648958402_10-vsegda-pomnim-com-p-belka-lesnaya-foto-11.jpg'),
(4, 'медведь', 'maxresdefault.jpg'),
(5, 'ёжик', '145199_orig.jpg'),
(6, 'орел', 'bald-eagle-shallow-focus-photography-american-eagle-wallpaper.jpg'),
(7, 'волк', 'wolf.jpg'),
(8, 'лиса', '1662063669_52-adonius-club-p-snyusovii-lis-zhivotnie-krasivo-foto-64.jpg'),
(9, 'кабан', 'h8sb1zjrTW_Z6WI2yk6gtQ.jpeg'),
(10, 'заяц', 'GAKFFpaqCc8.jpg'),
(11, 'попугай', 'post_5d87f0f0e6bb2.jpg'),
(12, 'морская свинка', '6c4928a24fc5b054e906bd7c9418d8ee.jpeg'),
(20, 'шакал', 'look.com.ua-371624.jpg'),
(21, 'суслик', 'dsc01001-1.jpg'),
(22, 'баран', '1674709850_3-168.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `_user`
--

CREATE TABLE `_user` (
  `ID` int(11) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Patronymic` varchar(50) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `About` text DEFAULT NULL,
  `User_name` varchar(50) DEFAULT NULL,
  `Pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `_user`
--

INSERT INTO `_user` (`ID`, `Email`, `Surname`, `Name`, `Patronymic`, `Birthday`, `About`, `User_name`, `Pass`) VALUES
(1, 'st27i@list.ru', 'Николаев', 'Тимофей', 'Георгиевич', '2003-03-10', 'разработчик сайтов', 'Humble', '81dc9bdb52d04dc20036dbd8313ed055'),
(2, 'z_goldin@mail.ru', 'Гольдин', 'Георгрий', 'Михайлович', '2003-02-08', 'Программист и тьютор', 'Русский Таракаша', 'd93591bdf7860e1e4ee2fca799911215'),
(28, 'bulba@mail.ru', 'иван', 'дмытро', 'викторович', '2023-04-08', NULL, 'bulba', 'e10adc3949ba59abbe56e057f20f883e'),
(34, 'bububu@mail.tu', 'shdfghfdg', 'fghdfhgdfgh', 'fdghfdghfd', '2023-04-22', NULL, 'dfghdfgh', 'e10adc3949ba59abbe56e057f20f883e'),
(35, 'st28i@list.ru', 'shdfghfdg', 'fghdfhgdfgh', 'dfghdfghfdgh', '2023-04-03', NULL, 'fgjhfghdfgj', 'e10adc3949ba59abbe56e057f20f883e'),
(36, 'st29i@list.ru', 'shdfghfdg', 'fsghfgh', 'fdghfdghfd', '2023-04-16', NULL, 'fghfdghg', 'e10adc3949ba59abbe56e057f20f883e'),
(37, 'st30i@list.ru', 'wrtyuertu', 'ruerer', 'uertuetu', '2023-04-08', NULL, 'ertuerture', 'e10adc3949ba59abbe56e057f20f883e'),
(40, 'kirr@mail.ru', 'Алексей', 'Громов', 'Генадиевич', '2000-06-15', NULL, 'kirr', 'c5fe25896e49ddfe996db7508cf00534');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `chipperId` (`chipperId`),
  ADD KEY `type_animal` (`type_animal`);

--
-- Индексы таблицы `location_animal`
--
ALTER TABLE `location_animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_animal` (`id_animal`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_animal` (`id_animal`);

--
-- Индексы таблицы `types_animal`
--
ALTER TABLE `types_animal`
  ADD PRIMARY KEY (`typeId`);

--
-- Индексы таблицы `_user`
--
ALTER TABLE `_user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `animals`
--
ALTER TABLE `animals`
  MODIFY `id_animal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `location_animal`
--
ALTER TABLE `location_animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `types_animal`
--
ALTER TABLE `types_animal`
  MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `_user`
--
ALTER TABLE `_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`chipperId`) REFERENCES `_user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `animals_ibfk_2` FOREIGN KEY (`type_animal`) REFERENCES `types_animal` (`typeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `location_animal`
--
ALTER TABLE `location_animal`
  ADD CONSTRAINT `location_animal_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animals` (`id_animal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animals` (`id_animal`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
