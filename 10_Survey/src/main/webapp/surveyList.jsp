<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	surveyList.jsp<br>
	
	<table border="1">
		
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>소속 회사</th>
			<th>이메일 주소</th>
			<th>과정 만족도</th>
			<th>관심 분야</th>
			<th>정보 발송 방법</th>
			<th>정보 발송 동의</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		
		<c:forEach var="survey" items="${ requestScope.lists }">
			<tr>
				<td>${ survey.getNo() }</td>
				<td>${ survey.getName() }</td>
				<td>${ survey.getCompany() }</td>
				<td>${ survey.getEmail() }</td>
				<td>${ survey.getSatisfaction() }</td>
				<td>${ survey.getPart() }</td>
				<td>${ survey.getHowto() }</td>
				<td>
					<c:if test="${survey.getAgree() == 1}">동의함</c:if>
					<c:if test="${survey.getAgree() == 0}">동의안함</c:if>
				</td>
				<td><a href="delete.sv?no=${ survey.getNo()}">삭제</a></td>
				<td><a href="updateForm.sv?no=${ survey.getNo() }">수정</a></td>
			</tr>
		</c:forEach>
		
	</table>

<br><br>
<a href="insertForm.jsp">등록</a>



