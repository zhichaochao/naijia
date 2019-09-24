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

          
          <?php if($payment_code == 'bank_transfer' ) { ?>
          <?php if(empty($bank_receipt)){?>
          <p class="p1">Please finish payment or upload<br /> the bank alert.Or it will be<br /> invalid in 
            <span class="span_r djs_p" title="">
              <span class="int_hour">00</span><i>:</i>
              <span class="int_minute">00</span><i>:</i>
              <span class="int_second">00</span>
            </span>
          </p>

          <?php }else{ ?>
          <p class="p2" style="margin-top: 0;padding-top: 0.1rem;">
            Thanks for your order .<br />
            · Payment has been completed<br />
            · It will ready to ship in 1- 2 days.<br />
            Emails will update to you if your <br />
            package situation changes.
          </p>

          <?php }?>



          

          <!-- <span>Order date:2018-09-07</span> -->
       <!--  </div> -->

        <?php }else{ ?>
            <p class="p1">Please finish payment or upload<br /> the bank alert.Or it will be<br /> invalid in 
            <span class="span_r djs_p" title="">
              <span class="int_hour">00</span><i>:</i>
              <span class="int_minute">00</span><i>:</i>
              <span class="int_second">00</span>
            </span>
          </p>
        <?php }?>

        <?php if($payment_code == 'pp_standard' || $payment_code == 'pp_express') { ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay;?>" title="Pay"  class="pay_a">Continue too pay</a>
                  <?php } ?>

                  <?php if($payment_code == 'paystack') { ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay;?>" title="Pay"  class="pay_a">Continue to pay</a>
                  <?php } ?>

                  <!-- <?php if($bank_receipt) { ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay_receipt;?>" title="Pay"  class="pay_a">Re Submit Receipt</a>
                  <?php }elseif(!($payment_code == 'pp_standard' || $payment_code == 'pp_express')){ ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay_receipt;?>" title="Pay"  class="pay_a">Continues to pay</a>
                <?php } ?> -->

          <!-- <a class="pay_a" href="###">Continue To Pay</a> -->
           <span class="pay_m ">Pay method:<em style="color: red;"><?php echo $payment_method; ?></em></span>
          <span>Order date:<?php echo $date_added; ?></span>

        </div>
        <?php }elseif($order_status=='Complete'){?>
        <div class="left clearfix">
          <h2 class="huang"><?php echo $order_status; ?>  </h2>
          <p class="p3">
            Pending:<?php echo $date_added; ?> <br />
            <!-- Delivered 2018-08-28<br /> -->
            Delivered:<?php echo $delivered_date; ?><br />
            Complete:<?php echo $date_modified; ?>
          </p>
          <!-- <a class="pay_a huang" href="<?php echo $compltedorder; ?>">REVIEW</a> -->
          <a class="pay_a huang review_tc" href="javascript:;">REVIEW</a>
          <span>Order date:<?php echo $date_added; ?></span>
          <a class="btn_a contact_tc" href="">Contact us</a>
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
          <a class="btn_a contact_tc" href="">Contact us</a>
        </div>
<?php }elseif($order_status=='Delivered'){?>

        <div class="left clearfix">
          <h2 class="lv"><?php echo $order_status; ?> </h2>
          <p class="p3">
            Your package has been delivered<br /> 
            on <?php echo $delivered_date; ?>
          </p>
          <a class="pay_a lv" onclick="javascript:confirm_order('<?php echo $order_id; ?>');">Confirm Receipt</a>
          <span>Order date:<?php echo $date_added; ?></span>
          <a class="btn_a contact_tc" href="">Contact us</a>
        </div>

<?php }elseif($order_status=='lnvalid'){?>
     <?php if($payment_code == 'paystack') { ?>
     <div class="left clearfix">
          <h2 class="hong"><?php echo $order_status; ?> </h2>
          <p class="p1">
            Fail to complete payment or upload 
            bank alert in time.
          </p>
          <span>Order date:<?php echo $date_added; ?></span>
        </div>

     <?php }else{ ?>
        <div class="left clearfix">
          <h2 class="hong"><?php echo $order_status; ?> </h2>
          <p class="p1">
            Fail to complete payment or upload 
            bank alert in time.
          </p>
          <a class="pay_a hong" onclick="javascript:recover_order('<?php echo $order_id; ?>');">Recover To Pay</a>
          <span>Order date:<?php echo $date_added; ?></span>
        </div>
     <?php }?>

        

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
          
            <?php if(isset($coupon_total)) { ?>
              <p><i class="xl_i"><?php echo $coupon_title; ?></i> <span><?php echo $coupon_total; ?></span></p>
            <?php }?>
            </div>
            <hr />
            <p class="total_p active clearfix">
              <span>Total</span>
              <em><?php echo $total; ?></em>
            </p>

          </div>
        </div>
      </div>
      <?php if($shippingorpick == 'pick' ) { ?>
      <div class="address clearfix">
        <dl class="clearfix">
          <dt style="width: 1.4rem;">Pickup Address:</dt>
          <dd>alausa.obafemi awolowo way. ikeja
            Lagos，Nigeria</dd>
        </dl>
      </div>
      
      <?php }else{?>
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
      <?php }?>

      <!-- s上传凭证 -->
      <?php if($payment_code=='bank_transfer') { ?>
    <div class="xianxia clearfix">
    <!-- <form action="upload_receipt" method="post"> -->
    <form  action="<?=$upload_receipt;?>" method="post"  enctype="multipart/form-data"  onsubmit="return bitian();">
    <input type="hidden" value="<?php echo $order_id; ?>" name="order_id">
        <div class="left clearfix">
          <span class="span1">Bank Alert</span>
          <span class="span2">Voucher picture</span>
          <div class="hui">
              <ul>
              <?php if($bank_receipt){?>
              <?php foreach ($bank_receipt as $k=>$bankvalue) { ?>
              <li>
                <div class="img">
                <img src="<?php echo $bankvalue['bank_receipt'];?>" />
                <div class="closes" onclick="del_img($(this))"></div>
                </div>
              </li>
            <?php } ?>
            <?php } ?>
              </ul>
            

          </div>
        </div>
        
        <?php if($order_status =='Pending' || $order_status =='Pending-unfilled' ){?>
        <div class="center clearfix">
          <div class="btn">
            <div class="file_div">
              <input type="file" name="bank_receipt[]" id="file" value="" title="上传照片" onchange="getphoto(this)" class="flie_in"/>
              <a class="btn1" href="###">Re-upload</a>
            </div>
            <a  href="javascript:;" class="btn2"><input type="submit" value="SUBMIT"></a>
            
          </div>
          <p class="p1">*We will check and confirmed your payment as soon as you submit.</p>
        </div>
            <?php } ?>
        </form>
      </div>
<?php } ?>
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
              <a href="<?php echo $product['href']; ?>">
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
      <?php if($order_status=='Complete'){?>
      <p class="ms_p">Please contact us if you have any problem of your order.</p>
      <?php } ?>
      <?php if($order_status=='Delivered'){?>
      <p class="ms_p">Your package is on shipping, contact us if you have any problem.</p>
      <?php } ?>
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
        var html = $(node).prop("outerHTML");
        console.log(html)
        $(node).hide();
        $(node).siblings('.btn1').text('Countinue Upload');
        $(".file_div").append(html)
        return imgURL;
    }
 
  //上传选中的图片 显示页面
     function creatImg(imgRUL){
        var text_li = '<li><div class="img"><img src="'+imgRUL+'"/>'+
            '<div class="close" onclick="del_img($(this))"></div></div></li>'
        
        $(".hui>ul").append(text_li)
        $(".hui .close").css("display","block");
    }
  
  //删除选中的图片
  function del_img(obj){
    obj.parents("li").remove();
    $("#file").remove();
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
  // $(".total_p").click(function(){
  //       if($(this).hasClass("active")){
  //         $(this).removeClass("active");
  //         $(this).siblings(".slide_p").stop().slideUp();
  //         $(this).siblings("hr").hide();
  //       }else{
  //         $(this).addClass("active");
  //         $(this).siblings(".slide_p").stop().slideDown();
  //         $(this).siblings("hr").show();
  //       }
        
        
  //     })
    
  })
</script>