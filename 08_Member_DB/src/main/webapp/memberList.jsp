<%@page import="myPkg.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
memberList.jsp<br>
 
<table border="1" align="center">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>비밀번호</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	<c:forEach var = "mem" items = "${ memlists }">  
		<tr>
			<td>${mem.id }</td>
			<td>${mem.name }</td>
			<td>${mem.password }</td>
			<td><a href = "delete.mem?id=${ mem.id }">삭제</a></td>
			<td><a href = "updateForm.mem?id=${ mem.id }">수정</a></td>
		</tr>		
	</c:forEach>

</table>
 
<br>

<table border="1" align="center">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>비밀번호</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	<%-- <c:set var="list" value="${memlists}"/> --%>
  	<c:forEach var="i" begin="0" end="${fn:length(memlists)-1}" step="1">
  		<tr align="center">
  			<td>${memlists.get(i).getId()}</td>
  			<td>${memlists.get(i).name}</td>
  			<td>${memlists.get(i).password}</td>
  			<td><a href="delete.mem?id=${memlists.get(i).getId()}">삭제</a></td>
  			<td><a href="updateForm.mem?id=${memlists.get(i).getId()}">수정</a></td>
  		</tr>
  	</c:forEach>

</table> 

<br>

<table border="1" align="center">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>비밀번호</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	
	<%
	    ArrayList<MemberBean> mlist = (ArrayList<MemberBean>)request.getAttribute("memlists");
	    for (MemberBean member : mlist) {
	%>
	    <tr>
	        <td><%= member.getId() %></td>
	        <td><%= member.getName() %></td>
	        <td><%= member.getPassword() %></td>
	        <td><a href="delete.mem?id=<%= member.getId() %>">삭제</a></td>
	        <td><a href="updateForm.mem?id=<%= member.getId() %>">수정</a></td>
	    </tr>
	<%
	    }
	%>
</table>

<br>

<a href = "memberForm.jsp">삽입</a>
	