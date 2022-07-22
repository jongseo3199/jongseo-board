<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	

		
		
	
</script>

<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board-regist.css" rel="stylesheet" type="text/css">
<script src="${ pageContext.servletContext.contextPath }/resources/js/event.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
    <div class="main">
        <h2 align="center">게시글 등록</h2>

        <div class="board">

            <form action="/board/regist" name="form" id="form" method="post">
                <table align="center" id="listArea">

                    <tr>
                        <th width="270px" height="50px" >제목</th>
                        <td><input type="text" align="center" size="50" id="title" name="title"></td>
                    </tr>
                    <tr>
                        <th width="270px" height="50px">작성자</th>
                        <td><input type="text" size="100" name="writer" id="writer"></td>
                    </tr>
                    
                    <tr>
                        <th width="200px" height="545px">내용</th>
                        <td><textarea name="body" id="body" cols="20" rows="10"  style="resize:none;" required></textarea>
                             <div id="test_cnt">(0 / 500)</div>
                        </td>
                       
                    </tr>
    
                </table>
                   <div class="button" align="center">
                      <button type="submit" class="btn btn-bs" id="regist">등록하기</button>
		            <!--  <button class="btn btn-left" type="button" onclick="aa();">등록하기</button> -->
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
				 let writer = document.getElementById('writer');
				 
				 
				 if(title.value.trim().length < 1 || title.value.trim().length > 24) {
					 alert('제목은 1글자 이상 25자 이내로 적어주세요');
					 title.value='';
					 title.focus();
					 return false;
				 }
				 
				 if(writer.value.trim().length < 1 || writer.value.trim().length > 5 ) {
					 alert('작성자는 1글자 이상 5자 이내로 적어주세요');
					 writer.value='';
					 writer.focus();
					 return false;
				 }
				 
				 else{
					 alert("글이 등록 되었습니다. 처음으로 돌아갑니다.")
					 return true;
				 }
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
	
		 
		
		 
	
            
		 /* 텍스트 area 글자 제한 쿼리*/
		 
		 /* $(document).ready(function() {
			    $('#body').on('keyup', function() {
			        $('#test_cnt').html("("+$(this).val().length+" / 500)");
			 
			        if($(this).val().length > 500) {
			            $(this).val($(this).val().substring(0, 500));
			            $('#test_cnt').html("(500 / 500)");
			        }
			    });
			});
		 
	 }; */

    

	
	</script>
    
</body>
</html>