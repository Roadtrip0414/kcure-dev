<%
/* =================================================================
* @FileName : DetailViewPrtQna.jsp
* @date: 2023. 3. 15.
* @author : hjjeon
* @설명 : 문의하기 상세 화면
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 15. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	const data = new FormData(document.detailFrm);

	$.ajax({
		type:"POST",
		url: "/portal/file/getFileInfos.do",
		processData: false,
		contentType: false,
		dataType: "json",
		data,
		success: function(resp){
// 			console.log(resp.files);
			if(resp.files.length > 0){
				var html = "";
				for(var i=0; i <resp.files.length; i++){
					var fileObj = resp.files[i];
					html += "<li class=\"hwp_file\">";
					html += "<a href=\"##\" onclick=\"fnFileDown('"+fileObj.oriName+"','"+fileObj.name+"','"+fileObj.url+"');\">"
					html += fileObj.oriName + " (" + (fileObj.fileSize/1024).toFixed(1) + "MB)";
					html += "</a>";
					html += "</li>";
				}
				$(".doc_file").html(html);

			}else{
				$(".doc_file").html("첨부파일이 없습니다.");
			}
		},
		err: function(err){
			console.log("err:", err);
		}
	});
});

//목록이동
function fnList(){
	$("#detailFrm").attr("action", "/portal/bbs/prt/qna/viewPrtQna.do").submit();
}

function fnFileDown(oriNm, nasFileNm, url){
	$('#filedownFrm #baseUrl').val(document.location.pathname);
	$('#filedownFrm #url').val(url);
	$('#filedownFrm #nasFileName').val(nasFileNm);
	$('#filedownFrm #oriName').val(oriNm);
    $('#filedownFrm').attr("action", "/portal/file/fileDown.do");
    $('#filedownFrm').submit();
}
</script>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>문의하기</li>
			</ul>
		</div>
	</div>
	<div class="sub_nav_wrap">
		<!-- class="on"시 색변경 및 보더 생김 -->
		<a href="/portal/bbs/prt/ntc/viewPrtNtc.do" class="">공지사항</a>
		<a href="/portal/bbs/prt/faq/viewPrtFaq.do" class="">FAQ</a>
		<a href="/portal/bbs/prt/qna/viewPrtQna.do" class="on">문의하기</a>
	</div>
	<div class="inquiry_view_wrap">
		<form id="filedownFrm" name="filedownFrm" method="post">
			<input type="hidden" id="atchFileId" name="atchFileId" value="<c:out value='${qnaQstnVO.attfId}'/>"/>
			<input type="hidden" id="baseUrl" name="baseUrl" value=""/>
			<input type="hidden" id="url" name="url" value=""/>
			<input type="hidden" id="nasFileName" name="nasFileName" value=""/>
			<input type="hidden" id="oriName" name="oriName" value=""/>
		</form>
		<form id="detailFrm" name="detailFrm" method="post">
			<input type="hidden" name="atchFileId" value="<c:out value='${qnaQstnVO.attfId}'/>"/>
			<input type="hidden" name="pageIndex" value="${searchVO.pageIndex}"/>
			
			<input type="hidden" name="searchCondition" value="${searchVO.searchCondition}"/>
			<input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword}" />
			<input type="hidden" name="searchKeyword1" value="${searchVO.searchKeyword1}"/>
		</form>
		<div class="con">
			<div class="item">
			    <div class="sm_title">
			        <p>문의내용</p>
			    </div>
			    <table class="user_tb_l">
			        <colgroup>
			            <col style="width:17%">
			            <col style="width:auto">
			        </colgroup>
			        <tbody>
			            <tr>
			                <th>이름</th>
			                <td><c:out value="${qnaQstnVO.frstRegpNm}"/></td>
			            </tr>
			            <tr>
			                <th>참여기관</th>
			                <td><c:out value="${qnaQstnVO.prtiNm}"/></td>
			            </tr>
			            <tr>
			                <th>등록일</th>
			                <td><c:out value="${qnaQstnVO.frstRgstDt}"/></td>
			            </tr>
			            <tr>
			                <th>카테고리</th>
			                <td><c:out value="${qnaQstnVO.qstnClsSpcdNm}"/></td>
			            </tr>
			            <tr>
			                <th>제목</th>
			                <td><c:out value="${qnaQstnVO.qstnTtlNm}"/></td>
			            </tr>
			            <tr>
			                <th>내용</th>
			                <td>
			                    <p class="txt">
			                       <pre><c:out value="${qnaQstnVO.qstnCont}"/></pre>
			                    </p>
			                </td>
			            </tr>
			            <tr>
			                <th>첨부파일</th>
			                <td>
			                    <ul class="doc_file"></ul>
			                </td>
			            </tr>
			        </tbody>
			    </table>
			</div>
			<div class="item">
			    <div class="sm_title">
			        <p>답변내용</p>
			    </div>
			    <table class="user_tb_l">
			        <colgroup>
			            <col style="width:17%">
			            <col style="width:auto">
			        </colgroup>
			        <tbody>
			            <tr>
			                <th>작성자</th>
			                <td><c:out value="${qnaQstnVO.dsgnAnspNm}"/></td>
			            </tr>
			            <tr>
			                <th>등록일</th>
			                <td><c:out value="${qnaQstnVO.ansDt}"/></td>
			            </tr>
			            <tr>
			                <th>답변내용</th>
			                <td>
			                    <p class="txt">
			                        <pre><c:out value="${qnaQstnVO.ansCont}" escapeXml="false"/></pre>
			                    </p>
			                </td>
			            </tr>
			        </tbody>
			    </table>
			</div>
			<div class="n_btn_inn">
			    <a href="javascript:void(0)" class="l_btn bc_b_line" onclick="fnList();">목록</a>
			</div>
		</div>
	</div>
</div>