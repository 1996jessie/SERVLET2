<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
register.jsp <br>  
 
<form action="memReg" method="post">
	회원명 <input type="text" name="name"><br>
	주소 <input type="text" name="addr"><br>
	전화번호 <input type="text" name="tel"><br>
	취미 
	<input type="checkbox" name="hobby" value="영화보기">영화보기
	<input type="checkbox" name="hobby" value="등산">등산
	<input type="checkbox" name="hobby" value="게임">게임
	<br>
	<input type="submit" value="회원가입">
</form>
<!-- 
memReg 요청 => myPkg.MemberSevlet이 처리
입력한 항목을 브라우저에서 출력

 -->







