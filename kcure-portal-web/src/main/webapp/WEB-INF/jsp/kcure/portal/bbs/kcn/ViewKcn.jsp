<%
/* =================================================================
* @FileName : ViewKcn.jsp
* @date: 2023. 3. 13.
* @author : hjjeon
* @설명 : K-CURE 소식
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 13. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#srchBtn").click(function(){
		$("#srchForm").attr("action", "/portal/bbs/kcn/viewKcn.do").submit();
	});

	fnPaging();
});

function fnPage(){
	$("#srchForm").attr("action", "/portal/bbs/kcn/viewKcn.do").submit();
}

function fnDetail(nttId){
	$('input[name=nttId]').val(nttId);
	$("#srchForm").attr("action", "/portal/bbs/kcn/detailViewKcn.do").submit();
}

//페이징 처리
function fnPaging(){
	var pagingId = "grid_paging";
	var lastPage = ${paginationInfo.lastPageNo};
	var currentPage =  ${paginationInfo.currentPageNo};
	var gridPaging = "<input type=\"hidden\" name=\"pageIndex\" value=\""+ currentPage +"\">";
	gridPaging += "<input type=\"hidden\" name=\"lastPageNum\" value=\""+ lastPage +"\">";
	gridPaging += "<input type=\"hidden\" id=\"pageReset\" value=\"true\">";

	var makePageInfo=[];
	var startPage = parseInt(${paginationInfo.firstPageNoOnPageList});
	var endPage = parseInt(${paginationInfo.lastPageNoOnPageList});
	//최초 페이지가 아니면
	if(currentPage != 1){
		//최초 페이지
		gridPaging += "<a id=\""+pagingId+"_first_page\" class=\"first_page\" ></a>";
		gridPaging += "<a id=\""+pagingId+"_prev_page\"  class=\"prev\" ></a>";
	}

	for(var i=startPage;i<=endPage;i++){
		var className = "";
		if(currentPage ==i)className= "current";
		var pageClickId = pagingId+"_num_"+i;
		gridPaging += "<a  id=\""+pageClickId+"\"  >"+i+"</a></li>";
		makePageInfo[i-startPage] = {id:pageClickId,pageNum:i};
	}

	//마지막 페이지가 아니면
	if(currentPage != lastPage){
		gridPaging += "<a id=\""+pagingId+"_next_page\" class=\"next\"></a>";
		gridPaging += "<a id=\""+pagingId+"_last_page\" class=\"last_page\"></a>";
	}

	$('#'+pagingId).attr("class","page_num").html(gridPaging);

	/* 페이지 이벤트 처리 */
	$.each(makePageInfo, function(idx) {
		var element = makePageInfo[idx];
		$('#'+element.id).click(
			function() {
				goGridPage(element.pageNum,pagingId);
		});
	});

	$('#'+pagingId+'_first_page').click(function() {
		var nowPageNum = $('#'+pagingId+' input[name=pageIndex]').val();
		var goPage = Math.floor(nowPageNum/10 -1)*10+1
		if(goPage <0)goPage=1;
	   	goGridPage(goPage ,pagingId);
	});

	$('#'+pagingId+'_prev_page').click(function() {
		prevNextPage(-1,lastPage,pagingId);
	});


	$('#'+pagingId+'_next_page').click(function() {
		prevNextPage(1,lastPage,pagingId);
	});

	$('#'+pagingId+'_last_page').click(function() {
		var nowPageNum = $('#'+pagingId+' input[name=pageIndex]').val();
		var goPage = Math.ceil(nowPageNum/10)*10 +1
		if(lastPage < goPage)goPage=lastPage ;
	  	goGridPage(goPage ,pagingId);
	});

	var nowPageNum = $('#'+pagingId+' input[name=pageIndex]').val();
	var pageClickId = pagingId+"_num_"+nowPageNum;
	$('#'+pageClickId).addClass("on");

}

