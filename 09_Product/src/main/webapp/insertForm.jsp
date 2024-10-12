<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
	/* ServletContext application = new ServletContext() */
	application.setAttribute("flag", false); // flag = false
%>    
insertForm.jsp<br>
 <form name="myform" action="insert.prd" method="get">
	<h3>상품 정보 입력</h3>
	상품명 : <input type="text" name="name"><br>
	가격 : <input type="text" name="price"><br>
	제조사 : 
		<select name="company">
			<option value="농심">농심</option>
			<option value="해태">해태</option>
			<option value="오리온">오리온</option>
			<option value="롯데">롯데</option>
		</select><br>
	<input type="submit" value="전송">
</form>