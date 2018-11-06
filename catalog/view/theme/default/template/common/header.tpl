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
    <script type="text/javascript">
      $(function () {
        $('#checkout_btn').click(function () {
          location.href='<?=$shopping_cart;?>';
          
        })
      })
    </script>
    <title><?=$title?></title>
  </head>
  <body>
    <!--头部-->
    <div class="big_nav">
      <div class="gg_nav">
        <p><i></i><?php echo $slogan?></p>
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
              <li <?=strpos($class,'hotcategory') !==false?'class="active"':'';?>>
                <a href="<?php echo $hothref;?>">Hot Sales</a>
              </li>
        <?php foreach($categories as $key => $category) { ?>
        <li <?=strpos($class,'category-'.$category['category_id']) !==false?'class="active"':'';?>>
                <a href="<?php echo $category['href'];?>"><?php echo $category['name'];?></a>
                <?php if( $category['children']){ ?>
                <ol class="nav_ol">
                   <?php foreach($category['children'] as $k => $child) { ?>
                  <li><a href="<?=$child['href'];?>"><?=$child['name'];?></a></li>
                  <?php } ?>
                </ol>
                <?php } ?>
              </li>

        <?php } ?>



              <li >
                <a href="<?php echo $acchref;?>">Hair Care</a>
                <ol class="nav_ol">
                  <li><a href="<?php echo $acchref;?>">Accessories</a></li>
                  <li><a href="<?php echo $blog;?>">Blog</a></li>
                </ol>
              </li>

              <li><a href="<?php echo $lagosstore;?>">Lagos Store</a></li>

              <li><a href="<?php echo $aboutus;?>">About Us</a></li>

            </ul>
            
            <ol class="img_ol">
              <li class="dl_li">
                <a href="<?php echo $login_li?>"></a>
              </li>
              <li class="sc_li">
                <a href="<?=$wishlist;?>"><span id='wishlist_count'><?php echo $text_wishlist; ?></span></a>
              </li>
              <li class="gw_li">
                <a href="<?=$shopping_cart;?>"><span id='cart_count'><?=$text_cart_items;?></span></a>
              </li>
              <li class="fb_li">
                <a target="_blank"  href="http://www.facebook.com/<?=$facebook;?>"></a>
              </li>
              <li class="tb_li">
                <a target="_blank"  href="http://www.instagram.com/<?=$instagram;?>"></a>
              </li>
            </ol>
            
          </div>
        </div>
      </div>
      <!-- pc导航结束 -->
        <div class="yd_nav">
        <ul class="yd_navul">
          <li class="kg_li"></li>
          <li class="logo_li"><a href="<?=$home;?>"></a></li>
          <li class="ss_li"></li>
           <?=$mcurrency;?>
          <li class="gw_li" id="checkout_btn"></li>
        </ul>
      </div>

    
    </div>
    <!--yd导航-->
    <div class="yd_nav_modal">
      <div class="text">
        <div class="top_nav">
          <ul>
            <li><a href="<?=$home;?>">Home <i></i></a></li>
            <li><a href="<?php echo $hothref;?>">Hot Sales <i></i></a></li>
            <?php foreach($categories as $key => $category) { ?>
            <li >
              <p class="nav_p active"><a href="<?php echo $category['href'];?>"><?php echo $category['name'];?></a></p>
                    
                    <?php if( $category['children']){ ?>
                 <ol class="yd_nav_ol li_i" style="display: block;">
                       <?php foreach($category['children'] as $k => $child) { ?>
                      <li><a href="<?=$child['href'];?>"><?=$child['name'];?></a></li>
                      <?php } ?>
                    </ol>
                    <?php } ?>
                  </li>

            <?php } ?>

           
            <li>
              <p class="nav_p">Hair Care<i></i></p>
              <ol class="yd_nav_ol">
                <li><a href="<?php echo $acchref;?>">Accessories</a></li>
                <li><a href="<?php echo $blog;?>">Blog</a></li>
              </ol> 
            </li>
            <li><a href="<?php echo $lagosstore;?>">Lagos Store <i></i></a></li>
            <li><a href="<?php echo $aboutus;?>">About Us <i></i></a></li>
            <li><a href="<?=$wishlist;?>">Wish List <i></i></a></li>
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
                        Subscribe to get the exclusive sales, product lanuches, wig tips & latest news. 
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
            <h1>TRENDING SEARCHES</h1>
            <ol>
            <?php if(isset($hotsearched)){?>
            <?php foreach($hotsearched as $key => $hotsearstory) { ?>
              <li class="active">
                <a  onclick="javascript:selsearch('<?php echo $hotsearstory; ?>');"><?php echo $hotsearstory; ?></a>
                
              </li>
              <?php } ?>
              <?php } ?>
            </ol>
          </div>
          <div class="con clearfix">
            <h1>YOUR RECENT SEARCHES
            <i class="del" onclick="javascript:del('<?php echo $customer_id; ?>');">
                <svg t="1539766974948" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5269" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32">
                  <path d="M793.6 998.4H220.16c-51.2 0-97.28-40.96-97.28-97.28V261.12c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v645.12c0 25.6 20.48 46.08 46.08 46.08h573.44c25.6 0 46.08-20.48 46.08-46.08v-563.2c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v563.2c0 46.08-46.08 92.16-97.28 92.16z" p-id="5270" fill="#999999"></path>
                  <path d="M51.2 266.24c-10.24 0-20.48-10.24-25.6-25.6 0-15.36 10.24-25.6 25.6-25.6l916.48-81.92c15.36 0 25.6 10.24 25.6 25.6s-10.24 25.6-25.6 25.6L51.2 266.24c5.12 0 0 0 0 0z" p-id="5271" fill="#999999"></path>
                  <path d="M343.04 230.4c-10.24 0-20.48-10.24-25.6-25.6l-5.12-76.8C307.2 87.04 337.92 51.2 378.88 46.08l225.28-20.48c20.48 0 40.96 5.12 56.32 15.36 15.36 10.24 25.6 30.72 25.6 51.2l5.12 81.92c0 15.36-10.24 25.6-25.6 25.6s-25.6-10.24-25.6-25.6l-5.12-81.92c0-10.24-10.24-20.48-25.6-20.48l-225.28 25.6c-5.12 0-10.24 5.12-15.36 10.24-5.12 0-5.12 10.24-5.12 15.36L368.64 204.8c0 10.24-10.24 25.6-25.6 25.6 5.12 0 0 0 0 0zM435.2 768c-15.36 0-25.6-15.36-25.6-30.72V399.36c0-15.36 10.24-40.96 25.6-40.96s25.6 25.6 25.6 35.84v337.92c0 15.36-10.24 35.84-25.6 35.84zM588.8 768c-15.36 0-25.6-15.36-25.6-30.72V465.92c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v271.36c0 15.36-10.24 30.72-25.6 30.72z" p-id="5272" fill="#999999"></path>
                </svg>  
              </i>

            </h1>
            <ul>
            <?php if(isset($searchhistory)){?>
            <?php foreach($searchhistory as $key => $searstory) { ?>
              <li id="count">
                <a onclick="javascript:selsearch('<?php echo $searstory['keywords']; ?>');"><?php echo $searstory['keywords']; ?></a>
                <!-- <i  onclick="javascript:del('<?php echo $searstory['id']; ?>');"></i> -->
              </li>
              <?php } ?>
              <?php } ?>
            </ul>
          </div>
        </div>
      </div>
    </div>
 <script>
        $(document).ready(function() {
              $('.ss_modal').keydown(function(e){
                if(e.keyCode==13){
                    $('.search_li').click();
                }
            })


            /* Search */
            $('.search_li ').click(function() {
              
                url = '<?php echo $search_url; ?>';
                var value = $("input[name='new_search']").val();

                if (value) {
                    url += '&search=' + encodeURIComponent(value);
                }
                location = url;
            });
        });
        function selsearch(value) {
          // alert(value);die;
          url = '<?php echo $search_url; ?>';
                if (value) {
                    url += '&search=' + encodeURIComponent(value);
                }
                location = url;
        }
        function del(id){
                     $.ajax({
                      url: '<?php echo $searchdel; ?>',
                      type: 'post',
                      data: {id:id},
                      dataType: 'json',
                      success: function(json) {
                        $('#count').html('');
                      }
                  })   
          }
    </script>