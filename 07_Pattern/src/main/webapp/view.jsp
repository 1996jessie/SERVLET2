<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
view.jsp<br>   
<!-- 
서블릿 요청
get : a태그, form의 method=get, location 
post : form의 method=post
 -->

<a href="insert.mb">insert</a>
<!-- /insert.do => http://localhost:8080/insert.do -->

<hr>

<a href="http://localhost:8080/07_URL_Pattern/update.mb">update</a>
<hr>

<a href="http://localhost:8080<%=request.getContextPath()%>/select.mb">select</a>
<hr>

<a href="<%=request.getContextPath()%>/delete.mb">delete</a>
<hr>
