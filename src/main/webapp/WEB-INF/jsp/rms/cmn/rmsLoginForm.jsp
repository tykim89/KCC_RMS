<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/com.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/button.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/common.css'/>" type="text/css">
<title>Insert title here</title>
<script type="text/javaScript" language="javascript">
	function actionLogin() {

		if (document.loginForm.id.value == "") {
			alert("아이디를 입력하세요");
		} else if (document.loginForm.password.value == "") {
			alert("비밀번호를 입력하세요");
		} else {
			document.loginForm.action = "<c:url value='/rms/cmn/rmsLogin.do'/>";
			document.loginForm.submit();
		}
	}
	
	//강제 로그인
	function actionLogin2() {
		if (document.loginForm.id.value == "") {
			alert("아이디를 입력하세요");
		} else if (document.loginForm.password.value == "") {
			alert("비밀번호를 입력하세요");
		} else {
			document.loginForm.action = "<c:url value='/rms/cmn/rmsLogin2.do'/>";
			document.loginForm.submit();
		}
	}
	
	
	//쿼리이용 로그인
	function actionLogin3() {
		if (document.loginForm.id.value == "") {
			alert("아이디를 입력하세요");
		} else if (document.loginForm.password.value == "") {
			alert("비밀번호를 입력하세요");
		} else {
			document.loginForm.action = "<c:url value='/rms/cmn/rmsLogin3.do'/>";
			document.loginForm.submit();
		}
	}
	
	
	function fnInit() {
	    var message = document.loginForm.message.value;
	    if (message != "") {
	        alert(message);
	        
	    }
	    
	    var loginSuccessId = document.loginForm.loginSuccessId.value;
	    var loginSuccessNm = document.loginForm.loginSuccessNm.value;
	    if(loginSuccessId != "" && loginSuccessNm != "")
	    {
	    	alert("로그인ID : " + loginSuccessId + "\r\n로그인NM : " + loginSuccessNm);
	    }

	    // 포커스
	    //document.loginForm.rdoSlctUsr.focus();
	}
</script>
</head>
<body onload="fnInit();">
	<form name="loginForm" action="<c:url value='/rms/cmn/rmsLogin.do'/>" method="post">
	<input type="hidden" name="message" value="${message}">
	<input type="hidden" name="loginSuccessId" value="${loginVO.id}">
	<input type="hidden" name="loginSuccessNm" value="${loginVO.name}">
	<input name="userSe" type="hidden" value="GNR"/>
		<table>
			<tr>
				<th>아이디</th>
				<td><input id="id" name="id"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input id="password" name="password"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><span class="button"><a href="#LINK" onClick="actionLogin()">로그인</a></span></td>
							<td>&nbsp;</td>
							<td><span class="button"><a href="#LINK" onClick="actionLogin2()">강제로그인</a></span></td>
							<td>&nbsp;</td>
							<td><span class="button"><a href="#LINK" onClick="actionLogin3()">쿼리로그인</a></span></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>