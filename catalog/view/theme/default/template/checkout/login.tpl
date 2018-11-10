<?php echo $header; ?>

  
<!--内容-->
    <div class="in_content clearfix"></div>
    <div class="login yk_login">
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
            <input type="hidden" name="redirect" value='<?=$checkout;?>'/>
          </form>
        </div>

      </div>
      
    </div>
<style type="text/css">
  .ts_ps{display:none;}
  .ts_ps.off{display: block;}
</style>
<script>

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