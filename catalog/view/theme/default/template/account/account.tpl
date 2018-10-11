<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="order_con clearfix">
      <div class="or_content clearfix">
          <div class="top_yd clearfix">
            <h1><a class="fh" href="<?php echo $home?>">< BACK</a>My Profile</h1>
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
        
        <div class="right_text clearfix">
          
          <div class="grxx_text clearfix">
            <div class="grxx_con clearfix">
              <div class="text_bt clearfix">
                <h2>My Profile</h2>
                <hr />              
              </div>
              
              <div class="tx_div clearfix">
                <img src="catalog/view/theme/default/img/png/touxiang.png"/>
                <p><?php echo $firstname ?></p>
                <span><?php echo $telephone ?></span>
              </div>
              <!--有vip的状态  给div.top加active-->
              <div class="top clearfix">
                <span class="sp_lf"><?php echo $firstname ?></span>
                <span class="sp_top">VIP I</span>
                <span class="sp_bot"> Join VIP Program Now</span>
                <span class="sp_bot2"> Loyalty point 888</span>
              </div>
              
              <ul class="grxx_ul clearfix">
                <li>
                  <span class="lf">Gender:</span>
                  <span class="rf"><?php echo $gender; ?></span>
                </li>
                <li>
                  <span class="lf">Birthday:</span>
                  <span class="rf"><?php echo $birthday; ?></span>
                </li>
                <li>
                  <span class="lf">Email:</span>
                  <span class="rf"><?php echo $email; ?></span>
                </li>
                <li>
                  <span class="lf">Phone:</span>
                  <span class="rf">+<?php echo $telephone ?></span>
                </li>
                <li>
                  <span class="lf">Whatsapp:</span>
                  <span class="rf"><?php echo $whatsapp; ?></span>
                </li>
                <li>
                  <span class="lf">Facebook:</span>
                  <span class="rf"><?php echo $facebook; ?></span>
                </li>
                <li>
                  <span class="lf">Instagram:</span>
                  <span class="rf"><?php echo $instagram; ?></span>
                </li>
              </ul>
              <a class="a_edit" href="<?php echo $edit ?>"><span>EDIT</span></a>
              
            </div>
          </div>
        
          <a class="change_a" href="<?php echo $editchange ?>"><span>Change Password</span></a>
        
        </div>
      </div>
      
    </div>

<?php echo $footer; ?> 