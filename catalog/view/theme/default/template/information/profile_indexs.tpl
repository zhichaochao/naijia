<?php echo $header; ?>
<div class="in_content clearfix"></div>
		<!--内容-->
		<div class="wig3 clearfix">
			<div class="wig_con clearfix">
				<div class="top_yd pc_hide clearfix">
					<h1><a class="fh" href="javascript:;">< BACK</a> Hair Care</h1>
				</div>
				
				<h1 class="top_h1 yd_hide clearfix">Hair Care</h1>
				<p class="top_p clearfix">
				 The first time you successfully register as a member, you will receive ₦2000 points <span>(only one time for each member account)<br /></span>
				 Redeem coupons and cash vouchers in VIP Shopping Interface
				</p>
				
				<ul class="wig3_ul clearfix">


         		 <?php foreach ($informations as $information) { ?>
					<li>
						<a href="<?php echo $information['href']?>">
							<div class="pic_img clearfix">
								<div class="<?=$information['video']==1 ?'bf_img':'';?>"></div>
								<img src="<?php echo $information['image']?>"/>
							</div>
							<div class="text clearfix">
								<p class="p1">Release time:<?php echo $information['addtime']?></p>
								<p class="p2">
									<?php echo $information['title']?>
								</p>
								<p class="p3">
									<?php echo $information['description']?>
								</p>
							</div>
						</a>
					</li>
					<?php } ?>



					<!-- <li>
						<a href="javascript:;">
							<div class="pic_img clearfix">
							<div class=""></div>
								<img src="catalog/view/theme/default/img/wig6.jpg"/>
							</div>
							<div class="text clearfix">
								<p class="p1">Release time:2018-09-28</p>
								<p class="p2">
									There are Lace Front Wigs, 360 Lace Wigs 
									and Full/Whole Lace Wigs
								</p>
								<p class="p3">
									There are Lace Front Wigs, 360 Lace Wigs and Full/Whole Lace Wigs that all can be 
								</p>
							</div>
						</a>
					</li> -->

				</ul>
				
				<a class="more_a" href="javascript:;">VIEW MORE +</a>
			</div>
		</div>
		
		
<?php echo $footer; ?>
		
