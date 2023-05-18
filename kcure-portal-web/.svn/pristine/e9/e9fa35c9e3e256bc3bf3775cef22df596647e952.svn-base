<%
/* =================================================================
 * @FileName : viewPwdChgSet.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 비밀번호 변경 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<!-- container -->
<form name="pwdForm" id="pwdForm" action="" method="post">
<input type="hidden" id="pswdRsetTknId" name="pswdRsetTknId" value="${pswdRsetTknId}"/>
	<div class="wrap">
		<div class="pass_lost_wrap">
			<div class="info">
				<div class="title">
					<h1>비밀번호 재설정</h1>
				</div>
				<div class="panel_item">
					<div class="int" id="info_userPswd">
						<ul>
							<li><input type="password" name="userPswd" id="userPswd" placeholder="비밀번호 입력"></li>
							<li><a href="javascript:void(0)" class="see"></a></li>
						</ul>
						<!-- 기본 p태그 삭제 -->
						<p class="wrong"></p>
					</div>
					<div class="int" id="info_userPswdRe">
						<ul>
							<li><input type="password" name="userPswdRe" id="userPswdRe" placeholder="새 비밀번호 확인"></li>
							<li><a href="javascript:void(0)" class="see"></a></li>
						</ul>
						<!-- 기본 p태그 삭제 -->
						<p class="wrong"></p>
					</div>
				</div>
				<a href="#" onclick="actionPwdChg()" class="summit_btn">확인</a>
			</div>
		</div>
	</div>
</form>
<!-- //container -->

<script type="text/javascript">
	
	let pwVal = "", pwReVal = "", isPwValid = false, isPwReValid = false
	
	const pwInputEl = document.querySelector('#info_userPswd input');
	const pwErrorMsgEl = document.querySelector('#info_userPswd .wrong');
	const pwReInputEl = document.querySelector('#info_userPswdRe input');
	const pwReErrorMsgEl = document.querySelector('#info_userPswdRe .wrong');
		
	$( document ).ready(function() {
		
		<c:if test="${not empty fn:trim(actMessage) &&  actMessage ne ''}">
		    alert("<c:out value='${actMessage}'/>");
		    window.location.href = "/portal/uat/uia/pwd/viewPwdFind.do";
	    </c:if>
	    
	    document.addEventListener('keydown', (event) => {
			if (event.keyCode === 13) {
				actionPwdChg();
			};
		});
		
		pwInputEl.addEventListener('change', () => {
			const pwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\S])[A-Za-z\d\S]{8,16}$/;
			pwVal = pwInputEl.value;
			
			if(pwVal !== ""){
				if(pwRegExp.test(pwVal)) {
				    isPwValid = true;
				    pwErrorMsgEl.textContent = "";
				    
				    pwReVal = pwReInputEl.value;
				    
					if(pwReVal !== ""){
						 checkPwValid();
					}
				} 
				else {
				    isPwValid = false;
				    pwErrorMsgEl.textContent = "8~16자 영문 대소문자, 숫자, 특수문자를 조합해 주세요";
				    pwInputEl.focus();
				}		  
			}else{
				 isPwValid = false;
				 pwErrorMsgEl.textContent = "";
				 pwInputEl.focus();
			}
			
		});
		
		// 패스워드 재입력 유효성 검사
		pwReInputEl.addEventListener('change', () => {
		  pwReVal = pwReInputEl.value;
		  
		  if(pwReVal !== ""){
			  checkPwValid();
		  }else{
			  isPwReValid = false;
			  pwReErrorMsgEl.textContent = ""; 
			  pwReInputEl.focus();
		  }
		 
		});

	});

	function actionPwdChg() {
		if(fnValidate()){
			$.ajax({
	    		type:"POST",
	    		url:"/portal/uat/uia/pwd/updatePwdChg.do",
	    		data:{pswdRsetTknId : $('#pswdRsetTknId').val(), userPswd : $('#userPswd').val()},
	    		dataType:'json',
	    		success:function(returnData){
	    			alert(returnData.rstMsg);
	    			window.location.href = "/portal/uat/uia/pub/viewLoginUsr.do";
	    		},
	    		error: function(data){
	    			alert("요청 처리에 실패하였습니다.");
	    		}
	    	});
		}
	}
	
	function fnValidate(){
		if(!isPwValid){ 
			if ($('#userPswd').val() =="") {
				alert("비밀번호를 입력해주세요");
				pwInputEl.focus();
				return false;
		    }else{
		    	pwInputEl.focus();
				return false;
		    }
		}else if(!isPwReValid){
			if ($('#userPswdRe').val() =="") {
		    	alert("비밀번호를 확인해주세요");
		    	pwReInputEl.focus();
		    	return false;
			}else{
				pwReInputEl.focus();
				return false;
			}
		}
		
		return true;
	}
	
	// 비밀번호와 재입력 값 일치 여부
	function checkPwValid() {		  
		if(pwReVal === "") { // 미입력
		   isPwReValid = false;
		   pwReErrorMsgEl.textContent = "";
		}
		else if(pwVal === pwReVal) { // 비밀번호 재입력 일치
			isPwReValid = true;
			pwReErrorMsgEl.textContent = "";
		}
		else{ // 비밀번호 재입력 불일치
			isPwReValid = false;
			pwReErrorMsgEl.textContent = "비밀번호가 일치하지 않습니다";
		}
	}

</script>