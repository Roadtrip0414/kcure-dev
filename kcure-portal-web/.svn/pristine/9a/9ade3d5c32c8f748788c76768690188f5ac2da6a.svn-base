<%
/* =================================================================
 * @FileName : main.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 메인 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */ 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	alert('${loginVO.usrMnuMode}');
});

function goBbsNtc(nttId){
	if (nttId != "") {
		$("#bbsNtcNttId").val(nttId);
		$("#bbsNtcForm").attr("action", "/portal/bbs/ntc/detailViewNtc.do").submit();
	} else {
		window.location.href = "/portal/bbs/ntc/viewNtc.do";
	}
}

function goBbsFaq(){
	window.location.href = "/portal/bbs/faq/viewFaq.do";
}
</script>

<!-- container -->
<form id="bbsNtcForm" name="bbsNtcForm" method="post">
	<input type="hidden" name="bbsId" id="bbsNtcId" value="BBSMSTR_000000000001"/>
	<input type="hidden" name="nttId" id="bbsNtcNttId" value=""/>
	<input type="hidden" name="pageIndex" id="bbsNtcPageIndex" value="1"/>
</form>

	<div class="wrap">
		<div class="main_view_wrap">
			<div class="con">
				<div class="sub_title">임상데이터와 공공데이터의 결합을 통한</div>
				<div class="main_title">보건의료데이터 활용 플랫폼</div>
				<div class="main_search">
					<input type="text" class="user_int">
					<a href="javascript:void(0)" class="sh_btn"></a>
				</div>
				<div class="keyword">
					<a href="javascript:void(0)">#공공데이터</a>
					<a href="javascript:void(0)">#임상데이터</a>
					<a href="javascript:void(0)">#유방암</a>
				</div>
				<div class="quick_menu">
					<a href="javascript:void(0)">
						<ul>
							<li><img src="/images/quick_img_01.svg" alt="K-CURE 바로가기"></li>
							<li>K-CURE</li>
						</ul>
					</a>
					<a href="javascript:void(0)">
						<ul>
							<li><img src="/images/quick_img_02.svg" alt="의료데이터중심병원 지원사업 바로가기"></li>
							<li>의료데이터중심병원<br>지원사업</li>
						</ul>
					</a>
					<a href="javascript:void(0)">
						<ul>
							<li><img src="/images/quick_img_03.svg" alt="데이터 시각화 바로가기"></li>
							<li>데이터 시각화</li>
						</ul>
					</a>
					<a href="javascript:void(0)">
						<ul>
							<li><img src="/images/quick_img_04.svg" alt="데이터 활용신청 바로가기"></li>
							<li>데이터 활용신청</li>
						</ul>
					</a>
					<a href="javascript:void(0)">
						<ul>
							<li><img src="/images/quick_img_05.svg" alt="안심활용센터소개 바로가기"></li>
							<li>안심활용센터소개</li>
						</ul>
					</a>
				</div>
				<div class="data_link">
					<a href="javascript:void(0)">
						<ul>
							<li>암 공공</li>
							<li>111건 / <span>98종</span></li>
						</ul>
					</a>
					<a href="javascript:void(0)">
						<ul>
							<li>보건의료</li>
							<li>111건 / <span>98종</span></li>
						</ul>
					</a>
					<a href="javascript:void(0)">
						<ul>
							<li>암 임상</li>
							<li>111건 / <span>98종</span></li>
						</ul>
					</a>
					<a href="javascript:void(0)">
						<ul>
							<li>의료데이터 중심병원특화DB</li>
							<li>111건 / <span>98종</span></li>
						</ul>
					</a>
				</div>
				<div class="data_update">업데이트 : 2023-01-08</div>
			</div>
		</div>
		<div class="latest_wrap">
			<div class="con">
				<div class="data">
					<div class="title">
						<p>최신데이터</p>
						<a href="javascript:void(0)" class="more">
							<img src="/images/more_icon.svg" alt="더보기 버튼">
						</a>
					</div>
					<div class="item">
						<a href="javascript:void(0)">
							<ul>
								<li>01</li>
								<li>유방암 임상 라이브러리 글자 넘침테스트 글자 넘침 테스트 글자 넘침 테스트</li>
							</ul>
						</a>
						<a href="javascript:void(0)">
							<ul>
								<li>02</li>
								<li>위암 임상 라이브러리</li>
							</ul>
						</a>
						<a href="javascript:void(0)">
							<ul>
								<li>03</li>
								<li>대장암 임상 라이브러리</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="data">
					<div class="title">
						<p>인기데이터</p>
						<a href="javascript:void(0)" class="more">
							<img src="/images/more_icon.svg" alt="더보기 버튼">
						</a>
					</div>
					<div class="item">
						<a href="javascript:void(0)">
							<ul>
								<li>01</li>
								<li>유방암 임상 라이브러리 글자 넘침테스트 글자 넘침 테스트 글자 넘침 테스트</li>
							</ul>
						</a>
						<a href="javascript:void(0)">
							<ul>
								<li>02</li>
								<li>위암 임상 라이브러리</li>
							</ul>
						</a>
						<a href="javascript:void(0)">
							<ul>
								<li>03</li>
								<li>대장암 임상 라이브러리</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="slide">
					<div class="top">
						<ul>
							<li>1</li>
							<li>/</li>
							<li></li>
							<li class="push_btn"><a href="javascript:void(0)"></a></li>
						</ul>
					</div>
					<div class="item">
						<div class="list">
							<a href="javascript:void(0)">
								<ul>
									<li>K-CURE<br>PLATFORMS_1</li>
									<li>암 데이터뿐 아니라 환자의 전 생애에 걸쳐<br>나타나는 의료관련 데이터를 제공합니다</li>
								</ul>
							</a>
						</div>
						<div class="list">
							<a href="javascript:void(0)">
								<ul>
									<li>K-CURE<br>PLATFORMS_2</li>
									<li>암 데이터뿐 아니라 환자의 전 생애에 걸쳐<br>나타나는 의료관련 데이터를 제공합니다</li>
								</ul>
							</a>
						</div>
						<div class="list">
							<a href="javascript:void(0)">
								<ul>
									<li>K-CURE<br>PLATFORMS_3</li>
									<li>암 데이터뿐 아니라 환자의 전 생애에 걸쳐<br>나타나는 의료관련 데이터를 제공합니다</li>
								</ul>
							</a>
						</div>
						<div class="list">
							<a href="javascript:void(0)">
								<ul>
									<li>K-CURE<br>PLATFORMS_4</li>
									<li>암 데이터뿐 아니라 환자의 전 생애에 걸쳐<br>나타나는 의료관련 데이터를 제공합니다</li>
								</ul>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="request_wrap">
			<div class="con">
				<a href="javascript:void(0)">
					<p>공공데이터 신청 &gt;</p>
					<span>암 관리법에 근거하여 공공기관에<br>데이터 신청할 수 있습니다.</span>
				</a>
				<a href="javascript:void(0)">
					<p>임상데이터 신청 &gt;</p>
					<span>서울대병원, 부산대병원, 세브란스병원<br>등을 통해 임상 라이브러리를<br>신청할 수 있습니다.</span>
				</a>
				<a href="javascript:void(0)">
					<p>결합데이터 신청 &gt;</p>
					<span>공공과 임상이 결합된 데이터를 <br>신청하실 수 있습니다.</span>
				</a>
			</div>
		</div>
		<div class="latest_wrap">
			<div class="con">
				<div class="data">
					<div class="title">
						<p>공지사항</p>
						<a href="javascript:goBbsNtc('');" class="more">
							<img src="/images/more_icon.svg" alt="더보기 버튼">
						</a>
					</div>
					<div class="item">
						<c:if test="${fn:length(bbsNtcList) == 0}">
							<a href="javascript:void(0)">
								<ul>
									<li></li>
									<li>등록된 내용이 없습니다.</li>
									<li></li>
								</ul>
							</a>
						</c:if>
						<c:forEach items="${bbsNtcList}" var="list" varStatus="rowInx" >
							<a href="javascript:goBbsNtc('${list.nttId}');">
								<ul>
									<li>0${rowInx.index+1}</li>
									<li>${list.nttSj}</li>
									<li>${list.frstRegistDt}</li>
								</ul>
							</a>
						</c:forEach>
					</div>
				</div>
				<div class="data">
					<div class="title">
						<p>자주묻는질문</p>
						<a href="javascript:goBbsFaq();" class="more">
							<img src="/images/more_icon.svg" alt="더보기 버튼">
						</a>
					</div>
					<div class="item">
						<c:if test="${fn:length(bbsFaqList) == 0}">
							<a href="javascript:void(0)">
								<ul>
									<li></li>
									<li>등록된 내용이 없습니다.</li>
								</ul>
							</a>
						</c:if>
						<c:forEach items="${bbsFaqList}" var="list" varStatus="rowInx" >
							<a href="javascript:goBbsFaq();">
								<ul>
									<li>0${rowInx.index+1}</li>
									<li>${list.nttSj}</li>
								</ul>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="main_logo_wrap">
			<div class="con">
				<div class="logo">
					<a href="javascript:void(0)">
						<img src="/images/samsung_logo.svg" alt="삼성서울병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/gachon_logo.svg" alt="가천대길병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/konyang_logo.svg" alt="건양대학교병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/korea_uni_logo.svg" alt="고려대학교안암병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/daegu_logo.svg" alt="대구가톨릭대학교병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/pusan_logo.svg" alt="부산대학교병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/bun_seoul_logo.svg" alt="분당서울대학교병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/seoul_uni_logo.svg" alt="서울대학교병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/seoul_asan_logo.svg" alt="서울아산병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/yonsei_logo.svg" alt="세브란스병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/ajou_logo.svg" alt="아주대학교로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/jeonbuk_logo.svg" alt="전북대학교병원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/hallym_uni_logo.svg" alt="한림대학교의료원로고">
					</a>
					<a href="javascript:void(0)">
						<img src="/images/chonnam_logo.svg" alt="화순전남대학교병원로고">
					</a>
				</div>
			</div>
		</div>
	</div>
<!-- //container -->