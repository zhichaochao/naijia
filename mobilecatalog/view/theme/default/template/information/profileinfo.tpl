<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="wig32 clearfix">
      <div class="bg_f clearfix">
        <div class="wig32_con clearfix">
          <div class="top">
            <p class="p1"><?php echo $categoryinfo?></p>
            <h1 class="bt_h1"><?php echo $title?></h1>
            <?php if(empty($pcimages) && empty($video) ){?>
              <p class="top_p">
               <?php echo $meta_description?>
              </p>
            <?php } ?>
          </div>
          <div class="time">
            <span><?php echo $addtime?></span> </div>
          <div class="text clearfix">
            <div class="img_vd">
            <?php if(!empty($pcimages)&& empty($video)){?>
              <div class="img_vd"><img src="<?php echo $pcimages?>" alt="" /></div>
            <?php } ?>
            <?php if(!empty($video)){?>
               <div class="bf_img"></div>
                <video id="top_video" poster="" src="<?php echo $video?>" height="100%" width="100%" style="display: block;"></video>
              </div>
            <?php }?>
              <div class="p_big clearfix">
               <?php echo $description?>
              </div>
            <!-- meiyou zhaipian  -->
           <!--  <p class="p3 clearfix">
              "Baby talk may sound silly to us, but not to your child. 
              It actually helps develop their brain. But as it turns out, dads 
              don’t speak baby talk as much as moms
            </p> -->
            <!--  -->
          <?php if(!empty($video)){?>
          <p class="p2 clearfix p_img"> <img src="<?php echo $pcimages?>"/><?php echo $meta_description?> </p>
          <?php } ?>
          <?php if(!empty($pcimages) && empty($video)){?>
            <p class="p2 clearfix">
             <?php echo $meta_description?>
            </p>
          <?php } ?>
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

    //    播放视频
    var top_video = document.getElementById("top_video");
    $(".img_vd .bf_img").click(function(){
      $(this).css("display","none");
      document.getElementById("top_video").play();
      $(this).siblings("video").attr("controls","controls");
    });
    
  })
</script>

