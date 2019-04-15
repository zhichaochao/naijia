<?php echo $header; ?>

    <div class="in_content clearfix"></div>
    <!--内容-->
    <?php if(!empty($products)){?>

    <div class="shop_con clearfix">
      <div class="top_yd clearfix">
        <h1><a class="fh" href="<?=$home;?>">< BACK</a> MY SHOPPING BAG</h1>
      </div>

      
      <div class="shop_content">
        <div class="text">
        <div class="qx">
          <label for="" class="qx_label">
            <input class="check_input" type="checkbox">
            <i class="check_i active"></i>
            <span>ALL</span>
            
            <em class="em4">Total Prices</em>
            <em class="em3">Quantity</em>
            <em class="em2">Unit Price</em>
            <em class="em1">Product Information</em>
          </label>
        </div>
        
        <ul class="shop_ul">
 

            <?php foreach ($products as $product) { ?>
             
               <li class="clearfix">
            <div class="top clearfix">
              <label for="" class="dx_label">
                <input class="check_input" type="checkbox" <?=in_array($product['cart_id'],$cart_ids)?'checked':'';?> name="ids[]" value="<?php echo $product['cart_id']; ?>">
                <i class="check_i <?=in_array($product['cart_id'],$cart_ids)?'active':'';?>"></i>
              </label>

              <a class="text" href="<?php echo $product['href']; ?>">
                <img class="img1 lazyLoad" srcs="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                <span class="text_p">
               

                  <p class="p1"><?php echo $product['name']; ?></p>

                  <?php if ($product['option']['selects']) { ?>
                  <?php foreach ($product['option']['selects'] as $option) { ?>
                 <p class="p2" data='<?php echo $product['option']['quantity']; ?>'><?php echo $option['option_value_name']; ?></p>
                  <?php } ?>
                  <p class="p2"><?php echo $product['color']; ?></p>
                  <?php } ?>
                 <?php if (!$product['stock']) { ?>
                  <span class="span1">Lack of stock</span>
                  <?php } ?>
                  
                  <?php if ($product['reward']) { ?>
                <span class="span1"><?php echo $product['reward']; ?></span>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <span class="span1"><?php echo $text_recurring_item; ?>:<?php echo $product['recurring']; ?></span>
                  <?php } ?>
                 
                </span>
              </a>
              


                <div class="price_div">
                 <?php if($product['old_price']){?>
                 <span class="prices" id="prices_<?php echo $product['cart_id']; ?>"><?php echo $product['price']; ?></span>
                  <span class="price" id="price_<?php echo $product['cart_id']; ?>"><?php echo $product['old_price']; ?></span>
                  
                   <?php }else{?>
                   <span class="prices" id="prices_<?php echo $product['cart_id']; ?>"><?php echo $product['price']; ?></span>
                     <?php }?>
                </div>
        <!-- <?php if($product['old_price']){?>
              <span class="price" id="price_<?php echo $product['cart_id']; ?>" ><?php echo $product['old_price']; ?></span>
              <span class="prices" id="prices_<?php echo $product['cart_id']; ?>"><?php echo $product['price']; ?></span>
              <?php }else{?>
              <span class="prices hei" id="prices_<?php echo $product['cart_id']; ?>"><?php echo $product['price']; ?></span>
              <?php }?> --> 
              <div class="num_label"  data='<?php echo $product['stock_quantity']; ?>'>
                <span class="sub_span" onclick="cart_sub(<?php echo $product['cart_id']; ?>,this);"><em class="sub" ></em></span>
                <input type="text" readonly="readonly" class="num_in" id="quantity_<?php echo $product['cart_id']; ?>"  name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>"  />
                <span class="add_span" onclick="cart_add(<?php echo $product['cart_id']; ?>,this);"><em class="add" ></em></span>
              </div>
            </div>
          
            <!-- <div class="bot clearfix"> -->
             
              <!-- <span class="price_zj" id="total_<?php echo $product['cart_id']; ?>"><?php echo $product['total']; ?></span> -->
              <!-- <button class="save " onclick="cart_wishlist('<?php echo $product['cart_id']; ?>' ,'<?php echo $product['product_id']; ?>' ,this);"><img src="/catalog/view/theme/default/img/png/icon_36.png"/> Save for later</button> -->
            <!-- </div> -->
            <?php if($product['date_end']){ ?>
            <p class="time clear clearfix">This product is on  Sales，that ends in <?=$product['date_end'];?></p>
            <?php }?>
            <div class="shop_close" onclick="cart_remove('<?php echo $product['cart_id']; ?>',this);">
              <em></em>
            </div>
          </li>
              <?php } ?>

         
          
        </ul>
        
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <ol class="shop_type_ol clearfix">
          <li class="<?=$shippingorpick=='shipping'?'active':'';?>">
            <div class="li_label" data='shipping'>
              <i class="ck_i active"></i>
              <span>Delivery</span>
            </div>
            <em class="sjx_em"></em>
          </li>
          <li class="<?=$shippingorpick=='shipping'?'':'active';?>">
            <div class="li_label" data='pick'>
              <i class="ck_i"></i>
              <span>Pick up in store(Ikeja)</span>
            </div>
            <em class="sjx_em"></em>
          </li>
        </ol>
        <ul class="shop_type_ul clearfix" id="shop_type_ul">
          <li class="<?=$shippingorpick=='shipping'?'active':'';?> clearfix">
            <label for="country_id">
              <span>Country</span>
              
              <div class="select clearfix">
                <select id="country_id" name="country_id">
                              <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($countries as $country) { ?>
                                        <?php if ($country['country_id'] == $country_id) { ?>
                                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                        <?php } else { ?>
                                        
                                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                </select>
              </div>
            </label>
            <label for="zone_id">
              <span>City</span>
              <select name="zone_id" id='zone_id' onchange ="get_address_cost();">
               
              </select>
            </label>
            <span class="ship_span" id='shipping_cost'>Shipping Cost:  </span>
            <!-- <p class="ship_p">Get shipping cost here<i><br /></i> NOTE* Final cost based on pratice</p> -->
            <button type="button" class="get_ship"><span>Get shipping cost here</span> </button>
              <p class="ship_p">NOTE* Final cost based on pratice</p>
          </li>
          <li class="clearfix <?=$shippingorpick=='shipping'?'':'active';?>">
            <p class="pick_1">Lagos Store</p>
            <p class="pick_2">alausa.obafemi awolowo way. ikeja Lagos，Nigeria</p>
          </li>
        </ul>
        
        <div class="total clearfix">
          <div class="right" id='total'>
            
          </div>
          
          <div class="left">
            <label class="label_are clearfix" for="">
              <span>Order Notes :</span>
              <textarea id='message' placeholder="Leave message here if you have any further request."><?=$message;?></textarea>
              <input type="hidden" id='shippingorpick' name="shippingorpick" value="<?=$shippingorpick;?>" />
            </label>
          </div>
        </div>
        </form>
      </div>
      
      </div>
    </div>  
     <?php }else{ ?>
    <!--内容-->
    <div class="error_con shop clearfix">
      <div class="null clearfix">
        <div class="text clearfix">
          <img src="catalog/view/theme/default/img/png/404_.png" alt="" />
          <p>Your shopping bag is empty ~</p>
          <a href="<?php echo $shopping;?>">GO SHOPPING&nbsp;&nbsp;></a>
        </div>
      </div>
    </div>

    <?php }?>
    <!--活动版块介绍--> 
    <div class="modal hd_modal">
      <div class="text">
        <img src="<?php echo $thumbs?>"/>
      </div>
    </div>
    <!--运费表-->  
    <div class="modal yfb_modal">
      <div class="text">
        <div class="close"></div>
        <div class="yfb_div clearfix">
          <dl>
            <dt>
              <span>CITY</span>
              <span>RATE</span>
            </dt>
            <dd>
              <span class="sp_1">Lagos</span>
              <span class="sp_2">₦1500</span>
            </dd>
            <dd>
              <span class="sp_1">Auchi</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Ekpoma</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Warri</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Benin</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Ilorin</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Ibadan</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Akure</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Osogbo</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Sango Ota</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Abeokuta</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Kano</span>
              <span class="sp_2">₦3000</span>
            </dd>
            <dd>
              <span class="sp_1">Minna</span>
              <span class="sp_2">₦3000</span>
            </dd><dd>
              <span class="sp_1">Jos</span>
              <span class="sp_2">₦3000</span>
            </dd>
            <dd>
              <span class="sp_1">Other country</span>
              <span class="sp_2">₦10000</span>
            </dd>
          </dl>
          <dl>
            <dt>
              <span>CITY</span>
              <span>RATE</span>
            </dt>
            <dd>
              <span class="sp_1">Aba</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Abuja</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Asaba</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Enugu</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Owerri</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Port Harcourt</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Yenagoa</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Umuahia</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Awaka</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Uyo</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Calabar</span>
              <span class="sp_2">₦2000</span>
            </dd>
            <dd>
              <span class="sp_1">Kaduna</span>
              <span class="sp_2">₦3000</span>
            </dd><dd>
              <span class="sp_1">Zaria</span>
              <span class="sp_2">₦3000</span>
            </dd>
            <dd>
              <span class="sp_1">Makurdi</span>
              <span class="sp_2">₦3000</span>
            </dd>
          </dl>
        </div>
      </div>
    </div>
<?php echo $footer; ?>
<?php if(!empty($products)){?>
 <link rel="stylesheet" href="/catalog/view/theme/default/js/select2/css/select2.css" />
        <script type="text/javascript" src="/catalog/view/theme/default/js/select2/js/select2.js" ></script>
<script type="text/javascript"><!--
$('#shop_type_ul select[name=\'country_id\']').on('change', function() {
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

      $('#shop_type_ul select[name=\'zone_id\']').html(html);
         if ($('#zone_id').val()>0) {
      get_address_cost();
      }else{
          $('#shipping_cost').html('Shipping Cost:');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('#shop_type_ul select[name=\'country_id\']').trigger('change');

$(document).ready(function(){
  $("#country_id").select2();
  $("#zone_id").select2();
});
</script>
<script>
  
  function get_address_cost() {
    $.ajax({
          url:'<?php echo $address_cost ;?>',
          type:'post',
          data:{'country_id':$('#country_id').val(),'zone_id':$('#zone_id').val()},
          dataType: 'json',
          success:function(data){
            $('#shipping_cost').html('Shipping Cost:'+data['cost']);
                
          }
      })
  }
  function submit_message(){
    var ids=get_ids();
      $.ajax({
          url:'<?php echo $message_submit ;?>',
          type:'post',
          data:{ids:ids,'content':$('#message').val(),'shippingorpick':$('#shippingorpick').val(),'country_id':$('#country_id').val(),'zone_id':$('#zone_id').val()},
          dataType: 'json',
          success:function(data){
            if (data['error']) {
              alert(data['error']);
            }else{
            window.location.href=data['href'];
                }
          }
      })


   
  }
  // 加入收藏
  function cart_wishlist(cart_id,product_id,th) {
    
         $.ajax({
          url:'<?php echo $wishlist_add ;?>',
          type:'post',
          data:{'product_id':product_id},
          dataType: 'json',
          success:function(data){
           // alert(data);
                
          }
         })
         cart_remove(cart_id,th);

  }

      // 获得已选的产品的cart_ids;
    function get_ids() {
      var ids=new Array();
       $.each($('input[name="ids[]"]:checked'),function(){
        ids.push($(this).val());
       })
     return ids.join(",");
    }

    //刪除當前購物車訂單 

  function cart_remove(id,th) {
   
    var ids=get_ids();
    // alert(ids);

     $.ajax({
        url: '<?=$cart_remove;?>',
        dataType: 'json',
        type:'POST',
        data:{key:id,ids:ids},
        success: function(json) {
          get_total();
         }

     
    });
  $(th).parents("li").remove();
 }
 // 重新计算一次总价
 get_total();
 function get_total() {
  var ids=get_ids();
        $.ajax({
          url:'<?php echo $cart_total_href ;?>',
          data:{ids:ids},
          type:'POST',
          dataType: 'html',
          success:function(html){
           $('#total').html(html);
                
          }
         })
  
 }

 // 数量减

 function cart_add(id,th) {
    var num_val = $(th).siblings(".num_in").val();
      num_val++;
      var stock_quantity=$(th).parent().attr('data');
      // alert(stock_quantity);
      // if (num_val<=stock_quantity) {alert('Lack of stock'); return false;}
      console.log(num_val+"***"+stock_quantity);
      $(th).siblings(".num_in").val(num_val);
      submit_num(id,num_val);
      
 }
 function cart_sub(id,th) {
  var num_val = $(th).siblings(".num_in").val();
  var stock_quantity=$(th).parent().attr('data');
  // alert(num_val);die;
  
  // if (num_val>=stock_quantity) {tips('Error：Limited Quantity','gantan',500); return false;}
      if(num_val>1){
        
        num_val--;
        console.log(num_val+"***"+stock_quantity);
        $(th).siblings(".num_in").val(num_val);
      }
        submit_num(id,num_val);
 }
 // 提交修改后的数量
 function submit_num(id,num) {
    $.ajax({
        url:'<?=$cart_editnum;?>',
        dataType: 'json',
        type:'POST',
        data:{id:id,num:num},
        success: function(json) {
          // tips('Shopping Cart Modification');
          $('#cart_count').html(json.totals);
          $('#total_'+json['id']).html(json['total']);
          get_total();
         }

     
    });
 }

  $(function(){

    
  //全选
    $(".qx_label input").click(function(){
      if($(this).prop("checked")){
        $(this).siblings(".check_i").addClass("active");
        $(".dx_label input").each(function(){
          $(this).prop("checked",true);
          $(this).siblings(".check_i").addClass("active");
        })
      }else{
        $(this).siblings(".check_i").removeClass("active");
        $(".dx_label input").each(function(){
          $(this).prop("checked","");
          $(this).siblings(".check_i").removeClass("active");
        })
      }
      get_total();
    })
  //单选
    $(".dx_label input").click(function(){
      if($(this).prop("checked")){
        $(this).siblings(".check_i").addClass("active");
        var len = $(".dx_label .check_i").length;
        var i=0;
        $(".dx_label .check_i").each(function(){
          if($(this).hasClass("active")){
            i++
          }
          return i;
        })
        if(i>=len){
          $(".qx_label input").prop("checked",true);
          $(".qx_label .check_i").addClass("active");
        }
        
      }else{
        $(this).siblings(".check_i").removeClass("active");
        $(".qx_label .check_i").removeClass("active");
        $(".qx_label input").prop("checked","");
      }
      get_total();
    })


 
    
  //点击切换pick ship
    $(".shop_type_ol .li_label").click(function(){
      $('#shippingorpick').val($(this).attr('data'));
      $(this).parents("li").addClass("active").siblings("li").removeClass("active");
      $(".shop_type_ol .li_label .check_i").removeClass("active");
      $(this).find(".check_i").addClass("active");
      $(".shop_type_ul>li").eq($(this).parents("li").index()).addClass("active").siblings("li").removeClass("active");
    })
    //礼物
    $(".free_p>span").click(function(){
      $(".hd_modal").fadeIn();
      $("body").css("overflow","hidden");
    })
    $(".hd_modal").click(function(e){
      var close = $('.hd_modal .text'); 
        if(!close.is(e.target) && close.has(e.target).length === 0){
          $(".hd_modal").fadeOut();
        $("body").css("overflow","");
      }
    })
    //打开运费表
    $(".get_ship").click(function(){
      $(".yfb_modal").fadeIn();
      $(".yfb_modal .text").animate({bottom:0});
    })
    $(".yfb_modal .close").click(function(){
      $(".yfb_modal").fadeOut();
      $(".yfb_modal .text").animate({bottom:'-100%'})
    })
  // //点击加入心愿列表、
  //   $(".shop_ul .bot .save").click(function(){
  //     if($(this).hasClass("active")){
  //       $(this).removeClass("active");
  //     }else{
  //       $(this).addClass("active");
  //     }
  //   })
  

  })
</script>
<?php }?>