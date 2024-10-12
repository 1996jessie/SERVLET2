<%@page import="myPkg.RegisterBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
Ex04_result.jsp<br>

아이디 : ${param.id }
<br>
비밀번호 : ${param.pw }
<br>
생년월일 :${param.year }년 ${param.month }월 ${param.day }일
<br>
취미 :<c:forEach var="h" items="${paramValues.hobby }" varStatus="ho">
	${h }
	<c:if test="${!ho.last }">,</c:if>
</c:forEach>
<br>
[성적]
<br>
c언어 :${param.c }
<br>
java : ${param.java }
<br>
jsp : ${param.jsp }
<br>
<hr>

아이디 : <%= request.getParameter("id") %> <br>
비밀번호 : <%= request.getParameter("pw") %><br>
이름 : <%= request.getParameter("name") %><br>
생년월일 : <%= request.getParameter("year") %>년
		<%= request.getParameter("month") %>월 
		<%= request.getParameter("day") %>일<br>
취미 : 
<c:if test='<%= request.getParameterValues("hobby") != null %>'>
	<c:forEach var="h" items='<%= request.getParameterValues("hobby") %>'>
		${h }
	</c:forEach>
</c:if>
<c:if test='<%= request.getParameterValues("hobby") == null %>'>
	선택사항없음
</c:if>
<br>
[성적]<br>
C언어:<%= request.getParameter("c") %>
JAVA:<%= request.getParameter("java") %>
JSP:<%= request.getParameter("jsp") %>
<hr>

아이디3: ${id} <br>
비밀번호3: ${pw}<br>
이름3: ${name} <br>
생년월일3: ${year}년 ${month}월 ${day}일<br>
취미3: 
<c:if test="${hobby == null}">
선택 누락
</c:if>
<c:if test="${hobby != null}">
	<c:forEach var="hobby" items="${hobby}" varStatus="vs">
		${hobby}
		<c:if test="${!vs.last}">,</c:if>
	</c:forEach>
</c:if>
<br>
C언어3: ${c}<br>
JAVA3: ${java}<br>
JSP3: ${jsp}<br>

<hr>

아이디4: ${rb.id}<br> 
비밀번호: ${rb.pw}<br> 
이름: ${rb.name}<br> 
생년월일<br>
${rb.getYear()}년 ${rb.month}월 ${rb.day}일<br> 
취미:
<c:forEach var="hobby" items="${rb.hobby}">
    ${hobby}
</c:forEach><br> 
C: ${rb.c}<br> 
JAVA: ${rb.java}<br> 
JSP: ${rb.jsp}<br>

<hr>

	<%
	RegisterBean rb = (RegisterBean)request.getAttribute("rb");
	%>
	아이디5 : <%=rb.getId() %> <br>
	비밀번호 : <%=rb.getPw() %> <br>
	이름 : <%=rb.getName() %> <br>
	생년월일 : 
	<%=rb.getYear() %>-<%=rb.getMonth() %>-<%=rb.getDay() %> 
	<br>
	취미 : 
    <%
    if(rb.getHobby().length>0){
	    for(int i =0;i<rb.getHobby().length;i++){
	   		out.print(rb.getHobby()[i]);
	   		if(i!=rb.getHobby().length-1){
	   			out.print(",");
	   		}
	   	}
    }else{
    	out.print("선택사항 없음");
    }
   	%>
   	<br>
   	c언어 : <%=rb.getC() %> <br>
   	java : <%=rb.getJava()%> <br>
   	jsp : <%=rb.getJsp() %> <br>
   	<hr>

아이디6: ${requestScope.id}<br>
비밀번호6: ${requestScope.pw}<br>
이름4: ${requestScope.name}<br>
생년월일4: ${requestScope.year}년 ${requestScope.month}월 ${requestScope.day}일<br>
취미4: 
<c:if test="${requestScope.hobby != null}">
	<c:forEach var="hobby2" items="${requestScope.hobby}" varStatus="h">
		${hobby2}
		<c:if test="${!h.last}"> , </c:if>
	</c:forEach>
</c:if>
<br>
C언어4: ${requestScope.c}<br>
JAVA4: ${requestScope.java}<br>
JSP4: ${requestScope.jsp}<br>

<hr>

아이디7: <%=request.getAttribute("id") %> <br>
비밀번호7: <%=request.getAttribute("pw") %> <br>
이름5: <%=request.getAttribute("name") %> <br>
생년월일5: <%=request.getAttribute("year") %>년 <%=request.getAttribute("month") %>월 <%=request.getAttribute("day") %>일<br>
취미5: 
<% 
	String[] hobby = request.getParameterValues("hobby");
	if(hobby != null){
		for(String h : (String[])request.getAttribute("hobby")){
			out.print(h+" ");
		}
	}else{
		out.print("선택사항없음");
	}
%>
<br>
C언어5: <%=request.getAttribute("c") %><br>
JAVA5: <%=request.getAttribute("java") %><br>
JSP5: <%=request.getAttribute("jsp") %><br>



