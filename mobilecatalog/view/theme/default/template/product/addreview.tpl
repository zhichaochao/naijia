<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="reviews2 clearfix" style="background: #fff;" id="product">
      <form action="<?php echo $action?>" method="post" enctype="multipart/form-data">
        <div class="pl_text clearfix">
          <div class="top clearfix">
            <h1>YOUR EVALUATION</h1>
            <hr />
          </div>        
          <p class="rating">Rating</p>
          <div class="start clearfix">
            <ol >
              <li class="active" value="1" ></li>
              <li value="2"></li>
              <li value="3"></li>
              <li value="4"></li>
              <li value="5"></li>
            </ol>
          </div>
          <input type="hidden" name="rating" value="1" class="in_start">

          <input type="hidden" name="order_id" value="<?php echo $order_id?>" >
          <textarea name="text" class="text_p" maxlength="1000" onkeydown="if(this.value.length>=1000){}"
             placeholder="How was your overall exprience using the item? "></textarea>
          <p class="num_p"><span>0</span>/1000</p>
          
          <div class="file clearfix">
            <p>Let me share some pictures</p>
            
            <ol class="file_ol clearfix">
              
            </ol>
            <ul class="file_ul clearfix">
              <li>
                <input class="file_in"   type="file" name="images[]" value="" multiple/>
              </li>
            </ul>
          </div>
          <div class="pl_lunbo clearfix" style="background: #000;">
              <!-- Swiper -->
              <div class="swiper-container">
                <div class="swiper-wrapper">
                </div>
                <!-- Add Pagination -->
              <div class="swiper-pagination"></div>
                <!-- Add Arrows -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
              </div>
              <div class="close"></div>
              <!-- <div class="fy_zsq"><i class="fy_i1">2</i>/<i class="fy_i2">5</i></div> -->
          </div>
        </div>
        <div class="sub">
          <button class="sub_btn" type="submit" >SUBMIT</button>
        </div>
      </form>   
    </div>
<?php echo $footer; ?>
<script type="text/javascript">
  $(function(){
    //星星
    $(".start ol>li").click(function(){
      var this_index = $(this).index();
      $(".start ol>li").removeClass()
      for(var i=0;i<this_index+1;i++){
        $(".start ol>li").eq(i).addClass("active");
        $(".in_start").val($(this).val());
      }
    })
    
    $(".text_p").keyup(function(){
      var val = $(this).val();
      $(".num_p span").text(val.length);
    })
    
    //lunbo
    var mySwiper = new Swiper('.swiper-container', {
      freeMode : false,
      observer: true,
      observeParents: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
        },
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
          on: {
          slideChangeTransitionStart: function(){
            $(".fy_zsq .fy_i1").text(this.activeIndex+1);
          },
      },
      });
    //lunbo colse
    $(".pl_lunbo .close").click(function(){
      $(".pl_lunbo ").hide();
    })
    
  })
  
  function flie_show(){
    if($(".file_ol>li").length>=5){
      $(".file_ul").css("display","none");
    }else{
      $(".file_ul").css("display","block");
    }
  }
  //调取上传框
    function getphoto(node) {
      if($(".file_ol>li").length<5){
        if($(window).width()<=920){
          $(".file_ul").css("margin-left",0.2+"rem");
        }
          var imgURL = "";
          try{
              var file = null;
              if(node.files && node.files[0] ){
                  file = node.files[0];
              }else if(node.files && node.files.item(0)) {
                  file = node.files.item(0);
              }
              try{
                  imgURL =  file.getAsDataURL();
              }catch(e){
                  imgRUL = window.URL.createObjectURL(file);
              }
          }catch(e){
              if (node.files && node.files[0]) {
                  var reader = new FileReader();
                  reader.onload = function (e) {
                      imgURL = e.target.result;
                  };
                  reader.readAsDataURL(node.files[0]);
              }
          }
          var li_text = '<li onclick="lunbo($(this))"><div class="close" onclick="det($(this))"></div><img src="'+imgRUL+'"/></li>'
          var sw_text = '<div class="swiper-slide"><img src="'+imgRUL+'"/></div>'
          $(".file_ol").append(li_text);
          $(".pl_lunbo .swiper-wrapper").append(sw_text);
          flie_show();
      }
    }
    
    function det(obj){
      obj.parent().remove();
      flie_show();
    }
    
    var this_index,this_ul,this_len;
    function lunbo(obj){
      if($(window).width()<=920){
        $(".pl_lunbo").show();
      }
      
       this_index = obj.index();
     this_ul = obj.parent();
     this_len = this_ul.find("li").length;
    $(".fy_zsq .fy_i1").text(this_index+1);
    $(".fy_zsq .fy_i2").text(this_len);
      //lunbo
    var mySwiper = new Swiper('.swiper-container', {
      freeMode : false,
      observer: true,
      observeParents: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
        },
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
          on: {
          slideChangeTransitionStart: function(){
            $(".fy_zsq .fy_i1").text(this.activeIndex+1);
          },
      },
      });
      $(".pl_lunbo .swiper-pagination-clickable span").eq(this_index).trigger('click');
    }
</script>
