<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    
    <!--pc端-->
    <div class="pc_ordet_con clearfix">
      <div class="bt">
        <h1>ORDER INFORMATION</h1>
        <p>Order No:<?php echo $order_number; ?></p>
      </div>
      
      <div class="top clearfix">
<?php if($order_status=='Pending'){?>
        <div class="left clearfix">
          <h2><?php echo $order_status; ?></h2>
          <p class="p1">Please finish payment or upload<br /> the bank alert.Or it will be<br /> invalid in 
            <span class="span_r djs_p" title="<?php echo $date_endadd; ?>">
              <span class="int_hour">02</span><i>:</i>
              <span class="int_minute">00</span><i>:</i>
              <span class="int_second">00</span>
            </span>
          </p>

        <?php if($payment_code == 'pp_standard' || $payment_code == 'pp_express') { ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay;?>" title="Pay"  class="pay_a">Continue too pay</a>
                  <?php } ?>

                  <?php if($bank_receipt) { ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay_receipt;?>" title="Pay"  class="pay_a">Re Submit Receipt</a>
                  <?php }elseif(!($payment_code == 'pp_standard' || $payment_code == 'pp_express')){ ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay_receipt;?>" title="Pay"  class="pay_a">Continues to pay</a>
                <?php } ?>

          <!-- <a class="pay_a" href="###">Continue To Pay</a> -->

          <span>Order date:<?php echo $date_added; ?></span>
        </div>
<?php }elseif($order_status=='Completed'){?>
        <div class="left clearfix">
          <h2 class="huang"><?php echo $order_status; ?>  </h2>
          <p class="p3">
            Pending:<?php echo $date_added; ?> <br />
            <!-- Delivered 2018-08-28<br /> -->
            Delivered:<?php echo $date_modified; ?><br />
            Complete:<?php echo $date_modified; ?>
          </p>
          <a class="pay_a huang" href="<?php echo $compltedorder; ?>">REVIEW</a>
          <span>Order date:<?php echo $date_added; ?></span>
        </div>
<?php }elseif($order_status=='Pending-unfilled'){?>
          <div class="left clearfix">
          <h2 class="huang"><?php echo $order_status; ?></h2>
          <p class="p2">
            Thanks for your order .<br />
            · Payment has been completed<br />
            · It will ready to ship in 1- 2 days.<br />
            Emails will update to you if your <br />
            package situation changes.
          </p>
          <span>Order date:<?php echo $date_added; ?></span>
          <a class="btn_a" href="###">Contact us</a>
        </div>
<?php }elseif($order_status=='Delivered'){?>

        <div class="left clearfix">
          <h2 class="lv"><?php echo $order_status; ?> </h2>
          <p class="p3">
            Your package has been delivered<br /> 
            on <?php echo $date_modified; ?>
          </p>
          <a class="pay_a lv" onclick="javascript:confirm_order('<?php echo $order_id; ?>');">Confirm Receipt</a>
          <span>Order date:<?php echo $date_added; ?></span>
          <a class="btn_a" href="###">Contact us</a>
        </div>

<?php }elseif($order_status=='lnvalid'){?>
        <div class="left clearfix">
          <h2 class="hong"><?php echo $order_status; ?> </h2>
          <p class="p1">
            Fail to complete payment or upload 
            bank alert in time.
          </p>
          <a class="pay_a hong" onclick="javascript:recover_order('<?php echo $order_id; ?>');">Recover To Pay</a>
          <span>Order date:<?php echo $date_added; ?></span>
        </div>

<?php }elseif($order_status=='Canceled'){?>
        <div class="left clearfix">
          <h2 class="hei"><?php echo $order_status; ?>   </h2>
          <a class="pay_a huang" onclick="javascript:recover_order('<?php echo $order_id; ?>');" >RE-ORDER</a>
          <span>Order date:<?php echo $date_added; ?></span>
        </div>

<?php }?>
        

        <div class="right">
          <div class="text">
            <div class="slide_p clearfix">
              <p>Total Products <span><?php echo $subtotals; ?></span></p>
              <p>Total Points <span><?php echo $subtotals; ?></span></p>
              <p>Total Shipping <span><?php echo $shipping_total; ?></span></p>

              <p><i class="xl_i">Coupon:Summer Sale</i> <span>-₦5K</span></p>

            </div>
            <hr />
            <p class="total_p active clearfix">
              <span>Total</span>
              <em><?php echo $total; ?></em>
            </p>
          </div>
        </div>
      </div>
      <div class="address clearfix">
        <dl class="clearfix">
          <dt>Name:</dt>
          <dd><?php echo $shipping_firstname; ?></dd>
        </dl>
        <dl class="clearfix">
          <dt>Address:</dt>
          <dd><?php echo $shipping_addres; ?></dd>
        </dl>
        <dl class="clearfix">
          <dt>Contact:</dt>
          <dd><?php echo $shipping_telephones; ?></dd>
        </dl>
      </div>

      <div class="bot clearfix">
        <div class="top_span clearfix">
          <span>COMMODITY </span>
          <span>TEXTIRE OF MATERIAL</span>
          <span>UNIT PRICE</span>
          <span>NUMBER</span>
          <span>TOTAL</span>
        </div>  
        <ul class="table_ul clearfix">
         <?php foreach ($products as $product) { ?>
          <li class="clearfix">
            <div>
              <a href="###">
                <div class="pic_img">
                  <img src="<?php echo $product['order_image']; ?>" alt="" />
                </div>
                <p class="ov_text"><?php echo $product['name']; ?></p>
              </a>
            </div>
            <div>
              <span>
              <?php foreach ($product['option'] as $option) { ?>

              <?php echo $option['name']; ?>: <?php echo $option['value']; ?>
                <?php } ?>
               <!--  Natural black; 12inch  <br />
                4*13 frontal cap; -->
              </span>
            </div>
            <div>
              <span><?php echo $product['price']; ?></span>
            </div>
            <div><span>x<?php echo $product['quantity']; ?></span></div>
            <div>
              <span><?php echo $product['total']; ?></span>
            </div>
          </li>
          <?php } ?>
        </ul>
      </div>
      <?php if($order_status=='Completed'){?>
      <p class="ms_p">Please contact us if you have any problem of your order.</p>
      <?php } ?>
    </div>
    <!--移动端-->
    <div class="ordet_con clearfix">
      <div class="or_content clearfix">
        <div class="top_yd clearfix">
          <p><a class="fh" href="<?=$home;?>">< BACK</a> <span>Order No:<?php echo $order_number; ?></span></p>
        </div>

        <?php if($order_status=='Pending'){?>
        <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Please finish payment or upload the bank alert.</p>
          <p class="p1">Or it will be invalid in 
            <span class="span_r djs_p" title="<?php echo $date_endadd; ?>">
              <span class="int_hour">02</span><i>:</i>
              <span class="int_minute">00</span><i>:</i>
              <span class="int_second">00</span>
            </span>
          </p>
        </div>

        <?php }elseif($order_status=='Completed'){?>

        <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1 class="hei"><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <ul>
            <li>Pending <span><?php echo $date_added; ?></span></li>
            <li>Delivered <span><?php echo $date_modified; ?></span></li>
            <li>Completed <span><?php echo $date_modified; ?></span></li>
          </ul>
          <button class="modal_btn">Review</button>
        </div>

        <?php }elseif($order_status=='Pending-unfilled'){?>

        <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1 class="hei"><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Thanks for your order .</p>
          <p class="p1">· Payment has been completed.</p>
          <p class="p1">· It will ready to ship in 1- 2 days.</p>
          <p class="p1">Emails will update to you if your package situation changes.</p>
        </div>

<?php }elseif($order_status=='Delivered'){?>
          <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1 class="lv"><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Your package has been delivered on <?php echo $date_modified; ?>. </p>
        </div>
<?php }elseif($order_status=='lnvalid'){?>
        <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Fail to complete payment or <i><br /></i>  upload bank alert in time.</p>
          <a class="pay_a" onclick="javascript:recover_order('<?php echo $order_id; ?>');">Recover to pay</a>
        </div>

<?php }elseif($order_status=='Canceled'){?>
        <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1 class="hei"><i></i> <span><?php echo $order_status; ?></span><p>(<?php echo $date_added; ?>)</p></h1>
        </div>

<?php }?>
        
        <div class="pro_order clearfix">
          <h1>Product information</h1>
          <ul>
            <?php foreach ($products as $product) { ?>
            <li class="clearfix">
              <a href="###">
                <div class="pic_img">
                  <img src="<?php echo $product['order_image']; ?>"/>
                </div>
                <p class="ov_text"><?php echo $product['name']; ?></p>
                <?php foreach ($product['option'] as $option) { ?>
             <p class="type"> <?php echo $option['name']; ?>: <?php echo $option['value']; ?></p>
                <?php } ?>
                <!-- <p class="type">Natural black; 12inch <i><br /></i> 4*13 frontal cap;</p> -->
                <span class="num">x<?php echo $product['quantity']; ?></span>
                <!-- <span class="price1">₦100K</span> -->
                <span class="price2"><?php echo $product['price']; ?></span>
              </a>
            </li>
            <?php } ?>
          </ul>
        </div>
        
        <div class="or_address clearfix">
          <h1>Shipping Address</h1>
          <div class="text">
          <p><?php echo $shipping_address; ?></p>
          </div>
        </div>
        
        <div class="total clearfix">
          <div class="right clearfix">
            <p class="total_p active clearfix">
              <i class="text_i">Coupon: <i>- ₦5K</i></i>
              <span>Total</span>
              <i class="img_i"></i>
              <em><?php echo $total; ?></em>
              <i class="down_img"></i>
            </p>
            <hr />
            <div class="slide_p clearfix">
              <p>Total Products <span><?php echo $subtotals; ?></span></p>
              <p>Total Points <span><?php echo $subtotals; ?></span></p>
              <p>Total Shipping <span><?php echo $shipping_total; ?></span></p>
              <p><i class="xl_i">Coupon:Summer Sale</i> <span>-₦5K</span></p>
            </div>

            
          </div>

            <?php if($order_status=='Pending' || $order_status=='lnvalid'){?>
              <a class="btn_a hong" href="###">CONTINUE TO PAY</a>
            <?php }?>

            <?php if($order_status=='Completed' ){?>
              <button class="md_btn w_50">CONTACT US</button>
              <a class="btn_a1 btn_a" href="###">REVIEW</a>
              <p class="ms_p pd_no">You package is on preparing,contact us if you have any problem.</p>
            <?php }?>

             <?php if($order_status=='Delivered'){?>
              <button class="md_btn w_50">CONTACT US</button>
              <a class="btn_a1 btn_a"  onclick="javascript:confirm_order('<?php echo $order_id; ?>');">CONFIRM RECEIPT</a>
              <p class="ms_p pd_no">You package is on preparing,contact us if you have any problem.</p>
            <?php }?>


            <?php if($order_status=='Pending-unfilled'){?>
              <a class="btn_a huang" href="###">CONTACT US</a>
              <p class="ms_p">You package is on preparing,contact us if you have any problem.</p>
            <?php }?>

            <?php if($order_status=='Canceled'){?>
            <a class="btn_a huang" onclick="javascript:recover_order('<?php echo $order_id; ?>');">RE-ORDER</a>
            <?php }?>

        </div>
      </div>
      
    </div>

