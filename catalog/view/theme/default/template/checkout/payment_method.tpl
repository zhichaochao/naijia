   
    <?php if($shippingorpick=='pick'&&$address) {?>
    <li class="active">
                        <h1>Your Contacts</h1>
                        <div class="form_text clearfix">
                            <ol class="add_ol clearfix">
                                <li class="active zq_li clearfix">
                                    <div class="text">
                                        <span><?=$address['lastname'];?> <?=$address['firstname'];?></span>
                                        <span><?=$address['phone'];?></span> 
                                        <span><?=$address['email'];?></span>
                                    </div>
                                    <span class="edit" onclick="get_address();">Edit</span>
                                </li>
                            </ol>
                            <div class="store_address">
                                <h1>Store Address</h1>
                                <span>Lagos Store</br >
                                   alausa.obafemi awolowo way. ikeja Lagos，Nigeria
                                </span>
                            </div>
                         
                        </div>
                    </li>
                    <?php }elseif($shippingorpick=='shipping'&&$address){?>
                        <li class="active">
                        <h1>Your Address</h1>
                        <div class="form_text clearfix">
                            <ol class="add_ol clearfix">
                                <li class="active zq_li clearfix">
                                    <div class="text">
                                        <span><?=$address['lastname'];?> <?=$address['firstname'];?></span>
                                                <span><?php echo $address['address_1']; ?> <?php echo $address['address_2']; ?>  </span> 
                                      <span>  <?php echo $address['city']; ?>  </span> 
                                        <span> <?php echo $address['zone']; ?>  </span> 

                                         <span> <?php echo $address['country']; ?>  </span> 
                                         <span><?=$address['phone'];?></span> 
                                        <span><?=$address['email'];?></span>
                                    </div>
                                    <span class="edit" onclick="get_address();">Edit</span>
                                </li>
                            </ol>
                        </div>
                    </li>
                    <?php }else{?>
                    <script type="text/javascript"><!--
                        location = '<?php echo $redirect; ?>';
                        //--></script>

                    <?php } ?>
                    
    <li class="active">
                        <h1>Payment Method</h1>
                        
                        <div class="form_text">
                            <?php if ($payment_methods) { ?>

                          <input type="hidden" value="<?= $code;?>" name="payment_method" id='payment_method' />
                            <input type="hidden" name="agree" value="1" />
                            <ol class="pay_ol clearfix">  
                                <?php if($currency=='NGN'){ ?>
                             <?php foreach ($payment_methods as $payment_method) { if($payment_method['code']!='pp_express'){?>
                          
                                <li class="<?= $code == $payment_method['code']?'active':''; ?> clearfix <?php echo $payment_method['code']; ?>" data="<?php echo $payment_method['code']; ?>">
                                <?php if($payment_method['code']=='paystack'){ ?>
                                <div class="pic_img pay1"></div>
                                <?php }else{ ?>
                                <?php if($payment_method['code']=='pp_express'){ ?>
                                <div class="pic_img pay2"></div>
                                <?php }else{?>
                                 <div class="pic_img pay3"></div>
                                 <?php } ?>
                                  <?php } ?>
                                    <span><?php echo $payment_method['title']; ?></span>
                                    <em>₦</em>
                                </li>
                     
                                <?php }}}else{?>
                            <?php foreach ($payment_methods as $payment_method) {if($payment_method['code']=='pp_express'){ ?>
                          
                                <li class="<?= $code == $payment_method['code']?'active':''; ?> clearfix <?php echo $payment_method['code']; ?>" data="<?php echo $payment_method['code']; ?>">
                                 <?php if($payment_method['code']=='paystack'){ ?>
                                <div class="pic_img pay1"></div>
                                <?php }else{ ?>
                                <?php if($payment_method['code']=='pp_express'){ ?>
                                <div class="pic_img pay2"></div>
                                <?php }else{?>
                                 <div class="pic_img pay3"></div>
                                 <?php } ?>
                                  <?php } ?>
                                    <!-- <div class="pic_img ccc"></div> -->
                                    <span><?php echo $payment_method['title']; ?></span>
                                    <em>$</em>
                                </li>
                              <?php }}} ?>
                                <?php } ?>
                            </ol>
                        </div>
                    </li> 
                    <li class="active pc_no">
                        
                        <div class="form_text">
                            <div class="check_order  clearfix confirm" >
                                <h1>Order Details</h1>
                                <div class="slides clear clearfix">
                                    <?php foreach ($products as $product) { ?>
                                <p><?=$product['name'];?> <span class="num">x<?=$product['quantity'];?></span></p>
                              <?php } ?>
                                <hr />
                                </div>
                                <!-- <div class="slide clear clearfix">

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
                                    
                                </div> -->

                             <!--    <div class="slides clear clearfix">
                                <?php foreach ($products as $product) { ?>
                                <p><?=$product['name'];?> <span class="num">x<?=$product['quantity'];?></span></p>
                              <?php } ?>
                                <hr />
                               
                                </div> -->
                            
                                <!-- <div class="a_btn">
                                    <a onclick="pay();" class="a_qd_btn">Continue to pay</a>
                                </div> -->
                            </div>
                        </div>
                    </li>

<script type="text/javascript">
    if ($('#payment_method').val()) {
        get_total();
    }
 $(function(){
    // pc右侧下拉
        $(".slide_h1").click(function(){
            if($(this).hasClass("active")){
                $(this).removeClass("active");
                
//              $(this).siblings(".slides").show();
//              $(this).siblings(".slide").stop().slideUp();
                $(this).siblings(".slides").stop().slideDown();
                $(this).siblings(".slide").hide();
            }else{
                $(this).addClass("active");
                $(this).siblings(".slides").hide();
                $(this).siblings(".slide").stop().slideDown();
            }
        })
    $(".pay_ol>li").click(function(){
        var payment_method=$(this).attr('data');

            $(this).addClass("active").siblings("li").removeClass("active");
            $.ajax({
                    url: 'index.php?route=checkout/payment_method/save',
                    dataType: 'json',
                    type:'POST',
                      beforeSend: function() {
                        $('.a_qd_btn').html('loading');
                    },
                    data:{payment_method:payment_method,agree:1},
                
                    success: function(json) {
                        if (json['redirect']) {
                            
                              location = json['redirect'];
                        }else if(json['error']){
                            alert(json['error']['warning']);

                        }else{
                            get_total();
                        }

                    }
                })

        })    
        //    if($(window).width()<=920){
        //     $(window).scroll(function(){
        //         var div_top =parseInt($(".check_order").offset().top) ;
        //         var sc_top = $(window).scrollTop();
        //         if(sc_top < div_top-200){
        //             // $(".address_con .a_btn").removeClass("active");
        //             // $(".address_con .a_btn").css("position","fixed").css("padding","0.2rem 0.5rem");
        //         }else{
        //             // $(".address_con .a_btn").addClass("active");
        //             // $(".address_con .a_btn").css("position","inherit").css("padding","0");
        //         }
        //     })
        // } 
 })
 function get_total() {
       $.ajax({
         url: 'index.php?route=checkout/confirm',
         dataType: 'html',
        success: function(html) {
            console.log(html);
            $('.confirm').html(html);
        }
    });
 }
</script>