<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="/WEB-INF/jsp/kcure/portal/com/global_scripts.jsp"%>

<script type="text/javaScript">
	
	function fnAgree(){
		var checkField = document.AgreeForm.checkField;
		
	    if(checkField) {
	        if(checkField.length > 1) {
	            for(var i=0; i < checkField.length; i++) {
	                if(checkField[i].checked) {
	                	if(i==0){$("#trmAgrYn").val("Y")}
	                	if(i==1){$("#pinfCnuAgrYn").val("Y")}
	                	if(i==2){$("#pinfSp3pAgrYn").val("Y")}                	
	                }else{
	                    alert("약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
	                    checkField[i].focus();
	                    return;
	                }
	            }
	        } 
	    }
	    
	    $("form").submit();
	}
	
	function goHome(){
		location.href="/portal/uat/uca/viewSignup.do";
	}
		
</script>


<form name="AgreeForm" action="/portal/uat/uca/viewSignupStp2.do" method="post">

<input type="hidden" id="trmAgrYn" name="trmAgrYn" value=""/>
<input type="hidden" id="pinfCnuAgrYn" name="pinfCnuAgrYn" value=""/>
<input type="hidden" id="pinfSp3pAgrYn" name="pinfSp3pAgrYn" value="Y"/>

<div class="wrap">
        <div class="join_wrap">
            <div class="con">
                <h1>회원가입</h1>
                <div class="progress">
                    <ul>
                        <!-- li에 class on 추가 시 색 변경 -->
                        <li class="on">
                            <p>STEP 01</p>
                            <h2>약관동의</h2>
                        </li>
                        <li>
                            <p>STEP 02</p>
                            <h2>휴대폰 본인인증</h2>
                        </li>
                        <li>
                            <p>STEP 03</p>
                            <h2>회원정보 입력</h2>
                        </li>
                        <li>
                            <p>STEP 04</p>
                            <h2>회원가입 완료</h2>
                        </li>
                    </ul>
                </div>
                <div class="sub_title">
                    <h3>회원 약관동의</h3>
                    <p>회원가입을 위해서 아래의 서비스 이용약관, 개인정보 수집 및 이용에 대한 안내를 읽고 동의해주세요.</p>
                </div>
                <div class="k_cure">
                    <div class="agree">
                        <h4>K-cure 이용약관 <strong>필수</strong></h4>
                        <div class="box">
                        	<div class="provision_wrap">
								<div class="item">
									<h3 class="m_title">제1장 총 칙</h3>
									<p class="s_title">제1조 (목적)</p>
									<p class="description">이 약관은 보건복지부의 K-CURE 플랫폼이 제공하는 서비스를 이용함에 있어 이용자와 운영기관인 한국보건의료정보원 (이하 "의정원"이라 합니다)간의 권리·의무 및 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
								</div>
								<div class="item">
									<p class="s_title">제2조 (약관의 효력과 변경)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>이 약관은 서비스를 이용하고자 하는 모든 이용자에 대하여 그 효력을 발생합니다.</p>
										</li>
										<li>
											<p><span>②</span>이 약관의 내용은 서비스의 일부 화면 또는 기타 방법 등에 의하여 이를 공지하거나 그 내용을 이용자에게 통지함으로써 효력이 발생됩니다.</p>
										</li>
										<li>
											<p><span>③</span>의정원은 필요하다고 인정되는 경우 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제2항과 같은 방법으로 공지 또는 통지하여 이용자가 직접 확인할 수 있도록 할 것입니다.</p>
										</li>
										<li>
											<p><span>④</span>이용자는 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단하고 본인의 회원등록을 취소할 수 있으며, 계속 사용하시는 경우에는 약관 변경에 동의한 것으로 간주되어 변경된 약관은 전항과 같은 방법으로 효력이 발생합니다.</p>
										</li>
										<li>
											<p><span>⑤</span>이용자가 이 약관의 내용에 동의하는 경우 의정원의 서비스 제공행위 및 이용자의 서비스 이용행위에는 이 약관이 우선적으로 적용될 것입니다. 이 약관에 명시되지 않은 사항에 대해서는 개인정보보호법, 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신윤리강령, 정보통신망이용촉진 및 정보보호 등에 관한 법률, 전자서명법 등 기타 대한민국의 관련법령, 의정원이 별도로 정한 규정에 의합니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제3조 (용어의 정의)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
											<ul class="sub_txt">
												<li>
													<p><span>1.</span>이용자 : 서비스에 접속하여 의정원이 제공하는 서비스를 받는 회원 및 비회원</p>
												</li>
												<li>
													<p><span>2.</span>회원 : 만 14세 이상으로 “이용자” 중 의정원에 개인정보를 제공하여 회원등록을 하거나(일반 회원가입 방식), 디지털원패스 또는 네이버, 카카오 등 본인의 계정을 통해 회원등록을 한(간편 회원가입 방식) 자</p>
												</li>
												<li>
													<p><span>3.</span>비회원 : 회원가입을 하지 않고 의정원이 제공하는 서비스를 이용하는 자로 일부 서비스에 제한을 받을 수도 있음</p>
												</li>
												<li>
													<p><span>4.</span>아이디(ID, 고유번호) : 회원의 서비스 이용을 위하여 필요한 이메일주소 및 비밀번호(패스워드) 기반의 로그인 계정을 의미하며, 이용자가 이메일주소와 패스워드 등을 등록한 후 필요시 의정원이 휴대전화번호 등을 통해 본인인증을 완료한 후 승낙하는 절차로 생성됨</p>
												</li>
												<li>
													<p><span>5.</span>비밀번호(패스워드) : 회원의 정보보호를 위해 이용자 자신이 설정한 문자와 숫자, 특수기호의 조합(8자리 이상)</p>
												</li>
												<li>
													<p><span>6.</span>관리자 : 서비스의 전체 또는 일부의 관리‧운영을 위하여 의정원에서 지정한 자</p>
												</li>
												<li>
													<p><span>7.</span>이용해지 : 의정원 또는 회원이 이용계약을 종료시키는 의사표시</p>
												</li>
											</ul>
										</li>
										<li>
											<p><span>②</span>이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계법령 및 서비스별 안내에서 정하는 바에 의합니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<h3 class="m_title">제2장 서비스 이용계약</h3>
									<p class="s_title">제4조 (이용계약의 성립) 이용계약은 이용자의 약관내용에 대한 동의와 이용자의 이용신청에 대한 의정원의 승낙으로 성립합니다.</p>
									<p class="s_title">제5조 (이용신청) 이용신청은 서비스의 회원정보 화면에서 이용자가 의정원에서 요구하는 가입신청 양식에 개인의 신상정보를 기록하는 방식으로 신청합니다.</p>
									<p class="s_title">제6조 (이용신청의 수락과 거절)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>의정원은 제5조에서 정한 사항을 정확히 기재하여 이용신청을 하였을 경우 특별한 사정이 없는 한 서비스 이용신청을 수락합니다.</p>
										</li>
										<li>
											<p><span>②</span>의정원은 다음 각 호에 해당하는 경우에 대하여는 그 신청에 대한 제한 사유가 해소될 때까지 일부 서비스 이용을 제한할 수 있습니다.</p>
											<ul class="sub_txt">
												<li>
													<p><span>1.</span>내용이 허위(차명 등)인 것으로 판명되거나, 그러하다고 의심할만한 합리적인 사유가 발생할 경우</p>
												</li>
												<li>
													<p><span>2.</span>기타 의정원이 필요하다고 인정되는 경우</p>
												</li>
											</ul>
										</li>
										<li>
											<p><span>③</span>의정원은 다음에 해당하는 경우에는 이용신청을 제한할 수 있습니다.</p>
											<ul class="sub_txt">
												<li>
													<p><span>1.</span>다른 사람의 명의를 사용하여 신청하였을 때</p>
												</li>
												<li>
													<p><span>2.</span>신청서의 내용을 허위로 기재하였을 때</p>
												</li>
												<li>
													<p><span>3.</span>사회의 안녕 질서 또는 미풍양속을 저해할 목적으로 신청하였을 때</p>
												</li>
												<li>
													<p><span>4.</span>기타 의정원이 정한 이용신청 요건이 미비 되었을 때</p>
												</li>
											</ul>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제7조 (계약사항의 변경)</p>
									<p class="description">회원은 회원정보관리를 통해 언제든지 자신의 정보를 열람하고 수정할 수 있습니다. 회원은 이용신청 시 기재한 사항이 변경되었을 때에는 수정을 하여야 하며, 수정하지 아니하여 발생하는 문제의 책임은 회원에게 있습니다.</p>
								</div>
								<div class="item">
									<h3 class="m_title">제3장 서비스 제공 및 이용</h3>
									<p class="s_title">제8조 (서비스 이용)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>의정원은 회원의 이용신청을 수락한 때부터 서비스를 개시합니다. 단, 일부 서비스의 경우에는 지정된 일자부터 서비스를 개시합니다.</p>
										</li>
										<li>
											<p><span>②</span>의정원의 업무상 또는 기술상의 장애로 인하여 서비스를 개시하지 못하는 경우에는 사이트에 공시하거나 회원에게 이를 통지합니다.</p>
										</li>
										<li>
											<p><span>③</span>서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 의정원의 업무상 또는 기술상의 이유로 서비스가 일시 중지될 수 있고, 또한 정기점검 등 운영상의 목적으로 의정원이 정한 기간에는 서비스가 일시 중지될 수 있습니다. 이러한 경우 의정원은 사전 또는 사후에 이를 공지합니다.</p>
										</li>
										<li>
											<p><span>④</span>회원에 가입한 후라도 일부 서비스 이용 시 서비스 제공자의 요구에 따라 특정 회원에게만 서비스를 제공할 수도 있습니다.</p>
										</li>
										<li>
											<p><span>⑤</span>의정원은 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 사전에 공지합니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제9조 (서비스의 변경, 중지 및 정보의 저장과 사용)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>이용자는 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 의정원의 관리범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실에 대해 의정원이 아무런 책임을 지지않음에 동의합니다.</p>
										</li>
										<li>
											<p><span>②</span>의정원이 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일 전에 고지 후 서비스를 중지할 수 있으며, 이 기간 동안 회원이 고지내용을 인지하지 못한데 대하여 의정원은 책임을 부담하지 아니합니다. 상당한 이유가 있을 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 의정원은 책임을 부담하지 아니합니다.</p>
										</li>
										<li>
											<p><span>③</span>의정원의 사정으로 서비스를 영구적으로 중단하여야 할 경우 제2항을 준용합니다. 다만, 이 경우 사전 고지기간은 1개월로 합니다.</p>
										</li>
										<li>
											<p><span>④</span>의정원은 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 회원 또는 제3자에게 어떠한 책임도 부담하지 아니합니다.</p>
										</li>
										<li>
											<p><span>⑤</span>의정원은 회원이 이 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 중지할 수 있습니다. 이 경우 의정원은 회원의 접속을 금지할 수 있으며, 회원이 게시한 내용의 전부 또는 일부를 임의로 삭제할 수 있습니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제10조 (정보의 제공 및 광고의 게재)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>의정원은 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보 및 광고에 대해서는 전자우편이나 전화, SMS(휴대폰 문자메시지), 메신저 등의 방법으로 회원에게 제공할 수 있습니다.</p>
										</li>
										<li>
											<p><span>②</span>의정원은 서비스의 운용과 관련하여 서비스화면, 홈페이지, 전자우편 등에 홍보물 및 광고 등을 게재할 수 있으며, 의정원은 서비스를 이용하고자 하는 이용자가 이에 대하여 동의하는 것으로 간주합니다.</p>
										</li>
										<li>
											<p><span>③</span>의정원은 서비스 상에 게재되어 있거나 서비스를 통한 광고주체의 광고활동에 회원이 참여하거나 교신 등의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제11조 (게시물 또는 내용물의 관리)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>의정원은 회원이 게시하거나 등록하는 서비스 내의 모든 내용물이 다음 각 호의 경우에 해당된다고 판단되는 경우 사전 통지 없이 삭제할 수 있으며, 이에 대해 의정원은 어떠한 책임도 지지 않습니다.</p>
											<ul class="sub_txt">
												<li>
													<p><span>1.</span>의정원, 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우</p>
												</li>
												<li>
													<p><span>2.</span>공공질서 및 미풍양속에 위반되는 내용인 경우</p>
												</li>
												<li>
													<p><span>3.</span>범죄적 행위에 결부된다고 인정되는 내용일 경우</p>
												</li>
												<li>
													<p><span>4.</span>제3자의 저작권 등 기타 권리를 침해하는 내용인 경우</p>
												</li>
												<li>
													<p><span>5.</span>서비스 성격에 부합하지 않는 정보의 경우</p>
												</li>
												<li>
													<p><span>6.</span>기타 관계 법령 및 의정원에서 정한 규정 등에 위배되는 경우</p>
												</li>
											</ul>
										</li>
										<li>
											<p><span>②</span>의정원은 서비스에 게시된 내용을 사전 통지 없이 편집, 이동, 삭제할 수 있는 권리를 보유하며, 게시된 내용이 이 약관에 위배되거나 상용 또는 비합법적, 불건전한 내용일 경우 사전통지 없이 삭제할 수 있습니다.</p>
										</li>
										<li>
											<p><span>③</span>의정원은 게시된 내용이 일정기간 이상 경과되어, 게시물로써의 효력을 상실하여 그 존치 목적이 불분명한 경우 공지사항 발표 후 1주일간의 통지기간을 거쳐 해당 게시물을 삭제할 수 있습니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제12조 (게시물의 저작권)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>서비스에 게재된 모든 자료에 대한 권리와 책임은 게시자에게 있으며 의정원은 서비스 내 게재권을 갖습니다. 또한, 의정원은 게시자의 동의 없이는 게시물을 영리적 목적으로 사용할 수 없습니다. 단, 비영리적인 경우에는 그러하지 않습니다.</p>
										</li>
										<li>
											<p><span>②</span>회원의 게시물이 타인의 저작권, 프로그램 저작권 등을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 회원이 부담하여야 합니다.</p>
										</li>
										<li>
											<p><span>③</span>회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제13조 (의정원의 소유권)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>의정원이 제공하는 서비스, 그에 필요한 소프트웨어, 이미지, 마크, 로고, 디자인, 서비스명칭, 정보 및 상표 등과 관련된 지적재산권 및 기타권리는 의정원에게 소유권이 있습니다.</p>
										</li>
										<li>
											<p><span>②</span>회원은 의정원이 명시적으로 승인한 경우를 제외하고는 제1항 소정의 각 재산에 대한 전부 또는 일부의 수정, 대여, 대출, 판매, 배포, 제작, 양도, 재라이센스, 담보권 설정행위, 상업적 이용행위를 할 수 없으며, 제3자로 하여금 이와 같은 행위를 하도록 허락할 수 없습니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<h3 class="m_title">제4장 계약 당사자의 의무</h3>
									<p class="s_title">제14조 (회원의 의무 및 정보보안)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>회원은 서비스 이용을 위해 가입할 경우 현재의 사실과 일치하는 완전한 정보(이하 "가입정보"라 한다)를 제공하셔야 합니다. 또한 가입정보에 변경이 발생할 경우 즉시 갱신하셔야 합니다.</p>
										</li>
										<li>
											<p><span>②</span>회원이 서비스 사용을 위한 가입절차를 완료하시면 아이디와 비밀번호를 받게 됩니다. 회원의 아이디, 비밀번호 관리를 위해</p>
											<ul class="sub_txt">
												<li>
													<p><span>1.</span>회원의 승인 없이 아이디, 비밀번호가 사용되는 문제가 발생되면 즉시 의정원에 신고하셔야 하고</p>
												</li>
												<li>
													<p><span>2.</span>매 접속 종료 시 확실히 로그아웃을 하셔야 합니다</p>
												</li>
											</ul>
										</li>
										<li>
											<p><span>③</span>회원은 서비스를 이용하면서 다음과 같은 행위를 하여서는 안 됩니다.</p>
											<ul class="sub_txt">
												<li>
													<p><span>1.</span>다른 이용자의 개인정보를 도용하거나 자신의 개인정보를 제3자에게 이용하게 하는 행위</p>
												</li>
												<li>
													<p><span>2.</span>서비스를 이용하여 얻은 정보를 이용자의 개인적인 이용 외에 복사, 가공, 번역, 2차적 저작 등을 통하여 복제, 공연, 방송, 전시, 배포, 출판 등에 사용하거나 제3자에게 제공하는 행위</p>
												</li>
												<li>
													<p><span>3.</span>타인의 명예를 손상시키거나 불이익을 주는 행위</p>
												</li>
												<li>
													<p><span>4.</span>의정원의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위</p>
												</li>
												<li>
													<p><span>5.</span>공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형, 동영상, 음성 등을 타인에게 유포하는 행위</p>
												</li>
												<li>
													<p><span>6.</span>범죄와 결부된다고 객관적으로 인정되는 행위</p>
												</li>
												<li>
													<p><span>7.</span>서비스와 관련된 설비의 오동작이나 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터 바이러스 감염자료를 등록 또는 유포하는 행위</p>
												</li>
												<li>
													<p><span>8.</span>서비스의 안정적 운영을 방해할 수 있는 정보를 전송하거나 수신자의 의사에 반하여 광고성 정보를 전송하는 행위</p>
												</li>
												<li>
													<p><span>9.</span>정보통신윤리위원회, 소비자보호단체 등 공신력 있는 기관으로부터 시정요구를 받는 행위</p>
												</li>
												<li>
													<p><span>10.</span>선거관리위원회의 중지, 경고 또는 시정명령을 받는 선거법 위반 행위</p>
												</li>
												<li>
													<p><span>11.</span>기타 관계 법령에 위배되는 행위</p>
												</li>
											</ul>
										</li>
										<li>
											<p><span>④</span>회원은 이 약관 및 관계법령에서 규정한 사항을 준수하여야 합니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제15조 (의정원의 의무)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>의정원은 법령과 이 약관이 금지하는 행위를 하지 않으며, 계속적, 안정적으로 서비스를 제공하기위해 노력할 의무가 있습니다.</p>
										</li>
										<li>
											<p><span>②</span>의정원은 회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 신속히 처리하여야합니다.</p>
										</li>
										<li>
											<p><span>③</span>의정원은 관련법령이 정하는 바에 따라서 회원 등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력합니다. 회원의 개인정보보호에 관해서는 관련법령 및 제16조에 제시된 내용을 지킵니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제16조 (개인정보보호정책)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>의정원은 이용 신청 시 회원이 제공하는 정보를 통하여 회원에 관한 정보를 수집하며, 회원의 개인정보는 본 이용계약의 이행과 본 이용계약상의 서비스제공을 위한 목적으로 이용합니다.</p>
										</li>
										<li>
											<p><span>②</span>의정원은 서비스 제공과 관련하여 취득한 회원의 정보를 본인의 승낙 없이 제3자에게 누설 또는 배포할 수 없으며 상업적 목적으로 사용할 수 없습니다. 다만, 법률의 규정에 따른 적법한 절차에 의한 경우에는 제외합니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<h3 class="m_title">제5장 계약해지</h3>
									<p class="s_title">제17조 (계약해지 및 이용제한)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>회원이 이용계약을 해지하고자 하실 때에는 회원 본인이 직접 인터넷을 통해 당 사이트에 해지 신청을 하여야 합니다.</p>
										</li>
										<li>
											<p><span>②</span>의정원은 보안 및 아이디 정책, 서비스의 원활한 제공 등과 같은 이유로 회원의 아이디 및 비밀번호 변경을 요구하거나 변경 할 수 있습니다.</p>
										</li>
										<li>
											<p><span>③</span>의정원은 회원이 다음 각 호의 어느 하나에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 서비스 이용을 중지하고 관계당국에 고발할 수 있습니다.</p>
											<ul class="sub_txt">
												<li>
													<p><span>1.</span>타인의 개인정보, 서비스 아이디 및 비밀번호를 도용한 경우</p>
												</li>
												<li>
													<p><span>2.</span>서비스 운영을 고의로 방해한 경우</p>
												</li>
												<li>
													<p><span>3.</span>가입한 이름이 실명이 아닌 경우</p>
												</li>
												<li>
													<p><span>4.</span>동일 사용자가 다른 아이디로 이중등록을 한 경우</p>
												</li>
												<li>
													<p><span>5.</span>공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우</p>
												</li>
												<li>
													<p><span>6.</span>회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행하는 경우</p>
												</li>
												<li>
													<p><span>7.</span>타인에 대하여 비방하거나 명예를 손상시키거나 불이익을 주는 행위를 한 경우</p>
												</li>
												<li>
													<p><span>8.</span>서비스의 안정적 운영을 방해할 목적으로 정보를 전송하거나 광고성 정보를 전송하는 경우</p>
												</li>
												<li>
													<p><span>9.</span>통신설비의 오동작이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는경우</p>
												</li>
												<li>
													<p><span>10.</span>의정원, 다른 회원 또는 제3자의 지적재산권을 침해하는 경우</p>
												</li>
												<li>
													<p><span>11.</span>정보통신윤리위원회 등 외부기관의 시정 요구가 있거나 선거관리위원회의 중지, 경고 또는 시정 명령을 받는 선거법 위반행위가 있는 경우</p>
												</li>
												<li>
													<p><span>12.</span>의정원의 서비스를 이용하여 얻은 정보를 의정원의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 경우</p>
												</li>
												<li>
													<p><span>13.</span>게시판 등에 음란물을 게재하거나 음란사이트를 연결(링크)하는 경우</p>
												</li>
												<li>
													<p><span>14.</span>회원이 제공한 정보 및 갱신한 정보가 부정확할 경우</p>
												</li>
												<li>
													<p><span>15.</span>관련 법령, 이용약관 및 기타 의정원이 정한 이용조건에 위반한 경우</p>
												</li>
											</ul>
										</li>
										<li>
											<p><span>④</span>의정원은 장기간 휴면상태 회원인 경우 회원 적정관리와 정보보호를 위해 계약을 해지할 수 있습니다. 이 경우 서비스에 공지하거나 이메일로 안내하여야 합니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<h3 class="m_title">제6장 기타</h3>
									<p class="s_title">제18조 (요금 및 유료정보)</p>
									<p class="description">서비스 이용은 기본적으로 무료입니다. 단, 서비스에서 정한 별도의 유료 정보와 유료서비스에 대해서는 그러하지 아니합니다.</p>
								</div>
								<div class="item">
									<p class="s_title">제19조 (양도금지)</p>
									<p class="description">회원은 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.</p>
								</div>
								<div class="item">
									<h3 class="m_title">제7장 손해배상 등</h3>
									<p class="s_title">제20조 (손해배상)</p>
									<p class="description">의정원은 서비스 이용과 관련하여 이용자에게 어떠한 손해가 발생하더라도 손해가 의정원이 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.</p>
								</div>
								<div class="item">
									<p class="s_title">제21조 (면책조항)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>의정원은 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.</p>
										</li>
										<li>
											<p><span>②</span>의정원은 이용자의 귀책사유로 인한 서비스이용의 장애에 대하여 책임을 지지 않습니다.</p>
										</li>
										<li>
											<p><span>③</span>의정원은 이용자가 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그 밖에 서비스를 통하여 얻은 자료로 인한 손해 등에 대하여도 책임을 지지 않습니다.</p>
										</li>
										<li>
											<p><span>④</span>의정원은 이용자가 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">제22조 (관할법원)</p>
									<ul class="main_txt">
										<li>
											<p><span>①</span>서비스 이용과 관련하여 의정원과 회원 사이에 분쟁이 발생한 경우, 의정원과 회원은 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.</p>
										</li>
										<li>
											<p><span>②</span>제1항의 규정에도 불구하고 서비스 이용으로 발생한 분쟁에 대하여 소송이 제기될 경우 의정원 소재지를 관할하는 법원을 관할법원으로 합니다.</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">부 칙</p>
									<p class="description">(시행일) 이 약관은 2023년 5월 24일부터 적용합니다.</p>
								</div>
							</div>
                        </div>
                        <div class="check_inn">
                            <label class="n_checkbox_s">
								<input type="checkbox" name="checkField">
								<span><span class="check_img"></span>이용약관에 동의합니다.</span>
							</label>
                        </div>
                    </div>
                </div>
                <div class="individual">
                    <div class="agree">
                        <h4>개인정보 수집 및 이용동의 <strong>필수</strong></h4>
                        <div class="box">
                        	<div class="provision_wrap">
								<div class="item">
									<p class="description">한국보건의료정보원은 정보주체의 동의하에 회원관리 및 양질의 서비스 제공을 위하여 다음과 같이 최소한의 개인정보를 수집하고 있습니다.</p>
									<p class="description">수집한 개인정보는 본 수집 이용 목적 외의 다른 목적으로 사용되지 않습니다.</p>
								</div>
								<div class="item">
									<p class="s_title">1. 수집하는 개인정보의 항목</p>
									<ul class="main_txt">
										<li>
											<p><span>-</span>[필수] 이메일주소, 비밀번호, 성명, 생년월일, 휴대전화번호, 소속기관, CI</p>
											<ul class="sub_txt">
												<li>
													<p><span>*</span>휴대전화번호는 본인인증기관(나이스평가정보)에서 인증 받은 휴대전화번호를 사용합니다.</p>
												</li>
											</ul>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">2. 개인정보의 수집·이용 목적</p>
									<ul class="main_txt">
										<li>
											<p><span>-</span>회원가입 및 본인인증, 홈페이지 서비스 이용</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">3. 개인정보의 보유 및 이용 기간</p>
									<ul class="main_txt">
										<li>
											<p><span>-</span>회원 탈퇴시까지</p>
											<ul class="sub_txt">
												<li>
													<p><span>*</span>최종 로그인 시점부터 2년 이상 장기 미접속자는 탈퇴처리됩니다.</p>
												</li>
											</ul>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">4. 동의를 거부할 권리가 있다는 사실과 동의 거부에 따른 불이익 내용</p>
									<ul class="main_txt">
										<li>
											<p><span>-</span>이용자는 개인정보 수집에 대한 동의를 거부할 권리가 있습니다. 다만, 동의 거부 시에는 서비스 이용이 제한될 수 있습니다.</p>
										</li>
									</ul>
								</div>
							</div>
                        </div>
                        <div class="check_inn">
                            <label class="n_checkbox_s">
								<input type="checkbox" name="checkField">
								<span><span class="check_img"></span>이용약관에 동의합니다.</span>
							</label>
                        </div>
                    </div>
                </div>
                <div class="k_cure">
                    <div class="agree">
                        <h4>제3자 정보제공 이용동의 <strong>필수</strong></h4>
                        <div class="box">
                        	<div class="provision_wrap">
								<div class="item">
									<p class="s_title">1. 개인정보를 제공받는 자</p>
									<ul class="main_txt">
										<li>
											<p><span>-</span>국립암센터, 가천대학교길병원, 건양대학교병원, 고려대학교의료원, 대구가톨릭대학교병원, 부산대학교병원, 분당서울대학교병원, 삼성서울병원, 서울대학교병원, 서울아산병원, 세브란스병원, 아주대학교병원, 전북대학교병원, 한림대학교성심병원, 화순전남대학교병원, 계명대학교동산병원, 원주세브란스병원, 충남대학교병원</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">2. 개인정보를 제공받는 자의 개인정보 이용 목적</p>
									<ul class="main_txt">
										<li>
											<p><span>-</span>K-CURE 연계자료 제공</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">3. 제공하는 개인정보의 항목</p>
									<ul class="main_txt">
										<li>
											<p><span>-</span>성명, 휴대전화번호, 이메일주소, 소속기관, 직위</p>
										</li>
									</ul>
								</div>
								<div class="item">
									<p class="s_title">4. 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 : 준영구</p>
								</div>
								<div class="item">
									<p class="s_title">5. 귀하는 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있으며, 동의를 거부하는 경우 K-CURE 연계자료를 제공받을 수 없습니다.</p>
								</div>
							</div>
                        </div>
                        <div class="check_inn">
                            <label class="n_checkbox_s">
								<input type="checkbox" name="checkField">
								<span><span class="check_img"></span>이용약관에 동의합니다.</span>
							</label>
                        </div>
                    </div>
                </div>
                <div class="all_check">
                    <div class="check_inn">
                        <div class="check_inn">
                            <label class="n_checkbox_l">
								<input type="checkbox" name="checkField">
								<span><span class="check_img"></span>이용약관에 동의합니다.</span>
							</label>
                        </div>
                    </div>
                </div>
                <div class="l_btn">
					<a href="#" onclick="goHome()" class="bc_blue">동의하지 않습니다.</a>
					<a href="#" onclick="fnAgree()" class="bc_b_line">동의합니다.</a>
                </div>
            </div>
        </div>
	</div>

</form>

 