<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="order_con clearfix">
      <div class="or_content clearfix">
          <div class="top_yd clearfix">
            <h1><a class="fh" href="###">< BACK</a> MY ORDERG</h1>
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
            <?php if ($orders) { ?>
            <?php foreach ($orders as $order) { ?>
            <li class="clearfix">
              <p class="p1 clearfix">
                <span class="span1"><?php echo $order['status']; ?></span>
                <span class="span2">(<?php echo $order['date_added']; ?>)</span>
                <span class="span3">Order Number:<?php echo $order['order_num']; ?></span>
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
                    <?php foreach ($product['options'] as $option) { ?>   
                    <!-- <p>Natural black; 12inch <i></br></i> 4*13 frontal cap;</p>   -->
                      <p><?php echo $option['name']; ?>:<?php echo $option['value']; ?></p>    
                      <!-- <p><?php echo $option['value']; ?> </p> -->
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



            
            <!-- <li class="clearfix">
              <p class="p1 clearfix">
                <span class="span1">Pending</span>
                <span class="span2">(2018-11-02)</span>
                <span class="djs_p" title="2018/09/20 19:00:00">
                  <em>Invalid in</em>
                  <span class="int_hour">00</span><i>:</i>
                  <span class="int_minute">00</span><i>:</i>
                  <span class="int_second">00</span>
                </span>
              </p>

              <a class="or_a clearfix" href="###">
                <div class="pic_img">
                  <img src="catalog/view/theme/default/img/yd_shop1.jpg"/>
                </div>
                <div class="text">
                  <h1 class="ov_text">10”-30” Virgin Brazilioan Brazilioan Brazilioan Brazilioan</h1>
                  <p>Natural black; 12inch <i></br></i> 4*13 frontal cap;</p>
                </div>
                <span class="price">$35.05</span>
                <span class="num">X1</span>
              </a>

              <a class="or_a clearfix" href="###">
                <div class="pic_img">
                  <img src="img/yd_shop1.jpg"/>
                </div>
                <div class="text">
                  <h1 class="ov_text">10”-30” Virgin Brazilioan Brazilioan Brazilioan Brazilioan</h1>
                  <p>Natural black; 12inch <i></br></i> 4*13 frontal cap;</p>
                </div>
                <span class="price">$35.05</span>
                <span class="num">X1</span>
              </a>

              <p class="p2 clearfix">
                Total: <span>$70.10</span>
              </p>
              
              <div class="bot">
                <div class="det"></div>
                <a class="bot_a a1" href="###">Continue To Pay</a>
                <a class="bot_a a2" href="###">Cancel</a>
              </div>
            </li> -->
            
            <!-- <li class="clearfix">
              
              <p class="p1 clearfix">
                <span class="span1">Delivered</span>
                <span class="span2">(2018-11-02)</span>
                <span class="span3">Order Number:000001</span>
              </p>
              
              <a class="or_a clearfix" href="###">
                <div class="pic_img">
                  <img src="catalog/view/theme/default/img/yd_shop1.jpg"/>
                </div>
                <div class="text">
                  <h1 class="ov_text">10”-30” Virgin Brazilioan Brazilioan Brazilioan Brazilioan</h1>
                  <p>Natural black; 12inch <i></br></i> 4*13 frontal cap;</p>
                </div>
                <span class="price">$35.05</span>
                <span class="num">X1</span>
              </a>
              <p class="p2 clearfix">
                Total: <span>$35.25</span>
              </p>
              
              <div class="bot">
                <div class="det"></div>
                <a class="bot_a" href="###">Confirm Receipt</a>
              </div>
            </li> -->
            
            <!-- <li class="clearfix">
              
              <p class="p1 clearfix">
                <span class="span1">Cancelled</span>
                <span class="span2">(2018-11-02)</span>
                <span class="span3">Order Number:000001</span>
              </p>
              
              <a class="or_a clearfix" href="###">
                <div class="pic_img">
                  <img src="catalog/view/theme/default/img/yd_shop1.jpg"/>
                </div>
                <div class="text">
                  <h1 class="ov_text">10”-30” Virgin Brazilioan Brazilioan Brazilioan Brazilioan</h1>
                  <p>Natural black; 12inch <i></br></i> 4*13 frontal cap;</p>
                </div>
                <span class="price">$35.05</span>
                <span class="num">X1</span>
              </a>
              <p class="p2 clearfix">
                Total: <span>$35.25</span>
              </p>
              
              <div class="bot">
                <div class="det active"></div>
                <a class="bot_a a1" href="###">Recover Order</a>
              </div>
            </li> -->
         <!--    <li class="clearfix">
              
              <p class="p1 clearfix">
                <span class="span1">Invalid</span>
                <span class="span2">(2018-11-02)</span>
                <span class="span3">Order Number:000001</span>
              </p>
              
              <a class="or_a clearfix" href="###">
                <div class="pic_img">
                  <img src="catalog/view/theme/default/img/yd_shop1.jpg"/>
                </div>
                <div class="text">
                  <h1 class="ov_text">10”-30” Virgin Brazilioan Brazilioan Brazilioan Brazilioan</h1>
                  <p>Natural black; 12inch <i></br></i> 4*13 frontal cap;</p>
                </div>
                <span class="price">$35.05</span>
                <span class="num">X1</span>
              </a>
              <p class="p2 clearfix">
                Total: <span>$35.25</span>
              </p>
              
              <div class="bot">
                <div class="det active"></div>
                <a class="bot_a a1" href="###">Recover Order</a>
              </div>
            </li>
 -->
           <!--  <li class="clearfix">
              <p class="p1 clearfix">
                <span class="span1">Pending-unfilled</span>
                <span class="span2">(2018-11-02)</span>
                <span class="span3">Order Number:000001</span>
              </p>
              
              <a class="or_a clearfix" href="###">
                <div class="pic_img">
                  <img src="catalog/view/theme/default/img/yd_shop1.jpg"/>
                </div>
                <div class="text">
                  <h1 class="ov_text">10”-30” Virgin Brazilioan Brazilioan Brazilioan Brazilioan</h1>
                  <p>Natural black; 12inch <i></br></i> 4*13 frontal cap;</p>
                </div>
                <span class="price">$35.05</span>
                <span class="num">X1</span>
              </a>
              <p class="p2 clearfix">
                Total: <span>$35.25</span>
              </p>
              
              <div class="bot">
                <div class="det"></div>
                <a class="bot_a" href="###">View Details</a>
              </div>
            </li> -->
            <?php } ?>
            <?php } else { ?>
          <div class="m_account clearfix">
          
          <img src="/catalog/view/theme/default/img/png/order.png"/>
          <p> You have placed no orders</p>
          <a class="a_btn" href="<?php echo $goshopping?>">GO SHOPPING &nbsp;&nbsp;&nbsp;></a>
          
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
            url: 'index.php?route=account/order/delete',
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
</script>
<?php echo $footer; ?>
