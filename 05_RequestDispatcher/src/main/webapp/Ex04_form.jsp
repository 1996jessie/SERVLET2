<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
Ex04_form.jsp<br>

<%
	String[] hobby = {"달리기","수영","등산","영화"};
%>
<!-- insert요청 => myPkg.InsertServlet =>Ex04_result.jsp로 이동 -->
<form name="myform" action="insert" method="post">

	아이디 : <input type="text" name="id"><br>
	비밀번호 : <input type="text" name="pw"><br>
	이름 : <input type="text" name="name"><br>
	생년월일 :
		<select name="year">
			<c:forEach var="i" begin="0" end="74"> <!-- i=0~74 -->
				<option value="${2024-i}">${2024-i}</option>
			</c:forEach>
		</select>
		년 
		<select name="month">
			<c:forEach var="m" begin="1" end="12">
				<option value="${m}">${m}
			</c:forEach>
		</select>월 
		<select name="day">
			<c:forEach var="d" begin="1" end="31">
				<option value="${d}">${d}
			</c:forEach>
		</select>일
	<br>
	취미 :
		<c:forEach var="h" items="<%=hobby%>">
			<input type="checkbox" name="hobby" value="${h}">${h}
		</c:forEach>
	<br><br>	
	[ 성적입력 ]<br>
	C언어: <input type="text" name="c" size="10"> 
	JAVA: <input type="text" name="java" size="10"> 
	JSP: <input type="text" name="jsp" size="10">
	<br><br>
	<input type="submit" value="가입하기">
</form>
