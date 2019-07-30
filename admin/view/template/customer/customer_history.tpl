<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
      <tr>
        <td class="text-left">订单ID</td>
        <td class="text-left">订单号</td>
        <td class="text-left">订单状态</td>
        <td class="text-left"><?php echo $column_date_added; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php if ($histories) { ?>
      <?php foreach ($histories as $history) { ?>
      <tr>
        <td class="text-left"><?php echo $history['order_id']; ?></td>
        <td class="text-left"><?php echo $history['order_number']; ?></td>
        <td class="text-left"><?php echo $history['order_status']; ?></td>
        <td class="text-left"><?php echo $history['date_added']; ?></td>
      </tr>
      <?php } ?>
      <?php } else { ?>
      <tr>
        <td class="text-center" colspan="2"><?php echo $text_no_results; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
