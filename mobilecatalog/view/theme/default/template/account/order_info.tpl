<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    

    <!--移动端-->
    <div class="ordet_con clearfix">
      <div class="or_content clearfix">
        <div class="top_yd clearfix">
          <p><a class="fh" href="<?=$home;?>">< BACK</a> <span>Order No:<?php echo $order_number; ?></span></p>
        </div>

        <?php if($order_status=='Pending'){?>
        <?php if($payment_code == 'bank_transfer' ) { ?>

         <?php if(empty($bank_receipt)){?>
         <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Please finish payment or upload the bank alert.</p>
          <p class="p1">Or it will be invalid in 
            <span class="span_r djs_p" title="">
              <span class="int_hour">00</span><i>:</i>
              <span class="int_minute">00</span><i>:</i>
              <span class="int_second">00</span>
            </span>
          </p>
          <p class="p1">Pay method:<em style="color: red;font-size: 0.24rem;"><?php echo $payment_method; ?></em></p>
        </div>

          <?php }else{ ?>
          <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1 class="hei"><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Thanks for your order .</p>
          <p class="p1">· Payment has been completed.</p>
          <p class="p1">· It will ready to ship in 1- 2 days.</p>
          <p class="p1">Emails will update to you if your package situation changes.</p>
        </div>
         <!--  <p class="p2">
            Thanks for your order .<br />
            · Payment has been completed<br />
            · It will ready to ship in 1- 2 days.<br />
            Emails will update to you if your <br />
            package situation changes.
          </p> -->

          <?php }?>

         <!-- <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1 class="hei"><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Thanks for your order .</p>
          <p class="p1">· Payment has been completed.</p>
          <p class="p1">· It will ready to ship in 1- 2 days.</p>
          <p class="p1">Emails will update to you if your package situation changes.</p>
          <p class="p1">Pay method:<em style="color: red;font-size: 0.24rem;"><?php echo $payment_method; ?></em></p>
        </div> -->
          <!-- <span>Order date:2018-09-07</span> -->
       <!--  </div> -->

        <?php }else{ ?>
          <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Please finish payment or upload the bank alert.</p>
          <p class="p1">Or it will be invalid in 
            <span class="span_r djs_p" title="">
              <span class="int_hour">00</span><i>:</i>
              <span class="int_minute">00</span><i>:</i>
              <span class="int_second">00</span>
            </span>
          </p>
          <p class="p1">Pay method:<em style="color: red;font-size: 0.24rem;"><?php echo $payment_method; ?></em></p>
        </div>
        <?php }?>
        <!--  -->
        

        <?php }elseif($order_status=='Complete'){?>

        <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1 class="hei"><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <ul>
            <li>Pending <span><?php echo $date_added; ?></span></li>
            <li>Delivered <span><?php echo $delivered_date; ?></span></li>
            <li>Completed <span><?php echo $date_modified; ?></span></li>
          </ul>
          <!-- <a class="modal_btn" href="<?php echo $compltedorder; ?>">REVIEW</a> -->
          <button class="modal_btn review_tc">Review</button>
          <!-- <button class="modal_btn" >Review</button> -->
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
          <p class="p1">Your package has been delivered on <?php echo $delivered_date; ?>. </p>
        </div>
        <?php }elseif($order_status=='lnvalid'){?>

         <?php if($payment_code == 'paystack') { ?>

          <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Fail to complete payment or <i><br /></i>  upload bank alert in time.</p>
          <!-- <a class="pay_a" onclick="javascript:recover_order('<?php echo $order_id; ?>');">Recover to pay</a> -->
        </div>

         <?php }else{?>
         <div class="zt_top clearfix">
          <em class="line_h"></em>
          <h1><i></i> <span><?php echo $order_status; ?> </span><p>(<?php echo $date_added; ?>)</p></h1>
          <p class="p1">Fail to complete payment or <i><br /></i>  upload bank alert in time.</p>
          <a class="pay_a" onclick="javascript:recover_order('<?php echo $order_id; ?>');">Recover to pay</a>
        </div>

         <?php }?>

        

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
              <a href="<?php echo $product['href']; ?>">
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

        <?php if($shippingorpick == 'pick' ) { ?>
        <div class="or_address clearfix">
          <h1>Pickup Address:</h1>
          <div class="text">
          <p>alausa.obafemi awolowo way. ikeja
            Lagos，Nigeria</p>
          </div>
        </div>
        <?php }else{?>
        <div class="or_address clearfix">
          <h1>Shipping Address</h1>
          <div class="text">
          <p><?php echo $shipping_address; ?></p>
          </div>
        </div>
        <?php } ?>
         <?php if($payment_code=='bank_transfer') { ?>

          <div class="xianxia clearfix">

          <form  action="<?=$upload_receipt;?>" method="post"  enctype="multipart/form-data"  >
          <input type="hidden" value="<?php echo $order_id; ?>" name="order_id">
          <span class="span1">Bank Alert</span>
          <span class="span2">Voucher picture</span>
          <div class="hui">
            <ul>
                <?php if($bank_receipt){?>
                <?php foreach ($bank_receipt as $k=>$bankvalue) { ?>
                <li>
                  <div class="img">
                  <img src="<?php echo $bankvalue['bank_receipt'];?>" />
                  <div class="close" onclick="del_img($(this))"></div>
                  </div>
                </li>
              <?php } ?>
              <?php } ?>
                </ul>
            <!-- <div class="img">
              <img src="<?php echo $bank_receipt;?>" name="bank_receipt"/>
              <div class="close" onclick="del_img($(this))"></div>
            </div> -->
          </div>
          <div class="center">
            <div class="btn">
              <div class="file_div">
                <input type="file" name="bank_receipt[]" id="file" value="" title="上传照片" onchange="getphoto(this)" class="flie_in"/>
                <a class="btn1" href="">Re-upload</a>
              </div>
              <!-- <a  href="###"></a> -->
              <input type="submit" value="SUBMIT2">
            </div>
          </div>
          <p class="p1">*We will check and confirmed your payment as soon as you submit.</p>
          </form>
        </div>


        <?php }?>
        <div class="total clearfix">
          <div class="right clearfix">
            <p class="total_p active clearfix">
            <?php if(isset($coupon_total)) { ?>
            <i class="text_i">Coupon: <i><?php echo $coupon_total; ?></i></i>
            <?php }?>
              
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
              <?php if(isset($coupon_total)) { ?>
              <p><i class="xl_i"><?php echo $coupon_title; ?></i> <span><?php echo $coupon_total; ?></span></p>
            <?php }?>
             

            </div>

            
          </div>

            <?php if($order_status=='Pending' || $order_status=='lnvalid'){?>
              <?php if($payment_code == 'pp_standard' || $payment_code == 'pp_express') { ?>
              <a class="btn_a hong" href="<?php echo $repay;?>">CONTINUE TO PAY</a>
            <?php }?>
            <?php }?>

            <?php if($order_status=='Complete' ){?>
            <button class="md_btn w_50 contact_tc">CONTACT US</button>
              <!-- <button class="md_btn w_50">CONTACT US</button> -->
              <a class="btn_a1 btn_a review_tc" href="javascript:;">REVIEW</a>
              <!-- <a class="btn_a1 btn_a" href="<?php echo $compltedorder; ?>">REVIEW</a> -->
              <p class="ms_p pd_no">Please contact us if you have any problem of your order.</p>
            <?php }?>

             <?php if($order_status=='Delivered'){?>
              <button class="md_btn w_50 contact_tc">CONTACT US</button>
              <em class="btn_a1 btn_a"  onclick="javascript:confirm_order('<?php echo $order_id; ?>');">CONFIRM RECEIPT</em>
              <p class="ms_p pd_no">Your package is on shipping, contact us if you have any problem.</p>
            <?php }?>


            <?php if($order_status=='Pending-unfilled'){?>
              <a class="btn_a huang contact_tc" href="javascript:;">CONTACT US</a>
              <p class="ms_p">Your package is on shipping, contact us if you have any problem.</p>
            <?php }?>

            <?php if($order_status=='Canceled'){?>
            <a class="btn_a huang" onclick="javascript:recover_order('<?php echo $order_id; ?>');">RE-ORDER</a>
            <?php }?>

        </div>
      </div>
      
    </div>
    <!--评价弹窗-->
    <div class="review_modal clearfix">
      <div class="text clearfix">
        <img src="catalog/view/theme/default/img/pl_modal.jpg"/>
        <p>Thanks,would you like to sent us a review?</p>
        
        <div class="btn">
          <a class="qd_btn" href="<?php echo $compltedorder; ?>">Yes, why not?</a>
          <button class="qx_btn">Yes, But later.</button>
        </div>
      </div>
    </div>
    <!--联系我们弹窗-->
    <div class="contact_modal clearfix">
      <div class="text clearfix">
        <ol class="clearfix">
          <li>
            <a href="mailto:<?php echo $email; ?>">
              <span class="img"></span>
              <span class="span_p">E-mail</span>
            </a>
          </li>
          <li>
            <a target="_blank"  href="http://www.facebook.com/<?=$facebook;?>">
              <span class="img"></span>
              <span class="span_p">Facebook</span>
            </a>
          </li>
          <li>
            <a target="_blank"  href="http://api.whatsapp.com/send?phone=<?=$whatsapp;?>">
              <span class="img"></span>
              <span class="span_p">Whatsapp</span>
            </a>
          </li>
        </ol>
        <p>
          Your order is confirmed and we're getting it ready.
          Send us a message if you have any question, <br />
          we will reply you within 24 hours.
        </p>
      </div>
    </div>

<?php echo $footer; ?>
<script>
function bitian() {
    // alert($('#file').val());return false;
    if (!$('#file').val()) {alert("Can't be empty");return false;}
  }
  $(function(){
    
    //下拉total_p
      // $(".total_p").click(function(){
      //   if($(this).hasClass("active")){
      //     $(this).removeClass("active");
      //     $(this).siblings(".slide_p").stop().slideUp();
      //     $(this).siblings("hr").hide();
      //   }else{
      //     $(this).addClass("active");
      //     $(this).siblings(".slide_p").stop().slideDown();
      //     $(this).siblings("hr").show();
      //   }
        
        
      // })
    
  })
  //调取上传框
    function getphoto(node) {
        var imgURL = "";
        try{
            var file = null;
            if(node.files && node.files[0] ){
                file = node.files[0];
            }else if(node.files && node.files.item(0)) {
                file = node.files.item(0);
            }
            try{
                imgURL =  file.getAsDataURL();
            }catch(e){
                imgRUL = window.URL.createObjectURL(file);
            }
        }catch(e){
            if (node.files && node.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    imgURL = e.target.result;
                };
                reader.readAsDataURL(node.files[0]);
            }
        }
        creatImg(imgRUL);
        var html = $(node).prop('outerHTML');
        $(node).hide();
        $(".file_div").append(html);
        $(node).siblings('.btn1').text('Countinue Upload')
        return imgURL;
    }
 
  //上传选中的图片 显示页面
     function creatImg(imgRUL){
//      $(".hui img").attr("src",imgRUL);
        var text_li = '<li><div class="img"><img src="'+imgRUL+'"/>'+
            '<div class="close" onclick="del_img($(this))"></div></div></li>'
    $(".hui>ul").append(text_li);
        $(".hui .close").css("display","block");
    }
  
  //删除选中的图片
 function del_img(obj){
    obj.parents("li").remove();
  }
