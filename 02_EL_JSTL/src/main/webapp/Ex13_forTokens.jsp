<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
Ex13_forTokens.jsp<br>

<c:set var="s" value="가나/다라*마바/사/아"/>
s : ${ s } <br>

<c:forTokens var="one" items="${ s }" delims="/*" varStatus="status">
	<c:out value="${ status.index }"/> : 
	<c:out value="${ one }"/><br>
</c:forTokens>