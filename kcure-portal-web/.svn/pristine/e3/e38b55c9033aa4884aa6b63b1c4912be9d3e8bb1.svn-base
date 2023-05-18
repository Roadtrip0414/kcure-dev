<%
/* =================================================================
* @FileName : ViewPlbDataModel.jsp
* @date: 2023. 3. 22.
* @author : hjjeon
* @설명 : 공공 라이브러리 데이터모델
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 22. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/plugin/jsmind/jsmind.js"></script>
<link type="text/css" rel="stylesheet" href="/js/plugin/jsmind/jsmind.css" />
<style type="text/css">
    #jsmind_container {
		height: 600px;
    }
</style>
	<div class="wrap">
		<jsp:include page="/WEB-INF/jsp/kcure/portal/com/layout/inline_sub_menu.jsp">
			<jsp:param name="className" value="about" />
		</jsp:include>
		<div class="about_wrap">
			<div class="con">
				<div class="sub_tab">
					<!-- class="on" 시 색 변경 -->
					<a href="/portal/dit/plb/inf/viewPlbInfo.do" class="">개요</a>
					<a href="/portal/dit/plb/mdl/viewPlbDataModel.do" class="on">데이터모델</a>
				</div>
				<div class="data_model">
					<div class="sub_pag_title">
						<p>공공라이브러리 데이터 모델</p>
						<div class="shadow_box">
							<ul>
								<li>・ K-CURE 공공 라이브러리 데이터 모델은 결합된 공공 데이터에 대한 모델을 검색/생성할 수 있도록 설계되었습니다.</li>
								<li>
									<span>・ </span>
									<span>이 사이트는 데이터 모델의 현재 버전 모델 구조와 각 DB의 테이블, 항목에 대한 내용을 제공합니다.<br> 데이터베이스에 대한 상세 설명은 공공 라이브러리 데이터 모델에서 확인하실 수 있습니다</span>
								</li>
							</ul>
						</div>
					</div>
					<div class="sub_pag_title">
						<p>공공라이브러리 데이터 모델 v1.0 ( 현재버전)</p>
						<div class="shadow_box">
							<ul>
								<li>・ 본 문서는 각 DB별 테이블, 테이블 내 항목, 항목에서 수집되는 값 등에 대한 설명입니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="schema_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>공공 라이브러리 스키마 구조</p>
				</div>
				<!--  
				<a href="javascript:void(0)" onclick="setMindMapSize('+');">+</a>
				<a href="javascript:void(0)" onclick="setMindMapSize('-');">-</a>
				<a href="javascript:void(0)" onclick="setMindMapSize('');">reset</a>
				-->
				<div class="schema_mindmap" id="jsmind_container"></div>
			</div>
		</div>
	</div>
	<div class="kc_layer_popup">
		<div class="kc_popup_box mindmap">
			<a href="javascript:void(0)" class="btn kc_close"></a>
			<div class="title"></div>
			<div class="popup_con">
				<div class="schema_txt"></div>
			</div>
		</div>
	</div>

<script type="text/javascript">
//마인드맵 크기 조정
var setMindMapSize = function(obj){
	if(obj == '+'){
		jm.view.zoomIn();
	}else if(obj == '-'){
		jm.view.zoomOut();
	}else{
		jm.show(mind);
		jm.view.setZoom(1);
		jmRelayout();
	}
}

//root Click event
var clickRoot = function(){
	jm.show(mind);
	jmRelayout();
};

var jmRelayout = function(){
	$("#jsmind_container").css('height', '600');
	jm.view.relayout();
}

//테이블 주제명 클릭
var getSubList1 = function(param){
	var paramSize = param.get_size();

	var data = {"dtsLclsCd": param.data.dtsLclsCd, "lclsNm":param.topic};

	$.ajax({
		type:"POST",
		url: "/portal/dit/plb/mdl/selectTblEnmList.do",
		dataType: "json",
		contentType: 'application/json',
		data: JSON.stringify(data),
		success: function(resp){
			if(param.children.length == 0){
				for(var i=0; i < resp.tblEnmList.length; i++){
					jm.add_node(param.id,param.id+i,resp.tblEnmList[i].tblEnm, {"tblEnm":resp.tblEnmList[i].tblEnm , "clickEvent" : getSubList2});
				}
			}else{
				if(param.expanded && paramSize.h == '36'){
					jm.collapse_node(param);
					jmRelayout();
				}else{
					jm.expand_node(param);
				}
			}
		},
		err: function(err){
			console.log("err:", err);
		}
	});

};

//테이블 클릭 - 컬럼 팝업 호출
var getSubList2 = function(param){
	$(".kc_popup_box .title").html("<p>"+param.data.tblEnm+"</p>");

	var data = {"tblEnm": param.data.tblEnm};

	$.ajax({
		type:"POST",
		url: "/portal/dit/plb/mdl/selectColKnmList.do",
		dataType: "json",
		contentType: 'application/json',
		data: JSON.stringify(data),
		success: function(resp){
			$(".kc_layer_popup").addClass("on");
			var colKmStr = "<ul>";
			for(var i=0; i < resp.colKnmList.length; i++){
				colKmStr += "<li>- "+resp.colKnmList[i].colEnm + "</li>";
			}
			colKmStr += "</ul>";
			$(".schema_txt").html(colKmStr);
		},
		err: function(err){
			console.log("err:", err);
		}
	});
};

    var mind = {
    		meta: {
                name: 'test',
                author: '',
                version: '0.2',
            },
            format: 'node_array',
    		data: [
	                 { id: 'root1', isroot: true, topic: '암등록본부(암등록 DB)', clickEvent:clickRoot},
	                 <c:forEach items="${lclsNmList}" var="list" varStatus="status">
	                 	{ id: 'sub${status.index}', parentid: 'root1', topic: '${list.lclsNm}', dtsLclsCd: '${list.dtsLclsCd}', clickEvent:getSubList1},
		             </c:forEach>
                 ]
    };
    var options = {
        container: 'jsmind_container',
        theme: 'orange',
        editable: true,
        view: {
            draggable: true,
        },
    };
    var jm = new jsMind(options);
    jm.show(mind);
</script>

