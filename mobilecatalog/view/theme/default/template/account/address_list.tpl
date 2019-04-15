<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="address_con order_con clearfix" style="padding: 0.2rem;">
      <div class="or_content address3 clearfix">
        <div class="top_yd clearfix">
          <h1 style="margin: 0; font-weight: normal;"><a class="fh" href="<?php echo  $home?>">< BACK</a> MY ADDRESSES</h1>
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
        
        <div class="address_a"> <a href="<?php echo $add; ?>">Add new address</a></div>
       <?php if($addresses){?> 
        <div class="add_con clearfix" style="margin-top: 0.2rem;padding:0;background:transparent;">
          <ol class="address_ol clearfix">
          <?php foreach ($addresses as $result) { ?>
            <li>
              <div class="p_text">
                <p class="p1"><?php echo $result['firstname']; ?></p>
                <p class="p2">
                  <?php echo $result['address_1']; ?>
                  <br />
                  <?php echo $result['postcode']; ?>  <?php echo $result['country']; ?>
                </p>
                <p class="p3">+<?php echo $result['phone']; ?></p>
                <hr class="mr20" />
                <div class="li_label">
                <?php if($result['isshowdelete']==1){ ?>
                  <i class="ck_i " onclick="javascript:default_address('<?php echo $result['address_id']; ?>');"></i>
                <?php }else{?>
                <i class="ck_i active" onclick="javascript:default_address('<?php echo $result['address_id']; ?>');"></i>
                <?php }?>
                  <p>Set this address as my default address</p>
                  <span class="span1">Edit</span>
                  <span class="span2"></span>
                </div>
              </div>
            
              <div class="form_text clearfix" style="background: #fff;padding: 0.4rem 0.55rem;">
                <form action="<?php echo $action; ?>" method="post">
                <input type="hidden" name="address_id" value="<?php echo $result['address_id']; ?>">

               
                  <label class="clearfix true" for="">
                    <span class="pl_span">Frist Name</span>
                    <input class="in_null" type="text" name="firstname" value="<?php echo $result['firstname']; ?>"  />
                  </label>
                  <label class="clearfix true" for="">
                    <span class="pl_span">Last Name</span>
                    <input class="in_null" type="text" name="lastname" value="<?php echo $result['lastname']; ?>" />
                    <p class="ts_ps">please enter your first name. </p>
                  </label>
                  <label class="clearfix true" for="">
                    <span class="pl_span">Address</span>
                    <input class="in_null" type="text" name="address_1" value="<?php echo $result['address_1']; ?>" />
                    <p class="ts_ps">please enter your first name. </p>
                  </label>
                  <label class="clearfix" for="">
                    <span class="pl_span"></span>
                    <input type="text" name="address_2" value="<?php echo $result['address_2']; ?>" />
                    <p class="ts_ps">please enter your first name. </p>
                  </label>
                  
                  <label class="w_50 fl clearfix" for="">
                    <span class="pl_span">Country</span>
                    <select name="country_id" id="input-shipping-country" class="form-control" data-address_id='<?=$result["address_id"];?>'>
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $result['country_id']) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                    <p class="ts_ps">please enter your first name. </p>
                  </label>
                  <label class="w_50 fr clearfix" for="">
                    <span class="pl_span">State</span>
                    <!-- <?php echo $result['zone_id']; ?> -->
                     <input type="hidden" class="input-shipping-zone" value="<?php echo $result['zone_id']; ?>">
                    <select name="zone_id" id="input-shipping-zone-<?=$result['address_id'];?>" class="form-control">
                  </select>
                  <!-- <input type="hidden" > -->
                    <p class="ts_ps">please enter your first name. </p>
                  </label>
                  
                  <label class="w_50 fl clearfix true" for="">
                    <span class="pl_span">City</span>
                  <input class="in_null" type="text" name="city"  value="<?php echo $result['city']; ?>" />
                    <p class="ts_ps">please enter your first name. </p>
                  </label>
                  
                  <label class="w_50 fr clearfix true" for="">
                    <span class="pl_span">Zip Code</span>
                    <input class="in_null" type="text" name="postcode" value="<?php echo $result['postcode']; ?>" />
                    <p class="ts_ps">please enter your first name. </p>
                  </label>
                  
                  <label class="clearfix clear true" for="">
                    <span class="pl_span">Phone</span>
                    <input class="in_null" type="text" name="phone" value="<?php echo $result['phone']; ?>" />
                    <p class="ts_ps">please enter your first name. </p>
                  </label>
                  
                  <button class="qx_btn" type="reset">Cancel</button>
                  <button class="tj_btn" type="submit">SAVE</button>
                </form>
              </div>
              </li>
              <?php }?>     
          </ol>
          <div class="add_new clearfix">
            <a href="<?php echo $add; ?>">
              <span><i></i> Adds New Address</span>
            </a>
          </div>
        </div>
       <?php }else{?>  
        <div class="add_con clearfix" style="margin-top: 0.2rem;background: transparent;">
          <div class="add_new clearfix">
            <a href="<?php echo $add; ?>">
              <span><i></i> Add New Address</span>
            </a>
          </div>
        </div>
        <?php }?>
      </div>
    </div>

<?php echo $footer; ?>
<script>
function default_address(address_id){
     $.ajax({
     url: 'index.php?route=account/address/edit_default',
     type: 'post',
     data: {address_id:address_id},
     dataType: 'json',     
     success: function(json) {
       location.reload();
      }
   })
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
    
    //勾选
    $(".ck_i").click(function(){
      if($(this).hasClass("active")){
//        $(this).removeClass("active");      
      }else{
        $(".ck_i").removeClass("active");   
        $(this).addClass("active");
      }
    })

    //编辑地址
    $(".span1").click(function(){
      $(this).parents("li").find(".form_text").slideDown();
      $(this).parents("li").find("hr").removeClass("mr20");
      $(this).hide();
      $(this).parents("li").find(".span2").show();
    })
    $(".span2").click(function(){
      $(this).parents("li").find(".form_text").slideUp();
      $(this).parents("li").find("hr").addClass("mr20");
      $(this).hide();
      $(this).parents("li").find(".span1").show();
    })
    
    //验证表单不为空
    $(".in_null").blur(function(){
      if($(this).val()==""){
        $(this).parent().removeClass("true");
        $(this).after("<p class='ts_ps off'>Can't be empty</p>");
      }else{
         $(this).siblings(".ts_ps").hide(); 
         $(this).parent().addClass("true");

      }
    })
  })
</script>
<script type="text/javascript"><!--


$('select[name=\'country_id\']').on('change', function() {
  // var aaa=$(".input-shipping-zone").val();
  //     aaa=603;
  //     console.log(aaa);

  $.ajax({
    url: 'index.php?route=account/account/country&country_id=' + this.value+'&address_id=' + $(this).attr('data-address_id'),
    dataType: 'json',
    beforeSend: function() {
      $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {

      html = '<option value=""><?php echo $text_select; ?></option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == json['zone_id']) { 
            html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }

      $('#input-shipping-zone-'+json['address_id']).html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('select[name=\'country_id\']').trigger('change');
//--></script>