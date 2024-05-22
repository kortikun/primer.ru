-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 21 2024 г., 22:37
-- Версия сервера: 5.7.33-0ubuntu0.16.04.1
-- Версия PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `avnxyxma_m1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `message` varchar(512) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `message`, `employee_id`, `request_id`) VALUES
(1, 'Всё сделаем!', 2, 2),
(2, 'Не переживаейте, починим.', 3, 2),
(3, 'Не переживаейте, починим.', 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `device_type`
--

CREATE TABLE `device_type` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `device_type`
--

INSERT INTO `device_type` (`id`, `name`) VALUES
(1, 'Компьютер'),
(2, 'Ноутбук'),
(3, 'Мышка'),
(4, 'Клавиатура');

-- --------------------------------------------------------

--
-- Структура таблицы `part_request`
--

CREATE TABLE `part_request` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `part_request`
--

INSERT INTO `part_request` (`id`, `request_id`, `part_id`, `amount`, `status_id`) VALUES
(1, 2, 1, 1, 2),
(2, 3, 3, 1, 1),
(3, 4, 2, 2, 3),
(4, 4, 1, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `part_request_status`
--

CREATE TABLE `part_request_status` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `part_request_status`
--

INSERT INTO `part_request_status` (`id`, `name`) VALUES
(1, 'Новый запрос'),
(2, 'Комплектующие в пути'),
(3, 'Доставлено');

-- --------------------------------------------------------

--
-- Структура таблицы `part_type`
--

CREATE TABLE `part_type` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `price` decimal(16,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `part_type`
--

INSERT INTO `part_type` (`id`, `name`, `price`) VALUES
(1, 'Кулер', '500.00'),
(2, 'Вентилятор', '750.00'),
(3, 'Процессор', '15000.00'),
(4, 'Видеокарта GTX 1080', '60000.00');

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `device_type_id` int(11) NOT NULL,
  `device_model` varchar(256) NOT NULL,
  `problem_description` varchar(512) NOT NULL,
  `status_id` int(11) NOT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `master_id` int(11) DEFAULT NULL,
  `completion_date` timestamp NULL DEFAULT NULL,
  `total_price` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id`, `client_id`, `start_date`, `device_type_id`, `device_model`, `problem_description`, `status_id`, `priority_id`, `operator_id`, `master_id`, `completion_date`, `total_price`) VALUES
(2, 7, '2023-06-06 07:00:00', 1, 'RDOR GAMING RAGE H290', 'Выключается после 10 минут работы', 2, 1, 2, 4, NULL, NULL),
(3, 8, '2023-05-05 07:00:00', 2, 'ASUS VivoBook Pro 15 M6500QH-HN034 синий', 'Сильно шумит и греется', 2, 1, 3, 5, NULL, NULL),
(4, 9, '2022-07-07 07:00:00', 3, 'ARDOR GAMING Phantom PRO', 'Перестало работать колёсико', 4, 1, 5, 3, NULL, NULL),
(5, 8, '2023-08-02 07:00:00', 4, 'Dark Project KD83A', 'Сломались некоторые клавиши', 1, NULL, NULL, NULL, NULL, NULL),
(6, 9, '2023-08-02 07:00:00', 2, 'ASUS ROG Strix G15 G513RW-HQ177 серый', 'Не загружается система', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `request_priority`
--

CREATE TABLE `request_priority` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `request_priority`
--

INSERT INTO `request_priority` (`id`, `name`) VALUES
(1, 'Обычный'),
(2, 'Критичный');

-- --------------------------------------------------------

--
-- Структура таблицы `request_status`
--

CREATE TABLE `request_status` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `request_status`
--

INSERT INTO `request_status` (`id`, `name`) VALUES
(1, 'Новая заявка'),
(2, 'В процессе ремонта'),
(3, 'Ожидание комплектующих'),
(4, 'Готова к выдаче');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Менеджер'),
(2, 'Техник'),
(3, 'Оператор'),
(4, 'Заказчик');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `lastname` varchar(256) NOT NULL,
  `firstname` varchar(256) NOT NULL,
  `patronymic` varchar(256) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `login` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `lastname`, `firstname`, `patronymic`, `phone`, `login`, `password`, `role_id`) VALUES
(1, 'Минаева', 'Алиса', 'Тимофеевна', '89210563128', 'login1', 'pass1', 1),
(2, 'Воробьев', 'Фёдор', 'Алексеевич', '89535078985', 'login2', 'pass2', 2),
(3, 'Захарова', 'Алёна', 'Андреевна', '89210673849', 'login3', 'pass3', 2),
(4, 'Гусева', 'Василиса', 'Дмитриевна', '89990563748', 'login4', 'pass4', 3),
(5, 'Миронов', 'Даниэль', 'Львович', '89994563847', 'login5', 'pass5', 3),
(6, 'Белов', 'Роман', 'Добрынич', '89219567849', 'login6', 'pass6', 4),
(7, 'Кузин', 'Михаил', 'Родионович', '89219567841', 'login7', 'pass7', 4),
(8, 'Ковалева', 'Софья', 'Владимировна', '89219567842', 'login8', 'pass8', 4),
(9, 'Глухова', 'Вероника', 'Владимировна', '89219567843', 'login9', 'pass9', 4),
(10, 'Князев', 'Арсений', 'Андреевич', '89219567844', 'login10', 'pass10', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Индексы таблицы `device_type`
--
ALTER TABLE `device_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `part_request`
--
ALTER TABLE `part_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `part_id` (`part_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `part_request_status`
--
ALTER TABLE `part_request_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `part_type`
--
ALTER TABLE `part_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `device_type_id` (`device_type_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `operator_id` (`operator_id`),
  ADD KEY `master_id` (`master_id`);

--
-- Индексы таблицы `request_priority`
--
ALTER TABLE `request_priority`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `device_type`
--
ALTER TABLE `device_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `part_request`
--
ALTER TABLE `part_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `part_request_status`
--
ALTER TABLE `part_request_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `part_type`
--
ALTER TABLE `part_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `request_priority`
--
ALTER TABLE `request_priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `request_status`
--
ALTER TABLE `request_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `part_request`
--
ALTER TABLE `part_request`
  ADD CONSTRAINT `part_request_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `part_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `part_request_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `part_request_status` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`device_type_id`) REFERENCES `device_type` (`id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`priority_id`) REFERENCES `request_priority` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `request_status` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_4` FOREIGN KEY (`operator_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_5` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_6` FOREIGN KEY (`master_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
