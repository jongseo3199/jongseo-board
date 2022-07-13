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

<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board-main.css" rel="stylesheet" type="text/css">
<script src="${ pageContext.servletContext.contextPath }/resources/js/event.js"></script>

</head>
<body>


    <div class="main">

        <h2 align="center">게시글 목록</h2>
        <div class="board">
            <form>

                <table align="center" id="listArea">
                    <tr>
                        <th width="100px">번호</th>
                        <th width="400px">제목</th>
                        <th width="300px">작성자</th>
                        <th width="400px">등록일</th>
                        <th width="100px">조회수</th>
                    </tr>
                   <c:forEach items="${ boardList }" var="board">
					<tr>
					    <td><c:out value="${ board.no }" /></td> 
						<td><c:out value="${ board.title }" /></td>
						<td><c:out value="${ board.writer }" /></td>
						<td><c:out value="${ board.createdDate}" /></td>
						<td><c:out value="${ board.count }" /></td>
					</tr>
				</c:forEach>
                </table>
            </form>
     
        </div>

        <div class="search-area" align="center">

            <select id="searchCondition" name="searchCondition">
                <option value="writer">작성자</option>
                <option value="title">제목</option>
                <option value="contents">내용</option>
            </select> <input type="search">
            <button class="btn btn-left" type="submit">검색하기</button>       
            <button class="btn btn-right"  onclick="location.href='${ pageContext.servletContext.contextPath }/board/boardRegist'">작성하기</button>

        </div>

        <!-- 페이징 처리 -->
        
       <jsp:include page="../board/paging.jsp" />
    </div>

</body>
</html>