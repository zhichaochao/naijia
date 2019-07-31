
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
            <div class="pro_ban clearfix">
            <?php if($percent){?>
              <div class="pro_discount" id="pricepercent">
                <span class="sp_1 red_span">-<?=$percent;?>%</span>
                <span class="sp_2">off</span>
              </div>
              <?php } ?>
              <div class="swiper-container yd_ban_lb">
                <div class="swiper-wrapper">
                <?php foreach ($images as $k => $image) {?>
                    <div class="swiper-slide"><img src="<?php echo $image['thumb2']; ?>"/></div>
                    <?php } ?>
                </div>
              </div>
                <div class="swiper-pagination"></div>
            </div>
        <div class="text_rf clearfix">
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
                   <?php if($min_prices==$max_prices) {?> <em id="money" class="em1"><?=$min_prices;?> </em><?php }else{?><em id="money" class="em1"><?=$min_prices;?> -<?=$max_prices;?></em><?php } ?>
               <?php if($min_price==$max_price) {?><em class="em2"><?=$min_price?></em> <?php }else{?>  <em class="em2"><?=$min_price?> -<?=$max_price?></em><?php } ?>
                  <?php }else{ ?>
                 <?php if($min_price==$max_price) {?> <em id="money" class="em2" ><?=$min_price?> </em> <?php }else{?>  <em id="money" class="em2" ><?=$min_price?> -<?=$max_price?></em><?php } ?>
                  <?php } ?>
                  
                </div>
                <?php if(!empty($resultcoupons)){?>
                  <a class="get_cou" href="<?php echo $coupon?>"><span>Get Coupon</span></a>
                  <?php } ?>
              <?php }else{?>
                  <div class="price" >
                <?php if(isset($special)){ ?>
                 <?php if($min_prices==$max_prices) {?><em id="money" class="em2"><?=$min_prices;?></em>  <?php }else{?> <em id="money" class="em2"><?=$min_prices;?> -<?=$max_prices;?></em>  <?php } ?>
                  <?php }else{ ?>
                 <?php if($min_price==$max_price) {?><em id="money" class="em1"><?=$min_price?></em>  <?php }else{?>  <em id="money" class="em1"><?=$min_price?> -<?=$max_price?></em>  <?php } ?>
                   <?php } ?>
                  
                  </div> 
                  <?php if(!empty($resultcoupons)){?>
                   <a class="get_cou" href="<?php echo $coupon?>"><span>Get Coupon</span></a>
                    <?php } ?>
              <?php }?> 

              <div class="activity clearfix" style="border:none;">
                <div class="img"><a href="<?php echo $thumbs_href?>"><img src="<?php echo $thumbs?>" alt=""></a> </div>
              </div> 

            </div>
            
            <ol class="text_ol">
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
            <?php if ($select['type'] == 'radio') { ?> 
                  <li class="clearfix" style="position: relative;">
                    <span class="bt_span <?=$select['main']==0 ?'off':'';?>  slide active">Select <?=$select['name']?> : <em class="length_em"></em> <i></i><p class="ts_ps">Please select <?=$select['name']?></p></span> 
                    <ul class="pro_det_ul3 slide_ul clearfix <?=$select['name']=='Curl Pattern' ?'pattern':'';?> <?=$select['name']=='Your Free Wig' ?'pattern':'';?>" style="display: none;">
                        <?php $select_option_id=0;?>
                        <?php foreach ($select['selects'] as $k=> $option_value) { ?>
                        <?php if($option_value['main']){$select_option_id=$option_value['option_value_id'];} ?>
                        <?php if($option_value['remark']){?>
                        <li class="<?=$option_value['main']?'active':'';?>"><span  value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?>(<?php echo $option_value['remark']; ?>)</span>
                        <?php if(!empty($option_value['image'])){?>
                              <img src="<?php echo $servename?><?php echo $option_value['image']?>"/>
                           <?php } ?>
                        </li>
                        <?php }else{?>
                        <li class="<?=$option_value['main']?'active':'';?>"><span  value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></span>
                        <?php if(!empty($option_value['image'])){?>
                              <img src="<?php echo $servename?><?php echo $option_value['image']?>"/>
                           <?php } ?>
                        </li>
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
             <?php }elseif ($select['type'] == 'select') { ?>
             <li class="clearfix" style="position: relative;">
              <span style="display: block;height: 0.6rem;font-size: 0.26rem;margin: 0.35rem 0 0 0;"><?=$select['name']?>:<p class="ts_ps">Please select <?=$select['name']?></p></span>
              <select  id="seleoption" style="width: 60%;height: 0.6rem;border: 1px solid #eee;line-height: 0.6rem;margin:0 0 0.35rem 0;padding: 0 0.2rem;font-size: 0.22rem;">
                <option value="0">-- Please Select --</option>
                 <?php foreach ($select['selects'] as $k=> $option_value) { ?>
                <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                 <?php } ?>
              </select>
              <input id="seleoptionid" type="hidden" name="option[<?php echo $select['option_id']; ?>]" value="<?=$select_option_id>0? $select_option_id:0; ?>" />
            </li>
             <?php } ?>
                <?php }} ?>
                 <li class="clearfix" style="position: relative;">
                  <span style="display: block;height: 0.6rem;font-size: 0.26rem;margin: 0.35rem 0 0 0;">Mobile Phone Number:<p class="ts_ps">Please select Mobile Phone Number</p></span>
                  <input type="text" name="numberdeails" value="<?php echo $numberdeails?>" style="width: 60%;height: 0.6rem;border: 1px solid #eee;line-height: 0.6rem;margin:0 0 0.35rem 0;padding: 0 0.2rem;font-size: 0.22rem;">
                 </li>
                </div>
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
              <li class="clearfix number_li_yd clearfix">
                <div class="number clearfix">
                  <p class="quantity clearfix">Quantity :</p>
                  
                  <div class="label clearfix">
                    <span class="span_sub"><em class="sub"></em></span>
                    <input type="text" class="num_in" value="1" class="quantity" name="quantity"/>
                    <span class="span_add"><em class="add"></em></span>
                  </div>
                 <i class="wish_btn add_class <?=$wishlist==1 ?'active':'';?>" onclick="wishlist('<?php echo $product_id; ?>',this);"></i>
                </div>
              </li>
              <li class="clearfix">
              <?php if($quantity>0){ ?>
                <input type="hidden" name="bynow" value="" id="bynow">
                <button date="0" class="shop_a" id="button-cart" href="javascript:;"  >Add To Shopping Bag</button>
                  <?php }else{?>
                  <button class="shop_a">Lack of stock</button>
                  <?php } ?>
                <?php if($quantity>0){ ?>
                <button date="1" class="buy_a" id="buttons-carts">Buy Now</button>
                 <?php }else{?>
                 <button class="buy_a">Lack of stock</button>
                  <?php } ?>
              </li>
              </ol>
              <ol class="text_ol">
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
              
              <li class="active">
                <h2 class="slide_h2">Details <em class="jian"></em></h2>
                <div class="slide_text">
                  <div class="details">
                    <?=$description;?>
                  </div>
                </div>
              </li>
              
              <li class="active">
                <h2 class="slide_h2">Shipping & Returns <em class="jian"></em></h2>
                <div class="slide_text">
                  <dl>
                    <dt>Shipping</dt>
                    <!-- <dd>Ready to ship in 1-3 Days</dd> -->
                    <dd><em style="font-weight:bold;">Within Lagos:</em> <em style="font-weight:bold;">1-2</em> working days via <em style="font-weight:bold;">GiG</em>.</dd>
                    <dd><em style="font-weight:bold;">Outside Lagos:</em> <em style="font-weight:bold;">2-4</em> working days via <em style="font-weight:bold;">DHL</em>.</dd>
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
                    
                    <!-- <dd class="dd_s">I can't accept returns for:</dd>
                    <dd>Custom or personalized orders</dd>
                    
                    <dd class="dd_s">Conditions of return</dd>
                    <dd>
                      Buyers are responsible for return shipping costs. If the item is not 
                      returned in its original condition, the buyer is responsible for any loss 
                      in value.
                    </dd> -->
                  </dl>
                </div>
              </li>
              <li class="active">
                <h2 class="slide_h2">Payment Method <em class="jian"></em></h2>
                <div class="slide_text">
                  <ul class="pay_ul pay_img clearfix">
                    <!-- <li><img src="catalog/view/theme/default/img/png/fot1_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot2_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot3_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot4_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot5_.png"/></li> -->
                    <li><img src="catalog/view/theme/default/img/png/fot6_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot7_.png"/></li>
                    <li><img src="catalog/view/theme/default/img/png/fot8_.png"/></li>
                  </ul>
                </div>
              </li>
              
              <li class="active">
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
        <!-- <button class="ft_btn">Back to top ↑</button> -->
        <button class="yd_ft_btn"><img src="catalog/view/theme/default/img/png/icon_7_.png"/><span>TOP</span></button>
        <h5>YOU MAY ALSO LIKE</h5>
        
        <!-- Swiper -->
        <div class="swiper-container in_ul2 pro_list">
          <div class="swiper-wrapper">
          <?php foreach ($products_like as $product) { ?>
              <div class="swiper-slide clearfix">
                    <div class="bg_fff clearfix">
                  <div class="pic_img clearfix">
                    <a href="<?php echo $product['href']; ?>">
                      <img class="lazyLoad change_img" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>" />
                    </a>
                  </div>
                  <div class="text clearfix">
                    <a class="ov_text" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    <div class="price_sp">
                    <?php if($product['special']) { ?>
                      <span class="price_sp1"><?php echo $product['special']; ?></span>
                      <span class="price_sp2"><?php echo $product['price']; ?></span>
                      <?php }else{ ?>
                      <span class="price_sp1"><?php echo $product['price']; ?></span>
                      <?php } ?>
                    </div>
                    <a href="<?php echo $product['href']; ?>" class="start">
                    <!-- <ol class="start_ols">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                     </ol> -->
                      <i class="bg_hui"><i class="bg_red" style="width: 50%"></i></i>
                      <span>(<?php echo $product['reviews']+20; ?>)</span>
                    </a>
                    <div class="like <?=$product['wishlist']==1 ?'active':'';?>" onclick="wishlist('<?php echo $product['product_id']; ?>',this);"></div>
                  </div>
                  <?php if(!empty($product['special'])) { ?>
                  <div class="discount"><span class="sp_1">-<?php echo $product['percent']; ?>%</span><span class="sp_2">off</span></div>

                <?php } ?>
                </div>
              </div>
              <?php } ?>
          </div>
          <!-- Add Arrows -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </div>
        
      </div>
    </div>
    <!-- 全部弹窗 -->
    <style type="text/css">
      .modal_con{width: 100%;height: 100%;background: rgba(0,0,0,.5);position: fixed;top: 0;left: 0;z-index: 9999;display: none;}
      .modal_con .text{display: flex;width: 100%;height: 100%;}
      .modal_con .center{margin: auto;display: block;background: #f8f3f0;width: 80%;min-height: 3.5rem;padding: 0 5%;max-width: 600px;
      box-sizing: border-box;text-align: center;position: relative;border-radius: 10px;}
      .modal_con .center img{display: block;}
      .modal_con .center h1{font-size: 0.36rem;line-height:0.4rem; font-weight: normal;padding: 0.5rem 0 0.3rem 0;font-style: italic;}
      .modal_con .center p.p1{font-size: 0.24rem;line-height: 0.4rem;}
      .modal_con .center h2{color: #ff6767;border: 2px dashed #ff9f9f;width: 60%;text-align: center;margin-left: 20%;font-size: 0.32rem;margin-top: 0.3rem;line-height:0.6rem;}
      .modal_con .center p.p2{font-size: 0.16rem;color: #666;margin-top: 0.3rem;}
      .modal_con .close{position: absolute;right: 15px;top: 15px;display: block;width: 25px;height: 25px;cursor: pointer;transition: .5s;}
      .modal_con .close:hover{transform: rotate(90deg);}
      .modal_con .close em{position: relative;top: 12px;transform: rotate(45deg);}
      .modal_con .close em:after{content: "";width: 25px;height: 1.2px;background: #333;display: block;transform: rotate(45deg);position: relative;top: -1px;}
      .modal_con .close em:before{content: "";width: 25px;height: 1.2px;background: #333;display: block;transform: rotate(-45deg);}
    </style>
     <?php  if(isset($resultalertcoupon)){?>
    <div class="modal_con">
      <div class="text">
        <div class="center">
          <h1>CONGRATS!</h1>
          <p class="p1">A coupon code just for you</p>
          <h2><?php echo $resultalertcoupon; ?></h2>
          <p class="p2">Apply it when you checkout to get more discount!</p>
          <div class="close"><em></em></div>
        </div>
      </div>
    </div>
      <?php } ?>
<?php echo $footer; ?>

<script>
window.onload=function(){
  $(function(){
    $(".modal_con .close").click(function(){
      $(".modal_con").fadeOut();
              sessionStorage.setItem("modal",'a');
          
    })
        
        if( sessionStorage.getItem("modal")!='a'){
      setTimeout(function(){
        $(".modal_con").fadeIn();
      },5000);
        }

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
    
        $('#seleoption').change(function(){
      $('#seleoption option:checked').val();
      // console.log($('#seleoption option:checked').val())
      $('#seleoptionid').val($('#seleoption option:checked').val());
       changeprice();
    })
    $(".pro_det_ul3>li>span , .pro_det_ul3>li>img").click(function(){
      $(this).parents("li").addClass("active").siblings("li").removeClass("active");
      $(this).parents("li").find(".slide>em").text($(this).parent().find("span").text());
      $(this).parent().siblings("input").val($(this).parent().find("span").attr("value"));
      $(this).parent().parent().parent().parent().find('.ts_ps').removeClass('off');
      changeprice();
    })
    //默认隐藏显示
    $(".bt_span").each(function(){
      if($(this).hasClass("off")){
        $(this).siblings("ul").slideDown();
      }else{
        $(this).siblings("ul").slideUp();
      }
    })

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
        $(".pro_list").delegate(".like","click",function(){
          $(this).toggleClass("active");
        })
        
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
                    var making=$('#making').val();
                          if(making=1){
                             makingdate();
                          }
                }else{
                   $('#button-cart').html('stockout');
                   $('#buttons-carts').html('stockout');
                }
                if (json['percent']) {$('#pricepercent').find('.red_span').html('-'+json['percent']+'%');}
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
            }
           })

        }else{
           $.ajax({
            url:'<?php echo $wishlist_add ;?>',
            type:'post',
            data:{'product_id':product_id},
            dataType: 'json',
            success:function(data){
              if (data.success) {
                $('#wishlist_count').html(data.total);
              }
            }
           })
       }
    }
</script>
<script type="text/javascript">
    var product_id = "<?php echo $product_id; ?>";
    $('#button-cart').on('click', function() {
      var all=1;
      $("#bynow").attr("value",$(this).attr("date"));
      $("#form-product li").each(function(){
        if ($(this).find('input').val() < 1) {all=0;
          $(this).find(".ts_ps").addClass("off");
          $(this).find('.slide_ul').show();
        }         
      });
        if(all&&$('#button-cart').html()!='stockout'){
            $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
             dataType: 'json',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            success: function(json) {
              if (json.success) {
                tips("Added Successfully","",3000)
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
      $("#bynow").attr("value",$(this).attr("date"));
      $("#form-product li").each(function(){
        if ($(this).find('input').val() < 1) {all=0;
          $(this).find(".ts_ps").addClass("off");
          $(this).find('.slide_ul').show();
        }        
      });
        if(all&&$('#buttons-carts').html()!='stockout'){
            $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
             dataType: 'json',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            success: function(json) {
              if (json.success) {
                window.location.href=json.success;
             }
              },
              error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
            });
        }
    });
</script>