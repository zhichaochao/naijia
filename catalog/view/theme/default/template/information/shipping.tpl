<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <div class="fot_cont">
      <div class="fot_text fot_text1">
        <h1>Shipping and Handling</h1>
        
        <ul class="f_ul1">
          <li>
            <h2>NIGERIA <img src="catalog/view/theme/default/img/png/fot_img1.png" alt="" /></h2>
            <p class="p1">Lagos: 1-2 days. </p>
            <p class="p1">Abuja,Port Harcourt, Ibadan: 3-5 days</p>
            <p class="p1">Others: 7 days</p>
            <p class="p2" style="margin-top: 0.18rem;">
              <span>●</span> 
              We used local express to ship to different cities, they will call you when package is ready,
              buyer will need to carry the shipping fee.
            </p>
            <p class="p2" style="margin-bottom: 0.18rem;">
              <span>●</span>  
              The accurate shipping days depends on the express term customers choose. Once payment 
              done we will start processed your order.
            </p>
          </li>
          <li>
            <h2>WORLDWIDE <img src="catalog/view/theme/default/img/png/fot_img2.png" alt="" /></h2>
            <p class="p1" style="margin-bottom: 0.18rem;">All Global packages will be delivered by DHL or Fedex.</p>
            <p class="p1">United State and Canada: 2-4 days. </p>
            <p class="p1">European Countries: 2-4 days</p>
            <p class="p1">South America: 4-5 days.</p>
            <p class="p1">Middle East: 4-5 days.</p>
            <p class="p1" style="margin-bottom: 0.18rem;">African Countries: 4-5 days.</p>
          </li>
          <li>
            <p class="p1" style="margin: 0.18rem 0;">
              Processing time on custom orders varies depending on the order.
              Please see product details for processing time.
            </p>
          </li>
        </ul>
      </div>
    </div>
<?php echo $footer; ?>
<script>
  $(function(){
    $(".fot_text2 .f_ul1 li h3").click(function(){
      var img = $(this).find(".f_img");
      if(img.hasClass("active")){
        img.removeClass("active");  
        $(this).siblings(".s_text").slideUp();
      }else{
        $(".fot_text2 .s_text").slideUp();
        $(".fot_text2 .f_ul1 .f_img").removeClass("active");
        img.addClass("active");
        $(this).siblings(".s_text").slideDown();
      }
      
    })
  })
</script> 