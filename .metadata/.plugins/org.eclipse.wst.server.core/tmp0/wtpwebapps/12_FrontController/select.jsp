<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

select.jsp<br>

<style type="text/css">
	table {
		text-align: center;
		margin: auto;
		width: 900px;
	}
	tr:first-child{
		background-color : yellow;
	}
	td,th{
		border: 1px solid blue;
		padding: 3px;
	}
</style>


<script type="text/javascript">
	function insert() {		
		location.href = "insertForm.jsp";
	}
	
	function allCheck(obj) {
		//alert('1');
		var rowcheck = document.getElementsByName("rowcheck");
		var check = obj.checked;
 		if(check){
			for(var i=0;i<rowcheck.length;i++) {
				rowcheck[i].checked = true; 
			}
		} else {
			for(var i=0;i<rowcheck.length;i++) {
				rowcheck[i].checked = false; 
			}			
		} 
	}//allCheck
	
	function selectDelete(){
		var rowcheck = document.getElementsByName("rowcheck");
		var flag = false;
		for(var i=0;i<rowcheck.length;i++) {
			if(rowcheck[i].checked) {
				flag = true;
			}
		}
		if(flag == false) {
			alert("삭제할 항목을 1개 이상 선택하세요.");
			return;
		}
		document.myform.submit();
	}//selectDelete
	
</script>

<form name = "myform" action = "deleteAll.mv" method = "post">

<input type = "button" value = "추가" onClick = "insert()">
<input type = "button" value = "삭제" onClick = "selectDelete()">  
<br>
	<table border = 1>
		<tr>
			<th><input type = "checkbox" name = "allcheck" onClick = "allCheck(this)"></th>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>나이</th>
			<th>좋아하는 장르</th>
			<th>즐겨보는 시간대</th>
			<th>동반관객수</th>
			<th>개선사항</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	
		<c:forEach var="i" items = "${ lists }">
		<tr>
			<td><input type = "checkbox" name = "rowcheck" value = "${ i.num }"></td>
			<td>${ i.num }</td>
			<td>${ i.id }</td>
			<td>${ i.name }</td>
			<td>${ i.age }</td>
			<td>${ i.genre }</td>
			<td>${ i.time }</td>
			<td>${ i.partner }</td>
			<td>${ i.memo }</td>
			<td><a href = "updateForm.mv?num=${ i.num }">수정</a></td>
			<td><a href = "delete.mv?num=${ i.num }">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
</form> 

