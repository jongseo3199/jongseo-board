<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>


<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board-main.css" rel="stylesheet" type="text/css">
<script src="${ pageContext.servletContext.contextPath }/resources/js/event.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>


    <div class="main">

        <h2 align="center">게시글 목록입니다</h2>
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
                   <c:forEach items="${ boardList }" var="board" >
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
        
        <!-- 페이징 처리 -->
        
       <jsp:include page="../board/paging.jsp" />

        <!-- 검색기능 -->
		<div class="search-area" align="center">
			<form id="loginForm"
				action="${ pageContext.servletContext.contextPath }/board/list"
				method="get" style="display: inline-block">
				<input type="hidden" name="currentPage" value="1">
				 <select id="searchCondition" name="searchCondition">
					
					<option value="writer"
						${ requestScope.selectCriteria.searchCondition eq 'writer'? 'selected': '' }>작성자</option>
					<option value="title"
						${ requestScope.selectCriteria.searchCondition eq 'title'? 'selected': '' }>제목</option>
					<option value="body"
						${ requestScope.selectCriteria.searchCondition eq 'body'? 'selected': '' }>내용</option>
				</select> 
				<input type="search" id="searchValue" size=18 name="searchValue" value="
				   <c:out value="${ requestScope.selectCriteria.searchValue }"/>">

				<button class="btn btn-bs" type="submit">검색하기</button>
				
			</form>
			 <button class="btn btn-right"  onclick="location.href='${ pageContext.servletContext.contextPath }/board/boardRegist'">작성하기</button>
			
		</div>	
              <%-- <button class="btn btn-right"  onclick="location.href='${ pageContext.servletContext.contextPath }/board/boardRegist'">작성하기</button> --%>
        
        
        
    </div>


<script>

	/* 비지니스 로직 성공 alert 메시지 처리 */
	const message = '${ requestScope.message }';
	if(message != null && message !== '') {
		alert(message);
	}
	

	
	
	if(document.querySelectorAll("#listArea td")) {
		const $tds = document.querySelectorAll("#listArea td");
		for(let i = 0; i < $tds.length; i++) {
			
			$tds[i].onmouseenter = function() {
				this.parentNode.style.backgroundColor = "lightgray";
				this.parentNode.style.cursor = "pointer";
			}
			
			$tds[i].onmouseout = function() {
				this.parentNode.style.backgroundColor = "";
			}
			
			$tds[i].onclick = function() {
				const no = this.parentNode.children[0].innerText;
				location.href = "${ pageContext.servletContext.contextPath }/board/detail?no=" + no;
			}
		}
	}
	
	
	
	
	
</script>

<script>
$(document).ready(function(){
    
    let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            reutrn;
        }
        
        if(result === "enrol success"){
            alert("등록이 완료되었습니다.");
        }
        
    }    
    
});

</script>

</body>



</html>