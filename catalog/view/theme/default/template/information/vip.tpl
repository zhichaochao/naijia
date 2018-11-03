<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    
    <div class="vip_con clearfix">
      <div class="text right_text clearfix">
        <div class="bnr clearfix">
          <img class="changeimage lazyLoad"  data-image="catalog/view/theme/default/img/vip1.jpg" data-mimage="catalog/view/theme/default/img/yd_vip1.jpg" alt="" />
        </div>
        <div class="form_div clearfix">
          <div class="form_text clearfix">

            <form>
              <h2>JOIN VIP MEMBER</h2>
              <!--label的class  true是输入正确的一种显示格式-->
              <label class="clearfix " for="">
                <span class="pl_span">Frist Name</span>

                <input class="in_1" type="text" name="firstname" value="" placeholder="Frist Name" id="input-firstname" class="form-control" />
                <!-- <input type="text" value="Frist Name" /> -->
                <p class="ts_ps ">please enter your first name. </p>
              </label>


              <label class="clearfix" for="">
                <span class="pl_span">Last Name</span>
                <input class="in_2" type="text" name="lastname" value="" placeholder="Last Name" id="input-lastname" class="form-control" />
                <!-- <input type="text" placeholder="Last Name" /> -->
                <p class="ts_ps ">please enter your lastname. </p>
              </label>


              <label class="w_50 fl clearfix" for="">
                <span class="pl_span">Gender</span>
                <input  class="in_3" type="text" name="gender" value=""   placeholder="Gender" id="input-gender" class="form-control"/>
                <!-- <input type="text" placeholder="Gender" /> -->
                <p class="ts_ps">please enter your  gender. </p>
              </label>


              <label class="w_50 fr clearfix" for="">
                <span class="pl_span">Birthday</span>
                <input  class="in_4" type="text" name="birthday" value=""   placeholder="Birthday" id="input-birthday" class="form-control"/>
                <!-- <input type="text" placeholder="Birthday" /> -->
                <p class="ts_ps">please enter your  birthday. </p>
              </label>
              <label class="clearfix" for="">
                <span  class="pl_span" >Phone</span>
                <input class="in_5" type="text" name="phone" value=""   placeholder="Phone" id="input-phone" class="form-control"/>
                <!-- <input type="text" placeholder="Phone" /> -->
                <p class="ts_ps">please enter your  phone. </p>
              </label>
              <label class="clearfix" for="">
                <span class="pl_span">Email</span>
                 <input class="in_6" type="text" name="email" value=""   placeholder="Email" id="input-email" class="form-control"/>
                <!-- <input type="text" placeholder="Email" /> -->
                <p class="ts_ps">please enter your  email. </p>
              </label>
              <button class="tj_btn" type="submit">SUBMIT</button>
            </form>

          </div>
          <div class="r_text clearfix">
            <p>1. In 30/11/2018, you can be our online VIP by just signing up here, 
              and get a 2K VIP point.<br />
              2. You can get our S-VIP card directly by your first buying from us in
              30/11/2018, that you can enjoy all service with 10% off in our Lagos
              strore. 
            </p>
          </div>
          
        </div>
        
        <div class="img clearfix">
          <img class="changeimage lazyLoad"  data-image="catalog/view/theme/default/img/vip2.jpg" data-mimage="catalog/view/theme/default/img/yd_vip2.jpg" alt="" />
          <img class="changeimage lazyLoad"  data-image="catalog/view/theme/default/img/vip3.jpg" data-mimage="catalog/view/theme/default/img/yd_vip3.jpg" alt="" />
        </div>
      </div>
    </div>
    
<?php echo $footer; ?>
<script type="text/javascript">
  window.onload =function(){
    if($(window).width()>920){
      let lf_len = $(".form_text").height();
      $(".r_text").height(lf_len);
      $(".r_text").css("line-height","4.9rem");
    }
  }


  $(function(){
    $("input").focus(function(){
      $(this).attr("placeholder","");
      $(this).siblings(".pl_span").css("display","block");
    })
    $("input").blur(function(){
      
      $(this).attr("placeholder",$(this).siblings(".pl_span").text());
      $(this).siblings(".pl_span").css("display","none");
    })


     $(".in_1").blur(function(){
      if($(this).val()!="" && $(this).val().length<=32 && $(this).val().length>=1){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })
     $(".in_2").blur(function(){
      if($(this).val()!="" && $(this).val().length<=32 && $(this).val().length>=1){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })
     $(".in_3").blur(function(){
      var in_2val = $(".in_2").val();
      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=3){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })
     $(".in_4").blur(function(){
      var in_2val = $(".in_2").val();
      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=2){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })
     $(".in_5").blur(function(){
      var in_2val = $(".in_2").val();
      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=2){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })
     $(".in_6").blur(function(){
      var in_2val = $(".in_2").val();
      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=2){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })

   })
</script>