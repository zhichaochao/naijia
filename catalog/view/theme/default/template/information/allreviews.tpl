<?php echo $header; ?>
<?php if($allreviews){?>
<div class="in_content clearfix"></div>
    <div class="reviews3 clearfix">
      <div class=" clearfix">
        <div class="content">
          <ul class="in_ul3 masonry clearfix">
          <?php foreach ($allreviews as $review) { ?>
            <li class="clearfix">
              <?php if($review['images']){?>
              <div class="con  clearfix">            
              <?php }else{?>
              <div class="con img_null clearfix">
              <?php }?>
                <!--  -->
                <?php if($review['images']){?>
                <a class="img_a" href="javascript:;">
                  <img class="lazyLoad" src="" srcs="<?php echo $review['thumbs']?>"/>
                </a>
                <?php } ?>
                <!--  -->
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
                  <h3><?php echo $review['style']?></h3>
                  <p>
                   <?php echo $review['text']?>
                  </p>
                  <!--  -->
                  <?php if($review['images']){?>
                  <ul class="clearfix">
                  <?php foreach ($review['images'] as $k=> $review_images) { ?>
                  <li><img class="lazyLoad" src="" srcs="<?php echo $review_images['img']?>"/></li>
                  <?php } ?>
                  </ul>
                  <?php } ?>
                  <a href="<?php echo $review['href']?>" class="a_btn">Shop now<em>></em></a>
                </div>
              </div>
            </li>
             <?php  } ?>
          </ul>
        </div>
      </div>
      
      
    </div>
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
            <img src="catalog/view/theme/default/img/pro_2.jpg" alt="" />
            <div class="text_p">
              <p>Wholesale Order N14k 2x6 Kim K Lace  Closure 12 Inch</p>
              <span>Length: <?php echo $review['length']?> & <?php echo $review['style']?></span>
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
              <span id="thumbsed"><?php echo $review['thumbstotal']?></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php  } ?>

    <?php }else{?>
    <div class="error_con shop clearfix">
      <div class="text clearfix">
        <img src="catalog/view/theme/default/img/png/404_.png" alt="" />
        
        <p>Your wishlist bag is empty ~</p>
        <a href="<?php echo $shopping;?>">GO WISHLIST&nbsp;&nbsp;></a>
      </div>
    </div>
    <?php  } ?>


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
      if (data.success) {
        // $('#thumbsed').html(data.total);
        location.reload(); 
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
        // $('#thumbsed').html(data.total);
        location.reload(); 
      }else{
         window.location.href="/index.php?route=account/login";
      }
    }
   })


 }
}
  
  $(function(){
    
    //评论弹窗
    $(".in_ul3 .con").click(function(){
      if(!$(this).hasClass("img_null")){
        $(".khpj_midal").fadeIn();
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

<style type="text/css">
.swiper-button-disabled{
  display:none;
}
</style>
