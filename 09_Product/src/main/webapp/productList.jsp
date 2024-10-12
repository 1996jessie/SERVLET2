<%@page import="prd.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   

productList.jsp<br>

<table align="center" border=1 width="650">
	<tr bgcolor="#fffacd">
		<th>아이디</th>
		<th>이름</th>
		<th>제조사</th>
		<th>단가</th>
		<th>입고일자</th>
		<th>삭제</th>
		<th>수정</th>
	</tr>
	
	<tr>
		<c:forEach var="prd" items="${list}">
			<tr align="center">
				<td>${prd.id}</td>
				<td>${prd['name']}</td>
				<td>${prd["price"]}</td>
				<td>${prd.company}</td>
				<td>${prd.regdate}</td>
				<td><a href="delete.prd?id=${prd.id }">삭제</a></td>
				<td><a href="updateForm.prd?id=${prd.id }">수정</a></td>
			</tr>
		</c:forEach>
	</tr>
</table>

<br><br><br><br>

<table border="1" align="center" width="60%">
	<tr style="background-color: yellow;">
		<td>아이디</td>
		<td>이름</td>
		<td>제조사</td>
		<td>단가</td>
		<td>입고일자</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	<c:forEach var="i" begin="0" end="${fn:length(list)-1 }" step="1">
		<tr>
			<td>${list.get(i).getId() }</td>
			<td>${list.get(i).name }</td>
			<td>${list.get(i).getCompany() }</td>
			<td>${list.get(i).getPrice() }</td>
			<td>${list.get(i).getRegdate() }</td>
			<td><a href="delete.prd?id=${list.get(i).getId() }">삭제</a></td>
			<td><a href="updateForm.prd?id=${list.get(i).getId()}">수정</a></td>
		</tr>
	</c:forEach>
</table>

<br><br><br><br>

<table border="1" align="center" width="60%">
	<tr style="background-color: yellow;">
		<td>아이디</td>
		<td>이름</td>
		<td>제조사</td>
		<td>단가</td>
		<td>입고일자</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	
	<%
		ArrayList<ProductBean> plist = (ArrayList<ProductBean>)request.getAttribute("list");
		for(ProductBean prod : plist){
	%>
		<tr>
			<td><%=prod.getId() %></td>
			<td><%=prod.getName() %></td>
			<td><%=prod.getCompany() %></td>
			<td><%=prod.getPrice() %></td>
			<td><%=prod.getRegdate() %></td>
			<td><a href="delete.prd?id=<%=prod.getId()%>">삭제</a></td>
			<td><a href="updateForm.prd?id=<%=prod.getId()%>">수정</a></td>
		</tr>
	<% }%>
</table>

<br>

<a href="insertForm.jsp" >삽입</a>





