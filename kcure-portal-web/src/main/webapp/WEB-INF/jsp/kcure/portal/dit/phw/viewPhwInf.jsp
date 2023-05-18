<%
/* =================================================================
 * @FileName : viewPhwInf.jsp
 * @date: 2023.05.12
 * @author : bhs
 * @설명 : 보건복지 공공데이터 소개
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
						<h3>보건 복지 공공 데이터란?</h3>
					</div>
					<div class="sec_white_box">
						<div class="list_txt">
							<ul>
								<li>보건복지부는 보건의료 분야와 관련한 공공데이터를 파일, 이미지, 동영상 등 여러 형태로 국민에게 제공함으로써, 민간 활용을 통한  신규 비즈니스와 일자리 창출, 국민 편익을 향상하시 위해 도모하고 있습니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="n_section">
					<div class="introduce">
						<div class="list">
							<div class="info">
								<p class="title">보건의료 데이터</p>
								<p class="txt">보건 의료 분야 9개 기관의 데이터를 개인 단위로<br>결합, 공공적 목적 연구에 활용할 수 있도록 연구자에게 개방하고 있습니다.</p>
								<a href="https://hcdl.mohw.go.kr/" class="btn">데이터 신청</a>
							</div>
							<div class="img"></div>
						</div>
						<div class="list">
							<div class="info">
								<p class="title">분산연구네트워크</p>
								<p class="txt">보건 의료 데이터를 안전하고 편의성 높게 활용하기 위한 보건 의료 데이터<br>개방 정책 기조에 따라, 샘플데이터 다운로드 및 용어매핑 조회 기능을<br>제공하고 있습니다.</p>
								<a href="https://hcdl.mohw.go.kr/" class="btn">데이터 신청</a>
							</div>
							<div class="img"></div>
						</div>
						<div class="list">
							<div class="info">
								<p class="title">보건의료 공공데이터 목록</p>
								<p class="txt">보건복지부는 보건의료 분야의 공공데이터를<br>파일데이터, 오픈API, 표준데이터셋 등 여러 형태로 제공해드립니다.</p>
								<a href="javascript:void(0)" class="btn" onclick='doSearchShortcut("보건복지")'>데이터 신청</a>
							</div>
							<div class="img"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>