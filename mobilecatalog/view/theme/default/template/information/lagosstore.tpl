<?php echo $header; ?>


    <div class="in_content clearfix"></div>
    <!--内容-->
    <div class="wig2 clearfix">
      <h1>Lagos Store</h1>
      
      <div class="top clearfix">
        <div class="img_lb clearfix">
          <div class="swiper-container" id="swiper1">
              <div class="swiper-wrapper" style="cursor:-webkit-grab;">
               <?php if($servers){?>
                 <?php foreach ($servers as $server) { ?>
                    <?php foreach ($server['images'] as $k=> $server_images) { ?>
                    <div class="swiper-slide ban_img">
                    <img class="changeimage lazyLoad" data-image='<?php echo $server_images["img"]?>' data-mimage='<?php echo $server_images["min_img"]?>'  />
                  </div>
                    <?php } ?>
              <?php } ?>
            <?php } ?>  
              </div>
          </div>
          <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
        <div class="right">
          <div class="map_text clearfix">
            <h2>LAGOS STORE LOCATION</h2>
            <h2 class="fen">Lagos,Nigeria</h3>
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
        <div class="contact_form">
          <form action="<?php echo $action?>" method="post">
            <h4>Make An Appointment</h4>
            <p class="form_p1">Request A New Appointment</p>
            <label for="" class="w_100 clearfix">
              <span>DATE <span class="fen">*</span></span>
              <input type="text" class="time"  name="time"/>
            </label>
            <label for="" class="w_100 clearfix">
              <span>SERVICE <span class="fen">*</span></span>
              <div class="select">
              <select name="posTypeSelect[]" id="posTypeSelect" >
               <?php if($serverser){?>
                  <?php foreach ($serverser as $server) { ?>
                  <?php foreach ($server['servers'] as $k=> $serverr) { ?>
                    <option value="<?php echo $serverr['servers']?>"><?php echo $serverr["servers"]?></option>
                    <?php } ?>
                  <?php } ?>
                  <?php } ?>
              </select>
              </div>
              <button class="service_btn fen" type="button">+ Add Another Service</button>
            </label>
            
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
              <input class="in_3" type="text" value="<?=$telephone;?>" name="telephone" />
               <p class="ts_ps off">telephone must be between 2 and 128 characters!</p>
            </label>
            <label for="" class="w_100 clearfix">
              <span>E-MAIL <span class="fen">*</span></span>
              <input type="text" value="<?=$email;?>" name="email" readonly="readonly"/>
            </label>
            <label for="" class="w_100 clearfix">
              <span>MESSAGE <span class="fen">*</span></span>
              <textarea name="enquiry"></textarea>
            </label>
            <p class="form_p2">Questions? Call: 02072318833</p>

            <?php if (!isset($logins)) { ?>
             <a href="<?php echo $login; ?>"> <button type="button">Appointment after login</button></a>
            <?php }else{ ?>
           <button type="submit">Make An Appointment</button>
            <?php }?>
           
          </form>
        </div>
      </div>
      
    </div>





















<!-- <div class="in_content clearfix"></div> -->
    <!--内容-->
   <!--  <div class="wig2 clearfix">
      
      <div class="top_yd clearfix">
        <h1><a class="fh" href="###">< BACK</a> Lagos Store</h1>
      </div>
      
      <div class="top clearfix">
        <h1>Lagos Store</h1>
        <div class="img_lb clearfix">
          <div class="swiper-container" id="swiper1">
              <div class="swiper-wrapper" style="cursor:-webkit-grab;">
              <?php if($servers){?>
                 <?php foreach ($servers as $server) { ?>
                    <?php foreach ($server['images'] as $k=> $server_images) { ?>
                      <div class="swiper-slide ban_img">
                          <img class="changeimage lazyLoad" data-image='<?php echo $server_images["img"]?>' data-mimage='<?php echo $server_images["min_img"]?>'  />
                        </div>
                    <?php } ?>
              <?php } ?>
            <?php } ?>  

              

              </div>
          </div>
          <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
        
        <div class="right">
          <h2>
            LAGOS STORE LOCATION<br />
            Lagos,Nigeria
          </h2>
          <p class="p1">
            <span>SHOP ADDRESS:</span>
           House number 1, 7A justice g.b.a. coker estate. Obafemi awolowo way, Ikeja Lagos, Nigeria -->
             <!-- <br style="display: block;" /> 510000  China -->
    <!--       </p>
          <p class="p2">
            <span>BUSINESS HOURS:</span>
             <br />MONDAY - SATURDAY ：9AM - 6PM
             <br />SUNDAY            ：9AM - 6PM
          </p> 
          <p class="p2">
            <span>CONTACT:</span>
             <br />09060008426
          </p> 
          <?php if (!isset($logins)) { ?>
          <a href="<?php echo $login; ?>"><button class="yy_tcs">Appointment after login</button></a>
          <?php }else{ ?>
          <button class="yy_tc">MAKE AN APPOINTMENT</button>
          <?php }?>
        </div>
      </div>
      
      <div class="bot clearfix">
        <h1>Direction</h1>
        <div class="map">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3963.316086472699!2d3.347673814511896!3d6.607588724013885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x103b922901de32d3%3A0x6f07f7e89944cc0d!2zT2JhZmVtaSBBd29sb3dvIFdheSwgSWtlamEsIOWwvOaXpeWIqeS6mg!5e0!3m2!1szh-CN!2sus!4v1542100335451" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
      </div>
    </div> -->

