<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="order_con clearfix">
      <div class="or_content clearfix">
          <div class="top_yd clearfix">
            <h1><a class="fh" href="<?php echo $home?>">< BACK</a>Change Password</h1>
          </div>
          
        <div class="lf_nav">
          <img class="tx_img" src="catalog/view/theme/default/img/png/touxiang.png" alt="" />
          <h2><?php echo $firstname ?></h2>
          <p class="p1">+<?php echo $telephone ?></p>
          
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
                <input class="email" type="text" value="<?php echo $email ?>" readonly="readonly" disabled="disabled" />
                <button class="em_btn" type="button" onclick="changepwd()">Send CodeTo My Emeil </button>
              </label>
             <label class="clearfix" for="">
                <span class="pl_span">Input validation code</span>
                <input id="pass_f" onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="code" />
              <?php if ($error_code) { ?>
                <p class="ts_ps off"><?php echo $error_code; ?></p>
                <?  } ?>
              </label>
              <label class="clearfix" for="">
                <span class="pl_span">New password</span>
                <input type="password" placeholder="New password"  name="password" />
                <?php if ($error_password) { ?>
                <p class="ts_ps off"><?php echo $error_password; ?></p>
                <?  } ?>
              </label>
              
              <label class="clearfix clear" for="">
                <span class="pl_span">Confirm Password</span>
                <input type="password" placeholder="Confirm Password" name="confirm" />
                  <?php if ($error_confirm) { ?>
                <p class="ts_ps off"><?php echo $error_confirm; ?></p>
                <?  } ?>
              </label>
              
              <button class="qx_btn" type="reset">Cancel</button>
              <button class="tj_btn" type="submit">Save</button>
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
         alert(data.success);
          }
        }
      });
     }

</script>

<?php if ($success) { ?>

    <script type="text/javascript">
alert('<?php echo $success; ?>');
</script>

  <?php } ?>