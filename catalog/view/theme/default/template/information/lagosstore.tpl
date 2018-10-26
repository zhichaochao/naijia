<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="wig2 clearfix">
      
      <div class="top_yd clearfix">
        <h1><a class="fh" href="###">< BACK</a> Lagos Store</h1>
      </div>
      
      <div class="top clearfix">
        <h1>Lagos Store</h1>
        <div class="img_lb clearfix">
          <div class="swiper-container" id="swiper1">
              <div class="swiper-wrapper" style="cursor:-webkit-grab;">
                  <div class="swiper-slide ban_img">
                    <img class="changeimage lazyLoad" data-image='catalog/view/theme/default/img/wig5.jpg' data-mimage='catalog/view/theme/default/img/yd_wig5.jpg'  />
                  </div>
                <div class="swiper-slide ban_img">
                  <img class="changeimage lazyLoad" data-image='catalog/view/theme/default/img/wig5.jpg' data-mimage='catalog/view/theme/default/img/yd_wig5.jpg'  />
                </div>
                <div class="swiper-slide ban_img">
                  <img class="changeimage lazyLoad" data-image='catalog/view/theme/default/img/wig5.jpg' data-mimage='catalog/view/theme/default/img/yd_wig5.jpg'  />
                </div>
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
            A lane in huangbian vllage district guangzhouguangdong province
             <br style="display: block;" /> 510000  China
          </p>
          <p class="p2">
            <span>BUSINESS HOURS:</span>
             <br />MONDAY - SATURDAY <br />10AM - 6PM
          </p> 
          
          <button class="yy_tc">MAKE AN APPOINTMENT</button>
        </div>
      </div>
      
      <div class="bot clearfix">
        <h1>Direction</h1>
        <div class="map">
          <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3964.4091024856534!2d3.5845518!3d6.4697496!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xbb377a4c7304ee86!2sCynergy+Suites+Royale!5e0!3m2!1sen!2snl!4v1536026538820" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
      </div>
    </div>

<!--预约弹窗--> 
    <div class="yy_modal clearfix">
      <div class="text clearfix">
        <div class="close"></div>
        <h1>REQUEST AN APPOINTMENT</h1>
        <div class="right clearfix"></div>
        <div class="left clearfix">
          <form action="">
            <h2>Request a New Appointment</h2>
            <div class="form_text clearfix">
              <label for="">
                <span>DATE</span>
                <input type="text"  />
              </label>
              <label for="">
                <span>SERVICE</span>
                <div class="select">
                  <select name="">
                    <option value="">Select Service</option>
                    <option value="">Select Service2</option>
                    <option value="">Select Service3</option>
                    <option value="">Select Service4</option>
                  </select>
                </div>
                <button class="add_btn" type="button">+ add another service</button>
              </label>
            </div>
            <button class="tj_btn">Make an appointment</button>
          </form>
        </div>
        <p class="bot_p">QUESTIONS? CALL 02072318833</p>
      </div>
    </div>






<?php echo $footer; ?>
<script type="text/javascript">
  $(function(){
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
    
    $(".add_btn").click(function(){
      let fw_text = 
        '<select name="">'
          +'<option value="">Select Service</option>'
          +'<option value="">Select Service2</option>'
          +'<option value="">Select Service3</option>'
          +'<option value="">Select Service4</option>'
        +'</select>';
      if($(".select select").length<=2){
        $(".select").append(fw_text);
        if($(".select select").length==3){
          $(".add_btn").hide();
        }
      }
    })
    
//    预约弹窗
    $(".yy_tc").click(function(){
      $(".yy_modal").fadeIn();
      $("body").css("overflow","hidden");
    })
    
//    关闭预约弹窗
    $(".yy_modal .close").click(function(){
      $(".yy_modal").fadeOut();
      $("body").css("overflow","");
    })
  })
</script>
