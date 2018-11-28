<?php if (count($currencies) > 1) { ?>

  <li class="mn_li">
         
   <p class="money">
     <?php foreach ($currencies as $k=> $currency) { ?>
      <?php if($k!=0){?>  <em>/</em><?php } ?>
  <a  <?=$code==$currency['code']?'class="active"':'';?> onclick="changecurrency('<?php echo $currency['code']; ?>');" ><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a>
            
<?php } ?>     
 </p>
          </li>

<?php } ?>   
