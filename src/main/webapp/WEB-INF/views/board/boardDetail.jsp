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
		
		
		/* 삭제 버튼 */
		$("#delete_btn").on("click", function(e){
		    form.attr("action", "/board/delete");
		    form.attr("method", "post");
		    form.submit();
		});
</script>



<body>
    <div class="main">
        <h2 align="center">게시글 상세보기</h2>

        <div class="board">

           
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
                        <th width="200px" height="30px">게시물 번호</th>
                        <td><p><c:out value="${ requestScope.board.no }"/></p></td>
                    </tr>
                 
                    <tr>
                        <th width="200px" height="513px">내용</th>
                        <td>
              
                          <textarea style="resize:none; width:95%; height:460px;" style="resize:none;" readonly><c:out value="${ requestScope.board.body }"/></textarea>
                        </td>
                        
                    </tr>
                    
                </table>
            
        </div>
        <div class="button" align="center">
            
            <button class="btn btn-left" onclick="location.href='${ pageContext.servletContext.contextPath }/board/update?no=${ requestScope.board.no }'">수정하기</button>
           
            
			<button class="btn btn-bs" onclick="location.href='${ pageContext.servletContext.contextPath }/board/delete?no=${ requestScope.board.no }'">삭제하기</button>
			
            <button class="btn btn-right " type="button" onclick="location.href='${ pageContext.servletContext.contextPath }/board/list'">돌아가기</button>  
        </div>

     </div>
</body>
</html>