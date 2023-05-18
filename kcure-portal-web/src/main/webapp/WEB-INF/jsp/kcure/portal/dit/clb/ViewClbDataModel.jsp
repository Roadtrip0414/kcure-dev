<%
/* =================================================================
* @FileName : ViewClbDataModel.jsp
* @date: 2023. 3. 22.
* @author : hjjeon
* @설명 : 임상라이브러리 데이터모델
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
/*         border: solid 1px #ccc; */
        /*background:#f4f4f4;*/
/*         background: #f4f4f4; */
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
				<a href="/portal/dit/clb/inf/viewClbInfo.do" class="">개요</a>
				<a href="javascript:void(0)" class="on">데이터모델</a>
			</div>
			<div class="data_model">
				<div class="sub_pag_title">
					<p>K-CURE 임상 라이브러리 데이터 모델</p>
					<div class="shadow_box">
						<ul>
							<li>
								<span>・ </span>
								<span>K-CURE 임상 라이브러리 데이터 모델은 기본적 임상 데이터(Baseline DB)와 특정 질환 임상 데이터(암 임상 라이브러리)에 대한 모델을 검색/생성할 수 있도록 설계된 데이터 모델</span>
							</li>
							<li>
								<span>・ </span>
								<span>이 사이트는 데이터 모델구조와 각 DB에 테이블 및 항목에 대한 내용이 표기되며, 각 데이터베이스에 대한 스키마는 <a href="https://github.com/k-cure/ClinicalLibrary" target="_blank" class="un_btn dis_inline">https://github.com/k-cure/ClinicalLibrary</a> 링크 에서 제공</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="schema_wrap">
		<div class="con">
			<div class="sub_pag_title">
				<p>임상 라이브러리 스키마 구조</p>
			</div>
			<!--  
			<a href="javascript:void(0)" onclick="setMindMapSize('+');">+</a>
			<a href="javascript:void(0)" onclick="setMindMapSize('-');">-</a>
			<a href="javascript:void(0)" onclick="setMindMapSize('');">reset</a>
			-->
			<!-- style는 꼭 지울것 -->
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

var getNode = function(param){
	var childs = jm.get_root().children;	//암임상, baseline
	var parentId = param.id.substring(0,4); //선택한 노드의 부모가 암임상인지 baseline인지

	//스크롤 위치
	if(parentId == 'sub1'){
		$('.jsmind-inner').scrollLeft($('.jsmind-inner').width());
	}else{
		$('.jsmind-inner').scrollLeft(0);
	}

	for(var i =0; i < childs.length; i++){
		var childs2 = childs[i].children;
		for(var j=0; j < childs2.length; j++){
			var childs2Info = childs2[j].get_size();
			if(parentId != childs[i].id){
				//선택한 부모의 반대편쪽 노드사이즈 줄이기
				if(childs2Info.h == "36") setNodeSize(childs2[j],'0.5');
			}else{
				if(childs2Info.h == "18") setNodeSize(childs2[j],'2');
			}
		}
	}
}

//노드 사이즈 조절
var setNodeSize = function(param, ratio){
	var fontSize;
	var vHeight;

	if(ratio < 1){
		fontSize = "1";
		vHeight = "18";
	}else{
		fontSize = "14";
		vHeight = "36";	//노드의 기본높이 사이즈
	}

	//1단계
	setNodeStyle(param.id, fontSize, ratio, param._data.view.width, vHeight);

	//선택한 노드의 자식노드가 있으면 같이 사이즈 조정
	var childs = param.children;
	if(childs.length > 0){
		for(var i =0; i < childs.length; i++){

			//2단계
			setNodeStyle(childs[i].id, fontSize, ratio, childs[i]._data.view.width, vHeight);
			var childs2 = childs[i].children;
			if(childs2.length > 0){
				for(var j =0; j < childs2.length; j++){
					//3단계
					setNodeStyle(childs2[j].id, fontSize, ratio, childs2[j]._data.view.width, vHeight);
				}
			}

		}
	}

}

