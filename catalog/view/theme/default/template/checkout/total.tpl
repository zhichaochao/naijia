      <div class="slide_p">
              <?php foreach ($totals as $total) { ?>
       
            <p><?php echo $total['title']; ?> <span><?php echo $total['text']; ?></span></p>
            <?php } ?>

              <p>Total Products <span>₦216K</span></p>
              <p>Total Points <span>-₦0K</span></p>
              <p>Total Shipping <span>₦0K</span></p>
              <p><i class="xl_i">Coupon:Summer Sale <em></em></i> <span>-₦5K</span></p>
              <ul class="xl_ul clearfix">
                <li class="active clearfix">
                  <span>Summer Sale</span>
                  <em>-₦5K</em>
                </li>
                <li class="clearfix">
                  <span>Summer Sale 1</span>
                  <em>-₦3K</em>
                </li>
              </ul>
            </div>
            
            <p class="total_p clearfix">
              <!-- <i class="text_i">Coupon: <i>- ₦5K</i></i> -->
              <span>Total</span>
              <i class="img_i"></i>
              <em><?=$totals['total']['text']?></em>
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
    $(".xl_ul>li").click(function(){
      $(this).addClass("active").siblings("li").removeClass("active");
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
        </script>