-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 21 2024 г., 19:58
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
-- База данных: `xmkibfui_m1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `message` varchar(250) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `message`, `employee_id`, `order_id`) VALUES
(1, 'message', 2, 1),
(2, 'Не переживаейте, починим.', 3, 2),
(3, 'Не переживаейте, починим.', 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `component`
--

CREATE TABLE `component` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `orderr`
--

CREATE TABLE `orderr` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `tech_type` varchar(100) NOT NULL,
  `tech_model` varchar(100) NOT NULL,
  `problem_description` varchar(250) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `completion_date` date DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orderr`
--

INSERT INTO `orderr` (`id`, `start_date`, `tech_type`, `tech_model`, `problem_description`, `status_id`, `completion_date`, `client_id`) VALUES
(1, '2023-06-06', 'Компьютер', 'ARDOR GAMING RAGE H290', 'Выключается после 10 минут работы', 2, NULL, 7),
(2, '2023-05-05', 'Ноутбук', 'ASUS VivoBook Pro 15 M6500QH-HN034 синий', 'Сильно шумит и греется', 2, NULL, 8),
(3, '2022-07-07', 'Мышка', 'ARDOR GAMING Phantom PRO', 'Перестало работать колёсико', 4, '2023-01-01', 9),
(4, '2023-08-02', 'Клавиатура', 'Dark Project KD83A', 'Сломались некоторые клавиши', 1, NULL, 8),
(5, '2023-08-02', 'Ноутбук', 'ASUS ROG Strix G15 G513RW-HQ177 серый', 'Не загружается система', 1, NULL, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `order_component`
--

CREATE TABLE `order_component` (
  `id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_employee`
--

CREATE TABLE `order_employee` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `isExecutor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
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
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Заказчик'),
(2, 'Техник'),
(3, 'Менеджер'),
(4, 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `patronymic` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `last_name`, `first_name`, `patronymic`, `phone`, `username`, `password`, `role_id`) VALUES
(1, 'Минаева', 'Алиса', 'Тимофеевна', '89210563128', 'login1', 'pass1', 3),
(2, 'Воробьев', 'Фёдор', 'Алексеевич', '89535078985', 'login2', 'pass2', 2),
(3, 'Захарова', 'Алёна', 'Андреевна', '89210673849', 'login3', 'pass3', 2),
(4, 'Гусева', 'Василиса', 'Дмитриевна', '89990563748', 'login4', 'pass4', 3),
(5, 'Миронов', 'Даниэль', 'Львович', '89994563847', 'login5', 'pass5', 3),
(6, 'Белов', 'Роман', 'Добрынич', '89219567849', 'login6', 'pass6', 1),
(7, 'Кузин', 'Михаил', 'Родионович', '89219567841', 'login7', 'pass7', 1),
(8, 'Ковалева', 'Софья', 'Владимировна', '89219567842', 'login8', 'pass8', 1),
(9, 'Глухова', 'Вероника', 'Владимировна', '89219567843', 'login9', 'pass9', 1),
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
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orderr`
--
ALTER TABLE `orderr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `order_component`
--
ALTER TABLE `order_component`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `component_id` (`component_id`);

--
-- Индексы таблицы `order_employee`
--
ALTER TABLE `order_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `order_status`
--
ALTER TABLE `order_status`
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
-- AUTO_INCREMENT для таблицы `component`
--
ALTER TABLE `component`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orderr`
--
ALTER TABLE `orderr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `order_component`
--
ALTER TABLE `order_component`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_employee`
--
ALTER TABLE `order_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orderr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orderr`
--
ALTER TABLE `orderr`
  ADD CONSTRAINT `orderr_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderr_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_component`
--
ALTER TABLE `order_component`
  ADD CONSTRAINT `order_component_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_component_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orderr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_employee`
--
ALTER TABLE `order_employee`
  ADD CONSTRAINT `order_employee_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orderr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_employee_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
