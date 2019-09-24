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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mPageInfoStyle.css"/>">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">

	$(function(){
	    var responseMessage = "<c:out value="${redirectMsg}" />";
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

	function inputNickChk() {
		$('#nickDuplication').val('');
	}
	
	$(function() {
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
			
			var url = "/t4StudyProject/NickChkCtrl.do";
			
			$.getJSON(url, {
				"nickname" : userNick			
			}, function(json) {
				var result_text = json.result;
				
				var result = eval(result_text);

				if (result) {
					alert("사용할 수 있는 별명입니다.");
					document.updateForm.nickDuplication.value = "nickCheck";
				} else {
					alert("사용할 수 없는 별명입니다.");
					$("#nickname").focus();
				}
			});
		});
	});
	
	$(document).ready(function() {
		$("#updateBtn").click(function() {
			
			var userId = $("#id").val();
			var userPw = $("#password").val();
			var userPwCf = $("#pwConfirm").val();
			var userNewPw = $("#newPw").val();
			var userNewPwCf = $("#newPwconfirm").val();
			var userName = $("#name").val();
			var userNick = $("#nickname").val();
			var userPhone2 = $("#phone2").val();
			var userPhone3 = $("#phone3").val();
			
			var form = document.updateForm;

			if (userPw == '' || userPw == null) {
				alert("비밀번호를 입력하세요.")
				$("#password").focus();
				return false;
			}
			else if (userPwCf == '' || userPwCf == null) {
				alert("비밀번호 확인을 입력하세요.")
				$("#pwConfirm").focus();
				return false;
			}
			else if (userPw.length > 20 || userPw.length < 4) {
				alert("비밀번호는 영문 대소문자, 숫자, 특수문자 포함 4자~20자 이내여야 합니다.");
				$("#password").focus();
				return false;
			}
			else if (userPwCf.length > 20 || userPwCf.length < 4) {
				alert("비밀번호는 영문 대소문자, 숫자, 특수문자 포함 4자~20자 이내여야 합니다.");
				$("#pwConfirm").focus();
				return false;
			}
			else if (userPw != userPwCf){
				alert("비밀번호와 비밀번호 확인이 동일하지 않습니다.")
				$("#password").focus();
				$("input[id='password']").val('');
				$("input[id='pwConfirm']").val('');
				return false;
			}			
			else if (userNick == '' || userNick == null) {
				alert("별명을 입력하세요.")
				$("#nickname").focus();
				return false;
			}
	 		/*핸드폰이 숫자만 들어가는지 체크*/
	 		else if(userPhone2 != null && isNaN(userPhone2)) {
	 			alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
	 			$("#phone2").focus();
	 			return false;
	 		}
	 		else if(userPhone3 != null && isNaN(userPhone3)) {
	 			alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
	 			$("#phone3").focus();
	 			return false;
	 		}
	 		else if(form.nickDuplication.value != "nickCheck") {
	 			alert("닉네임 중복확인을 해 주세요.");
	 			return false;
	 		}
	 		else if (userNewPw != "" || userNewPwCf != "") {
	 			if (userNewPw != userNewPwCf){
					alert("새 비밀번호와 새 비밀번호 확인이 동일하지 않습니다.")
					$("#userNewPw").focus();
					$("input[id='newPw']").val('');
					$("input[id='newPwconfirm']").val('');
					return false;
				}
	 		}
			else if (userNewPw != "" && userNewPwCf != "") {
				if (userNewPw.length > 20 || userNewPw.length < 4) {
					alert("비밀번호는 영문 대소문자, 숫자, 특수문자 포함 4자~20자 이내여야 합니다.");
					$("#newPw").focus();
					return false;
				}
				else if (userNewPwCf.length > 20 || userNewPwCf.length < 4) {
					alert("비밀번호는 영문 대소문자, 숫자, 특수문자 포함 4자~20자 이내여야 합니다.");
					$("#newPwconfirm").focus();
					return false;
				}			
 			}
			
			document.updateForm.action = "infoUpdate.do";
			document.updateForm.submit();
			
		});
	});
