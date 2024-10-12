<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
list.jsp<br>
	

	<table border="1">
		
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>등록일</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		
		<c:forEach var="member" items="${ lists }">
			<tr>
				<td>${ member.num }</td>
				<td>${ member.id }</td>
				<td>${ member.passwd }</td>
				<td>${ member.name }</td>
				<td>${ member.register }</td>
				<td><a href="delete.do?num=${ member.num }">삭제</a></td>
				<td><a href="updateForm.do?num=${ member.num }">수정</a></td>
			</tr>
		</c:forEach>
		
	</table>

<input type = "button" value = "가입" onClick = "location.href='insertForm.jsp'">

