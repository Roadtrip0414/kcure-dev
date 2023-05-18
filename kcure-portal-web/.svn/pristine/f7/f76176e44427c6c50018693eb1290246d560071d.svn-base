<%
/* =================================================================
* @FileName : ViewPlbInfo.jsp
* @date: 2023. 3. 22.
* @author : hjjeon
* @설명 : 공공 라이브러리 개요
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 22. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="wrap">
		<jsp:include page="/WEB-INF/jsp/kcure/portal/com/layout/inline_sub_menu.jsp">
			<jsp:param name="className" value="about" />
		</jsp:include>
		<div class="about_wrap">
			<div class="con">
				<div class="sub_tab">
					<!-- class="on" 시 색 변경 -->
					<a href="/portal/dit/plb/inf/viewPlbInfo.do" class="on">개요</a>
					<a href="/portal/dit/plb/mdl/viewPlbDataModel.do">데이터모델</a>
				</div>
				<div class="sub_pag_title">
					<p>공공라이브러리란?</p>
					<div class="shadow_box">
						<ul>
							<li>・ 모든 암 등록환자 총 450만명 의 암 등록, 국가검진, 청구데이터, 사망원인을 결합한 전주기 이력관리형 공공데이터세트</li>
						</ul>
					</div>
				</div>
				<div class="step">
					<p>공공라이브러리 구축 단계</p>
					<ul>
						<li>4개 공공기관으로부터<br>데이터 수집</li>
						<li>결합 절차에<br>따른 데이터 결합</li>
						<li>암 공공 라이브러리<br>zone에 구축</li>
					</ul>
				</div>
				<div class="plan">
					<div class="sub_pag_title">
						<p>구축 계획 세부 내용</p>
					</div>
					<div class="collect">
						<div class="sub_list">
							<p>1. 암 공공라이브러리 데이터 수집 계획</p>
							<span>・ 4개 기관, 암 등록환자 450만명 ('02년 ~ '23년) 수집</span>
							<span>・ 국립암센터(암 등록자료), 건보(자격, 보험료, 국가건강검진 등), 심평원(진료내역, 원외처방전, 상병내역 등), 통계청(사망일시•장소, 원인 등)</span>
						</div>
						<div class="chart_inn">
							<img src="/images/about_public_collect_chart.svg" alt="암 공공라이브러리 데이터 수집 계획 이미지">
						</div>
					</div>
					<div class="combine">
						<div class="sub_list">
							<p>2. 데이터 결합 절차</p>
							<span class="txt">1) 사전협의</span>
							<ul>
								<li>・ 암 공공데이터 제공 기관들이 암 공공 라이브러리 구축 과정* 협의 등 전체 구축 절차 수립</li>
							</ul>
						</div>
						<div class="sub_list">
							<span class="txt">2) 결합정보 전달</span>
							<ul>
								<li>・ 보건복지부는 결합정보(SHA-256 알고리즘, salt값 등)을 중앙암등록본부, 건보, 심평원, 통계청으로 전송</li>
							</ul>
						</div>
						<div class="sub_list">
							<span class="txt">3) 결합대상정보•결합키 전달</span>
							<ul>
								<li>・ 중앙암등록본부• 건보•심평원•통계청은 주민등록번호 기반 결합키 및 가명처리된 결합대상정보를 보건복지부로 전송</li>
								<li>・ 주민등록번호 기반 결합키를 제공받는 경우, 개인정보 식별 위험성이 높으므로 분리 보관</li>
							</ul>
						</div>
						<div class="sub_list">
							<span class="txt">4) 데이터 내부결합 (공공 라이브러리)</span>
							<ul>
								<li>・ 국가암데이터센터는 주민등록번호 기반 결합키를 사용하여 각 기관으로부터 받은 데이터를 내부결합</li>
							</ul>
						</div>
						<div class="chart_inn">
							<p>데이터 표준화 결합 절차(「가명정보의 제공절차 및 국가암데이터센터 지정•운영 등에 관한 고시」 제4조 관련)</p>
							<img src="/images/about_public_combine_chart.svg" alt="데이터 표준화 결합 절차 이미지">
						</div>
					</div>
				</div>
				<div class="sub_pag_title type_01">
					<p>데이터 적재 및 개방방안</p>
				</div>
				<div class="sub_list">
					<ul>
						<li>・ 구체적 목적(과학적 연구 및 통계작성)을 지닌 장기 보존 가능한 중앙의 암 공공 라이브러리 Zone에 병렬 테이블 형태로 구축</li>
						<li>・ 외부 전문가를 포함한 (가칭)K-CURE 전문위원회에서 활용•가명처리 적정성 검토 후, 의료데이터 안심활용센터에서 제공</li>
					</ul>
				</div>
				<div class="chart_inn type_01">
					<img src="/images/about_public_loading_chart.svg" alt="데이터 적재 및 개방방안 이미지">
				</div>
			</div>
		</div>
	</div>