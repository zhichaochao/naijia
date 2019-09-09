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
              
                </div>
                <div class="text clearfix">
                  <h2><?php echo $product['name']; ?></h2>
                <?php if($product['special']) { ?>
                     <span class="price"><?php echo $product['special']; ?>
                     <em><?php echo $product['price']; ?></em></span>
                  <?php }else{ ?>
                     <span class="price"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if(!empty($product['special'])) { ?>
                  <span class="red_span">-<?php echo $product['percent']; ?>%</span> <?php } ?>
                  <!-- <span class="red_span">-56%</span> -->
                </div>
                <em class="red_em <?=$product['hot']==1 ?'active':'';?>"><p>FREE</p><br /><i>SHIPPING</i></em>
              </a>
              <!-- 收藏 -->
              <div class="sc <?=$product['wishlist']==1 ?'active':'';?>"
              onclick="wishlist('<?php echo $product['product_id']; ?>',this);"
              ></div>
            </li>
          <?php } ?>
      
       
 
       

          </ul>
        
         <!-- <div class="fy_div">
            <ul>
            <?php echo $pagination; ?>
            </ul>
          </div> -->
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
         $(e).removeClass("active");
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
        $(e).addClass("active");
      }else{
        tips('Please login first','gantan',1000);
        $(e).removeClass("active");
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
        // if(win<920){
             var scrollTop = $(obj).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(obj).height();
            if (allpage>page) {
             if (scrollHeight-scrollTop - windowHeight<=550 ) {
              page++;
              $('#page').val(page);
               $.ajax({
                          url: 'index.php?route=product/search/loadpage&search='+search+'&page='+page ,
                          dataType: 'json',
                          success: function(data) {
                            var result="";
                            for (var i =0; i < data.products.length ; i++) {
                            var addwinst="wishlist('"+data.products[i].product_id+"'";
                           result+='<li>'
                                +'<a href="'+data.products[i].href+'">'
                                +'<div class="pic_img">'
                                + '<img  class="top_img lazyLoad" srcs="'+data.products[i].thumb+'" data-src="'+data.products[i].thumbs+'"  class="top_img" />'
                                
                                + ' </div>'
                                + '<div class="text clearfix">'
                                + ' <h2>'+data.products[i].name+'</h2>'
                            if(data.products[i].special) { 
                           result+= ' <span class="price">"'+data.products[i].specia+'"'
                                   +'<em>'+data.products[i].price+'</em></span>'
                                }else{ 
                           result+= '<span class="price">'+data.products[i].price+'</span>'
                                }
                                 if(data.products[i].special) { 
                           result+= ' <span class="red_span">-'+data.products[i].percent+'%</span> '
                                 } 
                           result+='</div>'
                                if (data.products[i].hot==1) {
                            result+='<em class="red_em active"><p>FREE</p><br /><i>SHIPPING</i></em>' 
                                 }else{
                           result+='<em class="red_em "><p>FREE</p><br /><i>SHIPPING</i></em>' 
                                 }
                           result+='</a>'
                                if (data.products[i].wishlist==1) {
                           result+='<div class="sc active" onclick="'+addwinst+',this);">'
                                }else{
                           result+='<div class="sc" onclick="'+addwinst+',this);" >'
                               }
                           result+='</li>';
                           }
                           $('.prolist').append(result);
                          }
                       })
                      } 
                    }
                // }
              }
    //页面滚动执行事件
    $(window).scroll(function (){
        loadmore($(this));
    });
</script>