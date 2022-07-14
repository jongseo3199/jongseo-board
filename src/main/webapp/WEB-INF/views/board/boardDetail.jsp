<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board-detail.css" rel="stylesheet" type="text/css">

<script>
function aa(){
	document.f.submit();
}
</script>


<body>
    <div class="main">
        <h2 align="center">게시글 상세보기</h2>

        <div class="board">

           <form action="/board/update" name="f" method="post">
                <table align="center" id="listArea">

                    <tr>
                        <th width="200px" height="50px">제목</th>
                        <td><p><c:out value="${ requestScope.board.title }"/></p></td>
                    </tr>
                    <tr>
                        <th width="200px" height="50px">작성자</th>
                        <td><p><c:out value="${ requestScope.board.writer}"/></p></td>
                    </tr>
                    <tr>
                        <th width="200px" height="50px">작성일</th>
                        <td><p><c:out value="${ requestScope.board.createdDate }"/></p></td>
                    </tr>
                    <tr>
                        <th width="200px" height="545px">내용</th>
                        <td>
                          <textarea name="body" cols="60" rows="15"  style="resize:none;" required>
                           <c:out value="${ requestScope.board.body }"/>
                          </textarea>
                        </td>
                        
                    </tr>
    
                </table>
            </form>
            
        </div>
        <div class="button" align="center">
            
            <button class="btn btn-left" onclick="aa();">수정하기</button>
			<button class="btn btn-mid" onclick="aa();">삭제하기</button>
            <button class="btn btn-right " type="button" onclick="location.href='${ pageContext.servletContext.contextPath }/board/list'">돌아가기</button>  
        </div>

     </div>
</body>
</html>