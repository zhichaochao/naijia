<?php echo $header; ?>

<!--内容-->
    <div class="in_content clearfix"></div>
    
    <div class="product product4 clearfix">
      <div class="pro_ban">
        <div class="content">
          <div class="swiper-container">
              <div class="swiper-wrapper">
                  <div class="swiper-slide"><img class="ban_img changeimage lazyLoad" data-image='<?php echo $image1; ?>' data-mimage='<?php echo $ydimage1; ?>'  /></div>
                  <div class="swiper-slide" style="cursor: pointer;position: relative;">
                    <div class="bf_img" ></div>
                    <video id="my_video" src="<?php echo $video; ?>" width="100%"></video>
                  </div>
                  <div class="swiper-slide"><img class="ban_img changeimage lazyLoad" data-image='<?php echo $image2; ?>' data-mimage='<?php echo $ydimage2; ?>'  /></div>
              </div>
               <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
           </div>
        </div>
      </div>
      
      <div class="content">
        <div class="top_f clearfix">
          <h1>One Weaves Box One Look</h1>
          <p><?php echo $product_total; ?> items found</p>
          <div class="sortby">
            <p>Sort by : <img src="catalog/view/theme/default/img/png/icon_26.png  " alt="" /></p>
            <ul class="clearfix">
            <li><a href="<?php echo $sort_sort_rating?>">Best selling</a></li>
            <li><a href="<?php echo $sort_sort_add?>">Newest</a></li>
            <li><a href="<?php echo $sort_sort_order?>">Lowest price</a></li>
            <li><a href="<?php echo $sort_sort_order_d?>">Highest price</a></li>
            </ul>
          </div>
        </div>
      </div>
      
      <div class="pro_text">
        <div class="content">
          <ul class="pro_ul clearfix">
         
          
          
       <?php foreach ($products as $product) { ?>
            <li>
              <a href="<?php echo $product['href']; ?>">
                <div class="pic_img">
                  <img class="top_img lazyLoad" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>" alt="" class="top_img" />
                </div>
                <div class="text clearfix">
                  <h2><?php echo $product['name']; ?> </h2>
                  <div class="pl_div">
                    <ol class="start_ol">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                    </ol>
                    <p class="pl_p"><?php echo $product['reviews']; ?> reviews</p>
                  </div>
                  <p class="yd_textp">
                    <?php echo $product['description']; ?>
                  </p>                  
                  <?php if(!empty($product['special'])) { ?>
                     <span class="price"><?php echo $product['special']; ?>
                     <em><?php echo $product['price']; ?></em></span>
                  <?php }else{ ?>
                     <span class="price"><?php echo $product['price']; ?></span>
                  <?php } ?>

                  <span class="yd_btna" href="<?php echo $product['href']; ?>">SHOW</span>
                </div>
              </a>
             <div class="sc <?=$product['wishlist']==1 ?'active':'';?>"
              onclick="wishlist('<?php echo $product['product_id']; ?>',this);"
              ></div>
            </li>

<?php } ?>
          </ul>
         <div class="fy_div">
            <ul>
            <?php echo $pagination; ?>
            </ul>
          </div>


        </div>
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
         tips('Cancel the collection');
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
         tips('Collection Success');
        $('#wishlist_count').html(data.total);
      }
               // location.reload(); 
    }
   })
 }
}
  $(function(){

  //ban輪播
    var swiper = new Swiper('.swiper-container', {
      autoplay: true,
      loop : true,
        pagination: {
          el: '.swiper-pagination',
          clickable :true,
        },
      });
    //鼠标覆盖停止自动切换
      swiper.el.onmouseover = function(){
        swiper.autoplay.stop();
      }
      swiper.el.onmouseout = function(){
        swiper.autoplay.start();
      }
      
    var myvideo = document.getElementById("my_video");
        $(".bf_img").click(function(){
          myvideo.play();
          $(".bf_img").hide()
          $("#my_video").attr("controls","controls");
        })
    myvideo.addEventListener('pause',function(){  
      $(".bf_img").show()
        $('#my_video').removeAttr("controls");
    })

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
  function show_time() {
        $(".djs_p").each(function() {
            var endtime = $(this).prop("title");
            var time_start = new Date().getTime(); //设定当前时间
            var time_end = new Date(endtime).getTime(); //设定目标时间
            var time_distance = time_end - time_start;
            var timer;
            if (time_distance >= 0) {
                var int_day = Math.floor(time_distance / 86400000)
                time_distance -= int_day * 86400000;
                var int_hour = Math.floor(time_distance / 3600000)
                time_distance -= int_hour * 3600000;
                var int_minute = Math.floor(time_distance / 60000)
                time_distance -= int_minute * 60000;
                var int_second = Math.floor(time_distance / 1000)
                if (int_day < 10) {
                    int_day = "0" + int_day;
                }
                if (int_hour < 10) {
                    int_hour = "0" + int_hour;
                }
                if (int_minute < 10) {
                    int_minute = "0" + int_minute;
                }
                if (int_second < 10) {
                    int_second = "0" + int_second;
                }
                $(this).find(".int_day").text(int_day);
                $(this).find(".int_hour").text(int_hour);
                $(this).find(".int_minute").text(int_minute);
                $(this).find(".int_second").text(int_second);
            }else{
                clearInterval(timer);
                $(this).parent(".bg_hui").css("display","none");
            }
        })
        timer = setTimeout("show_time()", 1000);
    }
    show_time();



     window.onload=function(){
      var img_h = $(".pro_ban img.ban_img").height();
    $(".pro_ban video").css("max-height",img_h+"px");
    }
</script>
