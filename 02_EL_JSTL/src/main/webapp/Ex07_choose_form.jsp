<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex07_choose_form.jsp<br>
<form action = "Ex07_choose_result.jsp" method = "post">
	좋아하는 음식 선택 <br>
	<select name = "food">
		<option value = "피자">피자</option>	
		<option value = "떡볶이">떡볶이</option>	
		<option value = "짜장면">짜장면</option>	
		<option value = "치킨">치킨</option>	
	</select><br><br>
	<input type = "submit" value = "전송">

</form>