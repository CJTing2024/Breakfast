
// 客服圖示
$(document).ready(function(){
    $('#T_fixed_customer_service_img').click(function(){	
        
        $('#T_fixed_customer_service_img').addClass("animate__animated animate__bounce")		
        
        if($('.T_fixed_customer_service').css('display') === 'none'){
            // $('#T_fixed_customer_service_img').removeClass("animate__animated animate__bounce")	
            $('.T_fixed_customer_service').css('display','block')
            $('body').css('background-color','rgba(0, 0, 0, 0.5)')
        }else{
            $('#T_fixed_customer_service_img').removeClass("animate__animated animate__bounce")	
            $('.T_fixed_customer_service').css('display','none')
            $('body').css('background-color','rgba(0, 0, 0, 0)')
        }  
    });
    $('#T_fixed_customer_service_img').fadeTo('slow', 0.5);
    $('#T_fixed_customer_service_img').hover(
        function(){
            $('#T_fixed_customer_service_img').fadeTo('slow',1);
        },
        //滑鼠移出
        function(){
            $('#T_fixed_customer_service_img').fadeTo('slow', 0.5);
        }
    );
});
