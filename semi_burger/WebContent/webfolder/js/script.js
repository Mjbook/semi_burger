$(function(){
	$('.main_top_slide').bxSlider({
		mode:'fade',
		controls:false,
		pause:4000,
		speed:1500,
		auto:true
	});
	$('.new_menu_slide').bxSlider({
		mode:'fade',
		controls:false,
		pause:4000,
		speed:1500,
		auto:true
	});
	$('.main_notice').bxSlider({
		//mode:'fade',
		controls:false,
		pause:4000,
		speed:1500,
		auto:true
	});

	$Gnb =  $('#gnb > ul >li,.menu_bg');
	$gnb = $('#gnb > ul >li');
	$gnb_bg = $('.menu_bg');
	$Gnb.on({
		'mouseover':function(){			
			$gnb_bg.height(250);
			$gnb.find('ul').addClass('active');
		},
		'mouseout':function(){			
			$gnb.find('ul').removeClass('active');
			$gnb_bg.height(0);
		}
	})
	/*
	$Gnb.on({
		'mouseover':function(){			
			$gnb_bg.stop().animate({height:250},100);
			$gnb.find('ul').addClass('active');
		},
		'mouseout':function(){			
			$gnb.find('ul').removeClass('active');
			$gnb_bg.stop().animate({height:2},100);
		}
	})
	*/
	var menu_title,menu_des,menu_img;
	$('.menu_thms > ul > li > a').on('click',function(e){
		e.preventDefault();
		menu_title =  $(this).find('span').text();
		menu_des = $(this).data('des');
		menu_img = $(this).data('bigimg');
		console.log(menu_title,menu_des,menu_img);
		$('#wrapper').addClass('is_pop').append('<div class="popup_backbg"><div class="pop_area"><a class="close_btn"></a><div class="img_area"><img src="../images/big_' + menu_img + '.jpg" alt=""/></div><div class="text_area"><h4>' + menu_title +'</h4><p>' + menu_des + '</p></div></div></div>');
	})
	$(document).on('click','.pop_area .close_btn',function(){
		$('.popup_backbg').remove();
		$('#wrapper').removeClass('is_pop');
	})
})