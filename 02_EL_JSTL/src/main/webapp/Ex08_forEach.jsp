<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
Ex08_forEach.jsp<br>

<%
	String[] movieList = {"혹성탈출", "범죄도시", "쿵푸팬더", "파묘"};
	pageContext.setAttribute("mList", movieList); //현재 페이지
	/* PageContext pageContext = new PageContext(); */
	/* request.setAttribute("mList", movieList); //다음 요청까지 */
	/* session.setAttribute("mList", movieList); //현재 브라우저 */
	/* application.setAttribute("mList", movieList); //현재 프로젝트 */
%>
<%-- <c:set var = "mList" value = "<%= movieList %>"/> --%>

<style>
    tr, td {
        text-align: center; /* 셀 내용 가운데 정렬 */
    }
</style>

<table border = 1 width = 50%>
	<tr>
		<th>title</th>
	</tr>
	<%
		for(int i=0;i<movieList.length;i++) {
	%>
		<tr>
			<td><%= movieList[i] %></td>
		</tr>
	<% 				
		}
	%>
</table>

<hr>

<table border = 1 width = 50%>
	<tr>
		<th>title</th>
	</tr>
	<%
		for(String movie : movieList) {
	%>
		<tr>
			<td><%= movie %></td>
		</tr>
	<% 				
		}
	%>
</table>

<hr>

<table border = 1 width = 50%>
	<tr>
		<th>index</th>
		<th>count</th>
		<th>title</th>
	</tr>
	<%-- <c:forEach var="movie" items="<%= movieList %>" varStatus="status"> --%>
	
	<c:forEach var="movie" items="${ mList }" varStatus="status">
		<tr>
			<td>${ status.index }</td>
			<td>${ status.count }</td>
			<td>${ movie }</td>
		</tr>	
	</c:forEach>
</table>

<hr>

<c:forEach var="cnt" begin="1" end="10" varStatus="a" step="2">
	${ a.first } / ${ a.begin } / ${ a.last } / ${ a.end } / ${ a.index } / ${ a.count } / ${ cnt } 
	<c:if test="${ !a.last }">,</c:if>
	<br>
</c:forEach>

<hr>

length(mList) : ${ fn:length(mList) } <br>
<c:forEach var="i" begin="0" end="${ fn:length(mList) - 1}">
	${ i } : ${ mList[i] }<br>
</c:forEach>
