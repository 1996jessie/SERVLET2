<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>    
<%
	String[] company = {"농심", "해태", "오리온", "롯데"};
%>
updateForm.jsp<br>

<form name="myform" action="update.prd" method="get">
<h3>상품 정보 입력</h3>
<input type="hidden" name="id" value="${pb.id}">
상품명 : <input type="text" name="name" value="${pb.name}"> <br>
가격 : <input type="text" name="price" value="${pb.price}"> <br>
제조사 : 
	<select name="company">
		<c:forEach var="company" items="<%=company%>">
			 <option value="${company}"	
			 	<c:if test="${company eq pb.company}">selected</c:if>>${company}</option>
		</c:forEach>
	</select> <br><br>
입고일 : <input type="date" name="regdate" value="${pb.regdate}"><br>
<input type="submit" value="수정">
</form>    


