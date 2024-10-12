<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
input.jsp<br> 

<form action="sub" method="post">

	이름 : <input type="text" name="name">
	<input type="submit" value="전송">
</form>

<!-- 
input.jsp 전송 클릭 => 
sub요청 =>
myPkg.InputServ 로 이동 => 
forward(result.jsp) 전진 
-->

  