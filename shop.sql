-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 23 2020 г., 12:23
-- Версия сервера: 5.7.20
-- Версия PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL COMMENT 'идентификатор',
  `name` varchar(255) NOT NULL COMMENT 'имя',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'порядковый норме для сортировка',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'отображение '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `sort_order`, `status`) VALUES
(1, 'СРЕДСТВА ДЛЯ ЧИСТКИ КОВРОВ, МЕБЕЛИ', 0, 1),
(2, 'МЫЛО', 0, 1),
(3, 'ДЛЯ СТИРКИ', 0, 1),
(4, 'ГУБКИ, САЛФЕТКИ, ТРЯПКИ', 0, 1),
(5, 'МЕШКИ', 0, 1),
(6, 'МОЧАЛКИ,ГУБКИ БАННЫЕ', 0, 1),
(7, 'ПЕРЧАТКИ', 0, 1),
(8, 'ВАТНЫЕ ДИСКИ,ПАЛОЧКИ', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL COMMENT 'идентификатор',
  `name` varchar(255) NOT NULL COMMENT 'название товара',
  `category_id` int(11) NOT NULL COMMENT 'номер категории товара',
  `code` int(11) NOT NULL COMMENT 'код товара',
  `price` float NOT NULL COMMENT 'стоимость товара',
  `availability` int(11) NOT NULL COMMENT 'доступность товара',
  `brand` varchar(255) NOT NULL COMMENT 'производитель',
  `image` varchar(255) NOT NULL COMMENT 'изображение товара',
  `description` text NOT NULL COMMENT 'описание товара',
  `is_new` int(11) NOT NULL DEFAULT '0' COMMENT 'отображение в новинках',
  `is_recommended` int(11) NOT NULL DEFAULT '0' COMMENT 'отображение товара в рекомендациях',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'отображение товара'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`, `code`, `price`, `availability`, `brand`, `image`, `description`, `is_new`, `is_recommended`, `status`) VALUES
(1, 'UNICUM Средство для чистки и ухода за изделиями из кожи 500 мл. спрей /12', 1, 818, 111.89, 1, 'UNICUM', 'qweqw.jpg', 'Средство для чистки и ухода за изделиями из кожи 500 мл. спрей /12\r\n', 1, 1, 1),
(2, 'Pronto аэрозоль полироль Классик 250мл./12', 1, 663, 228.35, 5, 'PRONTO', '1f1b333b1613331e.jpg', 'Pronto аэрозоль полироль Классик  250мл./12', 0, 1, 1),
(3, 'ARIEL пор/стир. автомат 6кг для белого /3', 3, 139, 1102.21, 5, 'ARIEL', '', 'пор/стир. автомат 6кг для белого /3', 0, 1, 1),
(4, 'АУРА ВАТНЫЕ ПАЛОЧКИ ПОЛИЭТИЛЕНОВАЯ УПАКОВКА 100ШТ/120', 8, 1171, 22.78, 6, 'АУРА', '', 'АУРА ватные палочки полиэтиленовая упаковка 100шт/120', 0, 0, 1),
(5, 'ВАТНЫЕ ДИСКИ \"VEIRO\" 120ШТ./35', 8, 9060, 58.36, 7, 'VEIRO', '', 'Ватные диски \"Veiro\" 120шт./35', 0, 0, 1),
(6, 'ПЕРЧАТКИ КЩС ТИП-2 РАЗМЕР 8 12/20/240', 7, 3432, 48.96, 75, 'отсутствует', '', 'Перчатки КЩС тип-2  размер  8   12/20/240', 0, 0, 1),
(7, 'ГУБКА БАННАЯ ВДОХНОВЕНИЕ/20', 6, 1455, 13.41, 21, 'отсутствует', '', 'Губка банная Вдохновение/20', 0, 0, 1),
(8, 'МЕШКИ Д/М 120 Л. С РУЧКАМИ 10ШТ В РУЛОНЕ 17МКМ БЕЖЕВЫЕ/50 РУЛОНОВ В КОР.', 5, 2611, 50.6, 43, 'отсутствует', '', 'Мешки д/м 120 л. с ручками 10шт в рулоне 17мкм бежевые/50 рулонов в кор.', 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL COMMENT 'идентификатор',
  `user_name` varchar(255) NOT NULL COMMENT 'имя',
  `user_phone` varchar(255) NOT NULL COMMENT 'телефон',
  `user_comment` text NOT NULL COMMENT 'комментарий ',
  `user_id` int(11) DEFAULT NULL COMMENT 'зарегистрирован ли пользователь',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'дата',
  `products` text NOT NULL COMMENT 'номера и количество заказанных товаров ',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'статус исполнения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `admin`) VALUES
(1, 'admin', 'admin@mail.ru', '1qwrwedsjgec27e230c63db3c4f0bed809c84effdf6f556sf23dq3z', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
