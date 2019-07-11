<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="返回" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  


    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-info-circle"></i> 加入的购物车</h3>
      </div>
      <div class="panel-body">
       
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_product; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <td class="text-right">添加时间</td>
              <td class="text-right">姓名</td>
              <td class="text-right">Email</td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-left"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a>
                <?php foreach ($product['option_name'] as $option) { ?>
                <br />
                &nbsp;<small> <?php echo $option['option_name']; ?>: <?php echo $option['option_value_name']; ?></small>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['zongprice']; ?></td>
              <td class="text-right"><?php echo $product['date_added']; ?></td>
              <?php if (!empty($product['customer'])) { ?>
                  <?php foreach ($product['customer'] as $custome) { ?>
                  <td class="text-right"><?php echo $custome['firstname']; ?></td>
                  <td class="text-right"><?php echo $custome['email']; ?></td>
                    <?php } ?>
                  <?php }else{ ?>
                    <td class="text-right"></td>
                    <td class="text-right"></td>
                   <?php } ?>
            </tr>
            <?php } ?>
          
         
          </tbody>
        </table>


       
      </div>
    </div>

 
  </div>
  

</div>
<?php echo $footer; ?> 