<!--预约弹窗--> 
<!--     <div class="yy_modal clearfix">
      <div class="text clearfix">
        <div class="close"></div>
        <h1>REQUEST AN APPOINTMENT</h1>
        <div class="right clearfix"></div>
        <div class="left clearfix">
          <form action="<?php echo $action?>" method="post">
            <h2>Request a New Appointment</h2>
            <div class="form_text clearfix">
              <label for="" class="datetime">
                <span>DATE</span>
                <input type="text" class="time" name="time"/>
              </label>
              <label for="">
                <span>SERVICE</span>
                <div class="select">
                  <select name="posTypeSelect[]" id="posTypeSelect">
                   <?php if($serverser){?>
                  <?php foreach ($serverser as $server) { ?>
                  <?php foreach ($server['servers'] as $k=> $serverr) { ?>
                    <option value="<?php echo $serverr['servers']?>"><?php echo $serverr["servers"]?></option>
                    <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  </select>
                </div>
                <button class="add_btn" type="button">+ add another service</button>
              </label>
            </div>
            <button class="tj_btn"   >Make an appointment</button>
          </form>
        </div>
        <p class="bot_p">QUESTIONS? CALL 08147034057</p>
      </div>
    </div> -->






<?php echo $footer; ?>
<link rel="stylesheet" href="catalog/view/theme/default/css/time.css" />
<script type="text/javascript" src="catalog/view/theme/default/js/time.js" ></script>
<script type="text/javascript">
  $(function(){

    $(".in_3").blur(function(){
      // var in_2val = $(".in_2").val();
      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=2){
         $(this).siblings(".ts_ps").addClass("off"); 
         // $(this).parent().addClass("true");
      }else{
          // $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").removeClass("off");
      }
     })
    //banner轮播
    var swiper1 = new Swiper('#swiper1', {
      loop:true,
      navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
        },
    });
    
    $(".service_btn").click(function(){
      let fw_text = 
        '<select name="posTypeSelect[]" id="posTypeSelect">'
        <?php foreach ($server['servers'] as $k=> $serverr) { ?>
          +'<option value="<?php echo $serverr['servers']?>"><?php echo $serverr["servers"]?></option>'
          <?php } ?>
        +'</select>';
      if($(".select select").length<=2){
        $(".select").append(fw_text);
        if($(".select select").length==3){
          $(".service_btn").hide();
        }
      }
    })
    
//    预约弹窗
//     $(".yy_tc").click(function(){
//       $(".yy_modal").fadeIn();
//       $("body").css("overflow","hidden");
//     })
    
// //    关闭预约弹窗
//     $(".yy_modal .close").click(function(){
//       $(".yy_modal").fadeOut();
//       $("body").css("overflow","");
//     })

    
    //時間插件
    function getNow(s) {
        return s < 10 ? '0' + s: s;
    }
    let myDate = new Date();
    let year=myDate.getFullYear();
    let month=myDate.getMonth()+1;
    let day=myDate.getDate(); 
    let now=year+'-'+getNow(month)+"-"+getNow(day);
    window.onload =function(){
      $(".time").attr("value",now);
    }
    $(".time").on("click",function(e){
      e.stopPropagation();
      $(this).lqdatetimepicker({
        css : 'datetime-day',
        dateType : 'D',
        selectback : function(){
        }
      });
  
    });
  })
</script>
 <script language="javascript">
 <!--
  
 // function SelectAll(Objname) {
 //  ObjID    = document.getElementById(Objname);
 //  if (ObjID != -1) {
 //   for (i=0; i<ObjID.length; i++)
   
 //   ObjID.options[i].selected = true;
 //  }
 // }
 
 // function CheckInput() {
 
 //  SelectAll("posTypeSelect");
 // }
  </script>
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