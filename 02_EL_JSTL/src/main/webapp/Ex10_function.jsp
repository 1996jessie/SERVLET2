<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex10_function.jsp<br>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<c:set var="str1" value="      Functions <태그>를 사용합니다." />
<c:set var="str2" value="사용" /> 
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />

str1 = ${str1 }<br><br> 
tokens = ${tokens }<br><br>
length(str1) = ${fn:length(str1)} <br><br>  <!-- 글자개수 구할 때 -->
toUpperCase(str1) = "${fn:toUpperCase(str1)}" <br><br> <!-- 대문자 -->
toLowerCase(str1) = "${fn:toLowerCase(str1)}" <br><br> <!-- 소문자 -->
substring(str1, 7, 10) = "${fn:substring(str1, 7, 10)}" <br><br>  <!-- 문자열의 일부 가져옴(공백 포함, 0부터 셈, 10번째 앞까지만 가져옴(7~9)) -->
substringAfter(str1, str2) = "${fn:substringAfter(str1, str2)}" <br><br>  
substringBefore(str1, str2) = "${fn:substringBefore(str1, str2)}" <br><br> <!-- 공백 하나만 보임 -->
trim(str1) = "${fn:trim(str1)}" <br><br> <!-- 첫글자 앞에 있는 공백과 마지막글자 뒤에 있는 공백을 지움 -->
length(trim(str1)) = "${fn:length(fn:trim(str1))}" <br><br> 
replace(str1, src, dest) = "${fn:replace(str1, " ", "-")}" <br><br>
indexOf(str1, str2) = "${fn:indexOf(str1, str2)}" <br><br>  
startsWith(str1, str2) = "${fn:startsWith(str1, 'Fun')}" <br><br> 
endsWith(str1, str2) = "${fn:endsWith(str1, "합니다.")}" <br><br>
contains(str1, str2) = "${fn:contains(str1, str2)}" <br><br> 
containsIgnoreCase(str1, str2) = "${fn:containsIgnoreCase(str1, str2)}" <br><br>

<c:set var="array" value="${fn:split(tokens, ',')}" />

<c:set var="total" value="0" />
<c:set var="arrlen" value="${fn:length(array)}"/>


<c:forEach var="i" begin="0" end="${ fn:length(array) - 1 }">
	${ array[i] + '' }  
	<c:set var="total" value="${total + array[i]}" />
</c:forEach>

<br><br>

총합 : <c:out value = "${ total }"/>