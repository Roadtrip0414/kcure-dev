$(document).ready(function() {
	var subMitPrehandler = function(event){
		showLoadingBar();
		var checkParam = $(event.target).serialize();
		if(checkParam.indexOf("current_menu_name_info") <0){
			$('<input>').attr({
			    type: 'hidden',
			    name: 'current_menu_name_info',
				value:$('#current_menu_name_info').val()
			}).appendTo(event.target);
		}
		//submit 전에 공통으로 처리할 내용이 있을경우
		if(2==1){
			event.preventDefault();	
			event.stopPropagation();	
		}
		var checkUrl = $(event.target).attr('action').toLowerCase();
		if (checkUrl.indexOf('filedown') != -1) {
		  setTimeout(function(){hideLoadingBar();} , 1000);
		};	
	}
	
	$('form').bind('submit', subMitPrehandler);
});

function sendPost(moveUrl){
	var f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', moveUrl);
    document.body.appendChild(f);
    f.submit();
	
}