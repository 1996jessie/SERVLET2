<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
result.jsp<br>  
<%
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
%>

아이디: <%=id %><br>
비밀번호: <%=passwd %><br>

아이디 : ${param.id}<br>
비밀번호 : ${param.passwd}<br>
