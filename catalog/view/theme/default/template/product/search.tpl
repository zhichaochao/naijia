<?php echo $header; ?>
<input type="hidden" name="allpage" value='<?=$allpage;?>' id='allpage'/>
      <input type="hidden" name="page" value='1' id='page'/>
      <input type="hidden" name="searchs" value='<?=$search;?>' id='searchs'/>

<!--内容-->
<?php if($products){?>
 <div class="in_content clearfix"></div>
    
    <div class="product clearfix">
      <div class="content">
        <div class="top_f clearfix">
          <div class="search_result">
            <form method="post" action="<?=$search_url;?>">
              <label class="clearfix" for="" id="content">
                <span class="ss_img">
                  <input type="submit" id="button-search"/> 
                </span>
                <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="in_text" />
                <!-- <input class="in_text" type="text" placeholder="" value="hair" /> -->
              </label>
            </form>
          </div>
          <p><?php echo $product_total; ?> items found</p>
          <div class="sortby">
            <p>Sort by : <img src="catalog/view/theme/default/img/png/icon_26.png  " alt="" /></p>
            <ul class="clearfix">
            <li><a href="<?php echo $sort_sort_rating?>">Best selling</a></li>
            <li><a href="<?php echo $sort_sort_add?>">Newest</a></li>
            <li><a href="<?php echo $sort_sort_order?>">Lowest price</a></li>
            <li><a href="<?php echo $sort_sort_order_d?>">Highest price</a></li>
            </ul>
          </div>
        </div>
      </div>
      
      <div class="pro_text">
        <div class="content">
          <ul class="pro_ul clearfix prolist">
        <?php foreach ($products as $product) { ?>
            <li>
              <a href="<?php echo $product['href']; ?>">
                <div class="pic_img">
                  <img  class="top_img lazyLoad" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>"  class="top_img" />
               <?php if($product['specials']){?>
                  <div class="bg_hui">
                    <p class="djs_p" title="<?php echo $product['date_end']; ?>">SALE ENDS 
                      <span class="int_day">00</span>:
                      <span class="int_hour">00</span>:
                      <span class="int_minute">00</span>:
                      <span class="int_second">00</span>
                    </p>
                  </div>
              <?php }?>
                </div>
                <div class="text clearfix">
                  <h2><?php echo $product['name']; ?></h2>
                  <ol class="start_ol">
                     <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                  </ol>
                  <p class="pl_p"><?php echo $product['reviews']+20; ?> reviews</p>
                <?php if($product['special']) { ?>
                     <span class="price"><?php echo $product['special']; ?>
                     <em><?php echo $product['price']; ?></em></span>
                  <?php }else{ ?>
                     <span class="price"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <!-- <span class="price">₦26K 
                  <em>₦46K </em>
                  </span> -->
                  <!-- <span class="red_span">-56%</span> -->
                </div>
                <em class="red_em <?=$product['hot']==1 ?'active':'';?>">HOT<br />SALE</em>
              </a>
              <!-- 收藏 -->
              <div class="sc <?=$product['wishlist']==1 ?'active':'';?>"
              onclick="wishlist('<?php echo $product['product_id']; ?>',this);"
              ></div>
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
    </div>
<?php }else{ ?>
 <div class="in_content clearfix"></div>
    
    <div class="product clearfix">
      <div class="content">
        <div class="top_f clearfix">
          <div class="search_result">
            <!-- <form action=""> -->
              <label class="clearfix" for="" id="content">
                <span class="ss_img">
                  <input type="button" id="button-search"/> 
                </span>
                <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="in_text" />

                <!-- <input class="in_text" type="text" placeholder="" value="hair" /> -->
              </label>
              <p class="cw_p">We didn’t find any items corresponding exactly to your query.</p>
            <!-- </form> -->
          </div>
          <p>0 items found</p>
          <div class="sortby">
            <p>Sort by : <img src="catalog/view/theme/default/img/png/icon_26.png  " alt="" /></p>
            <ul class="clearfix">
            <li><a href="<?php echo $sort_sort_rating?>">Best selling</a></li>
            <li><a href="<?php echo $sort_sort_add?>">Newest</a></li>
            <li><a href="<?php echo $sort_sort_order?>">Lowest price</a></li>
            <li><a href="<?php echo $sort_sort_order_d?>">Highest price</a></li>
            </ul>
          </div>
        </div>
      </div>
        </div>
<?php }?>
   

<script type="text/javascript"><!--
// $('#button-search').bind('click', function() {
//   // alert(11);
// 	url = 'index.php?route=product/search';

// 	var search = $('#content input[name=\'search\']').prop('value');

// 	if (search) {
// 		url += '&search=' + encodeURIComponent(search);
// 	}

// 	var category_id = $('#content select[name=\'category_id\']').prop('value');

// 	if (category_id > 0) {
// 		url += '&category_id=' + encodeURIComponent(category_id);
// 	}

// 	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

// 	if (sub_category) {
// 		url += '&sub_category=true';
// 	}

// 	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

// 	if (filter_description) {
// 		url += '&description=true';
// 	}

// 	location = url;
// });

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
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
        $('#wishlist_count').html(data.total);
      }
               // location.reload(); 
    }
   })
 }
}
  $(function(){
    $(".search_result label").click(function(){
      $(".ss_modal .in_text").val($(this).find(".in_text").val());
      $(".gg_nav").slideUp();
      $(".ss_modal").fadeIn();
      $(".ss_modal .bg_f").animate({top:"0%"});
      $("body").css("overflow","hidden");
    })
/*记录搜索历史记录*/
// var search = $('#content input[name=\'search\']').prop('value');
// alert(search);
// if (!empty($this->request->cookie['search'])){ 
// 　　$history = explode(',', $_COOKIE['ECS']['search']);

// 　　array_unshift($history, $search); //在数组开头插入一个或多个元素
// 　　$history = array_unique($history);  //移除数组中的重复的值，并返回结果数组。

// 　　setcookie('[search]', implode(',', $history), gmtime() + 3600 * 24 * 30);
// }else{
// 　　setcookie('[search]', $search, gmtime() + 3600 * 24 * 30);
// }
    // $(".sortby").hover(function(){
    //   $(this).find("ul").stop().slideDown();
    // },function(){
    //   $(this).find("ul").stop().slideUp();
    // })
        if($(window).width()>920){
      $(".sortby").hover(function(){
        $(this).addClass("active");
        $(this).find("p img").css("transition",".5s");
        $(this).find("ul").stop().slideDown();
      },function(){
        $(this).removeClass("active");
        $(this).find("ul").stop().slideUp();
        $(this).find("p img").css("transition",".5s");
      })
    }else{
      $(".sortby>p").click(function(){
        if($(this).parent().hasClass("active")){
          $(this).parent().removeClass("active");
          $(this).siblings("ul").stop().slideUp();
          $(this).find("img").css("transition",".5s");
        }else{
          $(this).parent().addClass("active");
          $(this).find("img").css("transition",".5s");
          $(this).siblings("ul").stop().slideDown();
        }
      })
    }
    //收藏
    $(".sc").click(function(){
      if($(this).hasClass("active")){
        $(this).removeClass("active");
      }else{
        $(this).addClass("active");
      }
    })
    
    //产品鼠标经过换图
    $(".product .pro_text .pro_ul>li .top_img").hover(function(){
      var src = $(this).attr("data-src");
      $(this).attr("src",src);
    },function(){
      var src = $(this).attr("srcs");
      $(this).attr("src",src);
    })
  })
  //倒计时
  function show_time() {
        $(".djs_p").each(function() {
            var endtime = $(this).prop("title");
            var time_start = new Date().getTime(); //设定当前时间
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
                $(this).parent(".bg_hui").css("display","none");
            }
        })
        timer = setTimeout("show_time()", 1000);
    }
    show_time();
