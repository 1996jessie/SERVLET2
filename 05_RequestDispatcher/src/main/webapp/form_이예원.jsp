<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
form_이예원.jsp<br>
    
<form name="myform" action="requestAttr" method="post"> 
이름: <input type="text" name="name" size="10"> <br>
주소: <input type="text" name="address" size="30"> <br>
좋아하는 동물:
	<input type="checkbox" name="pet"  value="dog">강아지
	<input type="checkbox" name="pet"  value="cat">고양이
	<input type="checkbox" name="pet"  value="rabbit">토끼
<br>
<input type="submit" value="전송">
</form>
<!-- 
requestAttr => myPkg.RequestServlet(bean 속성/각각 속성설정)=>result_이예원.jsp
이름1: param
이름1: 속성
이름1: bean
이름1:
이름1:
이름1:
이름1:
이름1:
 -->
  