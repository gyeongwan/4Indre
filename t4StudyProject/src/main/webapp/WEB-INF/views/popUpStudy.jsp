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

	</script> 
<title>Insert title here</title>
</head>
<body>
<div style="line-height: 30;">
일반강좌 팝업창
</div>
</body>
</html>