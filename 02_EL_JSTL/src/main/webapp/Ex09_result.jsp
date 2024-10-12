<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
Ex09_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String[] fruits = request.getParameterValues("fruit");
%>

이름 : <%= name %> <br>
과일 : <%
		if(fruits == null) {
			out.print("선택한 과일이 없습니다.");
		} else {
			for(int i=0;i<fruits.length;i++) {
				out.print(fruits[i] + " ");
			} 
		}
	%>

<hr>

이름2 : ${ param.name }<br>
과일2 : ${ param.fruit } <br> <!-- 제일 첫번째 값만 출력됨 -->
과일3 : ${ paramValues.fruit } <br> <!-- 0번방의 주소 출력됨 -->

<c:set var="len" value = "${ fn:length(paramValues.fruit) }"/>
<c:set var="farr" value = "${ paramValues.fruit }"/>
len : ${ len } <br>

<c:if test="${ len == 0 }">
    선택한 과일이 없습니다.
</c:if>

<c:if test = "${ len > 0 }">
	<c:forEach var="i" begin="0" end="${ len - 1 }" varStatus="a">
		<%-- ${ paramValues.fruit[i] } --%>
		${ farr[i] }
		<c:if test="${ !a.last }">,</c:if>
	</c:forEach>
	<br>
	<c:forEach var="fruit" items="${ farr }" varStatus="a">
	    ${fruit}
	    <c:if test="${ !a.last }">,</c:if>
	</c:forEach>
</c:if>