<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Consula — Website by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/searchPwResult.css"/>">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">

	$(function(){
	    var responseMessage = "<c:out value="${msg}" />";
	    if(responseMessage != ""){
	        alert(responseMessage)
	    }
	})

	
</script> 

</head>

<body class="" data-aos-delay="0" data-aos-duration="800" data-aos-easing="slide" data-offset="300"
  data-target=".site-navbar-target" data-spy="scroll">

  <div class="site-wrap">

    <div id="sticky-wrapper" class="sticky-wrapper" style="height: 98px;">
      <header class="site-navbar py-4 bg-white js-sticky-header site-navbar-target" role="banner" style="">

        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-xl-2">
              <h1 class="mb-0 site-logo"><a href="home" class="text-black h2 mb-0">Study<span class="text-primary">.</span>
                </a></h1>
            </div>
            <div class="col-12 col-md-10 d-none d-xl-block">
              <nav class="site-navigation position-relative text-right" role="navigation">

                <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                  <li><a href="home" class="nav-link">Home</a></li>
                  <li><a href="studyPageN" class="nav-link">학습공간</a></li>
                  <li><a href="#team-section" class="nav-link">의견나눔</a></li>
                  <li><a href="donationPage" class="nav-link">후원하기</a></li>
                  <li><a href="login" class="nav-link">로그인</a></li>
                  <li><a href="signUp" class="nav-link active">회원가입</a></li>
                </ul>
              </nav>
            </div>


            <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#"
                class="site-menu-toggle js-menu-toggle text-black float-right active"><span
                  class="icon-menu h3"></span></a></div>

          </div>
        </div>

      </header>
    </div><br><br>

    <section class="site-section " id="services-section">
	<div id="daumContent" role="main" style="padding-top: 5%;">    
      <div id="cMain">
        <div id="mArticle">
          
          <p class="desc_g">안녕하세요, <em class="emph_g">${name}</em> 님. 임시 비밀번호가 아래와 같이 발급되었습니다.<br><br>
							새로운 비밀번호로 재설정해 주세요.</p>
		          <div class="cont_g cont_type3">
		            <div class="info_detail">
		              <div class="info_result">
							<ul>
							<li class="pwLi">임시 비밀번호: ${strPwd}</li>
							<li class="pwLi">발급시간: ${now}</li></ul><br>
							<a href="login" class="btn btn-primary">로그인 하러 가기</a>
							</div>							
							          </div></div>  
							        </div>
							      </div>    
							    </div>
							</section>
		
  </div>

    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
    <script src="<c:url value="/resources/js/popper.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.stellar.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.countdown.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap-datepicker.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.easing.1.3.js" />"></script>
    <script src="<c:url value="/resources/js/aos.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.fancybox.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js" />"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>

</body></html>