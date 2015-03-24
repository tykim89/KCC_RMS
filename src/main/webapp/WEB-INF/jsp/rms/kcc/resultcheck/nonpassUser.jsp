<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::: kcc :::</title>
<meta name="Generator" content="EditPlus">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/rms/kcc/style.css'/>" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script language="JavaScript" src="/KCC_RMS/js/rms/kcc/common2.js"></script>
<script language="JavaScript" src="/KCC_RMS/js/rms/kcc/selectbox.js"></script>
<script type="text/javascript">
	function gotologin(){
		
			var url="<c:url value='/rms/appResult/loginPage.do'/>";
			$("#userResult").attr("action",url).submit();	
			
	}
</script>
</head>
<body>

	<br/><br/>
	<!-- #### body #### -->
	<form id="userResult" name="userResult">
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
<!-- 						<table border="0" cellpadding="0" cellspacing="0" width="100%"> -->
<!-- 							<tr> -->
<!-- 								<td class="lpad_01"><img src="/KCC_RMS/images/rms/kcc/txt_successful.gif"></td> -->
<!-- 							</tr> -->
<!-- 						</table> -->
						<!-- #### 여백 #### -->
						<table width="100%" border="0" cellpadding="0" cellspacing="0" height="70">
							<tr><td class="h_02"></td></tr>
						</table>
						<!-- #### //여백 #### -->
						<!-- #### 결과확인 #### -->
						<div class="aln_st01">
						<form name="frm" method="post">
						<table border="0" cellspacing="0" class="box_03" style="padding-left: 150px;" >
								<input type="hidden" name="ins_gubun" value="">
								<input type="hidden" name="PK" value="291">
									<tr>
										<td><img src="/KCC_RMS/images/rms/kcc/img_successful_ann0102.gif"></td>
									</tr>
									<tr><td height="30" colspan="2"></td></tr>
									<tr><td height="9" colspan=""></td></tr>					
									<tr>
										<td class="aln_st02" align="center">
											<a><img src="/KCC_RMS/images/rms/kcc/btn_ok.gif" onclick="gotologin();"></a>				
										</td>
		
									</tr>
									<tr><td height="15" colspan="2"></td></tr>
						</table>
						</form>
						</div>
						<!-- #### //실명확인 #### -->				<!-- #### 여백 #### -->
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr><td class="h_02"></td></tr>
						</table>
						<!-- #### //여백 #### -->

					</td>
				</tr>
			</table>
			</form>
			<!-- #### //body #### -->	

</body>
</html>