 <?php if($pick=='shipping'){ ?>

 <link rel="stylesheet" href="/catalog/view/theme/default/js/select2/css/select2.css" />
        <script type="text/javascript" src="/catalog/view/theme/default/js/select2/js/select2.js" ></script>

  <?php if ($addresses&&!isset($address)) { ?>

          <li class="active" id="payment-existing">
              <input type="hidden" name="address_id" id='address_id' value="<?=$address_id;?>">
                <input type="hidden" id="payment_address" name="payment_address" value="existing" />
                        <h1>Delivery Address</h1>
                        <div class="form_text clearfix">
                            <ol class="add_ol clearfix">
                                <?php foreach ($addresses as $add) { ?>
    

                                  <li data='<?php echo $add['address_id']; ?>' class=" <?php if ($add['address_id'] == $address_id) { ?>active <?php } ?>  clearfix">
                                    <div class="li_label">
                                        <i class="ck_i"></i>
                                    </div>
                                    <div class="text">
                                     <span> <?php echo $add['firstname']; ?>  <?php echo $add['lastname']; ?> </span> 
                             
                                       <span><?php echo $add['address_1']; ?> <?php echo $add['address_2']; ?>  </span> 
                                      <span>  <?php echo $add['city']; ?>  </span> 
                                        <span> <?php echo $add['zone']; ?>  </span> 

                                         <span> <?php echo $add['country']; ?>  </span> 

                                         <span> <?php echo $add['phone']; ?>  </span> 

                                      
                                    </div>
                                    <span class="edit" onclick="get_address(<?php echo $add['address_id']; ?>);">Edit</span>
                                    <div class="det" onclick="deleteaddress(<?php echo $add['address_id']; ?>);"></div>
                                </li>
      <?php } ?>

                              
                        
                            </ol>
                            <button onclick="add_new();" type="button" class="qx_btn">Add new address</button>
                            <button class="tj_btn" type="button" onclick="save_address();">Save & Continue</button>
                        </div>
                    </li>





  <?php } ?>



  <?php if (isset($address)) { ?>

    <li class="active"  id="payment-new" >
                        <h1>Delivery Address</h1>
                        <div class="form_text clearfix">
                            <form  id="payment-new-address">
                                <label class="clearfix" for="input-payment-firstname">
                                    <span class="pl_span">Frist Name</span>
                                    <input type="text" name="firstname" value="<?=$address['firstname'];?>" id="input-payment-firstname"  placeholder="Frist Name" />
                                    <p class="ts_ps ">please enter your first name. </p>
                                </label>
                                <label class="clearfix" for="input-payment-lastname">
                                    <span class="pl_span">Last Name</span>
                                    <input type="text" name="lastname" value="<?=$address['lastname'];?>"  id="input-payment-lastname" placeholder="Last Name" />
                                    <p class="ts_ps">please enter your Last name. </p>
                                </label>
                                <label class="clearfix" for="input-payment-address-1">
                                    <span class="pl_span">Address</span>
                                    <input type="text"   name="address_1" value="<?=$address['address_1'];?>" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" />
                                    <p class="ts_ps">please enter your <?php echo $entry_address_1; ?>. </p>
                                </label>
                                <label class="clearfix" for="input-payment-address-2">
                                    <span class="pl_span"></span>
                                    <input type="text"   name="address_2" value="<?=$address['address_2'];?>" placeholder="<?php echo $entry_address_2; ?>" id="input-payment-address-2" />
                                    <p class="ts_ps">please enter your <?php echo $entry_address_2; ?>. </p>
                                </label>
                                
                                <label class="w_50 fl clearfix" for="input-payment-country">
                                    <span class="pl_span">Country</span>
                                    <select name="country_id" id="input-payment-country">
                                       <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($countries as $country) { ?>
                                        <?php if ($country['country_id'] == $address['country_id']) { ?>
                                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                    <p class="ts_ps">please enter your Country . </p>
                                </label>
                                <label class="w_50 fr clearfix" for="input-payment-zone">
                                    <span class="pl_span">State</span>
                                    <select name="zone_id" id="input-payment-zone">
                                        
                                    </select>
                                    <p class="ts_ps">please enter your State. </p>
                                </label>
                                
                                <label class="w_50 fl clearfix" for="input-payment-city">
                                    <span class="pl_span">City</span>
                                    <input type="text" name="city" value="<?=$address['city'];?>" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" />
                                    <p class="ts_ps">please enter your city. </p>
                                </label>
                                
                                <label class="w_50 fr clearfix" for="input-payment-postcode">
                                    <span class="pl_span">Post Code</span>
                                    <input type="text" name="postcode" value="<?=$address['postcode'];?>" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" />
                                    <p class="ts_ps">please enter your Post Code. </p>
                                </label>
                                
                                <label class="clearfix clear" for="input-payment-phone">
                                    <span class="pl_span">Phone</span>
                                    <input type="text"  name="phone" value="<?=$address['phone'];?>" placeholder="Phone" id="input-payment-phone"/>
                                    <p class="ts_ps">please enter your Phone. </p>
                                </label>
                                   <label class="clearfix clear" for="input-payment-email">
                                    <span class="pl_span">Email</span>
                                    <input type="text"  name="email" value="<?=$address['email'];?>" placeholder="Email" id="input-payment-email"/>
                                    <p class="ts_ps">please enter your Email. </p>
                                </label>
                                <input  type="hidden" value="" name="company" />
                                <input  type="hidden" value="<?=$address['address_id'];?>" name="address_id" />
                                <button class="qx_btn" onclick="get_address();" type="reset">Cancel</button>
                                <button class="tj_btn" type="button" id="button-payment-address">Save & Continue</button>
                            </form>
                        </div>
                        
                    </li>

  <?php }else{ ?>
     <li class="active"  id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
                        <h1>Delivery Address</h1>
                        <div class="form_text clearfix">
                            <form  id="payment-new-address">
                                <label class="clearfix" for="input-payment-firstname">
                                    <span class="pl_span">Frist Name</span>
                                    <input type="text" name="firstname" value="" id="input-payment-firstname"  placeholder="Frist Name" />
                                    <p class="ts_ps ">please enter your first name. </p>
                                </label>
                                <label class="clearfix" for="input-payment-lastname">
                                    <span class="pl_span">Last Name</span>
                                    <input type="text" name="lastname" value=""  id="input-payment-lastname" placeholder="Last Name" />
                                    <p class="ts_ps">please enter your Last name. </p>
                                </label>
                                <label class="clearfix" for="input-payment-address-1">
                                    <span class="pl_span">Address</span>
                                    <input type="text"   name="address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" />
                                    <p class="ts_ps">please enter your <?php echo $entry_address_1; ?>. </p>
                                </label>
                                <label class="clearfix" for="input-payment-address-2">
                                    <span class="pl_span"></span>
                                    <input type="text"   name="address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-payment-address-2" />
                                    <p class="ts_ps">please enter your <?php echo $entry_address_2; ?>. </p>
                                </label>
                                
                                <label class="w_50 fl clearfix" for="input-payment-country">
                                    <span class="pl_span">Country</span>
                                    <select name="country_id" id="input-payment-country">
                                       <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($countries as $country) { ?>
                                        <?php if ($country['country_id'] == $country_id) { ?>
                                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                    <p class="ts_ps">please enter your Country . </p>
                                </label>
                                <label class="w_50 fr clearfix" for="input-payment-zone">
                                    <span class="pl_span">State</span>
                                    <select name="zone_id" id="input-payment-zone">
                                        
                                    </select>
                                    <p class="ts_ps">please enter your State. </p>
                                </label>
                                
                                <label class="w_50 fl clearfix" for="input-payment-city">
                                    <span class="pl_span">City</span>
                                    <input type="text" name="city" value="" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" />
                                    <p class="ts_ps">please enter your city. </p>
                                </label>
                                
                                <label class="w_50 fr clearfix" for="input-payment-postcode">
                                    <span class="pl_span">Post Code</span>
                                    <input type="text" name="postcode" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" />
                                    <p class="ts_ps">please enter your Post Code. </p>
                                </label>
                                
                                <label class="clearfix clear" for="input-payment-phone">
                                    <span class="pl_span">Phone</span>
                                    <input type="text"  name="phone" value="" placeholder="Phone" id="input-payment-phone"/>
                                    <p class="ts_ps">please enter your Phone. </p>
                                </label>
                                <label class="clearfix clear" for="input-payment-email">
                                    <span class="pl_span">Email</span>
                                    <input type="text"  name="email" value="" placeholder="Email" id="input-payment-email"/>
                                    <p class="ts_ps">please enter your Email. </p>
                                </label>
                                <input  type="hidden" value="" name="company" />
                                <button class="qx_btn" onclick="get_address();" type="reset">Cancel</button>
                                <button class="tj_btn" type="button" id="button-payment-address">Save & Continue</button>
                            </form>
                        </div>
                        
                    </li>

 <?php } ?>


<script type="text/javascript"><!--

function add_new() {
      $('#payment-existing').hide();
    $('#payment-new').show();
    $('#payment_address').val('new');
      $('#address_id').val('');
}
//--></script>


<script type="text/javascript"><!--
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
$(document).ready(function(){
  $("#input-payment-country").select2();
  $("#input-payment-zone").select2();
});
$(function(){
        $("input").focus(function(){
            $(this).attr("placeholder","");
            $(this).siblings(".pl_span").css("display","block");
            $(this).siblings(".ts_ps").css("display","none");
        })
        $("input").blur(function(){
            
            $(this).attr("placeholder",$(this).siblings(".pl_span").text());
            $(this).siblings(".pl_span").css("display","none");
        })
        
//      地址选择
        $(".add_ol>li .li_label").click(function(){
            $(this).parent().addClass("active").siblings("li").removeClass("active");
            $('#address_id').val($(this).parent().attr('data'));
        })
        //删除地址
        $(".add_ol .det").click(function(){
            $(this).parent().remove();
        })
  })

//--></script>

<?php }else{ ?>

  <?php if ($addresses&&!isset($address)) { ?>

          <li class="active" id="payment-existing">
              <input type="hidden" name="address_id" id='address_id' value="<?=$address_id;?>">
                <input type="hidden" id="payment_address" name="payment_address" value="existing" />
                        <h1> Contacts</h1>
                        <div class="form_text clearfix">
                            <ol class="add_ol clearfix">
                                <?php foreach ($addresses as $add) { ?>

    

                                  <li data='<?php echo $add['address_id']; ?>' class=" <?php if ($add['address_id'] == $address_id) { ?>active <?php } ?>  clearfix">
                                    <div class="li_label">
                                        <i class="ck_i"></i>
                                    </div>
                                    <div class="text">
                                     <span> <?php echo $add['firstname']; ?>   </span> 
                                     <span> <?php echo $add['lastname']; ?>  </span> 



                                         <span> <?php echo $add['email']; ?>  </span> 
                                         <span> <?php echo $add['phone']; ?>  </span> 

                                      
                                    </div>
                                    <span class="edit" onclick="get_address(<?php echo $add['address_id']; ?>);">Edit</span>
                                    <div class="det" onclick="deleteaddress(<?php echo $add['address_id']; ?>);"></div>
                                </li>
      <?php } ?>

                              
                        
                            </ol>
                            <button onclick="add_new();" type="button" class="qx_btn">Add new Contacts</button>
                            <button class="tj_btn" type="button" onclick="save_address();">Save & Continue</button>
                        </div>
                    </li>





  <?php } ?>



  <?php if (isset($address)) { ?>

    <li class="active"  id="payment-new" >
                        <h1>Contacts</h1>
                        <div class="form_text clearfix">
                            <form  id="payment-new-address">
                                <label class="clearfix" for="input-payment-firstname">
                                    <span class="pl_span">Frist Name</span>
                                    <input type="text" name="firstname" value="<?=$address['firstname'];?>" id="input-payment-firstname"  placeholder="Frist Name" />
                                    <p class="ts_ps ">please enter your first name. </p>
                                </label>
                                <label class="clearfix" for="input-payment-lastname">
                                    <span class="pl_span">Last Name</span>
                                    <input type="text" name="lastname" value="<?=$address['lastname'];?>"  id="input-payment-lastname" placeholder="Last Name" />
                                    <p class="ts_ps">please enter your Last name. </p>
                                </label>
                         
                                <label class="clearfix clear" for="input-payment-phone">
                                    <span class="pl_span">Phone</span>
                                    <input type="text"  name="phone" value="<?=$address['phone'];?>" placeholder="Phone" id="input-payment-phone"/>
                                    <p class="ts_ps">please enter your Phone. </p>
                                </label>
                                <label class="clearfix clear" for="input-payment-email">
                                    <span class="pl_span">Email</span>
                                    <input type="text"  name="email" value="<?=$address['email'];?>" placeholder="Email" id="input-payment-phone"/>
                                    <p class="ts_ps">please enter your email. </p>
                                </label>
                                  <input type="hidden" name="address_1" value="30 Mobolaji Bank Anthony Way, Maryland 000012, Lagos, Nigeria"/>
                                <input type="hidden" name="address_2" value="Pick Up"/>
                                  <input type="hidden" name="city" value="<?=$address['city']?$address['city']:'Pick Up';?>"/>
                                    <input type="hidden" name="postcode" value="<?=$address['postcode']?$address['postcode']:'Pick Up';?>"/>
                                    <input type="hidden" name="country_id" value="156"/>
                                    <input type="hidden" name="zone_id" value="2412"/>
                                <input  type="hidden" value="" name="company" />
                                <input  type="hidden" value="<?=$address['address_id'];?>" name="address_id" />
                                <button class="qx_btn" onclick="get_address();" type="reset">Cancel</button>
                                <button class="tj_btn" type="button" id="button-payment-address">Save & Continue</button>
                            </form>
                        </div>
                        
                    </li>

  <?php }else{ ?>
     <li class="active"  id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
                        <h1>Contacts</h1>
                        <div class="form_text clearfix">
                            <form  id="payment-new-address">
                                <label class="clearfix" for="input-payment-firstname">
                                    <span class="pl_span">Frist Name</span>
                                    <input type="text" name="firstname" value="" id="input-payment-firstname"  placeholder="Frist Name" />
                                    <p class="ts_ps ">please enter your first name. </p>
                                </label>
                           
                               <label class="clearfix" for="input-payment-lastname">
                                    <span class="pl_span">Last Name</span>
                                    <input type="text" name="lastname" value=""  id="input-payment-lastname" placeholder="Last Name" />
                                    <p class="ts_ps">please enter your Last name. </p>
                                </label>
                         
                                
                          
                                
                                <label class="clearfix clear" for="input-payment-phone">
                                    <span class="pl_span">Phone</span>
                                    <input type="text"  name="phone" value="" placeholder="Phone" id="input-payment-phone"/>
                                    <p class="ts_ps">please enter your Phone. </p>
                                </label>
                                <label class="clearfix clear" for="input-payment-email">
                                    <span class="pl_span">Email</span>
                                    <input type="text"  name="email" value="" placeholder="Email" id="input-payment-email"/>
                                    <p class="ts_ps">please enter your Email. </p>
                                </label>
                                <input type="hidden" name="address_1" value="30 Mobolaji Bank Anthony Way, Maryland 000012, Lagos, Nigeria"/>
                                <input type="hidden" name="address_2" value="Pick Up"/>
                                  <input type="hidden" name="city" value="Pick Up"/>
                                    <input type="hidden" name="postcode" value="Pick Up"/>
                                    <input type="hidden" name="country_id" value="156"/>
                                    <input type="hidden" name="zone_id" value="2412"/>
                                <input  type="hidden" value="" name="company" />
                                <button class="qx_btn" onclick="get_address();" type="reset">Cancel</button>
                                <button class="tj_btn" type="button" id="button-payment-address">Save & Continue</button>
                            </form>
                        </div>
                        
                    </li>

 <?php } ?>


<script type="text/javascript"><!--

function add_new() {
      $('#payment-existing').hide();
    $('#payment-new').show();
    $('#payment_address').val('new');
    $('#address_id').val('');
}
$(function(){
        $("input").focus(function(){
            $(this).attr("placeholder","");
            $(this).siblings(".pl_span").css("display","block");
            $(this).siblings(".ts_ps").css("display","none");
        })
        $("input").blur(function(){
            
            $(this).attr("placeholder",$(this).siblings(".pl_span").text());
            $(this).siblings(".pl_span").css("display","none");
        })
        
//      地址选择
        $(".add_ol>li .li_label").click(function(){
            $(this).parent().addClass("active").siblings("li").removeClass("active");
            $('#address_id').val($(this).parent().attr('data'));
        })
        //删除地址
        $(".add_ol .det").click(function(){
            $(this).parent().remove();
        })
  })

//--></script>


<?php } ?>