<?php echo $footer; ?>
<script>
function confirm_order(order_id){
if(confirm('Are you sure?')){
           $.ajax({
            url: 'index.php?route=account/order/confirm',
            type: 'post',
            data: {order_id:order_id},
            dataType: 'json',
            success: function(json) {
               location.reload();
            }
        })
      
    }
}
function recover_order(order_id){
if(confirm('Are you sure?')){
           $.ajax({
            url: 'index.php?route=account/order/recover',
            type: 'post',
            data: {order_id:order_id},
            dataType: 'json',
            success: function(json) {
               location.reload();
            }
        })
      
    }
}
  $(function(){
    
    //下拉total_p
      $(".total_p").click(function(){
        if($(this).hasClass("active")){
          $(this).removeClass("active");
          $(this).siblings(".slide_p").stop().slideUp();
          $(this).siblings("hr").hide();
        }else{
          $(this).addClass("active");
          $(this).siblings(".slide_p").stop().slideDown();
          $(this).siblings("hr").show();
        }
        
        
      })
    
  })
  
  
  //倒计时
  function show_time() {
        $(".djs_p").each(function() {
            var endtime = $(this).prop("title");
            var time_start = new Date().getTime(); //设定当前时间
            var time_end = new Date(endtime).getTime(); //设定目标时间
            var time_distance = time_end - time_start;
            var timer;
            if (time_distance >= 0) {
                var int_day = Math.floor(time_distance / 86400000)
                time_distance -= int_day * 86400000;
                var int_hour = Math.floor(time_distance / 3600000)
                time_distance -= int_hour * 3600000;
                var int_minute = Math.floor(time_distance / 60000)
                time_distance -= int_minute * 60000;
                var int_second = Math.floor(time_distance / 1000)
                if (int_day < 10) {
                    int_day = "0" + int_day;
                }
                if (int_hour < 10) {
                    int_hour = "0" + int_hour;
                }
                if (int_minute < 10) {
                    int_minute = "0" + int_minute;
                }
                if (int_second < 10) {
                    int_second = "0" + int_second;
                }
                $(this).find(".int_day").text(int_day);
                $(this).find(".int_hour").text(int_hour);
                $(this).find(".int_minute").text(int_minute);
                $(this).find(".int_second").text(int_second);
            }else{
                clearInterval(timer);
                $(this).css("display","none");
            }
        })
        timer = setTimeout("show_time()", 1000);
    }
    show_time();
</script>