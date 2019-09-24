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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/signUpStyle.css"/>">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">

	$(function(){
	    var responseMessage = "<c:out value="${msg}" />";
	    if(responseMessage != ""){
	        alert(responseMessage)
	    }
	})

	function selectEmail(ele) {
		 var $ele = $(ele);
		 var $url = $('input[id=url]');
		 
		 if ($ele.val() == "1") { 
			 $url.attr('readonly', false);
			 $url.val('');
		 }
		 else { 
			 $url.attr('readonly', true);
			 $url.val($ele.val());
		 }
	}

	$(document).ready(function() {
		$("#searchBtn").click(function() {
			
			var userId = $("#id").val();
			var strEmail = $("#email").val();
			var userEmail = $("#email").val() + "@" + $("#url").val();
			var userTel = $("#tel").val();	
			
			var form = document.searchForm;
			
			if (userId == '' || userId == null) {
				alert("이름을 입력하세요.")
				$("#id").focus();
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
	 			alert("연락처는 숫자만 들어갈 수 있습니다.");
	 			$("#tel").focus();
	 			return false;
	 		}
	 		else if ((strEmail == '' || strEmail == null) && (userTel == '' || userTel == null)) {
	 			alert("이메일과 연락처 중 하나를 입력하세요. 비밀번호 분실 시 사용됩니다.");
	 			return false;
	 		}
			
			document.searchForm.action = "searchPw.do";
			document.searchForm.submit();
			
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
    <form name="searchForm" method="post">
      <div class="col-lg-12" style="margin-top: 50px;">
        <div class="item-wrapper">
          <div class="row mb-3">
            <div class="col-md-8 mx-auto">
            <h6 style="text-align: center; color: #444; padding-bottom: 20px; font-family: 'NANUMGOTHIC';">회원정보에 등록한 정보를 입력해 주세요.</h6>
               <div class="form-group row showcase_row_area">
                <div class="col-md-3 showcase_text_area">
                  <label for="inputType1">아이디</label>
                </div>
                <div class="col-md-9 showcase_content_area">
                  <input type="text" class="form-control" id="id" name="id" placeholder="영문 소문자/숫자, 4~16자" style="width: 53%;">
             	 </div>
             </div>
              <div class="form-group row showcase_row_area">
                <div class="col-md-3 showcase_text_area">
                  <label for="inputType12">이메일</label>
                </div>
                <div class="col-md-9 showcase_content_area">
                  <input type="text" class="form-control" id="email" name="email" placeholder="ex. abc" style="width: 25%;">
					@ <input id="url" name="url" class="form-control" type="text" style="width: 20%; background: #f8f9fb;">
  					  <select name="select_email" onChange="selectEmail(this)" style="margin-left: 5px;">
						<option value="" selected>- 이메일 선택 -</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="empas.com">empas.com</option>
						<option value="korea.com">korea.com</option>						
						<option value="gmail.com">gmail.com</option>
						<option value="1">직접입력</option>
						</select> <span id="emailMsg"></span>
				                </div>
              </div>
              <div class="form-group row showcase_row_area">
                <div class="col-md-3 showcase_text_area">
                  <label for="inputType1">연락처</label>
                </div>
                <div class="col-md-9 showcase_content_area">
                  <input type="text" class="form-control" id="tel" name="tel" placeholder="ex. 01012345678 (-제외)">
                </div>
              </div>
              <div class="button-group">
                <button id="searchBtn" type="submit" class="btn btn-primary">비밀번호 찾기</button><br><br>
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