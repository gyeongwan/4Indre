<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en"><head>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mPageFirstStyle.css"/>">

    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script type="text/javascript">
	$(function(){
        var responseMessage = "<c:out value="${msg}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    })
    
    $(document).ready(function() {
			$("#btnCheck").click(function() {
				
				var userPw = $("#password").val();
				var regx = /^[a-zA-Z0-9]*$/;
				
				if (userPw == "") {
					alert("비밀번호를 입력해 주세요.");
					$("#password").focus();
					return false;
				}
				
				document.checkForm.action = "pwCheck.do"
				document.checkForm.submit();
				
			});
		});
	</script> 

</head>

<body class="" data-aos-delay="0" data-aos-duration="800" data-aos-easing="slide" data-offset="300" data-target=".site-navbar-target" data-spy="scroll">

    <div class="site-wrap">

        <div id="sticky-wrapper" class="sticky-wrapper" style="height: 118px;">
            <header class="site-navbar py-4 bg-white js-sticky-header site-navbar-target" role="banner">

                <div class="container">
                    <div class="row align-items-center">

                        <div class="col-6 col-xl-2">
                            <h1 class="mb-0 site-logo"><a href="homeLogin" class="text-black h2 mb-0">Study<span class="text-primary">.</span> </a></h1>
                        </div>
                        <div class="col-12 col-md-10 d-none d-xl-block">
                            <nav class="site-navigation position-relative text-right" role="navigation">

                                <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                    <li><a href="homeLogin" class="nav-link">Home</a></li>
                                    <li><a href="studyPageM" class="nav-link">학습공간</a></li>
                                    <li><a href="sltListN.do" class="nav-link">의견나눔</a></li>
                                    <li><a href="donationPage" class="nav-link">후원하기</a></li>
                                    <li><a href="myPageFirst" class="nav-link active">마이페이지</a></li>
                                    <li><a href="logout.do" class="nav-link">로그아웃</a></li>
                                </ul>
                            </nav>
                        </div>


                        <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black float-right active"><span class="icon-menu h3"></span></a></div>

                      </div>
                  </div>

              </header>
          </div><br><br>

          <section class="site-section " id="services-section">
             <div class="header-fixed docs-body">
             <div class="doc-content-wrapper container">
                 <div class="doc-aside">
        <div class="aside-header">
         
          <div class="nav-toggle-warpper">
            <span class="nav-toggler"></span>
          </div>
        </div>
        <ul class="nav">
          <li class="nav-item">
            <a href="myPageFirst" class="nav-link active">내 정보</a>
          </li>
          <li class="nav-item">
            <a href="myPagePoint" class="nav-link ">포인트 이력</a>
          </li>
          <li class="nav-item">
            <a href="myPageStudy" class="nav-link">학습 이력</a>
            </li>
          <li class="nav-item">
            <a href="dntDetailsPage.do" class="nav-link">후원 내역</a>
            </li>
        </ul>
      </div>
                 <div class="doc-content-section" id="getting-started" style="
">
                     <div class="doc-content-section-inner">
                         <h1>내 정보 <span class="sub-title">My Info</span></h1>
							<form name="checkForm" method="post" action="#" class="first-ck" style="text-align: -webkit-center; padding-top: 30px;">
	                           <div class="form-group input-rounded">
                                   <input type="password" name="password" class="form-control" placeholder="비밀번호를 입력해 주세요.">
                               </div>
                               <div class="form-inline">
                               </div>
                               <button type="submit" id="btnCheck" class="btn btn-primary btn-block"> 확인 </button>
                           </form>
			                      
</div>
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


</body>

</html>