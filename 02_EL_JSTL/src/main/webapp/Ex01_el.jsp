<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Ex01_el.jsp<br> -->

<%
	System.out.println("Hello");
	out.print("Hello<br>");
%>

	<script type="text/javascript"> 
		document.write("Hello");
	</script>
	<br>
	
	Hello<br>
	
	<%= "Hello" %><br>
	
	el : ${ "Hello" }<br>
	\${ 3+4 } = ${ 3+4 }<br>
	${ "3" + "4" }<br>
	${ "3 + 4" }<br>
	${ 10 == 20 }<br>  
	${ 10 eq 20 }<br> 
	${ 10 != 20 }<br>  
	${ !(10 ne 20) }<br> 
	${ not(10 ne 20) }<br> 
	
	<!-- 
	el : 자바 코드 안 쓰고 jsp 대신할 수 있음 
	따옴표 구분 안해도 됨
	-->