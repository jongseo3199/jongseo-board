<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

	/* 비지니스 로직 성공 alert 메시지 처리 */
	const message = '${ requestScope.message }';
	if(message != null && message !== '') {
		alert(message);
	}
</script>
</head>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board-regist.css" rel="stylesheet" type="text/css">
<script src="${ pageContext.servletContext.contextPath }/resources/js/event.js"></script>
<body>
    <div class="main">
        <h2 align="center">게시글 등록</h2>

        <div class="board">

            <form action="${ pageContext.servletContext.contextPath }/board/boardRegist" method="post">
                <table align="center" id="listArea">

                    <tr>
                        <th width="200px" height="50px">제목</th>
                        <td><input type="text" align="center" size="100" name="title"></td>
                    </tr>
                    <tr>
                        <th width="200px" height="50px">작성자</th>
                        <td><input type="text" size="100" name="writer"></td>
                    </tr>
                    <tr>
                        <th width="200px" height="50px">작성일</th>
                        <td><input type="text" size="100" name="createdDate"></td>
                    </tr>
                    <tr>
                        <th width="200px" height="545px">내용</th>
                        <td><textarea name="body" cols="60" rows="15"  style="resize:none;" required></textarea></td>
                        
                    </tr>
    
                </table>
            </form>
            
        </div>

        <div class="button" align="center">
            
            <button class="btn btn-left" type="submit">등록하기</button> 
            <button class="btn btn-right " type="button" onclick="location.href='${ pageContext.servletContext.contextPath }/board/list'">돌아가기</button>  
        </div>

    </div>
    
</body>
</html>