<?php echo $header; ?>
<input type="hidden" name="allpage" value='<?=$allpage;?>' id='allpage'/>
<input type="hidden" name="page" value='1' id='page'/>
<input type="hidden" name="category_id" value='<?=$category_id;?>' id='category_id'/>
<input type="hidden" name="sort" value='<?=$sort;?>' id='sort'/>
<input type="hidden" name="order" value='<?=$order;?>' id='order'/>
<input type="hidden" name="limit" value='<?=$limit;?>' id='limit'/>
<!--内容-->
    <div class="in_content clearfix"></div>
    
    <div class="product clearfix">
    <!-- 放父分类照片 -->
      <div class="pro_ban">
        <div class="content">
          <img class="changeimage lazyLoad" data-image='<?php echo $image1?>' data-mimage='<?php echo $ydimage1?>'  />
        </div>
      </div>
      <div class="content">
        <div class="top_f clearfix">
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
                <?php if(!empty($product['special'])) { ?>
                     <span class="price"><?php echo $product['special']; ?>
                     <em><?php echo $product['price']; ?></em></span>
                  <?php }else{ ?>
                     <span class="price"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if(!empty($product['special'])) { ?>
                  <span class="red_span">-<?php echo $product['percent']; ?>%</span> <?php } ?>
                </div>
                   <em class="red_em <?=$product['hotsort']==1 ?'active':'';?>">FREE<br />SHIPPING</em> 
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
<?php echo $footer; ?>
<script>
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
         // tips('Collection Success');
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
  // function show_time() {
  //       $(".djs_p").each(function() {
  //           var endtime = $(this).prop("title");
  //           var time_start = new Date().getTime(); //设定当前时间
  //           var time_end = new Date(endtime).getTime(); //设定目标时间
  //           var time_distance = time_end - time_start;
  //           var timer;
  //           if (time_distance >= 0) {
  //               var int_day = Math.floor(time_distance / 86400000)
  //               time_distance -= int_day * 86400000;
  //               var int_hour = Math.floor(time_distance / 3600000)
  //               time_distance -= int_hour * 3600000;
  //               var int_minute = Math.floor(time_distance / 60000)
  //               time_distance -= int_minute * 60000;
  //               var int_second = Math.floor(time_distance / 1000)
  //               if (int_day < 10) {
  //                   int_day = "0" + int_day;
  //               }
  //               if (int_hour < 10) {
  //                   int_hour = "0" + int_hour;
  //               }
  //               if (int_minute < 10) {
  //                   int_minute = "0" + int_minute;
  //               }
  //               if (int_second < 10) {
  //                   int_second = "0" + int_second;
  //               }
  //               $(this).find(".int_day").text(int_day);
  //               $(this).find(".int_hour").text(int_hour);
  //               $(this).find(".int_minute").text(int_minute);
  //               $(this).find(".int_second").text(int_second);
  //           }else{
  //               clearInterval(timer);
  //               $(this).parent(".bg_hui").css("display","none");
  //           }
  //       })
  //       timer = setTimeout("show_time()", 1000);
  //   }
  //   show_time();
</script>
<script>
    function loadmore(obj){
     // console.log(11111);
      var allpage=$('#allpage').val();
      var page=$('#page').val();
      var sort=$('#sort').val();
      var category_id=$('#category_id').val();
      var limit=$('#limit').val();
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
                          url: 'index.php?route=product/category/loadpage&path='+category_id+'&page='+page,
                          dataType: 'json',
                          success: function(data) {
                            // alert(data);
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
                                if (data.products[i].hotsort==1) {
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
