<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
Ex06_if_result.jsp<br>

국어 : ${ param.kor } <br>
영어 : ${ param.eng } <br>
수학 : ${ param.math } <br>


<c:set var = "kor" value = "${ param.kor }"></c:set>
합계1 : ${ kor + param.eng + param.math }<br>
평균1 : ${ (kor + param.eng + param.math) / 3 }<br>

<c:set var = "sum" value = "${ param.kor + param.eng + param.math  }"></c:set>
<c:set var = "avg" value = "${ (sum) / 3 }"></c:set>
합계2 : ${ sum }<br>
평균2 : ${ avg }<br>

<c:if test="${ avg >= 90 }">
	A학점
</c:if>
<c:if test="${ avg >= 80  and avg < 90 }">
	B학점
</c:if>
<c:if test="${ avg >= 70  and avg < 80 }">
	C학점
</c:if>
<c:if test="${ avg >= 60  and avg < 70 }">
	D학점
</c:if>
<c:if test="${ avg < 60 }">
	F학점
</c:if>

<hr>

<c:choose>
	<c:when test="${ avg >= 90 }">
		A학점
	</c:when>
	<c:when test="${ avg >= 80 }">
		B학점
	</c:when>
	<c:when test="${ avg >= 70 }">
		C학점
	</c:when>
	<c:when test="${ avg >= 60 }">
		D학점
	</c:when>
	<c:otherwise>
		F학점
	</c:otherwise>
</c:choose>

<hr>

<c:set var="avg2" value="${ avg / 10 }"/>
avg2 : <c:out value="${ avg2 }"/><br>
<fmt:parseNumber var="avg3" value="${ avg / 10 }" integerOnly="true"/>
avg3 : <c:out value="${ avg3 }"/><br>

<c:choose>
	<c:when test="${ avg3 == 10 }">
		A학점
	</c:when>
	<c:when test="${ avg3 == 9 }">
		A학점
	</c:when>
	<c:when test="${ avg3 == 8 }">
		B학점
	</c:when>
	<c:when test="${ avg3 == 7 }">
		C학점
	</c:when>
	<c:when test="${ avg3 == 6 }">
		D학점
	</c:when>
	<c:otherwise>
		F학점
	</c:otherwise>
</c:choose>