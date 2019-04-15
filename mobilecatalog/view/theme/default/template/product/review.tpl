<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="reviews clearfix">
      <div class="pl_text clearfix">
        <div class="top clearfix">
          <a class="fh" href="<?php echo $home; ?>">&lt; BACK</a>
          <ol class="start_ol">
            <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
                <li class=""></li>
              <?php } else { ?>
                <li class="active"></li>
              <?php } ?>
            <?php } ?>
          </ol>
          <p><?php echo $revi+20; ?> Reviews</p>
        </div>
        <?php foreach ($reviews as $review) { ?>
        <ul class="pl_ul clearfix">
          <li>
            <div class="left clearfix">
              <img src="catalog/view/theme/default/img/png/touxiang2.png" alt="" />
              <span><?php echo $review['author']; ?></span>
              <ol class="start_ol">
               <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($review['rating'] < $i) { ?>
                      <li class=""></li>
                    <?php } else { ?>
                      <li class="active"></li>
                  <?php } ?>
               <?php } ?>
              </ol>
            </div>
            <div class="right clearfix">
             <?php  if(!empty($review['length'])){ ?>
               <span class="span1"><?php echo $review['length']; ?> & <?php echo $review['style']; ?></span>
             <?php  }else{ ?>
               <span class="span1"></span>
             <?php  } ?>
             

              <span class="span2"><?php echo $review['date_added']; ?></span>
              <p class="p1 clearfix">
              <?php echo $review['text']?>
              </p>
              <ul class="img_ul clearfix">
              <?php foreach ($review['images'] as $k=> $review_images) { ?>
                      <li class=""><img src="<?php echo $review_images['img']?>" /></li>
                  <?php } ?>
              </ul>
              <div class="pl_lunbo clearfix">
                  <!-- Swiper -->
                  <div class="swiper-container">
                    <div class="swiper-wrapper">
                     <?php foreach ($review['images'] as $k=> $review_images) { ?>
                      <div class="swiper-slide"><img src="<?php echo $review_images['min_img']?>"/></div>
                       <?php } ?>
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                  </div>
                  <div class="close"></div>
                  <div class="fy_zsq"><i class="fy_i1">2</i>/<i class="fy_i2">5</i></div>
              </div>
              <div class="zan <?=$review['thumbsnot']==1 ?'active':'';?>" onclick="thumbs('<?php echo $review['review_id']; ?>',this);">
                <span id="thumbsed"><?php echo $review['thumbstotal']; ?></span>
              </div>
            </div>
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
<?php echo $footer; ?>
<script type="text/javascript">
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
        // $('#thumbsed').html(data.total);
        location.reload(); 
      }else{
         window.location.href="<?php echo $login?>";
      }
    }
   })


 }
}

  $(function(){
    //zan
    $(".zan").click(function(){
      if($(this).hasClass("active")){
        $(this).removeClass("active");
      }else{
        $(this).addClass("active");
      }
    })
    //lunbo
    $(".reviews .pl_ul .img_ul>li").click(function(){
      $(this).parent().siblings(".pl_lunbo").show();
      var this_index = $(this).index();
      if(this_index==0){
        $(this).addClass("active");
      }
      var this_ul = $(this).parent();
      var this_len = this_ul.find("li").length;
      $(".fy_zsq .fy_i1").text(this_index+1);
      $(".fy_zsq .fy_i2").text(this_len);
      var mySwiper = new Swiper('.swiper-container', {
        freeMode : false,
        observer: true,
        observeParents: true,
        autoHeight: true,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
          },
            navigation: {
              nextEl: '.swiper-button-next',
              prevEl: '.swiper-button-prev',
            },
            on: {
            slideChangeTransitionStart: function(){
              this_ul.find("li").removeClass("active");
              this_ul.find("li").eq(this.activeIndex).addClass("active");
              $(".fy_zsq .fy_i1").text(this.activeIndex+1);
            },
        },
        });
        $(this).parent().siblings(".pl_lunbo").find(".swiper-pagination-clickable span").eq($(this).index()).trigger('click');
    })
    //lunbo colse
    $(".pl_lunbo  .close").click(function(){
      $(this).parents("li").find(".img_ul>li").removeClass("active");
      $(this).parents(".pl_lunbo ").hide();
    })
  })
</script>
