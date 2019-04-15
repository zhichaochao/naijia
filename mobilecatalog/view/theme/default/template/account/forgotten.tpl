<?php echo $header; ?>
<!--内容-->
    <div class="in_content clearfix"></div>
    <div class="forgot clearfix">
      <h1>FORGOT YOUR PASSWORD?</h1>
      <p>
        Enter the email address you use for My Account and you will 
        receive an email containing a link to change your password.
      </p>
      
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <label class="clearfix" for="">
           <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="email email1" />
          <?php if ($error_warning) { ?>
                <p class="ts_ps" ></i> <?php echo $error_warning; ?></p>
                <?php } ?>
                <p class="ts_ps" ></i></p>
        </label>
        <div class="bot clearfix">
          <button class="tj_btn" type="submit">SUBMIT</button>
          <a class="fh_a" href="<?php echo $back; ?>">Cancel</a>
        </div>
      </form>
    </div>  
</div>
<style type="text/css">
  .ts_ps.off{display: block;}
</style>
<script>
$(function(){
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
})
</script>
<?php echo $footer; ?>