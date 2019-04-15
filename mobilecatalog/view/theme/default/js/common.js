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
	var DivScroll = function( layerNode ){
		//如果没有这个元素的话，那么将不再执行下去
		if ( !document.querySelector( layerNode ) ) return ;
		this.popupLayer = document.querySelector( layerNode ) ;
		this.startX = 0 ;
		this.startY = 0 ;
		this.popupLayer.addEventListener('touchstart', function (e) {
			this.startX = e.changedTouches[0].pageX;
			this.startY = e.changedTouches[0].pageY;
		}, false);
		// 仿innerScroll方法
		this.popupLayer.addEventListener('touchmove', function (e) {
			e.stopPropagation();
			var deltaX = e.changedTouches[0].pageX - this.startX;
			var deltaY = e.changedTouches[0].pageY - this.startY;
			// 只能纵向滚
			if(Math.abs(deltaY) < Math.abs(deltaX)){
				e.preventDefault();
				return false;
			}
			if( this.offsetHeight + this.scrollTop >= this.scrollHeight){
				if(deltaY < 0) {
					e.preventDefault();
					return false;
				}
			}
			if(this.scrollTop === 0){
				if(deltaY > 0) {
					e.preventDefault();
					return false;
				}
			}
		// return false;
		},false);
	}
	//调用
	var divScroll = new DivScroll('.khpj_midal .text');
	var divScroll2 = new DivScroll('.ss_modal .text');
	var divScroll3 = new DivScroll('.con_modal');
	var divScroll4 = new DivScroll('.text .con');
	var divScroll5 = new DivScroll('.vip_modal .text');
		
	//获取焦点隐藏textarea的提示文本
	$("textarea").focus(function(){
		$(this).attr("placeholder","");
	})
	
	var win = $(window).width();
	$(document).scroll(function(){
        var top = $(document).scrollTop();
        if(top>5){
            $(".gg_nav").slideUp(); 
        }else{
        	$(".gg_nav").slideDown();
        }
    });
    
	/**点击添加class/取反**/
	$(".add_class").click(function(){
		$(this).toggleClass("active")
	})
	//头部文字轮播
	setInterval(function(){
        $(".gg_nav ul").append("<li>"+$('.gg_nav ul>li').eq(0).html()+"</li>");
        $(".gg_nav ul").animate({"top":"-0.5rem"},function(){
        	$('.gg_nav ul>li').eq(0).remove();
        	$(".gg_nav ul").css("top","0");
        })
    }, 2000)
	
//	打开contact	的弹窗
	$(".ol_ydfot .contact").click(function(){
		$(".con_modal").fadeIn();
		$("body").css("overflow","hidden");
	})
	//	关闭contact	的弹窗
	$(".con_modal").click(function(e){
		var close = $('.con_modal .text,.con_modal .context'); 
	   	if(!close.is(e.target) && close.has(e.target).length === 0){
	   		$(".con_modal").fadeOut();
			$("body").css("overflow","");
		}
	})
	
//	打开contact的email的弹窗
	$(".con_modal .con_email").click(function(){
		$(".con_modal .context").fadeIn();
	})
	
	//关闭contact的email的弹窗
	$(".con_modal .context .close").click(function(){
		$(this).parent().fadeOut();
	})
	
	
//	头部移动导航开关
var kg_off=0;
	$(".yd_nav .yd_navul>li.kg_li").click(function(event){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			$(".gg_nav").slideDown();
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
	
	$(".yd_nav_ol.li_i").siblings(".li_p1").css("display","none");
	$(".yd_nav_ol.li_i").siblings(".li_p2").css("display","block");
	
	
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

//$(".ss_modal i.del").click(function(){
//	$(this).parents("h1").siblings(".ls_ul").remove();
//})

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
	$("img.lazyLoad ").each(function(){
		$(this).attr("src","/image/yjz.jpg");  
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





/**弹窗提示**/
function tips(tips_text,img,time){
	if(img==""){
		img='mr'
	}
	var text =
			'<div class="popup_tips clearfix">'
				+'<div class="text clearfix">'
					+'<div class="top '+img+' clearfix">'
						+'<span></span>'
					+'</div>'
					+'<p>'+tips_text+'</p>'
				+'</div>'
			+'</div>'
	$("body").append(text);
	let tips_w = $(".popup_tips .text").width();
	$(".popup_tips .text").css("margin-left",-tips_w/2+"px");
	setTimeout(function(){
		$(".popup_tips").fadeOut();
	},time);
}

