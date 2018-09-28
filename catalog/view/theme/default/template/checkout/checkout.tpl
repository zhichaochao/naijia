<?php echo $header; ?>

    <div class="in_content clearfix"></div>
        <!--内容-->
        <div class="address_con clearfix">
            <div class="add_con clearfix" >
                <ul class="bt_ul clearfix" id="collapse-payment-address">
         
                    
                  
                
                </ul>
            
                <div class="fixed clearfix">
                    <div class="fixed_text clearfix">
                        <div class="in_content clearfix"></div>
                        <div class="check_order yd_no clearfix">
                            <h1 class="slide_h1">Order Details <em></em></h1>
                            <div class="slides clear clearfix">
                                <p>KIM K CLOSURE WIG <span class="num">x1</span></p>
                                <p>KIM K CLOSURE WIG <span class="num">x1</span></p>
                                <p>KIM K CLOSURE WIG <span class="num">x1</span></p>
                                <hr />
                                <p class="p2">Total: <span>$485.17</span></p>
                            </div>
                            <div class="slide clear clearfix">
                                <div class="total clearfix">
                                    <p class="p1">Total Products <span>$477.27</span></p>
                                    <p class="p1">Total Points <span>-$0.00</span></p>
                                    <p class="p1">Total Shipping <span>$9.90</span></p>
                                    <p class="p1">Coupon: Summer Sale <span>-$2.00</span></p>
                                    <p class="p2">Total <span>$485.17</span></p>
                                </div>
                                <ul class="check_ul clearfix">
                                    <li class="clearfix">
                                        <div class="pic_img"><img src="img/yd_shop1.jpg"/></div>
                                        <div class="text">
                                            <h2>KIM K CLOSURE WIG</h2>
                                            <p>Color: Black</p>
                                            <p>Lenght: 18inch</p>
                                            <p>Wig With: 13*4 Frontal cap</p>
                                            <p>Quantity: 1</p>
                                            <span>$159.09</span>
                                        </div>
                                    </li>
                                    <li class="clearfix">
                                        <div class="pic_img"><img src="img/yd_shop1.jpg"/></div>
                                        <div class="text">
                                            <h2>KIM K CLOSURE WIG</h2>
                                            <p>Color: Black</p>
                                            <p>Lenght: 18inch</p>
                                            <p>Wig With: 13*4 Frontal cap</p>
                                            <p>Quantity: 1</p>
                                            <span>$159.09</span>
                                        </div>
                                    </li>
                                    <li class="clearfix">
                                        <div class="pic_img"><img src="img/yd_shop1.jpg"/></div>
                                        <div class="text">
                                            <h2>KIM K CLOSURE WIG</h2>
                                            <p>Color: Black</p>
                                            <p>Lenght: 18inch</p>
                                            <p>Wig With: 13*4 Frontal cap</p>
                                            <p>Quantity: 1</p>
                                            <span>$159.09</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="a_btn">
                                <a href="###" class="a_qd_btn">Continue to pay</a>
                            </div>
                        </div>
                    
                    </div>
                </div>
            
            </div>
        </div>


<script>
    $(function(){
//         $("input").focus(function(){
//             $(this).attr("placeholder","");
//             $(this).siblings(".pl_span").css("display","block");
//         })
//         $("input").blur(function(){
            
//             $(this).attr("placeholder",$(this).siblings(".pl_span").text());
//             $(this).siblings(".pl_span").css("display","none");
//         })
        
// //      地址选择
//         $(".add_ol>li .li_label").click(function(){
//             $(this).parent().addClass("active").siblings("li").removeClass("active");
//         })
//         //删除地址
//         $(".add_ol .det").click(function(){
//             $(this).parent().remove();
//         })
        
//      支付方式选择
        $(".pay_ol>li").click(function(){
            $(this).addClass("active").siblings("li").removeClass("active");
        })
        
        if($(window).width()<=920){
            $(window).scroll(function(){
                var div_top =parseInt($(".check_order").offset().top) ;
                var sc_top = $(window).scrollTop();
                if(sc_top < div_top-200){
                    $(".address_con .a_btn").removeClass("active");
                    $(".address_con .a_btn").css("position","fixed").css("padding","0.2rem 0.5rem");
                }else{
                    $(".address_con .a_btn").addClass("active");
                    $(".address_con .a_btn").css("position","inherit").css("padding","0");
                }
            })
        }
        
        //支付弹窗
        $(".slides").click(function(){
            if($(this).hasClass("active")){
                $(this).removeClass("active");
                $(this).siblings(".slide").stop().slideUp();
            }else{
                $(this).addClass("active");
                $(this).siblings(".slide").stop().slideDown();
            }
        })
        
//      pc右侧下拉
        $(".slide_h1").click(function(){
            if($(this).hasClass("active")){
                $(this).removeClass("active");
                
//              $(this).siblings(".slides").show();
//              $(this).siblings(".slide").stop().slideUp();
                $(this).siblings(".slides").stop().slideDown();
                $(this).siblings(".slide").hide();
            }else{
                $(this).addClass("active");
                $(this).siblings(".slides").hide();
                $(this).siblings(".slide").stop().slideDown();
            }
        })
        
        $(document).scroll(function(){
            var top = $(document).scrollTop();
            if(top>$(window).height()){
                $(".slide_h1").removeClass("active");
                $(".slide_h1").siblings(".slides").show();
                $(".slide_h1").siblings(".slide").hide();
            }
        });
        
        
    })
</script>












<script type="text/javascript">
    // 获取支付方式
    function get_payment() {
         $.ajax({
         url: 'index.php?route=checkout/shipping_method',
         dataType: 'html',
          success: function(html) {
                $.ajax({
                 url: 'index.php?route=checkout/payment_method',
                 dataType: 'html',
                  success: function(html) {
                   $('#collapse-payment-address').html(html);
                  }
              })

          
          }
      })


      
    }

    // 选择地址，进入选支付方式
    function save_address() {
        $.ajax({
        url: 'index.php?route=checkout/payment_address/save',
        type: 'post',
        data: $('#address_id,#payment_address'),
        dataType: 'json',
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            }else{
                get_payment();
            }

        }
        })
    }
    function deleteaddress(address_id) {
       $.ajax({
        url: 'index.php?route=checkout/payment_address/delete',
        type: 'post',
         data: {address_id:address_id},
          dataType: 'json',
      
        success: function(json) {
            // console.log(json);
            if (json['redirect']) {
                location = json['redirect'];
             
            } else{
                get_address();
            }
        }
        })

    }
 $(document).ready(function() {
 get_address();
});
 function get_address(address_id) {
    var address_id = arguments[0] ? arguments[0] : 0;//设置第一个参数的默认值为1 
      $.ajax({
        url: 'index.php?route=checkout/payment_address',
        dataType: 'html',
        data:{address_id,address_id},
        success: function(html) {
       

            $('#collapse-payment-address').html(html);
           
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
          });
 }
  
  
    $(document).delegate('#button-payment-address', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_address/save',
        type: 'post',
        data: $('#collapse-payment-address input[type=\'hidden\'],#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
        dataType: 'json',
      
        success: function(json) {
            // console.log(json);
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                for (i in json['error']) {
                    var element = $('#input-payment-' + i.replace('_', '-'));
                        $(element).siblings('.ts_ps').show();
                }
             
            } else{
                get_address();
            }
        }
    })
})
</script>
<?php echo $footer; ?>
