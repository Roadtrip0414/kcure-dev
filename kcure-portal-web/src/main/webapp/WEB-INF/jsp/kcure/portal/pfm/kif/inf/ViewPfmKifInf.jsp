<%
/* =================================================================
 * @FileName : ViewPfmKifInf.jsp
 * @date: 2023.03.22
 * @author : parkgu
 * @설명 : K-CURE 서비스 개요
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.03.22     parkgu           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- container -->
	<div class="wrap">
		<jsp:include page="/WEB-INF/jsp/kcure/portal/com/layout/inline_sub_menu.jsp">
			<jsp:param name="className" value="intro" />
		</jsp:include>

		<div class="intro_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>K-CURE 사업 개요</p>
					<div class="shadow_box">
						<ul>
							<li>・ 임상 및 공공 데이터를 결합한 연계 서비스 제공 및 안심활용센터를 구축하여 데이터 활용 개방을 위한 연구 생태계를 조성</li>
							<li>・ 맞춤형 치료 및 질환 예측 연구의 질적 도약을 위한 기반 마련</li>
							<li>・ 의료기관에 축적된 데이터 활용 AI 기반 연구 및 기술 개발 추진</li>
							<li>・ 치료의 질 향상을 통한 의료서비스 확대</li>
						</ul>
					</div>
				</div>
				<div class="service">
					<p>K-CURE 빅데이터 연구 생태계 조성</p>
					<img src="/images/service_img_01.svg" alt="K-CURE 빅데이터 연구 생태계 조성 이미지">
				</div>
			</div>
		</div>
		<div class="intro_sub_wrap">
			<div class="con">
				<div class="tab_nav_wrap">
					<div class="tab_btn">
						<a href="javascript:void(0)" class="on">K-CURE(임상데이터 네트워크) 추진배경</a>
						<a href="javascript:void(0)" class="">K-CURE 운영관리 시스템 구성도</a>
						<a href="javascript:void(0)" class="">K-CURE 포털 서비스 기능</a>
					</div>
					<div class="tab_con">
						<div class="item">
							<div class="network">
								<ul>
									<li class="img"><img src="/images/network_icon_01.svg" alt="추진배경 아이콘"></li>
									<li class="title">추진배경</li>
									<li class="txt">
										<p>・ 임상+공공, 건강검진, 사망통계 등 다양한 데이터 결합의 필요성 대두</p>
										<p>・ 질환별 빅데이터에 대한 접근성 향상 시급</p>
									</li>
								</ul>
								<ul>
									<li class="img"><img src="/images/network_icon_02.svg" alt="추진목적 아이콘"></li>
									<li class="title">추진목적</li>
									<li class="txt">
										<p>・ 임상 및 공공데이터를 결합한 연계 서비스 제공 및 안심활용센터를 구축하여 데이터 활용 개방을 위한 연구 생태계 조성</p>
										<p>・ 질환별 라이브러리 구축 및 데이터 활용 기반 마련</p>
									</li>
								</ul>
								<ul>
									<li class="img"><img src="/images/network_icon_03.svg" alt="사업내용 아이콘"></li>
									<li class="title">사업내용</li>
									<li class="txt">
										<p>・ 선행 모델의 임상 데이터 네트워크 조성</p>
										<p>・ 암 데이터의 후향적 연구를 위한 데이터 구축</p>
										<p>・ 안전하고 다양한 분석지원을 위한 안심활용 플랫폼 구축</p>
										<p>・ 데이터 활용을 위한 공동 협의체 구성 및 관리 체계 수립</p>
									</li>
								</ul>
							</div>
						</div>
						<div class="item">
							<img src="/images/system_img.svg" alt="K-CURE 운영관리 시스템 구성도">
						</div>
						<div class="item">
							<div class="list">
								<p>데이터 맵</p>
								<div class="kc_white_box">
									<span>암 임상ㆍ공공 라이브러리, 연계결합DB 등 보건의료 데이터의 기초통계 등 활용 가능한 데이터셋의 검색</span>
									<div class="info">
										<ul>
											<li><img src="/images/sys_data_map_01.svg" alt="암 임상데이터 아이콘"></li>
											<li>암 임상데이터</li>
										</ul>
										<ul>
											<li><img src="/images/sys_data_map_02.svg" alt="공공데이터 아이콘"></li>
											<li>공공데이터</li>
										</ul>
										<ul>
											<li><img src="/images/sys_data_map_03.svg" alt="보건의료데이터 아이콘"></li>
											<li>보건의료데이터</li>
										</ul>
										<ul>
											<li><img src="/images/sys_data_map_04.svg" alt="질환별 특화데이터 아이콘"></li>
											<li>질환별 특화데이터</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="list">
								<p>연구지원</p>
								<div class="kc_white_box">
									<span>데이터 신청, 활용 승인, 반출 등 심의를 유기적으로 지원하기 위해 데이터 신청 관리</span>
								</div>
							</div>
							<div class="list">
								<p>연구컨설팅</p>
								<div class="kc_white_box">
									<span>연구 설계 지원, 메타데이터 관리, 연구 데이터 생성 등 연구 데이터 활용 지원 및 연구수요자 매칭</span>
								</div>
							</div>
							<div class="list">
								<p>데이터 관제</p>
								<div class="kc_white_box">
									<span>연구데이터 생성-폐기의 전 주기 관리, 오남용 방지 등 주기적인 모니터링 및 품질관리 수행</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- //container -->