      <div class="slide_p">
              <?php foreach ($totals as $total) { ?>
       
            <p><?php echo $total['title']; ?> <span><?php echo $total['text']; ?></span></p>
            <?php } ?>

             <!--  <p>Total Products <span>₦216K</span></p>
              <p>Total Points <span>-₦0K</span></p>
              <p>Total Shipping <span>₦0K</span></p>
              <p><i class="xl_i">Coupon:Summer Sale <em></em></i> <span>-₦5K</span></p>
              <ul class="xl_ul clearfix">
                <li class="active clearfix">
                  <span>Summer Sale</span>
                  <em>-₦5K</em>
                </li>
                <li class="clearfix">
                  <span>Summer Sale 1</span>
                  <em>-₦3K</em>
                </li>
              </ul> -->
            </div>
            
            <p class="total_p clearfix">
              <!-- <i class="text_i">Coupon: <i>- ₦5K</i></i> -->
              <span>Total</span>
              <i class="img_i"></i>
              <em><?=$totals['total']['text']?></em>
            </p>
            <a class="btn_a" onclick="submit_message('<?php echo $checkout; ?>')">CHECK OUT</a>