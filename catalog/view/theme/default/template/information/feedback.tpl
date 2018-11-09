<?php echo $header; ?>
<div class="in_content clearfix"></div>
  <div class="contact_us clearfix">
        <div class="top_yd clearfix">
          <h1><a class="fh" href="<?=$home;?>">< BACK</a> CONTACT US</h1>
        </div>
        
        <div class="con_text clearfix">
          <span class="line"></span>
          <h1>CONTACT US</h1>
          <p>
            Your order is confirmed and we're getting it ready.<br />
            Send us a message if you have any question, we will reply you within 48 hours.
          </p>
          <form action="<?php echo $action; ?>" method="post" class="dash-help-form">
            <div class="form_div">
              <span>SEND EMAIL </span>
              <input type="text" value="<?=$firstname;?>"  disabled="disabled" placeholder="Firstname"/>
              <input type="text" value="<?=$email;?>"  disabled="disabled" placeholder="Email" />
              <input type="text" value="<?=$telephone;?>"  disabled="disabled" placeholder="Telephone"/>  
              <textarea placeholder="message" name="enquiry"></textarea>
              <button class="tj_btn" type="submit">SEND OUT</button>
            </div>
            <?php if ($error_enquiry) { ?>
          <div class="text-danger" >
          <?php echo $error_enquiry; ?>
          </div>
          <?php } ?>
          </form>
        </div>
    </div>
<?php echo $footer; ?>
<?php if ($success) { ?>
  <script type="text/javascript">
    tips('<?php echo $success; ?>','',500);
  </script>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <script type="text/javascript">
    tips('<?php echo $error_warning; ?>','gantan',500);
  </script>
  <?php } ?>