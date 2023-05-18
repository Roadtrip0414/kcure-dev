<%
/* =================================================================
 * @FileName : ViewPfmKifUse.jsp
 * @date: 2023.03.22
 * @author : parkgu
 * @설명 : 안심활용센터소개
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
					<p>안심활용센터 소개</p>
					<div class="shadow_box">
						<ul>
							<li>・ 안심활용센터는 다양한 보건의료데이터를 과학적, 학술적 목적을 위해 안전하게 활용할 수 있도록 ‘데이터’를 지원하고 ‘환경’을 제공하는 센터입니다.</li>
							<li>・ 안심활용센터는 보건의료데이터 활용 접근 불균형 해소를 위해 서울 뿐만아니라 권역별 안심활용센터를 지정ㆍ운영하고 있습니다．</li>
						</ul>
					</div>
				</div>
                <div class="map_img">
                    <img src="/images/safe_center_map.svg" alt="안심활용센터 소개 이미지">
					<a href="javascript:void(0)" class="capital"></a>
					<a href="javascript:void(0)" class="gangwon"></a>
					<a href="javascript:void(0)" class="chungcheong"></a>
					<a href="javascript:void(0)" class="gyeongsang"></a>
                </div>
                <div class="provide_insti">
                    <div class="sm_title">
                        <p>데이터 제공기관</p>
                    </div>
                    <div class="provide_slide">
                        <div class="slide">
                            <div class="lg">
                                <img src="/images/p_k_cure_logo.svg" alt="케이큐어 로고">
                            </div>
                            <div class="txt">
                                <ul>
                                    <li>K-CURE</li>
                                    <li>
                                        전국 의료데이터<br>중심병원 40개
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="slide">
                            <div class="lg">
                                <img src="/images/p_nation_health_logo.svg" alt="국민건강보험">
                            </div>
                            <div class="txt">
                                <ul>
                                    <li>국민건강보험</li>
                                    <li>
                                        진료내역정보, 약품처방내역정보,<br>건강검진정보 관리 등의 업무를 통해<br>국민건강향상에 이바지하는 기관
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="slide">
                            <div class="lg">
                                <img src="/images/p_cancer_logo.svg" alt="국립암센터 로고">
                            </div>
                            <div class="txt">
                                <ul>
                                    <li>국립암센터</li>
                                    <li>
                                        암빅데이터 및 인공지능을<br>활용한 첨단 융복합 암 연구의<br>선도기관입니다.
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="slide">
                            <div class="lg">
                                <img src="/images/p_insure_logo.svg" alt="건강보험심사평가원 로고">
                            </div>
                            <div class="txt">
                                <ul>
                                    <li>건강보험심사평가원</li>
                                    <li>
                                        요양 급여비용의 심사 및 요양급여의<br>적정성 평가업무를 수행하여<br>국민보건의 향상과<br>사회보장 증진에 기여하는 기관
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="slide">
                            <div class="lg">
                                <img src="/images/p_disease_logo.svg" alt="질병청 로고">
                            </div>
                            <div class="txt">
                                <ul>
                                    <li>질병청</li>
                                    <li>
                                        방역·검역 등 감염병에 관한<br>사무 등에 관한 조사·시험·연구에<br>관한 사무를 관장하는 기관
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="slide">
                            <div class="lg">
                                <img src="/images/p_ilsan_logo.svg" alt="건강보험공단일산병원 로고">
                            </div>
                            <div class="txt">
                                <ul>
                                    <li>건강보험공단일산병원</li>
                                    <li>
                                        보험자 직영 병원으로서<br>의료 공공서비스 수준을<br>높이려고 설립된 병원
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="slide">
                            <div class="lg">
                                <img src="/images/p_rehalbilitate.svg" alt="국립재활원 로고">
                            </div>
                            <div class="txt">
                                <ul>
                                    <li>국립재활원</li>
                                    <li>
                                        장애인의 복지증진을 위한<br>진료 및 지역사회중심재활 등의<br>업무를 관장하는 기관
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="slide">
                            <div class="lg">
                                <img src="/images/p_organ.svg" alt="국립장기조직혈액관리원 로고">
                            </div>
                            <div class="txt">
                                <ul>
                                    <li>국립장기조직혈액관리원</li>
                                    <li>
                                        장기, 조직, 혈액, 세포 등의 활용과<br>장기기증 등을 통해 국민보건향상에<br>이바지하는 기관
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="slide">
                            <div class="lg">
                                <img src="/images/p_medical_center.svg" alt="국립중앙의료원 로고">
                            </div>
                            <div class="txt">
                                <ul>
                                    <li>국립중앙의료원</li>
                                    <li>
                                        의료 기술 수준의 향상을 위한<br>조사연구, KONOS 운영 등의<br>업무를 관장하는 기관
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="provide_tab">
                    <div class="sm_title">
                        <p>데이터 제공기관</p>
                    </div>
                    <div class="board_tab">
                        <ul>
                            <!-- class="on"일때 활성화 -->
                            <li><a href="javascript:void(0)" class="on">안심활용중앙센터(수도권)</a></li>
                            <li><a href="javascript:void(0)" class="">강원권</a></li>
                            <li><a href="javascript:void(0)" class="">충청권</a></li>
                            <li><a href="javascript:void(0)" class="">경상권</a></li>
                        </ul>
                    </div>
					<!-- class='on' 시 탭 내용 전환 -->
					<!-- 안심활용중앙센터(수도권) -->
                    <div class="item on">
                        <div class="capital">
                            <p class="sub_tit">안심활용중앙센터 전경</p>
                            <div class="bg_inn">
								<!-- class='on' 시 opacity 활성화 -->
                                <a href="javascript:void(0)" class="bg_01"></a>
                                <a href="javascript:void(0)" class="bg_02 on" data-bg="/images/capital_02.svg"></a>
                                <a href="javascript:void(0)" class="bg_03" data-bg="/images/capital_03.svg"></a>
                                <a href="javascript:void(0)" class="bg_04" data-bg="/images/capital_04.svg"></a>
                                <a href="javascript:void(0)" class="bg_05" data-bg="/images/capital_05.svg"></a>
                                <a href="javascript:void(0)" class="bg_06" data-bg="/images/capital_06.svg"></a>
                                <a href="javascript:void(0)" class="bg_07" data-bg="/images/capital_07.svg"></a>
                            </div>
                        </div>
                    </div>
					<!-- 강원권 -->
                    <div class="item">
                        <div class="gangwon">
                            <p class="sub_tit">나중에 내용 나올 시 수정(강원권)</p>
							<div class="bg_inn">
								<!-- class='on' 시 opacity 활성화 -->
                                <a href="javascript:void(0)" class="bg_01">강원권이미지1</a>
                                <a href="javascript:void(0)" class="bg_02 on" data-bg="">강원권이미지2</a>
                                <a href="javascript:void(0)" class="bg_03" data-bg="">강원권이미지3</a>
                                <a href="javascript:void(0)" class="bg_04" data-bg="">강원권이미지4</a>
                                <a href="javascript:void(0)" class="bg_05" data-bg="">강원권이미지5</a>
                                <a href="javascript:void(0)" class="bg_06" data-bg="">강원권이미지6</a>
                                <a href="javascript:void(0)" class="bg_07" data-bg="">강원권이미지7</a>
                            </div>
                        </div>
                    </div>
					<!-- 충청권 -->
                    <div class="item">
                        <div class="chungcheong">
                            <p class="sub_tit">나중에 내용 나올 시 수정(충청권)</p>
							<div class="bg_inn">
								<!-- class='on' 시 opacity 활성화 -->
                                <a href="javascript:void(0)" class="bg_01">충청권이미지1</a>
                                <a href="javascript:void(0)" class="bg_02 on" data-bg="">충청권이미지2</a>
                                <a href="javascript:void(0)" class="bg_03" data-bg="">충청권이미지3</a>
                                <a href="javascript:void(0)" class="bg_04" data-bg="">충청권이미지4</a>
                                <a href="javascript:void(0)" class="bg_05" data-bg="">충청권이미지5</a>
                                <a href="javascript:void(0)" class="bg_06" data-bg="">충청권이미지6</a>
                                <a href="javascript:void(0)" class="bg_07" data-bg="">충청권이미지7</a>
                            </div>
                        </div>
                    </div>
					<!-- 경상권 -->
                    <div class="item">
                        <div class="gyeongsang">
                            <p class="sub_tit">나중에 내용 나올 시 수정(경상권)</p>
							<div class="bg_inn">
								<!-- class='on' 시 opacity 활성화 -->
                                <a href="javascript:void(0)" class="bg_01">경상권이미지1</a>
                                <a href="javascript:void(0)" class="bg_02 on" data-bg="">경상권이미지2</a>
                                <a href="javascript:void(0)" class="bg_03" data-bg="">경상권이미지3</a>
                                <a href="javascript:void(0)" class="bg_04" data-bg="">경상권이미지4</a>
                                <a href="javascript:void(0)" class="bg_05" data-bg="">경상권이미지5</a>
                                <a href="javascript:void(0)" class="bg_06" data-bg="">경상권이미지6</a>
                                <a href="javascript:void(0)" class="bg_07" data-bg="">경상권이미지7</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="seoul_center">
                    <p class="sub_tit">서울센터 분석환경정보</p>
                    <ul>
                        <li>
                            <img src="/images/sas_logo.svg" alt="sas 로고">
                            <p>명령어 기반의 전문 통계 분석용<br>솔루션으로 비즈니스 인텔리전스,<br>데이터 관리, 고급 분석,<br>다변량 분석 등에 활용 가능</p>
                        </li>
                        <li>
                            <img src="/images/r_studio_logo.svg" alt="r studio 로고">
                            <p>R 프로그래밍 언어 기반의 오픈소스<br>소프트웨어로 통계 분석에 보다<br>특화된 라이브러리를<br>활용한 데이터 분석 등에 유용</p>
                        </li>
                        <li>
                            <img src="/images/spss_logo.svg" alt="spss 로고">
                            <p>다양한 분석 기능과<br>고급 데이터 준비 도구를 제공하고<br>분석 신뢰성을 높이기 위한<br>핵심 통계 프로시저 제공</p>
                        </li>
                        <li>
                            <img src="/images/stata_logo.svg" alt="stata 로고">
                            <p>데이터 관리, 시각화, 통계 분석 및<br>리포트 자동화 등의 기능을<br>통합 제공하고, 학술·연구 뿐만<br>아니라 다양한 업무에 활용 가능</p>
                        </li>
                    </ul>
                </div>
                <div class="location">
					<p class="sub_tit">서울센터 찾아오시는 길</p>
                    <div id="map" class="map" style="border:1px solid #eee; width:1200px; height:500px;">
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=02a414bd167ada68b30d30caf273398d&libraries=LIBRARY"></script>
						<script>
							function getMarker({ imageSrc, imageWidth, imageHeight, markerX, markerY, lat, lng }) {
							    const imageSize = new kakao.maps.Size(imageWidth, imageHeight); // 마커이미지의 크기입니다
							    const imageOption = {offset: new kakao.maps.Point(markerX, markerY)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

								// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
								const markerPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치입니다

								// 마커를 생성합니다
								const marker = new kakao.maps.Marker({
								    position: markerPosition,
								    image: markerImage // 마커이미지 설정
								});

								return marker;
							}

							const container = document.getElementById('map');
							const options = {
								center: new kakao.maps.LatLng(37.56037, 126.97342),
								level: 2
							};
							const map = new kakao.maps.Map(container, options);

							const marker1 = getMarker({
								imageSrc: '/images/marker_daehan_sanggong.png',
								imageWidth: 220, imageHeight: 94,
								markerX: 27, markerY: 69,
								lat: 37.56090, lng: 126.97340,
							});
							const marker2 = getMarker({
								imageSrc: '/images/marker_yeonse_bongrae.png',
								imageWidth: 220, imageHeight: 94,
								markerX: 27, markerY: 69,
								lat: 37.55965, lng: 126.97250,
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker1.setMap(map);
							marker2.setMap(map);
						</script>
					</div>
                    <div class="txt">
                        <ul>
                            <li>오시는 길</li>
                            <li>
                                <ul>
                                    <li>서울 안심활용중앙센터</li>
                                    <li>(04513) 서울특별시 중구 세종대로 39 11층 한국보건의료정보원(남대문로4가, 대한상공회의소 신관)</li>
                                </ul>
                            </li>
                        </ul>
                        <ul>
                            <li>운영시간</li>
                            <li>
                                <ul>
                                    <li>평일 오전9시 ~ 오후6시 (점심시간 12~13시)</li>
                                    <li>토요일, 공휴일, 시스템점검기간 등 휴무</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
			</div>
		</div>
	</div>
<!-- //container -->