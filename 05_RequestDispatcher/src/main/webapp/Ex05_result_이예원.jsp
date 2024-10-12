<%@page import="myPkg.ResultBean"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>Ex05_result_이예원.jsp</title>

<h4>(1)</h4>
이름 : <%=request.getParameter("name")%><br>
나이 : <%=request.getParameter("age")%><br>
성별 : <%=request.getParameter("gender")%><br>
좋아하는커피 :
	<%
	String[] carr = request.getParameterValues("coffee");
	for(String c: carr){
		out.print(c+" ");
	}
	%><br>
직업 : <%=request.getParameter("job")%><br>
여행하고싶은나라 :
	<%
	String[] tarr = request.getParameterValues("travel");
	for(String t: tarr){
		out.print(t+" ");
	}
	%>
<hr width="300" color="gray" align="left">


<h4>(2)</h4>
이름 : <%=request.getAttribute("name")%><br>
나이 : <%=request.getAttribute("age")%><br>
성별 : <%=request.getAttribute("gender")%><br>
좋아하는커피 :
	<%
	String[] coffee = (String[])request.getAttribute("coffee");
	for(String c2: coffee){
		out.print(c2+" ");
	}
	%><br>
직업 : <%=request.getAttribute("job")%><br>
여행하고싶은나라 :
	<%
	String[] travel = (String[])request.getAttribute("travel");
	for(String t2: travel){
		out.print(t2+" ");
	}
	%>
<hr width="300" color="gray" align="left">


<h4>(3)</h4>
이름 : ${param.name}<br>
나이 : ${param.age}<br>
성별 : ${param.gender}<br>
좋아하는커피 :
	<c:forEach var="c" items="${paramValues.coffee}" varStatus="status">
		${c}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
	<br>
직업 : ${param.job}<br>
여행하고싶은나라 :
	<c:forEach var="t" items="${paramValues.travel}" varStatus="status">
		${t}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
<hr width="300" color="gray" align="left">


<h4>(4)</h4>
이름 : ${name}<br>
나이 : ${age}<br>
성별 : ${gender}<br>
좋아하는커피 :
	<c:forEach var="c" items="${coffee}" varStatus="status">
		${c}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
	<br>
직업 : ${job}<br>
여행하고싶은나라 :
	<c:forEach var="t" items="${travel}" varStatus="status">
		${t}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
<hr width="300" color="gray" align="left">


<h4>(5)</h4>
이름 : ${requestScope.name}<br>
나이 : ${requestScope.age}<br>
성별 : ${requestScope.gender}<br>
좋아하는커피 :
	<c:forEach var="c" items="${requestScope.coffee}" varStatus="status">
		${c}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
	<br>
직업 : ${requestScope.job}<br>
여행하고싶은나라 :
	<c:forEach var="t" items="${requestScope.travel}" varStatus="status">
		${t}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
<hr width="300" color="gray" align="left">


<%
	ResultBean rb = (ResultBean)request.getAttribute("rb");
	pageContext.setAttribute("RB", rb);
%>
<h4>(6)</h4>
이름 : <%=rb.getName()%><br>
나이 : <%=rb.getAge()%><br>
성별 : <%=rb.getGender()%><br>
좋아하는커피 :
	<%
	for(String c3: rb.getCoffee()){
		out.print(c3+" ");
	}
	%>
	<br>
직업 : <%=rb.getJob()%><br>
여행하고싶은나라 :
	<%
	for(String t3: rb.getTravel()){
		out.print(t3+" ");
	}
	%>
<hr width="300" color="gray" align="left">


<h4>(7)</h4>
이름 : ${RB.name}<br>
나이 : ${RB.age}<br>
성별 : ${RB.gender}<br>
좋아하는커피 :
	<c:forEach var="c" items="${RB.coffee}" varStatus="status">
		${c}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
	<br>
직업 : ${RB.job}<br>
여행하고싶은나라 :
	<c:forEach var="t" items="${RB.travel}" varStatus="status">
		${t}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
<hr width="300" color="gray" align="left">


<h4>(8)</h4>
이름 : ${rb.name}<br>
나이 : ${rb.age}<br>
성별 : ${rb.gender}<br>
좋아하는커피 :
	<c:forEach var="c" items="${rb.coffee}" varStatus="status">
		${c}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
	<br>
직업 : ${rb.job}<br>
여행하고싶은나라 :
	<c:forEach var="t" items="${rb.travel}" varStatus="status">
		${t}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
<hr width="300" color="gray" align="left">


<h4>(9)</h4>
이름 : ${requestScope.rb.name}<br>
나이 : ${requestScope.rb.age}<br>
성별 : ${requestScope.rb.gender}<br>
좋아하는커피 :
	<c:forEach var="c" items="${requestScope.rb.coffee}" varStatus="status">
		${c}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
	<br>
직업 : ${requestScope.rb.job}<br>
여행하고싶은나라 :
	<c:forEach var="t" items="${requestScope.rb.travel}" varStatus="status">
		${t}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
<hr width="300" color="gray" align="left">