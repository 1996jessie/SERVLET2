<%@page import="myPkg.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
Ex00_result_이예원.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>

param 사용
<table border=1>
	<tr>
		<td>제목</td>
		<td>${ param.title }</td>
	</tr>
	<tr>
		<td>저자</td>
		<td>${ param.author }</td>
	</tr>
	<tr>
		<td>출판사</td>
		<td>${ param.publisher }</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${ param.price }</td>
	</tr>
	<tr>
		<td>입고일</td>
		<td>
			<c:if test="${ empty param.buy }">
				입고일 체크 누락
			</c:if> 
			<c:if test="${ !empty param.buy }">
				${ param.buy }
			</c:if>		
		</td>
	</tr>
	<tr>
		<td>배송비</td>
		<td>
			<c:if test="${ empty param.kind }">
				배송비 체크 누락
			</c:if> 
			<c:if test="${ !empty param.kind }">
				${ param.kind }
			</c:if>
		</td>
	</tr>
	<tr>
		<td>구입가능서점</td>
		<td>

			<c:set var="len" value = "${ fn:length(paramValues.bookstore) }"/>
			<c:set var="barr" value = "${ paramValues.bookstore }"/>
			
			<c:if test="${ len == 0 }">
			    선택한 구입가능서점이 없습니다.
			</c:if>
			
			<c:if test = "${ len > 0 }">
				<c:forEach var="i" begin="0" end="${ len - 1 }" varStatus="a">
					${ barr[i] }
					<c:if test="${ !a.last }">,</c:if>
				</c:forEach>
				<br>
				<c:forEach var="bookstore" items="${ barr }" varStatus="a">
				    ${bookstore}
				    <c:if test="${ !a.last }">,</c:if>
				</c:forEach>
			</c:if>




		</td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td>
			<c:if test="${ param.count eq '선택' }">
				보유수량 체크 누락
			</c:if> 
			<c:if test="${ param.count ne '선택' }">
				${ param.count }
			</c:if>
		</td>
	</tr>

</table>

<hr>

<jsp:useBean id="bb" class="myPkg.BookBean">
	<jsp:setProperty name="bb" property="*" />
</jsp:useBean>

bean 사용
<table border=1>
	<tr>
		<td>제목</td>
		<td>
		${ bb.title }
		<%-- <c:out value="${ bb.title }"/> --%>
		</td>
	</tr>
	<tr>
		<td>저자</td>
		<td>${ bb['author'] }</td>
	</tr>
	<tr>
		<td>출판사</td>
		<td>${ bb['publisher'] }</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${ bb['price'] }</td>
	</tr>
	<tr>
		<td>입고일</td>
		<td>
			<c:if test="${ empty bb['buy'] }">
				입고일 체크 누락
			</c:if> 
			<c:if test="${ !empty bb['buy'] }">
				${ bb['buy'] }
			</c:if>
		</td>
	</tr>
	<tr>
		<td>배송비</td>
		<td>
			<c:if test="${ empty bb['kind'] }">
				배송비 체크 누락
			</c:if> 
			<c:if test="${ !empty bb['kind'] }">
				${ bb['kind'] }
			</c:if>
		</td>
	</tr>
	<tr>
		<td>구입가능서점</td>
		<td>
			<c:if test="${ len == 0 }">
			    선택한 구입가능서점이 없습니다.
			</c:if>
			
			<c:if test = "${ len > 0 }">
				<c:forEach var="i" begin="0" end="${ len - 1 }" varStatus="a">
					${ bb.bookstore[i] }
					<c:if test="${ !a.last }">,</c:if>
				</c:forEach>
				<br>
				<c:forEach var="bookstore" items="${ barr }" varStatus="a">
				    ${bookstore}
				    <c:if test="${ !a.last }">,</c:if>
				</c:forEach>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td>
			<c:if test="${ bb['count'] eq '선택' }">
				보유수량 체크 누락
			</c:if> 
			<c:if test="${ bb['count'] ne '선택' }">
				${ bb['count'] }
			</c:if>
		</td>
	</tr>

</table>

<hr>

<c:set var="bb2" value="<%= new BookBean() %>"/>
<c:set target="${ bb2 }" property="title" value="${ param.title }"/>
<c:set target="${ bb2 }" property="author" value="${ param.author }"/>
<c:set target="${ bb2 }" property="publisher" value="${ param.publisher }"/>
<c:set target="${ bb2 }" property="price" value="${ param.price }"/>
<c:set target="${ bb2 }" property="buy" value="${ param.buy }"/>
<c:set target="${ bb2 }" property="kind" value="${ param.kind }"/>
<c:set target="${ bb2 }" property="bookstore" value="${ paramValues.bookstore }"/>
<c:set target="${ bb2 }" property="count" value="${ param.count }"/>


<table border=1>
	<tr>
		<td>제목</td>
		<td>
		${ bb2.title }
		<%-- <c:out value="${ bb.title }"/> --%>
		</td>
	</tr>
	<tr>
		<td>저자</td>
		<td>${ bb2['author'] }</td>
	</tr>
	<tr>
		<td>출판사</td>
		<td>${ bb2['publisher'] }</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${ bb2['price'] }</td>
	</tr>
	<tr>
		<td>입고일</td>
		<td>
			<c:if test="${ empty bb2['buy'] }">
				입고일 체크 누락
			</c:if> 
			<c:if test="${ !empty bb2['buy'] }">
				${ bb2['buy'] }
			</c:if>
		</td>
	</tr>
	<tr>
		<td>배송비</td>
		<td>
			<c:if test="${ empty bb2['kind'] }">
				배송비 체크 누락
			</c:if> 
			<c:if test="${ !empty bb2['kind'] }">
				${ bb2['kind'] }
			</c:if>
		</td>
	</tr>
	<tr>
		<td>구입가능서점</td>
		<td>
			<c:if test="${ len == 0 }">
			    선택한 구입가능서점이 없습니다.
			</c:if>
			
			<c:if test = "${ len > 0 }">
				<c:forEach var="i" begin="0" end="${ len - 1 }" varStatus="a">
					${ bb2.bookstore[i] }
					<c:if test="${ !a.last }">,</c:if>
				</c:forEach>
				<br>
				<c:forEach var="bookstore" items="${ barr }" varStatus="a">
				    ${bookstore}
				    <c:if test="${ !a.last }">,</c:if>
				</c:forEach>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td>
			<c:if test="${ bb2['count'] eq '선택' }">
				보유수량 체크 누락
			</c:if> 
			<c:if test="${ bb2['count'] ne '선택' }">
				${ bb2['count'] }
			</c:if>
		</td>
	</tr>
</table>



