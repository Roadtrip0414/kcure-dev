
function devicef(){
	var varUA = navigator.userAgent.toLowerCase();

	function detectIE() {
		var ua = window.navigator.userAgent;
		var msie = ua.indexOf('MSIE ');
		if (msie > 0) {
			// IE 10 or older => return version number
			return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
		}

		var trident = ua.indexOf('Trident/');

		if (trident > 0) {
			// IE 11 => return version number
			var rv = ua.indexOf('rv:');
			return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
		}

		var edge = ua.indexOf('Edge/');
		if (edge > 0) {
		   // Edge (IE 12+) => return version number
		   return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
		}
		// other browser
		return false;
	}

	// user agent
	if (varUA.match('android') != null) {
		$('body').addClass('mobile android');
	  } else if (varUA.indexOf('iphone')>-1||varUA.indexOf('ipad')>-1||varUA.indexOf('ipod')>-1) {
		$('body,html').addClass('mobile iphone');
	  } else if (!detectIE() && (varUA.match('mobile') != null || varUA.match('tablet') != null ||varUA.match('phone') != null) ) {
		$('body').addClass('mobile');
	  } else {
		//아이폰, 안드로이드 외 처리

	  }
}

//gnb
function gnbf(){
	var tagHeader	=	$('#header');
	var tagGnb	=	$('.gnb');
	var	taggnbLi	=	$('.gnb > li');
	var	taggnbLidep02	=	$('.gnb .submenu-wrap a');
	var	taggnbLidep03	=	$('.munu-depth01 > li > a')
	var	lastLst	=	$(this).find('.gnb > li:last-child li');
	taggnbLi.each(function(){
		var tagDepth01 = $(this).find('.a-depth01 a');
		tagDepth01.on('mouseenter , focusin',function(){
			var thisList = $(this).parents("li");
			var lindex = thisList.index();
			taggnbLidep03.parent('li').removeClass('on');
			taggnbLi.removeClass('on');
			thisList.addClass('on');
			tagHeader.addClass('header-on');
		});

		if(lastLst.length > 0){
			$(this).find('.munu-depth01 > li:last-child ul > li:last-child').focusout(function(){
				taggnbLi.removeClass('on');
				tagHeader.removeClass('header-on');
			});
		} else {
			$(this).find('.munu-depth01 > li:last-child').focusout(function(){
				taggnbLi.removeClass('on');
				tagHeader.removeClass('header-on');
			});
		}
	});
	taggnbLidep02.each(function(){
		$(this).on('mouseenter , focusin',function(){
			taggnbLi.removeClass('on');
			$(this).parents('.submenu-wrap').parents('li').addClass('on');
		});
	});
	taggnbLidep03.each(function(){
		$(this).on('mouseenter , focusin',function(){
			taggnbLidep03.parent('li').removeClass('on');
			$(this).parent('li').addClass('on');
		});
	});
	$(tagGnb).on('mouseleave',function(){
		taggnbLidep03.parent('li').removeClass('on');
		taggnbLi.removeClass('on');
		tagHeader.removeClass('header-on');
	});
}

//layer popup
function layerOpen(type){
	$(type).addClass('pop-on');
	$('body').addClass('body-noscroll');
	setTimeout( function() {
        $(type).attr('tabindex', 0).focus();
    }, 50);
	var heightCalc = function(){
		var pHeaderHeight = 0;
		var pFooterHeight = 0;
		var winHeight = $(window).height();

		// 팝업 타이틀 높이값 체크
		if($(type).find('.laypop-head').length) {
			var pHeaderHeight = $(type).find('.laypop-head').innerHeight();
		}
		// 팝업 하단 높이값 체크
		if($(type).find('.laypop-foot').length) {
			var pFooterHeight = $(type).find('.laypop-foot').innerHeight();
		}
		var popHeight = winHeight - pHeaderHeight - pFooterHeight -40;
		$(type).find('.laypop-body').css({
			'max-height': popHeight
		});
	}
	heightCalc();
	$(window).resize(function(){
		heightCalc();
	});
}

