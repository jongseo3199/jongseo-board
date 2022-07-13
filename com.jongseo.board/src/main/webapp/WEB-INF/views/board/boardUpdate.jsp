<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board-update.css" rel="stylesheet" type="text/css">
<body>
    <div class="main">
        <h2 align="center">�Խñ� ����</h2>

        <div class="board">

            <form action="${ pageContext.servletContext.contextPath }/board/update" method="post">
                <table align="center" id="listArea">

                    <tr>
                        <th width="200px" height="50px">����</th>
                        <td><input type="text" align="center" size="100" name="title" value="${ requestScope.board.title }"></td>
                    </tr>
                    <tr>
                        <th width="200px" height="50px">�ۼ���</th>
                        <td><p><c:out value="${ requestScope.board.writer }"/></p></td>
                    </tr>
                    <tr>
                        <th width="200px" height="50px">�ۼ���</th>
                        <td><input type="text" size="100" name="date" value="${ requestScope.board.regist }"/></td>
                    </tr>
                    <tr>
                        <th width="200px" height="545px">����</th>
                        <td><textarea name="body" cols="60" rows="15"  style="resize:none;" required><c:out value="${ requestScope.board.body }"/></textarea></td>
                        
                    </tr>
    
                </table>
            </form>
            
        </div>
        <div class="button" align="center">
            
            <button class="btn btn-left" type="submit">����</button> 
            
            <button class="btn btn-right " type="button">����</button>  
        </div>
 

</body>
</html>