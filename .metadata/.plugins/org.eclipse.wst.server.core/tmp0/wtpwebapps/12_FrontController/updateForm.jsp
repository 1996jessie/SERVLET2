<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
updateForm.jsp<br>
<h2>영화 선호도 조사</h2>

<%
	String[] genre = {"공포","다큐","액션","애니메이션"};
	String[] time = {"8-10","10-12","12-14","14-16","16-18","18-20","20-22","22-24"};
	Integer[] partner = {1,2,3,4,5};
	application.setAttribute("flag", false);
%>

<style type="text/css">
	table {
		width: 700px;
	}
	tr:last-child{
		text-align : center;
	}
</style>

<form action = "update.mv" method = "post">
	<table border = 1>
	<tr>
		<th>아이디</th>
		<td>
			<input type = "hidden" name = "num" value = "${ mb.num }">
			<input type = "hidden" name = "id" value = "${ mb.id }">
			${ mb.id }
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type = "text" name = "name" value = "${ mb.name }"></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type = "text" name = "age" value = "${ mb.age }"></td>
	</tr>	
	<tr>
		<th>좋아하는 장르</th>
		<td>
			<c:forEach var="g" items="<%= genre %>">
				<input type="checkbox" name="genre" value="${ g }" <c:if test="${ mb.genre.contains(g) }"> checked </c:if>>${ g }
			</c:forEach>	
		</td>
	</tr>
	<tr>
		<th>좋아하는 시간대</th>
		<td>
	         <select name="time">
				<c:set var="time" value="<%= time %>" />
				<c:forEach var="t" begin="0" end="${ fn:length(time)-1 }">
					<option value="${ time[t] }" <c:if test = "${ mb.time eq time[t] }"> selected </c:if>>${ time[t] }
				</c:forEach>
	         </select>
		</td>
	</tr>
	<tr>
		<th>동반 관객수</th>
		<td>
	         <c:forEach var="p" begin="1" end="5">
				<input type="radio" name="partner" value="${ p }" <c:if test = "${ mb.partner eq p }"> checked </c:if>>${ p }
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th>영화관 개선사항</th>
		<td><textarea name = "memo" rows = "3" cols = "30" placeholder = "value는 여기에 넣기">${ mb.memo }</textarea></td>
	</tr>	
	<tr>
		<td colspan = "2"><input type="submit" id = "sub" value = "수정하기"> </td>
	</tr>
	</table>
</form>