
// 메인 비주얼 영역
function mainvisualHeight(){
	var topnoticeH = 0;
	var topmainlinkH = $('.mainquick-link:visible').outerHeight();
	if($('.topnotice-wrap:visible').length) {
		var topnoticeH = $('.topnotice-wrap:visible').innerHeight();
	}
	var visualH = $(window).height() - topnoticeH - topmainlinkH;
	$('.visual-wrap, .visual-inwrap').css({
		'min-height': visualH
	});
}

function mainimgChange(){
	
	$('.visual-wrap').vegas({
		//shuffle: true,
		timer: false,
		firstTransition: 'fade',
    	firstTransitionDuration: 5000,

		slides: [
			
			{ src: '../../images/bg_01.png' },
			{ src: '../../images/bg_01.png' }
		],
		transition: 'fade2',
		transitionDuration: 5000,
		animation: 'random',
		//animation: 'kenburns',
		walk: function (index, slideSettings) {
			//console.log("Slide index " + index + " image " + slideSettings.src);
			if(index==1){
				$('body').addClass('main-bg02');
			}else{
				$('body').removeClass('main-bg02');
			}
		}
	});
	$('.mainsearch-wrap .fe-input input').on('focusin', function(e){
		$('.visual-wrap').vegas('pause');
	});
	$('.mainsearch-wrap .fe-input input').on('focusout', function(e){
		$('.visual-wrap').vegas('play');
	});
}

// 상단 알림영역
function topnoticef(){
	$('.btn-ntclose').on('click', function(e){
		$('.topnotice-wrap').hide();
		mainvisualHeight();
	});
};

//로고 슬라이드
function logoslick(type){
	$(type).slick({
		slidesToShow: 5,
  		slidesToScroll: 5,
		dots:false,
		arrows: true,
		infinite: true,
		autoplay: true,
		pauseOnFocus:true,
		pauseOnHover:true,
		autoplaySpeed: 4000,
		speed : 1000,
		responsive: [
			{ breakpoint: 1200, 
			  settings: {
				slidesToShow: 4,
				slidesToScroll: 4
			}},
			{ breakpoint: 900, 
				settings: {
				  slidesToShow: 3,
				  slidesToScroll: 3
			  }},
			{ breakpoint: 600, 
			  settings: {
				slidesToShow: 2,
				slidesToScroll: 2
			  }
			},
			{ breakpoint: 430, 
				settings: {
				  slidesToShow: 1,
				  slidesToScroll: 1
				}
			  }
		]
	});
};

//data catalog
function counterf(){
	$('.dclogslide-txt').find('.num-k, .num-j').each(function () {
		$(this).prop('Counter',0).animate({
			Counter: $(this).text()
		}, {
			duration: 3000,
			easing: 'swing',
			step: function (now) {
				$(this).text(Math.ceil(now));
			}
		});
	});
}

function dclogslick(){
	var slidediv = $('.dclogslide-for');
	var slidenav = $('.dclogslide-nav').find('button');
	var txtdiv = $('.dclogslide-txt');
	var enableNav = true; //클릭하여 내비게이션 이동 허용 여부(슬라이드 동작 중 클릭되는 것을 방지)
	var speed = 1000;//슬라이드 속도
	//counterf();

	slidediv.on('beforeChange', function(event, slick, currentSlide, nextSlide){ //슬라이드 변경 시 내비 변경
		if(enableNav){
			slidenav.parent('li').removeClass('on');
			slidenav.parent('li').eq(nextSlide).addClass('on');
			var currentTit = $('.dclogslide-for .item').eq(nextSlide).find('.tit').html();
			var currentNumk = $('.dclogslide-for .item').eq(nextSlide).find('.num-k').text();
			var currentNumj = $('.dclogslide-for .item').eq(nextSlide).find('.num-j').text();
			txtdiv.find('.tit').html(currentTit);
			txtdiv.find('.num-k').text(currentNumk);
			txtdiv.find('.num-j').text(currentNumj);
			//counterf();
			navStatus();
			if(nextSlide == 0 || nextSlide == 1 || nextSlide == 2){
				txtdiv.addClass('txtbr');
			}else{
				txtdiv.removeClass('txtbr');
			}
		}
	});

	function navStatus(){ //슬라이드 동작 중 내비클릭 방지
		enableNav = false;
		setTimeout(function() {
		enableNav = true;
		}, speed);
	}

	slidenav.on('click', function(){ //내비 클릭시 해당 인덱스로 이동
		if(enableNav){
		var slideNo = $(this).parent('li').index();
		slidediv.slick('slickGoTo', slideNo);
		slidenav.parent('li').removeClass('on');
		$(this).parent('li').addClass('on');
		navStatus();
		}
	});

	
	slidediv.slick({
		slidesToShow: 1,
  		slidesToScroll: 1,
		dots:true,
		arrows: true,
		infinite: true,
		autoplay: false,
		pauseOnFocus:true,
		pauseOnHover:true,
		fade: true,
		autoplaySpeed: 4000,
		speed : 1000,
		appendDots: $('.dclogslide-dot'),
		prevArrow: '.dclogslide-prev',
		nextArrow: '.dclogslide-next',
	});

	slidenav.on('mouseover , focusin', function(){ 
		slidediv.slick('slickPause');
	});

	slidenav.on('mouseout , focusout', function(){ 
		slidediv.slick('slickPlay');
	});
};

