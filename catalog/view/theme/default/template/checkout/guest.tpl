<?php echo $header; ?>
  <div class="in_content clearfix"></div>
    <!--内容-->
    <div class="address_con clearfix" id='collapse-payment-address'>
      <div class="add_con clearfix">
                  <form method="post" action="<?=$action?>">  
        <ul class="bt_ul clearfix">

          <li class="active">
            <h1>Create an account, track your order after pay.</h1>
            <div class="form_text clearfix">
    
                <label class="clearfix" for="">
                  <span class="pl_span">E-mail</span>
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-payment-email"  />
                  <p class="ts_ps ">please enter your E-mail. </p>
                </label>
                <label class="clearfix" for="">
                  <span class="pl_span">Password</span>
                  <input type="password" placeholder="Password" />
                  <p class="ts_ps">please enter your Password. </p>
                </label>
                <label class="clearfix" for="">
                  <span class="pl_span">Confirm Password </span>
                  <input type="password" placeholder="Confirm Password " />
                  <p class="ts_ps">please enter your Password. </p>
                </label>
                <p class="yk_p">already have an account? <a href="###">Log in</a></p>
             
            </div>
          </li>
          <li class="active">
            <h1>Shipping Address</h1>
            <div class="form_text clearfix">
             
              <!--label的class  true是输入正确的一种显示格式-->
                <label class="clearfix " for="">
                  <span class="pl_span">Frist Name</span>
                  <input type="text"  name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" />
                  <p class="ts_ps">please enter your first name. </p>
                </label>
                <label class="clearfix" for="">
                  <span class="pl_span">Last Name</span>
                  <input type="text"  name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" />
                  <p class="ts_ps ">please enter your last name. </p>
                </label>
                <label class="clearfix" for="">
                  <span class="pl_span">Address</span>
                  <input type="text"  name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" />
                  <p class="ts_ps">please enter your address. </p>
                </label>
                <label class="clearfix" for="">
                  <span class="pl_span"></span>
                  <input type="text"  name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-payment-address-2"  />
                  <p class="ts_ps">please enter your first name. </p>
                </label>
                
                <label class="w_50 fl clearfix" for="">
                  <span class="pl_span">Country</span>
                 <select name="country_id" id="input-payment-country" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $country_id) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                  <p class="ts_ps">please enter your Country. </p>
                </label>
                <label class="w_50 fr clearfix" for="">
                  <span class="pl_span">State</span>
                    <select name="zone_id" id="input-payment-zone" class="form-control">
                    </select>
                  <p class="ts_ps">please enter your State </p>
                </label>
                
                <label class="w_50 fl clearfix" for="input-payment-city">
                  <span class="pl_span">City</span>
                  <input type="text"  name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" />
                  <p class="ts_ps">please enter your city. </p>
                </label>
                
                <label class="w_50 fr clearfix" for="">
                  <span class="pl_span">Zip Code</span>
                  <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode"  />
                  <p class="ts_ps">please enter your first name. </p>
                </label>
                
                <label class="clearfix clear" for="">
                  <span class="pl_span">Phone</span>
                  <input type="text" name="telephone" value="<?php echo $telephone ?>" placeholder="Phone" id="input-payment-telephone" />
                  <p class="ts_ps">please enter your phone . </p>
                </label>
                
                <input type="hidden" name="shipping_address" value="1" checked="checked" />
 
                <button class="qx_btn" type="reset">Cancel</button>
                <button class="tj_btn" id="button-payment-guest" type="button">Save & Continue</button>
              </form>
            </div>
            
          </li>
     
 
       
         
          
   
      
          
          <li class="active pc_no">
            
            <div class="form_text">
                    <div class="check_order  clearfix "  >
                            <h1 class="slide_h1">Order Details <em></em></h1>
                            <div class="slides clear clearfix">
                             <?php foreach ($products as $product) { ?>
                                <p><?=$product['name'];?> <span class="num">x<?=$product['quantity'];?></span></p>
                              <?php } ?>
                                <hr />
                                  <?php foreach ($totals as $key=> $total) { if($key=='total'){?>

                                <p class="p2"><?=$total['title'];?>: <span><?=$total['text'];?></span></p>
                                      <?php }} ?>
                            </div>
                            <div class="slide clear clearfix">
                                <div class="total clearfix">
                                      <?php foreach ($totals as $key=> $total) { if($key=='total'){?>

                                <p class="p2"><?=$total['title'];?>: <span><?=$total['text'];?></span></p>
                                      <?php }else{?>


                                <p class="p1"><?=$total['title'];?>: <span><?=$total['text'];?></span></p>

                                <?php  }} ?>
                                   
                                </div>
                                <ul class="check_ul clearfix">
                                       <?php foreach ($products as $product) { ?>
                                    <li class="clearfix">
                                        <div class="pic_img"><img src="<?=$product['image'];?>"/></div>
                                        <div class="text">
                                            <h2><?=$product['name'];?></h2>
                                            <?php if($product['option']['selects']){?>
                                             <?php foreach ($product['option']['selects'] as $option) { ?>
                                            <p><?=$option['option_name'];?>: <?=$option['option_value_name'];?></p>
                                              <?php  }} ?>

                                        
                                            <p>Quantity:  <?=$product['quantity'];?></p>
                                            <p>Color:  <?=$product['color'];?></p>
                                            <span> <?=$product['price'];?></span>
                                        </div>
                                    </li>
                                     <?php  } ?>
                                </ul>
                            </div>
                            <div class="a_btn">
                                <a onclick="pay();"  class="a_qd_btn">Continue to pay</a>
                            </div>
                        </div>
            </div>
          </li>
        </ul>
      
         </form>
                <div class="fixed clearfix">
                    <div class="fixed_text clearfix">
                        <div class="in_content clearfix"></div>
                        <div class="check_order yd_no clearfix confirm"  >
                            <h1 class="slide_h1">Order Details <em></em></h1>
                            <div class="slides clear clearfix">
                             <?php foreach ($products as $product) { ?>
                                <p><?=$product['name'];?> <span class="num">x<?=$product['quantity'];?></span></p>
                              <?php } ?>
                                <hr />
                                  <?php foreach ($totals as $key=> $total) { if($key=='total'){?>

                                <p class="p2"><?=$total['title'];?>: <span><?=$total['text'];?></span></p>
                                      <?php }} ?>
                            </div>
                            <div class="slide clear clearfix">
                                <div class="total clearfix">
                                      <?php foreach ($totals as $key=> $total) { if($key=='total'){?>

                                <p class="p2"><?=$total['title'];?>: <span><?=$total['text'];?></span></p>
                                      <?php }else{?>


                                <p class="p1"><?=$total['title'];?>: <span><?=$total['text'];?></span></p>

                                <?php  }} ?>
                                   
                                </div>
                                <ul class="check_ul clearfix">
                                       <?php foreach ($products as $product) { ?>
                                    <li class="clearfix">
                                        <div class="pic_img"><img src="<?=$product['image'];?>"/></div>
                                        <div class="text">
                                            <h2><?=$product['name'];?></h2>
                                            <?php if($product['option']['selects']){?>
                                             <?php foreach ($product['option']['selects'] as $option) { ?>
                                            <p><?=$option['option_name'];?>: <?=$option['option_value_name'];?></p>
                                              <?php  }} ?>

                                        
                                            <p>Quantity:  <?=$product['quantity'];?></p>
                                            <p>Color:  <?=$product['color'];?></p>
                                            <span> <?=$product['price'];?></span>
                                        </div>
                                    </li>
                                     <?php  } ?>
                                </ul>
                            </div>
                            <div class="a_btn">
                                <!-- <a onclick="pay();"  class="a_qd_btn">Continue to pay</a> -->
                            </div>
                        </div>
                    
                    </div>
                </div>
      
      </div>
    </div>


<script type="text/javascript"><!--

    $(document).delegate('#button-payment-guest', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/guest/save',
        type: 'post',
        data: $('#collapse-payment-address input[type=\'hidden\'],#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
        dataType: 'json',
      
        success: function(json) {
            // console.log(json);
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                for (i in json['error']) {
                    var element = $('#input-payment-' + i.replace('_', '-'));
                        $(element).siblings('.ts_ps').show();
                }
             
            } else{
                get_address_jump();
            }
        }
    })
})

$('#collapse-payment-address select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#collapse-payment-address select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#collapse-payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#collapse-payment-address select[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>