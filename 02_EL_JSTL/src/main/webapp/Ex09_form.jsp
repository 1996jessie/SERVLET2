<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex09_form.jsp<br>

<form action = "Ex09_result.jsp">
	이름 <input type = "text" name = "name"><br>
	
	과일
	<input type = "checkbox" name = "fruit" value = "포도">포도
	<input type = "checkbox" name = "fruit" value = "사과">사과
	<input type = "checkbox" name = "fruit" value = "수박">수박
	<input type = "checkbox" name = "fruit" value = "복숭아">복숭아
	
	<br>

	<input type = "submit" value = "전송">
</form>