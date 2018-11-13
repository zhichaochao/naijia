<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="wig clearfix">
      <div class="content">
        <div class="top_p"><?php echo $slogans?></div>
        <h1 class="h1">Basic Lace Wig</h1>
        
        <div class="context">
          <!--pc-->
          <div class="top yd_hide clearfix">
            <!-- Swiper -->
            <div class="lb_4pic clearfix">
              <div class="swiper-container in_ul2 swiper1">
                  <div class="swiper-wrapper">
                  
                  <?php foreach ($basicproducts1 as $product) { ?>
                     <div class="swiper-slide clearfix">
                          <a class="in_ul2_a clearfix" href="<?php echo $product['href']; ?>">
                            <div class="pic_img">
                              <img src="<?php echo $product['thumb']; ?>" />
                            </div>
                            <div class="text">
                              <h1><?php echo $product['name']; ?></h1>
                              <?php if(!empty($product['special'])) { ?>
                              <span><?php echo $product['special']; ?><em><?php echo $product['price']; ?></em></span>
                               <?php }else{ ?>
                               <span><?php echo $product['price']; ?></span>
                               <?php } ?>
                              
                            </div>
                          </a>
                      </div>
                    <?php } ?>
                  </div> 
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
               </div>
            </div>     
          </div>
            
          <!--移动-->
          <div class="pc_hide clearfix">
            <div class="pro_ban clearfix">
              <div class="content">
                <div class="swiper-container swiper3">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><img class="ban_img changeimage lazyLoad" data-image='<?php echo $banner1; ?>' data-mimage='<?php echo $banner1; ?>'  /></div>
                        <div class="swiper-slide" style="cursor: pointer;position: relative;display: block;">
                          <div class="bf_img" ></div>
                          <video id="my_video" src="<?php echo $video2; ?>" width="100%"></video>
                        </div>
                    </div>
                    <div class="swiper-button-prev"></div>
                  <div class="swiper-button-next"></div>
                 </div>
              </div>
            </div>
            <div class="top_lb clearfix">
              <div class="swiper-container swiper2">
                  <div class="swiper-wrapper">
                  <?php foreach ($basicproducts1 as $product) { ?>
                <div class="swiper-slide clearfix">
                    <a class="in_ul2_a clearfix" href="<?php echo $product['href']; ?>">
                      <div class="pic_img">
                        <img class="lazyLoad" src="" srcs="<?php echo $product['thumb']; ?>" />
                      </div>
                      <div class="text">
                        <h1><?php echo $product['name']; ?></h1>
                        <?php if(!empty($product['special'])) { ?>
                              <span><?php echo $product['special']; ?><em><?php echo $product['price']; ?></em></span>
                               <?php }else{ ?>
                               <span><?php echo $product['price']; ?></span>
                               <?php } ?>
                      </div>
                    </a>
                </div>
               <?php } ?>
                  </div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
               </div>
            </div>
          </div>
          <ul class="wig_ul clearfix">
            <li class="clearfix">
              <div class="bt">
                <h1>Lace Closure Frontal</h1>
                <p>Natural & Glueless & Realistic Wig </p>
              </div>
              <ol class="wig_ol clearfix">
            <?php foreach ($basicproducts2 as $product) { ?>
                <li>
                  <a href="<?php echo $product['href']; ?>">
                    <img src="<?php echo $product['thumb']; ?>" alt="" />
                    <div class="text">
                      <p><?php echo $product['name']; ?></p>

                      <?php if($product['special']) { ?>
                      <span><?php echo $product['special']; ?> <em><?php echo $product['price']; ?></em></span>
                       <?php }else{ ?>
                       <span><?php echo $product['price']; ?></span>
                        <?php } ?>
                    </div>
                  </a>
                </li>
                     <?php } ?>
              </ol>
            </li>
            <li class="clearfix">
              <div class="bt">
                <h1>Luxury Hand-Make Wigs</h1>
                <p>Natural & Glueless & Realistic Wig </p>
              </div>
              
              <ol class="wig_ol clearfix">
                  <?php foreach ($basicproducts3 as $product) { ?>
                <li>
                  <a href="<?php echo $product['href']; ?>">
                    <img src="<?php echo $product['thumb']; ?>" alt="" />
                    <div class="text">
                      <p><?php echo $product['name']; ?></p>
                      
                       <?php if($product['special']) { ?>
                      <span><?php echo $product['special']; ?> <em><?php echo $product['price']; ?></em></span>

                       <?php }else{ ?>
                       <span><?php echo $product['price']; ?></span>
                        <?php } ?>
                    </div>
                  </a>
                </li>
                 <?php } ?>
              </ol>
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
         // tips('Cancel the collection');
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
         // tips('Collection Success');
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
  


</script>
<script>
  $(function(){
    //ban輪播 img+video
    var myvideo = document.getElementById("my_video");
        $(".pro_ban .bf_img").click(function(){
          myvideo.play();
          $(this).hide()
          $("#my_video").attr("controls","controls");
        })
    myvideo.addEventListener('pause',function(){  
      $(".bf_img").show()
        $('#my_video').removeAttr("controls");
    })
    var swiper3 = new Swiper('.swiper3', {
      navigation: {
          nextEl: '.swiper3 .swiper-button-next',
          prevEl: '.swiper3 .swiper-button-prev',
      },
      on: {
          slideChange: function () {
            myvideo.pause();
            if(this.activeIndex == 0){
              $(".pro_ban .swiper-button-prev").hide();
              $(".pro_ban .swiper-button-next").show();
            }else if(this.activeIndex == 1){
              $(".pro_ban .swiper-button-next").hide();
              $(".pro_ban .swiper-button-prev").show();
            }
          },
        },
      });
    
    
//    顶部视频播放
    var top_video = document.getElementById("top_video");
    $(".top_video .bf_img").click(function(){
      $(this).css("display","none");
      document.getElementById("top_video").play();
      $(this).siblings("video").attr("controls","controls");
    });
//    底部视频播放
    if($(window).innerWidth()<=750){
      $(".fot_video video").attr("poster","img/wig_bf_bg.jpg");
    }
    var fot_video = document.getElementById("fot_video");
    $(".fot_video .bf_img").click(function(){
      $(this).css("display","none");
      document.getElementById("fot_video").play();
      $(this).siblings("video").attr("controls","controls");
    });
    
    
  })
  
  window.onload =function(){
    $(".top_video").height($(".top_video").siblings("img").height());
    
    
    var swiper10 = new Swiper('.swiper1', {
          loop:true,
          slidesPerView: 4,
          spaceBetween: 30 ,
           observer:true,
           observeParents:true,
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
    });
  

    var swiper2 = new Swiper('.swiper2', {
      loop:true,
      initialSlide :1,
      slidesPerView: 2,
          centeredSlides: true,
          spaceBetween: 30,
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          }, 
          
    });
  }
</script>

