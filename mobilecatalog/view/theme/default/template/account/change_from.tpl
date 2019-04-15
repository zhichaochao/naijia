<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="order_con change_pass clearfix">
      <div class="or_content clearfix">
          <div class="top_yd clearfix">
            <h1><a class="fh" href="<?php echo $home?>">< BACK</a>Change Password</h1>
          </div>
          
        <div class="lf_nav">
          <img class="tx_img" src="catalog/view/theme/default/img/png/touxiang.png" alt="" />
          <h2>My VIP Point:</h2>
          <p class="p1"><?php echo $balance ?></p>
          
          <ul>
          <?php echo $account_left; ?>
          </ul>
          
          <img class="vip_img" src="catalog/view/theme/default/img/vip.jpg" alt="" />
        </div>
        
        <div class="right_text clearfix">
          
          <a class="bt_a" href="<?php echo $home?>">PERSONAL INFORMATION</a>
          
          <div class="form_text clearfix">
            <form method="post" action="<?php echo $actions?>">
              <h2>Change Password</h2>
              <label class="clearfix" for="">
                <input class="email" type="text" value="<?php echo $emails ?>" readonly="readonly" disabled="disabled" />
                <button class="em_btn" type="button" onclick="changepwd()">Click to get verification code</button>
              </label>
             <label class="clearfix" for="">
                <span class="pl_span">Input validation code</span>
                <input class="in_1" id="pass_f" onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="code" placeholder="Input validation code"/>
                <p class="ts_ps">Verification code error</p>
              <?php if ($error_code) { ?>
                <p class="ts_ps off"><?php echo $error_code; ?></p>
                <?php  } ?>
                <?php if($error_yzm) { ?>
                <p class="ts_ps off"><?php echo $error_yzm; ?></p>
                <?php  } ?>
              </label>
              <label class="clearfix" for="">
                <span class="pl_span">New password</span>
                <input class="in_2" type="password" placeholder="New password"  name="password" />
                <p class="ts_ps">Password must be between 4 and 20 characters!</p>
              </label>
              
              <label class="clearfix clear" for="">
                <span class="pl_span">Confirm Password</span>
                <input class="in_3" type="password" placeholder="Confirm Password" name="confirm" />
                <p class="ts_ps">It need to be same as new password!</p>
              </label>
              
              <button class="qx_btn" type="reset">Cancel</button>
              <button class="tj_btn" type="submit"  >Save</button>
            </form>
          </div>
        </div>
      </div>
      
    </div>

<?php echo $footer; ?> 
<script>

    

   function changepwd(){
         var email=$(".email").val();
         $.ajax({   
        url:'<?php echo $action?>',  
        data:{'email':email},
        type:"post",
        success:function(data){
        if (data.successs) {
         tips(data.success,'',500);
          }
        }
      });
     }

</script>

<?php if (isset($success)) { ?>

    <script type="text/javascript">
tips('<?php echo $success; ?>','',500);
</script>

  <?php } ?>


<script type="text/javascript">

  $(function(){

    $("input").focus(function(){
      $(this).attr("placeholder","");
      $(this).siblings(".pl_span").css("display","block");
    })
    $("input").blur(function(){
      
      $(this).attr("placeholder",$(this).siblings(".pl_span").text());
      $(this).siblings(".pl_span").css("display","none");
    })

    //验证表单不为空
    $(".in_1").blur(function(){
      if($(this).val()!="" && $(this).val().length==6){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })
     $(".in_2").blur(function(){
      if($(this).val()!="" && $(this).val().length>=4){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })
     $(".in_3").blur(function(){
      var in_2val = $(".in_2").val();
      if(($(this).val()!="") && ($(this).val().length>=4) && ($(this).val()==in_2val)){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })

     $(".tj_btn").click(function(event){
    
      if(($(".in_1").val().length == 6) && ($(".in_2").val().length >= 4) && ( $(".in_3").val().length >= 4 && $(".in_3").val() == $(".in_2").val()) ){
       
      }else{
        event.preventDefault();
      }
     })

  })
  </script>
