<?php if (!isset($redirect)) { ?>

<li class="active pc_no">
            <div class="form_text">
              <div class="check_order  clearfix">
                <h1 class="pay_h1">Order Details</h1>
                <div class="slides clear clearfix">
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
                  <?php  }} ?>
                  </div>

                </div>
                <div class="shop_search">
                  <p>
                    If you have coupons, please fill them out. If not, 
                    please pay.
                  </p>
                   <i class="new-checkout-bot-code" style="color: #f00;"></i>
                  <label for="">
                    <input type="text" id="couval"   value="<?php echo @$coupon; ?>" placeholder="coupon code"/>
                    <input type="hidden" value="" name="coupon" id="acoupon_codes">
                <button  onclick="coupon_codes(this)">CONFIRM</button>
                  </label>
                </div>
                <div class="a_btn">
                   <?php echo $payment; ?>
                </div>
              </div>
            </div>
          </li>

          <div class="fixed_text yd_hide clearfix">
          <div class="check_order clearfix">
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
                 <?php  }} ?>
              </div>
            </div>
            <div class="a_btn">
             <?php echo $payment; ?>
            </div>
          </div>
        
        </div>



<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>

<script type="text/javascript">
  
 $(function(){
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
          //移动支付下拉
    $(".pay_h1").click(function(){
      if($(this).hasClass("active")){
        $(this).removeClass("active");
        $(this).siblings(".slide").hide();
        $(this).siblings(".slides").slideDown();
      }else{
        $(this).addClass("active");
        $(this).siblings(".slides").hide();
        $(this).siblings(".slide").slideDown();
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
      //    输入框获取焦点显示按钮
    $(".shop_search input").focus(function(){
      $(".shop_search button").css("display","block");
    })  
        });
 

   function coupon_codes(e) {

    $.ajax({
        url: 'index.php?route=extension/total/coupon/jcoupon',
        type: 'post',
        data: $('#acoupon_codes').val($('#couval').val()),
        dataType: 'json',
      
        success: function(json) {
       // console.log(json);

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']) {
                    $('.new-checkout-bot-code').html( json['error']);
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
         url: 'index.php?route=checkout/confirm',
         dataType: 'html',
        success: function(html) {
            console.log(html);
            $('.confirm').html(html);
        }
    });
 }
</script>