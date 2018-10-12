<?php echo $header;?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="classification clearfix">
      <ul class="clearfix">

      <?php foreach($categories as $key => $category) { ?>
      <li class="clearfix">
          <a class="clearfix" href="<?php echo $category['href'];?>">
            <img src="<?php echo $category['image'];?>" alt="" />
            <p><?php echo $category['name'];?></p>
          </a>
        </li>
      <?php } ?>
   <?php foreach($categoriess as $key => $category) { ?>
      <li class="clearfix">
          <a class="clearfix" href="<?php echo $category['href'];?>">
            <img src="<?php echo $category['image'];?>" alt="" />
            <p><?php echo $category['name'];?></p>
          </a>
        </li>
  <?php } ?>
      </ul>
    </div> 
<?php echo $footer; ?>
