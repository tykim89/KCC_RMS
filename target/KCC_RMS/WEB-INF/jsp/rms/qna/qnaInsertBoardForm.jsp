<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function sc_chk_tf(){

		var qna_chk_tf = document.getElementById("qna_quest_scr_tf_chk"); 
		
		if(qna_chk_tf.checked == true){

			document.qnaInsert.qna_quest_scr_tf.value = "T";

		}else{
	
			document.qnaInsert.qna_quest_scr_tf.value = "F";
		}

	}
</script>
</head>
<body>
<h1>QNA 입력게시판입니다</h1>
<form action="./qnaInsertBoard.do" method="post" name="qnaInsert">
<input type="hidden" name="checkResult">
<input type="hidden" id="qna_quest_scr_tf" name="qna_quest_scr_tf" value="F">
<table border="1">
	<tr>
		<td>질문유형</td>
		<td>
			<select name="qna_type_code">
				<c:forEach var="type" items="${itemList}" varStatus="vs">
				<option value="<c:out value="${type.detail_code_name}"/>">${type.detail_code_name}</option>
				<c:if test="${vo.qna_type_code == type.detail_code_name}">selected="selected"</c:if>
				<c:out value="${type.detail_code_name}"/>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>닉네임</td><td><input type="text" name="writer"></td>
		<td>이메일</td><td><input type="text" name="writer_email"></td>
	</tr>
	<tr>
		<td>비밀번호</td><td><input type="qna_quest_pw" name="qna_quest_pw"> </td>
	</tr>
	<tr>
		<td>비밀글선택</td>
		<td><input type="checkbox" id="qna_quest_scr_tf_chk" name="qna_quest_scr_tf_chk" value="">체크박스</td>
	</tr>
	<tr>
		<td>제목</td><td colspan="3"><input type="text" name="qna_quest_title"></td>
	</tr>
	<tr>
		<td colspan="4"><textarea rows="5" cols="40" name="qna_quest_content"></textarea> </td>
	</tr>

</table>
<p/>

<input type="submit" value="확인" onclick="sc_chk_tf()">
</form>
</body>

</html>