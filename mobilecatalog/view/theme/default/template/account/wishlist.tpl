<?php echo $header; ?>
<!--内容-->
    <div class="in_content clearfix"></div>
    <?php if(!empty($products)){?>
    <div class="list_wish clearfix">
      <div class="top_yd clearfix">
        <h1><a class="fh" href="<?=$home;?>">< BACK</a> MY WISH LIST <span ><em id="total"><?php echo $product_total; ?></em> Items</span></h1>
      </div>
      <div class="pro_text">
        <div class="content">
          <ul class="pro_ul clearfix">
          <?php foreach ($products as $product) { ?>
            <li class="<?=$product['quantity']<1 ?'hui':'';?>">
              <a href="<?php echo $product['href']; ?>">
                <div class="pic_img">
                  <img class="top_img lazyLoad" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>" alt="" />
                  <!-- <?php if($product['special']){?>
                  <div class="bg_hui">
                    <p class="djs_p" title="<?php echo $product['date_end']; ?>">SALE ENDS 
                      <span class="int_day">00</span>:
                      <span class="int_hour">00</span>:
                      <span class="int_minute">00</span>:
                      <span class="int_second">00</span>s
                    </p>
                  </div>
                  <?php } ?> -->
                </div>
                <div class="text clearfix">
                  <h2><?php echo $product['name']; ?></h2>
                    <?php if($product['special']) { ?>
                     <span class="price"><?php echo $product['special']; ?><em><?php echo $product['price']; ?></em></span>
                    <?php }else{ ?>
                     <span class="price"><?php echo $product['price']; ?></span>
                    <?php } ?>
                  <?php if(!empty($product['special'])) { ?>
                  <button class="red_btn">-<?php echo $product['percent']; ?>%</button> <?php } ?>
                </div>
                <em class="red_em <?=$product['hot']==1 ?'active':'';?>">HOT<br />SALE</em>
              </a>
              <div class="close" value="<?=$product['product_id']?>"></div>
              <div class="bot clearfix">
                <div class="share">
                  <button>
                    <span>Share <img src="catalog/view/theme/default/img/png/icon_26.png"/></span>
                  </button>
                  <ol class="clearfix">
                    <li><a target="_blank"  href="http://www.facebook.com/<?=$facebook;?>"></a></li>
                    <li><a target="_blank"  href="http://api.whatsapp.com/send?phone=<?=$whatsapp;?>"></a></li>
                    <li><a href="mailto:<?php echo $email; ?>"></a></li>
                  </ol>
                  <ul class="clearfix">
                    <li><a target="_blank"  href="http://www.facebook.com/<?=$facebook;?>"></a></li>
                    <li><a target="_blank"  href="http://api.whatsapp.com/send?phone=<?=$whatsapp;?>"></a></li>
                    <li><a href="mailto:<?php echo $email; ?>"></a></li>
                  </ul>
                </div>
                    <?php if($product['quantity']<1){?>
                    <a class="add_a" href="javascript:void(0);" onclick="return false;">Out Of Stock</a>
                    <?php }else{?>
                    <a class="add_a" href="<?php echo $product['href']; ?>">SHOP</a>
                    <?php }?>
              </div>
            </li>
        <?php }?>
          </ul>
        </div>
      </div>

    </div>
     <?php }else{?>
     <div class="error_con shop clearfix">
      <div class="text clearfix">
        <img src="catalog/view/theme/default/img/png/404_.png" alt="" />
        
        <p>Your wishlist bag is empty ~</p>
        <a href="<?php echo $shopping;?>">GO WISHLIST&nbsp;&nbsp;></a>
      </div>
    </div>
     <?php }?>
<?php echo $footer; ?>

<script>
  $(function(){
//    close
    $(".close").click(function(){
      $(this).parents("li").remove();
      var product_id=$(this).attr('value');
   console.log(product_id);
   $.ajax({
    url:'<?php echo $wishlist_delete ;?>',
    type:'post',
    data:{'product_id':product_id},
    dataType: 'json',
    success:function(data){
    if (data.success) {
        $('#wishlist_count').html(data.total);
        $('#total').html(data.total);
      }
               // location.reload(); 
    }
   })
    })
    
    
//    share 
    var sh_off = 0;
    $(".share").click(function(event){
      if($(window).width()>920){
        if($(this).hasClass("active")){
          $(this).removeClass("active");
          $(this).find("ul").stop().slideUp();
        }else{
          $(".share").removeClass("active");
          $(".share ul").css("display","none");
          $(this).addClass("active");
          $(this).find("ul").stop().slideDown();
        }
      }else{
        
        if($(this).hasClass("active")){
          $(this).removeClass("active");
          $(this).find("ol").stop().slideUp();
        }else{
          $(".share").removeClass("active");
          $(".share ol").css("display","none");
          $(this).addClass("active");
          $(this).find("ol").stop().slideDown();
        }
      }
      
      sh_off=1;
      event.stopPropagation()
    })
    
    $("body").click(function(e){
      if(sh_off==1){
        var close = $('.share'); 
          if(!close.is(e.target) && close.has(e.target).length === 0){
            $(".share").removeClass("active");
            if($(window).width()>920){
              $(".share").find("ul").stop().slideUp();
            }else{
              $(".share").find("ol").stop().slideUp();
            }
        }
       }
    })
    
    //产品鼠标经过换图
    $(".list_wish  .pro_text .pro_ul>li .top_img").hover(function(){
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
            // var cha = $(this).prop("title");
            // var time_start = new Date().getTime(); //设定当前时间
            // var  endtime=time_start+cha*1000;
            // cha-=1;
            // $(this).prop("title",cha);
            // time_start+=1000;
            // var time_end = new Date(endtime).getTime(); //设定目标时间
            // var time_distance = time_end - time_start;
            // var timer;

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