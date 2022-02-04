<?php

// Класс Cart модель для работы с корзиной
class Cart
{

    // Добавление товара в корзину (сессию)
    public static function addProduct($id)
    {
        // Приводим $id к типу integer
        $id = intval($id);

        // Пустой массив для товаров в корзине
        $productsInCart = array();

        // Если в корзине уже есть товары (они хранятся в сессии)
        if (isset($_SESSION['products'])) {
            // То заполним наш массив товарами
            $productsInCart = $_SESSION['products'];
        }

        // Проверяем есть ли уже такой товар в корзине 
        if (array_key_exists($id, $productsInCart)) {
            // Если такой товар есть в корзине, увеличим количество на 1
            $productsInCart[$id] ++;
        } else {
            // Если нет, добавляем id нового товара в корзину с количеством 1
            $productsInCart[$id] = 1;
        }

        // Записываем массив с товарами в сессию
        $_SESSION['products'] = $productsInCart;

        // Возвращаем количество товаров в корзине
        return self::countItems();
    }

    // Подсчет количество товаров в корзине (в сессии)
    public static function countItems()
    {
        // Проверка наличия товаров в корзине
        if (isset($_SESSION['products'])) {
            // Если массив с товарами есть
            // Подсчитаем и вернем их количество
            $count = 0;
            foreach ($_SESSION['products'] as $id => $quantity) {
                $count = $count + $quantity;
            }
            return $count;
        } else {
            // Если товаров нет, вернем 0
            return 0;
        }
    }

    //Возвращает массив с идентификаторами и количеством товаров в корзине
    public static function getProducts()
    {
        if (isset($_SESSION['products'])) {
            return $_SESSION['products'];
        }
        return false;
    }

    // Получает общую стоимость переданных товаров
    public static function getTotalPrice($products)
    {
        // Получаем массив с идентификаторами и количеством товаров в корзине
        $productsInCart = self::getProducts();

        // Подсчитываем общую стоимость
        $total = 0;
        if ($productsInCart) {
            // Если в корзине не пусто
            // Проходим по переданному в метод массиву товаров
            foreach ($products as $item) {
                // Находим общую стоимость: цена товара * количество товара
                $total += $item['price'] * $productsInCart[$item['id']];
            }
        }

        return $total;
    }

    // Очищает корзину
    public static function clear()
    {
        // Проверяет есть ли в сессии значение
        // Если нет очищает сессию
        if (isset($_SESSION['products'])) {
            unset($_SESSION['products']);
        }
    }

    //Убавляем товар на 1
    public static function minProduct($id)
    {
        //Получаем массив с идентификаторами и количеством товаров в корзине
        $productsInCart = self::getProducts();
        
        if ($productsInCart[$id]<=1) {
           unset($productsInCart[$id]);
           return self::countItems();
          } else {
           if(array_key_exists($id, $productsInCart)) {
            $productsInCart[$id]--;
           }
           $_SESSION['products'] = $productsInCart;
           return self::countItems();
          }
    }
    
    //Прибавляем товар на 1
    public static function MaxProduct($id)
    {
        //Получаем массив с идентификаторами и количеством товаров в корзине
        $productsInCart = self::getProducts();
        if(array_key_exists($id, $productsInCart)) {
            $productsInCart[$id]++;
        }
        $_SESSION['products'] = $productsInCart;
        return self::countItems();
    }

    //Удаляет товар с указанным id из корзины
    public static function deleteProduct($id)
    {
        // Получаем массив с идентификаторами и количеством товаров в корзине
        $productsInCart = self::getProducts();

        // Удаляем из массива элемент с указанным id
        unset($productsInCart[$id]);

        // Записываем массив товаров с удаленным элементом в сессию
        $_SESSION['products'] = $productsInCart;
    }

}
