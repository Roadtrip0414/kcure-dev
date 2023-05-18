<%
/* =================================================================
 * @FileName : viewSpeInf.jsp
 * @date: 2023.05.12
 * @author : bhs
 * @설명 : 특화데이터 소개
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.05.12    bhs           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="wrap">
	<jsp:include page="/WEB-INF/jsp/kcure/portal/com/layout/inline_sub_menu.jsp">
		<jsp:param name="className" value="about" />
	</jsp:include>
	<div class="data_intro_wrap">
		<div class="con">
			<div class="n_gap_box">
				<div class="n_section">
					<div class="title">
						<h3>특화 데이터란?</h3>
					</div>
					<div class="sec_white_box">
						<div class="list_txt">
							<ul>
								<li>의료 데이터 중심 병원 내 연구용 주요 질환  ( 암∙순환계∙호흡계 등 ) 고품질 한국인 특화 DB, 인공지능 기초학습 DB등의 연구데이터</li>
								<li>암·심뇌혈관·호흡기(코로나19) 등 특화데이터 및 인공지능 학습에 필요한 데이터 셋을 구축해서 제공함으로써 다양한 의료데이터 기반의 연계‧분석이 가능할 수 있도록 데이터 활용 기반 조성 추진</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="n_section">
					<div class="title">
						<h3>활용절차</h3>
					</div>
					<div class="sec_white_box">
						<img src="/images/util_procedure_img.svg" alt="활용절차 이미지">
						<div class="point_txt">
							<p><span>① 데이터 소개 : </span>K-CURE 포털 데이터 개요, 항목, 신청 절차 등 소개 및 신청 링크 제공</p>
							<p><span>② 데이터 신청 : </span>데이터 제공기관 절차에 따라 신청</p>
							<p><span>③ 심의 : </span>데이터 제공 심의 및 타 기관 데이터 반출 심의 데이터 제공기관 외 타 기관 안심활용센터로 데이터 반출 시</p>
							<p><span>④ 활용 장소 협의 : </span>데이터 활용 공간 협의</p>
							<p><span>⑤ 분석 및 결과반출 요청 : </span>분석 수행 및 연구결과 반출 신청</p>
							<p><span>⑥ 결과 반출 심의 : </span>안심활용센터 관리기관 내 심의, 반출</p>
						</div>
					</div>
				</div>
				<div class="n_section">
					<div class="title">
						<h3>목적 및 기대효과</h3>
					</div>
					<div class="sec_white_box">
						<div class="list_txt">
							<ul>
								<li>컨소시엄별 구축된 데이터와 개방형 연구지원 포털을 기반으로 의료기관별 의료데이터를 공개하고, 산·학·연·병 등이 공동으로 참여하는 다기관 공동 연구 활성화에 기여</li>
								<li>암·심뇌혈관·호흡기(코로나19) 등 특화데이터 및 인공지능 학습에 필요한 데이터 셋을 구축함으로서</li>
								<li>다양한 의료데이터 기반의 연계‧분석이 가능할 수 있도록 데이터 활용 기반 조성 추진</li>
								<li>고품질 연구데이터 생산 및 분양 시스템 구축, 글로벌 비즈니스 모델 개발 등 데이터 중심 병원의 자립적 생태계 모델로 발전</li>
							</ul>
						</div>
					</div>
				</div>
				<a href="javascript:void(0)" class="summit_btn">특화 데이터 검색</a>
			</div>
		</div>
	</div>
</div>