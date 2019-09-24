<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject"%>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mPagePointStyle.css"/>">

</head>

<body class="" data-aos-delay="0" data-aos-duration="800" data-aos-easing="slide" data-offset="300"
  data-target=".site-navbar-target" data-spy="scroll">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">

	var selectedTab = null; //탭이 선택된 항목
	
	$(function(){
		$("ul.panel li:not("+$("ul.tab li a.selected").attr("href")+")").hide();
		$("ul.tab li a").click(function(){
			$("ul.tab li a").removeClass("selected");
			$("li").removeClass("on");
			$(this).addClass("selected");
			$("ul.panel li").hide();
			$($(this).attr("href")).show();
			$("button").removeClass("on");
			$('[id="7d"]').addClass("on");			
			$('#stdt').val('Default Value');
			$('#eddt').val('Default Value');	
			selectedTab = $(this).attr('id')
			
			selectPointList();
			
			return false;
		});
	});

	window.onload = function () {
		selectPointList();
	}

	function getFormatDate(date) {
	    var inputDt = new Date(date);
	    var year = inputDt.getFullYear();
	
	    var month = (1 + inputDt.getMonth());			//M
	    month = month >= 10 ? month : '0' + month;	//month 두자리로 저장
	    var day = inputDt.getDate();					//d
	    day = day >= 10 ? day : '0' + day;			//day 두자리로 저장
	    return year + '' + month + '' + day; 
	}
	
	function searchClick() {

		var $datePickers = $('[data-control="datepicker"]');//.not(me.$el);
	    var to   = $('[id="stdt"]').val();
	        from = $('[id="eddt"]').val(); 
	        
        /* 현재일자 */
        var date = new Date();
        var currentday = getFormatDate(date);
        
        if (to == "" || from == "") {
            alert('입력하신 날짜를 확인해 주세요.');
            return;
        }
        
        if (to-from > 0){
            alert('입력하신 날짜를 확인해 주세요.');
            return;
        }

        /* 시작일자 */
        var stdt = $('#stdt').val();
        stdt = getFormatDate(stdt);
        /* 종료일자 */
        var eddt = $('#eddt').val();
        eddt = getFormatDate(eddt);
        
        /* 시작일자와 종료일자가 당일자보다 클 경우 메세지처리 */
        if(parseInt(currentday) < parseInt(stdt))
       {
            alert('시작일은 당일자 이상 선택할 수 없습니다.');
              $("#stdt").val("");
              $("#eddt").val("");
           return;
       }
        
        if(parseInt(currentday) < parseInt(eddt) || parseInt(currentday) < parseInt(stdt))
        {
            alert('종료일은 당일자 이상 선택할 수 없습니다.');
               $("#stdt").val("");
               $("#eddt").val("");
            return;
        }	
        
        if( parseInt(stdt) > parseInt(eddt) )
        {
            alert('조회 시작일보다 조회 종료일이 빠릅니다. 조회기간을 확인해 주세요!');
               $("#stdt").val("");
               $("#eddt").val("");
            return;
        }
        
        selectPointList();
        
	}
	
	// 실제 포인트 조회 ajax
	function selectPointList() {
		
		var stdt = $('[id="stdt"]').val().replace(/-/g,"");
	    var eddt = $('[id="eddt"]').val().replace(/-/g,"");
	    var url = "pointList.do";
		
	    $.ajax({
	         type : "GET",
	         url : "pointList.do",
	         data : { stdt: stdt, eddt: eddt, selectedTab: selectedTab },
	         dataType : "json",
	         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	         success: function(data) {
	        	 
	        	 $("#allTable").empty();
	        	 $("#useTable").empty();
	        	 $("#saveTable").empty();
	        	 $("#useDiv").empty();
		         $("#saveDiv").empty();
	        	 
	        	 $.each(data, function(index, entry) {
	        		 var items = [];
	        		 var uItems = [];
	        		 var sItems = [];
	        		 
	        		 if (entry.PtDate == null && entry.TotUPt == null) {
	        			 items.push("<td colspan='4'>" + "포인트 내역이 없습니다." + "</td>");
	        			 return;
	        		 }
	        		 else if (entry.TotUPt != null) {
        				 $(".useDiv").html(entry.TotUPt);
     	    			 $(".saveDiv").html(entry.TotSPt);
        				 return;
        			 }
	        		 else {
        				 items.push("<td>" + entry.PtDate + "</td>");
						 items.push("<td>" + entry.PtLog + "</td>");
						 items.push("<td>" + entry.UsePt + "</td>");
						 items.push("<td>" + entry.SavePt + "</td>");
						 
						 uItems.push("<td>" + entry.PtDate + "</td>");
        			     uItems.push("<td>" + entry.PtLog + "</td>");
        			     uItems.push("<td>" + entry.UsePt + "</td>");
        			     
        			     sItems.push("<td>" + entry.PtDate + "</td>");
        			 	 sItems.push("<td>" + entry.PtLog + "</td>");
        			 	 sItems.push("<td>" + entry.SavePt + "</td>");
	        		  }
	        		 $("<tr/>", {
					 		html : items
					 }).appendTo("#allTable");
 	        		 $("<tr/>", {
					 		html : uItems
					 }).appendTo("#useTable");
		        	 $("<tr/>", {
					 		html : sItems
					 }).appendTo("#saveTable");
				 })
				 
	         },
	         error: function(error) {
	        	 alert("Error!");
	         },
	         complete: function() {
	         }
	      });
		
	}

