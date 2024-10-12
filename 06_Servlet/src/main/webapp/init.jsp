<%@ page language="java" contentType="text/html; charset=UTF-8"   
    pageEncoding="UTF-8"%>    
init.jsp <br>
 <!-- HttpServletRequest request = new HttpServletRequest() -->
company1 : <%=request.getParameter("company") %> <br>
company2 : ${param.company} <br>

<%
	int age = 30;
	System.out.println(age);
	//System.out.println(company);
%>
<!-- JSP 내장객체 project당 1개 : application 
ServletContext application = new ServletContext()
-->
company3 : <%= application.getInitParameter("company") %> <br>
singer : <%= application.getInitParameter("singer")%><br>
manager : <%= application.getInitParameter("manager")%> <br>
<!-- ~~ null이다. -->
company4 : ${initParam.company} <br>
singer4 : ${initParam.singer } <br>
manager4 : ${initParam.manager } <br>
<!-- ~~ 공백이다. -->










