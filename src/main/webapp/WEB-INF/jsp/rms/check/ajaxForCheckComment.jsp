<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/css/rms/cmn/base.css'/>"
	type="text/css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javaScript" language="javascript">
	
</script>
<form action="" id="commentForm" name="commentForm" method="post">
	<input type="hidden" name="rec_noti_no" id="rec_noti_no" value="" /> <input
		type="hidden" name="app_user_no" id="app_user_no" value="" />
	<table>
		<caption></caption>
		<colgroup>
			<col style="width: *%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col" class="last">의견내용</th>
			</tr>
		</thead>
		<tbody>
		
			<tr class="odd">
				<td class="last left"><textarea type="text" id="" name=""
						style="width: 90%; height: 400px;"><c:out value='${comment}'></c:out></textarea></td>
			</tr>
		</tbody>
	</table>
</form>
</html>