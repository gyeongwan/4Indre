<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

  <head>
  
     <title>디지털 학습 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href= "<c:url value="/resources/fonts/icomoon/style.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery-ui.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-datepicker.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/flaticon/font/flaticon.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/aos.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/pmtcss/style.css"/>">
    
    
    <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  <script type="text/javascript">
	$(function(){
        var responseMessage = "<c:out value="${msg}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    })
    
    $(document).ready(function() {
			$("#btnPnt").click(function() {
				
				var dntMny = $("#dntMny").val();
				
				if (dntMny == "") {
					alert("후원금액을 입력하세요.");
					$("#dntMny").focus();
					return false;
				}
				
				
				
				
				document.logForm.action = "loginCheck.do"
				document.logForm.submit();
				
			});
		});
	
	//$("#check_module").click(function () {

	
	// });
	/*function request_pay() {
		
		var IMP = window.IMP;
		IMP.init('imp75761841');
		
		var dnuMny = $('.dntMny').val();

		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 101,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "/t4StudyProject/paymentInst.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
		    		}
		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;

		    			alert(msg);
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;

		        alert(msg);
		    }
		});
	}
	var payment = document.payment;
	var amountCk = payment.dntMny.value;

	if(!amountCk){
	    alert("금액을 입력해주세요.")
	}else{
	    payment.submit();
	}*/

			
			
    </script>
    
    
  </head>
  
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" class="header-fixed docs-body">
  <div class="site-wrap">

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
                <li><a href="donationPage" class="nav-link active">후원하기</a></li>
                <li><a href="myPageFirst" class="nav-link">마이페이지</a></li>
                <li><a href="logout.do" class="nav-link">로그아웃</a></li>
              </ul>
            </nav>
          </div>


          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black float-right"><span class="icon-menu h3"></span></a></div>

        </div>
      </div>
      
    </header><br><br>

<!--  -->
    <div class="doc-content-wrapper container">
      <div class="doc-aside">
        <div class="aside-header">
         
          <div class="nav-toggle-warpper">
            <span class="nav-toggler"></span>
          </div>
        </div>
        <ul class="nav">
          <li class="nav-item">
            <a href="donationPage" class="nav-link active">후원하기</a>
          </li>
          <li class="nav-item">
            <a href="dntDetailsPage.do" class="nav-link ">후원 내역</a>
          </li>
        </ul>
      </div>
      <div class="doc-content-section" id="getting-started">
        <div class="doc-content-section-inner">
          <h1>후원하기<span class="sub-title">Donation</span></h1>
          
		<h2>총 1${CNT}명이 ${TOT} 원을 후원해주셨습니다.</h2><br>
 
           <form  id="payment" action="/t4StudyProject/paymentInst.do">
						
			<div class="radiobtn">    
             <p>후원방법</p><p class="star">*</p>
             
             <input id="toggle-1" type="radio" name="payMTHD" checked="checked" value="1"/>
                <label for="toggle-1"></label>
                <p >카드후원</p>
                 
             <input id="toggle-2" type="radio" name="payMTHD" checked="checked" value="2"/>
                <label for="toggle-2"></label>
                <p>포인트후원</p>
             
           </div>
          <hr class="line">
          
          <div class="dnt">
          
             <p>후원금액</p><p class="star2">*</p>
             <div class="form-group input-rounded">
                 <input type="text" id="dntMny" name="dntMny" class="form-control" placeholder="후원금액 입력" style="text-align: right; height: 38px; " >
             </div>
              <p>원</p>  
             </div>
              
          <section id="basic-structure">
            <h2></h2>
            <p></p>
             <button id="btnPnt" type="submit" class="btn btn-primary btn-block" style="width: 50%; float: center;"> 후원하기 </button>
           
            <!--  <input type="button"
                    onclick="request_pay();" value="후원하기" class="btn btn-primary btn-block" >
              <a href="donationPage.do" onclick="document.getElementById('request_pay()').submit();">전송 </a> -->

          </section>
          </form>
          
          
        </div>
      </div>
    </div>
    
      </div>
    </body>
     <!-- <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script> -->
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
    


    
