    <li class="active">
                        <h1>Payment Method</h1>
                        
                        <div class="form_text">
                            <ol class="pay_ol clearfix">
                                <li class="active clearfix">
                                    <div class="pic_img"></div>
                                    <span>PayPal</span>
                                    <em>$</em>
                                </li>
                                <li class="clearfix">
                                    <div class="pic_img"></div>
                                    <span>Paystack</span>
                                    <em>₦</em>
                                </li>
                                <li class="clearfix">
                                    <div class="pic_img"></div>
                                    <span>Direct Bank Transfer</span>
                                    <em>₦</em>
                                </li>
                            </ol>
                        </div>
                    </li> 
                    <li class="active pc_no">
                        
                        <div class="form_text">
                            <div class="check_order  clearfix">
                                <h1>Order Details</h1>
                                <div class="slides clear clearfix">
                                    <p>KIM K CLOSURE WIG <span class="num">x1</span></p>
                                    <p>KIM K CLOSURE WIG <span class="num">x1</span></p>
                                    <p>KIM K CLOSURE WIG <span class="num">x1</span></p>
                                    <hr />
                                    <p class="p2">Total: <span>$485.17</span></p>
                                </div>
                                <div class="slide clear clearfix">
                                    <div class="total clearfix">
                                        <p class="p1">Total Products <span>$477.27</span></p>
                                        <p class="p1">Total Points <span>-$0.00</span></p>
                                        <p class="p1">Total Shipping <span>$9.90</span></p>
                                        <p class="p1">Coupon: Summer Sale <span>-$2.00</span></p>
                                        <p class="p2">Total <span>$485.17</span></p>
                                    </div>
                                    <ul class="check_ul clearfix">
                                        <li class="clearfix">
                                            <div class="pic_img"><img src="img/yd_shop1.jpg"/></div>
                                            <div class="text">
                                                <h2>KIM K CLOSURE WIG</h2>
                                                <p>Color: Black</p>
                                                <p>Lenght: 18inch</p>
                                                <p>Wig With: 13*4 Frontal cap</p>
                                                <p>Quantity: 1</p>
                                                <span>$159.09</span>
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <div class="pic_img"><img src="img/yd_shop1.jpg"/></div>
                                            <div class="text">
                                                <h2>KIM K CLOSURE WIG</h2>
                                                <p>Color: Black</p>
                                                <p>Lenght: 18inch</p>
                                                <p>Wig With: 13*4 Frontal cap</p>
                                                <p>Quantity: 1</p>
                                                <span>$159.09</span>
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <div class="pic_img"><img src="img/yd_shop1.jpg"/></div>
                                            <div class="text">
                                                <h2>KIM K CLOSURE WIG</h2>
                                                <p>Color: Black</p>
                                                <p>Lenght: 18inch</p>
                                                <p>Wig With: 13*4 Frontal cap</p>
                                                <p>Quantity: 1</p>
                                                <span>$159.09</span>
                                            </div>
                                        </li>
                                    </ul>
                                    
                                </div>
                                <div class="a_btn">
                                    <a href="###" class="a_qd_btn">Continue to pay</a>
                                </div>
                            </div>
                        </div>
                    </li>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="radio">
  <label>
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <?php echo $payment_method['title']; ?>
    <?php if ($payment_method['terms']) { ?>
    (<?php echo $payment_method['terms']; ?>)
    <?php } ?>
  </label>
</div>
<?php } ?>
<?php } ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<?php if ($text_agree) { ?>
<div class="buttons">
  <div class="pull-right"><?php echo $text_agree; ?>
    <?php if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" />
    <?php } ?>
    &nbsp;
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<?php } ?>
