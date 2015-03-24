<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지원서양식</title>
</head>
<body>
<h2>지원서양식 List</h2><br/>


<form action="./appFormList.do">
	<select name="searchKey">
		<option value="app_form_name">지원서양식명</option>
		<option value="app_form_memo">지원서양식 메모내용</option>
	</select>
	<input type="text" name="searchValue">
	<input type="submit" value="검색">
</form>

<table border="1" cellpadding="5" cellspacing="0" width="600" >
		<tr>
			<th>번호</th>
			<th>지원서양식명</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		
		<c:forEach items="${appFormList }" var="afList" >
		<tr onclick="location.href=''">
			<td>${afList.app_form_no }</td>
			<td>${afList.app_form_name}</td>
 			<td>${afList.writer}</td>
			<td>${afList.write_date }</td>
		</tr>
		</c:forEach>
</table>

<input type="button" value="등록테스트" onclick="document.location.href='./insertAppForm.do'">
<input type="button" value="수정테스트" onclick="document.location.href='./updateRecProcess.do'">
<input type="button" value="삭제테스트" onclick="document.location.href='./deleteRecProcess.do'">

</body>
</html> --%>