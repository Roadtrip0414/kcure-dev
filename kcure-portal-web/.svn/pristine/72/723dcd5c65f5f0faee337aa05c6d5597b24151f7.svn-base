// combo box select
var testCombo = RG.setGridComboBox({
    action:"/portal/example/realgrid/nonCheck/getComboRealgridExample.do", // 호출할 url
    cdAndNm : {labels:"nttId",values:"nttSj"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{}
});

var gridColumns = [
	{
    name: "nttSj2",
	fieldName: "nttSj",
	lookupDisplay: true,
    values: testCombo.values,
    labels: testCombo.labels,
    editor : {
        type: "dropdown"},
    header: {
        text: "번호"
    }
  },
	{
	header: {
		text: "제목"
	},
	name: "nttSj",
	fieldName: "nttSj",
	type: "data",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center"
}, {
	header: {
		text: "작성자"
	},
	name: "frstRegisterNm",
	fieldName: "frstRegisterNm",
	type: "data",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center"
}, {
	header: {
		text: "조회수"
	},
	name: "inqireCo",
	fieldName: "inqireCo",
	type: "data",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center"
}

];


$(document).ready(
	function() {
		
	});