<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
updateForm.jsp<br>

<% 
	String[] satisfaction = {"매우만족", "만족", "보통", "불만족", "매우불만족"}; 
	String[] part = {"JAVA","Spring","UML","JDBC","서블릿","JSP"};
	String[] howto = {"우편","이메일"};
%>
<form action="update.sv" method="post">
<h3>개인 정보:</h3>
		<input type="hidden" name="no" value="${ sb.no }">
  		이름 <input type="text" name="name" style="margin-left: 79px; " value="${ sb.name }" > <br>
  		소속 회사 <input type="text" name="company" style="margin-left: 42px; " value="${ sb.company }"> <br>
  		이메일 주소 <input type="text" name="email" style="margin-left: 26px; " value="${ sb.email }"> <br>
  		
  		<br>
  		
  		<span style="font-weight: bold;">본 교육 과정을 수강하고 과정에 만족도를 선택해 주세요.</span> <br>
  		
  		<c:forEach var="s" items="<%=satisfaction%>"> 
	    	<input type="radio" name="satisfaction" value="${s}" <c:if test="${ s eq sb.satisfaction }"> checked </c:if>>${s}
	    </c:forEach>
	    <br><br>
	    
	    <b>관심있는 분야는 무엇입니까?</b><br>
	    <c:forEach var="p" items="<%=part%>" varStatus="status">
	    	<input type="checkbox" name="part" value="${p}" <c:if test="${ sb.part.contains(p) }"> checked </c:if>>${p}
	    	<c:if test="${status.index == 2 }">
	    		<br>
	    	</c:if>
	    </c:forEach>

	    <br><br>
	    
	    정보 발송 방법 
	    <select name="howto">
	    	<c:forEach var="h" items="<%=howto%>">
	    		<option value="${h}"<c:if test="${ h eq sb.howto }">selected</c:if>>${h}
	    			
	    	</c:forEach>
	    </select><br><br>
		
		<input type="checkbox" name="agree" value="1" <c:if test = "${ sb.agree eq 1 }"> checked </c:if>> 정보 발송에 동의합니다.<br>
		
		<br>
		<input type="submit" value="전송">
</form>

		