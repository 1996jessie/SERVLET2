<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" href="style.css" type = "text/css"/>
<style>
	body {
		text-align: center;
	}
	table{
		margin: 5px auto;
	}
</style>
list.jsp<br>
<%@ include file="color.jsp" %>
<c:if test="${ msg != null }">
	<script type="text/javascript">
		alert('${ msg }');
	</script>
</c:if> 
<body bgcolor = "<%= bodyback_c %>">
<b>글목록(전체 글 : ${ count })</b>
<table border = 1 width = 800px>
	<tr>
		<td align = "right" bgcolor = "<%=value_c%>">
			<a href = "writeForm.jsp">글쓰기</a>
		</td>
	</tr>
</table>
<c:if test = "${ count eq 0 }">
		<table border = 1 width = 800px>
		<tr>
			<td align = "center">
				게시판에 저장된 글이 없습니다.
			</td>
		</tr>
	</table>
</c:if>
<c:if test = "${ count ne 0 }">
	<table border = 1 width = 800px>
		<tr bgcolor = "<%=value_c%>" align = "center">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회</td>
			<td>IP</td>
		</tr>
		<c:forEach var="b" items="${ lists }" varStatus="i">
            <tr>
                <td>
                ${ number - i.index }</td>
                <td>
                    <c:set var="wid" value="0"/>
                    <c:if test="${ b.re_level > 0 }">
                        <c:set var="wid" value="${ b.re_level * 20 }"/>
                        <img src="images/level.gif" width="${ wid }" height="15">
                        <img src="images/re.gif">
                    </c:if>
                    <a href="content.bd?num=${ b.num }&pageNum=${ pageNum }">${ b.subject }</a>
                    <c:if test="${ b.readcount > 3 }">
                        <img src="images/hot.gif" height="15">
                    </c:if>
                </td>
                <td>${ b.writer }</td>
                <td>
                	<fmt:formatDate value="${ b.reg_date }" pattern = "yyyy-MM-dd HH:mm" />
                </td>
                <td>${ b.readcount }</td>
                <td>${ b.ip }</td>
            </tr>
        </c:forEach>
	</table>
</c:if> 

<c:if test="${ startPage > 10 }">
	<a href="select.bd?pageNum=${ startPage - 10 }">[이전]</a>    
</c:if>
<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
	<a href="select.bd?pageNum=${ i }">[${ i }]</a>
</c:forEach>
<c:if test="${ endPage < pageCount }">
	<a href="select.bd?pageNum=${ startPage + 10 }">[다음]</a>    
</c:if>


</body>


