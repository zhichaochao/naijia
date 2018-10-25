<footer>
 <!--pc底部-->
    <div class="footer pc_fot clearfix">
      <div class="top clearfix">
        <ul class="fot_ul1 clearfix">

        <?php foreach($informations as $key => $information) { ?>
          <li>
            <h1><?php echo $information['title']; ?> <img class="fot_img" src="<?php echo $information['image']; ?>" /></h1>
            <ol class="fot_ol">
            <?php foreach($information['child'] as $subkey=>$subval) { ?> 
              <li><a href="<?php echo $subval['url']; ?>"><?php echo $subval['title']; ?></a></li>
            <?php } ?>
            </ol>
          </li>
        <?php } ?>

          <li>
            <h1>SING UP OUR NEWSLETTER! <img class="fot_img" src="/catalog/view/theme/default/img/png/icon_11.png" alt=""/></h1>
            <div class="text fot_ol">
              <!-- <form > -->
                <label for="">
                  <i></i>
                  <input type="text" name="txtemail" id="txtemails" placeholder="Enter your e-mail"/>
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
    <!-- <div class="xf_right">
      <div class="vip"><a href="###"><span>VIP</span></a></div>
    </div> -->
    
    
    
   
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
    var swiper2 = new Swiper('.in_ul2', {
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
    $(".in_ul3 ul>li>img").click(function(){
      var src = $(this).attr("src");
      $(this).parents(".con").find(".img_a>img").attr("src",src);
    });
    
    
    
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