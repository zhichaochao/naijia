<?php if (count($currencies) > 1) { ?>

<script type="text/javascript">
  function changecurrency(code) {
    $('#form-currency').find('input[name="code"]').val(code);
    $('#form-currency').submit();
  }
</script>


<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">

   <p class="money">
     <?php foreach ($currencies as $k=> $currency) { ?>
      <?php if($k!=0){?>  <em>/</em><?php } ?>
  <a  <?=$code==$currency['code']?'class="active"':'';?> onclick="changecurrency('<?php echo $currency['code']; ?>');" > <i><?php echo $currency['symbol_left']; ?></i> <?php echo $currency['title']; ?></a>
            
<?php } ?>     
 </p>

  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>

<?php } ?>
