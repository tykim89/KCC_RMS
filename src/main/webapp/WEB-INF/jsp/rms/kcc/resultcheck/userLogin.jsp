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
<script src="/KCC_RMS/js/rms/com/jquery.cookie.js"></script>
<script type="text/javascript">

		$(document).ready(function(){
			
			var userExistState = '${userExistState}';
		
				if('nameIsNotExist'==userExistState)
				{
					alert("이름을 확인하여 주십시오.");
				}
				else if('pwIsNotExist'==userExistState)
				{
					alert("비밀번호를 확인하여 주십시오.");
					
				}else if('userIsNotExist'== userExistState){
					
					alert("입력한 정보를 다시 확인하여 주십시오.");
					
				}
				
		});
		
		function appCheck(){
			
			if($("#app_user_name").val()=="" || $("#app_user_email_addr").val()=="" || $("#app_user_pw").val()==""){

				alert("입사 지원시 작성한 정보를 입력하여 주십시오.");
				$("#app_user_name").focus();
			}
			else{				
				
				 if(confirm('지원 결과를 확인 하시겠습니까?')){
					 
					 $("#userLogin").attr("action", "<c:url value='/rms/appResult/loginCheck.do'/>").submit();
				 }
			}
		}


</script>
</head>
<body>


<!-- <h1>유저 로그인</h1> -->
<%-- <form action="/KCC_RMS/rms/appResult/loginCheck.do" method="post" id="applyForm" name="applyForm"> --%>
<!-- 	<table border="1"> -->
<!-- 		<tr> -->
<!-- 			<td>한글성명</td> -->
<!-- 			<td><input type="text" name="app_user_name"></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>이메일주소</td> -->
<!-- 			<td><input type="text" name="app_user_email_addr"></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>비밀번호</td> -->
<!-- 			<td><input type="password" name="app_user_pw"></td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
	
<!-- 	<input type="button" value="확인" onclick="appCheck()"> -->
	
<%-- </form> --%>



<br/><br/>
<%-- 	<h1>${rec_noti_no}</h1> --%>
	<form commandName="" id="userLogin" name="userLogin" method="post">
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
											<td width="124"><img src="/KCC_RMS/images/rms/kcc/title_successful.gif"></td>
											<td valign="top" style="padding-top:6"><img src="/KCC_RMS/images/rms/kcc/bg_newsExp.gif"></td>
											<td align="right" class="history"><a href="../index.asp" class="history">Home</a> >  <a href="../about/sub_main.asp" class="history">기업정보</a> > <a href="./news.asp" class="history">채용정보</a> > <span class="history"><strong>합격자 발표</strong></span></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>

						<!-- #### //title #### -->
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td class="lpad_01"><img src="/KCC_RMS/images/rms/kcc/txt_successful.gif"></td>
							</tr>
						</table>
						<!-- #### 여백 #### -->
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr><td class="h_02"></td></tr>
						</table>
						<!-- #### //여백 #### -->
						<!-- #### 실명확인 #### -->
						<div class="aln_st01">
						<form name="frm" method="post">
						<table border="0" cellspacing="0" class="box_03" style="padding-left: 100px;">
						<input type="hidden" name="ins_gubun" value="">
						<input type="hidden" name="PK" value="291">
							<tr><td height="30" colspan="2"></td></tr>
							<tr>
								<td style="padding-left:43px" width="64"><img src="/KCC_RMS/images/rms/kcc/txt_name.gif"></td>
								<td style="padding-left:21px"><input type="text" class="ipt_st01" id="app_user_name" name="app_user_name" style="width:131px;"></td>
							</tr>
							<tr><td height="9" colspan="2"></td></tr>
							<tr>
								<td class="aln_st02"><img src="/KCC_RMS/images/rms/kcc/txt_email02.gif"></td>
								<td style="padding-left:21px"><input type="text" class="ipt_st01" id="app_user_email_addr" name="app_user_email_addr" style="width:131px"></td>
							</tr>
							<tr><td height="9" colspan="2"></td></tr>
							<tr>
								<td class="aln_st02"><img src="/KCC_RMS/images/rms/kcc/txt_password01.gif"></td>
								<td style="padding-left:21px"><input type="password" class="ipt_st01" id="app_user_pw" name="app_user_pw" style="width:131px" maxlength="7" ></td>
							</tr>
							<tr><td height="18" colspan="2"></td></tr>
							<tr>
<!-- 								<td class="aln_st02" style="padding-right:54px" colspan="2"> -->
								<td class="aln_st02" style="padding-right: 30px;" colspan="2">
								
								<a href="javascript:recruit(1);" onfocus="this.blur();"><img src="/KCC_RMS/images/rms/kcc/btn_ok01.gif" onclick="appCheck();"></a>&nbsp;

<!-- 								<a href="javascript:recruit(2);" onfocus="this.blur();"><img src="/KCC_RMS/images/rms/kcc/btn_modify01.gif"></a> -->
								
								</td>

							</tr>
							<tr><td height="15" colspan="2"></td></tr>
						</table>
						</form>
						</div>
						<!-- #### //실명확인 #### -->
						<!-- #### 여백 #### -->
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr><td class="h_02"></td></tr>
						</table>
						<!-- #### //여백 #### -->

					</td>
				</tr>
			</table>
			<!-- #### //body #### -->	
		</form>
		
		
		</td>
	</tr>
	<tr>
		<td colspan=2 height="100%"></td>
	</tr>


</table>


</body>
</html>