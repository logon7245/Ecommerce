<?php include ROOT . '/views/layouts/header.php'; ?>

<section>
    <div class="container">
        <div class="row">
           <div class="col-sm-8">
            <h3>Это ваш профиль</h3>
            
            <h4>Привет, <?php echo $user['name'];?>!</h4>
            <ul>
                <li><a href="/cabinet/edit">Редактировать данные</a></li>
<!--                <li><a href="/cabinet/history">Список заказов</a></li>-->
            
            
            <?php if ($user['admin'] == '1'): ?>                                        
                <li><a href="/admin/">Администрирование</a></li>
            <?php endif; ?>
            </ul>  
            </div>                       
        </div>
    </div>
</section>

<?php include ROOT . '/views/layouts/footer.php'; ?>