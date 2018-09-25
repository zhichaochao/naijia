<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/catalog/view/theme/default/css/common.css" />
    <link rel="stylesheet" href="/catalog/view/theme/default/css/index.css" />
    <link rel="stylesheet" href="/catalog/view/theme/default/css/swiper.min.css" />
    <script type="text/javascript" src="/catalog/view/theme/default/js/jquery.min.js" ></script>
    <script type="text/javascript" src="/catalog/view/theme/default/js/common.js" ></script>
    <script type="text/javascript" src="/catalog/view/theme/default/js/swiper.js" ></script>
    <title><?=$title?></title>
  </head>
  <body>
    <!--头部-->
    <div class="big_nav">
      <div class="gg_nav">
        <p><i></i>BACK TO SCHOOL SALE is rocking, used code "BACKTOSCHOOL" <span class="hs">save 50% off！</span></p>
      </div>
      <!--pc导航-->
      <div class="nav clearfix">
        <div class="top">
          <div class="content">
            <?=$currency;?>
           
            <a class="logo" href="<?=$home;?>">
              <img src="<?=$logo;?>"/>
            </a>
          </div>
        </div>
        <div class="bot">
          <div class="content">
            <span class="search"><i></i>All store search</span>
            
            <ul class="nav_ul">
              <li <?=strpos($class,'home') !==false?'class="active"':'';?>><a href="<?=$home;?>">Home</a></li>
        <?php foreach($categories as $key => $category) { ?>
        <li <?=strpos($class,'category-'.$category['category_id']) !==false?'class="active"':'';?>>
                <a href="<?php echo $category['href'];?>"><?php echo $category['name'];?></a>
                <?php if( $category['children']){ ?>
                <ol class="nav_ol">
                   <?php foreach($category['child'] as $key => $child) { ?>
                  <li><a href="<?=$child['href'];?>"><?=$child['name'];?></a></li>
                  <?php } ?>
                </ol>
                <?php } ?>
              </li>

        <?php } ?>



              <li >
                <a href="###">Hair Care</a>
                <ol class="nav_ol">
                  <li><a href="###">Accessories</a></li>
                  <li><a href="###">Blog</a></li>
                </ol>
              </li>

              <li><a href="###">Lagos Store</a></li>

              <li><a href="###">About Us</a></li>

            </ul>
            
            <ol class="img_ol">
              <li class="dl_li">
                <a href="<?php echo $login?>"></a>
              </li>
              <li class="sc_li">
                <a href="<?=$wishlist;?>"><span id='wishlist_count'><?php echo $text_wishlist; ?></span></a>
              </li>
              <li class="gw_li">
                <a href="###"><span id='cart_count'><?=$text_cart_items;?></span></a>
              </li>
              <li class="fb_li">
                <a href="###"></a>
              </li>
              <li class="tb_li">
                <a href="###"></a>
              </li>
            </ol>
            
          </div>
        </div>
      </div>
      <!-- pc导航结束 -->

      <div class="yd_nav">
        <ul class="yd_navul">
          <li class="kg_li"></li>
          <li class="logo_li"><a href="###"></a></li>
          <li class="ss_li"></li>
          <li class="mn_li">
            <p class="money">
              <a class="active" href="###">$ USD</a>
              <em>/</em>
              <a href="###">₦ NGN</a>
            </p>
          </li>
          <li class="gw_li"></li>
        </ul>
      </div>
    </div>
    <!--yd导航-->
    <div class="yd_nav_modal">
      <div class="text">
        <div class="top_nav">
          <ul>
            <li><a href="###">Home <i></i></a></li>
            <li><a href="###">Hot Sales <i></i></a></li>
            <li>
              <p class="nav_p active">Wigs <i></i></p>
              <ol class="yd_nav_ol" style="display: block;">
                <li><a href="###">Luxury Hand-Make Wigs</a></li>
                <li><a href="###">Lace Wig <span>Stock In Lagos</span></a></li>
                <li><a href="###">Lace Closure & Frontal</a></li>
              </ol> 
            </li>
            <li><a href="###">Weaves Box <i></i></a></li>
            <li>
              <p class="nav_p">Hair Care<i></i></p>
              <ol class="yd_nav_ol">
                <li><a href="###">Accessories</a></li>
                <li><a href="###">Blogs</a></li>
              </ol> 
            </li>
            <li><a href="###">Lagos Store <i></i></a></li>
            <li><a href="###">About Us <i></i></a></li>
            <li><a href="###">Wish List <i></i></a></li>
          </ul>
        </div>
        
        <div class="bot_fot footer">
            <div class="top clearfix">
              <ul class="fot_ul1 clearfix">
            <!-- yd左侧底部 -->
              <?php foreach($informations as $key => $information) { ?>
              <li>
                <h1><?php echo $information['title']; ?> <i></i></h1>
                <ol class="fot_ol">
                <?php foreach($information['child'] as $subkey=>$subval) { ?> 
                  <li><a href="<?php echo $subval['url']; ?>"><?php echo $subval['title']; ?></a></li>
                <?php } ?>
                </ol>
              </li>
            <?php } ?>

                <li>
                  <h1>SING UP OUR NEWSLETTER! <i></i></h1>
                  <div class="text fot_ol">
                    <!-- <form > -->
                      <label for="">
                        <i></i>
                       <input type="text" name="txtemail" id="txtemail" placeholder="Enter your e-mail"/>
                      </label>
                      <p>
                        join us and get the exclusive sales, productlanunches, 
                        wig tips & more directly deliveredto your inbox.
                      </p>
                      <button type="submit" onClick="return subscribe();">SUBMIT</button>
                    <!-- </form> -->
                  </div>
                </li>
              </ul>
            </div>
            
            <div class="bot clearfix">
              <ul class="fot_ul2 clearfix">
                <li><img src="/catalog/view/theme/default/img/png/fot1.png"/></li>
                <li><img src="/catalog/view/theme/default/img/png/fot2.png"/></li>
                <li><img src="/catalog/view/theme/default/img/png/fot3.png"/></li>
                <li><img src="/catalog/view/theme/default/img/png/fot4.png"/></li>
                <li><img src="/catalog/view/theme/default/img/png/fot5.png"/></li>
              </ul>
            </div>
      
            <p class="fot_p">Copyright © <?php echo (($Y = intval(date('Y'))) > 2017) ? "$Y" : '';?>, naijabeautyhair. Powered by Shopify</p>
        </div>
      </div>
    </div>
     <!--pc搜索弹窗-->
    <div class="ss_modal">
      <div class="bg_f clearfix">
        <div class="text clearfix">
          <div class="close"><img src="/catalog/view/theme/default/img/png/close.png" alt="" /></div>
          <label class="clearfix" for="">
            <span class="ss_img">
              <input type="submit" class="search_li" /> 
            </span>
            <input class="in_text" type="text" placeholder="Search  keyword" name="new_search" />
            <img class="in_close" src="catalog/view/theme/default/img/png/icon_24.png" alt="" />
          </label>
          
          <div class="con clearfix">
            <h1>YOUR RECENT SEARCHES</h1>
            <ul>
              <li>
                <a href="###">hair</a>
                <i></i>
              </li>
              <li>
                <a href="###">funmi hair</a>
                <i></i>
              </li>
              <li>
                <a href="###">hair</a>
                <i></i>
              </li>
              <li>
                <a href="###">funmi hair</a>
                <i></i>
              </li>
            </ul>
          </div>
          <div class="con clearfix">
            <h1>TRENDING SEARCHES</h1>
            <ol>
              <li class="active">
                <a href="###">Hot Sales</a>
              </li>
              <li>
                <a href="###">Funmi Hair</a>
              </li>
              <li>
                <a href="###">Lace Frontal</a>
              </li>
              <li>
                <a href="###">360 Frontal</a>
              </li>
            </ol>
          </div>
          
        </div>
      </div>
    </div>
 <script>
        $(document).ready(function() {
            /* Search */
            $('.search_li ').click(function() {
              
                url = '<?php echo $search_url; ?>';
                var value = $("input[name='new_search']").val();

                if (value) {
                    url += '&search=' + encodeURIComponent(value);
                }
                location = url;
            });

            // $('#header-search').keydown(function(e){
            //     if(e.keyCode==13){
            //         $('.search_li').click();
            //     }
            // })
        });
    </script>