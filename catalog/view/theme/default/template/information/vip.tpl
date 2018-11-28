<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    
    <div class="vip_con clearfix">
      <div class="text right_text clearfix">
        <div class="bnr clearfix">
          <img class="changeimage lazyLoad"  data-image="catalog/view/theme/default/img/vip1.jpg" data-mimage="catalog/view/theme/default/img/yd_vip1.jpg" alt="" />
        </div>
        <div class="form_div clearfix" id="register-form-div">
          <div class="form_text clearfix">

            <!-- <form > -->
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
               <!--  <span class="pl_span">Gender</span> -->
                <!-- <input  class="in_3" type="text" name="gender" value=""   placeholder="Gender" id="input-gender" class="form-control"/> -->
                  <select name="genders" class="in_3" id="input-gender" style="color: #333 !important;">
                  <option value="female" >female</option>
                  <option value="male" >male</option>
                </select>
                <!-- <input type="text" placeholder="Gender" /> -->
                <p class="ts_ps">please enter your  gender. </p>
              </label>


              <label class="w_50 fr clearfix" for="">
                <span class="pl_span">Birthday</span>
                <input class="time in_4" id="input-birthday" type="text" name="birthday"  placeholder="Birthday" />
                <!-- <input  class="in_4" type="text" name="birthday" value=""   placeholder="Birthday" id="input-birthday" class="form-control"/> -->
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
                <p class="ts_ps" id="erroremail" >please enter your  email. </p>
              </label>

              <label class="clearfix" for="">
                <span class="pl_span">Password</span>
                <input class="in_7" type="password" name="password" value="" placeholder="Password" id="input-passwords" class="form-control"/>
                <!-- <input type="text" placeholder="Email" /> -->
                <p class="ts_ps" id="errorpassword" >please enter your  password. </p>
              </label>

              <label class="clearfix" for="">
                <span class="pl_span">ConfirmPassword</span>
               <input class="in_8" type="password" name="confirm" id="input-confirms" placeholder="Confirm Password" class="form-control"/>
                <!-- <input type="text" placeholder="Email" /> -->
                <p class="ts_ps" id="errorconfirm" >please enter your  password. </p>
              </label>

               <input  type="hidden" name="agree" value="1"/>
              <button class="tj_btn" type="submit" id="button-register">SUBMIT</button>
            <!-- </form> -->

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

    <!--vip弹窗-->
    <div class="vip_modal clearfix">
      <div class="text clearfix">
        <div class="close"></div>
        <img class="changeimage lazyLoad lf_img"  data-image="catalog/view/theme/default/img/vip4.jpg" data-mimage="catalog/view/theme/default/img/yd_vip4.jpg" alt="" />
        <div class="right clearfix">
          <img src="catalog/view/theme/default/img/vip_6.png"/>
          <span>Congratulation!</span>
          <p>
            You have now became our VIP member.<br />
            ₦2000 points has store to your account.
          </p>
          <div class="btn">
            <a class="vip_a" href="<?php echo $back?>">Continute to shop</a>
          </div>
        </div>
      </div>
    </div>
    
