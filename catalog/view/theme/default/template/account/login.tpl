<?php echo $header; ?>
<!--内容-->
    <div class="in_content clearfix"></div>
    <div class="login">
      <!--pc-->
      <div class="pc_div clearfix">
        <div class="left dl">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="login_form lr_form">
            <div class="text clearfix">
              <h1>WELCOME BACK</h1>
              <label class="clearfix" for="">
                <input type="text" class="email email1" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" />
                <p class="ts_ps"    <?php if ($error_warning) { ?>  style='display:block;' <?php } ?>><?php if ($error_warning) { ?><?php echo $error_warning; ?><?php }else{ ?>The email address you entered is incorrect<?php } ?></p>
              </label>
              <label class="clearfix" for="">
                <input type="password" class="pass pass1" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password"/>
                <p class="ts_ps">Please enter your first name</p>
              </label>
              <a class="wjmm_a" href="<?=$forgotten;?>">Forgot your password?</a>
              
              <button class="dl_btn btn" type="submit">LOGIN</button>
              <p class="dl_p">Don't have account ?<a href="javascript:;"> SIGN UP</a></p>
            </div>
            <input type="hidden" name="redirect" value='<?=$redirect;?>'/>
          </form>
        </div>
        <div class="right zc" id="register-form-div">
            <div class="text clearfix res_form">
              <h1>CREATE AN ACOUNT</h1>
              <label class="clearfix" for="">
                <input type="text" name="firstname" maxlength="32" value="" placeholder="Frist Name" id="input-firstname" class="name name1">
                  <p class="ts_ps" id="errorfirstname">Please enter your first name</p>
              </label>
              <label class="clearfix" for="">
                <input type="text" name="lastname" maxlength="32" value="" placeholder="Last Name" id="input-lastname" class="name name2">
                  <p class="ts_ps" id="errorlastname">Please enter your last name</p>
              </label>
              <label class="clearfix" for="">
                <input type="text" name="email" value="" placeholder="E-Mail Address" id="input-email" class="email email2">
                  <p class="ts_ps" id="erroremail">Please enter your email address</p>
              </label>
              <label class="clearfix" for="" >
                <input type="password" name="password" value="" placeholder="Password" id="input-password" class="pass pass2">
                  <p class="ts_ps" id="errorpassword">Please enter your password</p>
              </label>
              <label class="clearfix" for="">
                <input class="pass pass3" type="password" name="confirm" id="input-confirm" placeholder="Confirm Password"/>
                  <p class="ts_ps" id="errorconfirm">Please confirm the password</p>
              </label>
              
              <div class="xy_div">
               <input id="agree" type="checkbox" name="agree" value="1" checked="checked"/>
                <span class="span1"></span>
                <span class="span2"></span>
                <p>I agree to Naija beauty hair <a href="###">Terms and Conditions</a></p>
              </div>
              <!-- <p class="xy_p">*required field</p> -->
              <button class="zc_btn btn" type="submit" id="button-register">SIGN UP</button>
              <p class="dl_p">Already have an account?<a href="javascript:;">Login</a></p>
            </div>
          <!-- </form> -->
        </div>
      </div>
      
    </div>
<style type="text/css">
  .ts_ps{display:none;}
  .ts_ps.off{display: block;}
</style>
<script>
// Register
$(document).delegate('#button-register', 'click', function() {
  // console.log($('#register-form-div input'));
    // $(".zzc_li").css("display","block");
    //  $("div").addClass("hidden");
      $.ajax({
        url: '<?php echo $register;?>',
        type: 'post',
        data: $('#register-form-div input'),
        dataType: 'json',
      
        success: function(json) {
          if (json['redirect']) {
            location = json['redirect']; 
            
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
               $('#errorpassword').show().html( json['error']['password'] );
              }
              if(json['error']['confirm']){
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
$(function(){
    $(".email").focus(function(){
      $(this).attr("placeholder","E-Mail Address");
    })
    $(".email").blur(function(){
      $(this).attr("placeholder","E-Mail Address");
    })
    $(".pass2").focus(function(){
      $(this).attr("placeholder","Password");
    })
    $(".pass2").blur(function(){
      $(this).attr("placeholder","Password");
    })
    
    $(".name").change(function(){
      var text=$(this).val();
      var re=/^[a-zA-Z]+$/;
      if(!re.test(text) && text !=""){
        $(this).siblings(".ts_ps").addClass("off");
        $(this).siblings(".ts_ps").text("Please fill in in English");
      }else{
        $(this).siblings(".ts_ps").removeClass("off");
      }
    })
    $(".email").change(function(){
      var text=$(this).val();
      var re=/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
      if(!re.test(text) && text !=""){
        $(this).siblings(".ts_ps").addClass("off");
        $(this).siblings(".ts_ps").text("The email address you entered is incorrect");
      }else{
        $(this).siblings(".ts_ps").removeClass("off");
      }
    })
    $(".pass").change(function(){
      var text=$(this).val();
      if(text.length<6 && text !=""){
        $(this).siblings(".ts_ps").addClass("off");
        $(this).siblings(".ts_ps").text("The password must be longer than 6 letters");
      }else{
        $(this).siblings(".ts_ps").removeClass("off");
      }
    })
    $(".pass3").change(function(){
      var text=$(this).val();
      var pass_val = $(".pass2").val();
      // console.log( $(".pass2").val());
      // console.log( $(".pass3").val());
      if(text.length<6 && text !=""){
        $(this).siblings(".ts_ps").addClass("off");
        $(this).siblings(".ts_ps").text("The password must be longer than 6 letters");
      }else if(text!=pass_val){
        $(this).siblings(".ts_ps").addClass("off");
        $(this).siblings(".ts_ps").text("The passwords you entered are not consistent. Please re-enter them");
      }else{
        $(this).siblings(".ts_ps").removeClass("off");
      }
    })
    
    //注册提交
    $(".res_form .zc_btn").click(function(){
      var name1 = $(".name1").val();
      var name2 = $(".name2").val();
      var email2 = $(".email2").val();
      var pass2 = $(".pass2").val();
      var pass3 = $(".pass3").val();
      var bool = 0;
      
      $(".res_form .ts_ps").each(function(){
        if($(this).hasClass("off")){
          bool=1;
          return bool;
        }
      })
      if(bool == 1){
        return false;
      }else{
        if((name1 !="")&&(name2 !="")&&(email2 !="")&&(pass2 !="")&&(pass3 !="")&&($(".xy_div input").hasClass("off"))){
          //正确
        }else{
          alert("Please perfect all")
          return false;
        }
      }
    })
    
    //登陆提交
    $(".login_form .dl_btn").click(function(){
      var email1 = $(".email1").val();
      var pass1 = $(".pass1").val();
      var bool = 0;
      
      $(".login_form .ts_ps").each(function(){
        if($(this).hasClass("off")){
          bool=1;
          return bool;
        }
      })
      
      if(bool == 1){
        return false;
      }else{
        if((email1 !="")&&(pass1 !="")){
          //正确
        }else{
          alert("Please perfect all")
          return false;
        }
      }
    })
    
  })
$(function(){
    // $(".xy_div input").click(function(){
    //  if($(this).parent().hasClass("off")){
    //    $(this).parent().removeClass("off");
        
    //  }else{
    //    $(this).parent().addClass("off");
    //  }
    // })
    
    $(".dl .dl_p a").click(function(){
      $(".dl").css("display","none");
      $(".zc").fadeIn();
    })
    $(".zc .dl_p a").click(function(){
      $(".dl").fadeIn();
      $(".zc").css("display","none");
    })
  })
</script>

<?php echo $footer; ?>

