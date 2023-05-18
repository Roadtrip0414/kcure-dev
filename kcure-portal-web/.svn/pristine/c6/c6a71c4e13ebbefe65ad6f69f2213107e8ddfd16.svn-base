(function ($) {
    //ajax 셋팅
    $.ajaxSettings.cache = false;
    $.ajaxSettings.traditional = true;
    // ajax 전역 에러 핸들 설정
    $.ajaxPrefilter(function (options, originalOptions, jqXHR) {		
		jqXHR.setRequestHeader("AJAX",true);
		
		const isFormData = options['data'] && options['data']['append'];
		// Skip check when options.data is FormData used for file upload
		if (!isFormData) { 
			var checkParam =options.data; 
			
			console.log(typeof checkParam);
			if(checkParam != null && typeof checkParam !== "undefined" ){
				if(checkParam.indexOf("current_menu_name_info") <0){
					options.data +="&current_menu_name_info="+$('#current_menu_name_info').val()	
				}	
			}else{
				options.data ="current_menu_name_info="+$('#current_menu_name_info').val()
			}
			console.log("options.data------------------------------")
			console.log(options.data)
			console.log("options.data------------------------------")
		}
			
        var error = options.error;
		var success = options.success;
		//성공처리
		options.success= function (data, status, xhr) {
			console.log("---------options.success-----------",data);
			//exception 발생시.에러로 처리.
			if(data.exception != null && typeof data.exception !== "undefined" ){
				if (typeof error === "function") {
		                return error.call(this, xhr, status, data.exception);
	            }else if(data.returnPage != null && typeof data.exception !== "undefined"){
					return ajaxErrPageMove(data.returnPage);
				} else{
					alert("처리중 오류가 발생하였습니다.");
				}
			}else if (typeof success === "function") {
                return success.call(this, data, status, xhr);
            }
			console.log("---------options.success-----------");
		}
		//에러처리
        options.error = function (xhr, status, err) {
			console.log("---------options.error-----------");
            var errorMessage = "처리중 오류가 발생하였습니다.";
            if (typeof error === "function") {
                return error.call(this, xhr, status, err);
            } else {
               alert(errorMessage);
            }
			console.log("---------options.error-----------");
        }
		//ajax 처리후 실행
		afterHandler(options, originalOptions, jqXHR);
		//hideLoadingBar();	
	
    });
    
})(jQuery);

function prevHandler(options, originalOptions, jqXHR){
		console.log("---------prevHandler ajax-----------");
		showLoadingBar();
		
}

function afterHandler(options, originalOptions, jqXHR){
		console.log("---------afterHandler ajax-----------");
		hideLoadingBar();
}

function ajaxErrPageMove(moveUrl){
	var f = document.createElement('form');
    //폼태그로 감쌀 필요 없다.. 그냥 a태그 해도 됨..
    f.setAttribute('method', 'post');
    f.setAttribute('action', moveUrl);
    document.body.appendChild(f);
    f.submit();
}