<?php echo $footer; ?>
<link rel="stylesheet" href="catalog/view/theme/default/css/time.css" />
<script type="text/javascript" src="catalog/view/theme/default/js/time.js" ></script>
<script type="text/javascript">
  window.onload =function(){
    if($(window).width()>920){
      let lf_len = $(".form_text").height();
      $(".r_text").height(lf_len);
      $(".r_text").css("line-height","4.9rem");
    }


      //時間插件
    function getNow(s) {
        return s < 10 ? '0' + s: s;
    }
    let myDate = new Date();
    let year=myDate.getFullYear();
    let month=myDate.getMonth()+1;
    let day=myDate.getDate(); 
    let now=year+'-'+getNow(month)+"-"+getNow(day);
    window.onload =function(){
      $(".time").attr("value",now);
    }
    $(".time").focus(function(e){
         $(".time").attr("placeholder","");
         $(".time").siblings(".pl_span").css("display","block");

        e.stopPropagation();
        $(this).lqdatetimepicker({
        css : 'datetime-day',
        dateType : 'D',
        selectback : function(){
        }
      });



    })
    
  }


  $(function(){
    $("input").focus(function(e){
        
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
      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=1){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })
     $(".in_4").change(function(){
      
      if($(this).val()!=""){
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
      var text=$(this).val();
      var re=/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;

      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=2 ){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }

      if(!re.test(text)){
        
          $(this).siblings(".ts_ps").addClass("off"); 
          $(this).parent().removeClass("true");
           $(this).siblings(".ts_ps").text("The email address you entered is incorrect");
      }

      if(text==""){
        
          $(this).siblings(".ts_ps").addClass("off"); 
          $(this).parent().removeClass("true");
           $(this).siblings(".ts_ps").text("please enter your  email. ");
      }

     })

    //  $(".in_6").change(function(){

      
      
    //   if(){
    //     $(this).siblings(".ts_ps").addClass("off");
    //     $(this).siblings(".ts_ps").text("The email address you entered is incorrect");
    //   }else{
    //     $(this).siblings(".ts_ps").removeClass("off");
    //   }
    // })

     $(".in_7").blur(function(){
     
      if(($(this).val()!="") && ($(this).val().length<=20) && $(this).val().length>=4){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
           $(this).siblings(".ts_ps").text("Password must be between 4 and 20 characters!");
      }

      $(".in_8").val("");
        $(".in_8").parent().removeClass("true");
     })

     $(".in_8").blur(function(){
      var in_7val = $(".in_7").val();
      if(($(this).val()!="") && ($(this).val().length>=4) && ($(this).val()==in_7val)){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
          $(this).siblings(".ts_ps").text("The passwords you entered are not consistent. Please re-enter them");
      }
     })

   })

  $(document).delegate('#button-register', 'click', function(e) {
    if($(".time").val()==""){
      
      $(".time").siblings(".ts_ps").addClass("off"); 
      e.preventDefault();  
     return loop = 0;
    }else{
      $(".time").siblings(".ts_ps").removeClass("off");
    }
    var loop = 1;
   
    $('#register-form-div input').each(function(){
      if($(this).val()==""){
        $(this).siblings(".ts_ps").addClass("off");
        $(this).siblings(".ts_ps").text("不能为空");
        e.preventDefault();  
         return loop = 0;
      }
    })

    $('#register-form-div .ts_ps').each(function(){
      if($(this).hasClass("off")){
        $(this).siblings(".ts_ps").addClass("off");
        e.preventDefault();  
       return loop = 0;
      }

    })

    if(loop==0){
       e.preventDefault();  
       return false;
    }
  // console.log($('#register-form-div input select'));
    // $(".zzc_li").css("display","block");
    //  $("div").addClass("hidden");



      $.ajax({
        url: '<?php echo $register;?>',
        type: 'post',
        data: $('#register-form-div input[type=\'text\'], #register-form-div input[type=\'hidden\'], #register-form-div input[type=\'password\'], #register-form-div input[type=\'radio\']:checked, #register-form-div input[type=\'checkbox\']:checked, #register-form-div select, #register-form-div textarea'),
        dataType: 'json',
      
        success: function(json) {
          if (json['redirect']) {
            // location = json['redirect']; 


            //表单提交
            // $(".tj_btn").click(function(e){
              
              $(".vip_modal").fadeIn();
              $("body").css("overflow","hidden");
              let vip_w = $(".vip_modal .text").width();
              let vip_h = $(".vip_modal .text").height();
              $(".vip_modal .text").css("margin-left",-vip_w/2+"px").css("margin-top",-vip_h/2+"px");
              e.preventDefault();
            // })
            
            $(".vip_modal").click(function(e){
              var close = $('.vip_modal .text'); 
                if(!close.is(e.target) && close.has(e.target).length === 0){
                  $(".vip_modal").fadeOut();
                $("body").css("overflow","");
              }
            })
            $(".vip_modal .close").click(function(){
              $(this).parents(".vip_modal").fadeOut();
              $("body").css("overflow","");
            })
  
            
            } else if (json['error']) {
          
         if (json['redirect']) {
            if(json['error']['agree']){
               $('#agree').show().html( json['error']['agree'] );
              }
                
            if(json['error']['firstname']){
               $('#errorfirstname').show().html( json['error']['firstname'] );
              }
            if(json['error']['lastname']){
               $('#errorlastname').show().html( json['error']['lastname'] );
              }
              if(json['error']['email']){
               $('#erroremail').show().html( json['error']['email'] );
              } 
              if(json['error']['password']){
                 // $("#errorpassword").addClass("off");
                 $('#erroremail').show().html( json['error']['password'] );
              }
              if(json['error']['confirm']){
                 $("#errorconfirm").addClass("off");
               $('#errorconfirm').show().html( json['error']['confirm'] );
              }
            } else{
               if(json['error']['warning']){
               $('#erroremail').show().html( json['error']['warning'] );
              }
              //  $(".zzc_li").css("display","none");
              // $("div").removeClass("hidden");
            }   
                
            } 
        },
        error: function(xhr, ajaxOptions, thrownError) {
           alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
</script>
<style type="text/css">
@media (max-width: 920px) {
  .lq-datetimepick{
    margin-left: -2.5rem;
  }
  .datetime-arr{
    left: auto;
    right:0.25rem;
  }
}
  
</style>