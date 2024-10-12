<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	int age = Integer.parseInt(request.getParameter("age"));
%>

<strong>request방식</strong> <br>
아이디1 : <%= id %> <br>
이름1 : <%= name %> <br>
비밀번호1 : <%= password %> <br>
나이1 : <%= age %> <br>

<hr>

<strong>el param 방식</strong> <br>
아이디2 : ${ param.id } <br>
이름2 : ${ param["name"] } <br>
비밀번호2 : ${ param['password'] } <br>
나이2 : ${ param.age } <br>

<hr>

<jsp:useBean id="pb" class="myPkg.PersonBean">
	<jsp:setProperty name="pb" property="*"/>
</jsp:useBean>

<strong>pb get방식</strong> <br>
아이디3 : <%= pb.getId() %> <br>
이름3 : <%= pb.getName() %> <br>
비밀번호3 : <%= pb.getPassword() %> <br>
나이3 : <%= pb.getAge() %> <br>

<hr>

<strong>jsp:getProperty 방식</strong> <br>
아이디4 : <jsp:getProperty name="pb" property="id"/> <br>
이름4 : <jsp:getProperty name="pb" property="name"/> <br>
비밀번호4 : <jsp:getProperty name="pb" property="password"/> <br>
나이4 : <jsp:getProperty name="pb" property="age"/> <br>

<hr>

<strong>el pb 방식</strong> <br>
아이디5 : ${ pb.getId() } <br>
이름5 : ${ pb.name } <br>
비밀번호5 : ${ pb["password"] } <br>
나이5 : ${ pb['age'] } <br> 

<hr>

주소1 : <%= request.getParameter("addr") %><br> <!-- null -->
주소2 : ${ param.addr }<br> <!-- 공백 -->

<hr>

id비교1 : <%= request.getParameter("id") == "wendy" %><br>
id비교2 : <%= request.getParameter("id").equals("wendy") %><br>
<!-- request에서 문자열 비교는 equals로 해야 함 -->

id비교3 : ${ param.id == "wendy" }<br>
id비교4 : ${ param.id eq "wendy" }<br>
id비교5 : ${ param.id.equals("wendy") }<br>
<!-- el코드는 문자열 비교 ==, eq, equals로 해도 됨 -->
