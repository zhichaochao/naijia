<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="wig clearfix">
      <div class="content">
        <div class="top_p">Save 15% on your order -Use code: LF15*Exclusions Apply</div>
        <h1 class="h1">LACE WIG</h1>
        <p class="p1">
          There are Lace Front Wigs, 360 Lace Wigs and Full/Whole Lace Wigs that all can be installed without or with glee. 
          Hand-knotted base with adjustable clips, painstakingly crafted with raw virgin hair.
          These flawless pieces add unbeatable density and beauty to transform your look.
        </p>
        
        <div class="context">
          <div class="top clearfix">
            <img class="lazyLoad" src="" srcs="<?php echo $banner1; ?>"/>
            <div class="top_video">
              <div class="bf_img"></div>
              <video id="top_video" src="<?php echo $video; ?>" width="100%"></video>           
            </div>
            
            <!-- Swiper -->
            <div class="swiper-container in_ul2 swiper1">
              <div class="swiper-wrapper">
              <?php foreach ($products as $product) { ?>

                <div class="swiper-slide clearfix">
                    <a class="in_ul2_a clearfix" href="<?php echo $product['href']; ?>">
                      <div class="pic_img">
                        <img class="lazyLoad" src="" srcs="<?php echo $product['thumb']; ?>" />
                      </div>
                      <div class="text">
                        <h1><?php echo $product['name']; ?></h1>

                        <?php if($product['special']) { ?>
                     <span class="price"><?php echo $product['special']; ?>
                     <em><?php echo $product['price']; ?></em></span>
                  <?php }else{ ?>
                     <span><?php echo $product['price']; ?></span>
                  <?php } ?>
                      </div>
                    </a>
                </div>
               <?php } ?>
              </div>
              <!-- Add Pagination -->
              <div class="swiper-pagination"></div>
              <!-- Add Arrows -->
              <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div>
            </div>
        
            
          </div>
          
          <ul class="wig_ul clearfix">
            <li class="clearfix">
              <img class="lf_img" src="<?php echo $banner2; ?>" alt="" />
              <div class="right">
                <!-- Swiper -->
                  <div class="swiper-container in_ul2 swiper2">
                    <div class="swiper-wrapper">
                    <?php foreach ($products as $product) { ?>

                      <div class="swiper-slide clearfix">
                          <a class="in_ul2_a clearfix" href="<?php echo $product['href']; ?>">
                            <div class="pic_img">
                              <img class="lazyLoad" src="" srcs="<?php echo $product['thumb']; ?>" />
                            </div>
                            <div class="text">
                              <h1><?php echo $product['name']; ?></h1>

                              <?php if($product['special']) { ?>
                           <span class="price"><?php echo $product['special']; ?>
                           <em><?php echo $product['price']; ?></em></span>
                        <?php }else{ ?>
                           <span><?php echo $product['price']; ?></span>
                        <?php } ?>
                            </div>
                          </a>
                      </div>
                     <?php } ?>
                     
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                  </div>
              </div>
            </li>
            <li class="clearfix">
              <img class="lf_img" src="<?php echo $banner3; ?>" alt="" />
              <div class="right">
                <!-- Swiper -->
                  <div class="swiper-container in_ul2 swiper3">
                    <div class="swiper-wrapper">

                      <?php foreach ($products as $product) { ?>

                      <div class="swiper-slide clearfix">
                          <a class="in_ul2_a clearfix" href="<?php echo $product['href']; ?>">
                            <div class="pic_img">
                              <img class="lazyLoad" src="" srcs="<?php echo $product['thumb']; ?>" />
                            </div>
                            <div class="text">
                              <h1><?php echo $product['name']; ?></h1>

                              <?php if($product['special']) { ?>
                           <span class="price"><?php echo $product['special']; ?>
                           <em><?php echo $product['price']; ?></em></span>
                        <?php }else{ ?>
                           <span><?php echo $product['price']; ?></span>
                        <?php } ?>
                            </div>
                          </a>
                      </div>
                     <?php } ?>

                      
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                  </div>
              </div>
            </li>
          </ul>
          
        </div>
        
      </div>
      
      <div class="fot_video clearfix">
        <div class="bf_img"></div>
        <video id="fot_video" src="<?php echo $video1; ?>" width="100%"></video>
      </div>
    </div>
