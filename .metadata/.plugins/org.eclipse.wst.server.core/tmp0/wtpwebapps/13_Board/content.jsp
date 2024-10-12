<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
content.jsp<br>

<%@include file = "color.jsp" %>

<style>
	body {
		text-align: center;
	}
	table{
		margin: 5px auto;
	}
</style>

<b>글내용 보기</b>

<body bgcolor = "<%= bodyback_c %>">
	<table border = 1 width = "500">
		<tr align = "center">
			<td bgcolor = "<%= value_c %>" width = "125">글번호</td>
			<td width = "125">${ bb.num }</td>
			<td bgcolor = "<%= value_c %>" width = "125">조회수</td>
			<td width = "125">${ bb.readcount }</td>
		</tr>
		<tr align = "center">
			<td bgcolor = "<%= value_c %>">작성자</td>
			<td>${ bb.writer }</td>
			<td bgcolor = "<%= value_c %>">작성일</td>
			<td><fmt:formatDate value="${ bb.reg_date }" pattern = "yyyy-MM-dd HH:mm" /></td>
		</tr>
		<tr align = "center">
			<td bgcolor = "<%= value_c %>">글제목</td>
			<td colspan = "3">${ bb.subject }</td>
		</tr>
		<tr align = "center">
			<td bgcolor = "<%= value_c %>">글내용</td>
			<td colspan = "3">${ bb.content }</td>
		</tr>
		<tr>
			<td colspan = "4"  bgcolor = "<%= value_c %>" align = "right">
				<input type = "button" value = "글수정" onClick = "location.href = 'updateForm.bd?num=${ bb.num }&pageNum=${ pageNum }'">
				<input type = "button" value = "글삭제" onClick = "location.href = 'deleteForm.bd?num=${ bb.num }&pageNum=${ pageNum }'">
				<input type = "button" value = "답글쓰기" onClick = "location.href = 'replyForm.bd?num=${ bb.num }&pageNum=${ pageNum }&ref=${ ref }&re_step=${ re_step }&re_level=${ re_level }'">
				<input type = "button" value = "글목록" onClick = "location.href = 'select.bd?pageNum=${ pageNum }'">
			</td>	
		</tr>
	</table>
</body>