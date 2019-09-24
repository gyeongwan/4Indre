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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/studyPage.css"/>">

    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script type="text/javascript">
	$(function(){
        var responseMessage = "<c:out value="${msg}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    })
    
    var option = "width = 700, height = 700, top = 100, left = 200";
    
    function popUp() {
		
		var a = document.getElementById('ctn');
		var code = a.getAttribute('data-code');
				
		if (code == "ST1") {
			var url = "popUpStudy";        
	        window.open(url, "", option);
		}        
    }	
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
                                    <li><a href="studyPageM" class="nav-link active">학습공간</a></li>
                                    <li><a href="sltListN.do" class="nav-link">의견나눔</a></li>
                                    <li><a href="donationPage" class="nav-link">후원하기</a></li>
                                    <li><a href="myPageFirst" class="nav-link">마이페이지</a></li>
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
                        <a href="studyPageM" class="nav-link active">일반강좌</a>
                    </li>
                    <li class="nav-item">
                        <a href="studySimulM" class="nav-link ">실전 학습</a>
                    </li>
                </ul>
            </div>
            <div class="doc-content-section" id="getting-started">
                <div class="doc-content-section-inner">
                    <h1>일반강좌 <span class="sub-title">General lectures</span></h1>

                    <div class="ht-content responsive-list col-sm-12">

                        <article id="post-712" class="post-712 page type-page status-publish hentry">

                            <div class="clear"></div>
                            <div class="mb-desktop">
                                <div id="s_masonry_m3_board" class="mb-board">
                                    <div class="mb-level-0 mb-name-s-masonry-m3 mb-mode-list mb-skin-hometory-masonry-m3">
                                        <div class="mb-style1 gallery-list">
                                            <form name="s_masonry_m3_form_board_search" id="s_masonry_m3_form_board_search" method="post">
                                                <div class="list-head">

                                                    <div class="mb-category"><input type="hidden" name="category1" value=""><input type="hidden" name="category2" value=""><input type="hidden" name="category3" value=""></div>
                                                    <div class="list-search">
                                                        <select id="search_field" name="search_field" class="search-field margin-right-5" title="Search Field">
                                                        <option value="fn_title">제목</option>
                                                        </select>
                                                        <input type="text" id="search_text" class="search-text" name="search_text" accesskey="s" title="Search Text" value="" onkeypress="checkEnterKey(sendSearchData);"><input style="display:none !important;"
                                                            type="text"><button onclick="sendSearchData();return false;" title="검색" class="btn btn-default btn-search margin-left-5" type="button"><span>검색</span></button> </div>
                                                    <div class="clear"></div>
                                                </div>
                                                <div class="clear"></div>
                                            </form>
                                            <form name="s_masonry_m3_form_board_list" id="s_masonry_m3_form_board_list" method="post">

                                                <div class="main-style1" id="s_masonry_m3_board_box" style="">
                                                    <div class="gallery-list-head"></div>
                                                    <div class="gallery-list-body" id="s_masonry_m3_board_body" style="padding-left: 10%;">
                                                    
                                                    
                                                    	<c:forEach var="cnt" begin="0" end="${LIST.size() - 1}">
														<div class="gallery-item-box  col-321 start2 tran2">
                                                            <div class="gallery-item-wrap">
                                                                <div class="gallery-item-img">
                                                                    <div class="img" style="max-width:100%;width:100%;height:200px;margin:0 auto;background-image:url(${LIST[cnt].ctnPath});background-position:center center;background-size:cover;"></div>
                                                                    
                                                                </div>
                                                                <div class="gallery-title">
                                                                    <a href="javascript:popUp()" id="ctn" data-code="${LIST[cnt].ctnCode}" title="${LIST[cnt].ctnName}">
                                                                     	${LIST[cnt].ctnName}</a>
                                                                </div>
                                                                <div class="gallery-date"><span>${LIST[cnt].ctnDate}</span></div>
                                                            	</div>
                                                            </div>
                                                           </c:forEach>
                                                            
                                                        <div class="clear start2 tran2" style="transition-delay: 0.519204s;"></div>
                                                    </div>
                                                    <div class="gallery-list-foot"></div>
                                                    <div style="padding: 10px; text-align: -webkit-center;">
													<button class="btn btn-default btn-search margin-left-5" type="button" style="font-size: large;"><span>더 보기</span></button></div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </article>


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