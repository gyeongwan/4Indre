<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- javaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- 직접 지정한 CSS -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board.css"/>">

<!-- myPagePoint에서 복사해옴 -->
  <style type="text/css">
    @import url('https://fonts.googleapis.com/css?family=Cambay:400,700');
    @import url('https://fonts.googleapis.com/css?family=Nunito:300,400,600');
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
    @import url('https://fonts.googleapis.com/css?family=Rufina');
    @import url('http://fonts.googleapis.com/earlyaccess/jejumyeongjo.css');
  </style>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/icomoon/style.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery-ui.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.carousel.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery.fancybox.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-datepicker.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/flaticon/font/flaticon.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/aos.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mPagePointStyle.css"/>">
    

<title>공지사항</title>

</head>
<body>
<div class="site-wrap">
    <div id="sticky-wrapper" class="sticky-wrapper" style="height: 88px;">
        <header class="site-navbar py-4 bg-white js-sticky-header site-navbar-target" role="banner" style="">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-6 col-xl-2">
                        <h1 class="mb-0 site-logo"><a href="home.jsp" class="text-black h2 mb-0">Study<span
                                    class="text-primary">.</span> </a></h1>
                    </div>
                    <div class="col-12 col-md-10 d-none d-xl-block">
                        <nav class="site-navigation position-relative text-right" role="navigation">

                            <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                <li><a href="homeLogin" class="nav-link">Home</a></li>
                                <li><a href="studyPageM" class="nav-link">학습공간</a></li>
                                <li><a href="sltListN.do" class="nav-link active">의견나눔</a></li>
                                <li><a href="donationPage" class="nav-link">후원하기</a></li>
                                <li><a href="myPageFirst" class="nav-link">마이페이지</a></li>
                                <li><a href="logout.do" class="nav-link">로그아웃</a></li>

                            </ul>
                        </nav>
                    </div>


                    <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a
                            href="#" class="site-menu-toggle js-menu-toggle text-black float-right active"><span
                                class="icon-menu h3"></span></a></div>

                </div>
            </div>
            
            

        </header></div>
    </div><br><br><br><br>
    
    
<div class="container">
  <form id="boardForm" name="boardForm" method="post" style="padding-top: 5%;"> 
    	<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>글번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성일</th>
		        <th>조회수</th>
		        <th>추천수</th>
		      </tr>
		    </thead>
		    <tbody id="selectable">
			    <c:forEach var="dto" items="${list}" varStatus="status">
			      <tr>
					<th>${dto.postNum}</th>
					<th class="boardTitle" id="${dto.postNum}" onClick='fn_view(${dto.postNum})'><a href="#">${dto.title}</a></th>
			        <td>${dto.writer}</td>
			        <td>${dto.regDate}</td>
			        <td>${dto.readCnt}</td>
			        <td>${dto.likeCnt}</td>
			      </tr>
				</c:forEach>
		    </tbody>
	  </table>
	  <div>
	  	<a href='#' onClick="document.location.href='insertArtic.do?ctg=N'" class="btn btn-success">글쓰기</a>
	  </div>
	  </form>
   </div>
   
   <script>

 //글조회
   function fn_view(postNum){
       
	   var form = document.getElementById("boardForm");
	   var url = "<c:url value='sltArtic.do'/>";
	   url = url + "?postNum=" + postNum;
	    
	   form.action = url;
	   form.submit(); 
   }

       
   </script>
   
  <!-- 페이징 -->
  <div class="pagination" style="padding-bottom: 5%;">
      <nav aria-label="Page navigation example">
          <ul class="pagination pg-blue">
              <li class="page-item ">
              	<c:if test="${prev}">
     		       <a class="page-link" tabindex="-1" onclick="document.location.href='sltListN.do?pageNum=${pageNum-1}'">이전</a> 
     		      </c:if>
              </li>
              <li class="page-item"><a class="page-link" onclick="document.location.href='sltListN.do?pageNum=1'">1</a></li>
              <li class="page-item"><a class="page-link" onclick="document.location.href='sltListN.do?pageNum=2'">2</a></li>
              <li class="page-item"><a class="page-link" onclick="document.location.href='sltListN.do?pageNum=3'">3</a></li>
              <li class="page-item ">
               <c:if test="${next}">
                  <a class="page-link" onclick="document.location.href='sltListN.do?pageNum=${pageNum+1}'">다음</a>
                 </c:if>
              </li>
          </ul>
      </nav>
  </div>
</body>
</html>