<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>디지털 학습 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
  <style type="text/css">
    @import url('https://fonts.googleapis.com/css?family=Cambay:400,700');
    @import url('https://fonts.googleapis.com/css?family=Nunito:300,400,600');
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
    @import url('https://fonts.googleapis.com/css?family=Rufina');
    @import url('http://fonts.googleapis.com/earlyaccess/jejumyeongjo.css');
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/homeMainStyle.css"/>">

    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script type="text/javascript">
	$(function(){
        var responseMessage = "<c:out value="${redirectMsg}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    })
	</script> 

  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  <div class="site-wrap">
	<div id="sticky-wrapper" class="sticky-wrapper is-sticky" style="height: 70px;"><header class="site-navbar py-4 bg-white js-sticky-header site-navbar-target shrink" role="banner" style="position: fixed; top: 0px; z-index: inherit;">

      <div class="container">
        <div class="row align-items-center">
          
          <div class="col-6 col-xl-2">
            <h1 class="mb-0 site-logo"><a href="home" class="text-black h2 mb-0">Study<span class="text-primary">.</span> </a></h1>
          </div>
          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="home" class="nav-link">Home</a></li>
                <li><a href="studyPageN" class="nav-link">학습공간</a></li>
                <li><a href="sltListN.do" class="nav-link">의견나눔</a></li>
                <li><a href="nSignUp" class="nav-link">후원하기</a></li>
                <li><a href="login" class="nav-link">로그인</a></li>
                <li><a href="signUp" class="nav-link">회원가입</a></li>
              </ul>
            </nav>
          </div>


          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black float-right"><span class="icon-menu h3"></span></a></div>

        </div>
      </div>
      
    </header></div>

    <section class="site-section " id="services-section" style="
    padding-bottom: 2px;
">
	<div class="site-blocks-cover overlay aos-init aos-animate" style="background-image: url(/t4StudyProject/resources/images/main.PNG);" data-aos="fade">
      <div class="container">
        <div class="row align-items-center justify-content-center">

          <div class="col-md-12 aos-init aos-animate" data-aos="fade-up" data-aos-delay="400" style="
    padding-top: 5%;
