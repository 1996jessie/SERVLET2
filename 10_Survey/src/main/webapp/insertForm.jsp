<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
insertForm.jsp<br>

<% 
	application.setAttribute("flag", false);
	String[] satisfaction = {"매우만족", "만족", "보통", "불만족", "매우불만족"}; 
	String[] part = {"JAVA","Spring","UML","JDBC","서블릿","JSP"};
	String[] howto = {"우편","이메일"};
%>
<form action="insert.sv" method="post">
<h3>개인 정보:</h3>
  		이름 <input type="text" name="name" style="margin-left: 79px; "> <br>
  		소속 회사 <input type="text" name="company" style="margin-left: 42px; "> <br>
  		이메일 주소 <input type="text" name="email" style="margin-left: 26px; "> <br>
  		
  		<br>
  		
  		<span style="font-weight: bold;">본 교육 과정을 수강하고 과정에 만족도를 선택해 주세요.</span> <br>
  		
  		<c:forEach var="s" items="<%=satisfaction%>"> 
	    	<input type="radio" name="satisfaction" value="${s}">${s}
	    </c:forEach>
	    <br><br>
	    
	    <b>관심있는 분야는 무엇입니까?</b><br>
	    <c:forEach var="p" items="<%=part%>" varStatus="status">
	    	<input type="checkbox" name="part" value="${p}">${p}
	    	<c:if test="${status.index == 2 }">
	    		<br>
	    	</c:if>
	    </c:forEach>
	    
	    <br><br>
	    
	    정보 발송 방법 
	    <select name="howto">
	    	<c:forEach var="h" items="<%=howto%>">
	    		<option value="${h}">${h}
	    	</c:forEach>
	    </select><br><br>
		
		<input type="checkbox" name="agree" value="1"> 정보 발송에 동의합니다.<br>
		
		<br>
		<input type="submit" value="전송">
</form>
