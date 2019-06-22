<?php echo $header; ?>

    <div class="in_content clearfix"></div>
        <!--内容-->
        <div class="address_con clearfix">
        <!--分步-->
                <div class="substep clearfix">
                    <ul class="clearfix">
                        <li>
                            <div class="text">
                                <span>1</span><em>MY CART</em>
                            </div>
                        </li>
                        <li class="active">
                            <div class="text">
                                <span>2</span><em>CHECKOUT</em>
                            </div>
                        </li>
                        <li>
                            <div class="text">
                                <span>3</span><em>PAYMENT</em>
                            </div>
                        </li>
                    </ul>
                </div>
            <div class="add_con clearfix" >
                <ul class="bt_ul clearfix" id="collapse-payment-address">
         
                    
                  
                
                </ul>
            
                <div class="fixed clearfix">
                    <div class="fixed_text clearfix">
                        <!-- <div class="in_content clearfix"></div> -->
                        <div class="check_order yd_no clearfix confirm"  >
                            <h1 class="slide_h1 active">Order Details <em></em></h1>
                            <div class="slides active clear clearfix">
                             <?php foreach ($products as $product) { ?>
                                <p><?=$product['name'];?> <span class="num">x<?=$product['quantity'];?></span></p>
                              <?php } ?>
                                <hr />
                                  <?php foreach ($totals as $key=> $total) { if($key=='total'){?>

                                <p class="p2"><?=$total['title'];?>: <span><?=$total['text'];?></span></p>
                                      <?php }} ?>
                            </div>
                            <div class="slide clear clearfix">
                                
                                <ul class="check_ul clearfix">
                                       <?php foreach ($products as $product) { ?>
                                    <li class="clearfix">
                                        <div class="pic_img"><img src="<?=$product['image'];?>"/></div>
                                        <div class="text">
                                            <h2><?=$product['name'];?></h2>
                                            <?php if($product['option']['selects']){?>
                                             <?php foreach ($product['option']['selects'] as $option) { ?>
                                            <p><?=$option['option_name'];?>: <?=$option['option_value_name'];?></p>
                                              <?php  }} ?>

                                        
                                            <p>Quantity:  <?=$product['quantity'];?></p>
                                            <p>Color:  <?=$product['color'];?></p>
                                            <span> <?=$product['price'];?></span>
                                        </div>
                                    </li>
                                     <?php  } ?>
                                </ul>

                                <div class="total clearfix">
                                      <?php foreach ($totals as $key=> $total) { if($key=='total'){?>

                                <p class="p2"><?=$total['title'];?>: <span><?=$total['text'];?></span></p>
                                      <?php }else{?>
                                <p class="p1"><?=$total['title'];?>: <span><?=$total['text'];?></span></p>
                                <p class="p1" id="jfyutcoupon"></p>
                                <?php  }} ?>
                                   
                                </div>
                             <!--    <div class="shop_search">
                                <p>
                                    If you have coupons, please fill them out. If not, 
                                    please pay.
                                </p>
                                <i id="new-checkout-bot-code" style="color: #f00;"></i>
                                <label for="">
                                    <input type="text" id="coupon_code" name="coupon" value="" placeholder="coupon code"/>
                                    <button  onclick="coupon_code(this)">CONFIRM</button>
                                </label>
                                </div> -->
                            </div>
                            <!-- <div class="a_btn">
                                <a onclick="pay();"  class="a_qd_btn">Continue to pay</a>
                            </div> -->
                        </div>
                    
                    </div>
                </div>
            
            </div>
        </div>


<script>

    function pay() {
       tips('Please choose address and payment method.','gantan',1000);
    }
    $(function(){

        
     
        
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
        //      输入框获取焦点显示按钮
        $(".shop_search input").focus(function(){
            $(".shop_search button").css("display","block");
        })
        
    })
    function coupon_code(e) {
    $.ajax({
        url: 'index.php?route=extension/total/coupon/jcoupon',
        type: 'post',
        data: $('input#coupon_code'),
        dataType: 'json',
      
        success: function(json) {
       // console.log(json);

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']) {
                    $('#new-checkout-bot-code').html( json['error']);
                }
               
            } else {
                get_total();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
 function get_total() {
       $.ajax({
         url: 'index.php?route=/checkout/cart/couponuse',
         dataType: 'json',
        success: function(json) {
            // console.log(json.coupon);
            if(json.coupon){
                $('#jfyutcoupon').html(json.coupon.title+':'+ '<span>'+json.coupon.text+'</span>');
            $('.p2').html(json.total.title+':'+ '<span>'+json.total.text+'</span>');
        }else{
            $('#jfyutcoupon').html('');
            $('.p2').html(json.total.title+':'+ '<span>'+json.total.text+'</span>');
        }
        }
    });
 }
</script>












<script type="text/javascript">
    // 获取支付方式
    function get_payment() {
         // $.ajax({
         // url: 'index.php?route=checkout/shipping_method',
         // dataType: 'html',
         //  success: function(html) {
                $.ajax({
                 url: 'index.php?route=checkout/payment_method',
                 dataType: 'html',
                  success: function(html) {
                   $('#collapse-payment-address').html(html);
                  }
              })

          
      //     }
      // })


      
    }

    // save_address();

    // 选择地址，进入选支付方式
    function save_address() {

        if ($('#address_id').val()>0) {
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
        else{
           alert('Please choose address.');

        }
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
 // $(document).ready(function() {
 get_address_jump();
// });
 function get_address_jump(address_id) {
    var address_id = arguments[0] ? arguments[0] : 0;//设置第一个参数的默认值为0
      $.ajax({
        url: 'index.php?route=checkout/payment_address',
        dataType: 'html',
        data:{address_id,address_id},
        success: function(html) {
       

            $('#collapse-payment-address').html(html);
            // if ( $('#address_id').val()>0) {
            //         save_address();
            // }
        
              
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
          });
 }
  
 function get_address(address_id) {
    var address_id = arguments[0] ? arguments[0] : 0;//设置第一个参数的默认值为0
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
                get_address_jump();
            }
        }
    })
})
</script>
<?php echo $footer; ?>