--></script>
<?php echo $footer; ?>

<script>
    function loadmore(obj){
      var allpage=$('#allpage').val();
      var page=$('#page').val();
      var sort=$('#sort').val();
      var search=$('#searchs').val();
      // var category_id=$('#category_id').val();
      // var limit=$('#limit').val();
      var win =$(window).width();
        if(win<920){
             var scrollTop = $(obj).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(obj).height();
            if (allpage>page) {
             if (scrollHeight-scrollTop - windowHeight<=250 ) {
              page++;
              $('#page').val(page);
               $.ajax({
                          url: 'index.php?route=product/search/loadpage&search='+search+'&page='+page ,
                          dataType: 'json',
                          success: function(data) {
                            var result="";
                            console.log( data.products );
                            for (var i =0; i < data.products.length ; i++) {
                            var addwinst="wishlist('"+data.products[i].product_id+"'";


                            result+='<li>'
                           +'<a href="'+data.products[i].href+'">'
                             +'<div class="pic_img">'
                                +'<img  class="top_img lazyLoad" srcs="'+data.products[i].thumb+'" data-src="'+data.products[i].thumbs+'"  class="top_img" />'
                                if(data.products[i].specials){

                                result+='<div class="bg_hui">'

                                 +'<p class="djs_p" title="'+data.products[i].date_end+'" >SALE ENDS '
                                    +'<span class="int_day">00</span>:'
                                   +'<span class="int_hour">00</span>:'
                                   + '<span class="int_minute">00</span>:'
                                    +'<span class="int_second">00</span>'
                                  +'</p>'
                                +'</div>'

                               } 

                             result+='</div>'
                            + '<div class="text clearfix">'
                              + '<h2>'+data.products[i].name
                               +' </h2>'
                               +'<ol class="start_ol">'
                                  for ($i = 1; $i <= 5; $i++) { 
                                     if (data.products[i].rating < $i) {
                                    result+= '<li class=""></li>'
                                     } else { 
                                    result+='<li class="active"></li>'
                                     } 
                                   } 
                                result+= '</ol>'
                               +'<p class="pl_p">'+(data.products[i].reviews+20) +'reviews'
                               +'</p>'

                               if(data.products[i].special) { 

                                  result+= '<span class="price">'+data.products[i].special
                                 +'<em>'+data.products[i].price+'</em></span>'

                                 }else{ 

                                  result+= '<span class="price">'+data.products[i].price+'</span>'
                                 } 

                                   if(data.products[i].special) { 
                                result+='<span class="red_span">-'+data.products[i].percent+'%</span>'
                                  } 
                              result+='</div>'

                              if (data.products[i].hot==1) {
                                    result+='<em class="red_em active">HOT<br />SALE</em>' 
                                   }else{
                                    result+='<em class="red_em ">HOT<br />SALE</em>' 
                                   }

                             
                            result+='</a>'

                            if (data.products[i].wishlist==1) {
                                    result+='<div class="sc active" onclick="'+addwinst+',this);">'
                                   }else{
                                    result+='<div class="sc" onclick="'+addwinst+',this);" >';
                              }
                            result+='</div>'
                         +'</li>';
                                   }
                                  // console.log(result);
                           $('.prolist').append(result);
                          }
                       })
                      } 
                    }
                    // else if(!$(".pro_text ").hasClass('over')){
                    //   $(".pro_text ").addClass('over')
                    //    $(".pro_text ").append("<p>加载完成</p>");
                    // }
                }
              }
    //页面滚动执行事件
    $(window).scroll(function (){
        loadmore($(this));
    });
</script>