<?php echo $header; ?>
<!--banner-->
        <div class="in_content clearfix">
            <div class="banner">
                <div class="swiper-container" id="swiper1">
                    <div class="swiper-wrapper" style="cursor:-webkit-grab;">
                             <?php if($banners){ foreach ($banners as $banner) { ?>
                        <div class="swiper-slide ban_img">
                            <a href="<?=$banner['link']?>"><img class="changeimage lazyLoad" data-image='<?=$banner["image"]?>' data-mimage='<?=$banner["m_image"]?>'  /></a>
                        </div>
                          <?php }} ?>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        
        <!--内容-->
        <div class="index_con">
          <div class="content clearfix">
            <div class="intext1 clearfix">
          <!-- 优惠券 -->
            <?php if($resultcoupon){?>
              <div class="in_coupon clearfix">
              <div class="coupon_pic">
                <img  class="changeimage lazyLoad" data-image='catalog/view/theme/default/img/coupon_bg.jpg' data-mimage='catalog/view/theme/default/img/yd_coupon_bg.jpg'/>
              </div>
              <ul class="clearfix">
             <?php foreach ($resultcoupon as $coupons) { ?>
                <li>
                  <div class="box clearfix">
                    <div class="text">
                 <?php if($coupons['type']=='P') { ?>     
                      <p class="p1"><?=$coupons['discountp'];?>%OFF</p>
                     <?php }else{ ?> 
                      <p class="p1"><span>-</span><i></i><?=$coupons['discount'];?></p>
                     <?php } ?> 
                      <p class="p2"><?=$coupons['name'];?></p>
                      <a href="<?php echo $coupon?>"><button type="button">CLICK&nbsp;&nbsp;> </button></a>
                    </div>
                    <img src="catalog/view/theme/default/img/coupin_1.jpg" alt="" />         
                  </div>
                </li>
              <?php } ?>
              </ul>
            </div>
              <?php } ?>
            <div class="content">
                <ul class="in_ul1">
                        <?php if($fours){ foreach ($fours as $banner) { ?>
                      <li>
                       <?php if($banner["link"]) {?> <a href="<?=$banner["link"]?>">  <?php } ?>
                            <img class="lazyLoad" src="<?=$banner["image"]?>" srcs="<?=$banner["image"]?>"/>
                          <?php if($banner["link"]) {?></a><?php } ?>
                      </li>
                     <?php } } ?>
                </ul>
                <div class="text1">
            <div class="text_bt">
              <h1>HOT SALE</h1>
              <p>100%&nbsp;&nbsp;VIRGIN&nbsp;&nbsp;HAIR</p>
              <a href="<?php echo $hotsproduct ?>">View More&nbsp;&nbsp;></a>
            </div>
            <div class="in_pro clearfix">
              <ul class="pro_list">
                <?php if($hots){ foreach ($hots as $hot) { ?>
                <li class="clearfix">
                  <div class="bg_fff clearfix">
                    <div class="pic_img clearfix">
                      <a href="<?=$hot['href'];?>">
                        <img class="lazyLoad change_img" srcs="<?=$hot['thumb'];?>" data-src="<?=$hot['thumbs'];?>" />
                      </a>
                    </div>
                    <div class="text clearfix">
                      <a class="ov_text" href="<?=$hot['href'];?>"><?=$hot['name'];?></a>
                      <div class="price_sp">
                              <?php if($hot['special']){?> 
                                   <span class="price_sp1"><?=$hot['special'];?></span> <span class="price_sp2"><?=$hot['price'];?></span>
                                   <?php }else{?>
                                   <span class="price_sp1"><?=$hot['price'];?> </span>
                                   <?php }?>
                      <!--   <span class="price_sp1">₦69K</span>
                        <span class="price_sp2">₦169K</span> -->
                      </div>
                      <a href="###" class="start">
                        <i class="bg_hui"><i class="bg_red" style="width: 50%"></i></i>
                        <span><?=$hot['reviews'];?> Review(s)</span>
                      </a>
                      <div class="like add_class <?=$hot['wishlist']==1 ?'active':'';?>" onclick="wishlist('<?php echo $hot['product_id']; ?>',this);"></div>
                    </div>
                  </div>
                </li>
                <?php } } ?>
              </ul>
            </div>
          </div>
              
            </div>
            </div> 
            <div class="intext2 clearfix">
              <div class="text_bt">
              <h1>COMMENTS</h1>
              <p>CUSTOMER&nbsp;&nbsp;SHARE</p>
              <a href="<?php echo $homes?>">View More&nbsp;&nbsp;></a>
            </div>
            <?php if(isset($allreviews)){?>
                <div class="content">
                    <ul class="in_ul3 clearfix">
                      <?php foreach ($allreviews as $review) { ?>
                        <li class="clearfix">
                            <div class="con clearfix">
                                <a class="img_a" >
                                    <img class="lazyLoad" src="" srcs="<?php echo $review['thumbs']?>"/>
                                </a>
                                <div class="text">
                                    <h2><?php echo $review['author']?></h2>
                                    <ol>
                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                          <?php if ($review['rating'] < $i) { ?>
                                              <li class=""></li>
                                            <?php } else { ?>
                                              <li class="active"></li>
                                          <?php } ?>
                                       <?php } ?>
                                    </ol>
                                    <h3><?php echo $review['style']?> </h3>
                                    <p>
                                        <?php echo $review['text']?>
                                    </p>
                                     <?php if($review['images']){?>
                                      <ul class="clearfix">
                                      <?php foreach ($review['images'] as $k=> $review_images) { ?>
                                      <li><img class="lazyLoad" src="" srcs="<?php echo $review_images['min_img']?>"/></li>
                                      <?php } ?>
                                      </ul>
                                      <?php } ?>
                                    <a  class="a_btn" onclick="event.stopPropagation()" href="<?php echo $review['href']?>">Shop now<em>></em></a>
                                </div>
                            </div>
                        </li>
                        <?php  } ?>
                    </ul>
                </div>
                <?php  } ?>
            </div>

            <div class="intext3 clearfix">
          <div class="content">
            <div class="text_bt">
              <h1>FIND US IN NIGERIA</h1>
              <p>CONTACT&nbsp;&nbsp;US</p>
            </div>
            
            <div class="bot_map clearfix">
              <img class="changeimage lazyLoad" srcs="<?=isset($store['image'])?$store['image']:'catalog/view/theme/default/img/in_ul7.jpg';?>" />
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
        </div>  

        <!--客户评价弹窗-->
   <?php foreach ($allreviews as $review) { ?>
    <!--客户评价弹窗-->
    <div class="khpj_midal clearfix">
      <div class="text clearfix">
        <div class="close"></div>
        <div class="left clearfix">
          <div class="swiper-container pl_lb">
            
              <div class="swiper-wrapper">
              <?php foreach ($review['images'] as $k=> $review_images) { ?>
              <div class="swiper-slide"><img src="<?php echo $review_images['big_img']?>"/></div>
                  <?php } ?>
              </div>
              <!-- Add Pagination -->
              <div class="swiper-pagination"></div>
              <!-- Add Arrows -->
              <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div>
          </div>
        </div>
        <div class="right clearfix">
          <div class="name clearfix">
            <img src="catalog/view/theme/default/img/png/touxiang2.png"/>
            <span><?php echo $review['author']?></span>
          </div>
          <div class="pro clearfix">
            <img src="<?php echo $review['prothumbs']?>" alt="" />
            <div class="text_p">
              <p>Wholesale Order N14k 2x6 Kim K Lace  Closure 12 Inch</p>
            <?php if($review['length']){?>
            <span>Length: <?php echo $review['length']?> & <?php echo $review['style']?></span>
            <?php }?>
              

              <a href="<?php echo $review['href']?>">SHOP NOW</a>
            </div>
          </div>
          <div class="pinlun clearfix">
            <ol class="start_ol">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($review['rating'] < $i) { ?>
                      <li class=""></li>
                    <?php } else { ?>
                      <li class="active"></li>
                  <?php } ?>
               <?php } ?>
            </ol>
            <span><?php echo $review['date_added']?></span>
            <p>
             <?php echo $review['text']?>
            </p>
            <div class="zan <?=$review['thumbsnot']==1 ?'active':'';?>" onclick="thumbs('<?php echo $review['review_id']; ?>',this);">
              <span id="thumbsed" class="zansss"><?php echo $review['thumbstotal']?></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php  } ?>

    <!--优惠卷弹窗-->
    <div class="in_coupon_tc clearfix">
      <div class="text clearfix">
        <div class="con clearfix">
          <h1>Discounts&Coupons</br>
          <p class="bt_p" > Can be used in shoping bag directly</p>
          </h1>
          <div class="close"></div>
          <h2>COUPON</h2>
          <ol class="yhj_ol clearfix">

        <?php if($resultcoupons){?>
        <?php foreach ($resultcoupons as $coupons) { ?>
        <!-- 领取成功加 active -->
            <li class="<?=$coupons['coupon']==1 ?'active':'';?>" onclick="coupon('<?=$coupons['coupon_id']?>',this)">
            <?php if($coupons['type']=='P') { ?>
              <h3><?=$coupons['discountp']?>%OFF</h3> 
            <?php }else{ ?>
              <h3>-<?=$coupons['discount']?></h3>
          <?php }?>

           <?php if($coupons['type']=='P') { ?> 
              <p>Spend US <?=$coupons['total']?>, Get US <?=$coupons['discountp']?> %off</p>
              <?php }else{ ?>
              <p>Spend US <?=$coupons['total']?>, Get US <?=$coupons['discount']?></p>
              <?php }?>
              <span>Expires:<?=$coupons['date_end']?></span>
              <button class="yh_btn" type="button" >Coupon Added</button>
            </li>
           <?php  } ?>
           <?php  } ?>
          <!--   <li>
              <h3>15%OFF</h3>
              <p>Spend US $500.00, Get US $5 off</p>
              <span>Expires:2018/11/30</span>
              <button class="yh_btn" type="button">Get It Now</button>
            </li>
            <li>
              <h3>-$5</h3>
              <p>Spend US $500.00, Get US $5 off</p>
              <span>Expires:2018/11/30</span>
              <button class="yh_btn" type="button">Get It Now</button>
            </li>
            <li>
              <h3>$5</h3>
              <p>Spend US $500.00, Get US $5 off</p>
              <span>Expires:2018/11/30</span>
              <button class="yh_btn" type="button">Get It Now</button>
            </li>
            <li>
              <h3>$5</h3>
              <p>Spend US $500.00, Get US $5 off</p>
              <span>Expires:2018/11/30</span>
              <button class="yh_btn" type="button">Get It Now</button>
            </li>
            <li>
              <h3>$5</h3>
              <p>Spend US $500.00, Get US $5 off</p>
              <span>Expires:2018/11/30</span>
              <button class="yh_btn" type="button">Get It Now</button>
            </li> -->
          </ol>
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
function thumbs(review_id,e) {
  if ($(e).hasClass('active')) { 
    $.ajax({
    url:'<?php echo $deletethumbs ;?>',
    type:'post',
    data:{'review_id':review_id},
    dataType: 'json',
    success:function(data){
      // alert(data);
      if (data.success) {
        // alert(data.total);
        // $('#thumbsed').html(data.total);
        // let a = data.total;
        //    alert(data.total)
        $('.zansss').text(data.total);
        // location.reload(); 
      }else{
        window.location.href="<?php echo $login?>";
      }
    }
   })
  }else{
   $.ajax({
    url:'<?php echo $addthumbs ;?>',
    type:'post',
    data:{'review_id':review_id},
    dataType: 'json',
    success:function(data){
      // alert(data);
      if (data.success) {
        // alert(data.total);
        // $('#thumbsed').html(data.total);
         // let a = data.total;
         // alert(a)
        $('.zansss').text(data.total);
        // location.reload(); 
      }else{
         window.location.href="<?php echo $login?>";
      }
    }
   })


 }
}
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
  <script type="text/javascript">
    $(function () {
       $(".in_ul3 .con").click(function(){
      var index=$(this).parent().index();
      // alert(index);
      // $('.pl_lb').removeClass('show');
      // $('.pl_lb').eq(index).addClass('show');
      if(!$(this).hasClass("img_null")){
        $(".khpj_midal").eq(index).fadeIn();

        $("body").css("overflow","hidden");
        var swiper = new Swiper('.pl_lb', {
            pagination: {
              el: '.swiper-pagination',
              type: 'fraction',
            },
            navigation: {
              nextEl: '.swiper-button-next',
              prevEl: '.swiper-button-prev',
            },
          });
      }
        
    }); 
    $(".khpj_midal .close").click(function(){
      $(".khpj_midal").fadeOut();
      $("body").css("overflow","");
    });
    //zan
    $(".zan").click(function(){
      if($(this).hasClass("active")){
        $(this).removeClass("active");
      }else{
        $(this).addClass("active");
      }
    })
    })
     function coupon(coupon_id,e) {

     if (!$(e).hasClass('active')) {
       $.ajax({
    url:'<?php echo $addcoupon ;?>',
    type:'post',
    data:{'coupon_id':coupon_id},
    dataType: 'json',
    success:function(data){
      // alert(data);
      if (data.success) {
        tips("Successful collection","");
        if(!$(e).hasClass("active")){
         $(e).addClass("active");
       }
      }else{
        window.location.href="<?php echo $login?>";
      }
    }
   })

  }

  }
  </script>