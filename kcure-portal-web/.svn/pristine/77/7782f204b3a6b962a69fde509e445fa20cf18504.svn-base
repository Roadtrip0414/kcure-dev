<%
/* =================================================================
 * @FileName  : file_name
 * @date: 2023. 1. 20.
 * @author : shpark
 * @설명 : 
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023. 1. 20.        개발자명           파일생성
 * =================================================================
 */ 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

$(document).ready(
		
		function() {
			
		}
		
	);

function go_file_detail(fileId){
	$('#atchFileId').val(fileId);
	document.frm.action = "<c:url value='/portal/example/file/nonCheck/detailViewFileExample.do'/>";
	document.frm.submit();
}


function go_file_insert(fileId){
	$('#atchFileId').val(fileId);
	document.frm.action = "<c:url value='/portal/example/file/nonCheck/InsertFileExample.do'/>";
	document.frm.submit();
}



</script>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
		<br/><br/><br/><br/><br/>
			<form name="frm"  method="post">
					<div class="search_box" title="<spring:message code="common.searchCondition.msg" />"><!-- 이 레이아웃은 하단 정보를 대한 검색 정보로 구성되어 있습니다. -->
						<ul>
							<li>
								<input class="s_btn" type="button" value='등록' title='등록버튼' onclick="go_file_insert(); return false;" /><!-- 조회 -->
							</li>
						</ul>
					</div>
				
					<table class="board_list" border="1" style="width:500px;">
						<caption></caption>
						<colgroup>
							<col style="width:65%" />
							<col style="width:35%" />
						</colgroup>
						<thead>
							<tr>
							   <th scope="col">파일그룹ID</th>
							   <th scope="col">파일갯수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${fileList}" var="resultInfo" varStatus="status">
								<tr>
									<td>
										<a href="#" onclick="go_file_detail('${resultInfo.atch_file_id}');" >
											<c:out value="${resultInfo.atch_file_id}"/>
										</a>
									</td>
									<td><c:out value="${resultInfo.cnt}"/></td>
								</tr>   
							</c:forEach>
						</tbody>
					</table>
							
				<input type="hidden" name="atchFileId" id="atchFileId">	
				
				</form>
			</div>
		</div>
	</div>