</script>

</head>

<body class="" data-aos-delay="0" data-aos-duration="800" data-aos-easing="slide" data-offset="300"
    data-target=".site-navbar-target" data-spy="scroll">

    <div class="site-wrap">

        <div id="sticky-wrapper" class="sticky-wrapper is-sticky" style="height: 70px;">
            <header class="site-navbar py-4 bg-white js-sticky-header site-navbar-target shrink" role="banner"
                style="position: fixed; top: 0px; z-index: inherit;">

                <div class="container">
                    <div class="row align-items-center">

                        <div class="col-6 col-xl-2">
                            <h1 class="mb-0 site-logo"><a href="" class="text-black h2 mb-0">Study<span
                                        class="text-primary">.</span> </a></h1>
                        </div>
                        <div class="col-12 col-md-10 d-none d-xl-block">
                            <nav class="site-navigation position-relative text-right" role="navigation">

                                <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                    <li><a href="homeLogin" class="nav-link">Home</a></li>
                                    <li><a href="studyPageM" class="nav-link">학습공간</a></li>
                                    <li><a href="#team-section" class="nav-link">의견나눔</a></li>
                                    <li><a href="dntDetailsPage.do" class="nav-link">후원하기</a></li>
                                    <li><a href="myPageInfo" class="nav-link active">마이페이지</a></li>
                                    <li><a href="logout.do" class="nav-link">로그아웃</a></li>
                                </ul>
                            </nav>
                        </div>


                        <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;">
                            <a href="#" class="site-menu-toggle js-menu-toggle text-black float-right active"><span
                                    class="icon-menu h3"></span></a></div>

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
                    <div class="doc-content-section" id="getting-started">
                        <div class="doc-content-section-inner">
                            <h1>내 정보 <span class="sub-title">My Info</span></h1>
                            <form id="updateForm" name="updateForm" method="post">

                                <p class="required" style="float: right;"><img
                                        src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"> 필수입력사항
                                </p>
                                <div class="ec-base-table typeWrite">
                                    <table border="1" summary="">

                                        <colgroup>
                                            <col style="width:150px;">
                                            <col style="width:auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">아이디 <img
                                                        src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
                                                        alt="필수"></th>
                                                <td>
                                                    <input id="id" name="id" class="inputTypeText"
                                                        placeholder="" readonly="readonly" value="${DTO.id}" type="text">
                                                    <span class="sub" style="font-size: smaller;"> (영문 소문자/숫자,
                                                        4~16자)</span></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">비밀번호 <img
                                                        src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
                                                        class="" alt="필수"></th>
                                                <td><input id="password" name="password" autocomplete="off" maxlength="20"
                                                        value="" type="password">
                                                    <span class="sub" style="font-size: smaller;"> (영문 대소문자/숫자/특수문자, 4자~20자)</span></td>
                                            </tr>
                                            <tr class="">
                                                <th scope="row">비밀번호 확인 <img
                                                        src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
                                                        alt="필수"></th>
                                                <td><input id="pwConfirm" name="pwConfirm"
                                                        autocomplete="off" maxlength="16" value="" type="password">
                                                    <span id="pwConfirmMsg"></span>
                                                </td>
                                            </tr>
                                            <tr class="displaynone">
                                                <th scope="row">새 비밀번호</th>
                                                <td><input id="newPw" name="newPw" maxlength="20" value=""
                                                        type="password"><span class="sub" style="font-size: smaller;">
                                                        (영문 대소문자/숫자/특수문자, 4자~20자)</span></td>
                                            </tr>
                                            <tr class="displaynone">
                                                <th scope="row">새 비밀번호 확인</th>
                                                <td><input id="newPwconfirm" name="newPwconfirm" value=""
                                                        maxlength="16" type="password"> <span
                                                        id="new_pwConfirmMsg"></span>
                                                </td>
                                            </tr>


                                            <tr style="display:">
                                                <th scope="row" id="">이름 <img
                                                        src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
                                                        alt="필수"></th>
                                                <td><input id="name" name="name" class="ec-member-name" placeholder=""
                                                        maxlength="30" readonly="readonly" value="${DTO.name}" type="text"></td>
                                            </tr>
                                            <tr class="displaynone">
                                                <th scope="row">별명 <img
                                                        src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
                                                        class="displaynone" alt="필수"></th>
                                                <td><input id="nickname" name="nickname" class="inputTypeText"
                                                        placeholder="" maxlength="20" value="${DTO.nickname}" type="text"  onkeyup="inputNickChk()">
                                                        <input type="button" value="중복확인" class="btn-ck btn-inverse-success" id="checkNick" style="margin-left: 3px;">
                                                        <input type="hidden" id="nickDuplication" value="nickCheck">
                                                        <span class="sub" style="font-size: smaller;"> (한글/영문 대소문자/숫자 6자 이내)</span></td>                                            			
                                            </tr>
                                            <tr class="">
                                                <th scope="row">일반전화 </th>
                                                <td><select id="tel" name="tel">
                                               			<option value="${phone1}" style="display:none;" selected>${phone1}</option>
                                                        <option value="02">02</option>
                                                        <option value="031">031</option>
                                                        <option value="032">032</option>
                                                        <option value="033">033</option>
                                                        <option value="041">041</option>
                                                        <option value="042">042</option>
                                                        <option value="043">043</option>
                                                        <option value="044">044</option>
                                                        <option value="051">051</option>
                                                        <option value="052">052</option>
                                                        <option value="053">053</option>
                                                        <option value="054">054</option>
                                                        <option value="055">055</option>
                                                        <option value="061">061</option>
                                                        <option value="062">062</option>
                                                        <option value="063">063</option>
                                                        <option value="064">064</option>
                                                        <option value="070">070</option>
                                                        <option value="010">010</option>
                                                        <option value="011">011</option>
                                                        <option value="016">016</option>
                                                        <option value="017">017</option>
                                                        <option value="018">018</option>
                                                        <option value="019">019</option>
                                                    </select>-<input id="phone2" name="phone2" maxlength="4" value="${phone2}"
                                                        type="text">-<input id="phone3" name="phone3" maxlength="4"
                                                        value="${phone3}" type="text"></td>
                                            </tr>


                                            <tr>
                                                <th scope="row">이메일 </th>
                                                <td>
                                                    <input id="email" name="email" class="mailId" 
                                                    value="${mail1}"
                                                        type="text"> @ <input id="url" name="url"
                                                        class="mailAddress" readonly="readonly" value="${mail2}" type="text">
                                                    <select id="select_email" name="select_email" onChange="selectEmail(this)" style="margin-left: 5px;">
                                                        <option value="" selected="selected">- 이메일 선택 -</option>
                                                        <option value="naver.com">naver.com</option>
                                                        <option value="daum.net">daum.net</option>
                                                        <option value="nate.com">nate.com</option>
                                                        <option value="hotmail.com">hotmail.com</option>
                                                        <option value="yahoo.com">yahoo.com</option>
                                                        <option value="empas.com">empas.com</option>
                                                        <option value="korea.com">korea.com</option>
                                                        <option value="gmail.com">gmail.com</option>
                                                        <option value="1">직접입력</option>
                                                    </select>

                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>


                                <div class="ec-base-button justify" style="margin-top: 1em; text-align-last: center;">
                                    <button type="submit" id="updateBtn" class="btn btn-primary">확인</button>
                                    <a href="myPageFirst" class="btn btn-primary">취소</a>

                                    <span class="gRight">
                                        <a href="myPageLeave" class="btn_white btn_05">회원탈퇴</a>
                                    </span>
                                </div>
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