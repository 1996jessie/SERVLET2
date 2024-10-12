<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex04_form.jsp<br>

<form action="Ex04_result.jsp" method="post">
<table border="1">
	<tr>
		<td>이름</td>	
		<td><input type="text" name="name" value="아이유"></td>
	</tr>
	<tr>
		<td>나이</td>	
		<td><input type="text" name="age" value="20"></td>
	</tr>	
	<tr>
		<td>몸무게</td>	
		<td><input type="text" name="weight" value="70"></td>
	</tr>
	<tr>
		<td>키</td>	
		<td><input type="text" name="height" value="175"></td>
	</tr>
	<tr>
		<td>성별</td>	
		<td>
			<input type="radio" name="gender" value="남">남
			<input type="radio" name="gender" value="여">여
		</td>
	</tr>	
	
	<tr>
		<td colspan="2">
			<input type="submit" value="전송하기">
		</td>
	</tr>	
</table>
</form>