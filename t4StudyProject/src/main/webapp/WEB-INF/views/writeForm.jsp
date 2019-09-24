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


   <div>
    <form id="writeForm" name="writeForm" method="post">
        <div>
            <h2>글쓰기</h2>
            <div>
                <table>
                    <tr>
                        <th>제목</th>
                        <td><input style="width: 500px" type="text" id="title" name="title" /></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea style="width: 500px" rows="10" cols="10" id="content" name="content"></textarea></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><input style="width: 500px" type="text" id="writer" name="writer" /></td>
                    </tr>
                </table>
                <div>
                    <a href='#' onClick='fn_addtoBoard()'>글 등록</a>
                    <a href='#' onClick='fn_cancel()'>목록</a>
                </div>
            </div>
        </div>
    </form>
<script>
//글쓰기
function fn_addtoBoard(){
    
    var form = document.getElementById("writeForm");
    
    form.action = "<c:url value='/write.do'/>";
    form.submit();
    
}
 
//목록
function fn_cancel(){
    
    var form = document.getElementById("writeForm");
    
    form.action = "<c:url value='/boardList.do'/>";
    form.submit();
    
}
</script>
</div>
</div>
</div>
      </div>
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
    


    
