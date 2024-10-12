<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
Ex11_fmt_number.jsp<br>

<c:set var="price" value="12345"/>
<c:out value= "${ price }"/><br>

<fmt:formatNumber value="${ price }" type="number" var="su1"/>
su1 : ${ su1 }<br>

<fmt:formatNumber value="${ price }" pattern="###,000.00" var="su2"/> <!-- 패턴에 맞게 -->
su2 : ${ su2 }<br>

<fmt:formatNumber value="123.789789" var="su3" maxFractionDigits="1"/> <!-- 반올림 -->
su3 : ${ su3 }<br>

<fmt:parseNumber value="123.789789" var="su4" integerOnly="true"/> <!-- 정수형태 -->
su4 : ${ su4 }<br>