
<?php echo $header; ?>
<!--内容-->
    <!--内容-->
    <style type="text/css">
  .ts_ps{display:none;}
  .ts_ps.off{display: block;}
</style>
    <div class="in_content clearfix"></div>
    <input type="hidden" name="product_id" value="<?=$product_id?>">
    <div class="pro_det clearfix">
      <div class="contents clearfix">
        <div class="img_lf">
          <div class="big_lf clearfix">
        <?php if($sort_orders==1){?>
          <?php if($sspecial){?>
            <div class="top time" title="<?php echo $ends_dates; ?>" >
              <!-- <p>Save 15% on your order - Use code: NAIJABEAUTY Apply</p> -->
              <p>Sales end in 
                <span class="int_day">00</span>:
                <span class="int_hour">00</span>:
                <span class="int_minute">00</span>:
                <span class="int_second">00</span>
              </p>
            </div>
          <?php }?>
          <?php }?>

            <!--pc左边大图-->
            <ul class="img_ul clearfix">
            <?php foreach ($images as $k => $image) {?>
              <li><img src="<?php echo $image['thumb']; ?>"/></li>
              <?php } ?>
            </ul>
            <!--yd顶部大图轮播-->
            <div class="pro_ban">
              <!-- Swiper -->
                <div class="swiper-container yd_ban_lb">
                  <div class="swiper-wrapper">
                  <?php foreach ($images as $k => $image) {?>
                      <div class="swiper-slide"><img src="<?php echo $image['thumb2']; ?>"/></div>
                       <?php } ?>
                  </div>
                </div>
                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>
            </div>
          </div>
        </div>
        <div class="text_rf">
          <div class="big_rf clearfix" id="product">
          
          <input type="hidden" name="product_id" value="<?=$product_id?>">
            <div class="top clearfix">
                <h1><?php echo $heading_title;?></h1>
              <p class="p1">
                <?php echo $meta_description;?>
              </p>
              <?php if($sspecial){?>
                <div class="price" id="price" >
                   <?php if(isset($special)){ ?>
               <?php if($min_price==$max_price) {?><em class="em1"><?=$min_price?></em> <?php }else{?>  <em class="em1"><?=$min_price?> -<?=$max_price?></em><?php } ?>
                  <?php if($min_prices==$max_prices) {?> <em id="money" class="em2"><?=$min_prices;?> </em><?php }else{?><em id="money" class="em2"><?=$min_prices;?> -<?=$max_prices;?></em><?php } ?>
                    <span  class="red_span">-<?=$percent;?>%OFF</span>
                  <?php }else{ ?>
                 <?php if($min_price==$max_price) {?> <em id="money" class="em2" ><?=$min_price?> </em> <?php }else{?>  <em id="money" class="em2" ><?=$min_price?> -<?=$max_price?></em><?php } ?>
                  <!-- <span class="red_span">44%OFF</span> -->
                  <?php } ?>
                  <?php if(!empty($resultcoupons)){?>
                  <a class="get_cop" href="<?php echo $coupon?>"><span>Get Coupon</span></a>
                  <?php } ?>
                </div>
              <?php }else{?>
                  <div class="price" >
                <?php if(isset($special)){ ?>
                 <?php if($min_prices==$max_prices) {?><em id="money" class="em2"><?=$min_prices;?></em>  <?php }else{?> <em id="money" class="em2"><?=$min_prices;?> -<?=$max_prices;?></em>  <?php } ?>
                  <?php }else{ ?>
                 <?php if($min_price==$max_price) {?><em id="money" class="em2"><?=$min_price?></em>  <?php }else{?>  <em id="money" class="em2"><?=$min_price?> -<?=$max_price?></em>  <?php } ?>
                   <?php } ?>
                   <?php if(!empty($resultcoupons)){?>
                   <a class="get_cop" href="<?php echo $coupon?>"><span>Get Coupon</span></a>
                    <?php } ?>
                  </div>
              <?php }?> 

              <div class="activity clearfix">
                <div class="img"> <img src="<?php echo $thumbs?>" alt=""></div>
                <!-- <p>Happy Valentine's Day</p>
                <button type="button">UP TO 50% OFF</button> -->
              </div> 

            </div>
            
            <ol class="text_ol">
              <li class="clearfix number_li">
                <div class="number">
                  <span class="bt_span">
                    <p class="quantity">Quantity :</p>
                    <input type="text" class="num_in" value="1" name="quantity" class="quantity"/>
                    <div class="num_rf">
                      <em class="add"><i></i></em>
                      <em class="sub"><i></i></em>
                    </div>
                  </span>
                  <p class="ts_p"><?=$tips;?></p>
                </div>
                <i class="wish_btn add_class <?=$wishlist==1 ?'active':'';?>" onclick="wishlist('<?php echo $product_id; ?>',this);"></i>
              </li>

              <!--默认选择-->
              <?php if (isset($products_related) ) {?>
              <li class="clearfix">
                <span class="bt_span slide">Select Style/Color: <i></i></span>
                <p class="rf_style"><?php echo $results_relatotal; ?> styles</p>
                <!-- Swiper -->
                <div class="swiper-container pro_det_ul2 slide_ul clearfix">
                    <div class="swiper-wrapper">
                 
                    <div class="swiper-slide active"><a href="<?php echo $selfhref; ?>"> <img name="<?=$color?$color:'no color';?>" title="<?=$color?$color:'no color';?>" src="<?php echo $selfimage; ?>" alt="<?=$color?$color:'no color';?>" /></a></div>
                 
                  <?php foreach ($products_related as $related) { ?> 
                        <div class="swiper-slide "><a href="<?php echo $related['href']; ?>"> <img src="<?php echo $related['thumb']; ?>" alt="<?=$related['name'];?>" /></a></div>
                   <?php } ?>
                    </div>
                </div>
              </li>
              <?php }?>
              
              <div id="form-product">
              <?php if ($selects) { ?>
                <?php foreach ($selects as $select) { ?>  
            
                  <li class="clearfix" style="position: relative;">
                    <span class="bt_span <?=$select['main']==0 ?'off':'';?>  slide active">Select <?=$select['name']?> : <em class="length_em"></em> <i></i><p class="ts_ps">Please select <?=$select['name']?></p></span> 
                    <ul class="pro_det_ul3 slide_ul clearfix" style="display: none;">
                        <?php $select_option_id=0;?>
                        <?php foreach ($select['selects'] as $k=> $option_value) { ?>
                        <?php if($option_value['main']){$select_option_id=$option_value['option_value_id'];} ?>
                        <?php if($option_value['remark']){?>
                        <li class="<?=$option_value['main']?'active':'';?>"><span  value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?>(<?php echo $option_value['remark']; ?>)</span></li>
                        <?php }else{?>
                        <li class="<?=$option_value['main']?'active':'';?>"><span  value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></span></li>
                        <?php } ?>
                       

                        <?php } ?>
                           <input type="hidden" name="option[<?php echo $select['option_id']; ?>]" value="<?=$select_option_id>0? $select_option_id:0; ?>" />
                    </ul>
                    <!-- <?php if( $select['option_id']==1){ ?> -->
                    <p class="size_p">Select Size Guide</p>
                    <div class="size_img">
                      <div class="img">
                        <div class="close"></div>
                        <img src="catalog/view/theme/default/img/size.jpg" alt="" />
                      </div>
                  </div>
                  <!-- <?php } ?> -->
                  </li>
             
                <?php }} ?>
                </div>
              <!--默认不选择-->
              <!-- <p class="size_p">Select Size Guide</p> -->
          
              
              <li class="clearfix number_li_yd">
                <div class="number">
                  <p class="quantity">Quantity :</p>
                  
                  <div class="label">
                    <span class="span_sub"><em class="sub"></em></span>
                    <input type="text" class="num_in" value="1" class="quantity"/>
                    <span class="span_add"><em class="add"></em></span>
                  </div>
                  <p class="ts_p"><?=$tips;?></p>
                </div>
              </li>

              
              <!-- <li>
                  <?php if($quantity>0){ ?>
                <a class="shop_a" id="button-cart" href="javascript:;"  >Add To Shopping Bag</a>
                  <?php }else{?>
                  <a class="shop_a">Lack of stock</a>
                  <?php } ?>
                 <button class="shop_btn" id="checkout_btns"><span><i ><em class="shop_ac"><?=$text_cart_items;?></em></i> <p>Check Out</p></span></button>
              </li> -->
               <?php if(isset($hot)&& $hot==3){ ?>
              <!--这个box只有在box的详情页才显示-->
               <input type="hidden" name="making" value="0" id="making">
              <li class="clearfix box_li active">
                <span class="bt_span active">Wig Making Service</span>
                <ol class="box_ol">
                  <li value="1"><span>Yes</span></li>
                  <li value="0" class="active"><span>No</span></li>
                </ol>
              </li>
              <?php } ?>

              <li class="clearfix">
              <?php if($quantity>0){ ?>
                <button class="shop_a" id="button-cart" href="javascript:;"  >Add To Shopping Bag</button>
                  <?php }else{?>
                  <button class="shop_a">Lack of stock</button>
                  <?php } ?>

                <!-- <button class="shop_a">Add To Shopping Bag</button> -->
                <?php if($quantity>0){ ?>
                <button class="buy_a" id="buttons-carts">Buy Now</button>
                 <?php }else{?>
                 <button class="buy_a">Lack of stock</button>
                  <?php } ?>
              </li>
              <!--默认展开评价-->
              <li class="active">
              <?php if(!empty($reviews)){ ?>
                <h2 class="">Reviews (<?php echo $revi+20; ?>) 
                  <ol class="start_ols">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($rating < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                  </ol>
                </h2>
                <div class="slide_text">
                  
                <?php foreach ($reviews as $review) { ?>
                  <div class="pl_div">
                    <p class="p1 clearfix">
                      <span><?php echo $review['author']?></span>
                      <em><?php echo $review['length']?> & <?php echo $review['style']?></em>
                    </p>
                    <ol class="start_ol">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($review['rating'] < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                    </ol>
                    <p class="p2">
                      <?php echo $review['text']?>
                    </p>
                    <ol class="pl_img_ol clearfix">
                <?php foreach ($review['images'] as $k=> $review_images) { ?>
                      <li class=""><img src="<?php echo $review_images['img']?>" /></li>
                  <?php } ?>
                    </ol>
                    <div class="pro_big_img">
                      <div class="text_madal">
                        <div class="swiper-container" id="swiper3">
                            <div class="swiper-wrapper">
                             <?php foreach ($review['images'] as $k=> $review_images) { ?>
                                <div class="swiper-slide ban_img">
                                  <img src="<?php echo $review_images['min_img']?>"/>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="swiper-paginations" style="display: none;"></div>
                        <div class="close" ></div>
                        <div class="fy_zsq"><i class="fy_i1">2</i>/<i class="fy_i2">5</i></div>
                      </div>
                    </div>
                    <a class="view_a" href="<?php echo $review_tpl; ?>">View All Reviews <i>></i></a>
                  </div>
                   <?php } ?>
                  <?php }else{?>
                  <h2 class="">Reviews (<?php echo $revi+20; ?>) 
                  <ol class="start_ols">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($rating < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                  </ol>
                </h2>
                <div class="slide_text">
                  <div class="pl_div hide">
                  <!-- <p class="no_review"> This product hasn't any review yet</p> -->
                  </div>
                  <?php }?>
                 

                </div>
              </li>
              
              <li>
                <h2 class="slide_h2">Details <em class="jian"></em></h2>
                <div class="slide_text">
                  <div class="details">
                    <?=$description;?>
                  </div>
                </div>
              </li>
              
              <li>
                <h2 class="slide_h2">Shipping & Returns <em class="jian"></em></h2>
                <div class="slide_text">
                  <dl>
                    <dt>Shipping</dt>
                    <!-- <dd>Ready to ship in 1-3 Days</dd> -->
                    <dd>From Lagos Ready to ship in 1-3 days .</dd>
                  </dl>
                  <dl>
                    <dt>Return Policy</dt>
                    <dd class="dd_s">We gladly accept returns and exchanges</dd>
                    <dd>Contact us within: 5 days of delivery</dd>
                    <dd>Ship items back within : 10 days of delivery</dd>
                    
                    <dd class="dd_s">We don't accept cancellations</dd>
                    <dd>
                      But please contact us if you have any problems with your order.
                      The following items can't be returned or exchanged
                      Because of the nature of these items, unless they arrive damaged or 
                      defective,
                    </dd>
                    
                    <dd class="dd_s">I can't accept returns for:</dd>
                    <dd>Custom or personalized orders</dd>
                    
                    <dd class="dd_s">Conditions of return</dd>
                    <dd>
                      Buyers are responsible for return shipping costs. If the item is not 
                      returned in its original condition, the buyer is responsible for any loss 
                      in value.
                    </dd>
                  </dl>
                </div>
              </li>
              <li>
                <h2 class="slide_h2">Payment Method <em class="jian"></em></h2>
                <div class="slide_text">
                  <ul class="pay_ul pay_img clearfix">
                    <li><img src="catalog/view/theme/default/img/png/fot1_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot2_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot3_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot4_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot5_.png"/></li>
                  </ul>
                </div>
              </li>
              
              <li>
                <h2 class="slide_h2">Share <em class="jian"></em></h2>
                <div class="slide_text">
                  <ul class="pay_ul share_img clearfix">
                    <li><a target="_blank"  href="http://www.facebook.com/<?=$facebook;?>"><img src="catalog/view/theme/default/img/png/icon_35_.png"/></a></li>
                    <li><a target="_blank"  href="http://www.instagram.com/<?=$instagram;?>"><img src="catalog/view/theme/default/img/png/icon_34_.png"/></a></li>
                  </ul>
                </div>
              </li>
            </ol>
            
          </div>
          
        </div>
        
        
      </div>
    
      <div class="bottom content">
        <button class="ft_btn">Back to top ↑</button>
        <button class="yd_ft_btn"><img src="catalog/view/theme/default/img/png/icon_7_.png"/><span>TOP</span></button>
        <h5>YOU MAY ALSO LIKE</h5>
        
        <!-- Swiper -->
        <div class="swiper-container in_ul2">
          <div class="swiper-wrapper">
 <?php foreach ($products_like as $product) { ?>
            <div class="swiper-slide clearfix">
              <a class="in_ul2_a clearfix" href="<?php echo $product['href']; ?>">
                <div class="pic_img">
                  <img class="lazyLoad" src="" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>"/>
                </div>
                <div class="text">
                  <h1><?php echo $product['name']; ?></h1>

                  <?php if($product['special']) { ?>
                     <span ><?php echo $product['special']; ?>
                     <em><?php echo $product['price']; ?></em></span>
                  <?php }else{ ?>
                     <span ><?php echo $product['price']; ?></span>
                  <?php } ?>

                  <!-- <span>₦26K <em>₦46K</em></span> -->
                </div>
              </a>
            </div>
<?php } ?>
          </div>
          <!-- Add Arrows -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </div>
        
      </div>
    </div>
<?php echo $footer; ?>

<script>
window.onload=function(){
  $(function(){
     $('#checkout_btns').click(function () {
          location.href='<?=$shopping_cart;?>';
          
        })
    //动态改变头部红色广告条的宽度
    if($(window).width()>920){
      var p_win = 100/parseInt($(".time>p").length);
      $(".pro_det .img_lf .time>p").css("width",p_win+"%");
    }
    
  //数量加减
    $(".number .num_rf>.add , .number .span_add").click(function(){
      var num_val =$(".num_in").val();
      num_val++;
      $(".num_in").val(num_val);
    })
    $(".number .num_rf>.sub , .number .span_sub").click(function(){
      var num_val =$(".num_in").val();
      if(num_val>1){
        num_val--;
        $(".num_in").val(num_val);
      }
    })
    
    //style/color选择
    new Swiper('.pro_det_ul2', {
        slidesPerView: 3.3,
        spaceBetween: '3%',
      });
    // $(".pro_det_ul2 .swiper-slide").eq(0).addClass("active");
    $(".pro_det_ul2 .swiper-slide").click(function(){
      $(this).addClass("active").siblings(".swiper-slide").removeClass("active");
    })
    //length选择
    // $(".pro_det_ul3").siblings(".bt_span").find("em").text($(".pro_det_ul3>li").eq(0).find("span").text());
    $(".pro_det_ul3>li").each(function(){
      if($(this).hasClass("active")){
        
        $(this).parent().siblings(".bt_span").find("em").text($(this).find("span").text());
      }
    })




    $(".pro_det_ul3>li>span").click(function(){
      $(this).parents("li").addClass("active").siblings("li").removeClass("active");
      $(this).parents("li").find(".slide>em").text($(this).text());
      $(this).parent().siblings("input").val($(this).attr("value"));
      $(this).parent().parent().parent().parent().find('.ts_ps').removeClass('off');
      changeprice();
    })
    //wig with选择
    // $(".pro_det_ul4").siblings(".bt_span").find("em").text($(".pro_det_ul4>li").eq(0).find("span").text());
    // $(".pro_det_ul4>li").click(function(){
    //   $(this).addClass("active").siblings("li").removeClass("active");
    //   $(this).parents("li").find(".slide>em").text($(this).text());
    //   $(this).siblings("input").val($(this).attr("value"));
    //   changeprice();
    // })
    
    //Wish List添加收藏
    // $(".wish_btn").click(function(){
    //   if($(this).hasClass("active")){
    //     $(this).removeClass("active");
    //   }else{
    //     $(this).addClass("active");
    //   }
    // })
    //默认隐藏显示
    $(".bt_span").each(function(){
      if($(this).hasClass("off")){
        $(this).siblings("ul").slideDown();
      }else{
        $(this).siblings("ul").slideUp();
      }
    })
//box_ol
// $("#form-product li").each(function(){
//         if ($(this).find('input').val() < 1) {all=0;
//           $(this).find(".ts_ps").addClass("off");
//           $(this).find('.slide_ul').show();
//         }
//                    
//       });

  $(".box_ol>li").click(function(){
    var all=1;
    $("#form-product li").each(function(){
        if ($(this).find('input').val() < 1) {all=0;
          // $(this).find(".ts_ps").addClass("off");
          $(this).find('.slide_ul').show();
        }
                   
      });

    if(all){
    $(this).addClass("active").siblings("li").removeClass("active");
    var val=$(this).val();
    $('#making').val(val);
    makingdate();
  }
  
  })
  //   $(".shop_a").click(function(){
      
  // })
    
    
    //下拉收起
    $(".slide").click(function(){
      if($(this).hasClass("active")){
        $(this).removeClass("active");
        $(this).siblings(".slide_ul").stop().slideDown();
      }else{
        $(this).addClass("active");
        $(this).siblings(".slide_ul").stop().slideUp();
      }
      setTimeout(function(){
        rl_scroll();
      },250)
    })
    $(".pro_det .text_rf .text_ol>li.active .slide_text").css("display","block");   
    $(".slide_h2").click(function(){
      if($(this).parent().hasClass("active")){
        $(this).siblings(".slide_text").stop().slideUp();
        $(this).parent().removeClass("active");
        $(this).find("em").removeClass("active");
      }else{
        $(".slide_h2").siblings(".slide_text").stop().slideUp();
        $(".slide_h2").parent().removeClass("active");
        $(".slide_h2").find("em").removeClass("active");
        $(this).siblings(".slide_text").stop().slideDown();
        $(this).parent().addClass("active");
        $(this).find("em").addClass("active");
      }
      setTimeout(function(){
        rl_scroll();
      },250)
    })
    
    
    //绑定评价轮播
    $(".pl_img_ol>li").eq(0).addClass("active");
    $(".pl_img_ol>li").click(function(){
      var this_index = $(this).index();
      var this_len = $(".pl_img_ol>li").length;
      $(this).addClass("active").siblings("li").removeClass("active");
      $(".fy_zsq .fy_i1").text(this_index+1);
      $(".fy_zsq .fy_i2").text(this_len);
      $(".pro_big_img").show();
      
      setTimeout(function(){
        rl_scroll();
      },250)
      
//      评价轮播
      new Swiper('#swiper3', {
        autoHeight: true,
        pagination: {
          el: '.swiper-paginations',
          clickable: true,
//          type: 'fraction',
          },
          on: {
            slideChangeTransitionStart: function(){
              $(".pl_img_ol>li").eq(this.activeIndex).addClass("active").siblings("li").removeClass("active");
              $(".fy_zsq .fy_i1").text(this.activeIndex+1);
            $(".fy_zsq .fy_i2").text($(".pl_img_ol>li").length);
              setTimeout(function(){
            rl_scroll();
          },250)
            },
         },
      });
      $(".pro_big_img .swiper-pagination-clickable span").eq(this_index).trigger('click');
    
    })


    //关闭评价轮播
    $(".pro_big_img .close").click(function(){
      $(".pro_big_img").hide();
    })
    
    //返回顶部
    $(".bottom .ft_btn,.bottom .yd_ft_btn").click(function(event){
      event.preventDefault();
      $('html,body').animate({
          scrollTop: 0
      }, 500);
    })
    
//    pc端滚动触发左右内容滚动
    $(document).scroll(function(){
          rl_scroll();
      });
  
    //ydban轮播
    if($(window).innerWidth()<=920){
      new Swiper('.yd_ban_lb', {
        autoplay: true,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
      });
    }
    
    //底部产品轮播
    var li_w=4;
      if($(window).innerWidth()>920){
        li_w=4;
        mr_w=30;
      }else{
        li_w=2;
        mr_w="3%";
      }
    new Swiper('.in_ul2', {
          slidesPerView: li_w,
          spaceBetween: mr_w ,
          slidesPerGroup: li_w,
          loop: true,
          autoplay: true,
          loopFillGroupWithBlank: true,
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
    });
    
    
  })
function makingdate() {
  // alert(1);
 var data =$('#make').attr("data");
 var m=$('#making').attr("value");

   $.ajax({
            url: 'index.php?route=product/product/makingdate',
            type: 'post',
            dataType: 'json',
            data: {data:data,ma:m},

            success: function(json) {
               if (json) {
                $('#make').html(json['price_s']);
                }
             }
        });
}
function changeprice() {
  // alert(111);die;
        //console.log('first');
//         alert($("#form-product").serialize());
        $.ajax({
            url: 'index.php?route=product/product/getprice&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-product input"),

            success: function(json) {
               // alert(json);
               if (json) {
                $('#money').html(json['html']);
                if ($('input[name="quantity"]').val()<json['quantity']) {
                    $('#button-cart').html('Add To Shopping Bag');
                    $('#buttons-carts').html('Buy Now');
                }else{
                   $('#button-cart').html('stockout');
                   $('#buttons-carts').html('stockout');
                }
                if (json['percent']) {$('#price').find('.red_span').html('-'+json['percent']+'%OFF');}
              }else{
                $('#money').html('stockout');
                $('#button-cart').html('stockout');
                $('#buttons-carts').html('stockout');
               
                }
             }
        });
    }
  function rl_scroll(){
    if($(window).innerWidth()>920){
      var left =  $(".img_lf").height();
      var right =  $(".text_rf").height();
      var nav_h = $(".nav").height();
          var top = $(document).scrollTop();
          var win_h = $(window).height();
          $(".img_lf").css("position","relative").css("top","0");  
          if(left<right){
            if(top>=left-win_h){
              $(".img_lf").css("position","fixed").css("top",-(left-win_h)+"px"); 
            }else{
              $(".img_lf").css("position","relative").css("top","0");    
            }
            if(top>=right-win_h+nav_h){
              $(".img_lf").css("position","absolute").css("top","auto").css("bottom",0); 
            }
          }
    }
  }
  rl_scroll();
  
  
  $(".text_rf").resize(function() {
      console.log($(this).height());
  });
  //size
  $(".size_p").click(function(){
    $(".size_img").fadeIn();
    $("body").css("overflow","hidden");
  })
  $(".size_img .close").click(function(){
    $(".size_img").fadeOut();
    $("body").css("overflow","");
  })
  $(".size_img").click(function(e){
      var close = $('.size_img .img'); 
         if(!close.is(e.target) && close.has(e.target).length === 0){
           $(".size_img").fadeOut();
           $("body").css("overflow","");
      }
    })
}


           

//倒计时
  function show_time() {
        $(".time").each(function() {
            var cha = $(this).prop("title");
            var time_start = new Date().getTime(); //设定当前时间
            var  endtime=time_start+cha*1000;
            cha-=1;
           $(this).prop("title",cha);
            time_start+=1000;

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
                $(this).css("display","none");
            }
        })
        timer = setTimeout("show_time()", 1000);
    }
    show_time();
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
    url:'<?php echo $wishlist_add ;?>',
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
</script>

<script type="text/javascript">
  
    var product_id = "<?php echo $product_id; ?>";
    $('#button-cart').on('click', function() {
      var all=1;

      $("#form-product li").each(function(){
        if ($(this).find('input').val() < 1) {all=0;
          $(this).find(".ts_ps").addClass("off");
          $(this).find('.slide_ul').show();
        }
                   
      });
      // if ($('#button-cart').html()!='stockout') {alert(1);};

        if(all&&$('#button-cart').html()!='stockout'){
            $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
             dataType: 'json',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
           
     
            success: function(json) {
              if (json.success) {
                // tips('Successful shopping cart');
                // alert("成功加入购物车");
              $('#cart_count').html(json.total);
              $('.shop_ac').html(json.total);
              if(!$(".shop_a").hasClass("active")){
              $(".shop_a").addClass("active");
              $(".shop_a").siblings(".shop_btn").addClass("active");
            }
                $(".cart_li").click();

                


             }else{
              $('#button-cart').html('stockout');
             }
              },
              error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
            });
        }

        
    });
</script>
<!-- 立即购买 -->
<script type="text/javascript">
  
    var product_id = "<?php echo $product_id; ?>";
    $('#buttons-carts').on('click', function() {
      var all=1;

      $("#form-product li").each(function(){
        if ($(this).find('input').val() < 1) {all=0;
          $(this).find(".ts_ps").addClass("off");
          $(this).find('.slide_ul').show();
        }
                   
      });
      // if ($('#button-cart').html()!='stockout') {alert(1);};

        if(all&&$('#buttons-carts').html()!='stockout'){
            $.ajax({
            url: 'index.php?route=checkout/checkout',
            type: 'post',
             dataType: 'json',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
           
     
            success: function(json) {
              if (json.success) {
                // tips('Successful shopping cart');
                // alert("成功加入购物车");
            //   $('#cart_count').html(json.total);
            //   $('.shop_ac').html(json.total);
            //   if(!$(".shop_a").hasClass("active")){
            //   $(".shop_a").addClass("active");
            //   $(".shop_a").siblings(".shop_btn").addClass("active");
            // }
            //     $(".cart_li").click();

                


             }else{
              $('#buttons-carts').html('stockout');
             }
              },
              error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
            });
        }

        
    });
</script>