function goGridPage(pageNum ,pagingId){
	$('#'+pagingId+' input[name=pageIndex]').val(pageNum);
	var pageClickId = pagingId+"_num_"+pageNum;
	$('#'+pagingId+' li').removeClass('current');
	$('#'+pagingId+' #'+pageClickId+'_li').addClass('current');
	$('#'+pagingId+' #'+pageClickId+'_li').addClass('current');
	//페이지 초기화 여부
	$('#'+pagingId+' #pageReset').val('false');

	checkPage(pagingId);
	fnPage();
}

function prevNextPage(movePage,endPage,pagingId){
	var nowPage = $('#'+pagingId+' input[name=pageIndex]').val();
	var pageNum = 1;
	//첫번째 페이지 이거나 마지막 페이지이면 현재 페이지로 표출
	if( !(nowPage == 1 && movePage < 0) &&  !(nowPage == endPage &&  movePage > 0) ){
		pageNum = parseInt(nowPage) + movePage
	}else{
		pageNum = nowPage
	}
	//페이지 초기화 여부
	$('#'+pagingId+' #pageReset').val('false');
	$('#'+pagingId+' input[name=pageIndex]').val(pageNum);
	var pageClickId = pagingId+"_num_"+pageNum;
	$('#'+pagingId+' li').removeClass('current');
	$('#'+pageClickId+'_li').addClass('current');
	checkPage(pagingId);
	fnPage();
}

function checkPage(pagingId){
	var nowPageNum = $('#'+pagingId+' input[name=pageIndex]').val();
	var pageClickId = pagingId+"_num_"+nowPageNum;
	$('#'+pageClickId).addClass("on");
}
</script>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>K-CURE 소식</li>
			</ul>
		</div>
	</div>
	<div class="news_wrap">
		<div class="con">
			<div class="sub_pag_title">
				<p>K-CURE 소식</p>
				<span>K-CURE의 새로운 소식을 알리는 페이지입니다.</span>
			</div>

			<form id="srchForm" name="srchForm" method="post">
				<input type="hidden" name="bbsId" value="BBSMSTR_000000000003"/>
				<input type="hidden" name="nttId" value="0"/>
				<div class="board_info">
					<p>전체 <span id="totalCnt"><c:out value="${resultCnt}"/></span>건</p>
					<div class="search">
						<select class="user_sel" id="searchCondition" name="searchCondition">
							<option value="0" <c:if test="${searchVO.searchCondition =='0'}">selected="selected"</c:if>>전체</option>
							<option value="1" <c:if test="${searchVO.searchCondition =='1'}">selected="selected"</c:if>>제목</option>
							<option value="2" <c:if test="${searchVO.searchCondition =='2'}">selected="selected"</c:if>>내용</option>
						</select>
						<input type="text" class="user_int" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}" placeholder="검색어 입력" title="검색 키워드"/>
						<a href="javascript:void(0)" class="btn" id="srchBtn">검색</a>
					</div>
				</div>
				<div class="news_list">
					<c:forEach var="list" items="${resultList}">
			            <a href="javascript:void(0)" class="news_data" onclick="fnDetail('${list.nttId}');">
			                <div class="bg">
			                	<c:choose>
			                		<c:when test="${not empty list.streFileNm}">
					                	<img src="<c:out value="${list.fileStreCours += list.streFileNm}"/>" width="100%" height="100%" onerror="this.src='/images/thumb_l.png'"/>
			                		</c:when>
			                		<c:otherwise>
					                	<img src="/images/thumb_l.png" height="180"/>
			                		</c:otherwise>
			                	</c:choose>
			                </div>
			                <ul>
			                    <li><c:out value="${list.nttSj}"/></li>
			                    <li>등록일 <c:out value="${list.frstRegistDt}"/></li>
			                </ul>
			            </a>
					</c:forEach>
	        	</div>
	        	<div id="grid_paging" class="page_num"></div>
			</form>
		</div>
	</div>
</div>