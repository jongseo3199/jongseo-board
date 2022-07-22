<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">


</script>

<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board-update.css" rel="stylesheet" type="text/css">
<script src="${ pageContext.servletContext.contextPath }/resources/js/event.js"></script>
</head>

<body>
    <div class="main">
        <h2 align="center">게시글 수정</h2>

        <div class="board">

            <form action="/board/update" name="form" id="form" method="post">
                <table align="center" id="listArea">

                    <tr>
                        <th width="170px" height="50px">제목</th>
                        <td><input type="text" align="center" size="5" name="title" value="${ requestScope.board.title }"></td>
                    </tr>
                    <tr>
                        <th width="170px" height="50px">작성자</th>
                        <td><p><c:out value="${ requestScope.board.writer }"/></p></td>
                    </tr>
                    <tr>
                        <th width="170px" height="50px">작성일</th>
                        <td><p><c:out value="${ requestScope.board.createdDate }"/></p></td>
                    </tr>
                    <tr>
                       
                        <td><input type="hidden" align="center" size="100" name="no" value="${ requestScope.board.no }"></td>
                    </tr>
                    <tr>
                        <th width="170px" height="545px">내용</th>
                        <td>
							<textarea id="body" name="body" cols="50" rows="15" style="resize:none;" required><c:out value="${ requestScope.board.body }"/></textarea>
							<div id="test_cnt">(0 / 500)</div>
						</td>
                       
                       
                    </tr>
    
    
                </table>
                 <div class="button" align="center">
            
           			 
           			 <button type="submit" class="btn btn-bs">수정하기</button>
            
            		 <button class="btn btn-right " type="button" onclick="location.href='${ pageContext.servletContext.contextPath }/board/list'">돌아가기</button>  
                </div>
            </form>
            
        </div>

     </div>
     
     
     
    <script>
      
  
	   /*유효성 검사*/
	
         window.onload = function(){
			 
			 document.querySelector('#form').onsubmit = function(){
				 
				 let title = document.getElementById('title');
	 
				 if(title.value.trim().length < 1 || title.value.trim().length > 24) {
					 alert('제목은 1글자 이상 25자 이내로 적어주세요');
					 title.value='';
					 title.focus();
					 return false;
				 }

				 return true;
			 }
			 
			 
			 $(document).ready(function() {
				    $('#body').on('keyup', function() {
				        $('#test_cnt').html("("+$(this).val().length+" / 500)");
				 
				        if($(this).val().length > 500) {
				            $(this).val($(this).val().substring(0, 500));
				            $('#test_cnt').html("(500 / 500)");
				        }
				    });
				});
	 
		 }
	
 

	
	</script>

	
	
     
     
     
     
</body>
</html>