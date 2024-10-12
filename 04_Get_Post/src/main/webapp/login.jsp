<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
login.jsp<br>  

<!-- <form action="result.jsp" method="post"> -->
<form action="login.do" method="post">
	아이디 <input type="text" name="id"><br>
	비밀번호 <input type="text" name="passwd"><br>
	<input type="submit" value="로그인">
</form>
<!-- 
login.do => myPkg.LoginServlet
브라우저에 출력
 -->