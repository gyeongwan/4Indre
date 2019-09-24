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
	
	//아이디 재입력시 새로 중복체크 할 수 있도록
	function inputIdChk() {
		$('#idDuplication').val('');
	}
	
	//닉네임 재입력시 새로 중복체크 할 수 있도록
	function inputNickChk() {
		$('#nickDuplication').val('');
	}

	$(document).ready(function() {
		$("#signUpBtn").click(function() {
			
			var userId = $("#id").val();
			var userPw = $("#password").val();
			var userName = $("#name").val();
			var userNick = $("#nickname").val();
			var strEmail = $("#email").val();
			var userEmail = $("#email").val() + "@" + $("#url").val();
			var userTel = $("#tel").val();	
			
			var form = document.signUpForm;
			
			if (userId == '' || userId == null) {
				alert("아이디를 입력하세요.")
				$("#id").focus();
				return false;
			}
			else if (userPw == '' || userPw == null) {
				alert("비밀번호를 입력하세요.")
				$("#password").focus();
				return false;
			}
			else if (userName == '' || userName == null) {
				alert("이름을 입력하세요.")
				$("#name").focus();
				return false;
			}
			else if (userNick == '' || userNick == null) {
				alert("별명을 입력하세요.")
				$("#nickname").focus();
				return false;
			}
			else if (userPw.length > 20 || userPw.length < 4) {
				alert("비밀번호는 영문 대소문자, 숫자, 특수문자 포함 4자~20자 이내여야 합니다.");
				$("#password").focus();
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
	 		else if(form.idDuplication.value != "idCheck") {
	 			alert("아이디 중복확인을 해 주세요.");
	 			return false;
	 		}
	 		else if(form.nickDuplication.value != "nickCheck") {
	 			alert("닉네임 중복확인을 해 주세요.");
	 			return false;
	 		}
	 		else if ((strEmail == '' || strEmail == null) && (userTel == '' || userTel == null)) {
	 			alert("이메일과 연락처 중 하나를 입력하세요. 비밀번호 분실 시 사용됩니다.");
	 			return false;
	 		}
			
			document.signUpForm.action = "signUp.do";
			document.signUpForm.submit();
			
		});
	});
	
	
	$(function() {
		/* id 속성이 "checkId"인 요소에 대한 "click" 이벤트 정의 */
		$("#checkId").click(function() {
			//사용자 입력값 얻어오기
			var userId = $("input[id='id']").val();
			var regx = /^[a-zA-Z0-9]*$/;
			
			//입력여부 검사
			if (!userId) {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return false;
			}
			
			for(var i=0; i<userId.length; i++) {
				if(userId.charAt(i) != " " && regx.test(userId.charAt(i)) == false) {
					alert("아이디는 영어, 숫자만 입력 가능합니다.");
					$("#id").focus();
					return false;
				}
	        }
			
			if (userId.length > 16 || userId.length < 4) {
				alert("아이디는 영어, 숫자 포함 4자~16자 이내여야 합니다.");
				$("#id").focus();
				return false;
			}
			
			var url = "IdChkCtrl.do";
			
			//get방식 ajax 연동
			$.getJSON(url, {
				"id" : userId			
			}, function(json) {
				//결과가 전달되는 파라미터에 읽어온 데이터가 담겨 있으며,
				//JSON이므로 별도의 추출 과정 없이 점(.)으로 데이터 계층을 연결하여 사용할 수 있다
				var result_text = json.result;
				
				//"true" 혹은 "false"라는 문자열이므로, eval 함수를 사용하여 boolean값으로 변경
				var result = eval(result_text);
				
				//결과 출력
				if (result) {
					alert("사용할 수 있는 아이디입니다.");
					document.signUpForm.idDuplication.value = "idCheck";
				} else {
					alert("사용할 수 없는 아이디입니다.");
					$("#id").focus();
				}
			});
		});
		
		$("#checkNick").click(function() {
			
			var userNick = $("input[id='nickname']").val();
			var regx = /^[a-zA-Z0-9가-힣]*$/;
			
			if (!userNick) {
				alert("별명을 입력하세요.");
				$("#nickname").focus();
				return false;
			}
			
			for(var i=0; i<userNick.length; i++) {
				if(userNick.charAt(i) != " " && regx.test(userNick.charAt(i)) == false) {
					alert("별명은 한글, 영어, 숫자만 입력 가능합니다.");
					$("#nickname").focus();
					return false;
				}
	        }
			
			if (userNick.length > 6) {
				alert("별명은 한글, 영문 대소문자, 숫자 포함 6자 이내여야 합니다.");
				$("#nickname").focus();
				return false;
			}
			
			var url = "NickChkCtrl.do";
			
			$.getJSON(url, {
				"nickname" : userNick			
			}, function(json) {
				var result_text = json.result;
				
				var result = eval(result_text);

				if (result) {
					alert("사용할 수 있는 별명입니다.");
					document.signUpForm.nickDuplication.value = "nickCheck";
				} else {
					alert("사용할 수 없는 별명입니다.");
/* 					$("input[id='nickname']").val(''); */
					$("#nickname").focus();
				}
			});
		});
	});
	
</script> 

</head>

<body class="" data-aos-delay="0" data-aos-duration="800" data-aos-easing="slide" data-offset="300"
  data-target=".site-navbar-target" data-spy="scroll">

  <div class="site-wrap">

    <div id="sticky-wrapper" class="sticky-wrapper">
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
                  <li><a href="nSignUp" class="nav-link">후원하기</a></li>
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
    <form name="signUpForm" method="post">
      <div class="col-lg-12">
        <div class="item-wrapper">
          <div class="row mb-3">
            <div class="col-md-8 mx-auto">
              <p class="required "><span class="text-notnull">*</span> 필수입력사항</p>
              <div class="form-group row showcase_row_area">
                <div class="col-md-3 showcase_text_area">
                  <label for="inputType1">아이디<span class="text-notnull">*</span></label>
                </div>
                <div class="col-md-9 showcase_content_area">
                  <input type="text" class="form-control" id="id" name="id" placeholder="영문 소문자/숫자, 4~16자" style="width: 53%;" onkeyup="inputIdChk()">
                  <input type="button" value="중복확인" class="btn-ck btn-inverse-success" id="checkId"></div>
                  <input type="hidden" id="idDuplication" value="">
              </div>
              <div class="form-group row showcase_row_area">
                <div class="col-md-3 showcase_text_area">
                  <label for="inputType13">비밀번호<span class="text-notnull">*</span></label>
                </div>
                <div class="col-md-9 showcase_content_area">
                  <input type="password" class="form-control" id="password" name="password" placeholder="영문 대소문자/숫자/특수문자, 4자~20자"> </div>
              </div>
              <div class="form-group row showcase_row_area">
                <div class="col-md-3 showcase_text_area">
                  <label for="inputType12">이름<span class="text-notnull">*</span></label>
                </div>
                <div class="col-md-9 showcase_content_area">
                  <input type="text" class="form-control" id="name" name="name" placeholder="ex. 홍길동">
                </div>
              </div>
              <div class="form-group row showcase_row_area">
                <div class="col-md-3 showcase_text_area">
                  <label for="inputType12">별명<span class="text-notnull">*</span></label>
                </div>
                <div class="col-md-9 showcase_content_area">
                  <input type="text" class="form-control" id="nickname" name="nickname" placeholder="한글/영문 대소문자/숫자 6자 이내" style="width: 53%;" onkeyup="inputNickChk()">
                  <input type="button" value="중복확인" class="btn-ck btn-inverse-success" id="checkNick"></div>
                  <input type="hidden" id="nickDuplication" value="">
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
                <button id="signUpBtn" type="submit" class="btn btn-primary">동의 후 회원가입</button><br><br>
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