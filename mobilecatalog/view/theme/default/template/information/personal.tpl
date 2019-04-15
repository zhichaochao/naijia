<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    
    <div class="my_center clearfix">
      <div class="text clearfix">
        <div class="top clearfix">

        <!--没有vip-->
        <?php if($balance==0){?>
          <div class="no_vip">
            <img src="catalog/view/theme/default/img/png/touxiang_.png"/>
            <p><?php echo $firstname?></p>
            <span class="vip_span">VIP I  Join VIP Program Now</span>
          </div> 
          <?php }else{ ?>
          <div class="has_vip">
            <img src="catalog/view/theme/default/img/png/touxiang_.png"/>
            <p><?php echo $firstname?></p>
            <span class="vip_span">VIP I  Reward Point：<?php echo $balance?></span>
          </div>
          <?php }?>
          <ol class="clearfix">
            <li>
              <a href="<?php echo $order?>">
                <em></em>
                <span>My orders</span>
              </a>
            </li>
            <li>
              <a href="<?php echo $address?>">
                <em></em>
                <span>My Addresses</span>
              </a>
            </li>
            <li>
              <a href="<?php echo $profile?>">
                <em></em>
                <span>My Profile</span>  
              </a>
            </li>
          </ol>
        </div>
        <div class="bot clearfix">
          <ul class="clearfix">
            <li>
              <a href="<?php echo $wishlist?>">
                My Wishlist 
              </a>
            </li>
            <li>
              <a href="<?php echo $coupon?>">
                My Coupons 
              </a>
            </li>
             <li>
              <a href="<?php echo $message?>">
                My Message
              </a>
            </li>
             <li>
              <a href="<?php echo $reservation?>">
                My Reservation
              </a>
            </li>
          </ul>
          <!-- <img src="catalog/view/theme/default/img/vip.jpg"/> -->
        </div>
        
      </div>
    </div>
<?php echo $footer; ?>
