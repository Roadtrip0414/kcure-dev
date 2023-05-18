<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,user-scalable=yes" />
<meta name="title" content="" />
<meta name="keyword" content="" />
<meta name="description" content="" />
<title>K-CURE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
*, *::before, *::after{box-sizing:border-box;-webkit-box-sizing:border-box;margin:0;padding:0;}
html, body{-webkit-text-size-adjust:none;text-size-adjust:none;height: 100%;}
body{font-size:20px;line-height:1.5;font-family: "Noto Sans KR",sans-serif; font-weight:400;color: #010E31;}
ol, ul, li{list-style:none;}
.open-wrap{position:relative;display:table;width: 100%;height: 100%;background: url('intro_bg.png') no-repeat;background-position: center;background-size: cover;}
.open-wrap .open-inbox{display: table-cell;text-align: center;vertical-align: middle;}
.open-wrap .txt{font-size:31px;font-weight: 500;margin-top:38px;line-height:46px;}
.open-wrap .imgbox{position: absolute;right:80px;bottom:42px;}
.open-wrap .imgbox img{margin:0 11px;}
@media screen and (max-width: 920px) {
	.open-wrap{background-position: right;}	
	.open-wrap .imgbox{right: 40px;bottom:30px;}
}
@media screen and (max-width: 767px) {
    .open-wrap .txt{font-size: 20px;line-height:30px;}
	.open-wrap .imgbox img{height: 27px;margin:0 7px;}
}
@media screen and (max-width: 460px) {
	.open-wrap .imgbox{right:0;text-align: center;width: 100%;}
}
@media screen and (max-width: 360px) {
	.open-wrap .imgbox img{height: 25px;margin:0 5px;}
}
</style>

</head>
<body>
<div class="open-wrap">
	<div class="open-inbox">
		<p><img src="intro_logo_01.png" alt=""></p>
		<p class="txt">오픈서비스를 위해 준비중입니다.<br>잠시만 기다려주세요.</p>
		<div class="imgbox">
			<span><img src="intro_logo_03.png" alt=""></span><!-- 로고 순서 변경 -->
			<span><img src="intro_logo_02.png" alt=""></span><!-- 로고 순서 변경 -->
			<span><img src="intro_logo_04.png" alt=""></span>
		</div>
	</div>
</div>
</body>
</html>