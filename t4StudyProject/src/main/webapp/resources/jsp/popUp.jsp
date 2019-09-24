<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
    </style>

    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/icomoon/style.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery-ui.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.carousel.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery.fancybox.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-datepicker.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/flaticon/font/flaticon.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/aos.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/popUpStyle.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script type="text/javascript">
	$(function(){
        var responseMessage = "<c:out value="${msg}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    })
    
    var option = "width = 700, height = 700, top = 100, left = 200";
    
    function moveClose() {
    	var a = document.getElementById('ctnCode');
		var code = a.getAttribute('data-code');
		
		opener.location.href="endStudy.do?ctnCode=" + code; 
		self.close();
    }	
	</script> 
<title>Insert title here</title>
</head>
<body>
<div style="line-height: 30;">
이것은 새로운 팝업창!
<br>
<a href="#" onclick="moveClose();" id="ctnCode" data-code="ST1" class="btn">
<span class="arr">학습 완료</span></a>
</div>
</body>
</html>