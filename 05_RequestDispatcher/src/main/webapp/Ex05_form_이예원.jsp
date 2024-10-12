<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
	function check(){
		if(frm.name.value==""){
			alert("이름을 입력하세요.");
			frm.name.focus();
			return false;
		}
		if(frm.age.value==""){
			alert("나이를 입력하세요.");
			frm.age.focus();
			return false;
		}
		if(isNaN(frm.age.value)){
			alert("나이는 숫자만 입력 가능합니다.");
			frm.age.select();
			return false;
		}
		
		flag = false;
 		for(var i=0; i<frm.coffee.length; i++){
 			if(frm.coffee[i].checked){
 				flag = true;
 				break;
 			}
 		}
 		if(flag == false){
 			alert("좋아하는 커피를 선택하세요.");
 			return false;
 		}
		
		if(frm.job.value==""){
			alert("직업을 선택하세요.");
			return false;
		}
		if(frm.travel.value==""){
			alert("여행하고싶은 나라를 선택하세요.");
			return false;
		}
	}
</script>

<form name="frm" method="get" action="FormServlet">
	이름 : <input type="text" name="name"><br><br> 
	나이 : <input type="text" name="age"><br><br> 
	성별 : <input type="radio" name="gender" value="남자" checked>남자
		 <input type="radio" name="gender" value="여자" checked>여자
		 <br><br> 
	좋아하는 커피 : 
	<input type="checkbox" name="coffee" value="아메리카노" checked>아메리카노
	<input type="checkbox" name="coffee" value="카페라떼">카페라떼 
	<input type="checkbox" name="coffee" value="카푸치노">카푸치노 
	<input type="checkbox" name="coffee" value="캬라멜마끼아또">캬라멜마끼아또 
	<br><br> 
	<span style="float: left; margin-right: 20px"> 
		직업 : 
		<select name="job">
			<option value="">선택하세요</option>
			<option value="학생">학생</option>
			<option value="언론인">언론인</option>
			<option value="공무원">공무원</option>
			<option value="군인">군인</option>
			<option value="서비스업">서비스업</option>
		</select>
	</span>
	<label style="float: left; margin-right: 10px">여행하고 싶은 나라 : </label> 
	<select name="travel" size="3" multiple="multiple">
		<option value="영국">영국</option>
		<option value="일본">일본</option>
		<option value="호주">호주</option>
		<option value="그리스">그리스</option>
		<option value="필리핀">필리핀</option>
	</select>
	<br><br> 
	<input type="submit" value="전송" onClick="return check()">
	<br><br>
</form>