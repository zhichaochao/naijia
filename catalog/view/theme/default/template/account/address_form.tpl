<?php echo $header; ?>

<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="address_con order_con clearfix" style="padding: 0.2rem 0.15rem;">
      <div class="or_content clearfix">
        <div class="top_yd clearfix">
         <h1 style="margin: 0; font-weight: normal;height: 0.6rem;"><a class="fh" href="<?php echo  $home?>">< BACK</a> </h1>
        </div>
      
        <div class="lf_nav">
          <img class="tx_img" src="catalog/view/theme/default/img/png/touxiang.png" alt="" />
          <h2><?php echo $firstnames ?></h2>
          <p class="p1"><?php echo $telephone ?></p>
          
          <ul>
          <?php echo $account_left; ?>
          </ul>
          
          <img class="vip_img" src="catalog/view/theme/default/img/vip.jpg" alt="" />
        </div>
        
        <div class="address_a"> <a href="<?php echo $add; ?>">Add new address</a></div>
        
        <div class="add_con clearfix" style="margin-top: 0.2rem">
          <div class="form_text clearfix">
            <form action="<?php echo $action; ?>" method="post" >
              <label class="clearfix " for="">
                <span class="pl_span">Frist Name</span>
                <input class="in_1" type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                <?php if ($error_firstname) { ?>
                <p class="ts_ps off"><?php echo $error_firstname; ?></p>
              <?php } ?>
                
              </label>
              <label class="clearfix" for="">
                <span class="pl_span">Last Name</span>
                <input class="in_2" type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                <?php if ($error_lastname) { ?>
              <p class="ts_ps off"><?php echo $error_lastname; ?></p>
              <?php } ?>
              </label>
              <label class="clearfix" for="">
                <span class="pl_span">Address</span>
                 <input  class="in_3" type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
                 <?php if ($error_address_1) { ?>
                 <p class="ts_ps off"><?php echo $error_address_1; ?></p>
              <?php } ?>
                
              </label>
              <label class="clearfix" for="">
                <span class="pl_span"></span>
                <!-- <input type="text" placeholder="" /> -->
                <input  type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
              </label>
              
              <label class="w_50 fl clearfix" for="">
                <span class="pl_span">Country</span>
                <select name="country_id" id="input-shipping-country" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                </select>
                <?php if ($error_country) { ?>
                <p class="ts_ps off"><?php echo $error_country; ?></p>
              <?php } ?>
                <!--  -->
              </label>
              <label class="w_50 fr clearfix" for="">
                <span class="pl_span">State</span>
                <select name="zone_id" id="input-shipping-zone-0" class="form-control">
              </select>
              <?php if ($error_zone) { ?>
              <p class="ts_ps off"><?php echo $error_zone; ?></p>
              <?php } ?>
              </label>
              
              <label class="w_50 fl clearfix" for="">
                <span class="pl_span">City</span>
                 <input class="in_4"  type="text" name="city"  placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                 <?php if ($error_city) { ?>
                  <p class="ts_ps off"><?php echo $error_city; ?></p>
              <?php } ?>
              </label>
              
              <label class="w_50 fr clearfix" for="">
                <span class="pl_span">Zip Code</span>
                <input class="in_5"  type="text" name="postcode"  placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                <?php if ($error_postcode) { ?>
                 <p class="ts_ps off"><?php echo $error_postcode; ?></p>
              <?php } ?>
               
              </label>
              
              <label class="clearfix clear" for="">
                <span class="pl_span">Phone</span>
                <input class="in_6"  type="text" name="phone" placeholder="phone" id="input-postcode" class="form-control" />
                <?php if ($error_telephone) { ?>
                 <p class="ts_ps off"><?php echo $error_telephone; ?></p>
              <?php } ?>
               
              </label>
              
              <button class="qx_btn" type="reset">Cancel</button>
              <button class="tj_btn" type="submit">SAVE</button>
            </form>
          </div>
        
        </div>
      
      </div>
    
    </div>
    




<?php echo $footer; ?>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length-2) {
		$('.form-group').eq(parseInt($(this).attr('data-sort'))+2).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length-2) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group').length-2) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length-2) {
		$('.form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
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

			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<!-- <script>
  $(function(){
    $("input").focus(function(){
      $(this).attr("placeholder","");
      $(this).siblings(".pl_span").css("display","block");
    })
    $("input").blur(function(){
      
      $(this).attr("placeholder",$(this).siblings(".pl_span").text());
      $(this).siblings(".pl_span").css("display","none");
    })
  })
</script> -->

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
      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=3){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })
     $(".in_4").blur(function(){
      var in_2val = $(".in_2").val();
      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=2){
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
      if(($(this).val()!="") && ($(this).val().length<=128) && $(this).val().length>=2){
         $(this).siblings(".ts_ps").removeClass("off"); 
         $(this).parent().addClass("true");
      }else{
          $(this).parent().removeClass("true");
          $(this).siblings(".ts_ps").addClass("off");
      }
     })

   })
</script>