<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
deleteForm.jsp<br>

<script type="text/javascript">
	function check(){
		if(delForm.passwd.value == "") {
			alert("비밀번호를 입력하세요.");
			delForm.passwd.focus();
			return false;
		}
	}
</script>
<%@include file = "color.jsp" %>
<link rel="stylesheet" href="style.css" type = "text/css"/>
<style>
	body {
		text-align: center;
	}
	table{
		margin: 5px auto;
	}
	tr{
		text-align: center;
	}
</style>

<c:if test="${ msg != null }">
	<script type="text/javascript">
		alert('${ msg }');
	</script>
</c:if> 

<body bgcolor = "<%= bodyback_c %>">
	<b>글 삭제</b>
	<form name = "delForm" action="delete.bd?num=${ num }&pageNum=${ pageNum }" method = "post">
		<table border = 1 width = "200">
			<tr  bgcolor = "<%= value_c %>">
				<td>비밀번호를 입력해 주세요.</td>
			</tr>
			<tr>
				<td><input type = "password" name = "passwd"></td>
			</tr>
			<tr  bgcolor = "<%= value_c %>">
				<td>
					<input type = "submit" value = "글삭제" onClick = "return check()">
					<input type = "button" value = "글목록" onClick = "location.href = 'select.bd?pageNum=${ pageNum }'">
				</td>
			</tr>
		
		</table>
	
	
	</form>

</body>