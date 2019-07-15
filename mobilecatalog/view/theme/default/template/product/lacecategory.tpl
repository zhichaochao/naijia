<?php echo $header; ?>
<input type="hidden" name="allpage" value='<?=$allpage;?>' id='allpage'/>
<input type="hidden" name="page" value='1' id='page'/>
<input type="hidden" name="category_id" value='<?=$category_id;?>' id='category_id'/>
<input type="hidden" name="sort" value='<?=$sort;?>' id='sort'/>
<input type="hidden" name="order" value='<?=$order;?>' id='order'/>
<input type="hidden" name="limit" value='<?=$limit;?>' id='limit'/>
   <div class="in_content clearfix"></div>
    <div class="top_ban">
      <img src="<?php echo $ydimage1?>"/>
    </div>
    <div class="product clearfix">
      <ul class="pro_list clearfix prolist">

      <?php foreach ($products as $product) { ?>
        <li class="clearfix">
          <div class="bg_fff clearfix">
            <div class="pic_img clearfix">
              <a href="<?php echo $product['href']; ?>">
                <img class="lazyLoad change_img" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>" />
              </a>
            </div>
            <div class="text clearfix">
              <a class="ov_text" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <div class="price_sp">
              <?php if(!empty($product['special'])) { ?>
                <span class="price_sp1"><?php echo $product['special']; ?></span>
                <span class="price_sp2"><?php echo $product['price']; ?></span>
                <?php }else{ ?>
                <span class="price_sp1"><?php echo $product['price']; ?></span>
                <?php } ?>
              </div>
              <a href="<?php echo $product['href']; ?>" class="start">
                   <!-- <ol class="start_ol">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <li class=""></li>
                      <?php } else { ?>
                      <li class="active"></li>
                      <?php } ?>
                      <?php } ?>
                     </ol> -->
                <!-- <i class="bg_hui"><i class="bg_red" style="width: 50%"></i></i>
                <span>(<?php echo $product['reviews']+20; ?>)</span> -->
              </a>
              <div class="like add_class <?=$product['wishlist']==1 ?'active':'';?>" onclick="wishlist('<?php echo $product['product_id']; ?>',this);"></div>
            </div>
            <?php if(!empty($product['special'])) { ?>
            <div class="discount"><span class="sp_1">-<?php echo $product['percent']; ?>%</span><span class="sp_2">off</span></div>
             <?php } ?>
          </div>
        </li>
         <?php } ?>
      </ul>
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
        if(win<920){
             var scrollTop = $(obj).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(obj).height();
            if (allpage>page) {
             if (scrollHeight-scrollTop - windowHeight<=250 ) {
              page++;
              $('#page').val(page);
               $.ajax({
                          url: 'index.php?route=product/category/loadpage&path='+category_id+'&page='+page,
                          dataType: 'json',
                          success: function(data) {
                            var result="";
                            console.log( data.products );
                            for (var i =0; i < data.products.length ; i++) {
                            var addwinst="wishlist('"+data.products[i].product_id+"'";
                              result+='<li class="clearfix">'
                              +'<div class="bg_fff clearfix">'
                              +'<div class="pic_img clearfix">'
                              +'<a href="'+data.products[i].href+'">'
                              // +'<div class="pic_img">'
                                +'<img  class="azyLoad change_img" srcs="'+data.products[i].thumb+'" data-src="'+data.products[i].thumbs+'"  class="top_img" />'
                              +' </a>'

                             result+='</div>'
                              + '<div class="text clearfix">'
                              + '<a class="ov_text" href="'+data.products[i].href+'">'+data.products[i].name +'</a>' 
                             
                              + '<div class="price_sp">'
                               if(data.products[i].special) { 
                              result+= ' <span class="price_sp1">'+data.products[i].specia+'</span>'
                              + '<span class="price_sp2">'+data.products[i].price+'</span>'
                              }else{ 
                               result+= ' <span class="price_sp1">'+data.products[i].price+'</span>'
                                   } 
                              + ' </div>'
                              result+= '<a href="'+data.products[i].href+'" class="start">'
                              // + ' <i class="bg_hui"><i class="bg_red" style="width: 50%"></i></i>'
                              // + ' <span>('+(data.products[i].reviews+20) +')</span>'
                              + ' </a>'
                               // +'<ol class="start_ol">'
                               //    for ($i = 1; $i <= 5; $i++) { 
                               //       if (data.products[i].rating < $i) {
                               //      result+= '<li class=""></li>'
                               //       } else { 
                               //      result+='<li class="active"></li>'
                               //       } 
                               //     } 
                               //  result+= '</ol>'
                                   if(data.products[i].special) { 
                                result+='<span class="red_span">-'+data.products[i].percent+'%</span>'
                                  } 
                              result+='</div>'
                              // if (data.products[i].hot==1) {
                              //       result+='<em class="red_em active">HOT<br />SALE</em>' 
                              //      }else{
                              //       result+='<em class="red_em ">HOT<br />SALE</em>' 
                              //      }
                              // result+='</a>'
                              if (data.products[i].wishlist==1) {
                                      result+='<div class="like add_class active" onclick="'+addwinst+',this);">'
                                     }else{
                                      result+='<div class="like add_class" onclick="'+addwinst+',this);" >';
                                }
                            result+='</div>'
                             +'</div>'
                               if(data.products[i].special) { 
                                result+='<div class="discount"><span class="sp_1">-'+data.products[i].percent+'%</span><span class="sp_2">off</span></div>'
                               } 
                              +'</div>'  
                              +'</li>';
                                   }
                           $('.prolist').append(result);
                          }
                       })
                      } 
                    }
                }
              }
    //页面滚动执行事件
    $(window).scroll(function (){
        loadmore($(this));
    });
</script>