function layerClose(type, clickBtn){
	var layerNum = $('.layerpop-wrap:visible').length;
	$(type).removeClass('pop-on');
	$(clickBtn).focus();
	if(layerNum < 2){
		$('body').removeClass('body-noscroll');
	}
}

//tab
function tabonoff(){
    $('.tab-type01 a, .tab-type02 a, .tab-type03 a, .subtop-tab a').on('click', function(e){
        var targetsb = $(this).parent().siblings();
        targetsb.each(function(){
            $(this).removeClass('on');
        });
        $(this).parent().addClass('on');
        /*var partag = $(this).parents('.mo-scrolltab');
        moscrolltab(partag);*/
    });
}
function tabView(){
    $('.tabview-link').on('click', function(e){
        var target = $(this).attr('href');
        var targetsb = $(this).parent().siblings();
        targetsb.each(function(){
            var target2 = $(this).find('.tabview-link').attr('href');
            $(target2).hide();
        });
        $(target).show();
        e.preventDefault();
    });
};
function moscrolltab(type){
    var tab_idx = 0;

    if( $(type).length > 0 ){
        $(type).each(function(){
            $(this).find('li').each(function(index){
                if($(this).hasClass("on"))
                tab_idx = index;
            });
			if(tab_idx == 0 || tab_idx == 1){
				$(this).scrollLeft(0);
			}else{
				var tab_left = $(this).find('li').eq(tab_idx).offset().left;
            	$(this).scrollLeft(tab_left);
			}
        });
    }
}

// tooltip
function tooltipf(){
    $('.tooltip-wrap .btn-tipview').off('click').click(function(){
        if($(this).parents('.tooltip-wrap').is('.on')){
            $(this).parents('.tooltip-wrap').removeClass('on');
        }else{
            $('.tooltip-wrap').removeClass('on');
            $(this).parents('.tooltip-wrap').addClass('on');
        }
        toolpositionf();
    });
    $(document).click(function(e){
        if(!$(e.target).hasClass('btn-tipview') && !$(e.target).hasClass('tip-box')){
            $('.tooltip-wrap').removeClass('on');
        }
    });
}
function toolpositionf(){
    var winWidth = $(window).width();
    var target = $('.tooltip-wrap');
    target.each(function(){
        // left 위치 값  변경
        var toolWidth = $(this).find('.tip-box').outerWidth();
        var offsetlNum = $(this).offset().left;
        var gapNum = winWidth - (offsetlNum + toolWidth);
        if (offsetlNum > (winWidth - toolWidth)){
            $(this).find('.tip-box').css('left', gapNum - 20);
        }else{
            $(this).find('.tip-box').css('left', 0);
        }

        // top 위치 값
        var offsettNum = $(this).offset().top;
        var dHeight = $(document).height();
        if(offsettNum > (dHeight * 0.7)){
            $(this).addClass('uptop');
        }else{
            $(this).removeClass('uptop');
        }
    });
}

// 관련사이트
function siteopenf(){
	$('.btn-sopen').on('click', function(){
		if($(this).is('.on')){
			$(this).removeClass("on");
            $(this).parents('.footer-site').removeClass("open");
        }else{
			$(this).addClass("on");
            $(this).parents('.footer-site').addClass("open");
        }
	});
}

// top 버튼
function wintopf(){
	$('.btn-wintop').on('click', function(){
		$('html').animate({
			scrollTop: 0
			}, 100);  // 탑 이동 스크롤 속도
		return false;
	});
}

// 화면 확대 축소
function zoomControl() {
	var txtNum = 1;
	var	btnPlus = $('.sccontrol-box .zoom-plus');
	var	btnMinus = $('.sccontrol-box .zoom-minus');
	var btnReset = $('.sccontrol-box .zoom-reset');
	var	bd = $('body');

	btnPlus.click(function () {
		txtNum = txtNum + 0.1;
		if (txtNum > 1.4) {
			alert('더이상증가할수없습니다');
			return;
		}
		bd.css({
			'transform-origin': '50% 0'
			, 'transform': 'scale(' + txtNum + ')'
		});
	});

	btnMinus.click(function () {
		txtNum = txtNum - 0.1;

		if (txtNum < 1) {
			alert('더이상감소할수없습니다');
			return;
		}
		bd.css({
			'transform-origin': '50% 0'
			, 'transform': 'scale(' + txtNum + ')'
		});
		if(txtNum == 1){
			bd.css({
				'transform': 'none'
			});
		}
	});

	/*btnReset.click(function () {
		txtNum = 1;
		bd.css({
			'transform': 'scale(1)'
		});
		setTimeout( function() {
			bd.css({
				'transform': 'none'
			});
		}, 100);
	});*/
}

