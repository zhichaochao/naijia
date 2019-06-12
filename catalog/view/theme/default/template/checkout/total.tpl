      <div class="slide_p">
              <?php foreach ($totals as $total) { ?>
       
            <p  <?php if(strstr($total['title'], 'Coupon')){ ?>id="jfyut" <?php } ?>><?php echo $total['title']; ?> <span><?php echo $total['text']; ?></span></p>
            <?php } ?>

             <!--  <p>Total Products <span>₦216K</span></p>
              <p>Total Points <span>-₦0K</span></p>
              <p>Total Shipping <span>₦0K</span></p> -->
              <?php if(isset($coupons)){ ?>
              <p><i class="xl_i active">Coupon:<em></em></i> <span></span></p>
              <ul class="xl_ul clearfix">
                <?php foreach ($coupons as $coupon) { ?>
                <!-- 选中加active -->
                <?php if($coupon['cart_total']=='1'){ ?>
                <li class="clearfix hui">
                <?php }else{ ?>
                <li class="clearfix" onclick="coupon('<?php echo $coupon['code']; ?>',this)">

                 <?php } ?>
                  <span><?php echo $coupon['name']; ?></span>
                    <?php if($coupon['type']=='P'){ ?>
                        <em>-<?php echo $coupon['discountp']; ?>%off</em>
                    <?php }else{ ?>
                        <em>-<?php echo $coupon['discount']; ?></em>
                    <?php } ?>

                </li>
                <?php } ?>
               <?php }?>       
            </div>
            
            <p class="total_p active clearfix">
               <!-- <?php if(isset($coupons)){ ?>
                <i class="text_i">Coupon: <i>- ₦5K</i></i>
               <?php }?>  -->
              <span>Total</span>
              <i class="img_i"></i>
              <em id="totals_coupon"><?=$totals['total']['text']?></em>
            </p>
            <a class="btn_a" onclick="submit_message('<?php echo $checkout; ?>')">CHECK OUT</a>

        <script type="text/javascript">
          
            $(function(){
                //下拉收起
    $(".xl_i").click(function(){
      if($(this).hasClass("active")){
        $(this).removeClass("active");
        $(this).parents(".total").find(".xl_ul").stop().slideUp();
      }else{
        $(this).addClass("active");
        $(this).parents(".total").find(".xl_ul").stop().slideDown();
      }
    })
  //下拉li
    // $(".xl_ul>li").click(function(){
    //   $(this).addClass("active").siblings("li").removeClass("active");
    // })
    $(".xl_ul>li").click(function(){
      if(!$(this).hasClass("hui")){
        if($(this).hasClass("active")){
          $(this).removeClass("active");
        }else{
          $(this).addClass("active").siblings("li").removeClass("active");
        }
      }
    })
  
  //pc端total下拉
    $(".total_p").click(function(){
      if($(window).width()>920){
        if($(this).hasClass("active")){
          $(this).removeClass("active");
          $(".slide_p").stop().slideUp();
          $(".xl_i").removeClass("active");
          $(".xl_i").parents(".total").find(".xl_ul").css("display","none");
        }else{
          $(".xl_i").addClass("active");
          $(".xl_i").parents(".total").find(".xl_ul").css("display","block");
          $(this).addClass("active");         
          $(".slide_p").stop().slideDown();
        }
      }
    })
            })

            function coupon (coupon,e) {
              if ($(e).hasClass('active')) {

                $.ajax({
                url:'<?php echo $delcoupon_url?>',
                data:{'coupon':coupon},
                type: 'post',
                dataType: 'json',
                success: function(json) {
                  $('#totals_coupon').html(json.total.text);
                  $('#jfyut').html('');
                }
              })

              }else{
              // alert(coupon);
              $.ajax({
                url:'<?php echo $coupon_url?>',
                data:{'coupon':coupon},
                type: 'post',
                dataType: 'json',
                success: function(json) {
                  $('#totals_coupon').html(json.total.text);
                  $('#jfyut').html(json.coupon.title+'<span>'+json.coupon.text+'</span>');




                }
              })
              }
            }
        </script>