<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="order_con clearfix">
      <div class="or_content clearfix">
          <div class="top_yd clearfix">
            <h1><a class="fh" href="<?php echo $home?>">< BACK</a>PERSONAL INFORMATION</h1>
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
          <div class="form_text clearfix">
            <form method="post" action="<?php echo $edit?>">
              <h2>PERSONAL INFORMATION</h2>
            <!--label的class  true是输入正确的一种显示格式-->
              <label class="clearfix true" for="">
                <span class="pl_span">Frist Name</span>
                <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="Frist Name"   />
                <?php if ($error_firstname) { ?>
                <p class="ts_ps off"><?php echo $error_firstname; ?></p>
                <?  } ?>
              </label>

              <label class="clearfix true" for="">
                <span class="pl_span">Last Name</span>
                <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="Last Name"   />
                <?php if ($error_lastname) { ?>
                <p class="ts_ps off"><?php echo $error_lastname; ?></p>
                <?  } ?>
              </label>

              <label class="w_50 fl clearfix" for="">
                <span class="pl_span">Gender</span>
                <input type="text" name="gender" value="<?php echo $gender; ?>"   placeholder="Gender" />
              </label>

              <label class="w_50 fr clearfix" for="">
                <span class="pl_span">Birthday</span>
                 <input type="text" name="birthday" value="<?php echo $birthday; ?>"   placeholder="Birthday"  />
              </label>

              <label class="clearfix" for="">
                <span class="pl_span">Email</span>
                <input type="text" name="email" value="<?php echo $email; ?>"  placeholder="Email"  readonly="readonly" />
              </label>

              <label class="clearfix" for="">
                <span class="pl_span">Phone</span>
                <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="Phone"   />
                <?php if ($error_telephone) { ?>
                <p class="ts_ps off"><?php echo $error_telephone; ?></p>
                 <?  } ?>
              </label>
              
              <label class="w_50 yd_100 fl clearfix" for="">
                <span class="pl_span">Whatsapp</span>
                <input type="text" name="whatsapp" value="<?php echo $whatsapp; ?>" placeholder="Whatsapp"   />
                <?php if ($error_whatsapp) { ?>
                <p class="ts_ps off"><?php echo $error_whatsapp; ?></p>
                 <?  } ?>
              </label>
              
              <label class="w_50 yd_100 fr clearfix" for="">
                <span class="pl_span">Facebook</span>
                <input type="text" name="facebook" value="<?php echo $facebook; ?>" placeholder="Facebook"   />
                 <?php if ($error_facebook) { ?>
                <p class="ts_ps off"><?php echo $error_facebook; ?></p>
                 <?  } ?>
              </label>
              
              <label class="clearfix clear" for="">
                <span class="pl_span">Instagram</span>
                 <input type="text" name="instagram" value="<?php echo $instagram; ?>" placeholder="Instagram" />
                 <?php if ($error_instagram) { ?>
                <p class="ts_ps off"><?php echo $error_instagram; ?></p>
                 <?  } ?>
              </label>
              
              <button class="qx_btn" type="reset">Cancel</button>
              <button class="tj_btn" type="submit">Save</button>
            </form>
          </div>
        </div>
      </div>
      
    </div>

<?php echo $footer; ?> 