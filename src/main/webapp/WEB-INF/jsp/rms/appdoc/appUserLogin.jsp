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

<script type="text/javaScript" language="javascript">

 
	$(document).ready(function(){
		
		var userExistState = '${userExistState}';

			if('recnoIsNotExist'==userExistState)
			{
				alert("이미 다른 채용공고에 지원하셨습니다.");
			}
			else if('nameIsNotExist'==userExistState)
			{
				alert("이름을 확인하여 주십시오.");
			}
			else if('pwIsNotExist'==userExistState)
			{
				alert("비밀번호를 확인하여 주십시오.");
			}
			
	});
 
 

	function appCheck(){
		
		if($("#app_user_name").val()=="" || $("#app_user_email_addr").val()=="" || $("#app_user_pw").val()==""){
			
			alert("지원자 정보를 입력하여 주십시오.");
			$("#app_user_name").focus();
		}
		else{
			
			 if(confirm('입사지원서를 작성 하시겠습니까?')){
				 
				 $("#applyForm").attr("action", "<c:url value='/rms/appdoc/loginAction.do'/>").submit();
			 }
		}
	}
	
	function search(){
		
		var url="<c:url value='/rms/appdoc/postsearch.do'/>";
		var title="post";
		var prop = "width=400px, height=500px, scrollbars=yes, resizable=yes";
		window.open(url, title, prop);
	}

</script>

</head>
<body>

<br/><br/>
<%-- 	<h1>${rec_noti_no}</h1> --%>
	<form commandName="" id="applyForm" name="applyForm" method="post">
			<input type="hidden" id="rec_noti_no" name="rec_noti_no" value="${rec_noti_no}">
<!-- 		<table border="1"> -->
<!-- 			<tr> -->
<!-- 				<td>이름</td> -->
<!-- 				<td><input type="text"  id="app_user_name" name="app_user_name" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>이메일</td> -->
<!-- 				<td><input type="text"  id="app_user_email_addr" name="app_user_email_addr" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>비밀번호</td> -->
<!-- 				<td><input type="password"  id="app_user_pw" name="app_user_pw" /></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		<input type="button" onclick="appCheck();" value="입사지원"> -->

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
						<!-- #### 실명확인 #### -->
						<div class="aln_st01">
						<form name="frm" method="post">
						<table border="0" cellspacing="0" class="box_03" style="padding-left: 100px;">
						<input type="hidden" name="ins_gubun" value="">
						<input type="hidden" name="PK" value="291">
							<tr><td height="30" colspan="2"></td></tr>
							<tr>
								<td style="padding-left:43px" width="64"><img src="/KCC_RMS/images/rms/kcc/txt_name.gif"></td>
								<td style="padding-left:21px"><input type="text" class="ipt_st01" name="app_user_name" style="width:131px;"></td>
							</tr>
							<tr><td height="9" colspan="2"></td></tr>
							<tr>
								<td class="aln_st02"><img src="/KCC_RMS/images/rms/kcc/txt_email02.gif"></td>
								<td style="padding-left:21px"><input type="text" class="ipt_st01" name="app_user_email_addr" style="width:131px"></td>
							</tr>
							<tr><td height="9" colspan="2"></td></tr>
							<tr>
								<td class="aln_st02"><img src="/KCC_RMS/images/rms/kcc/txt_password01.gif"></td>
								<td style="padding-left:21px"><input type="password" class="ipt_st01" name="app_user_pw" style="width:131px" maxlength="7" ></td>
							</tr>
							<tr><td height="18" colspan="2"></td></tr>
							<tr>
<!-- 								<td class="aln_st02" style="padding-right:54px" colspan="2"> -->
								<td class="aln_st02" style="padding-right: 30px;" colspan="2">
								
								<a href="javascript:recruit(1);" onfocus="this.blur();"><img src="/KCC_RMS/images/rms/kcc/btn_support01.gif" onclick="appCheck();"></a>&nbsp;

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
<!-- 
<form id="frm" name="frm">
<table border="1">
		<tr>
			<th colspan="5" rowspan="3" width="50px;">주소</th>
			<td width="70px;">우편 번호</td>
			<td>
			<input type="text" name="zipcode1" style="width: 50px;">&nbsp;-&nbsp;<input type="text" name="zipcode2"  style="width: 50px;">
			<input type="button" value="검색" name="addrbtn" onclick="search()"/>
			</td>
		</tr>
		<tr>
			<td>집 주소</td>
			<td><input type="text" name="addr1" readonly="readonly" style="width: 300px;"/></td>
		</tr>
		<tr>
			<td>상세 주소</td>
			<td><input type="text" name="addr2" style="width: 300px;"/></td>
		</tr>
</table>
</form>	
 -->		
</body>
</html>
