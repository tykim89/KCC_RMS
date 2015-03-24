<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">

// 	$(document).ready(function(pwchk){
// 		alert(111111);
// 		$('#inputpw').submit(function(event){
// 			var qna_quest_pw = $('#qna_quest_pw').val();
			
// 			alert(qna_quest_pw);
// 			event.prevnetDefault();

// 		})	
// 	})
	
// 	function pwchk(){
// 		var qnaNo = top.opener.document.getElementById("selectedQnaNo").value;
		
// 		pw = document.inputpw;
// 		if(pw.qna_quest_pw.value==""){
// 			alert("패스워드를 입력해주시기바랍니다");
// 		}else{
// 			pw.qna_quest_pw
// 		}
		
				
// 		$("#").attr("action", "<c:url value=''/>").submit();
// 		self.close();
// 		window.opener.location.href="rms/qna/qnaBoarddetail";

// 		var val = document.getElementsByName("qna_quest_pw").value;
// 		window.opener.document.getElementsByName().value = val;
// 		window.close();

// 		opener.document.location.href="./qnaBoarddetail.do";
// 		self.close();
//	}


</script>
</head>
<h1>QNA 비밀번호확인</h1>
<form action="./qnaPWcheck.do" method="post" name="inputpw">
	<table>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" id="qna_quest_pw" name="qna_quest_pw"></td>
		</tr>
	</table>
	<input type="submit" value="확인" onclick="pwchk()">
</form>
</body>
</html>