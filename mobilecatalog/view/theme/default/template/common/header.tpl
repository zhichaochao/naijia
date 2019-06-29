<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/mobilecatalog/view/theme/default/css/common.css" />
    <link rel="stylesheet" href="/mobilecatalog/view/theme/default/css/index.css" />
    <link rel="stylesheet" href="/mobilecatalog/view/theme/default/css/swiper.min.css" />
    <script type="text/javascript" src="/mobilecatalog/view/theme/default/js/jquery.min.js" ></script>
    <script type="text/javascript" src="/mobilecatalog/view/theme/default/js/common.js" ></script>
    <script type="text/javascript" src="/mobilecatalog/view/theme/default/js/swiper.js" ></script>
    <noscript><style type="text/css">body{display:none;}</style></noscript>
<script type="text/javascript" src="http://us03.lockview.cn/Js/lockview.js?uid=LK5322592"></script>
    <script type="text/javascript">
      $(function () {
        $('#checkout_btn').click(function () {
          location.href='<?=$shopping_cart;?>';
          
        })
      })
    </script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-143035073-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-143035073-1');
</script>
    <!-- Start of  Zendesk Widget script -->
<script id="ze-snippet" src="https://static.zdassets.com/ekr/snippet.js?key=01dae825-e951-47d2-a05b-0d534955e3bf"> </script>
<!-- End of  Zendesk Widget script -->
    <?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="mobilecatalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>



    <title><?=$title?></title>
  </head>
  <body>
    <!--头部-->
    <div class="big_nav">
      <div class="gg_nav">
      <ul>
          <li><p><i></i><?php echo $slogan?></p></li>
          <li><p><i></i><?php echo $sslogan?></p></li>
        </ul>
        <!-- <p><i></i><?php echo $slogan?></p> -->
      </div>
      <!-- pc导航结束 -->
        <div class="yd_nav">
        <ul class="yd_navul">
          <li class="kg_li"></li>
          <li class="logo_li"><a href="<?=$home;?>"></a></li>
          <li class="ss_li"></li>
           <?=$mcurrency;?>
          <li class="gw_li" id="checkout_btn"><span id='cart_count'><?=$text_cart_items;?></span></li>
        </ul>
      </div>

    
    </div>
    <!--yd导航-->
    <div class="yd_nav_modal">
      <div class="text">
        <div class="top_nav">
          <ul>
            <li><a href="<?=$home;?>">Home <i></i></a></li>
            <?php foreach($categorieson as $key => $category) { ?>
            <!-- <li><a href="<?php echo $hothref;?>"><span class="hot">Hot Sales </span><i></i></a>
            </li> -->
            <li >
              <p class="nav_p active li_p2"><a href="<?php echo $hothref;?>">Hot Sales <i></i></a></p>
              <!-- <p class="nav_p active li_p2">Hot Sales <i></i></p>      -->
                    <?php if( $category['children']){ ?>
                 <ol class="yd_nav_ol li_i" style="display: block;">
                       <?php foreach($category['children'] as $k => $child) { ?>
                      <li><a href="<?=$child['href'];?>"><?=$child['name'];?></a></li>
                      <?php } ?>
                    </ol>
                    <?php } ?>
                  </li>
            <?php } ?>
            <?php foreach($categories as $key => $category) { ?>
            <li >
              <p class="nav_p active li_p1"><a href="<?php echo $category['href'];?>"><?php echo $category['name'];?><i></i></a></p>
              <p class="nav_p active li_p2"><?php echo $category['name'];?><i></i></p>     
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
                <!-- 暂时隐藏 -->
                <!-- <li><a href="<?php echo $blog;?>">Blog</a></li> -->
              </ol> 
            </li>
            <li><a href="<?php echo $lagosstore;?>">Lagos Store <i></i></a></li>
            <li><a href="<?php echo $aboutus;?>">About Us <i></i></a></li>
            <li><a href="<?=$wishlist;?>">Wish List <i></i></a></li>
          </ul>
        </div>

      </div>
    </div>
     <!--pc搜索弹窗-->
    <div class="ss_modal">
      <div class="bg_f clearfix">
        <div class="text clearfix">
          <div class="close"><img src="/catalog/view/theme/default/img/png/close5.png" alt="" /></div>
          <form method="post" action="<?=$search_url;?>" >
          <label class="clearfix" for="">

            <span class="ss_img">
              <input type="submit" class="search_li" /> 
            </span>
            <input class="in_text" type="text" placeholder="Search  keyword" name="search" />
            <img class="in_close" src="catalog/view/theme/default/img/png/icon_24.png" alt="" />
          </label>
        </form>
           <div class="con clearfix">
            <h1>TRENDING SEARCHES</h1>
            <ol>
            <?php if(isset($hotsearched)){?>
            <?php foreach($hotsearched as $key => $hotsearstory) { ?>
              <li class="active">
                <a  onclick="javascript:selsearch('<?php echo $hotsearstory['url']; ?>');"><?php echo $hotsearstory['content']; ?></a>
                
              </li>
              <?php } ?>
              <?php } ?>
            </ol>
          </div>
          <div class="con clearfix">
            <h1>YOUR RECENT SEARCHES
            </h1>
            <ul>
            <?php if(isset($searchhistory)){?>
            <?php foreach($searchhistory as $key => $searstory) { ?>
              <li id="count">
                <a onclick="javascript:selsearch('<?php echo $searstory['url']; ?>');"><?php echo $searstory['keywords']; ?></a>
              </li>
              <?php } ?>
              <?php } ?>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <!--contact弹窗-->
    <div class="con_modal clearfix">
      <div class="text">
        <h1>CONTACT US</h1>
        <ol class="con_ol">
          <li>
            <a class="con_email" href="javascript:;">
              <img class="con_img" src="catalog/view/theme/default/img/png/icon_86.png"/>
              <p class="con_p">E-mail</p>
            </a>
          </li>
          <li>
            <a href="http://api.whatsapp.com/send?phone=<?php echo $whatsapp?>">
              <img class="con_img" src="catalog/view/theme/default/img/png/icon_87.png"/>
              <p class="con_p">WhatsApp</p>
            </a>
          </li>
          <li>
            <a href="http://www.instagram.com/<?php echo $instagram?>">
              <img class="con_img" src="catalog/view/theme/default/img/png/icon_88.png"/>
              <p class="con_p">Instagram</p>
            </a>
          </li>
          <li>
            <a href="http://www.facebook.com/<?php echo $facebook?>">
              <img class="con_img" src="catalog/view/theme/default/img/png/icon_89.png"/>
              <p class="con_p">Facebook</p>
            </a>
          </li>
        </ol>
      </div>
      
      <div class="context">
        <div class="close"></div>
        <h1>contact us</h1>
        <p>Thank you for your message, we will contact you within 24 hours.</p>
        <form action="<?php echo $action; ?>" method="post" class="dash-help-form">
          <input type="text" name="user_name" value="<?=$firstname;?>" placeholder="Firstname" />
          <input type="text" class="in_1" name="email" value="<?=$email;?>" placeholder="Your Email" />
          <input type="text" name="telephone" value="<?=$telephone;?>" placeholder="Your Phone" />
          <textarea  class="in_2" placeholder="Message" name="enquiry"></textarea>
          <button type="submit" class="tj_btn">Send Message</button>
        </form>
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
            // $('.search_li ').click(function() {
              
            //     url = '<?php echo $search_url; ?>';
            //     var value = $("input[name='new_search']").val();

            //     if (value) {
            //         url += '&search=' + encodeURIComponent(value);
            //     }
            //     location = url;
            // });
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

          $(".tj_btn").click(function(event){
    
      if(($(".in_1").val().length >= 4) && ($(".in_2").val().length >= 4)  ){
       
      }else{
        event.preventDefault();
      }
     })
    </script>