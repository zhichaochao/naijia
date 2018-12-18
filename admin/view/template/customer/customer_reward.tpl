<div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-left"><?php echo $column_date_added; ?></td>
        <td class="text-left"><?php echo $column_description; ?></td>
        <td class="text-right"><?php echo $column_points; ?></td>
        <td class="text-right">编辑</td>
      </tr>
    </thead>
    <tbody>
      <?php if ($rewards) { ?>
      <?php foreach ($rewards as $reward) { ?>
      <tr>
        <td class="text-left"><?php echo $reward['date_added']; ?></td>
        <td class="text-left"><?php echo $reward['description']; ?></td>
        <td class="text-right"><?php echo $reward['points']; ?></td>
         <td class="text-right">
             <button type="button" onclick="del('<?php echo $reward['customer_reward_id']; ?>')" data-toggle="tooltip" title="删除" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
               </td>
      </tr>
      <?php } ?>
      <tr>
        <td></td>
        <td class="text-right"><b><?php echo $text_balance; ?></b></td>
        <td class="text-right"><?php echo $balance; ?></td>
      </tr>
      <?php } else { ?>
      <tr>
        <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<script>
function del(customer_reward_id) {
  $.ajax({
        url: 'index.php?route=customer/customer/dereward&token=<?php echo $token; ?>',
        type: 'post',
        data:{'customer_reward_id':customer_reward_id},
        dataType: 'json',
        success:function(json) {
          // alert(json)
        if(json){
          alert(json.success);
          location.reload();
        }

        }
  })
  // alert(customer_reward_id);
  // body...
}
</script>
