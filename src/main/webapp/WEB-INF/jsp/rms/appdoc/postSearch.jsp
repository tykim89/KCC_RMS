<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko">
<head>
<title>::: kcc :::</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge; text/html; charset=UTF-8" />
<meta charset="utf-8">
<meta name="Generator" content="EditPlus">
<meta name="Author" content="">
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>


<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/rms/kcc/style.css'/>" />
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/js/rms/com/jquery-1.7.1.min.js" type="text/javascript"></script>
<script language="JavaScript" src="/KCC_RMS/js/rms/kcc/common2.js"></script>
<script language="JavaScript" src="/KCC_RMS/js/rms/kcc/selectbox.js"></script>
<script type="text/javascript">

	function addrval(zipcode, addr){
		
// 		window.opener.document.getElementsByName("zipcode1")[0].value=zipcode.substring(0,3);
// 		window.opener.document.getElementsByName("zipcode2")[0].value= zipcode.substring(4,7);
		window.opener.document.getElementsByName("PSINFO01|PSINFO004")[0].value= zipcode;
		window.opener.document.getElementsByName("PSINFO01|PSINFO005")[0].value=addr;
		window.opener.document.getElementsByName("PSINFO01|PSINFO006")[0].focus();
		window.close();
	}

	function search(dong) {
		
		if(dong==""){
			alert("검색할 동을 입력하세요");
		}else{
			
			$.post("<c:url value='/rms/appdoc/postList.do'/>", $("#searchZipcode").serialize(), function(html) {
				
				$("#postlist").html(html);		

			});			
		}
	}



		

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소검색</title>
</head>
<body>
<!--  
<h2>주소검색하기</h2>
<form id="searchZipcode" name="searchZipcode">
	<input type="text" name="dong">
	<input type="button" value="주소검색" onclick="search(dong.value)">

</form>
<div id="postlist" name="postlist">

</div>
-->

<form id="searchZipcode" name="searchZipcode" method = "post">
<table width="350" height="170" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="200" height="5" bgcolor="#7f7262"></td>
		<td width="200" height="5" bgcolor="#e6b800"></td>
	</tr>
	<tr>
		<td colspan="2" align="center" valign="top" style="padding-top:100">

			<table width="290" border="0" cellpadding="0" cellspacing="0">
				<tr><td height="28" colspan="2"></td></tr>
				<tr>
					<td colspan="2" background="/KCC_RMS/images/rms/kcc/bg_pass.gif"><img src="/KCC_RMS/images/rms/kcc/title_zip.gif"></td>
				</tr>
				<tr><td height="19" colspan="2"></td></tr>
				<tr>
					<td valign=top style="padding-top:3"><img src="/KCC_RMS/images/rms/kcc/ico_arrow.gif"></td>
					<td>&nbsp;<span style="color:#666666">찾고자하는 주소의 동(읍/면/리)를 입력하세요</span></td>
				</tr>
				<tr><td height="8" colspan="2"></td></tr>
				<tr>
					<td></td>
					<td>&nbsp;<span style="color:#666666">예) 역삼, 갈월동, 쌍문2동 등...</span></td>
				</tr>
				<tr><td height="8" colspan="2"></td></tr>
				<tr>
					<td colspan="2"><input type="text" name="dong" class="input_style" style="width:170;height:18">&nbsp;
						<img src="/KCC_RMS/images/rms/kcc/btn_zipSearch.gif" border="0" align="absmiddle" onclick="search(dong.value)">
					</td>
				</tr>
<!-- 				<tr><td height="28" colspan="2"></td></tr> -->
			</table>

		</td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td height="39" colspan="2" bgcolor="#ededed" align="center"><a href="javascript:self.close();" onfocus="this.blur();"><img src="/KCC_RMS/images/rms/kcc/btn_close.gif" border="0"></a></td> -->
<!-- 	</tr> -->
</table>
<div id="postlist" name="postlist">

</div>
</form>

<table width="400" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="39" colspan="2" bgcolor="#ededed" align="center"><a href="javascript:self.close();" onfocus="this.blur();">
		<img src="/KCC_RMS/images/rms/kcc/btn_close.gif" border="0"></a></td>
	</tr>
</table>
</body>
</html>