// role button keyboard
function rolebuttonf(){
	$('li[role="button"]').on('keydown', function(e){
		const keyD = e.key !== undefined ? e.key : e.keyCode;
		// e.key && e.keycode have mixed support - keycode is deprecated but support is greater than e.key
		// I tested within IE11, Firefox, Chrome, Edge (latest) & all had good support for e.key

		if ( (keyD === 'Enter' || keyD === 13) || (['Spacebar', ' '].indexOf(keyD) >= 0 || keyD === 32)) {
		// In IE11 and lower, e.key will equal "Spacebar" instead of ' '

		// Default behavior is prevented to prevent the page to scroll when "space" is pressed
		//e.preventDefault();
		this.click();
		}
	});
}

// animation motion
function setVisible(type){
	if( $(type).length > 0 ){
		var stdPos = $(window).scrollTop() + $(window).height();
		$(type).each(function(){
			if( stdPos >  $(this).offset().top ){
				$(this).addClass('on');
				if($(this).parent().is('.dclog-wrap')){
					setTimeout( function() {
						$('.dclogslide-for').slick('slickPlay');
					}, 100);
				}
			}
		});
	}
}
// table scroll
function tblscf(){
	var boxwrap = $('.tbl-inbox');
	boxwrap.each(function(){
		$(this).on("scroll", function(){
			var leftNum = $(this).scrollLeft();
			$(this).find("thead, tfoot").css("left",-leftNum);
		});
	});
}

// location menu
function locationmenuf(){
	$('.location .lt-openmenu').off('click').on('click', function(){
		if($(this).is('.on')){
			$(this).removeClass("on");
            $(this).parents('.location').removeClass("open");
        }else{
			$(this).addClass("on");
            $(this).parents('.location').addClass("open");
        }
		return false;
	});
}

// 왼쪽 선택영역
function subleftf(){
	$('.subleft-top .btn-datailview').off('click').on('click', function(){
		if($(this).is('.on')){
			$(this).removeClass("on");
			$('.subleft-bot').hide();
        }else{
			$(this).addClass("on");
            $('.subleft-bot').show();
        }
	});
}

// 테이블 더보기
function tblviewf(){
	$('.tbl-wrap .btn-datailview').off('click').on('click', function(){
		if($(this).is('.on')){
			$(this).removeClass("on");
			$(this).parents('.tbl-wrap').removeClass('open');
        }else{
			$(this).addClass("on");
            $(this).parents('.tbl-wrap').addClass('open');
        }
	});
}

// faq list
function faqlistf(){
	$('.faqlist .btn-faq').off('click').on('click', function(){
		if($(this).is('.on')){
			$(this).removeClass("on");
			$(this).parents('li').find('.answer-box').slideUp();
			$(this).find('.blind').text('답변열기');
        }else{
			$(this).addClass("on");
            $(this).parents('li').find('.answer-box').slideDown();
			$(this).find('.blind').text('답변닫기');
        }
		return false;
	});
}

// 데이터 모델
function datamodelf(){
	var linktag  = $('.datamodeltool .alink')
	linktag.each(function(){
		$(this).on('mouseenter , focusin',function(){
			$(this).find('.detail-box').show();
		});
		$(this).on('mouseleave , focusout',function(){
			$(this).find('.detail-box').hide();
		});
		var offsettNum = $(this).offset().top;
        var dHeight = $(document).height();
        if(offsettNum > (dHeight * 0.6)){
            $(this).addClass('uptop');
        }else{
            $(this).removeClass('uptop');
        }
	});
}

