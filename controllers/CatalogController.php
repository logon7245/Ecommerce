<?php

// Контроллер CatalogController каталог товаров
class CatalogController
{

    //Action для страницы "Каталог товаров"
    public function actionIndex()
    {
        // Список категорий для левого меню
        $categories = Category::getCategoriesList();

        // Список последних товаров и их количество
        $latestProducts = Product::getLatestProducts(12);

        // Подключаем вид
        require_once(ROOT . '/views/catalog/index.php');
        return true;
    }

    //Action для страницы "Категория товаров"
    public function actionCategory($categoryId, $page = 1)
    {
        // Список категорий для левого меню
        $categories = Category::getCategoriesList();

        // Список товаров в категории
        $categoryProducts = Product::getProductsListByCategory($categoryId, $page);

        // Общее количетсво товаров
        $total = Product::getTotalProductsInCategory($categoryId);

        // Создаем объект Pagination постраничной навигации
        $pagination = new Pagination($total, $page, Product::SHOW_BY_DEFAULT, 'page-');

        // Подключаем вид
        require_once(ROOT . '/views/catalog/category.php');
        return true;
    }

}
