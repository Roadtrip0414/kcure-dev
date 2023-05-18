$(document).ready(function() {

	//header 이미지 변경
	$(window).on('scroll',function(){
		if($(window).scrollTop()){
			$('.sg_header').addClass('on');
		}else{
			$('.sg_header').removeClass('on');
		}
	});

	// 네비 div 테그 감싸기
	$('.sub_nav_wrap a').wrapAll('<div class="btn"></div>');

	// 알림팝업
	let tag = $('.sg_bell');
	tag.mouseenter(function(){
		$(this).find('.sg_info_popup').fadeIn(200);
	}).mouseleave(function(){
		$(this).find('.sg_info_popup').fadeOut(120);
	});

	// 전체에서 제일 마지막 con만 선택
	$(function(){
		$('.wrap').find('.con').last().addClass('on');
	});

	// 팝업 닫기
	$(".sg_close_btn").click(function(){
		$(".sg_layer_popup").removeClass('on');
	});

	// 파일 업로드
	var fileTarget = $('.file_upload .upload-hidden');

	fileTarget.on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} 
		else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$(this).siblings('.upload_name').val(filename);
	});

	// 파일 업로드 두번째
	var fileTarget_02 = $('.n_file_wrap .upload-hidden');

	fileTarget_02.on('change', function(){
		if(window.FileReader){
		var filename = $(this)[0].files[0].name;
		} 
		else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}

		$(this).siblings('.upload_name').val(filename);
	});

	// fnq 검색 버튼
	let sgList = $('.sg_wrap .sg_community .sg_fnq_wrap .sg_list > a');

	sgList.click(function(){
		$(this).closest('.sg_list').find('.answer').slideToggle('fast').css({display:'flex'});
		$(this).closest('.sg_list').toggleClass('on');
		$(this).closest('.sg_list').siblings().removeClass('on');
		$(this).closest('.sg_list').siblings().find('.answer').slideUp('fast');
	});

	// 검색조건 접기 버튼
	$(".sg_tl_search_wrap .sg_point_table .sg_title a").click(function(){
		$(".sg_tl_search_wrap .sg_point_table .sg_table_box").slideToggle("fast");
		$(this).closest('.sg_tl_search_wrap .sg_point_table a').toggleClass('on');
	});

	// 팝업이 있을때 배경 스크롤 잠금
	$(function() {
		var MutationObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver;
		
		$.fn.attrchange = function(callback) {
			if (MutationObserver) {
				var options = {
					subtree: false,
					attributes: true
				};
				var observer = new MutationObserver(function(mutations) {
					mutations.forEach(function(e) {
						callback.call(e.target, e.attributeName);
					});
				});
				return this.each(function() {
					observer.observe(this, options);
				});
			}
		}
		$('.kc_layer_popup, .re_layer_popup, .ad_layer_popup').attrchange(function(attrName) {
			popupAddClass();
		});
		function popupAddClass(){
			if($('.kc_layer_popup, .re_layer_popup, .ad_layer_popup').hasClass('on')){
				$('body').addClass('on');
			}else{
				$('body').removeClass('on');
			}
		}
		popupAddClass();
	});

	// 플로팅 탑 버튼
	$(function () {
		$('.sg_body_top').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 100);
			return false;
		});
	});

	// 메인 플랫폼 슬라이드
	var pfSlide = $('.slide .item').slick({
		autoplaySpeed:1500,
		autoplay:true,
		arrows:true,
		accessibility:false,
		focusOnSelect:true,
		pauseOnFocus:true,
		adaptiveHeight:true,
		infinite: true
	});

	let mvLst = $('.slide .item .list a');

	$(document).keydown(function(event){
		if(event.keyCode == 9 || event.which == 9){
			$('.slide .item .list.slick-cloned a').attr('tabindex','-1');

			mvLst.focus(function(){
				pfSlide.slick('goTo', 0);
			});

			mvLst.focusout(function(){
				pfSlide.slick('slickPause');
			});
		}
		
	});

	// 메인 플랫폼 슬라이드 숫자 바뀜
	pfSlide.on('afterChange', function(event, slick, currentSlide){
		$('.latest_wrap .slide .top li:first-child').text(`${currentSlide+1}`);
	});  

	// 전체 슬라이드 개수 
	let totalLength = $('.latest_wrap .item .slick-slide:not(.slick-cloned)').length;
	$('.latest_wrap .slide .top li:nth-child(3)').text(`${totalLength}`); 

	// 슬라이드 재생 멈춤 버튼
	$('.latest_wrap .slide .push_btn').click(function(){
		$(this).toggleClass('on');
		pfSlide.slick('slickPlay');

		if($(this).hasClass('on')){
			pfSlide.slick('slickPause');
		}
	});

	// 비밀번호 표시
	$('.panel_item .see').on('click',function(){
		$(this).parent('li').siblings('li').find('input').toggleClass('active');
		if($(this).parent('li').siblings('li').find('input').val()){
			if($(this).parent('li').siblings('li').find('input').hasClass('active')){
				$(this).parent('li').siblings('li').find('input').attr('type',"text");
				$(this).addClass('on');
			}else{
				$(this).parent('li').siblings('li').find('input').attr('type',"password");
				$(this).removeClass('on');
			}
		}
	});

	//좌석보기 팝업 탭
	let seatTab = $('.re_layer_popup .re_popup_box .popup_con .seat_tab a');

	$('.re_layer_popup .re_popup_box .popup_con .seat_inn .item').eq(0).addClass('on');
	seatTab.click(function(){
		$(this).addClass('on');
		$(this).siblings().removeClass('on');
		let idx = $(this).index();
		$('.re_layer_popup .re_popup_box .popup_con .seat_inn .item').removeClass('on');
		$('.re_layer_popup .re_popup_box .popup_con .seat_inn .item').eq(idx).addClass('on');
	});

	// 셀렉트박스
	$(".select_int").click(function() {
		var select = $(this);

	//드롭다운 열기
	select.addClass("open").next('.dropDown').slideDown(100).addClass("open").parent('.select_d').addClass('on');

	//다른영역 클릭 시 닫기
	$(document).mouseup(function(e) {
		var seting = $(".dropDown");
		if (seting.has(e.target).length === 0) {
			seting.removeClass("open").slideUp(100);
			select.removeClass("open");
			select.removeClass("open").parent('.select_d').removeClass('on');
		}
	});

	$(".dropDown a").click(function() {
		var option = $(this).text();

		//클릭 시 드롭다운 닫기
		$(".dropDown a").removeClass('selected');
		$(".dropDown").removeClass("open").slideUp(100);
		select.removeClass("open");
		select.removeClass("open").parent('.select_d').removeClass('on');
		$(this).addClass('selected');

		//select에  text 넣기
		select.text(option);
	});
});

	// 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
	var strWidth;
	var strHeight;

	//innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
	if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
		strWidth = $('.window_pop').outerWidth() + (window.outerWidth - window.innerWidth);
		strHeight = $('.window_pop').outerHeight() + (window.outerHeight - window.innerHeight);
	}
	else {
		var strDocumentWidth = $(document).outerWidth();
		var strDocumentHeight = $(document).outerHeight();

		window.resizeTo ( strDocumentWidth, strDocumentHeight );

		var strMenuWidth = strDocumentWidth - $(window).width();
		var strMenuHeight = strDocumentHeight - $(window).height();

		strWidth = $('.window_pop').outerWidth() + strMenuWidth;
		strHeight = $('.window_pop').outerHeight() + strMenuHeight;
	}


	//resize 
	window.resizeTo( strWidth, strHeight );
	console.log(strWidth);

	// 사각 탭
	$(".tab_btn > a").eq(0).addClass('on');
	$('.tab_con > .item').eq(0).addClass('active');

	$(".tab_btn > a").click(function(){
		let idx = $(this).index();
		$(this).addClass('on').siblings().removeClass('on');
		let tab_con = $(".tab_con > .item").eq(idx);
		tab_con.addClass('active');
		tab_con.siblings().removeClass('active');
	});

	//데이터 소개 임상 라이브러리 슬라이드
	$('.clinical_lib_wrap .lib_content .slide .list li').attr('tabindex','-1');
	
	$('.clinical_lib_wrap .lib_content .slide ul').slick({
		dots: false,
		infinite: false,
		speed: 300,
		slidesToShow: 7,
		slidesToScroll: 1,
		variableWidth: true
	});

	$('.clinical_lib_wrap .lib_content .slide .list li a').attr('tabindex','0');

	//데이터 소개 공공 라이브러리
	let libItem = $('.public_lib_wrap .lib_content .item');

	libItem.eq(0).addClass('on');
	libItem.eq(0).find('.detail').slideDown('fast');

	libItem.find('.tle').click(function(){
		let parent = $(this).closest('div').parent('.item');
		parent.toggleClass('on');
		parent.find('.detail').slideToggle('fast');
		parent.siblings().removeClass('on').find('.detail').slideUp('fast');
	});

	// 회원가입 로그인 step 01 체크박스
	let CheckLst = $('.join_wrap .n_checkbox_s input[type="checkbox"]'),
	Allcheck = $('.join_wrap .n_checkbox_l input[type="checkbox"]');

	Allcheck.click(function(){
		if($(this).is(':checked')){
			CheckLst.prop('checked',true)
		}else{
			CheckLst.prop('checked',false)
		}
	});
	
	CheckLst.click(function(){
		let CheckedLst = $('.join_wrap .n_checkbox_s input[type="checkbox"]:checked');

		if(CheckedLst.length == CheckLst.length){
			Allcheck.prop('checked',true)
		}else{
			Allcheck.prop('checked',false)
		}
	});

	
	// 데이터 신청 데이터 셋 드롭다운
	let dataListTag = $('.data_request_wrap .detail_set .right .list ul li a');

	dataListTag.click(function(){
		$(this).toggleClass('on').siblings('ul').stop().slideToggle('fast');
	});

	// 데이터 신청 데이터 셋 체크박스 선택
	/*let dataCheck = $('.data_request_wrap .detail_set .right .list label.n_checkbox_s input[type="checkbox"]');
	
	dataCheck.click(function(){
		if($(this).is(':checked')){
			$(this).parent('label').parent('a').find('.txt').addClass('on');
		}else{
			$(this).parent('label').parent('a').find('.txt').removeClass('on');
		}
	});*/
	
	$('.data_request_wrap .detail_set .right').on('click', 'input[type="checkbox"]', function() {
		if($(this).is(':checked')){
			$(this).parent('label').parent('a').find('.txt').addClass('on');
		} else {
			$(this).parent('label').parent('a').find('.txt').removeClass('on');
		}
	});

	// 리뉴얼 데이터 신청 데이터 셋 드롭다운
	/*let dataSetListTag = $('.n_data_req_wrap .data_search .right .list .rep');

	dataSetListTag.click(function(){
		$(this).toggleClass('on').siblings('.drop').stop().slideToggle('fast');
	});*/
	
	$(document).on('click', '.n_data_req_wrap .data_search .right .list .rep', function(){
		$(this).toggleClass('on').siblings('.drop').stop().slideToggle('fast');
	});

	//글자 크기
	let cnt = 0;

	$('.body_size .up').click(function(){
		if(cnt < 2){
			$('body').css({zoom:`1.${++cnt}`});
		}else{
			alert('더 이상 증가할 수 없습니다.')
		}
	});

	$('.body_size .down').click(function(){
		if(cnt > 0){
			$('body').css({zoom:`1.${--cnt}`});
		}else{
			alert('더 이상 감소할 수 없습니다.')
		}
	});

	// 헤더 서브네비 스크롤 시
	let currentPOS = 0;
	
	$(window).scroll(function(){
		let winSCT = $(this).scrollTop();

		if(winSCT > currentPOS){
			$('header').addClass('on');
			$('.sub_nav_wrap').css({top:0}).removeClass('move');
			$('header').addClass('bg');
			$('.lnb_wrap').removeClass('active');
			$('.bk_hide').removeClass('on');
		}else{
			HeightFunc();
			if(winSCT == 0 && performance.navigation.type == 1){
				$('header').removeClass('bg');
			}	
		}
		currentPOS = winSCT;
	});

	// 헤더 배경 추가 삭제
	var scrollPosition = window.scrollY || document.documentElement.scrollTop

	if(scrollPosition == 0 && performance.navigation.type == 1){
		$('header').removeClass('bg');
	}
	else if(performance.navigation.type == 1){
		$('header').addClass('bg').removeClass('on');
	}

	// 헤더 네비 포커스시 하위 메뉴 펼침
	let gnbLink = $('header nav > ul > li.gnb > a');

	gnbLink.focus(function(){
		$(this).addClass('on');
		gnbLink.not($(this)).removeClass('on');
		$(this).next('.lnb_wrap').addClass('active');
		gnbLink.not($(this)).next('.lnb_wrap').removeClass('active');
		HeightFunc();
	})

	// 헤더 네비 하위 메뉴 펼침
	let gnb = $('header nav > ul > li.gnb'); 

	gnb.mouseenter(function(){
		$(this).find('a').addClass('on');
		gnb.not($(this)).find('a').removeClass('on');
		$(this).find('.lnb_wrap').addClass('active');
		gnb.not($(this)).find('.lnb_wrap').removeClass('active');
		$('.bk_hide').addClass('on');
		HeightFunc();
	});

	// nav 마우스 나갔을 때 
	$('nav').mouseleave(function(){
		$('.lnb_wrap').removeClass('active');
		gnbLink.removeClass('on');
		$('.bk_hide').removeClass('on');
	});

	$('header nav > ul > li:last-child input').focus(function(){
		gnbLink.removeClass('on')
		$('.lnb_wrap').removeClass('active');
	});

	//서브 메뉴 높이 구하기
	function HeightFunc(){
		let headerHeight = $('header').outerHeight() - 1;
		$('.sub_nav_wrap').css({top:headerHeight}).addClass('move');
		$('header').removeClass('on');
	}

	//user 클릭
	$('.user').click(function(){
		$this = $(this);
		$this.addClass('on');
		let drop = $(this).find('.drop');
		drop.fadeIn();
		drop.mouseleave(function(){
			$this.removeClass('on');
			drop.fadeOut();
		});
	});

	//카운트가 있을때 부모 적용
	if($('header .user .name .count').length > 0){
		$('header .user .name').css({paddingRight: '15px'});
	}else{
		$('header .user .name').css({paddingRight: '0px'});
	}

	// location_wrap 없애기
	let locationDEL = $('.login_wrap, .join_wrap , .pass_lost_wrap, .main_view_wrap, .main_search_wrap');

	if(locationDEL.length > 0){
		$('.location_wrap').css({display:'none'});
	}

	// 메인 푸터 마진값 없애기
	let locationDEL_to = $('.latest_wrap');

	if(locationDEL_to.length > 0){
		$('footer').css({marginTop:'0px'});
	}

	// 레이어팝업 닫기
	$(".kc_close").click(function(){
		$(this).parents('.kc_layer_popup, .re_layer_popup, .ad_layer_popup').removeClass('on');
	});

	// 비밀번호 해제/잠금
	$('.see_int a').click(function(){
		if($(this).siblings('input').val()){
			$(this).toggleClass('on');
			if($(this).hasClass('on')){
				$(this).siblings('input').attr('type','text');
			}else{
				$(this).siblings('input').attr('type','password');
			}
		}
	});

	//faq slideDown slideUp
	$('.faq_list .item .que').click(function(){
		$(this).parent('.item').toggleClass('on');
		$(this).next('.answer').slideToggle('fast');
	});

	// 관리자 드랍 버튼
	$(".drop_table .drop_btn").click(function(){
		$(".drop_table").toggleClass("on");
	});

	// 체크박스 on 버튼
	let returnRadio = $('.utilization_wrap .radio_wrap label input[type="radio"]');

	returnRadio.click(function(){

		if($(this).parent('label').index() == 1){
			$('.utilization_wrap').addClass('on');
		}else{
			$('.utilization_wrap').removeClass('on');
		}
	});

	// 데이터 소개 슬라이드
	$('.provide_insti .provide_slide').slick({
		infinite: true,
		slidesToShow: 3,
		slidesToScroll: 1,
		variableWidth: true,
		autoplay: true,
		speed:300
	});

	// 안심활용중앙센터 배경이미지 변경
	let bgList = $('.intro_wrap .provide_tab .bg_inn > :not(:first-child)');

	bgList.click(function(){
		let getBg = $(this).data('bg');
		$(this).parent('.bg_inn').find('a').eq(0).css("background-image", "url(" + getBg + ")");
		$(this).addClass('on').siblings().removeClass('on');
	});

	// 안심활용중앙센터 탭
	let cenTabList = $('.intro_wrap .provide_tab .board_tab li');
	let cenTabItem = $('.intro_wrap .provide_tab .item');

	cenTabList.click(function(){
		let idx = $(this).index();
		$(this).find('a').addClass('on');
		$(this).siblings().find('a').removeClass('on');
		cenTabItem.removeClass('on');
		cenTabItem.eq(idx).addClass('on');
	});

	//디세이블일때 라디오버튼 on
	$('input[type="radio"]:disabled').parent('label').addClass('on');

	//데이터 시각화 임상 라이브러리 데이터 선택
	$('.visualization_wrap .container .left .list > ul > li > a').click(function(){
		$(this).toggleClass('active');
		$(this).siblings().removeClass('active');
		if($(this).next('ul').length){
			$(this).addClass('arrow');
			$(this).next('ul').slideToggle('fast');
		}
	});

	//데이터 시각화 임상 라이브러리 서브 리스트 있을 때 화살표 자동생성 
	let dataSubList = $('.visualization_wrap .container .left .list ul ul');

	if(dataSubList.length){
		dataSubList.siblings('a').addClass('arrow')
	}

	//데이터 시각화 임상 라이브러리 상세설명 클릭
	$('.visualization_wrap .container .right .graph_btn .detail_btn').click(function(){
		$(this).toggleClass('on');
		if($(this).hasClass('on')){
			$('.visualization_wrap .container .right .graph').addClass('on');
		}else{
			$('.visualization_wrap .container .right .graph').removeClass('on');
		}
	});

	//메인 데이터 시각화 배너
	var swiper = new Swiper(".mySwiper", {
		autoplay: {
			delay: 0,
			stopOnLastSlide: false,
			disableOnInteraction: true,
		},
		speed:7000,
		loop:true,
		slidesPerView: "auto",
		loopedSlides: 5,
		//noSwiping : true,
		observer:true,
		observeParents:true,
		centeredSlides: true,
		spaceBetween: 54,
		grabCursor: true,
		resistance : false,
		allowTouchMove : false,
		pagination: {
			el: ".swiper-pagination",
			clickable: false,
		},
	});

	// 메인 하단 로고 슬라이드
	var logoSlide = $('.site_link_wrap .logo').slick({
		autoplaySpeed:1500,
		autoplay:true,
		arrows:true,
		accessibility:false,
		focusOnSelect:true,
		pauseOnFocus:true,
		adaptiveHeight:true,
		slidesToShow: 5,
		infinite: true
	});

	// 슬라이드 재생 멈춤 버튼
	$('.site_link_wrap .link_push_btn').click(function(){
		$(this).toggleClass('on');
		logoSlide.slick('slickPlay');

		if($(this).hasClass('on')){
			logoSlide.slick('slickPause');
		}
	});

});
