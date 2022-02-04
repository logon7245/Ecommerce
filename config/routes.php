<?php

return array(
    // Товар:
    'product/([0-9]+)' => 'product/view/$1', // actionView в ProductController
    // Каталог:
    'catalog' => 'catalog/index', // actionIndex в CatalogController
    // Категория товаров:
    'category/([0-9]+)/page-([0-9]+)' => 'catalog/category/$1/$2', // actionCategory в CatalogController   
    'category/([0-9]+)' => 'catalog/category/$1', // actionCategory в CatalogController
    // Корзина:
    'cart/checkout' => 'cart/checkout', // actionAdd в CartController
    'cart/min/([0-9]+)' => 'cart/min/$1', // actionMin в CartController   
    'cart/max/([0-9]+)' => 'cart/max/$1', // actionMax в CartController   
    'cart/delete/([0-9]+)' => 'cart/delete/$1', // actionDelete в CartController    
    'cart/add/([0-9]+)' => 'cart/add/$1', // actionAdd в CartController    
    'cart/addAjax/([0-9]+)' => 'cart/addAjax/$1', // actionAddAjax в CartController
    'cart' => 'cart/index', // actionIndex в CartController
    // Пользователь:
    'user/register' => 'user/register', // actionRegister в UserController
    'user/login' => 'user/login', // actionLogin в UserController
    'user/logout' => 'user/logout', // actionLogout в UserController
    'cabinet/edit' => 'cabinet/edit', // actionEdit в CabinetController
    'cabinet' => 'cabinet/index', // actionIndex в CabinetController
    // Управление товарами:    
    'admin/product/create' => 'adminProduct/create', // actionCreate в AdminProductController
    'admin/product/update/([0-9]+)' => 'adminProduct/update/$1', // actionUpdate в AdminProductController
    'admin/product/delete/([0-9]+)' => 'adminProduct/delete/$1', // actionDelete в AdminProductController
    'admin/product' => 'adminProduct/index', // actionIndex в AdminProductController
    // Управление категориями:    
    'admin/category/create' => 'adminCategory/create', // actionCreate в AdminCategoryController
    'admin/category/update/([0-9]+)' => 'adminCategory/update/$1', // actionUpdate в AdminCategoryController
    'admin/category/delete/([0-9]+)' => 'adminCategory/delete/$1', // actionDelete в AdminCategoryController
    'admin/category' => 'adminCategory/index', // actionIndex в AdminCategoryController
    // Управление заказами:    
    'admin/order/update/([0-9]+)' => 'adminOrder/update/$1', // actionUpdate в AdminOrderController
    'admin/order/delete/([0-9]+)' => 'adminOrder/delete/$1', // actionDelete в AdminOrderController
    'admin/order/view/([0-9]+)' => 'adminOrder/view/$1', // actionView в AdminOrderController
    'admin/order' => 'adminOrder/index', // actionIndex в AdminOrderController
    // Админпанель:
    'admin' => 'admin/index', // actionIndex в AdminController
    // О магазине
    'contacts' => 'site/contact', // actionContact в SiteController
    'about' => 'site/about', // actionAbout в SiteController
    // Главная страница
    'index.php' => 'site/index', // actionIndex в SiteController
    '' => 'site/index', // actionIndex в SiteController
);

?>