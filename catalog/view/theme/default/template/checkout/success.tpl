<?php echo $header; ?>
<div class="in_content clearfix"></div>
    <!--内容-->
    <div class="pay">
      <div class="pay_text clearfix">
      
        <div class="text_1 clearfix">
          <h1>Two steps to place your order.</h1>
          <p class="lv_p">Order Number:<?=$order_number;?></p>
          <table class="pay_tb1">
                  <?php foreach ($totals as $key=> $total) { ?>
  <tr>
              <td><span><?=$total['title'];?></span></td>
              <td><span><?=$total['text'];?></span></td>
            </tr>
                             
                                      <?php } ?>
          
      
          </table>
        </div>      
        
        <div class="text2 clearfix">
          <h2>1.Please transfer to the following bank account</h2>
        <?=$bank;?>
        </div>
        
        <div class="text3 clearfix">
          <h2>2.Please upload the bank alert in 
            <span class="djs_p" title="2018/09/29 19:00:00">
              <span class="int_hour">00</span><i>:</i>
              <span class="int_minute">00</span><i>:</i>
              <span class="int_second">00</span>s
            </span>
          </h2>
          <div class="pd_div clearfix">
           <form id='batch' action="<?=$upload_receipt;?>" method="post" name="infoForm" enctype="multipart/form-data" onsubmit="return bitian();" >
           <div class="file_div">
              <input type="file" name="img" id="file" value="" title="上传照片" onchange="getphoto(this)" class="flie_in"/>
              <img class="file_img" src="/catalog/view/theme/default/img/png/icon_58_.png"/>
          
            </div>
            <div class="text_div">
              <img src="" alt="" />
              <div class="close" onclick="del_img($(this))"></div>
            </div>
            <p class="tsp_2" >Click to upload</p>
          </div>
          <p class="p_ts">Please click to upload</p>
          <input type="hidden" name="order_id" value="<?=$order_id?>" />
          <button class="sub_btn" type="submit">SUBMIT</button>
            </form>
          <p class="p_ts2">*We will check and confirmed your payment as soon as you submit</p>
        </div>
      </div>
    </div>
    
    

<?php echo $footer; ?>

<script>
  function bitian() {
    // alert($('#file').val());return false;
       var time_start = new Date().getTime(); //设定当前时间
         var endtime = $(this).prop("title");
         if (time_start>endtime) {alert("Over Time");return false;}

    if (!$('#file').val()) {alert("Can't be empty");return false;}
  }
    //调取上传框
      function getphoto(node) {
          var imgURL = "";
          try{
              var file = null;
              if(node.files && node.files[0] ){
                  file = node.files[0];
              }else if(node.files && node.files.item(0)) {
                  file = node.files.item(0);
              }
              try{
                  imgURL =  file.getAsDataURL();
              }catch(e){
                  imgRUL = window.URL.createObjectURL(file);
              }
          }catch(e){
              if (node.files && node.files[0]) {
                  var reader = new FileReader();
                  reader.onload = function (e) {
                      imgURL = e.target.result;
                  };
                  reader.readAsDataURL(node.files[0]);
              }
          }
          creatImg(imgRUL);
          $(".text_div").css("display","inline-block");
          $(".tsp_2").css("display","none");
          $(".file_div").css("display","none");
          return imgURL;
      }
   
    //上传选中的图片 显示页面
      function creatImg(imgRUL){
          $(".text_div img").attr("src",imgRUL);
      }
    
    //删除选中的图片
    function del_img(obj){
      obj.siblings("img").attr("src","");
      obj.parent().css("display","none");
      $(".file_div").css("display","block");
    }
    
    
    //倒计时
  function show_time() {
        $(".djs_p").each(function() {
            var endtime = $(this).prop("title");
            if (endtime>0) {
               var time_start = new Date().getTime(); //设定当前时间
            var time_end =endtime; //设定目标时间
            var time_distance = time_end - time_start;

            }else{


            var time_start = new Date().getTime(); //设定当前时间
            var time_end = time_start+(<?=$lest_time;?>*1000); //设定目标时间
            var time_distance = time_end - time_start;
             $(this).attr("title",time_end);
             }
            var timer;
            if (time_distance >= 0) {
                var int_day = Math.floor(time_distance / 86400000)
                time_distance -= int_day * 86400000;
                var int_hour = Math.floor(time_distance / 3600000)
                time_distance -= int_hour * 3600000;
                var int_minute = Math.floor(time_distance / 60000)
                time_distance -= int_minute * 60000;
                var int_second = Math.floor(time_distance / 1000)
                if (int_day < 10) {
                    int_day = "0" + int_day;
                }
                if (int_hour < 10) {
                    int_hour = "0" + int_hour;
                }
                if (int_minute < 10) {
                    int_minute = "0" + int_minute;
                }
                if (int_second < 10) {
                    int_second = "0" + int_second;
                }
                $(this).find(".int_day").text(int_day);
                $(this).find(".int_hour").text(int_hour);
                $(this).find(".int_minute").text(int_minute);
                $(this).find(".int_second").text(int_second);
            }else{
                clearInterval(timer);
                $(this).css("display","none");
              window.location.href="<?php echo $back ?>";
            }
        })
        timer = setTimeout("show_time()", 1000);
    }
    show_time();
</script>