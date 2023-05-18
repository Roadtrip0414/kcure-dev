<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var naviLinkUrl = "/portal/dac/clc/inf/viewClcInfSummary.do"; // 임상링크
	var naviLinkNm = $(".data_request > ul > li").text().replaceAll('\n','').replaceAll('\t',''); // title이 .data_request의 하위에 있는 경우
	if(!naviLinkNm) naviLinkNm = $(".sub_visual_wrap .about > ul > li").text().replaceAll('\n','').replaceAll('\t',''); // title .sub_visual_wrap .about에 있는 경우
	if(naviLinkNm.substring(0, 2) == "공공") {
		naviLinkUrl = "/portal/dac/clc/pub/viewPubInfSummary.do";
	} else if(naviLinkNm.substring(0, 2) == "결합") {
		naviLinkUrl = "/portal/dac/clc/com/viewCombInfSummary.do";
	}
	$(".location_wrap > a:gt(0)").attr("href", naviLinkUrl)
	$(".location_wrap > a:eq(2)").text(naviLinkNm);
</script>