//노드 스타일 셋팅
var setNodeStyle = function(nId, nFontSize, nRatio, nWidth, nHeight){
	jm.set_node_font_style(nId, nFontSize, '', '');
	jm.set_node_background_image(nId, '', nWidth*nRatio, nHeight);
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

//임상라이브러리, baselineDB 클릭
var getSubList = function(param){
};

//암종 클릭
var getSubList1 = function(param){
	var paramSize = param.get_size();

	var data = {"dtsLclsCd": param.data.dtsLclsCd};

	$.ajax({
		type:"POST",
		url: "/portal/dit/clb/mdl/selectLclsNmList.do",
		dataType: "json",
		contentType: 'application/json',
		data: JSON.stringify(data),
		success: function(resp){
			if(param.children.length == 0){
				for(var i=0; i < resp.lclsNmList.length; i++){
					jm.add_node(param.id,param.id+i,resp.lclsNmList[i].lclsNm, {"dtsLclsCd":param.data.dtsLclsCd , "clickEvent" : getSubList2});
				}
			}else{
				if(param.expanded && paramSize.h == '36'){
					jm.collapse_node(param);
				}else{
					jm.expand_node(param);
				}
			}
		},
		err: function(err){
			console.log("err:", err);
		}
	});

	//노드 사이즈 조절
	getNode(param);

};

//테이블 주제명 클릭
var getSubList2 = function(param){
	var paramSize = param.get_size();

	var data = {"dtsLclsCd": param.data.dtsLclsCd, "lclsNm":param.topic};

	$.ajax({
		type:"POST",
		url: "/portal/dit/clb/mdl/selectMclsNmList.do",
		dataType: "json",
		contentType: 'application/json',
		data: JSON.stringify(data),
		success: function(resp){
			if(param.children.length == 0){
				for(var i=0; i < resp.mclsNmList.length; i++){
					jm.add_node(param.id,param.id+i,resp.mclsNmList[i].mclsNm, {"mclsNm":resp.mclsNmList[i].mclsNm, "tblEnm":resp.mclsNmList[i].tblEnm , "clickEvent" : getSubList3});
				}
			}else{
				if(param.expanded && paramSize.h == '36'){
					jm.collapse_node(param);
				}else{
					jm.expand_node(param);
				}
			}
		},
		err: function(err){
			console.log("err:", err);
		}
	});

	//노드 사이즈 조절
	getNode(param);
};

//테이블 클릭 - 컬럼 팝업 호출
var getSubList3 = function(param){
	$(".kc_popup_box .title").html("<p>"+param.data.mclsNm+"</p>");

	var data = {"tblEnm": param.data.tblEnm};

	$.ajax({
		type:"POST",
		url: "/portal/dit/clb/mdl/selectColKnmList.do",
		dataType: "json",
		contentType: 'application/json',
		data: JSON.stringify(data),
		success: function(resp){
			$(".kc_layer_popup").addClass("on");
			var colKmStr = "<ul>";
			for(var i=0; i < resp.colKnmList.length; i++){
				colKmStr += "<li>- "+resp.colKnmList[i].colKnm + "</li>";
			}
			colKmStr += "</ul>";
			$(".schema_txt").html(colKmStr);
		},
		err: function(err){
			console.log("err:", err);
		}
	});

	getNode(param);

};

    var mind = {
    		meta: {
                name: 'test',
                author: '',
                version: '0.2',
            },
            format: 'node_array',
    		data: [
	                 { id: 'root1', isroot: true, topic: '암등록(환자_기본정보)', clickEvent:clickRoot},
	                 { id: 'sub1', parentid: 'root1', topic: '암임상라이브러리', clickEvent:getSubList},
	                 <c:forEach items="${crcnNmList}" var="list" varStatus="status">
	                 	{ id: 'sub1${status.index}', parentid: 'sub1', topic: '${list.crcnNm}', dtsLclsCd: '${list.dtsLclsCd}', clickEvent:getSubList1},
		             </c:forEach>


	                 { id: 'sub2', parentid: 'root1', topic: 'BaselineDB', direction: 'left', dtsLclsCd: "03", clickEvent:getSubList},
	                 <c:forEach items="${lclsNmList03}" var="list" varStatus="status">
	                 { id: 'sub2${status.index}', parentid: 'sub2', topic: '${list.lclsNm}', dtsLclsCd: '03', clickEvent:getSubList2},
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