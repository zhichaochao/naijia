<?php echo $header; ?>
<!--内容-->
    <div class="in_content clearfix"></div>
    <div class="forgot clearfix">
      <h1>RESET YOUR PASSWORD</h1>
      <p>
        Enter the password you wish to use
      </p>
      
       <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <label class="clearfix" for="">
          <!-- <input class="pass pass1" type="text" placeholder="Password" /> -->
          <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Password" id="input-password" class="pass pass1" />
         <!--  <p class="ts_ps">please enter your password</p> -->
         <?php if ($error_password) { ?>
                <p class="ts_ps"><?php echo $error_password; ?></p>
              <?php } ?>
              <p class="ts_ps"></p>
        </label>
        <label class="clearfix" for="">
          <!-- <input class="pass pass2" type="text" placeholder="Confirm Password" /> -->
           <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="Confirm Password" id="input-confirm"  class="pass pass2" />
          <!-- <p class="ts_ps">please enter your password</p> -->
          <?php if ($error_confirm) { ?>
                 <p class="ts_ps"><?php echo $error_confirm; ?></p>
              <?php } ?>
              <p class="ts_ps"></p>
        </label>
        <div class="bot clearfix">
          <button class="tj_btn" type="submit">SUBMIT</button>
          <a class="fh_a" href="<?php echo $back; ?>">Cancel</a>
        </div>
      </form>
    </div>  
<style type="text/css">
  .ts_ps{display:none;}
  .ts_ps.off{display: block;}
</style>
    <script>
    $(function(){
$(".pass").change(function(){
      var text=$(this).val();
      if(text.length<6 && text !=""){
        $(this).siblings(".ts_ps").addClass("off");
        $(this).siblings(".ts_ps").text("The password must be longer than 6 letters");
      }else{
        $(this).siblings(".ts_ps").removeClass("off");
      }
    })
    $(".pass2").change(function(){
      var text=$(this).val();
      var pass_val = $(".pass1").val();
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
    })
    </script>
<?php echo $footer; ?>