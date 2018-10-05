<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    
    <!--pc端-->
    <div class="pc_ordet_con clearfix">
      <div class="bt">
        <h1>ORDER INFORMATION</h1>
        <p>Order No:<?php echo $order_num; ?></p>
      </div>
      
      <div class="top clearfix">
        <div class="left clearfix">
          <h2><?php echo $order_status; ?></h2>
          <p class="p1">Please finish payment or upload<br /> the bank alert.Or it will be<br /> invalid in 
            <span class="span_r djs_p" title="<?php echo $date_endadd; ?>">
              <span class="int_hour">02</span><i>:</i>
              <span class="int_minute">00</span><i>:</i>
              <span class="int_second">00</span>
            </span>
          </p>
          <a class="pay_a" href="###">Continue To Pay</a>
          <span>Order date:<?php echo $date_added; ?></span>
        </div>
        <div class="right">
          <div class="text">
            <div class="slide_p clearfix">
              <p>Total Products <span>₦216K</span></p>
              <p>Total Points <span>-₦0K</span></p>
              <p>Total Shipping <span>₦0K</span></p>
              <p><i class="xl_i">Coupon:Summer Sale</i> <span>-₦5K</span></p>
            </div>
            <hr />
            <p class="total_p active clearfix">
              <span>Total</span>
              <em>₦216K</em>
            </p>
          </div>
        </div>
      </div>
      <div class="address clearfix">
        <dl class="clearfix">
          <dt>Name:</dt>
          <dd>xiaoyanjing</dd>
        </dl>
        <dl class="clearfix">
          <dt>Address:</dt>
          <dd>A lane in huangbian vllage district guangzhouguangdong province<br />
          510000  China</dd>
        </dl>
        <dl class="clearfix">
          <dt>Contact:</dt>
          <dd>+8615601634559</dd>
        </dl>
      </div>
      
      <div class="bot clearfix">
        <div class="top_span clearfix">
          <span>COMMODITY </span>
          <span>TEXTIRE OF MATERIAL</span>
          <span>UNIT PRICE</span>
          <span>NUMBER</span>
          <span>TOTAL</span>
        </div>  
        <ul class="table_ul clearfix">
          <li class="clearfix">
            <div>
              <a href="###">
                <div class="pic_img">
                  <img src="img/yd_shop1.jpg" alt="" />
                </div>
                <p class="ov_text">10”-30” Virgin Brazilioan Brazilioan Brazilioan Brazilioan Brazilioan.</p>
              </a>
            </div>
            <div>
              <span>
                Natural black; 12inch  <br />
                4*13 frontal cap;
              </span>
            </div>
            <div>
              <span>$35.05</span>
            </div>
            <div><span>x1</span></div>
            <div>
              <span>$35.05</span>
            </div>
          </li>
          <li class="clearfix">
            <div>
              <a href="###">
                <div class="pic_img">
                  <img src="img/yd_shop1.jpg" alt="" />
                </div>
                <p class="ov_text">10”-30” Virgin Brazilioan Brazilioan Brazilioan Brazilioan Brazilioan.</p>
              </a>
            </div>
            <div>
              <span>
                Natural black; 12inch  <br />
                4*13 frontal cap;
              </span>
            </div>
            <div>
              <span>$35.05</span>
            </div>
            <div><span>x1</span></div>
            <div>
              <span>$35.05</span>
            </div>
          </li>
          <li class="clearfix">
            <div>
              <a href="###">
                <div class="pic_img">
                  <img src="img/yd_shop1.jpg" alt="" />
                </div>
                <p class="ov_text">10”-30” Virgin Brazilioan Brazilioan Brazilioan Brazilioan Brazilioan.</p>
              </a>
            </div>
            <div>
              <span>
                Natural black; 12inch  <br />
                4*13 frontal cap;
              </span>
            </div>
            <div>
              <span>$35.05</span>
            </div>
            <div><span>x1</span></div>
            <div>
              <span>$35.05</span>
            </div>
          </li>
        </ul>
      </div>
    </div>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" colspan="2"><?php echo $text_order_detail; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left" style="width: 50%;"><?php if ($invoice_no) { ?>
              <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
              <?php } ?>
              <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
            <td class="text-left" style="width: 50%;"><?php if ($payment_method) { ?>
              <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
              <?php } ?>
              <?php if ($shipping_method) { ?>
              <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
              <?php } ?></td>
          </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" style="width: 50%; vertical-align: top;"><?php echo $text_payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left" style="width: 50%; vertical-align: top;"><?php echo $text_shipping_address; ?></td>
            <?php } ?>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $shipping_address; ?></td>
            <?php } ?>
          </tr>
        </tbody>
      </table>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <?php if ($products) { ?>
              <td style="width: 20px;"></td>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-left"><?php echo $product['name']; ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['total']; ?></td>
              <td class="text-right" style="white-space: nowrap;"><?php if ($product['reorder']) { ?>
                <a href="<?php echo $product['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></a>
                <?php } ?>
                <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="3"></td>
              <td class="text-right"><b><?php echo $total['title']; ?></b></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
      <?php if ($comment) { ?>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $text_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $comment; ?></td>
          </tr>
        </tbody>
      </table>
      <?php } ?>
      <?php if ($histories) { ?>
      <h3><?php echo $text_history; ?></h3>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($histories) { ?>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="text-left"><?php echo $history['date_added']; ?></td>
            <td class="text-left"><?php echo $history['status']; ?></td>
            <td class="text-left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<script>
  $(function(){
    
    //下拉total_p
      $(".total_p").click(function(){
        if($(this).hasClass("active")){
          $(this).removeClass("active");
          $(this).siblings(".slide_p").stop().slideUp();
          $(this).siblings("hr").hide();
        }else{
          $(this).addClass("active");
          $(this).siblings(".slide_p").stop().slideDown();
          $(this).siblings("hr").show();
        }
        
        
      })
    
  })
  
  
  //倒计时
  function show_time() {
        $(".djs_p").each(function() {
            var endtime = $(this).prop("title");
            var time_start = new Date().getTime(); //设定当前时间
            var time_end = new Date(endtime).getTime(); //设定目标时间
            var time_distance = time_end - time_start;
            var timer;
            if (time_distance >= 0) {
                var int_day = Math.floor(time_distance / 86400000)
                time_distance -= int_day * 86400000;
                var int_hour = Math.floor(time_distance / 3600000)
                time_distance -= int_hour * 3600000;
                var int_minute = Math.floor(time_distance / 60000)
                time_distance -= int_minute * 60000;
                var int_second = Math.floor(time_distance / 1000)
                if (int_day < 10) {
                    int_day = "0" + int_day;
                }
                if (int_hour < 10) {
                    int_hour = "0" + int_hour;
                }
                if (int_minute < 10) {
                    int_minute = "0" + int_minute;
                }
                if (int_second < 10) {
                    int_second = "0" + int_second;
                }
                $(this).find(".int_day").text(int_day);
                $(this).find(".int_hour").text(int_hour);
                $(this).find(".int_minute").text(int_minute);
                $(this).find(".int_second").text(int_second);
            }else{
                clearInterval(timer);
                $(this).css("display","none");
            }
        })
        timer = setTimeout("show_time()", 1000);
    }
    show_time();
</script>