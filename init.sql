-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 28 2021 г., 19:07
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `community`
--

-- --------------------------------------------------------

--
-- Структура таблицы `communities`
--

CREATE TABLE `communities` (
  `id` int UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `communities`
--

INSERT INTO `communities` (`id`, `name`, `created_at`) VALUES
(1, 'Левые', '2021-07-27 17:14:34'),
(2, 'Правые', '2021-07-27 17:14:34'),
(3, 'Неправые', '2021-07-27 17:14:40');

-- --------------------------------------------------------

--
-- Структура таблицы `community_members`
--

CREATE TABLE `community_members` (
  `id` int UNSIGNED NOT NULL,
  `community_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `community_members`
--

INSERT INTO `community_members` (`id`, `community_id`, `user_id`, `joined_at`) VALUES
(1, 1, 1, '2021-07-27 17:29:56'),
(2, 1, 2, '2021-07-27 17:29:56'),
(3, 2, 3, '2021-07-27 17:30:11'),
(4, 2, 4, '2021-07-27 17:30:11'),
(5, 2, 5, '2021-07-27 17:30:47'),
(6, 2, 6, '2021-07-27 17:30:47'),
(7, 2, 7, '2021-07-27 17:31:02'),
(8, 3, 8, '2021-07-27 17:31:02'),
(9, 3, 9, '2021-07-27 17:31:55'),
(10, 3, 10, '2021-07-27 17:31:55'),
(11, 3, 11, '2021-07-27 17:32:07'),
(12, 3, 12, '2021-07-27 17:32:07'),
(13, 3, 13, '2021-07-27 17:32:15');

-- --------------------------------------------------------

--
-- Структура таблицы `community_member_permissions`
--

CREATE TABLE `community_member_permissions` (
  `id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `community_member_permissions`
--

INSERT INTO `community_member_permissions` (`id`, `member_id`, `permission_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 2, 4),
(5, 3, 3),
(6, 3, 4),
(7, 3, 5),
(8, 4, 4),
(9, 4, 5),
(10, 5, 5),
(11, 6, 5),
(12, 7, 5),
(15, 8, 3),
(16, 8, 4),
(17, 8, 5),
(18, 9, 4),
(19, 9, 5),
(20, 10, 4),
(21, 10, 5),
(22, 11, 5),
(23, 12, 5),
(24, 13, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(3, 'Запуск'),
(4, 'Запись'),
(5, 'Чтение');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `created_at`) VALUES
(1, 'Леша', '2021-07-27 17:08:40'),
(2, 'Иван', '2021-07-27 17:13:42'),
(3, 'Николай', '2021-07-27 17:13:42'),
(4, 'Антон', '2021-07-27 17:13:51'),
(5, 'Гена', '2021-07-27 17:13:51'),
(6, 'Леша', '2021-07-27 17:14:06'),
(7, 'Рома', '2021-07-27 17:14:06'),
(8, 'Лена', '2021-07-27 17:20:31'),
(9, 'Лера', '2021-07-27 17:20:31'),
(10, 'Настя', '2021-07-27 17:20:38'),
(11, 'Юля', '2021-07-27 17:20:38'),
(12, 'Яна', '2021-07-27 17:20:48'),
(13, 'Диана', '2021-07-27 17:20:48');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `community_members`
--
ALTER TABLE `community_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_id` (`community_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `community_member_permissions`
--
ALTER TABLE `community_member_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `communities`
--
ALTER TABLE `communities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `community_members`
--
ALTER TABLE `community_members`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `community_member_permissions`
--
ALTER TABLE `community_member_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `community_members`
--
ALTER TABLE `community_members`
  ADD CONSTRAINT `community_members_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `community_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `community_member_permissions`
--
ALTER TABLE `community_member_permissions`
  ADD CONSTRAINT `community_member_permissions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `community_members` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `community_member_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