//안심활용센터 소개 > 데이터 제공기관
function offerslidef(){
	$('.offerslide-inbox').slick({
		slidesToShow: 4,
  		slidesToScroll: 4,
		dots:false,
		arrows: true,
		infinite: true,
		autoplay: false,
		pauseOnFocus:true,
		pauseOnHover:true,
		autoplaySpeed: 4000,
		speed : 1000,
		responsive: [

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
}

//안심활용센터 소개 > 센터이미지
function centerimgslidef(){
	var slidediv = $('.centerimg-slide');
	var slidenav = $('.centerimg-nav').find('a');
	var enableNav = true; //클릭하여 내비게이션 이동 허용 여부(슬라이드 동작 중 클릭되는 것을 방지)
	var speed = 1000;//슬라이드 속도

	slidediv.on('beforeChange', function(event, slick, currentSlide, nextSlide){ //슬라이드 변경 시 내비 변경
		if(enableNav){
			slidenav.parent('div').removeClass('on');
			slidenav.parent('div').eq(nextSlide).addClass('on');
			navStatus();
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
		var slideNo = $(this).parent('div').index();
		slidediv.slick('slickGoTo', slideNo);
		slidenav.parent('div').removeClass('on');
		$(this).parent('div').addClass('on');
		navStatus();
		}
		return false;
	});

	slidediv.slick({
		slidesToShow: 1,
  		slidesToScroll: 1,
		fade: true,
		dots:false,
		arrows: false,
		infinite: true,
		autoplay: false,
		//pauseOnFocus:true,
		//pauseOnHover:true,
		//autoplaySpeed: 4000,
		speed : 1000

	});
}

//안심활용센터 소개 > 센터 상세보기
function centerscrollf(){
	$('.datacenter-location .btn-box a').on('click', function(){
		var offset = $(".datacenter-infor").offset();
		$("html, body").animate({scrollTop: offset.top - 100},400);
		return false;
	});
}

// 트리 메뉴
function treemenuf(){
	var tNav = $('.tNav');
	var tNavPlus = '\<button type=\"button\" class=\"tNavToggle plus\"\>+\<\/button\>';
	var tNavMinus = '\<button type=\"button\" class=\"tNavToggle minus\"\>-\<\/button\>';
	tNav.find('li>ul').css('display','none');
	tNav.find('ul>li:last-child').addClass('last');
	tNav.find('li>ul:hidden').parent('li').prepend(tNavPlus);
	tNav.find('li>ul:visible').parent('li').prepend(tNavMinus);
	tNav.find('li.active').addClass('open').parents('li').addClass('open');
	tNav.find('li.open').parents('li').addClass('open');
	tNav.find('li.open>.tNavToggle').text('-').removeClass('plus').addClass('minus');
	tNav.find('li.open>ul').slideDown(100);
	$('.tNav .tNavToggle').click(function(){
		t = $(this);
		t.parent('li').toggleClass('open');
		if(t.parent('li').hasClass('open')){
			t.text('-').removeClass('plus').addClass('minus');
			t.parent('li').find('>ul').slideDown(100);
		} else {
			t.text('+').removeClass('minus').addClass('plus');
			t.parent('li').find('>ul').slideUp(100);
		}
		return false;
	});
	$('.tNav a').click(function(){
		t = $(this);
		t.parent('li').toggleClass('open');
		if(t.parent('li').hasClass('open')){
			t.prev('button.tNavToggle').text('-').removeClass('plus').addClass('minus');
			t.parent('li').find('>ul').slideDown(100);
		} else {
			t.prev('button.tNavToggle').text('+').removeClass('minus').addClass('plus');
			t.parent('li').find('>ul').slideUp(100);
		}
		return false;
	});

	$('.tNav-control .btn-allopen').click(function(){
		tNav.find('li').each(function(){
			$(this).addClass('open');
			$(this).find('ul').slideDown(100);
			$(this).find('.tNavToggle').text('-').removeClass('plus').addClass('minus');
		});
	});
	$('.tNav-control .btn-allclose').click(function(){
		tNav.find('li').each(function(){
			$(this).removeClass('open');
			$(this).find('ul').slideUp(100);
			$(this).find('.tNavToggle').text('+').removeClass('minus').addClass('plus');
		});
	});
}

// common
function commonf(){
	tabView(); //tab
	tabonoff(); //tab
	moscrolltab('.mo-scrolltab'); //스크롤 탭 위치
	tooltipf(); // tooltip
	tblscf();// table scroll
	subleftf(); // 왼쪽 선택영역
	tblviewf(); // 테이블 더보기
	faqlistf(); //faq list
}

$(function() {
	devicef(); // device 구분
	gnbf(); // gnb
	siteopenf(); // 관련사이트
	wintopf(); // top 버튼
	zoomControl(); // 화면 확대 축소
	locationmenuf(); // location menu
	datamodelf(); //데이터 모델
	offerslidef(); //안심활용센터 소개 > 데이터 제공기관
	centerimgslidef(); // 안심활용센터 소개 > 센터이미지
	centerscrollf(); //안심활용센터 소개 > 센터 상세보기
	treemenuf(); // 트리 메뉴

	commonf();
});

$(window).resize(function(){
	//tooltip
    if($('.tip-box:visible').length) {
		toolpositionf();
	}
});

$(window).scroll(function(){
	//header
	var winSCT = $(this).scrollTop();

	if(winSCT > 0){
		$('#header').addClass('header-fixed');
	}else{
		$('#header').removeClass('header-fixed');
	}

	//top 버튼
	if( $('.dclog-wrap:visible').length > 0 ){
		var stdPos = $(window).scrollTop() + $(window).height();
		if( stdPos >  $('.dclog-wrap').offset().top + 100 ){
			$('.btn-wintop').fadeIn(400);
		}else{
			$('.btn-wintop').fadeOut(100);
		}
	}else{
		if( winSCT > 100 ){
			$('.btn-wintop').fadeIn(400);
		}else{
			$('.btn-wintop').fadeOut(100);
		}
	}


	setVisible('.ani-motion');

});


/**
 * @Method Name : Method Name
 * @Method 설명 : loading bar 표시
 * @param 없음
 * @return 없음
 */
function showLoadingBar() {
	$('#loading_box').addClass("on");
}

/**
 * @Method Name : Method Name
 * @Method 설명 : loading bar 숨기기
 * @param 없음
 * @return 없음
 */
function hideLoadingBar() {
	$('#loading_box').removeClass("on");
}

/**
 * @Method Name : chkValueFrm
 * @Method 설명 : 입력값 유효성 체크
 * @param txtTyp : 입력값 타입, txtVal : 입력값
 * @return boolean
 */
function chkValueFrm(txtTyp, txtVal) {
	var checkNum = /^[0-9]+$/;
	var checkEng = /^[a-z|A-Z]+$/;
	var checkKor = /^[ㄱ-ㅎ|가-힣]+$/;
	var checkAll = /^[0-9|a-z|A-Z|ㄱ-ㅎ|가-힣]+$/;

	if (txtTyp == "num") {
		if (!checkNum.test(txtVal)) {
			return false;
		}
	} else if (txtTyp == "eng") {
		if (!checkEng.test(txtVal)) {
			return false;
		}
	} else if (txtTyp == "kor") {
		if (!checkKor.test(txtVal)) {
			return false;
		}
	} else if (txtTyp == "all") {
		if (!checkAll.test(txtVal)) {
			return false;
		}
	}
	return true;
}

/**
 * @Method Name : formatBytes
 * @Method 설명 : 파일사이즈 표시 형태 변환
 * @param bytes : 파일사이즈, decimals : 소수점자리수
 * @return String
 */
function formatBytes(bytes, decimals) {
    if (bytes === 0) return '0 Bytes';

    const k = 1024;
    const dm = decimals < 0 ? 0 : decimals;
    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

    const i = Math.floor(Math.log(bytes) / Math.log(k));

    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
}

/**
 * @Method Name : cenvertWeekNm
 * @Method 설명 : 요일 문자 변환
 * @param varWeekNum : 요일 숫자
 * @return String
 */
function cenvertWeekNm(varWeekNum) {
	var answer = "";

	switch (varWeekNum){
		case "1" : answer = "일"; break;
		case "2" : answer = "월"; break;
		case "3" : answer = "화"; break;
		case "4" : answer = "수"; break;
		case "5" : answer = "목"; break;
		case "6" : answer = "금"; break;
		default  : answer = "토"; break;
	}

	return answer;
}

/**
 * @Method Name : textToHtml
 * @Method 설명 : text를 Html로 변환
 * @param varTxt : text
 * @return String
 */
function textToHtml(varTxt){
	varTxt = varTxt.replace(/&/gi,'&amp;').replace(/</gi,'&lt;').replace(/>/gi,'&gt;').replace(/\"/gi,'&quot;').replace(/'/gi,'&quot;').replace(/\r\n/gi,'<br/>').replace(/\n/gi,'<br/>');

	return varTxt;
}

/**
 * @Method Name : tranSidoCDChart
 * @Method 설명 : amcharts 시도 코드 변경
 * @param varTxt : text
 * @return String
 */
function tranSidoCDChart(sidoCd) {
	var txtSidoCD = "";

	switch (sidoCd) {
		case "50":
			txtSidoCD = "49";	//제주
			break;
		case "36":
			txtSidoCD = "50";	//세종
			break;
		default:
			txtSidoCD = sidoCd;
	}

	return txtSidoCD;
}

/**
 * @Method Name : tranSidoNmChart
 * @Method 설명 : amcharts 시도명 한글 변경
 * @param varTxt : text
 * @return String
 */
function tranSidoNmChart(sidoCd) {
	var txtSidoNm = "";

	switch (sidoCd) {
		case "KR-11":
			txtSidoNm = "서울";
			break;
		case "KR-26":
			txtSidoNm = "부산";
			break;
		case "KR-27":
			txtSidoNm = "대구";
			break;
		case "KR-28":
			txtSidoNm = "인천";
			break;
		case "KR-29":
			txtSidoNm = "광주";
			break;
		case "KR-30":
			txtSidoNm = "대전";
			break;
		case "KR-31":
			txtSidoNm = "울산";
			break;
		case "KR-41":
			txtSidoNm = "경기";
			break;
		case "KR-42":
			txtSidoNm = "강원";
			break;
		case "KR-43":
			txtSidoNm = "충북";
			break;
		case "KR-44":
			txtSidoNm = "충남";
			break;
		case "KR-45":
			txtSidoNm = "전북";
			break;
		case "KR-46":
			txtSidoNm = "전남";
			break;
		case "KR-47":
			txtSidoNm = "경북";
			break;
		case "KR-48":
			txtSidoNm = "경남";
			break;
		case "KR-49":
			txtSidoNm = "제주";
			break;
		case "KR-50":
			txtSidoNm = "세종";
			break;
		default:
			txtSidoNm = sidoCd;
	}

	return txtSidoNm;
}

function getTimeBasedUuid() {
    const now = new Date();
    const yyyy = now.getFullYear();
    const mm = (now.getMonth() + 1).toString().padStart(2, "0");
    const dd = now.getDate().toString().padStart(2, "0");
    const hh = now.getHours().toString().padStart(2, "0");
    const nn = now.getMinutes().toString().padStart(2, "0");
    const ss = now.getSeconds().toString().padStart(2, "0");
    const fff = now.getMilliseconds().toString().padStart(3, "0");
    const rnd3 = (Math.floor(Math.random() * 1000)).toString().padStart(3, "0");
    return `${yyyy}${mm}${dd}${hh}${nn}${ss}${fff}${rnd3}`;
}

function delay(ms, message) {
	return new Promise((resolve) => {
		setTimeout(() => {
			if (message)
			    console.log(message);

			resolve();
		}, ms);
	})
}
async function waitUntil(callback, message) {
	let ret = null;

	while (true) {
		const ret = callback();
		if (ret)
			return ret;

		await delay(10, message);
	}
}
async function hasSelector(selector) {
	return await waitUntil(() => document.querySelector(selector));
}
async function hasElement(elem) {
	return await waitUntil(() => elem);
}

function addComma(value){
	value = String(value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value;
}

function lpad(str, padLen, padStr) {
    if (padStr.length > padLen) {
        console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}