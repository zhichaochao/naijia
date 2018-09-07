//rem.js
var fun = function (doc, win) {
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
        recalc = function () {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
            if(clientWidth>750){
            	clientWidth = 750;
            }
            if(clientWidth<=320){
            	clientWidth = 320;
            }
            docEl.style.fontSize =100* (clientWidth / 750) + 'px';
        };
    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
}
fun(document, window);

$(function(){
	 var win = $(window).width();
	//返回顶部
	$(document).scroll(function(){
        var top = $(document).scrollTop();
        if(top>100){
            $(".gg_nav").slideUp();   
        }else{
        	$(".gg_nav").slideDown();
        }
    });
	$('.xf_right .top').on('click',function (event) {
		event.preventDefault();
		$('html,body').animate({
		    scrollTop: 0
		}, 500);
	})
	
//	头部导航二级菜单
	$(".nav_ul>li").hover(function(){
		$(this).find("ol").stop().slideDown();
	},function(){
		$(this).find("ol").stop().slideUp();
	})
	
//	底部下拉
	$(".pc_fot .fot_ul1>li>h1").click(function(){
		if(win<=920){
			var img = $(this).find(".fot_img");
			if(img.hasClass("active")){
				img.removeClass("active");	
				$(this).siblings(".fot_ol").slideUp();
			}else{
				$(".pc_fot .fot_ul1 .fot_ol").slideUp();
				$(".pc_fot .fot_ul1 h1 .fot_img").removeClass("active");
				img.addClass("active");
				$(this).siblings(".fot_ol").slideDown();
			}
		
		}
	})

	
//	底部上滑隐藏下滑显示
	var y_start=0,y_end=0;
	$('body').on('touchstart',function(e) {
		y_start= e.originalEvent.targetTouches[0].pageY;
		x_start= e.originalEvent.targetTouches[0].pageX;
		
	})
	$("body").on("touchend", function(e) {       
    	y_end = e.originalEvent.changedTouches[0].pageY,
    	x_end = e.originalEvent.changedTouches[0].pageX,
    	X = x_end - x_start;
    	Y = y_end - y_start;
    	if(Y>1){
    		$(".yd_footer2").slideDown();
    	}else if(Y<-1){
    		$(".yd_footer2").slideUp();
    	}
    	
    	if(X < -100){
    		$(".yd_nav .yd_navul>li.kg_li").removeClass("active");
	   		$(".yd_nav_modal").animate({right:"100%"});
			$("body").css("overflow","");
    	}
	});
	
//	头部移动导航开关
var kg_off=0;
	$(".yd_nav .yd_navul>li.kg_li").click(function(event){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			$(".yd_nav_modal").animate({right:"100%"});
			$("body").css("overflow","");
			kg_off=0;
		}else{
			$(".gg_nav").slideUp();
			$(this).addClass("active");
			$(".yd_nav_modal").animate({right:"17%"});
			$("body").css("overflow","hidden");
			kg_off=1;
		}
		event.stopPropagation();
	})
	
	$("body").click(function(e){
		if(kg_off==1){
			var close = $('.yd_nav_modal .text'); 
		   	if(!close.is(e.target) && close.has(e.target).length === 0){
		   		$(".yd_nav .yd_navul>li.kg_li").removeClass("active");
		   		$(".yd_nav_modal").animate({right:"100%"});
				$("body").css("overflow","");
			}
	   }
	})
	
	
	$(".yd_nav_modal .top_nav .nav_p").click(function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			$(this).siblings(".yd_nav_ol").stop().slideUp();
		}else{
			$(".yd_nav_modal .top_nav .nav_p").removeClass("active");
			$(".yd_nav_modal .top_nav .yd_nav_ol").stop().slideUp();
			$(this).addClass("active");
			$(this).siblings(".yd_nav_ol").stop().slideDown();
		}
	})
	$(".yd_nav_modal .bot_fot h1").click(function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			$(this).siblings(".fot_ol").stop().slideUp();
		}else{
			$(".yd_nav_modal .bot_fot h1").removeClass("active");
			$(".yd_nav_modal .bot_fot h1 .fot_ol").stop().slideUp();
			$(this).addClass("active");
			$(this).siblings(".fot_ol").stop().slideDown();
		}
	})

//复选框
$(".xy_div input").click(function(){
	if($(this).hasClass("off")){
		$(this).removeClass("off");
		$(".xy_div .span1").css("display","block");
		$(".xy_div .span2").css("display","none");
	}else{
		$(this).addClass("off");
		$(".xy_div .span1").css("display","none");
		$(".xy_div .span2").css("display","block");
	}
})	
	
//搜索弹窗
$(".ss_modal .bg_f .close").click(function(){
	$(this).parents(".ss_modal").fadeOut();
	$("body").css("overflow","");
	$(".ss_modal .bg_f").animate({top:"100%"});
})
$(".nav .bot .search,.yd_nav .yd_navul>li.ss_li").click(function(){
	$(".gg_nav").slideUp();
	$(".ss_modal").fadeIn();
	$(".ss_modal .bg_f").animate({top:"0%"});
	$("body").css("overflow","hidden");
})
$(".ss_modal .con ul li i").click(function(){
	$(this).parents("li").remove();
})

$(".ss_modal .text label img.in_close").click(function(){
	$(this).siblings("input").val("");
})



	//替换图片
	if(win<=750){
	  $('.changeimage').each(function(){
	    $(this).attr('srcs',$(this).attr('data-mimage'));
	  })
	}else{
	  $('.changeimage').each(function(){
	    $(this).attr('srcs',$(this).attr('data-image'));
	  })
	}
	$(window).resize(function() {
		var win = $(window).width();
		if(win<=750){
          $('.changeimage').each(function(){
            $(this).attr('srcs',$(this).attr('data-mimage'));
          })
        }else{
          $('.changeimage').each(function(){
            $(this).attr('srcs',$(this).attr('data-image'));
          })
        }
	})
var lazyLoad = (function(){
	var clock;
	function init(){
		$(window).on("scroll", function(){
			if (clock) {
				clearTimeout(clock);
			}
			clock = setTimeout(function(){
				checkShow();
			}, 200);
		})
		checkShow();
	}
	function checkShow(){
		$("img.lazyLoad ").each(function(){
			var this_img =$(this);
			if(this_img.attr('isLoaded')){
        		return;
      		}
			if(shouldShow(this_img)){
				showImg(this_img);
			}
		})
	}
	function shouldShow(obj){
		var scrollH = $(window).scrollTop(),
			winH = $(window).height(),
			top = obj.offset().top;
		if(top < winH + scrollH){
	  		return true;
	  	}else{
	  		return false;
	  	}
	}
	function showImg(obj){
    	obj.attr('src', obj.attr('srcs'));
    	obj.attr('isLoaded', true);
	}
	return {
		init: init
	}
})()
lazyLoad.init();

})

