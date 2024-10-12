<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

Ex12_fmt_now.jsp<br>

<c:set var="now" value="<%= new Date() %>"/> 

now : ${ now } <br>

now2 : <fmt:formatDate value="${ now }" type="both" dateStyle="full" timeStyle="full"/><br>

now3 : <fmt:formatDate value="${ now }" type="both" dateStyle="short" timeStyle="medium"/><br>

now4 : <fmt:formatDate value="${ now }" type="date" dateStyle="short" timeStyle="medium"/><br>

now5 : <fmt:formatDate value="${ now }" type="time" dateStyle="short" timeStyle="short"/><br>

now6 : <fmt:formatDate value="${ now }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/><br>