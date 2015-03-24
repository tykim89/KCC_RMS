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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script src="/js/rms/com/jquery-1.7.1.min.js" type="text/javascript"></script>
<script language="JavaScript" src="/KCC_RMS/js/rms/kcc/common2.js"></script>
<script language="JavaScript" src="/KCC_RMS/js/rms/kcc/selectbox.js"></script>
<script type="text/javascript">		

	$(document).ready(function() {
		$("#submitfinal").click(function() {	
					if(confirm('<spring:message code="common.finalsubmit.msg" />')){
					$("#finalSubmit").attr("action","<c:url value='./finalSubmit.do'/>").submit();			
	
				}
			})
	})

	$(document).ready(function() {
		$("#submitCancle").click(function() {	
					$("#finalSubmit").attr("action","<c:url value='/rms/recNotice/userNoticeList.do'/>").submit();			
			})
	})

</script>
</head>
<body>
<br/><br/>
		<!-- #### body #### -->
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding:25 0 0 25" width="657">
					<!-- #### title #### -->

					<table border="0" cellpadding="0" cellspacing="0" class="mgn_b01">
						<tr>
							<td background="/KCC_RMS/images/rms/kcc/bg_subTitle.gif">
								<table width="657" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="124"><img src="/KCC_RMS/images/rms/kcc/title_online.gif"></td>
										<td valign="top" style="padding-top:6"><img src="/KCC_RMS/images/rms/kcc/bg_newsExp.gif"></td>
										<td align="right" class="history"><a href="../index.asp" class="history">Home</a> >  <a href="../about/sub_main.asp" class="history">기업정보</a> > <a href="./news.asp" class="history">채용정보</a> > <span class="history"><strong>온라인 입사지원</strong></span></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>

					<!-- #### //title #### -->
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="lpad_01"><img src="/KCC_RMS/images/rms/kcc/txt_online02_01.gif"></td>
						</tr>
					</table>
					<!-- #### 여백 #### -->
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr><td class="h_02"></td></tr>
					</table>
					<!-- #### //여백 #### -->
					
				</td>
			</tr>
		</table>
		<!-- #### //body #### -->	
			
<form action="./finalSubmit.do" method="post" id="finalSubmit" name="finalSubmit">
<input type="hidden" id="rec_noti_no" name="rec_noti_no" value="${rec_noti_no}">
<input type="hidden" id="app_user_no" name="app_user_no" value="${app_user_no}">
<table width="60%">
	<tr style="text-align: center;">
		<td width="30px;" scope="col"></td>
		<td width="300px;" style="text-align: center;">
		최종 제출 후 에는 수정이 불가능합니다.<br>
		최종 제출 전 입사지원서를 확인해주시기 바랍니다.
		</td>
		<td rowspan="3"><img src="/KCC_RMS/images/rms/kcc/bg_qna_write.jpg" width="90px;"></td>
	</tr>
	<tr style="text-align: center;">
		<td width="30px;" scope="col"></td>
	</tr>
	<tr style="text-align: center;">
		<td width="30px;" scope="col"></td>
		<td>
<!-- 			<input type="button" value="최종제출" id="submitfinal" name="submitfinal"> -->
			<img src="/KCC_RMS/images/rms/kcc/btn_send.gif" id="submitfinal" name="submitfinal">
<!-- 			<input type="button" value="취소" id="submitCancle" name="submitCancle">			 -->
			<img src="/KCC_RMS/images/rms/kcc/btn_cancel.gif" id="submitCancle" name="submitCancle">
		</td>
	</tr>
	
</table>
<!-- <input type="submit" value="최종제출" id="finalSubmit" name="finalSubmit" onclick="finalSubmit()"> -->


</form>
</body>
</html>