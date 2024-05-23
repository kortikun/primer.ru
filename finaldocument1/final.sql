-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 23 2024 г., 13:33
-- Версия сервера: 5.7.39
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `final`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `repair_parts`
--

CREATE TABLE `repair_parts` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `home_tech_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_tech_model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `problem_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_status_id` int(11) NOT NULL DEFAULT '1',
  `completion_date` date NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `request_master`
--

CREATE TABLE `request_master` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `request_repair_parts`
--

CREATE TABLE `request_repair_parts` (
  `id` int(11) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `count` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `repair_parts_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `request_status`
--

CREATE TABLE `request_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `surname`, `name`, `patronymic`, `phone`, `login`, `password`, `user_role_id`) VALUES
(1, 'Трубин', 'Никита ', 'Юрьевич', '89210563128', 'kasoo', 'root', 1),
(2, 'Мурашов', 'Андрей', 'Юрьевич', '89535078985', 'murashov123', 'qwerty', 2),
(3, 'Перина', 'Анастасия', 'Денисовна', '89990563748', 'perinaAD', '250519', 3),
(4, 'Баранова', 'Эмилия', 'Марковна', '89994563841', 'login2', 'pass2', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_role`
--

INSERT INTO `user_role` (`id`, `name`, `code`) VALUES
(1, 'Менеджер', 'manager'),
(2, 'Мастер', 'master'),
(3, 'Оператор', 'operator'),
(4, 'Заказчик', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `master_id` (`master_id`);

--
-- Индексы таблицы `repair_parts`
--
ALTER TABLE `repair_parts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_status_id` (`request_status_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `request_master`
--
ALTER TABLE `request_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `master_id` (`master_id`);

--
-- Индексы таблицы `request_repair_parts`
--
ALTER TABLE `request_repair_parts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `repair_parts_id` (`repair_parts_id`);

--
-- Индексы таблицы `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`);

--
-- Индексы таблицы `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `repair_parts`
--
ALTER TABLE `repair_parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `request_master`
--
ALTER TABLE `request_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `request_repair_parts`
--
ALTER TABLE `request_repair_parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `request_status`
--
ALTER TABLE `request_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`request_status_id`) REFERENCES `request_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `request_master`
--
ALTER TABLE `request_master`
  ADD CONSTRAINT `request_master_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_master_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `request_repair_parts`
--
ALTER TABLE `request_repair_parts`
  ADD CONSTRAINT `request_repair_parts_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_repair_parts_ibfk_2` FOREIGN KEY (`repair_parts_id`) REFERENCES `repair_parts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