</script>
<script>
function confirm_order(order_id){
  // alert(1111);die;
// if(confirm('Are you sure?')){

           $.ajax({
            url: '<?php echo $orderconfirm?>',
            type: 'post',
            data: {order_id:order_id},
            dataType: 'json',
            success: function(json) {
               location.reload();
            }
        })
      
    // }
}
function recover_order(order_id){
// if(confirm('Are you sure?')){
           $.ajax({
            url: '<?php echo $orderrecover?>',
            type: 'post',
            data: {order_id:order_id},
            dataType: 'json',
            success: function(json) {
               location.reload();
            }
        })
      
    // }
}
  
  
  //倒计时
  function show_time() {
        $(".djs_p").each(function() {
            var endtime = $(this).prop("title");
            if (endtime>0) {
               var time_start = new Date().getTime(); //设定当前时间
            var time_end =endtime; //设定目标时间
            var time_distance = time_end - time_start;

            }else{


            var time_start = new Date().getTime(); //设定当前时间
            var time_end = time_start+(<?=$lest_time;?>*1000); //设定目标时间
            var time_distance = time_end - time_start;
             $(this).attr("title",time_end);
             }
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
              window.location.href="<?php echo $back ?>";
            }
        })
        timer = setTimeout("show_time()", 1000);
    }
    show_time();
</script>
<script>
  $(function(){
    //REVIEW
    $(".review_tc").click(function(){
      $(".review_modal").fadeIn();
      $("body").css("overflow","hidden");
    })
    $(".review_modal .qx_btn").click(function(){
      $(".review_modal").fadeOut();
      $("body").css("overflow","");
    })
    $(".review_modal").click(function(e){
      var close = $('.review_modal .text'); 
        if(!close.is(e.target) && close.has(e.target).length === 0){
          $(".review_modal").fadeOut();
        $("body").css("overflow","");
      }
    })
    
    //contact
    $(".contact_tc").click(function(){
      $(".contact_modal").fadeIn();
      $("body").css("overflow","hidden");
    })
    $(".contact_modal").click(function(e){
      var close = $('.contact_modal .text'); 
        if(!close.is(e.target) && close.has(e.target).length === 0){
          $(".contact_modal").fadeOut();
        $("body").css("overflow","");
      }
    })
    
    
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
</script>