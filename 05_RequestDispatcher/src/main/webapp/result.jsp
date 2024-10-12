<%@page import="myPkg.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
result.jsp<br>

<%
	String name = request.getParameter("name");
	String name2 = (String)request.getAttribute("name");
	String age = request.getParameter("age");
	Integer age2 = (Integer)request.getAttribute("age"); // 20
	String addr = (String)request.getAttribute("addr");  
	Person p = (Person)request.getAttribute("per");
%>

이름 : <%=name%> <br>
이름2 : <%=name2%> <br>
나이 : <%=age%><br>
나이2 : <%=age2%><br>
주소 : <%=addr%><br>
<hr>
p : <%=p %><br>
p : <%=p.toString() %><br>
person name : <%= p.getName()%> <br>
person age : <%=p.getAge() %> <br>
person weight : <%=p.getWeight() %> <br>





 
<!-- 공유한다. -->