</script>

<div class="site-wrap">
    <div id="sticky-wrapper" class="sticky-wrapper" style="height: 88px;">
        <header class="site-navbar py-4 bg-white js-sticky-header site-navbar-target" role="banner" style="">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-6 col-xl-2">
                        <h1 class="mb-0 site-logo"><a href="home.jsp" class="text-black h2 mb-0">Study<span
                                    class="text-primary">.</span> </a></h1>
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


                    <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a
                            href="#" class="site-menu-toggle js-menu-toggle text-black float-right active"><span
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
                            <a href="myPageFirst" class="nav-link">내 정보</a>
                        </li>
                        <li class="nav-item">
                            <a href="myPagePoint" class="nav-link active">포인트 이력</a>
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
                        <h1 style="">포인트 이력 <span class="sub-title">Point History</span></h1>
                        <p class="pointTit">나의 사용 가능 포인트 <span class="em" style="font-size: x-large;">${strPoint}</span></p>
                        <a href="studySimulM" class="btn" style="float: right;"><span class="arr">포인트 쌓으러 가기</span></a>
                        <div class="content_box" style="padding-top: 12px;">
                            <div class="my_point">

                                <div class="tab_wrap type7">
                                   <ul class="tab" data-control="tab">
                                        <li class="tab_list"><a href="#tab1" id="all" class="tab_link selected"><span>전체</span></a></li>
                                        <li class="tab_list"><a href="#tab2" id="use" class="tab_link"><span>사용</span></a>
                                        </li>
                                        <li class="tab_list"><a href="#tab3" id="save" class="tab_link"><span>적립</span></a>
                                        </li>

                                    </ul>
                                </div>
                                <!-- 조회기간 선택 -->
                                <form name="searchForm">
                                    <input type="hidden" id="page_num" name="page_num" value="1">
                                    <input type="hidden" id="month" name="month" value="">
                                    <div class="dateSearch_sec all_point">
                                        <div class="in_sec">
                                            <h3 class="haze">조회기간 선택</h3>

                                            <dl class="search_list">
                                                <dt class="tit">기간선택</dt>
                                                <dd class="select_btn">
                                                    <ul class="period_tab">
                                                        <li class="" data-val="7d">
                                                        <button type="button" class="on" id="7d" title="선택됨" onclick="setSearchDate('7d')">1주일</button></li>
                                                        <li class="" data-val="1m">
                                                        <button type="button" class="" id="1m" title="" onclick="setSearchDate('1m')">1개월</button></li>
                                                        <li class="" data-val="3m">
                                                        <button type="button" class="" id="3m" title="" onclick="setSearchDate('3m')">3개월</button></li>
                                                        <li class="" data-val="6m">
                                                        <button type="button" class="" id="6m" title="" onclick="setSearchDate('6m')">6개월</button></li>
                                                    </ul>
                                                </dd>
                                                <dd class="select_datepicker">
                                                    <div class="datepicker_wrap">
                                                        <input data-date="2019.02.20" autocomplete="off"
                                                            id="stdt" name="stdt" data-error-text="입력하신 날짜를 확인해주세요."
                                                            title="시작 날짜 선택" placeholder="날짜 선택"
                                                            data-format="date" data-control="datepicker"
                                                            class="text hasDatepicker" type="date" required>
                                                        <div class="hyphen"></div>
                                                        <input type="date" class="text hasDatepicker"
                                                            data-control="datepicker" data-format="date"
                                                            placeholder="날짜 선택" title="종료 날짜 선택"
                                                            data-error-text="입력하신 날짜를 확인해주세요." name="eddt" id="eddt"
                                                            autocomplete="off" data-date="2019.08.20" required>
                                                    </div>
                                                </dd>



                                            </dl>
                                            <div class="btn_wrap">
                                                <button type="button" class="btn btn_search" data-handler="dailySearch"
                                                    id="searchBtn" onclick="javascript:searchClick()">조회</button>
                                                <p class="bul_list">
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                
                                <div id="onePointBreakdown" class="breakdown_sec my_point_cont">
                                    <div>
                                        <!-- 전체 -->
                                        <ul class="panel">
                                        
                            <!-- /**************************전체 리스트**************************/ -->
                                        <li id="tab1" style="display: list-item;">
                                        <div class="point_info_box">
                                            <dl>
                                                <dt class="first"><em>조회 기간 내 </em> 사용 포인트</dt>
                                                <dd class="em"><div class="useDiv"></div><span class="line"></span></dd>
                                                <dt>적립 포인트</dt>
                                                <dd class="em"><div class="saveDiv"></div></dd>
                                            </dl>
                                        </div>

                                        <div class="board_list">
                                            <table>											
                                                <colgroup>
                                                    <col class="date">
                                                    <col class="shop">
                                                    <col class="status">
                                                    <col class="expiration_date">
                                                </colgroup>
                                                
                                                <thead>
                                                    <tr>
                                                        <th scope="col">이력날짜</th>
                                                        <th scope="col">내역</th>
                                                        <th scope="col">사용포인트</th>
                                                        <th scope="col">적립포인트</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="allTable">
                                                </tbody>
                                            </table>
                                        </div>
                                        </li>
                                        
                                        
                            <!-- /**************************사용 리스트**************************/ -->
                                        <li id="tab2" style="display: none;">
                                        
                                        <div class="point_info_box">
                                            <dl>
                                                <dt class="first"><em>조회 기간 내</em> 사용 포인트</dt>
                                                <dd class="em"><div class="useDiv"></div>
                                                <span class="line"></span></dd>
                                            </dl>
                                        </div>

                                        <!-- 스크롤테이블 -->
                                        <div class="board_list">
                                            <table>
											
                                                <colgroup>
                                                    <col class="date">
                                                    <col class="shop">
                                                    <col class="expiration_date">
                                                </colgroup>
                                                
                                                <thead>
                                                    <tr>
                                                        <th scope="col">이력날짜</th>
                                                        <th scope="col">내역</th>
                                                        <th scope="col">사용포인트</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="useTable">
                                                </tbody>
                                            </table>
                                        </div>
                                        </li>
                                        
                            <!-- /**************************적립 리스트**************************/ -->
                                        <li id="tab3" style="display: none;">
                                        
                                        <div class="point_info_box">
                                            <dl>
                                                <dt class="first"><em>조회 기간 내</em> 적립 포인트</dt>
                                                <dd class="em"><div class="saveDiv"></div>
                                                <span class="line"></span></dd>
                                            </dl>
                                        </div>

                                        <!-- 스크롤테이블 -->
                                        <div class="board_list">
                                            <table>
											
                                                <colgroup>
                                                    <col class="date">
                                                    <col class="shop">
                                                    <col class="expiration_date">
                                                </colgroup>
                                                
                                                <thead>
                                                    <tr>
                                                        <th scope="col">이력날짜</th>
                                                        <th scope="col">내역</th>
                                                        <th scope="col">적립포인트</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="saveTable">
                                                </tbody>
                                            </table>
                                        </div>
                                        </li>
                                        </ul>
                                        
                                        <!-- //스크롤테이블 -->
                                        <!-- 페이징 -->
                                        <div class="pagination">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination pg-blue">
                                                    <li class="page-item ">
                                                        <a class="page-link">이전</a>
                                                    </li>
                                                    <li class="page-item active"><a class="page-link">1</a></li>
