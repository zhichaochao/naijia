<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="order_con clearfix">
      <div class="or_content clearfix">
          <div class="top_yd clearfix">
            <h1><a class="fh" href="<?php echo  $home?>">< BACK</a>My Message</h1>
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
<?php if($messages){?>
        <div class="right_text  clearfix">
          <div class="my_message clearfix">
            <h1 class="yd_hide">MY  MESSAGE</h1>
            <ul>
             
            <?php foreach ($messages as $k => $message) {?>
         
              <li>
                <p class="p1"><span>Guest service</span>  <em>(<?php echo $message['date_added']; ?>)</em></p>
                <p class="p2">
                  <?php echo $message['message']; ?>
                </p>
              </li>
              <?php }?>  



            </ul>
          </div>
        </div>
        <?php }else{?>
                <div class="right_text clearfix">
          <div class="null clearfix">
            <div class="text clearfix">
              <img src="catalog/view/theme/default/img/png/null_1.png"/>
              <p>You haven`t get any message</p>
              <!-- <a href="javascript:;">Receive coupons&nbsp;&nbsp;></a> -->
            </div>
          </div>
          
        </div>

<?php }?>  

      
      </div>
      
    </div>

<?php echo $footer; ?>
<script>
    window.onload = function(){
      var lf_height = $(".lf_nav").height();
    $(".null").height(lf_height);
    var null_w = $(".null>.text").width();
    var null_h = $(".null>.text").height();
    $(".null>.text").css("margin-left",-null_w/2+"px").css("margin-top",-null_h/2+"px");
    }
</script>
