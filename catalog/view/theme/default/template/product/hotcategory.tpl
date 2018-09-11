<?php echo $header; ?>
<!--内容-->
    <div class="in_content clearfix"></div>
    
    <div class="product clearfix">
      <div class="pro_ban">
        <div class="content">
          <img class="changeimage lazyLoad" data-image='catalog/view/theme/default/img/pro_ban1.jpg' data-mimage='catalog/view/theme/default/img/yd_pro_ban1.jpg'  />
        </div>
      </div>
      
      <div class="content">
        <div class="top_f clearfix">
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
                  <img  class="top_img lazyLoad" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumb']; ?>"  class="top_img" />
                  <div class="bg_hui">
                    <p class="djs_p" title="2018/09/15 10:06:00">SALE ENDS 
                      <span class="int_day">00</span>:
                      <span class="int_hour">00</span>:
                      <span class="int_minute">00</span>:
                      <span class="int_second">00</span>
                    </p>
                  </div>
                </div>
                <div class="text clearfix">
                  <h2><?php echo $product['name']; ?></h2>
                  <ol class="start_ol">
                    <li class="active"></li>
                    <li class="active"></li>
                    <li class="active"></li>
                    <li></li>
                    <li></li>
                  </ol>
                  <p class="pl_p"><?php echo $product['reviews']; ?> reviews</p>
                <?php if($product['special']) { ?>
                     <span class="price"><?php echo $product['special']; ?>
                     <em><?php echo $product['price']; ?></em></span>
                  <?php }else{ ?>
                     <span class="price"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <!-- <span class="price">₦26K 
                  <em>₦46K </em>
                  </span> -->
                  <span class="red_span">-56%</span>
                </div>
                <em class="red_em active">HOT<br />SALE</em>
              </a>
              <!-- 收藏 -->
              <div class="sc <?=$product['wishlist']==1 ?'active':'';?>"
              onclick="wishlist('<?php echo $product['product_id']; ?>',this);"
              ></div>
            </li>
          <?php } ?>

          </ul>
        
          <div class="fy_div">
            <ul>
              <li><a href="###">< Last</a></li>
              <li><a href="###">1</a></li>
              <li><a href="###">2</a></li>
              <li><a href="###">3</a></li>
              <li><a href="###">4</a></li>
              <li class="active"><a href="###">5</a></li>
              <li><a href="###">6</a></li>
              <li><a href="###">7</a></li>
              <li><a href="###">8</a></li>
              <li><a href="###">Next ></a></li>
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
</script>
