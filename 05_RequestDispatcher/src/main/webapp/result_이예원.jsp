<%@page import="myPkg.AnimalBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>      
result_이예원.jsp<br>

이름1:${param.name }<br>
주소1:${param.address }<br>
펫1:
<c:forEach var="p" items="${paramValues.pet }">
	${p }
</c:forEach>
<br><br> 

이름2: <%=request.getParameter("name") %> <br>
주소2: <%=request.getParameter("address") %> <br>
동물2: <% if(request.getParameterValues("pet") != null) {
            for(String pet : request.getParameterValues("pet")) { %>
                    <%=pet%>    
            <% } 
        } else {
            out.print("선택사항없음");
        }%>
<br><br>         

<!-- 	3. 각각속성 -->
	이름3 : ${name } <br> 
	주소3 : ${addr } <br>
	좋아하는 동물3 : 
    <c:if test="${pet == null}">
	선택 누락
	</c:if>
	<c:if test="${pet != null}">
		<c:forEach var="pet" items="${pet}" varStatus="vs">
			${pet}
			<c:if test="${!vs.last}">,</c:if>
		</c:forEach>
	</c:if>
	<br><br>

<!-- 	4. 각각속성 -->
이름4 : ${requestScope.name} <br>
주소4 : ${requestScope.addr} <br>
좋아하는 동물4 : 
	<c:forEach var="pet3" items="${requestScope.pet}" varStatus="p">
		${pet3} <c:if test="${!(p.last)}">,</c:if>
	</c:forEach> <br>
<br><br>
	
<!-- 	5. 각각속성 -->
이름5 : <%= request.getAttribute("name") %><br>
주소5 : <%= request.getAttribute("addr") %><br>
좋아하는 동물5 : 
<%
	String[] pet = request.getParameterValues("pet");
	if(pet != null){
		for(String p : (String[])request.getAttribute("pet")){
			if(p.equals("dog")){
				p = "강아지";
			}
			if(p.equals("cat")){
				p = "고양이";
			}
			if(p.equals("rabbit")){
				p = "토끼";
			}
			out.print(p+" ");
		}
	}else{
		out.print("선택사항없음");
	}
%>
<br><br>

<%
	AnimalBean ib = (AnimalBean)request.getAttribute("rb");
	pageContext.setAttribute("ib", ib);
%>

이름6 : <%=ib.getName()%><br>
주소6 : <%=ib.getAddress()%><br>
pet6 : <%
		if(ib.getPet() != null){
			for(int i = 0; i < ib.getPet().length; i++){
				out.print(ib.getPet()[i] + " ");
			}
		}
%>
<br><br>
이름7 : ${ib.getName() }<br>
주소7 : ${ib.address }<br>
동물7 : 
<c:if test="${ib.pet ne null}">
	<c:forEach var="pet" items="${ib.pet }">
		${pet }
	</c:forEach>
</c:if>

<br><br>





