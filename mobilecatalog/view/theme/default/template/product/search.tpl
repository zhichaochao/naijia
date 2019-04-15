<?php echo $header; ?>
<input type="hidden" name="allpage" value='<?=$allpage;?>' id='allpage'/>
      <input type="hidden" name="page" value='1' id='page'/>
      <input type="hidden" name="searchs" value='<?=$search;?>' id='searchs'/>

<!--内容-->
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="product clearfix">
      <div class="content">
        <div class="top_f clearfix">
          <div class="search_result">
            <form method="post" action="<?=$search_url;?>">
              <label class="clearfix" for="" id="content">
                <span class="ss_img">
                  <input type="submit" id="button-search"> 
                </span>
                <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="in_text" />
              </label>
              <?php if(!$products){?>
              <p class="cw_p">We didn’t find any items corresponding exactly to your query.</p>
            <?php }?>
            </form>
          </div>
          <?php if($products){?>
          <p class="num_p"><?php echo $product_total; ?> items found</p>
          <?php }?>
        </div>
      </div>
      
      <div class="product clearfix">
        <ul class="pro_list clearfix prolist">
        <?php if($products){?>

        <?php foreach ($products as $product) { ?>
          <li class="clearfix">
            <div class="bg_fff clearfix">
              <div class="pic_img clearfix">
                <a href="<?php echo $product['href']; ?>">
                  <img class="lazyLoad change_img" srcs="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumbs']; ?>" />
                </a>
                 <?php if(empty($product['special'])) { ?>
                <em class="red_em <?=$product['hot']==1 ?'active':'';?>">HOT<br />SALE</em>
                <?php }?>
              </div>
              <div class="text clearfix">
                <a class="ov_text" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <div class="price_sp">
                <?php if($product['special']) { ?>
                  <span class="price_sp1"><?php echo $product['special']; ?></span>
                  <span class="price_sp2"><?php echo $product['price']; ?></span>
                  <?php }else{ ?>
                  <span class="price_sp1"><?php echo $product['price']; ?></span>
                  <?php }?>
                </div>
                <a href="<?php echo $product['href']; ?>" class="start">
                 <?php if($product['rating']>100) { ?>
                  <i class="bg_hui"><i class="bg_red" style="width:100%"></i></i>
                  <?php }else{ ?>
                  <i class="bg_hui"><i class="bg_red" style="width: <?php echo $product['rating']; ?>%"></i></i>
                   <?php } ?>
                  <span>(<?php echo $product['reviews']+20; ?>)</span>
                </a>
                <div class="like add_class <?=$product['wishlist']==1 ?'active':'';?>"  onclick="wishlist('<?php echo $product['product_id']; ?>',this);"></div>
              </div>
              <?php if(!empty($product['special'])) { ?>
              <div class="discount"><span class="sp_1">-<?php echo $product['percent']; ?>%</span><span class="sp_2">off</span></div>
              <?php }?>
            </div>
          </li>
       <?php }?>
       <?php }?>
        </ul>
      </div>
    
    </div>

   

<script type="text/javascript">
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
            url:'<?php echo $wishlist ;?>',
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
  $(function(){
    $(".search_result label").click(function(){
      $(".ss_modal .in_text").val($(this).find(".in_text").val());
      $(".gg_nav").slideUp();
      $(".ss_modal").fadeIn();
      $(".ss_modal .bg_f").animate({top:"0%"});
      $("body").css("overflow","hidden");
    })

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
                            result+='<li class="clearfix">'
                            +'<div class="bg_fff clearfix">'
                            +'<div class="pic_img clearfix">'
                            +'<a href="'+data.products[i].href+'">'
                              // +'<div class="pic_img">'
                                +'<img  class="azyLoad change_img" srcs="'+data.products[i].thumb+'" data-src="'+data.products[i].thumbs+'"  class="top_img" />'
                             +' </a>'
                              if(data.products[i].special=='') {
                             if (data.products[i].hot==1) {
                                    result+='<em class="red_em active">HOT<br />SALE</em>' 
                                   }else{
                                    result+='<em class="red_em ">HOT<br />SALE</em>' 
                                   }
                                      }
                             result+='</div>'
                              + '<div class="text clearfix">'
                             + '<a class="ov_text" href="'+data.products[i].href+'">'+data.products[i].name +'</a>' 
                             
                              + '<div class="price_sp">'
                               if(data.products[i].special) { 
                              result+= ' <span class="price_sp1">'+data.products[i].special+'</span>'
                              + '<span class="price_sp2">'+data.products[i].price+'</span>'
                              }else{ 
                               result+= ' <span class="price_sp1">'+data.products[i].price+'</span>'
                                   } 
                              + ' </div>'
                              result+= '<a href="'+data.products[i].href+'" class="start">'
                                if(data.products[i].rating>100) {
                               result+=' <i class="bg_hui"><i class="bg_red" style="width: 100%"></i></i>'
                               }else{ 
                               result+= ' <i class="bg_hui"><i class="bg_red" style="width: '+data.products[i].rating+'%"></i></i>'
                                } 
                               result+= ' <span>('+(data.products[i].reviews+20) +')</span>'
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
                                //    if(data.products[i].special) { 
                                // result+='<span class="red_span">-'+data.products[i].percent+'%</span>'
                                //   } 
                              result+='</div>'
                              // if (data.products[i].hot==1) {
                              //       result+='<em class="red_em active">HOT<br />SALE</em>' 
                              //      }else{
                              //       result+='<em class="red_em ">HOT<br />SALE</em>' 
                              //      }
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