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
            <?php if($allreviews){?>
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
                                      <li><img class="lazyLoad" src="" srcs="<?php echo $review_images['img']?>"/></li>
                                      <?php } ?>
                                      </ul>
                                      <?php } ?>
                                    <a  class="a_btn" href="<?php echo $review['href']?>">Shop now<em>></em></a>
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
<?php echo $footer; ?>