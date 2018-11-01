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
                <span class="span3">Order Number:<?php echo $order['order_number']; ?></span>
              </p>
              <?php if ($order['products']) { ?>
                <?php foreach ($order['products'] as $product) { ?>
              <a class="or_a clearfix" href="<?=$product['href'];?>">
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



                <a class="bot_a" href="<?php echo $order['view']; ?>">Review</a>
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
               location.reload();
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
<?php echo $footer; ?>
