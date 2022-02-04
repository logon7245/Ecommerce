$(document).ready(function(){

$('#reloadcaptcha').click(function(){
        $('.imgcapth').attr("src","/components/reg_captcha.php" + Math.random());
    });
        
});