<%
/* =================================================================
* @FileName : ViewClcInfSummary
* @date: 2023. 2. 20.
* @author : hjjeon
* @설명 : 임상 개요
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 20. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">

//신청하기
function fnApply(){
	$("#applyFrm").attr("action","/portal/dac/clc/inf/viewClcInfTermAgree.do").submit();
}


/* 서식다운로드  */
function tempDownFile(fileAttNmSpcd){
	$('#downLoadFilefrm #fileAttNmSpcd').val(fileAttNmSpcd);
    $('#downLoadFilefrm').attr("action", "/portal/dac/clc/inf/tempFileDown.do");
    $('#downLoadFilefrm').submit();
}

</script>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="about">
			<ul>
				<li>결합 데이터 신청</li>
			</ul>
		</div>
	</div>
	<div class="proposal_data_wrap">
		<div class="con">
			<div class="n_gap_box">
				<div class="n_section">
					<div class="guide_line">
						<div class="con_title">
							<h3>결합 데이터 신청 절차 안내</h3>
							<p>결합 데이터는 다음과 같은 절차를 통해 제공되며 <span>“나의연구”</span>에서 진행 현황을 확인하실 수 있습니다.</p>
						</div>
						<a onclick="fnApply();" class="btn">데이터 신청</a>
					</div>
				</div>
				<div class="n_section">
					<div class="detail_step">
						<div class="item">
							<img src="/images/data_step_01.svg" alt="데이터 신청 아이콘">
							<ul>
								<li>데이터 신청</li>
								<li>신청서류 작성</li>
							</ul>
						</div>
						<div class="item">
							<img src="/images/data_step_02.svg" alt="신청서류 검토 아이콘">
							<ul>
								<li>신청서류 검토</li>
							</ul>
						</div>
						<div class="item">
							<img src="/images/data_step_03.svg" alt="데이터 제공심의 아이콘">
							<ul>
								<li>데이터 제공심의</li>
							</ul>
						</div>
						<div class="item">
							<img src="/images/data_step_04.svg" alt="결합프로세스 진행 아이콘">
							<ul>
								<li>결합프로세스 진행</li>
							</ul>
						</div>
						<div class="item">
							<img src="/images/data_step_05.svg" alt="데이터 제공 아이콘">
							<ul>
								<li>데이터 제공</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="n_section">
					<div class="title">
						<h3>세부 신청 절차 안내</h3>
					</div>
					<img src="/images/pcd_guide_03.svg" width="1225" alt="임상 데이터 세부 신청 잘차 안내 이미지">
				</div>
				<div class="n_section">
					<div class="title">
						<h3>K-CURE 데이터 신청</h3>
					</div>
					<div class="sec_white_box">
						<div class="list_txt">
							<ul>
								<li>임상 ∙ 공공라이브러리를 활용하기 위한 연구를 신청합니다.</li>
								<li>모든 연구참여인원인 회원가입이 되어있어야 합니다.</li>
								<li>연구책임자는 국내 거주 중인 내국인에 한하며, 학위논문목적으로 자료를 신청하는 경우 학위논문작성자를 등록해 주시기 바랍니다.</li>
								<li>진행과정은 이메일과 SMS를 통해 신청자 및 연구책임자에게 안내되오니, 수신동의 여부를 반드시 확인하여 주시기 바랍니다.</li>
								<li>동일 연구에 대해 변경사항이 있을 경우, 나의연구에서 변경신청을 진행해 주시기 바랍니다.</li>
								<li>연구와 무관한 데이터를 신청하실 경우 반려될수 있으니, 반드시 실제 연구에 필요한 변수만 신청하여 주시기 바랍니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="n_section">
					<div class="title">
						<h3>잠깐!!!<span>데이터 신청 전 주의사항을 확인해 주세요.</span></h3>
					</div>
					<div class="precaution">
						<div class="item">
							<img src="/images/precaution_icon_01.svg" alt="승인확인 아이콘">
							<ul>
								<li>승인확인</li>
								<li>K-CURE 승인받은 연구자</li>
							</ul>
						</div>
						<div class="item">
							<img src="/images/precaution_icon_02.svg" alt="데이터셋 다운로드 아이콘">
							<ul>
								<li>데이터셋 다운로드</li>
								<li>임상라이브러리<br>데이터셋 확인해주세요</li>
							</ul>
						</div>
						<div class="item">
							<img src="/images/precaution_icon_03.svg" alt="수신동의 확인 아이콘">
							<ul>
								<li>수신동의 확인</li>
								<li>신청 이후 진행결과는<br>SMS, 이메일 통해 안내</li>
							</ul>
						</div>
						<div class="item">
							<img src="/images/precaution_icon_04.svg" alt="양식다운로드 아이콘">
							<ul>
								<li>양식다운로드</li>
								<li>신청 제출 서류양식<br>확인해주세요.</li>
							</ul>
						</div>
					</div>
				</div>
				<a onclick="fnApply();" class="summit_btn">데이터 신청</a>
			</div>
		</div>
	</div>
</div>
<form id="applyFrm" name="applyFrm" method="post">
	<input type="hidden" name="dataTpcd" value="03"/>
</form>

<!-- 파일 다운로드폼 -->
<form name="downLoadFilefrm" id="downLoadFilefrm" action="" method="post" style="display: none;" >
	<input type="hidden" id="fileAttNmSpcd" name="fileAttNmSpcd">
</form>

<!-- title 및 navi -->
<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/clcInfCommon.jsp"%> 