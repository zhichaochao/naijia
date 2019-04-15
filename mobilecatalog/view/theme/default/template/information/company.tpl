<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    
    <div class="about">
      <h1>About Us</h1>
      <img class="about_ban lazyLoad" srcs="catalog/view/theme/default/img/yd_about1.jpg" alt="" />
      <ul class="about_ul">
        <li class="clearfix">
          <img class="li_img" src="catalog/view/theme/default/img/yd_about2.jpg" alt="" />
          <div class="text">
            <h2>Guaranteed Hair Resource </h2>
            <p>
              Founded In 2009, now we are one of the best manufacturers of hair
              productsin the world. In order to keep the quality of hair resources 
              and provide better service to different country, we have established 
              studios and warehouse in China, Vietnam and South Africa, to test
              and select the best hair material, find the best resource in the world. 
            </p>
          </div>
        </li>
        <li class="clearfix">
          <img class="li_img" src="catalog/view/theme/default/img/yd_about3.jpg" alt="" />
          <div class="text">
            <h2>Guaranteed Hair Resource </h2>
            <p>
              Founded In 2009, now we are one of the best manufacturers of hair
              productsin the world. In order to keep the quality of hair resources 
              and provide better service to different country, we have established 
              studios and warehouse in China, Vietnam and South Africa, to test
              and select the best hair material, find the best resource in the world. 
            </p>
          </div>
        </li>
        <li class="clearfix">
          <img class="li_img" src="catalog/view/theme/default/img/yd_about4.jpg" alt="" />
          <div class="text">
            <h2>Guaranteed Hair Resource </h2>
            <p>
              Founded In 2009, now we are one of the best manufacturers of hair
              productsin the world. In order to keep the quality of hair resources 
              and provide better service to different country, we have established 
              studios and warehouse in China, Vietnam and South Africa, to test
              and select the best hair material, find the best resource in the world. 
            </p>
          </div>
        </li>
      </ul>
    </div>
    <div class="contact clearfix">
      <div class="bg_fff">
        <h1>Contact Us</h1>
        <div class="bot clearfix">
          <div class="left contact_form">
            <form action="<?php echo $action; ?>" method="post" >
              <h3>Send A Message</h3>
              <label for="" class="w_50 fl clearfix">
                <span>FIRST NAME <span class="fen">*</span></span>
                <input type="text" value="<?=$firstname;?>" name="firstname" />
              </label>
              <label for="" class="w_50 fr clearfix">
                <span>LAST NAME <span class="fen">*</span></span>
                <input type="text" value="<?=$lastname;?>" name="lastname" />
              </label>
              <label for="" class="w_100 clearfix">
                <span>PHONE <span class="fen">*</span></span>
                <input type="text" value="<?=$telephone;?>" name="telephone" />
              </label>
              <label for="" class="w_100 clearfix">
                <span>E-MAIL <span class="fen">*</span></span>
                <input type="text" value="<?=$email;?>" name="email" />
              </label>
              <label for="" class="w_100 clearfix">
                <span>MESSAGE <span class="fen">*</span></span>
                <textarea name="enquiry"></textarea>
              </label>
              <button type="submit">Submit</button>
            </form>
          </div>
          
          <div class="right clearfix">
            <div class="map_text clearfix">
              <dl class="dl_1">
                <dt>SHOP ADDRESS:</dt>
                <dd>House number 2, 7a Justice g.b.a Coker estate. Obafemi Awolowo way, alausa secretariat Ikeja Lagos, Nigeria</dd>
              </dl>
              <dl class="dl_2">
                <dt>BUSINESS HOURS:</dt>
                <dd>MONDAY - FRIDAY : 9AM - 6PM</dd>
                  <dd>SATURDAY: 9AM - 2PM</dd>
                  <dd>CONTACT: 09060008426</dd>
                  <dd>WHATSAPP: 08147034057</dd>
              </dl>
            </div>
          </div>
        </div>
      </div>
    </div>
<?php echo $footer; ?>
<?php if ($success) { ?>
  <script type="text/javascript">
    tips('<?php echo $success; ?>','',500);
  </script>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <script type="text/javascript">
    tips('<?php echo $error_warning; ?>','gantan',500);
  </script>
  <?php } ?>
   <?php if ($error_enquiry) { ?>
  <script type="text/javascript">
    tips('<?php echo $error_enquiry; ?>','gantan',2000);
  </script>
  <?php } ?>