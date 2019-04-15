<?php echo $header; ?>
 <!--内容-->
    <div class="in_content clearfix"></div>
    <div class="top_ban">
      <img src="<?php echo $banner1; ?>"/>
    </div>
    <div class="product clearfix">
      <ul class="pro_list clearfix prolist">
<?php if (isset($basicproducts1)) { ?>
      <?php foreach ($basicproducts1 as $product) { ?>
        <li class="clearfix">
          <div class="bg_fff clearfix">
            <div class="pic_img clearfix">
              <a href="<?php echo $product['href']; ?>">
                <img class="lazyLoad change_img" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>" />
              </a>
            </div>
            <div class="text clearfix">
              <a class="ov_text" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <div class="price_sp">
              <?php if(!empty($product['special'])) { ?>
                <span class="price_sp1"><?php echo $product['special']; ?></span>
                <span class="price_sp2"><?php echo $product['price']; ?></span>
                <?php }else{ ?>
                <span class="price_sp1"><?php echo $product['price']; ?></span>
                <?php } ?>
              </div>
              <a href="<?php echo $product['href']; ?>" class="start">
                   <!-- <ol class="start_ol">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                     </ol> -->
                     <?php if($product['rating']>100) { ?>
                  <i class="bg_hui"><i class="bg_red" style="width:100%"></i></i>
                  <?php }else{ ?>
                  <i class="bg_hui"><i class="bg_red" style="width: <?php echo $product['rating']; ?>%"></i></i>
                   <?php } ?>
                <!-- <i class="bg_hui"><i class="bg_red" style="width: 50%"></i></i> -->
                <span>(<?php echo $product['reviews']+20; ?>)</span>
              </a>
              <div class="like add_class <?=$product['wishlist']==1 ?'active':'';?>" onclick="wishlist('<?php echo $product['product_id']; ?>',this);"></div>
            </div>
            <?php if(!empty($product['special'])) { ?>
            <div class="discount"><span class="sp_1">-<?php echo $product['percent']; ?>%</span><span class="sp_2">off</span></div>
             <?php } ?>
          </div>
        </li>
         <?php } ?>
         <?php } ?>
<?php if (isset($basicproducts2)) { ?>
         <?php foreach ($basicproducts2 as $product) { ?>
        <li class="clearfix">
          <div class="bg_fff clearfix">
            <div class="pic_img clearfix">
              <a href="<?php echo $product['href']; ?>">
                <img class="lazyLoad change_img" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>" />
              </a>
            </div>
            <div class="text clearfix">
              <a class="ov_text" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <div class="price_sp">
              <?php if(!empty($product['special'])) { ?>
                <span class="price_sp1"><?php echo $product['special']; ?></span>
                <span class="price_sp2"><?php echo $product['price']; ?></span>
                <?php }else{ ?>
                <span class="price_sp1"><?php echo $product['price']; ?></span>
                <?php } ?>
              </div>
              <a href="<?php echo $product['href']; ?>" class="start">
                  <!--  <ol class="start_ol">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                     </ol> -->
                <?php if($product['rating']>100) { ?>
                  <i class="bg_hui"><i class="bg_red" style="width:100%"></i></i>
                  <?php }else{ ?>
                  <i class="bg_hui"><i class="bg_red" style="width: <?php echo $product['rating']; ?>%"></i></i>
                   <?php } ?>
                <span>(<?php echo $product['reviews']+20; ?>)</span>
              </a>
              <div class="like add_class <?=$product['wishlist']==1 ?'active':'';?>" onclick="wishlist('<?php echo $product['product_id']; ?>',this);"></div>
            </div>
            <?php if(!empty($product['special'])) { ?>
            <div class="discount"><span class="sp_1">-<?php echo $product['percent']; ?>%</span><span class="sp_2">off</span></div>
             <?php } ?>
          </div>
        </li>
         <?php } ?>
         <?php } ?>
<?php if (isset($basicproducts3)) { ?>
         <?php foreach ($basicproducts3 as $product) { ?>
        <li class="clearfix">
          <div class="bg_fff clearfix">
            <div class="pic_img clearfix">
              <a href="<?php echo $product['href']; ?>">
                <img class="lazyLoad change_img" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>" />
              </a>
            </div>
            <div class="text clearfix">
              <a class="ov_text" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <div class="price_sp">
              <?php if(!empty($product['special'])) { ?>
                <span class="price_sp1"><?php echo $product['special']; ?></span>
                <span class="price_sp2"><?php echo $product['price']; ?></span>
                <?php }else{ ?>
                <span class="price_sp1"><?php echo $product['price']; ?></span>
                <?php } ?>
              </div>
              <a href="<?php echo $product['href']; ?>" class="start">
                  <!--  <ol class="start_ol">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                     </ol> -->
                <?php if($product['rating']>100) { ?>
                  <i class="bg_hui"><i class="bg_red" style="width:100%"></i></i>
                  <?php }else{ ?>
                  <i class="bg_hui"><i class="bg_red" style="width: <?php echo $product['rating']; ?>%"></i></i>
                   <?php } ?>
                <span>(<?php echo $product['reviews']+20; ?>)</span>
              </a>
              <div class="like add_class <?=$product['wishlist']==1 ?'active':'';?>" onclick="wishlist('<?php echo $product['product_id']; ?>',this);"></div>
            </div>
            <?php if(!empty($product['special'])) { ?>
            <div class="discount"><span class="sp_1">-<?php echo $product['percent']; ?>%</span><span class="sp_2">off</span></div>
             <?php } ?>
          </div>
        </li>
         <?php } ?>
         <?php } ?>

      </ul>
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

        //产品鼠标经过换图
    $(" .wig_ol>li .top_img").hover(function(){
      var src = $(this).attr("data-src");
      $(this).attr("src",src);
    },function(){
      var src = $(this).attr("srcs");
      $(this).attr("src",src);
    })

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
    // if($(window).innerWidth()<=750){
    //   $(".fot_video video").attr("poster","img/wig_bf_bg.jpg");
    // }
    // var fot_video = document.getElementById("fot_video");
    // $(".fot_video .bf_img").click(function(){
    //   $(this).css("display","none");
    //   document.getElementById("fot_video").play();
    //   $(this).siblings("video").attr("controls","controls");
    // });
    
    
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

