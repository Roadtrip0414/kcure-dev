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
	//메뉴 디자인 요소를 위해
	if('${loginVO.usrMnuMode}' == '02'){
		$('body').addClass('admin').addClass('set');
	}
});

</script>

	<div class="wrap">
		<div class="main_search_wrap">
			<div class="con">
				<div class="search">
					<p>임상데이터와 공공데이터의 결합을 통한</p>
					<h2>보건의료데이터 활용 플랫폼</h2>
					<div class="sh_int">
						<input type="text" id="input_main_search">
						<a href="javascript:void(0)">
							<img src="/images/main_sh_icon.svg" alt="검색버튼 이미지" onclick='doSearchKeyword("input_main_search")'>
						</a>
					</div>
					<div class="keyword">
						<f onclick='doSearchShortcut("공공데이터")'>#공공데이터</f>
						<f onclick='doSearchShortcut("임상데이터")'>#임상데이터</f>
						<f onclick='doSearchShortcut("유방암")'>#유방암</f>
						<f onclick='doSearchShortcut("위암")'>#위암</f>
						<f onclick='doSearchShortcut("대장암")'>#대장암</f>
					</div>
				</div>
				<img src="/images/main_vs_img.svg" alt="메인 이미지">
			</div>
		</div>
		<div class="main_intro_wrap">
			<div class="con">
				<h2>Why, K-CURE?</h2>
				<p>임상데이터와 공공데이터의 결합을 통한</p>
				<div class="list">
					<div class="item">
						<p class="title">대한민국 전체 암 데이터의<br>85% 보유</p>
						<span class="txt">임상 10개암 165만명<br>공공 450만명</span>
					</div>
					<div class="item">
						<p class="title">데이터 이용 신청, 활용,<br>반출까지 간편하게 관리</p>
						<span class="txt">적극적 데이터 개방 확대 및<br>연구 생태계 구축</span>
					</div>
					<div class="item">
						<p class="title">임상과 공공데이터 결합으로<br>높은 데이터 활용가치</p>
						<span class="txt">평면적 데이터를 보다 심층적<br>역동적으로 연구 가능</span>
					</div>
				</div>
			</div>
		</div>
		<div class="main_request_wrap">
			<div class="con">
				<h2>데이터 신청</h2>
				<div class="list">
					<div class="item">
						<p>암공공</p>
						<img src="/images/main_request_img_01.svg" alt="암공공 아이콘">
						<!-- strong테그에 숫자가 움직여야함 -->
						<span><strong>111</strong>건</span>
						<a href="/portal/dit/plb/inf/viewPlbInfo.do">자세히보기	&gt;</a>
					</div>
					<div class="item">
						<p>암임상</p>
						<img src="/images/main_request_img_02.svg" alt="암임상 아이콘">
						<!-- strong테그에 숫자가 움직여야함 -->
						<span><strong>111</strong>건</span>
						<a href="/portal/dit/clb/inf/viewClbInfo.do">자세히보기	&gt;</a>
					</div>
					<div class="item">
						<p>특화</p>
						<img src="/images/main_request_img_03.svg" alt="특화 아이콘">
						<!-- strong테그에 숫자가 움직여야함 -->
						<span><strong>111</strong>건</span>
						<a href="/portal/dit/spe/inf/viewSpeInf.do">자세히보기	&gt;</a>
					</div>
					<div class="item">
						<p>보건의료</p>
						<img src="/images/main_request_img_04.svg" alt="보건의료 아이콘">
						<!-- strong테그에 숫자가 움직여야함 -->
						<span><strong>111</strong>건</span>
						<a href="/portal/dit/phw/inf/viewPhwInf.do">자세히보기	&gt;</a>
					</div>
				</div>
			</div>
		</div>
		<div class="main_visual_wrap">
			<div class="con">
				<div class="title">
					<h2>데이터 시각화</h2>
					<p>약 300여종의 데이터를 암종별, 항목별로 그래프로 제공하고 있어요!</p>
					<span>*본 항목별 그래프는 승인된 연구자에게만 제공됩니다.</span>
				</div>
			</div>
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="/images/main_chart_01.png" alt="월 평균 음주량에 따른 환자 수 차트 이미지">
						<p>월 평균 음주량에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_02.png" alt="수술 종류 코드에 따른 환자 수 차트 이미지">
						<p>수술 종류 코드에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_03.png" alt="약제 성분에 따른 환자 수 차트 이미지">
						<p>수술 종류 코드에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_04.png" alt="월 평균 음주량에 따른 환자 수 차트 이미지">
						<p>수술 종류 코드에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_01.png" alt="월 평균 음주량에 따른 환자 수 차트 이미지">
						<p>월 평균 음주량에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_02.png" alt="약제 성분에 따른 환자 수 차트 이미지">
						<p>약제 성분에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_03.png" alt="월 평균 음주량에 따른 환자 수 차트 이미지">
						<p>월 평균 음주량에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_01.png" alt="월 평균 음주량에 따른 환자 수 차트 이미지">
						<p>월 평균 음주량에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_02.png" alt="수술 종류 코드에 따른 환자 수 차트 이미지">
						<p>수술 종류 코드에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_03.png" alt="약제 성분에 따른 환자 수 차트 이미지">
						<p>수술 종류 코드에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_04.png" alt="월 평균 음주량에 따른 환자 수 차트 이미지">
						<p>수술 종류 코드에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_01.png" alt="월 평균 음주량에 따른 환자 수 차트 이미지">
						<p>월 평균 음주량에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_02.png" alt="약제 성분에 따른 환자 수 차트 이미지">
						<p>약제 성분에 따른 환자 수</p>
					</div>
					<div class="swiper-slide">
						<img src="/images/main_chart_03.png" alt="월 평균 음주량에 따른 환자 수 차트 이미지">
						<p>월 평균 음주량에 따른 환자 수</p>
					</div>
				</div>
			</div>
			<div class="l_btn">
				<a href="/portal/dvz/clb/viewScmIntroduce.do" class="bc_blue">데이터 시각화 보기</a>
			</div>
		</div>
		<div class="latest_wrap">
			<div class="con">
				<div class="data">
					<div class="title">
						<p>새로운 소식</p>
					</div>
					<div class="list">
						<c:if test="${fn:length(bbsNtcList) == 0}">
						<div class="item">
							<a href="javascript:void(0)">
								<!-- class="notice" 공지사항 | class="news" 소식 -->
								등록된 내용이 없습니다.
							</a>
							<p></p>
						</div>
						</c:if>
						<c:forEach items="${bbsNtcList}" var="list" varStatus="rowInx" >
						<div class="item">
							<!--
							<a href="javascript:goBbsNtc('${list.nttId}', '${list.bbsId}');">
							 -->
							 <c:set var="bbsUrl" value="${list.bbsId eq 'BBSMSTR_000000000001' ? '/portal/bbs/ntc/detailViewNtc.do' : '/portal/bbs/kcn/detailViewKcn.do'}"/>
							 <a href="${bbsUrl}?bbsId=${list.bbsId}&nttId=${list.nttId}">
								<!-- class="notice" 공지사항 | class="news" 소식 -->
								<span class="news">${list.bbsId eq 'BBSMSTR_000000000001' ? '공지사항' : 'K-CURE 소식'}</span>${list.nttSj}
							</a>
							<p>${list.frstRegistDt}</p>
						</div>
						</c:forEach>
						<c:if test="${fn:length(bbsNtcList) ne 0}">
						<c:forEach var="tmp" begin="1" end="${4 - fn:length(bbsNtcList)}">
						<div class="item"></div>
						</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="slide">
					<div class="top">
						<h2>알리미</h2>
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
								<img src="/images/inform_sample_img.png" alt="알리미 이미지">
							</a>
						</div>
						<div class="list">
							<a href="javascript:void(0)">
								<img src="/images/inform_sample_img.png" alt="알리미 이미지">
							</a>
						</div>
						<div class="list">
							<a href="javascript:void(0)">
								<img src="/images/inform_sample_img.png" alt="알리미 이미지">
							</a>
						</div>
						<div class="list">
							<a href="javascript:void(0)">
								<img src="/images/inform_sample_img.png" alt="알리미 이미지">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="site_link_wrap">
			<div class="con">
				<a href="javascript:void(0)" class="link_push_btn"></a>
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
<script type="text/javascript">
$("#input_main_search").keydown(function (event) {
	if (event.keyCode === 13) {
		event.preventDefault();
		let elemInputMainSearch = document.getElementById("input_main_search");
		$("#searchKeyword").val(elemInputMainSearch.value);
		$("#searchFrm").submit();
	}
});
</script>	
<!-- //container -->

<!-- gony -->
