<?php

// Контроллер ProductController товар
class ProductController
{

    // Action для страницы просмотра товара
    public function actionView($productId)
    {
        // Список категорий для левого меню
        $categories = Category::getCategoriesList();

        // Получаем инфомрацию о товаре
        $product = Product::getProductById($productId);

        // Подключаем вид
        require_once(ROOT . '/views/product/view.php');
        return true;
    }

}
