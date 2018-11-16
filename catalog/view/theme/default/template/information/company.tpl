<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <img class="about_ban changeimage lazyLoad" data-image='catalog/view/theme/default/img/about1.jpg' data-mimage='catalog/view/theme/default/img/yd_about1.jpg'  srcs="catalog/view/theme/default/img/about1.jpg" alt="" />
    
    <div class="about">
      <h1>ABOUT US</h1>
      <ul class="about_ul">
        <li class="clearfix">
          <div class="content clearfix" style="position: relative;">
            <img class="li_img" src="catalog/view/theme/default/img/about2.jpg" alt="" />
            <div class="text">
              <h2>Guaranteed Hair Resource <img src="catalog/view/theme/default/img/png/icon_28.png"/></h2>
              <span class="line"></span>
              <p>
                Founded In 2009, now we are one of the best manufacturers of hair
                productsin the world. In order to keep the quality of hair resources 
                and provide better service to different country, we have established 
                studios and warehouse in China, Vietnam and South Africa, to test
                and select the best hair material, find the best resource in the world. 
              </p>
            </div>
          </div>
        </li>
        <li class="clearfix">
          <div class="content clearfix" style="position: relative;">
            <img class="li_img" src="catalog/view/theme/default/img/about3.jpg" alt="" />
            <div class="text">
              <h2>Guaranteed Hair Resource <img src="catalog/view/theme/default/img/png/icon_29.png"/></h2>
              <span class="line"></span>
              <p>
                Founded In 2009, now we are one of the best manufacturers of hair
                productsin the world. In order to keep the quality of hair resources 
                and provide better service to different country, we have established 
                studios and warehouse in China, Vietnam and South Africa, to test
                and select the best hair material, find the best resource in the world. 
              </p>
            </div>
          </div>
        </li>
        <li class="clearfix">
          <div class="content clearfix" style="position: relative;">
            <img class="li_img" src="catalog/view/theme/default/img/about4.jpg" alt="" />
            <div class="text">
              <h2>Guaranteed Hair Resource <img src="catalog/view/theme/default/img/png/icon_30.png"/></h2>
              <span class="line"></span>
              <p>
                Founded In 2009, now we are one of the best manufacturers of hair
                productsin the world. In order to keep the quality of hair resources 
                and provide better service to different country, we have established 
                studios and warehouse in China, Vietnam and South Africa, to test
                and select the best hair material, find the best resource in the world. 
              </p>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div class="contact">
      <h1>CONTACT US</h1>
      <div class="top">
        <div class="content">
          <p>How can we help? We’re just a call or email away. Feel free to contact us at anytime.</p>
          <ul class="clearfix">
            <li><span>WhatsApp</span></li>
            <li><span>Messenger</span></li>
            <li><span>E-mail</span></li>
          </ul>
        </div>
      </div>
      
      <div class="content">
        <div class="bot clearfix">
          <div class="left">
            <form action="<?php echo $action; ?>" method="post" >
              <h3>SEND AMESSAGE</h3>
              <input type="text" value="<?=$firstname;?>" name="firstname" placeholder="NAME*" />
              <input type="text" value="<?=$email;?>" name="email" placeholder="EMAIL*" />
              <input type="text" value="<?=$telephone;?>" name="telephone" placeholder="PHONE" />
              <p>MESSAGE*</p>
              <textarea name="enquiry"></textarea>
              <?php if ($error_enquiry) { ?>
          <div class="text-danger" >
          <?php echo $error_enquiry; ?>
          </div>
          <?php } ?>
              <button type="submit">SUBMIT</button>
            </form>
          </div>
          
          <div class="right clearfix">
            <dl>
              <dt>STORE HOURS</dt>
              <dd>Mon-Fri 10am-6pm PST</dd>
              <dd>Saturday 11am to 6pm</dd>
              <dd>Sunday CIosed</dd>
              <em class="em_s"></em>
            </dl>
            <dl>
              <dt>ADDRESS</dt>
              <dd>
                Alausa.obafemi awolowo way. Ikeja, 
                Lagos, Nigeria <a class="pc_hide" target="_Blank" href="https://www.google.com/maps?ll=6.607583,3.349862&z=16&t=m&hl=zh-CN&gl=US&mapclient=embed&q=Obafemi+Awolowo+Way+Lagos+%E5%B0%BC%E6%97%A5%E5%88%A9%E4%BA%9A">( Check on the Map )</a>
              </dd>
              <dd class="yd_hide"><span>( <a  target="_Blank" href="https://www.google.com/maps?ll=6.607583,3.349862&z=16&t=m&hl=zh-CN&gl=US&mapclient=embed&q=Obafemi+Awolowo+Way+Lagos+%E5%B0%BC%E6%97%A5%E5%88%A9%E4%BA%9A">Check on the Map</a> )</span></dd>
              <em class="em_s yd_hide"></em>
            </dl>
            <dl class="yd_hide">
              <dt>CONNECT</dt>
              <dd class="it clearfix"><i></i>Instagram</dd>
              <dd class="fb clearfix"><i></i>Facebook</dd>
              <dd class="wh clearfix"><i></i>Whatsapp</dd>
            </dl>
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