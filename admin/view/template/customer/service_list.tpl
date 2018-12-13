<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-inquiries').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-inquiries">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'r.email') { ?>
                    <a href="<?php echo $sort_product; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_product; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_product; ?>"><?php echo $column_product; ?></a>
                    <?php } ?></td>
                    <td class="text-left" style="color:#1e91cf;">手机号</td>
                     <td class="text-left" style="color:#1e91cf;">预约内容</td>

                    <td class="text-left"><?php if ($sort == 'r.time') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>">预约日期</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>">预约日期</a>
                    <?php } ?></td>
                    <td class="text-left" style="color:#1e91cf;">
                    状态
                    </td>
                </tr>
              </thead>
              <tbody>
                <?php if ($services) { ?>
                <?php foreach ($services as $service) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($service['store_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $service['store_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $service['store_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $service['email']; ?></td>
                   <td class="text-left"><?php echo $service['telephone']; ?></td>
                  <td class="text-left"><?php echo $service['content']; ?></td>
                  <td class="text-left">
                 <?php if(empty($service["time"])){ echo "";}else{echo date("Y-m-d",strtotime($service['time'])) ;}?>
                  </td>
                  <td class="text-left" onclick="click_jia(<?php echo $service['store_id']; ?>)">
                <?php if($service['status']==1){ ?>  
                      <h3><font color="red">×</font></h3>
                <?php }else{?>  
                      <h3><font color="green">√</font></h3>
                <?php }?>
                  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>

</div>
<script>
  function click_jia(store_id){
if(confirm('确认更改吗?')){
   $.ajax({
         url:"index.php?route=customer/service/click_jia&token=<?php echo $token; ?>",
         type:"post",
         data:{'store_id':store_id},
         dataType:'json',
         success:function(json){
           window.location.reload();
         } 
      });
}

    }
</script>
<?php echo $footer; ?>