">
                        
            <div class="row mb-4">
              <div class="col-md-6">
                <h2 style="color: white; font-weight: bold; font-family: 'NANUMGOTHIC'">당신의 생활에서 디지털,<br></h2><h1>얼마나 활용하고 계세요?</h1>
                <div><br>
                  <a href="studyPageN" class="btn btn-primary mr-2 mb-2">학습하러 가기</a>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
     </section>

    <section class="site-section " id="services-section">
            <div class="container">
              <div class="row mb-5">
                <div class="col-12 text-center">
                  <h3 class="section-sub-title">People Says</h3>
                  <h2 class="section-title mb-3">학습 후기</h2>
                </div>
              </div>
            </div>
            <div class="slide-one-item home-slider owl-carousel">
                <div>
                  <div class="testimonial"> 
                  
                     <blockquote class="mb-5">
                      <p>&ldquo;이 사이트를 통해 보다 꾸준히 학습을 할 수 있었어요. 강좌가 마냥 지루했다면 거부감만 늘었을 텐데, 빽빽하게 차 있는 글 대신, 시뮬레이션 등이 풍성히 어우러져 있거든요. 그 덕분에 매일 보는 디지털이지만 새로운 마음으로 접근할 수 있답니다.&rdquo;</p>
                    </blockquote>
                    <figure class="mb-4 d-flex align-items-center justify-content-center">
                      <div><img src="<%= request.getContextPath() %>/resources/images/person_2.jpg" alt="Image" class="w-50 img-fluid mb-3"></div>
                      <p>김경자(LA, 41세)</p>
                    </figure>                    
                  </div>
                </div>      
                <div>
                  <div class="testimonial">
                                   
                    <blockquote class="mb-5">
                      <p>&ldquo;이 사이트를 통해 보다 꾸준히 학습을 할 수 있었어요. 강좌가 마냥 지루했다면 거부감만 늘었을 텐데, 빽빽하게 차 있는 글 대신, 시뮬레이션 등이 풍성히 어우러져 있거든요. 그 덕분에 매일 보는 디지털이지만 새로운 마음으로 접근할 수 있답니다.&rdquo;</p>
                    </blockquote>
      
                    <figure class="mb-4 d-flex align-items-center justify-content-center">
                      <div><img src="<%= request.getContextPath() %>/resources/images/person_3.jpg" alt="Image" class="w-50 img-fluid mb-3"></div>
                      <p>곽두팔(LA, 76세)</p>
                    </figure>
                  </div>
                </div>
                <div>
                  <div class="testimonial">

                    <blockquote class="mb-5">
                      <p>&ldquo;이 사이트를 통해 보다 꾸준히 학습을 할 수 있었어요. 강좌가 마냥 지루했다면 거부감만 늘었을 텐데, 빽빽하게 차 있는 글 대신, 시뮬레이션 등이 풍성히 어우러져 있거든요. 그 덕분에 매일 보는 디지털이지만 새로운 마음으로 접근할 수 있답니다. &rdquo;</p>
                    </blockquote>
                    <figure class="mb-4 d-flex align-items-center justify-content-center">
                      <div><img src="<%= request.getContextPath() %>/resources/images/person_4.jpg" alt="Image" class="w-50 img-fluid mb-3"></div>
                      <p>이태선(대구, 51세)</p>
                    </figure>
      
                    
                  </div>
                </div>
      
                <div>
                  <div class="testimonial">
      
                    <blockquote class="mb-5">
                      <p>&ldquo;이 사이트를 통해 보다 꾸준히 학습을 할 수 있었어요. 강좌가 마냥 지루했다면 거부감만 늘었을 텐데, 빽빽하게 차 있는 글 대신, 시뮬레이션 등이 풍성히 어우러져 있거든요. 그 덕분에 매일 보는 디지털이지만 새로운 마음으로 접근할 수 있답니다..&rdquo;</p>
                    </blockquote>
                    <figure class="mb-4 d-flex align-items-center justify-content-center">
                      <div><img src="<%= request.getContextPath() %>/resources/images/person_1.jpg" alt="Image" class="w-50 img-fluid mb-3"></div>
                      <p>마두식(중국, 61세)</p>
                    </figure>
      
                  </div>
                </div>
      
              </div>
          </section>

    

    <section id="footer-section">
        <div id="footer-content" class="container border-bottom aa-light">
        <div id="fbox1">
          <h2>최근 업데이트 알림</h2>
          <ul class="style3">
            <li class="first">
              <p class="date"><a href="#">Sep<b>7</b></a></p>
              <h3>학습 안내 추가</h3>
              <p><a href="#">더 많은 기능을 학습할 수 있게 되었습니다!</a></p>
            </li>
            <li>
              <p class="date"><a href="#">Sep<b>5</b></a></p>
              <h3>후원 목표 금액 달성!</h3>
              <p><a href="#">목표 금액에 달성하였습니다. 감사합니다.</a></p>
            </li>
            <li>
              <p class="date"><a href="#">Aug<b>30</b></a></p>
              <h3>홈페이지 개장</h3>
              <p><a href="#">홈페이지를 오픈하였습니다.</a></p>
            </li>
            <li>
          </li></ul>
        </div>
        <div id="fbox2">
          <h2>About Us</h2>
          <p>저희 사이트는 체계화된 1:1전문 교육컨설팅을 상시로 진행하며 정보화에 고민이 있는 남녀노소 누구에게나 용기와 희망을 드리고 있습니다. 이제부터는 고민하지 마십시오. :)  </p>
          <a href="#" class="button-style">사이트 둘러보기</a> </div>
          <div id="fbox3">
          <h2>상담 신청</h2>
          
          <ul class="style5">
            <li class="first"><span class="address">Address</span>
            <span class="address-01">대구광역시 달서구 달구벌대로 1670 <br>광산빌딩 4층</span> </li>
            <li> <span class="mail">Mail</span> <span class="mail-01"><a href="#">someone@kggroup.co.kr</a></span> </li>
            <li> <span class="phone">Phone</span> <span class="phone-01">(053) 626-0082</span> </li>
          </ul>
        </div>
      </div>
    </section>

    
      
      </div>
  
  </body>
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

    </html>
    


    
