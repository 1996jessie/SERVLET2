<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex04_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	int weight = Integer.parseInt(request.getParameter("weight"));
	int height = Integer.parseInt(request.getParameter("height"));
	String gender = request.getParameter("gender");

%>

<jsp:useBean id="mb" class="myPkg.MemberBean">
	<jsp:setProperty name="mb" property="*"/>
</jsp:useBean>

jsp 방식<br>

<table border = 1>
	<tr>
		<td>이름</td>
		<td><%= name %></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%= age %></td>
	</tr>
	<tr>
		<td>몸무게</td>
		<td><%= mb.getWeight() %></td>
	</tr>
	<tr>
		<td>키</td>
		<td><%= mb.getHeight() %></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><jsp:getProperty name="mb" property="gender"/></td>
	</tr>
</table>

<hr>

El 방식<br>

<table border = 1>
	<tr>
		<td>이름</td>
		<td>${ param.name }</td>  
	</tr>
	<tr>
		<td>나이</td>
		<td>${ param['age'] }</td>
	</tr>
	<tr>
		<td>몸무게</td>
		<td>${ mb.getWeight() }</td>
	</tr>
	<tr>
		<td>키</td>
		<td>${ mb['height'] }</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>${ mb.gender }</td>
	</tr>
</table>