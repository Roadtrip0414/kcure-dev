<%
/* =================================================================
* @FileName : ViewElasticExample.jsp
* @date: 2023. 3. 30.
* @author : parkgu
* @설명 : Elasticsearch 호출 예제
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/ElasticRequest.js"></script>
<style type="text/css">
  #search {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    margin-bottom: 10px;
  }

  table.elastic-result {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    border: 1px solid #ddd;
  }
  table.elastic-result th,
  table.elastic-result td {
    padding: 10px;
    border: 1px solid #ddd;
  }
</style>

<script>
  $(document).ready(() => {
    const elastic = ElasticRequest({
      url: "/portal/example/elastic/nonCheck/searchExample.do",
      path: "/cncr_spzn_ctlg/_search",
    });


    $("#search").keyup(async (e) => {
      if (e.keyCode === 13) {
        const search = e.target.value;
        const size = 100;

        const query = {
                match: {
                  ctlg_kyw_cont: search,
                }
              };
        const rows = await elastic.search(JSON.stringify(query), size);

        const template = `<tr>
          <td>{{hosp_nm}}</td>
          <td>{{ctlg_nm}}</td>
          <td>{{ctlg_smry_cont}}</td>
        </tr>`;

        let html = "";
        rows.forEach(({ hosp_nm, ctlg_nm, ctlg_smry_cont }) => {
        	html += template
            .replaceAll("{{hosp_nm}}", hosp_nm)
            .replaceAll("{{ctlg_nm}}", ctlg_nm)
            .replaceAll("{{ctlg_smry_cont}}", ctlg_smry_cont);
        });
        $("#tbodyResult").html(html);
      }
    });
  });
</script>

<div class="wrap">
<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>Elasticsearch</li>
			</ul>
		</div>
	</div>
	<div class="inquiry_list_wrap">
		<div class="con">
			<input type="text" id="search" />
			<table class="elastic-result">
			  <thead>
			    <tr>
			      <th scope="col">병원명</th>
			      <th scope="col">카탈로그명</th>
			      <th scope="col">카탈로그요약내용</th>
			    </tr>
			  </thead>
			  <tbody id="tbodyResult"></tbody>
			</table>
		</div>
	</div>

</div>
