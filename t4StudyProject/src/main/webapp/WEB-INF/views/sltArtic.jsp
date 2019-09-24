<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="/css/bootstrap.css">
 
 <!-- javaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- 직접 지정한 CSS -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board.css"/>">

<!-- myPagePoint에서 복사해옴 -->
  <style type="text/css">
    @import url('https://fonts.googleapis.com/css?family=Cambay:400,700');
    @import url('https://fonts.googleapis.com/css?family=Nunito:300,400,600');
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
    @import url('https://fonts.googleapis.com/css?family=Rufina');
    @import url('http://fonts.googleapis.com/earlyaccess/jejumyeongjo.css');
  </style>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.css">
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
<title>게시글 상세조회</title>
</head>
<body>
<div>
    <form id="viewForm" name="viewForm" method="post">
        <div>
            <h2>게시글 조회</h2>
            <div>
                 <table class="table table-hover" id=article>
                    <tr>
                        <th>제목</th>
                        <td>${dto.title }</td>
                    </tr>
                    <tr>
                        <th>글내용</th>
                        <td>${dto.articPath }</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${dto.writer}</td>
                    </tr>
                </table>
                <div>
                    <a href='#' onClick='fn_update()'>수정</a>
                    <a href='#' onClick='fn_cancel()'>목록</a>
                </div>
                <input type='hidden' id='postNum' name='postNum' value='${postNum}'/>
            </div>
        </div>
    </form>
    
<!-- 댓글 조회 -->
<div class="container">
<form id="viewReply" name="viewReply" method="post">
        <div>
            <h2>댓글 조회</h2>
            <div>
                <table class="table table-hover">
                <c:forEach var="rDto" items="${reList}" varStatus="status">
                <input type='hidden' id='reRef' name='reRef' value='${rDto.reRef}' />
                <input type='hidden' id='reOrder' name='reOrder' value='${rDto.reOrder}' />
                <input type='hidden' id='reDept' name='reDept' value='${rDto.reDept}' />
                    <tr>
                        <th>${rDto.reWriter}</th>
                        <td>${rDto.rePath }</td>
                        <td> <a href='#' onClick="fn_reReply();"
                        id="replyRef"
                        data-ref='${rDto.reRef}'
                        data-order='${rDto.reOrder}'
                        data-dept='${rDto.reDept}'>답글쓰기</a></td>
                        <td> <a href='#' onClick='fn_update()'>수정</a></td>
                    </tr>
                </c:forEach>
                </table>
                <input type='hidden' id='postNum' name='postNum' value='${postNum}'/>
            </div>
        </div>
    </form>
    </div>

<!-- 댓글 등록 -->
<div class="container">
<form id="writeReply" name="writeReply" method="post">
<input type='hidden' id='reRef' name='reRef' value='0' />
<input type='hidden' id='postNum' name='postNum' value='${postNum}'/>
<br><br>
    <div>
        <div>
            <span><strong>댓글</strong></span> <span id="cCnt"></span>
        </div>
        <div>
            <table class="table">                    
                <tr>
                    <td>
                        <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="rePath" placeholder="댓글을 입력하세요"></textarea>
                        <br>
                        <div>
                            <a href='#' onClick="fn_addtoBoard('${postNum}', 'reRef')" class="btn pull-right btn-success">등록</a>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</form>
</div>

<script>
//목록
function fn_cancel(){
    
    var form = document.getElementById("viewForm");
    
    form.action = "<c:url value='sltListN.do'/>";
    form.submit();
    
}
//수정
function fn_update(){
    
    var form = document.getElementById("viewForm");
    
    form.action = "<c:url value='updateArtic.do'/>";
    form.submit();
}

</script>
</div>

<script>
//댓글쓰기
function fn_addtoBoard(postNum, reRef){
    
    var form = document.getElementById("writeReply");
    
    form.action = "<c:url value='insertRe?postNum=${postNum}'/>";
    form.submit();
}

function fn_reReply()
{
	var a = document.getElementById('replyRef');
	var ref = a.getAttribute('data-ref');
	var order = a.getAttribute('data-order');
	var dept = a.getAttribute('data-dept')
	
	opener.location.href="insertRe.do?reRef="+ref+"reOrder="+order+"reDept"+dept;
}
</script>
</body>
</html>