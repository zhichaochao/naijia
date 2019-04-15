<?php if (!$livemode) { ?>
 <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_testmode; ?></div>
<?php } ?>
<form >
 
  <div class="buttons">
    <div class="pull-right">
    <a onclick="payWithPaystack()"  class="a_qd_btn">Continue to pay</a>
      <!-- <input type="button"  onclick="payWithPaystack()" value="<?php echo $button_confirm; ?>" class="btn btn-primary" /> -->
    </div>
  </div>
</form>
  <script src="https://js.paystack.co/v1/inline.js"></script>
<script>
  function payWithPaystack(){
    var handler = PaystackPop.setup({
      key: '<?php echo $key; ?>',
      email: '<?php echo $email; ?>',
      amount: <?php echo $amount; ?>,
      currency: '<?php echo $currency; ?>',
      ref: '<?php echo $ref; ?>',
      callback: function(response){
          window.location.href='<?php echo html_entity_decode($callback); ?>';
      },
      onClose: function(){
          window.location.href='<?php echo html_entity_decode($callback); ?>';
      }
    });
    handler.openIframe();
  }
</script>
