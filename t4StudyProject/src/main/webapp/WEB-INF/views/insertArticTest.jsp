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
<title>게시글 등록</title>
</head>
<body>
<body>
<div>
    <form id="writeForm" name="writeForm" method="post">
    <input type="hidden" id="ctg" name="ctg" value="N"/>
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
                        <td><textarea style="width: 500px" rows="10" cols="10" id="content" name="articPath"></textarea></td>
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
    
    form.action = "<c:url value='insertArtic'/>";
    form.submit();
}
 
//목록
function fn_cancel(){
    
    var form = document.getElementById("writeForm");
    
    form.action = "<c:url value='sltListN.do'/>";
    form.submit();
}
</script>
</div>
</body>
</html>