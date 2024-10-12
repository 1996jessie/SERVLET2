<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
updateForm.jsp<br>

<%@include file = "color.jsp" %>
<link rel="stylesheet" href="style.css" type = "text/css"/>
<style>
	body {
		text-align: center;
	}
	table{
		margin: 5px auto;
	}
</style>
<c:if test="${ msg != null }">
	<script type="text/javascript">
		alert('${ msg }');
	</script>
</c:if> 
<b>글쓰기</b>

<body bgcolor = "<%= bodyback_c %>">
	<form action="update.bd?num=${ num }&pageNum=${ pageNum }" method="post">
		<table border = 1 width = "500">
			<tr>
				<td colspan = "2"  bgcolor = "<%= value_c %>" align = "right" onClick = "location.href = 'select.bd'">글목록</td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">이름</td>
				<td><input type = "text" name = "writer" maxlength="10" value = "${ bb.writer }"></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">제목</td>
				<td><input type = "text" name = "subject" value = "${ bb.subject }"></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">Email</td>
				<td><input type = "text" name = "email" value = "${ bb.email }"></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">내 용</td>
				<td><textarea name="content" rows="20" cols="50">${ bb.content }</textarea></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">비밀번호</td>
				<td><input type = "password" name = "passwd"></td>
			</tr>
			<tr>
				<td colspan = "2" bgcolor = "<%= value_c %>" width = "150" align = "center">
				<input type = "submit" value = "글수정">
				<input type = "reset" value = "다시작성">
				<input type = "button" value = "목록보기" onClick = "location.href = 'select.bd'">
				</td>			
			</tr>	
		</table>
	</form>
</body>