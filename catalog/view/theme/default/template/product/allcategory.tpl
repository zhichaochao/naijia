<?php echo $header;?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="classification clearfix">
      <div class="top_yd clearfix">
          <h1><a class="fh" href="<?php echo $home?>">&lt BACK</a></h1>
      </div>
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
