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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/loginStyle.css"/>">
    
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script type="text/javascript">
		$(document).ready(function() {
			$("#btnLogin").click(function() {
				
				var userId = $("#id").val();
				var userPw = $("#password").val();
				var regx = /^[a-zA-Z0-9]*$/;
				
				if (userId == "") {
					alert("아이디를 입력하세요.");
					$("#id").focus();
					return false;
				}
				else if (userPw == "") {
					alert("비밀번호를 입력하세요.");
					$("#password").focus();
					return false;
				}
				
				
				
				
				for(var i=0; i<userId.length; i++) {
					if(userId.charAt(i) != " " && regx.test(userId.charAt(i)) == false) {
						alert("아이디는 영어, 숫자만 입력 가능합니다.");
						return false;
					}
		        }
				
				document.logForm.action = "loginCheck.do"
				document.logForm.submit();
				
			});
		});
		
		$(function(){
	        var responseMessage = "<c:out value="${msg}" />";
	        if(responseMessage != ""){
	            alert(responseMessage)
	        }
	    })
	</script>

</head>

<body class="" data-aos-delay="0" data-aos-duration="800" data-aos-easing="slide" data-offset="300" data-target=".site-navbar-target" data-spy="scroll">


    <div class="site-wrap">

        <div id="sticky-wrapper" class="sticky-wrapper is-sticky" style="height: 91.9px;">
            <header class="site-navbar py-4 bg-white js-sticky-header site-navbar-target shrink" role="banner" style="position: fixed; top: 0px; z-index: inherit;">

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
                                    <li><a href="#team-section" class="nav-link">의견나눔</a></li>
                                    <li><a href="nSignUp" class="nav-link">후원하기</a></li>
                                    <li><a href="login" class="nav-link active">로그인</a></li>
                                    <li><a href="signUp" class="nav-link">회원가입</a></li>
                                </ul>
                            </nav>
                        </div>


                        <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black float-right active"><span class="icon-menu h3"></span></a></div>

                    </div>
                </div>

            </header>
        </div><br><br>

        <section class="site-section " id="services-section">
            
            <div class="authentication-theme auth-style_1">
			    
			    <div class="row">
			        <div class="col-lg-5 col-md-7 col-sm-9 col-11 mx-auto">
			            <div class="grid" style="padding-top: 50px; padding-bottom: 50px;">
			                <div class="grid-body">
			                    <div class="row">
			                        <div class="col-lg-7 col-md-8 col-sm-9 col-12 mx-auto form-wrapper">
			                            <form name="logForm" method="post">
			                                <div class="form-group input-rounded">
			                                    <input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력해 주세요.">
			                                </div>
			                                <div class="form-group input-rounded">
			                                    <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력해 주세요.">
			                                </div>
			                                <div class="form-inline">
			                                </div>			                                
			                            	<button class="btn btn-primary btn-block" id="btnLogin"> Login </button>                          	
			                            </form>
			                            <br>
			                            <div class="signup-link">
			                                <p>아직 이 사이트의 회원이 아니신가요? <a href="signUp" style="float: right;">회원가입</a><br>
								                        비밀번호가 기억나지 않는다면<a href="searchPw" style="float: right;">비밀번호 찾기</a></p>
			                            </div>
			                            <!-- 네이버 로그인 창으로 이동 -->
										<div id="naver_id_login" style="text-align:center"><a href="${url}">
										<img width="200" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>                           
			                        </div>
			                    </div>
			                </div>
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