<%
/* =================================================================
 * @FileName : ViewMypSvcAlm.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 알림 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	fnPage(1);
});

function fnPage(pageNo){
	$('input[name=pageIndex]').val(pageNo);
	
	var form = $("#listFrm").serialize();
	
	$.ajax({
        type: "post",
        url: "/portal/myp/svc/alm/selectMypSvcAlmList.do",
        data: form,
        dataType: 'json',
        success: function (data) {
        	var strAlmTbl = '';
        	
        	if (data.result == "success") {            	
            	$.each(data.almList, function( index, value ) {            		
                	var strAlmTrClass = '';
                	var strAlmTrLink = '';
                	
                	if (value.mvmnBtnClckYn == "N" && value.mvmnBtnCrtnYn == "Y" && value.clckExprYn == "N") strAlmTrClass = 'on';
                	
                	if (value.mvmnBtnCrtnYn == "Y") strAlmTrLink = '<a onClick="javascript:goMov(\'' + value.ntceNo + '\')" class="bc_d_gray s_btn">이동</a>';
                	
            		strAlmTbl = strAlmTbl + '<tr class="' + strAlmTrClass + '">';
            		strAlmTbl = strAlmTbl + '	<td class="txt">' + textToHtml(value.ntceMsgCont) + '</td>';
            		strAlmTbl = strAlmTbl + '	<td class="date">' + value.frstRgstDtFmt + '</td>';
            		strAlmTbl = strAlmTbl + '	<td>' + strAlmTrLink + '</td>';
            		strAlmTbl = strAlmTbl + '</tr>';
            	});
            }
        	
        	if (data.searchVO.totalRecordCount == 0) strAlmTbl = '<tr><td class="txt">알림이 존재하지 않습니다.</td></tr>';
        	
        	$("#almTbl").append(strAlmTbl);
        	
        	if (pageNo < data.searchVO.totalPageCount) {
        		$("#almSpan").html('<a href="javascript:fnPage(' + (pageNo+1) + ')" class="bc_b_line l_btn">더보기</a>');
        	} else {
        		$("#almSpan").html('');
        	}
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });	
}

function goMov(ntceNo){
	$.ajax({
        type: "post",
        url: "/portal/myp/svc/alm/selectMypSvcAlm.do",
        data: {"ntceNo" : ntceNo},
        dataType: 'json',
        success: function (data) {
        	if (data.result == "success") {            	
            	window.location.href = data.almDtl.mvmnUriAddr;
            }        	
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });	
}
</script>

<form id="listFrm" name="listFrm" method="post">
	<input type="hidden" name="pageIndex" value="">
</form>

	<div class="wrap">
		<div class="sub_visual_wrap">
			<div class="data_request">
				<ul>
					<li>알림</li>
				</ul>
			</div>
		</div>
		<div class="alarm_wrap">
            <div class="con">
                <table>
                    <tbody id="almTbl">
                    </tbody>
                </table>
                <span id="almSpan">					
                </span>
			</div>
		</div>
	</div>