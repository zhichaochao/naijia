<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="order_con clearfix">
      <div class="or_content clearfix">
          <div class="top_yd clearfix">
            <h1><a class="fh" href="<?php echo  $home?>">< BACK</a>My Coupons</h1>
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
        
       <?php if(isset($coupons)){ ?> 
          <div class="right_text clearfix">
                    <div class="coupon clearfix">
                      <h1>My Coupons </h1>
                      
                      <div class="coupon_text clearfix">
                        <ul class="coupon_ul clearfix">
                     <?php foreach ($coupons as $coupon) { ?>
                        <?php if($coupon['usecoupon']==1){ ?> 
                          <li class="failed">
                          <?php }else{ ?>  
                           <li class="<?=$coupon['status']==1 ?'failed':'';?>" >
                          <?php }?>
                            <a>
                              <p class="p1">The full court is  <?php echo $coupon['total']; ?> </p>
                              <?php if($coupon['type']=='P') { ?> 
                               <p class="p2"> minus  <?php echo $coupon['discountp']; ?>%off.</p>
                              <?php }else{ ?>
                               <p class="p2"> minus  <?php echo $coupon['discount']; ?>.</p>
                              <?php }?>
                              <span class="sp_1"><?php echo $coupon['total']; ?></span>
                              <span class="sp_2"><em>Full court discount</em></span>
                              <p class="time">Expiration date:<?php echo $coupon['date_end']; ?></p>
                            </a>
                          </li>
                      <?php } ?> 
                          
                        </ul>
                        
                      </div>
                     <!--  <div class="fy_div">
                        <ul>
                          <li><a href="###">< Last</a></li>
                          <li class="active"><a href="###">1</a></li>
                          <li><a href="###">2</a></li>
                          <li><a href="###">3</a></li>
                          <li><a href="###">Next ></a></li>
                        </ul>
                      </div> -->
                    </div>
                    
                  </div>
        <?php }else{ ?> 
           <!-- STA 空页面-->
              <div class="right_text clearfix">
                <div class="null clearfix">
                  <div class="text clearfix">
                    <img src="catalog/view/theme/default/img/png/null_1.png"/>
                    <p>You haven`t get any coupons</p>
                    <a href="<?php echo $coupon?>">Receive coupons&nbsp;&nbsp;></a>
                  </div>
                </div>
                
              </div>
              <!-- END -->
        <?php } ?> 
        

        
      
      </div>
      
    </div>

<?php echo $footer; ?>
<script>
function ling() {
tips('Not Opened For The Time Being ','gantan',500);
}
    window.onload = function(){
      var lf_height = $(".lf_nav").height();
    $(".null").height(lf_height);
    var null_w = $(".null>.text").width();
    var null_h = $(".null>.text").height();
    $(".null>.text").css("margin-left",-null_w/2+"px").css("margin-top",-null_h/2+"px");
    }
</script>
