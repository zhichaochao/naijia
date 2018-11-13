<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="order_con clearfix">
      <div class="or_content clearfix">
          <div class="top_yd clearfix">
            <h1><a class="fh" href="<?=$home;?>">< BACK</a> MY ORDERG</h1>
          </div>
          
        <div class="lf_nav">
          <img class="tx_img" src="catalog/view/theme/default/img/png/touxiang.png" alt="" />
          <h2><?php echo $firstname ?></h2>
          <p class="p1"><?php echo $telephone ?></p>
          
          <ul>
           <?php echo $account_left; ?>
          </ul>
          
          <img class="vip_img" src="catalog/view/theme/default/img/vip.jpg" alt="" />
        </div>
        
        <div class="right_text">
          
          <?php if ($orders) { ?>
          <div class="or_nav">
            <ol class="ornav_ol clearfix">
              <li class="active"><a href="###">Pending</a></li>
              <li><a href="###">Unfilled</a></li>
              <li><a href="###">Delivered</a></li>
              <li><a href="###">Complete</a></li>
              <li><a href="###">Invalid</a></li>
            </ol>
          </div>
          
          <ul class="or_ul">
            
            <?php foreach ($orders as $order) { ?>
            <li class="clearfix">
              <p class="p1 clearfix">
                <span class="span1"><?php echo $order['status']; ?></span>
                <span class="span2">(<?php echo $order['date_added']; ?>)</span>
                 <?php if ($order['status']=='Pending') { ?>

                <span class="djs_p" title="<?php echo $order['lest_time']; ?>">
                  <em>Invalid in</em>
                  <span class="int_hour">00</span><i>:</i>
                  <span class="int_minute">00</span><i>:</i>
                  <span class="int_second">00</span>
                </span>
                 <?php }else{?>
 <span class="span3">Order Number:<?php echo $order['order_number']; ?></span>
                 <?php }?>

               
              </p>
              <?php if ($order['products']) { ?>
                <?php foreach ($order['products'] as $product) { ?>
              <a class="or_a clearfix" href="<?=$order['view'];?>">
                <div class="pic_img">
                  <img src="<?php echo $product['image']; ?>"/>
                </div>
                <div class="text">
                  <h1 class="ov_text"><?php echo $product['name']; ?></h1>
                  <?php if ($product['options']) { ?>
                  <p>color:<?php echo $product['color']; ?> </p>
                    <?php foreach ($product['options'] as $option) { ?>   
                    <!-- <p>Natural black; 12inch <i></br></i> 4*13 frontal cap;</p>   -->
                      <p><?php echo $option['name']; ?>:<?php echo $option['value']; ?></p>    
                    <?php } }?>

                </div>
                <span class="price"><?php echo $product['price']; ?></span>
                <span class="num">X<?php echo $product['quantity']; ?></span>
              </a>
              <?php } }?>
              <p class="p2 clearfix">
                Total: <span><?php echo $order['total']; ?></span>
              </p>
              <div class="bot">
                <div class="det active" onclick="javascript:order_remove('<?php echo $order['order_id']; ?>');"></div>
                <?php if($order['status'] == 'Pending'){ ?>
                <a class="bot_a a2" href="<?php echo $order['cancel_href'];?>" onclick="cancel_order('<?php echo $order['cancel_href'];?>')">Cancel</a>
                <?php } ?>
                <?php if($order['payment_code'] == 'pp_standard' || $order['payment_code'] == 'pp_express') { ?>
                <a class="bot_a a1" href="<?php echo $order['repay'];?>">Continue To Pay</a>
                <?php } ?>

                <?php if($order['status'] == 'Canceled' || $order['status'] == 'lnvalid' ){ ?>
                <a class="bot_a a1"  onclick="javascript:recover_order('<?php echo $order['order_id']; ?>');">Recover Order</a>
                <?php } ?>
                 <?php if($order['status'] == 'Delivered'){ ?>
                 <a class="bot_a" onclick="javascript:confirm_order('<?php echo $order['order_id']; ?>');">Confirm Receipt</a>
                <?php } ?>


              <?php if($order['status'] == 'Complete'){ ?>
                <a class="bot_a" href="<?php echo $order['compltedorder']; ?>">Review</a>
                  <?php } ?>
              </div>
            </li>


            <?php } ?>
            <?php } else { ?>
        <div class="right_text clearfix">
          <div class="null clearfix">
            <div class="text clearfix">
              <img src="catalog/view/theme/default/img/png/null_3.png"/>
              <p>You haven`t placed any orders ~</p>
              <a href="<?php echo $goshopping;?>">GO SHOPPING&nbsp;&nbsp;></a>
            </div>
          </div>
          
        </div>
          <?php } ?>
          </ul>
        
        </div>
      </div>
      
    </div>
    <script>
function cancel_order(url){
  if(confirm('Are You Sure?')){
    location.href=url;
  }
}
function order_remove(order_id){
if(confirm('Are you sure?')){
           $.ajax({
            url: '<?php echo $orderdel?>',
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
            url: '<?php echo $orderrecover?>',
            type: 'post',
            data: {order_id:order_id},
            dataType: 'json',
            success: function(json) {
              window.location.href='<?php echo $view?>'+'&order_id='+(json.order_id);
               // location.reload();
            }
        })
      
    }
}
function confirm_order(order_id){
if(confirm('Are you sure?')){
           $.ajax({
            url: '<?php echo $orderconfirm?>',
            type: 'post',
            data: {order_id:order_id},
            dataType: 'json',
            success: function(json) {
               location.reload();
            }
        })
      
    }
}
</script>
<script>
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
    window.onload = function(){
      var lf_height = $(".lf_nav").height();
    $(".null").height(lf_height);
    var null_w = $(".null>.text").width();
    var null_h = $(".null>.text").height();
    $(".null>.text").css("margin-left",-null_w/2+"px").css("margin-top",-null_h/2+"px");
    }
</script>
<?php echo $footer; ?>
