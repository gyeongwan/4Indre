<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
 <title>디지털 학습 사이트</title>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/signUpStyle.css"/>">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">

	$(function(){
	    var responseMessage = "<c:out value="${msg}" />";
	    if(responseMessage != ""){
	        alert(responseMessage)
	    }
	})

	$(document).ready(function() {
		$("#nSignUpBtn").click(function() {
			
			var userName = $("#name").val();
			var userTel = $("#tel").val();	
			
			var form = document.nSignUpForm;
			
			if (userName == '' || userName == null) {
				alert("이름을 입력하세요.")
				$("#name").focus();
				return false;
			}
			/*핸드폰 번호 길이 체크*/
			else if (userTel != null && userTel.length>11) {
				alert("휴대전화 자릿수를 확인해 주세요.");
				$("#tel").focus();
				return false;
			}			
	 		/*핸드폰이 숫자만 들어가는지 체크*/
	 		else if(userTel != null && isNaN(userTel)) {
	 			alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
	 			$("#tel").focus();
	 			return false;
	 		}
	 		
			document.nSignUpForm.action = "nSignUp.do";
			document.nSignUpForm.submit();
			
		});
	});
	
	
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
                  <li><a href="home.jsp" class="nav-link">Home</a></li>
                  <li><a href="#about-section" class="nav-link">학습공간</a></li>
                  <li><a href="#team-section" class="nav-link">의견나눔</a></li>
                  <li><a href="donationPage" class="nav-link active">후원하기</a></li>
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
    <form name="nSignUpForm" method="post">
      <div class="col-lg-12">
        <div class="item-wrapper">
          <div class="row mb-3">
            <div class="col-md-8 mx-auto">
              <p class="required "><span class="text-notnull">*</span> 필수입력사항</p>
             <!--   <div class="form-group row showcase_row_area">
                
                
                  <input type="hidden" id="idDuplication" value="">
              </div>-->
              
              <div class="form-group row showcase_row_area">
                <div class="col-md-3 showcase_text_area">
                  <label for="inputType12">이름<span class="text-notnull">*</span></label>
                </div>
                <div class="col-md-9 showcase_content_area">
                  <input type="text" class="form-control" id="name" name="nmName" placeholder="ex. 홍길동">
                </div>
              </div>
              
              
              <div class="form-group row showcase_row_area">
                <div class="col-md-3 showcase_text_area">
                  <label for="inputType1">연락처</label>
                </div>
                <div class="col-md-9 showcase_content_area">
                  <input type="text" class="form-control" id="tel" name="nmTel" placeholder="ex. 01012345678 (-제외)">
                </div>
              </div>
              <div class="button-group">
              <button id="nSignUpBtn" type="submit" class="btn btn-primary">후원시작</button>
                <button type="reset" class="btn btn-primary">다시작성</button><br><br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
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