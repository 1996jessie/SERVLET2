<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
Ex07_choose_result.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
%>
선택한 값 : ${ param.food }<br>

<c:if test="${ param.food eq '피자' }">
	피자<br>
</c:if>
<c:if test="${ param.food eq '떡볶이' }">
	떡볶이<br>
</c:if>
<c:if test="${ param.food eq '짜장면' }">
	짜장면<br>
</c:if>
<c:if test="${ param.food ne '피자' and param.food ne '떡볶이' and param.food ne '짜장면' }">
	그 밖의 음식1<br>
</c:if>
<c:if test="${ !(param.food eq '피자' || param.food eq '떡볶이' || param.food eq '짜장면') }">
	그 밖의 음식2<br>
</c:if>

<c:choose>
	<c:when test="${ param.food eq '피자' }">
		피자<br>
	</c:when>
	<c:when test="${ param.food eq '떡볶이' }">
		떡볶이<br>
	</c:when>
	<c:when test="${ param.food eq '짜장면' }">
		짜장면<br>
	</c:when>
	<c:otherwise>
		그 밖의 음식3<br>
	</c:otherwise>
</c:choose>

<!-- 
if : 한번 조건 만족해도 계속 아래로 내려감
choose : 한번 조건 만족하면 거기서 빠져나감 
-->