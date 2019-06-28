<footer>
 <!--pc底部-->
    <div class="yd_footer2">
      <ol class="ol_ydfot clearfix">
            <?php if($sername =='/'){ ?>   
            <li class="active">
                  <a href="<?php echo $home?>">
                    <img src="/catalog/view/theme/default/img/png/fot_1.png" alt="" />
                    <img class="active" src="/catalog/view/theme/default/img/png/fot_1_.png" alt="" />
                    <p>Home</p>
                  </a>
                </li>
               <?php }else{ ?>
               <li class="<?=strpos($thispage,'common' ) !== false ?'active':'';?>">
                  <a href="<?php echo $home?>">
                    <img src="/catalog/view/theme/default/img/png/fot_1.png" alt="" />
                    <img class="active" src="/catalog/view/theme/default/img/png/fot_1_.png" alt="" />
                    <p>Home</p>
                  </a>
                </li>
                <?php }?>
                <li class="<?=strpos($thispage,'product' ) !== false ?'active':'';?>">
                  <a href="<?php echo $contac?>">
                    <img src="/catalog/view/theme/default/img/png/fot_2.png" alt="" />
                    <img class="active" src="/catalog/view/theme/default/img/png/fot_2_.png" alt="" />
                    <p>Collection</p>
                  </a>
                </li>
                <li>
                  <a class="contact" href="javascript:;">
                    <img src="/catalog/view/theme/default/img/png/fot_3.png" alt="" />
                    <img class="active" src="/catalog/view/theme/default/img/png/fot_3_.png" alt="" />
                    <p>Contact</p>
                  </a>
                </li>
                <li  class="<?=strpos($thispage,'information' ) !== false ?'active':'';?>">
                  <a href="<?php echo $me?>">
                    <img src="/catalog/view/theme/default/img/png/fot_4.png" alt="" />
                    <img class="active" src="/catalog/view/theme/default/img/png/fot_4_.png" alt="" />
                    <p>Me</p>
                  </a>
                </li>
              </ol>
            </div>
          <!--返回顶部-->
       <!--    <a href="<?php echo $vip?>"><div class="xf_right">
            <div class="vip"><span>VIP</span></div>
          </div>
          </a> -->
  </body>
</html>
</footer>
<script>
  
  $(function(){
    //banner轮播
    var swiper1 = new Swiper('#swiper1', {
      loop:true,
      autoplay: true,
      navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
        },
    });
    
    //4产品轮播
    var li_w=4;
      var win_w = $(window).innerWidth();
      if(win_w>920){
        li_w=4;
        mr_w=30;
      }else{
        li_w=2;
        mr_w="3%";
      }
    var swiper2 = new Swiper('.index_pro', {
          slidesPerView: li_w,
          spaceBetween: mr_w ,
          slidesPerGroup: li_w,
          loop: true,
          loopFillGroupWithBlank: true,
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
    });
  
    //4产品鼠标经过换图
    $(".in_ul2 .in_ul2_a .pic_img img").hover(function(){
      var src = $(this).attr("data-src");
      $(this).attr("src",src);
    },function(){
      var src = $(this).attr("srcs");
      $(this).attr("src",src);
    })
    
    //2产品小图点击换大图
    // $(".in_ul3 ul>li>img").click(function(){
    //   var src = $(this).attr("src");
    //   $(this).parents(".con").find(".img_a>img").attr("src",src);
    // });
    //评论弹窗
  

    //优惠券
    $(".in_coupon").click(function(){
      if($(window).width()>920){
        location.href = 'javascript:;';
      }else{
        $("body").css("overflow","hidden");
        $(".in_coupon_tc").animate({top:"0"});
      }
    });
    $(".in_coupon_tc .close").click(function(){
      $("body").css("overflow","");
      $(".in_coupon_tc").animate({top:"100%"});
    })
    
    $(".yhj_ol>li").click(function(){
      if(!$(this).hasClass("active")){
        $(this).addClass("active");
        tips("Successful collection","",500)
        $(this).find(".yh_btn").text("Coupon Added");
      }
    })
    
    
    
  })
  function subscribe()
{
    var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var email = $('#txtemails').val();
    if(email != "")
    {
        if(!emailpattern.test(email))
        {
            alert("Invalid Email");
            return false;
        }
        else
        {
            $.ajax({
                url: 'index.php?route=module/newsletters/news',
                type: 'post',
                data: 'email=' + $('#txtemails').val(),
                dataType: 'json',

                success: function(json) {
                    alert(json.message);
                }
            });
            return false;
        }
    }
    else
    {
        alert("Email Is Require");
        $(email).focus();
        return false;
    }
}
  
  
</script>