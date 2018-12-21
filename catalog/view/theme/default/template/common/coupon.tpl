<?php echo $header; ?>
<!--内容-->
    <div class="in_content clearfix"></div>
    
    <div class="in_coupons yd_hide clearfix">
      
      <div class="con clearfix">
        <h1>
          Discounts&Coupons<br />
          <p class="bt_p">Can be used in shopping bag directly</p>
        </h1>
        <h2>COUPON</h2>
        <ol class="yhj_ol clearfix">  

        <?php foreach ($resultcoupons as $coupons) { ?>
          <li class="<?=$coupons['coupon']==1 ?'active':'';?>" onclick="coupon('<?=$coupons['coupon_id']?>',this)">
           <?php if($coupons['type']=='P') { ?>
            <h3><?=$coupons['discountp']?>%OFF</h3>
            <?php }else{ ?>

            <h3>-<?=$coupons['discount']?></h3>
            <?php  } ?>
             
            <p>Spend US <?=$coupons['total']?>, Get US <?=$coupons['discount']?>off</p>
           

            <span>Expires:<?=$coupons['date_end']?></span>
            <button class="yh_btn" type="button" >Coupon Added</button>
          </li>
           <?php  } ?>
        </ol>
      </div>
  
    </div>
<?php echo $footer; ?>
<script>
  // $(function(){
  //   $(".yhj_ol>li").click(function(){
  //     if(!$(this).hasClass("active")){
  //       $(this).addClass("active");
  //       tips("Successful collection","")
  //       $(this).find(".yh_btn").text("Coupon Added");
  //     }
  //   })
  // })
  function coupon(coupon_id,e) {

     if (!$(e).hasClass('active')) {
       $.ajax({
    url:'<?php echo $addcoupon ;?>',
    type:'post',
    data:{'coupon_id':coupon_id},
    dataType: 'json',
    success:function(data){
      // alert(data);
      if (data.success) {
        tips("Successful collection","")
        if(!$(e).hasClass("active")){
         $(e).addClass("active");
       }
        // tips("Successful collection","")
         // tips('Cancel the collection');
        // $('#wishlist_count').html(data.total);
      }
               // location.reload(); 
    }
   })

  }

  }
  
</script>