<?php echo $footer; ?>
<script>
function wishlist(product_id,e) {
  if ($(e).hasClass('active')) {
     // alert(product_id);die;
       $.ajax({
    url:'<?php echo $delewishlist ;?>',
    type:'post',
    data:{'product_id':product_id},
    dataType: 'json',
    success:function(data){
      if (data.success) {
        $('#wishlist_count').html(data.total);
      }
               // location.reload(); 
    }
   })

  }else{
  // alert(product_id);die;
   $.ajax({
    url:'<?php echo $wishlist ;?>',
    type:'post',
    data:{'product_id':product_id},
    dataType: 'json',
    success:function(data){
      if (data.success) {
        $('#wishlist_count').html(data.total);
      }
               // location.reload(); 
    }
   })
 }
}
  $(function(){
    $(".sortby").hover(function(){
      $(this).find("ul").stop().slideDown();
    },function(){
      $(this).find("ul").stop().slideUp();
    })
    
    //收藏
    $(".sc").click(function(){
      if($(this).hasClass("active")){
        $(this).removeClass("active");
      }else{
        $(this).addClass("active");
      }
    })
    
    //产品鼠标经过换图
    $(".product .pro_text .pro_ul>li .top_img").hover(function(){
      var src = $(this).attr("data-src");
      $(this).attr("src",src);
    },function(){
      var src = $(this).attr("srcs");
      $(this).attr("src",src);
    })
  })
  
  //倒计时
  // function show_time() {
  //       $(".djs_p").each(function() {
  //           var endtime = $(this).prop("title");
  //           var time_start = new Date().getTime(); //设定当前时间
  //           var time_end = new Date(endtime).getTime(); //设定目标时间
  //           var time_distance = time_end - time_start;
  //           var timer;
  //           if (time_distance >= 0) {
  //               var int_day = Math.floor(time_distance / 86400000)
  //               time_distance -= int_day * 86400000;
  //               var int_hour = Math.floor(time_distance / 3600000)
  //               time_distance -= int_hour * 3600000;
  //               var int_minute = Math.floor(time_distance / 60000)
  //               time_distance -= int_minute * 60000;
  //               var int_second = Math.floor(time_distance / 1000)
  //               if (int_day < 10) {
  //                   int_day = "0" + int_day;
  //               }
  //               if (int_hour < 10) {
  //                   int_hour = "0" + int_hour;
  //               }
  //               if (int_minute < 10) {
  //                   int_minute = "0" + int_minute;
  //               }
  //               if (int_second < 10) {
  //                   int_second = "0" + int_second;
  //               }
  //               $(this).find(".int_day").text(int_day);
  //               $(this).find(".int_hour").text(int_hour);
  //               $(this).find(".int_minute").text(int_minute);
  //               $(this).find(".int_second").text(int_second);
  //           }else{
  //               clearInterval(timer);
  //               $(this).parent(".bg_hui").css("display","none");
  //           }
  //       })
  //       timer = setTimeout("show_time()", 1000);
  //   }
  //   show_time();



</script>
 <script>
  $(function(){
//    顶部视频播放
    var top_video = document.getElementById("top_video");
    $(".top_video .bf_img").click(function(){
      $(this).css("display","none");
      document.getElementById("top_video").play();
      $(this).siblings("video").attr("controls","controls");
    });
//    底部视频播放
    var fot_video = document.getElementById("fot_video");
    $(".fot_video .bf_img").click(function(){
      $(this).css("display","none");
      document.getElementById("fot_video").play();
      $(this).siblings("video").attr("controls","controls");
    });
    
    //4产品轮播
    var li_w=4;
      var win_w = $(window).innerWidth();
      if(win_w>920){
        li_w=4;
        mr_w=30;
      }else{
        li_w=2;
        mr_w="3%";
      }
    var swiper1 = new Swiper('.swiper1', {
          slidesPerView: li_w,
          spaceBetween: mr_w ,
          slidesPerGroup: li_w,
          loop: true,
          loopFillGroupWithBlank: true,
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
    });
    
    var swiper2 = new Swiper('.swiper2', {
          slidesPerView: 2,
          spaceBetween: mr_w ,
          slidesPerGroup: 2,
          loop: true,
          loopFillGroupWithBlank: true,
          initialSlide:2,
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
    });
    var swiper3 = new Swiper('.swiper3', {
          slidesPerView: 2,
          spaceBetween: mr_w ,
          slidesPerGroup: 2,
          loop: true,
          loopFillGroupWithBlank: true,
          initialSlide:0,
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
    });
    
  })
</script>
