<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="subtop-tab">
	<div class="mo-scrolltab">
		<ul>
			<li class="on"><a href="/portal/dac/dpo/nonCheck/viewDpoSummary.do">데이터 신청서류작성</a></li>
			<!-- <li><a href="#">데이터 활용 신청</a></li>
			<li><a href="#">안심활용센터예약</a></li>
			<li><a href="#">데이터반입출신청</a></li>
			<li><a href="#">OPEN API신청</a></li> -->
		</ul>
	</div>
</div>
<!-- //subtop-tab -->

<div class="subtop-infor" id="content">
	<div class="inbox-wrap">
		<div class="location">
			<a href="#" class="home"><span class="blind">홈</span></a> <a href="#"><span>데이터
					신청</span></a> <a href="/portal/dac/dpo/nonCheck/viewDpoSummary.do" class="current"><span>데이터 신청서류작성</span></a>
		</div>
		<h2>데이터 신청서류작성</h2>
		<p class="txt-infor">
			K-CURE 임상네트워크 포털에서는 임상라이브러리, 공공라이브러리, 그리고 임상/공공간의 결합프로세스로 연구 목적에 맞는
			데이터를 활용할 수 있습니다.<br>원하시는 데이터를 신청하시면 데이터 신청절차에 따라서 접수, 심의과정을 통과한
			후에 승인된 경우에 해당 데이터를 연구기간 동안 사용가능 합니다.
		</p>
	</div>
</div>
<!-- //subtop-infor -->

