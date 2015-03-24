<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javaScript" language="javascript">

</script>
<script language="JavaScript" src="/KCC_RMS/js/rms/kcc/common2.js"></script>
<table border="0" cellspacing="0" width="290" style="padding-left: 30px;">
		<tr>
				<td height="23" style="text-align: center;">우편번호</td>
				<td height="23" style="text-align: center;">선택하실 주소</td>
		</tr>
<c:forEach items="${postList}" var="postList" varStatus="vs">
		<tr> 
			<td height="1" align="center" colspan="3" bgcolor="#6E9FC4" width="420"></td>
		</tr>

		<tr>
<%-- 				<td>${postList}</td> --%>
				<td height="23"  width="120" align="center"  style="text-align: center;">${postList.zipcode}</td>
				<td height="23" width="300" ><a href="#" onclick="addrval('${postList.zipcode}','${postList.addrall}')">${postList.addrall}</a></td>
		</tr>
</c:forEach>

</table>