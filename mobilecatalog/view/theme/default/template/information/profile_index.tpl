<?php echo $header; ?>
<div class="in_content clearfix"></div>
		<!--内容-->
		<div class="wig32 clearfix">
			<div class="bg_f clearfix">
				<div class="wig32_con clearfix">

					<div class="top">
						<p class="p1"><?php echo $information_fu?></p>
						<h1 class="bt_h1">
							<?php echo $title?>
						</h1>
						<?php if(empty($images) && empty($video)){ ?>
						<p class="top_p">
							<?php echo $meta_title?>
						</p>
						<?php } ?>
					</div>
					<div class="time">
						<span><?php echo $addtime?></span>
					</div>
					<div class="text clearfix">
						<!-- zhaopain -->
						<?php if($video){ ?>
						<div class="img_vd">
							<div class="bf_img"></div>
							<video id="top_video" poster="" src="<?php echo $video?>" height="100%" width="100%" style="display: block;"></video>
						</div>
						<?php }else{ ?>
						<div class="img_vd">
							<img src="<?php echo $images?>" alt="" />
						</div>
						<?php } ?>

						<div class="p_big clearfix">
						<?php echo $description?>
						</div>
						
						<?php if(!empty($images) || !empty($video)){ ?>
						<p class="p3 clearfix">
						<?php echo $meta_title?>
						</p>
						<?php } ?>

						<?php if($video){ ?>

						<p class="p2 p_img clearfix">
							<img src="<?php echo $simages?>"/>
						<?php }else{ ?>
						<p class="p2 clearfix">
						<?php } ?>
						<?php echo $meta_description?>
						</p>
						
						
					</div>
					
				</div>
			</div>
		</div>
		
<?php echo $footer; ?>
<script>
	$(function(){
		let str =$.trim($(".p_big").text())
		let one =str.slice(0,1);
		let str_text =  str.slice(1);
		$(".p_big").text(str_text);
		let app_text = "<style>.wig32 .wig32_con .p_big:before{content: '"+one+"';}</style>"
		$(".p_big").append(app_text);
		
	})
</script>

		
