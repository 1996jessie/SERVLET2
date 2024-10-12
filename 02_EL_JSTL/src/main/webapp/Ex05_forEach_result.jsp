<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!-- 주소 있는 공간의 이름을 c라고 설정 -->
Ex05_forEach_result.jsp<br>

<%
	int dan = Integer.parseInt(request.getParameter("dan"));
	
	for(int i=1;i<=9;i++) {
		out.print(dan + " * " + i + " = " + dan * i + "<br>");
		//JspWriter out = new JspWriter();
	}
%>

Hello <br>
<c:out value="Hello"></c:out> <br>

<%
	String s1 = "Hello"; // 자바코드로 s1변수 생성

%>
s1 : <%= s1 %> <br>

<c:set var="s2" value="Hello"></c:set>  <!-- jstl로 s2변수 생성 -->
<%-- s2 : <%= s2 %> <br>  --%>
s2 : ${ s2 } <br> <!-- jstl로 만든 변수는 el로 출력해야 함(언어가 다름) -->

단1 : <c:out value="${ param.dan }"></c:out><br>
<!-- 언어가 다르기 때문에 같은 이름으로 변수 만들어도 됨 -->
<c:set var="dan2" value="${ param.dan }"></c:set>
단2 : <c:out value="${ dan2 }"></c:out> <br>

<c:forEach var="i" begin="1" end="9" step="1">
	${ dan2 } * ${ i } = ${ dan2 * i } <br>
	${ param.dan } * ${ i } = ${ param.dan * i } <br>
</c:forEach>
<!-- 
1. jar 파일 갖다두기
2. taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 포함시키기
3. <c:out value="Hello"></c:out>
 -->