<!--                                                     <li class="page-item">
                                                        <a class="page-link">2 <span
                                                                class="sr-only">(current)</span></a>
                                                    </li>
                                                    <li class="page-item"><a class="page-link">3</a></li> -->
                                                    <li class="page-item ">
                                                        <a class="page-link">다음</a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
 
<script type="text/javascript">
	
	function formatDate(date) {
		var inputDt = new Date(date);
		var year = inputDt.getFullYear();

		var month = (1 + inputDt.getMonth());			//M
		month = month >= 10 ? month : '0' + month;	//month 두자리로 저장
		var day = inputDt.getDate();					//d
		day = day >= 10 ? day : '0' + day;			//day 두자리로 저장
		return year + '-' + month + '-' + day; 
	}
	
	$('button').on('click', function() {
		$(this).addClass('on');
	});
	
	function setSearchDate(start){

		var num = start.substring(0,1);
		var str = start.substring(1,2);

		var today = new Date();
		
		var endDate = formatDate(today);
		$('#eddt').val(endDate);

		if(str == 'd'){
		today.setDate(today.getDate() - num);
		} else if (str == 'w'){
		today.setDate(today.getDate() - (num*7));
		} else if (str == 'm'){
		today.setMonth(today.getMonth() - num);
		today.setDate(today.getDate() + 1);
		}
		
		$("button").removeClass("on");
		var startDate = formatDate(today);
		$('#stdt').val(startDate);
	}			

</script>
	
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