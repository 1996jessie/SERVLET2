<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
insertForm.jsp<br>
<h2>영화 선호도 조사</h2>

<%
	String[] genre = {"공포","다큐","액션","애니메이션"};
	String[] time = {"8-10","10-12","12-14","14-16","16-18","18-20","20-22","22-24"};
	Integer[] partner = {1,2,3,4,5};
	application.setAttribute("flag", false);
%>

<style type="text/css">
	table {
		width: 700px;
	}
	tr:last-child{
		text-align : center;
	}
</style>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("1");
		var use;
		var isCheck = false;
		$('#idCheck').click(function(){
			//alert("1");
			isCheck = true;
			$.ajax({
				url : "id_check_proc.mv",
				data : ({ userId : $('input[name = id]').val() }),//data
				success : function(data) {
					//alert("id_check_proc에서 받은 data값" + data);
					if($('input[name = id]').val() == "") {
						$('#idCheckMessage').html("<font color = red> 입력 누락됐습니다. </font>")
						$('#idCheckMessage').show();
						use = "empty";
					}else if($.trim(data) == "not allowed") {
						$('#idCheckMessage').html("<font color = red> 중복된 아이디 </font>")
						$('#idCheckMessage').show();
						use = "not allowed";
					}else {
						$('#idCheckMessage').html("<font color = blue> 사용가능한 아이디 </font>")
						$('#idCheckMessage').show();
						use = "allowed";
					}
				}//success
			});//ajax
			
	        $('input[name = id]').keydown(function(){
	        	$('#idCheckMessage').hide();
	            isCheck = false;
	            use = "";            
	         });//keydown
		})//idCheck click
		
        $('input[type = submit]').click(function(){
            if(use == "not allowed"){
                alert("이미 사용중인 아이디입니다.");
                return false;
            }else if(use == "empty"){
                alert("아이디를 입력하세요");
                return false;
            }else if(isCheck == false){
                alert("중복 체크 먼저 하세요");
                return false;
            }
        });		
	});//ready

</script>


<form action = "insert.mv" method = "post">
	<table border = 1>
	<tr>
		<th>아이디</th>
		<td>
			<input type = "text" name = "id">
			<input type = "button" id = "idCheck" value = "중복체크">
			<span id = "idCheckMessage"></span>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type = "text" name = "name"></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type = "text" name = "age"></td>
	</tr>	
	<tr>
		<th>좋아하는 장르</th>
		<td>
			<c:forEach var="g" items="<%= genre %>">
				<input type="checkbox" name="genre" value="${ g }">${ g }
			</c:forEach>	
		</td>
	</tr>
	<tr>
		<th>좋아하는 시간대</th>
		<td>
	         <select name="time">
				<c:set var="time" value="<%= time %>" />
				<c:forEach var="t" begin="0" end="${ fn:length(time)-1 }">
					<option value="${ time[t] }">${ time[t] }
				</c:forEach>
	         </select>
		</td>
	</tr>
	<tr>
		<th>동반 관객수</th>
		<td>
	         <c:forEach var="p" begin="1" end="5">
				<input type="radio" name="partner" value="${ p }">${ p }
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th>영화관 개선사항</th>
		<td><textarea name = "memo" rows = "3" cols = "30" placeholder = "value는 여기에 넣기"></textarea></td>
	</tr>	
	<tr>
		<td colspan = "2"><input type="submit" id = "sub" value = "가입하기"> </td>
	</tr>
	</table>
</form>