<!-- container -->
<div id="container">
		<div class="subcon-wrap dataprocess-infor">
			<div class="inbox-wrap">
				<section class="round-box">
					<h3 class="tit-type02"><span class="num">01</span>데이터신청 절차 안내</h3>
					<ul class="list-type02">
						<li>임상라이브러리, 공공라이브러리, 결합(공공&임상) 라이브러리별 상세신청프로세스는 아래 탭에서 확인하시기 바랍니다.</li>
						<li>신청절차를 확인하시고 신청 이후 단계별 확인은 마이페이지에서 확인 가능합니다.</li>
					</ul>

					<div class="icolist-type01">
						<ul>
							<li>
								<div class="img-area">
									<span class="img"><img src="/images/ico_dataprocess_01.png" alt=""></span>
									<span class="num">1</span>
								</div>
								<p class="txt-top"><strong>연구자</strong></p>
								<p class="txt-bot">데이터 이용신청</p>
							</li>
							<li>
								<div class="img-area">
									<span class="img"><img src="/images/ico_dataprocess_02.png" alt=""></span>
									<span class="num">2</span>
								</div>
								<p class="txt-top"><strong>사무국</strong></p>
								<p class="txt-bot">신청접수검토</p>
							</li>
							<li>
								<div class="img-area">
									<span class="img"><img src="/images/ico_dataprocess_03.png" alt=""></span>
									<span class="num">3</span>
								</div>
								<p class="txt-top"><strong>위원회/제공기관</strong></p>
								<p class="txt-bot">연구평가위원회 및 제공기관 섭외</p>
							</li>
							<li>
								<div class="img-area">
									<span class="img"><img src="/images/ico_dataprocess_04.png" alt=""></span>
									<span class="num">4</span>
								</div>
								<p class="txt-top"><strong>사무국/제공기관</strong></p>
								<p class="txt-bot">데이터 준비 및 연계</p>
							</li>
							<li>
								<div class="img-area">
									<span class="img"><img src="/images/ico_dataprocess_05.png" alt=""></span>
									<span class="num">5</span>
								</div>
								<p class="txt-top"><strong>위원회/제공기관/사무국</strong></p>
								<p class="txt-bot">반출적정성 심의</p>
							</li>
							<li>
								<div class="img-area">
									<span class="img"><img src="/images/ico_dataprocess_06.png" alt=""></span>
									<span class="num">6</span>
								</div>
								<p class="txt-top"><strong>사무국</strong></p>
								<p class="txt-bot">분석센터 데이터 제공</p>
							</li>
						</ul>
					</div>

					<div class="tab-type02 mo-scrolltab">
						<ul>
							<li class="on"><a href="#tab-box01" class="tabview-link"><span>공공</span></a></li>
							<li><a href="#tab-box02" class="tabview-link"><span>임상</span></a></li>
							<li><a href="#tab-box03" class="tabview-link"><span>공공&amp; 임상</span></a></li>
						</ul>
					</div>
					<!-- //tab-type02 -->
					<div class="img-box" id="tab-box01">
						<p><img src="/images/sub03/img_dataprocess_01.png" alt="공공 데이터신청 절차"></p>
						<div class="blind">
							<ol>
								<li>K-CURE 플랫폼 국가암데이터센터(data 품질관리, data 비식별화 처리, data map 작성, sample cohore 구축)에서 암 관리법에 의거하여 공공기관(국민건강보험, 건강보험심사평가원, 통계청, 중앙암등록본부)에 데이터 요청</li>
								<li>공공기관에서 국립암센터 암 환자 대상으로 가명정보 전달</li>
								<li>보건복지부 : 정의된 결합정보를 이용하여 고정 결합키 생성</li>
							</ol>
							<p>사전 결합을 통해 데이터의 질 확보 데이터제공에 소요되는 시간단축 등의 효과</p>
						</div>
					</div>
					<div class="img-box" id="tab-box02" style="display:none;">
						<p><img src="/images/sub03/img_dataprocess_02.png" alt="임상 데이터신청 절차"></p>
						<div class="blind">
							<p>암 공공&middot;임상라이브러리 활용자료원 : 공공라이브러리 - 암센터, 건강보험공단, 심사평가원</p>
							<p>암 공공&middot;임상라이브러리 활용자료원 : 임상라이브러리 - 서울대병원, 세브란스병원</p>
							<ol>
								<li>K-CURE 플랫폼 한국의료정보원(DRB 공동양식 작성, data 품질관리, data 비식별화 처리, data map 작성)에서 DRB 공동양식을 통해 데이터중심 병원에 자료 요청</li>
								<li>각 병원별 DRB 심사를 거쳐 자료활용 승인을 받은 병원자료를 연계</li>
								<li>정의된 결합정보를 이용하여 연구마다 결합키 생성 및 폐기</li>
							</ol>
						</div>
					</div>
					<div class="img-box" id="tab-box03" style="display:none;">
						<p><img src="/images/sub03/img_dataprocess_03.png" alt="공공&amp; 임상 데이터신청 절차"></p>
						<div class="blind">
							<p>공공 데이터 신청 절차 와 임상 데이터 신청 절차가 결합된 절차</p>
						</div>
					</div>
				</section>

				<section class="round-box mgt20">
					<h3 class="tit-type02"><span class="num">02</span>신청서류안내</h3>
					<ul class="list-type02">
						<li>데이터 신청에 따른 필수서류는 아래와 같습니다.</li>
					</ul>
					<div class="tbl-wrap tbl-type02">
						<div class="tbl-inbox">
							<table>
								<caption>신청서류안내</caption>
								<colgroup>
									<col style="width:20%">
									<col style="width:40%">
									<col style="width:40%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">절차구분</th>
										<th scope="col">필수서류</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">신청</th>
										<td>
											<ul class="list-type03">
												<li>신청서</li>
												<li>연구요약서</li>
												<li>연구요약서·별지</li>
												<li>연구계획서</li>
												<li>주관연구기관 IRF 승인서</li>
												<li>개인정보수집·이용 및 제3자 제공동의서</li>
												<li>보안각서(보안유지 및 준수사항 서약서)</li>
											</ul>
										</td>
										<td>연구과제 검토 시 추가 보완요청가능</td>
									</tr>
									<tr>
										<th scope="row">이의신청</th>
										<td>
											<ul class="list-type03">
												<li>이의신청서</li>
											</ul>
										</td>
										<td>이의신청서 제출</td>
									</tr>
									<tr>
										<th scope="row">이용</th>
										<td>
											<ul class="list-type03">
												<li>안심활용중앙센터 이용신청</li>
											</ul>
										</td>
										<td>각 기관 분석센터 서식 준용</td>
									</tr>
									<tr>
										<th scope="row">이용종료</th>
										<td>
											<ul class="list-type03">
												<li>연구종료 통보서</li>
												<li>연구결과물</li>
											</ul>
										</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- //table -->
					<div class="graybot-box">
						<p>제출서류 양식은 회원가입 후 로그인하시면, 다운받을 수 있습니다.</p>
						<div class="btn-box">
							<a href="#" class="btn-downblue"><span>신청서</span></a>
							<a href="#" class="btn-downblue"><span>연구요약서</span></a>
							<a href="#" class="btn-downblue"><span>연구계획서</span></a>
							<a href="#" class="btn-downblue"><span>IRF승인서</span></a>
							<a href="#" class="btn-downblue"><span>개인정보/보안각서</span></a>
							<a href="#" class="btn-downblue"><span>이의신청서</span></a>
							<a href="#" class="btn-downblue"><span>폐쇄망 신청</span></a>
						</div>
					</div>
				</section>

				<section class="round-box mgt30 blue-box">
					<h3 class="tit-type02"><i class="ico-infor"></i>플랫폼수수료</h3>
					<ul class="list-type02">
						<li>23~25년 시범사업 연구과제에 한하여 데이터 이용, 결합 및 분석센터 이용 수수료는 무료 입니다.</li>
						<li>25년 이후 본 사업 연구과제의 결합 수수료는 동일하게 무료이나, 데이터 이용 및 폐쇄망 분석센터 이용 수수료는 각 기관이 정한 바에 따라 과금 예정입니다</li>
					</ul>
				</section>

				<section class="round-box mgt30">
					<h3 class="tit-type02"><span class="num">03</span>연구종류 보고</h3>
					<ul class="list-type02">
						<li>K-CURE플랫폼을 통해 제공받은 데이터로 수행한 연구는 공개 대상으로, 연구종료통보서와 연구결과물을 사무국에 제출하여야 합니다.</li>
						<li>공개 개시 시점등은 사무국과 협의하여 결정할 수 있습니다.</li>
					</ul>
				</section>
			</div>
		</div>
		<!-- //subcon-wrap -->
	</div>
	<!-- //container -->