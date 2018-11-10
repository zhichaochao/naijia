<?php echo $header; ?>
<!--banner-->
        <div class="in_content clearfix">
            <div class="banner">
                <div class="swiper-container" id="swiper1">
                    <div class="swiper-wrapper" style="cursor:-webkit-grab;">
                             <?php if($banners){ foreach ($banners as $banner) { ?>
                        <div class="swiper-slide ban_img">
                            <img class="changeimage lazyLoad" data-image='<?=$banner["image"]?>' data-mimage='<?=$banner["m_image"]?>'  />
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
        <div class="intext1 clearfix">

        <div class="in_coupon clearfix">
        <div class="coupon_pic">
          <img  class="changeimage lazyLoad" data-image='catalog/view/theme/default/img/coupon_bg.jpg' data-mimage='catalog/view/theme/default/img/yd_coupon_bg.jpg'/>
        </div>
        
        <ul class="clearfix">
          <li>
            <div class="box clearfix">
              <div class="text">  
                <p class="p1"><span>-</span><i>₦</i>2K</p>
                <p class="p2">FIRST ORDER</p>
                <button type="button">CLICK&nbsp;&nbsp;> </button>
              </div>
              <img src="catalog/view/theme/default/img/coupin_1.jpg" alt="" />         
              
            </div>
          </li>
          <li>
            <div class="box clearfix">
              <div class="text">  
                <p class="p1">15%OFF</p>
                <p class="p2">Halloween Discount </p>
                <button type="button">CLICK&nbsp;&nbsp;> </button>
              </div>
              <img src="catalog/view/theme/default/img/coupin_1.jpg" alt="" />         
            </div>
          </li>
          <li>
            <div class="box clearfix">
              <div class="text">  
                <p class="p1"><span>-</span><i>₦</i>5K</p>
                <p class="p2">The Second Wig</p>
                <button type="button">CLICK&nbsp;&nbsp;> </button>
              </div>
              <img src="catalog/view/theme/default/img/coupin_1.jpg" alt="" />         
            </div>
          </li>
        </ul>
      
      </div>



             <!--  <div class="in_coupon clearfix">
                <ul class="clearfix">
                    <li>
                      <img src="catalog/view/theme/default/img/coupin_1.jpg" alt="" />         
                    </li>
                    <li>
                      <img src="catalog/view/theme/default/img/coupin_2.jpg" alt="" />         
                    </li>
                    <li>
                      <img src="catalog/view/theme/default/img/coupin_3.jpg" alt="" />         
                    </li>
                </ul>
            </div> -->



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
                        <img src="catalog/view/theme/default/img/png/index_wz.png" alt="" />
                        <p><i></i></p>
                        <h1>HOT SALE</h1>
                        <p><span>FASHION</span></p>
                    </div>
                    
                    <!-- Swiper -->
                      <div class="swiper-container in_ul2">
                        <div class="swiper-wrapper">
                               <?php if($hots){ foreach ($hots as $hot) { ?>
                          <div class="swiper-slide clearfix">
                            <a class="in_ul2_a clearfix" href="<?=$hot['href'];?>">
                                <div class="pic_img">
                                    <img class="lazyLoad" src="" srcs="<?=$hot['thumb'];?>" data-src="<?=$hot['thumbs'];?>"/>
                                </div>
                                <div class="text">
                                    <h1><?=$hot['name'];?></h1>
                                    <p class="ov_text"><?=$hot['description'];?></p>
                                   <?php if($hot['special']){?> <span><?=$hot['special'];?> <em><?=$hot['price'];?></em></span><?php }else{?>
                                   <span><?=$hot['price'];?> </span><?php }?>
                                </div>
                            </a>
                          </div>
                          <?php } } ?>
                         
                         
                          
                        
                         
                      
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                      </div>
                </div>
                
            </div>
            <div class="bg_hui">
                <div class="text_bt">
                    <img src="catalog/view/theme/default/img/png/index_wz.png" alt="" />
                    <p><i></i></p>
                    <h1>COMMENTS</h1>
                    <p><span>FASHION</span></p>
                </div>
            </div>
            <div class="intext2 clearfix">
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
                    <a class="pro_more" href="<?php echo $homes?>">
                        <button>VIEW All REVIEWS</button>
                    </a>
                </div>
                <?php  } ?>
            </div>
            
            <div class="intext3 clearfix">
                <div class="content">
                    <div class="text_bt">
                        <em class="in3_img"></em>
                        <h1>FIND US IN NIGERIA</h1>
                    </div>
                    
                    <div class="bot_map">
                        <img class="changeimage lazyLoad" srcs="<?=isset($store['image'])?$store['image']:'catalog/view/theme/default/img/in_ul7.jpg';?>" />
                        <div class="map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3964.4091024856534!2d3.5845518!3d6.4697496!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xbb377a4c7304ee86!2sCynergy+Suites+Royale!5e0!3m2!1sen!2snl!4v1536026538820" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
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
            <img src="<?php echo $review['thumbs']?>" alt="" />
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
          <h1>Discounts&Coupons</h1>
          <div class="close"></div>
          <h2>COUPON</h2>
          <ol class="yhj_ol clearfix">
            <li class="active">
              <h3>$5</h3>
              <p>Spend US $500.00, Get US $5 off</p>
              <span>Expires:2018/11/30</span>
              <button class="yh_btn" type="button">Coupon Added</button>
            </li>
            <li>
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
            </li>
          </ol>
        </div>
      </div>
    </div>
<?php echo $footer; ?>
<script>
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
        window.location.href="/index.php?route=account/login";
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
         window.location.href="/index.php?route=account/login";
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
  </script>