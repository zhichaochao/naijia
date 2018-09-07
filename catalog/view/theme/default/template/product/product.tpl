<?php echo $header; ?>
<!--内容-->
    <div class="in_content clearfix"></div>
    
    <div class="pro_det clearfix">
      <div class="content">
        <div class="img_lf">
          <div class="top time" title="2018/10/05 10:06:00">
            <p>Save 15% on your order - Use code: NAIJABEAUTY Apply</p>
            <p>Sales end in 
              <span class="int_day">00</span>:
              <span class="int_hour">00</span>:
              <span class="int_minute">00</span>:
              <span class="int_second">00</span>
            </p>
          </div>
          
          <ul class="img_ul clearfix">
            <li><img src="img/pro_det1.jpg"/></li>
            <li><img src="img/pro_det2.jpg"/></li>
            <li><img src="img/pro_det2.jpg"/></li>
            <li><img src="img/pro_det1.jpg"/></li>
            <li><img src="img/pro_det1.jpg"/></li>
            <li><img src="img/pro_det2.jpg"/></li>
          </ul>
        </div>
        
        <div class="text_rf">
          <div class="top">
            <h1>ILLUSION FRONTAL KKS WIG</h1>
            <p class="p1">
              It has the natural appearance of scalp wherever the hair is seperated, 
              and imitates most sucessfully the natural movement of real hair. They 
              are virtually undetectable and can be worn in a variety of styles 
              including a high ponytail or updo.
            </p>
            <em class="em1">₦100k - ₦120K</em>
            <div class="price">
              <span class="red_span">44%OFF</span>
              <em class="em2">₦54K- ₦66k</em>
            </div>
          </div>
          
          <div class="quantity number">
            <span>Quantity :</span>
            <input type="text" class="num_in" value="1" />
            <div class="num_rf">
              <em class="add"><i></i></em>
              <em class="sub"><i></i></em>
            </div>
            <p>This hair need  3-7 customize process days</p>
          </div>
          
        </div>
        
        
        
      </div>
    </div>
<?php echo $footer; ?>
<script>
  $(function(){
    //动态改变头部红色广告条的宽度
    var p_win = 100/parseInt($(".time>p").length);
    $(".pro_det .img_lf .time>p").css("width",p_win+"%");
    
    //数量加减
    $(".number .add").click(function(){
      var num_val = $(".number .num_in").val();
      num_val++;
      $(".number .num_in").val(num_val);
    })
    $(".number .sub").click(function(){
      var num_val = $(".number .num_in").val();
      if(num_val>1){
        num_val--;
        $(".number .num_in").val(num_val);
      }
    })
    
  })
  
  //倒计时
  function show_time() {
        $(".time").each(function() {
            var endtime = $(this).prop("title");
            var time_start = new Date().getTime(); //设定当前时间
            var time_end = new Date(endtime).getTime(); //设定目标时间
            var time_distance = time_end - time_start;
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
            }
        })
        timer = setTimeout("show_time()", 1000);
    }
    show_time();
</script>