//질환별 data 현황
function datatypeslide(type){
	$(type).slick({
		slidesToShow: 8,
  		slidesToScroll: 8,
		dots:false,
		arrows: true,
		infinite: true,
		autoplay: false,
		autoplaySpeed: 4000,
		speed : 1000,
		responsive: [
			{ breakpoint: 1550, 
				settings: {
				  slidesToShow: 7,
				  slidesToScroll: 7
			  }},
			{ breakpoint: 1400, 
			  settings: {
				slidesToShow: 6,
				slidesToScroll: 6
			}},
			{ breakpoint: 1200, 
				settings: {
				  slidesToShow: 7,
				  slidesToScroll: 7
			  }},
			{ breakpoint: 1000, 
				settings: {
				  slidesToShow: 6,
				  slidesToScroll: 6
			  }},
			{ breakpoint: 600, 
			  settings: {
				slidesToShow: 3,
				slidesToScroll: 3
			  }
			}
		]
	});
};


function datatypef(){
	$('.datatype-tabul li a').on('click', function(e){
		var indexnum= $(this).parent().index();
		var target = $(this).attr('href');
		var targetsb = $(this).parent().siblings();
		var txtdiv = $('.datatype-txt');
		
		targetsb.each(function(){
			$(this).removeClass('on');
		});
		$(this).parent().addClass('on');
		targetsb.each(function(){
			var target2 = $(this).find('a').attr('href');
			$(target2).hide();
		});
		$(target).show();
		e.preventDefault();
		var currentTit = $('.datatype-tabcon').eq(indexnum).find('.tit').text();
		var currentNumk = $('.datatype-tabcon').eq(indexnum).find('.num-all').text();
		var currentNumj = $('.datatype-tabcon').eq(indexnum).find('.num-allj').text();
		txtdiv.find('.tit').text(currentTit);
		txtdiv.find('.num-k').text(currentNumk);
		txtdiv.find('.num-j').text(currentNumj);
		if(indexnum == 3){
			txtdiv.find('.type-j').show();
			
		}else{
			txtdiv.find('.type-j').hide();
		}
		$('#datalist-ul0'+(indexnum+1)).slick('slickPlay');
		$('#datalist-ul01, #datalist-ul02, #datalist-ul03, #datalist-ul04').slick('setPosition');
		//$('#datalist-ul01, #datalist-ul02, #datalist-ul03, #datalist-ul04').slick('slickGoTo', 0);
	});
}


$(function() {	
	setTimeout( function() {
		mainvisualHeight();
    }, 100);
	
	topnoticef();
	logoslick('#logoslide01, #logoslide02');
	$('.network-wrap .tab-type01 a').on('click', function(e){
		$('#logoslide01, #logoslide02').slick('setPosition');
	});
	datatypeslide('#datalist-ul01, #datalist-ul02, #datalist-ul03, #datalist-ul04');
	
	mainimgChange();
	dclogslick();
	datatypef();
	
});


$(window).resize(function(){
	mainvisualHeight();

	
});

$(window).scroll(function(){
	var winSCT = $(this).scrollTop();

	//비주얼 검색영역 모션
	setTimeout( function() {
		if($('.main-wrap .visual-wrap:visible').length) {
			var visualH = $(this).outerHeight();
			if(winSCT > visualH){
				$('.se-inbox').hide();
			}else{
				$('.se-inbox').show();
			}
		}
    }, 100);
});
  