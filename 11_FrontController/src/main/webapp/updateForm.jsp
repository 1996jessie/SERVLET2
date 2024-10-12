<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
updateForm.jsp<br>

<h2>회원수정</h2>
<form action = "update.do" method = "post">
	<input type = "hidden" name = "num" value = "${ mb.num }">
	아이디 : <input type = "text" name = "id" value = "${ mb.id }"><br><br>
	비번 : <input type = "password" name = "passwd" value = "${ mb.passwd }"><br><br>
	이름 : <input type = "text" name = "name" value = "${ mb.name }"><br><br>
	
	<input type = "submit" value = "수정하기">
</form>