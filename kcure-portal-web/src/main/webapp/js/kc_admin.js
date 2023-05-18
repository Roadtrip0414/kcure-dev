$(document).ready(function() {
	// 사이드 메뉴바
	$('aside nav .list.on').find('.item').css("display","flex");

	$("aside nav .list .gnb").click(function(){
		$(this).parent('.list').toggleClass("on");
		$(this).parent('.list').siblings().removeClass("on");
		$(this).parent('.list').siblings().removeClass("active");
		$(this).next('.item').slideToggle("fast").css("display","flex");
		$(this).parent('.list').siblings().find('.item').slideUp("fast");
		$this = $(this);      
		if($this.next().hasClass('item')===false){
			$this.addClass('remove');
		}
	});

	$('aside nav .list .gnb').each(function(){
		if(!$(this).next().length){
			$(this).addClass('remove');
		}
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
});