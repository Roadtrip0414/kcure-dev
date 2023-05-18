
<%
/* =================================================================
* @FileName : ViewClbInfo.jsp
* @date: 2023. 3. 22.
* @author : hjjeon
* @설명 : 임상 라이브러리 개요
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
				<a href="/portal/dit/clb/inf/viewClbInfo.do" class="on">개요</a>
				<a href="/portal/dit/clb/mdl/viewClbDataModel.do">데이터모델</a>
			</div>
			<div class="sub_pag_title">
				<p>임상 라이브러리란?</p>
				<div class="shadow_box">
					<ul>
						<li>・ 참여 의료기관 EMR(전자의무기록)과 CDW(임상데이터베이스)에 저장된 10개 암 임상 데이터를 암종별로 항목 표준화 진행</li>
						<li>・ 표준화된 암종별 임상 데이터를 병원별 전용 클라우드로 적재하여 임상라이브러리 구축</li>
					</ul>
				</div>
			</div>
			<div class="step">
				<p>임상라이브러리 구축 단계</p>
				<ul>
					<li>암종별<br>항목 표준화</li>
					<li>참여의료기관으로부터<br>표준화된 데이터 수집</li>
					<li>표준화된 데이터<br>클라우드에 적재</li>
				</ul>
			</div>
			<div class="plan">
				<div class="sub_pag_title">
					<p>구축 계획 세부 내용</p>
				</div>
				<div class="collect">
					<div class="sub_list">
						<p>1. 암 임상 라이브러리 데이터 수집 계획</p>
						<span>의료 데이터 중심병원 대상으로 10개암 등록 환자수 (10~23년) 165만명에 대해 임상 데이터 수집</span>
					</div>
					<div class="chart_inn">
						<div class="item">
							<p>14개 기관 참여</p>
							<ul>								
								<li>・ 가천대길병원</li>
								<li>・ 건양대병원</li>
								<li>・ 고려대학교의료원</li>
								<li>・ 대구가톨릭대병원</li>
								<li>・ 부산대병원</li>
								<li>・ 분당서울대병원</li>
								<li>・ 삼성서울병원</li>
								<li>・ 서울대병원</li>
								<li>・ 서울아산병원</li>
								<li>・ 세브란스병원</li>
								<li>・ 아주대병원</li>
								<li>・ 전북대병원</li>
								<li>・ 한림대성심병원</li>
								<li>・ 화순전남대병원</li>
							</ul>
						</div>
						<div class="item">
							<p>10개암</p>
							<ul>
								<li>
									<span>1차년도 ('22)</span>
									<span>・ 위암, 유방암</span>
								</li>
								<li>
									<span>2차년도 ('23)</span>
									<span>・ 대장암, 간암</span>
								</li>
								<li>
									<span>3차년도 ('24)</span>
									<span>・ 췌담도암, 폐암, 전립선암</span>
								</li>
								<li>
									<span>4차년도 ('25)</span>
									<span>・ 자궁경부암, 신장암, 혈액암</span>
								</li>
							</ul>
						</div>
						<div class="item">
							<p>165만명</p>
							<ul>
								<li>・'10 ~ 23년 15개 병원 10개 암종 합계</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="standard">
					<div class="sub_list">
						<p>2. 데이터 표준화 방안</p>
						<ul>
							<li>・ 참여 의료기관 EMR(전자의무기록)과 CDW(임상데이터베이스)의 데이터를 진단, 검사, 약품 등 임상 영역별로 구분</li>
							<li>・ 주요 10개암 항목 정의서 개발 및 암 임상 학회 검증 ( 추후 항목 확대 및 순차적 고도화 )</li>
							<li>・ 암 임상 라이브러리의 메타데이터를 지속적으로 관리할 수 있는 데이터 속성(Data Element)과 값(Value) 관리</li>
						</ul>
					</div>
					<div class="chart_inn">
						<table>
							<colgroup>
								<col style="width: 20%">
								<col style="width: auto">
								<col style="width: auto">
								<col style="width: auto">
							</colgroup>
							<thead>
								<tr>
									<th colspan="2">구분</th>
									<th>모집단</th>
									<th>내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th colspan="2">Baseline DB</th>
									<th>모집단 전체 (암등록 환자)</th>
									<td>환자 기본, 진단정보, 수술정보, 투약정보 등 기본 진단 및 처치 정보</td>
								</tr>
								<tr>
									<th rowspan="2">암임상<br>라이브러리</th>
									<th>공통항목</th>
									<th>10개 암종</th>
									<td>
										<div>
											<ul>
												<li><strong>・ 환자</strong>가족력, 신체계측치</li>
												<li><strong>・ 진단</strong>전이, 재활</li>
												<li><strong>・ 검사</strong>진단, 영상</li>
											</ul>
											<ul>
												<li><strong>・ 병리</strong>병리생검, 병리외과전이</li>
												<li><strong>・ 수술</strong>수술정보, 합병증</li>
												<li><strong>・ 치료</strong>항암제, 방사선 등</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th>특화항목</th>
									<th>각 암종</th>
									<td>
										<div>
											<ul>
												<li><strong>・ 췌장암</strong>시술</li>
												<li><strong>・ 전립선암</strong>직장수지검사</li>
												<li><strong>・ 신장암</strong>투석</li>
											</ul>
											<ul>
												<li><strong>・ 자궁경부암</strong>세포병리</li>
												<li><strong>・ 혈액암</strong>골수검사, 이식치료 등</li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="sub_pag_title type_01">
				<p>데이터 개방 방안</p>
			</div>
			<div class="sub_list">
				<ul>
					<li>・ 외부 전문가를 포함한 (가칭)K-CURE 전문위원회에서 활용•가명처리 적정성 검토, IRB 심사 후 의료데이터 안심활용센터에서 제공</li>
				</ul>
			</div>
			<div class="chart_inn type_01">
				<img src="/images/about_loading_data_chart.svg" alt="데이터 적재 및 개방방안 이미지">
			</div>
		</div>
	</div>
</div>