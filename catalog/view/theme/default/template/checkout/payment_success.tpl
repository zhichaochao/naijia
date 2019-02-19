
<?php echo $header; ?>

		<div class="in_content clearfix"></div>
		<!--内容-->
		<div class="succrss clearfix">
			<div class="su_text clearfix">
				<div class="top clearfix">
				<div class="top_text clearfix">
					<div class="left clearfix">
								<!--<img src="img/png/icon_60.png" alt="" />-->
								<div class="wid">
									<div class="yuan">
										<span class="span_img"></span>
									</div>
									<h1>THANK YOU</h1>
								</div>
								<p>Please check your email for more information  about this order</p>
								
								<div class="huodong">
									<ul>
										<li data-src="<?php echo $promotionimg?>"><?php echo $promotion?> <img src="/catalog/view/theme/default/img/hot.gif"/></li>
										<li data-src="<?php echo $promotionimgs?>"><?php echo $promotions?><img src="/catalog/view/theme/default/img/hot.gif"/></li>
									</ul>
								</div>
							</div>
						<hr />
						<div class="right clearfix">
							<dl>
								<dt>Order number</dt>
								<dd><?=$order_number;?></dd>
							</dl>
							<dl>
								<dt>Order Status</dt>
								<dd><?=$order_status;?></dd>
							</dl>
							<dl>
								<dt>Question about this order?</dt>
								<dd><a href="http://api.whatsapp.com/send?phone=<?=$whatsapp;?>">Contact us (Whatsapp)</a></dd>
							</dl>
						</div>
						
						<div class="btn">
							<a href="<?=$view_order;?>">View My Order</a>
							<a href="<?=$continue;?>">Continue Shopping</a>
						</div>
					</div>
					
				</div>
				<div class="bot clearfix">
					<!-- Swiper -->
					  <div class="swiper-container in_ul2">
					    <div class="swiper-wrapper">
							<?php foreach ($hots as $hot) { ?>	
					      <div class="swiper-slide clearfix">
					      	<a class="in_ul2_a clearfix" href="<?=$hot['href'];?>">
					      		<div class="pic_img">
						      		<img class="lazyLoad" src="" srcs="<?=$hot['thumb'];?>" data-src="<?=$hot['thumbs'];?>"/>
					      		</div>
					      		<div class="text">
					      			<h1><?=$hot['name'];?></h1>
					      			<?php if($hot['special']){?> 
                                   <span ><?=$hot['special'];?></span> <span><?=$hot['price'];?></span>
                                   <?php }else{?>
                                   <span ><?=$hot['price'];?> </span>
                                   <?php }?>
					      			<!-- <span>₦26K <em>₦46K</em></span> -->
					      		</div>
					      	</a>
					      </div>
					      <?php } ?>
					      
					     
					      
					      
					    </div>
					    <!-- Add Arrows -->
					    <div class="swiper-button-next"></div>
					    <div class="swiper-button-prev"></div>
					  </div>
				
				</div>
				
			</div>
		</div>
	<!--活动版块介绍-->	
		<div class="modal hd_modal">
			<div class="text">
				<img src=""/>
			</div>
		</div>	
		
		
<?php echo $footer; ?>
<script type="text/javascript">
//触发发邮件动作
	$(document).ready(function() {
    	sendEmail();
	});

	//发邮件的方法
	function sendEmail(){
		$.ajax({
	        url: 'index.php?route=checkout/success/sendEmail_1',
	        type: 'post',
	    });
	}
</script>
<script type="text/javascript">
	$(function(){
		//底部产品轮播
		var li_w=4;
	  	if($(window).innerWidth()>920){
	  		li_w=4;
	  		mr_w=30;
	  	}else{
	  		li_w=2;
	  		mr_w="3%";
	  	}
		new Swiper('.in_ul2', {
		      slidesPerView: li_w,
		      spaceBetween: mr_w ,
		      slidesPerGroup: li_w,
		      loop: true,
		      autoplay: true,
		      loopFillGroupWithBlank: true,
		      navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		      },
		});
		
		$(".huodong li").click(function(){
			$(".hd_modal").fadeIn();
			
			$(".hd_modal .text>img").attr("src",$(this).attr("data-src"));
			$("body").css("overflow","hidden");
		})
		$(".hd_modal").click(function(e){
			var close = $('.hd_modal .text'); 
		   	if(!close.is(e.target) && close.has(e.target).length === 0){
		   		$(".hd_modal").fadeOut();
				$("body").css("overflow","");
			}
		})
	})
</script>