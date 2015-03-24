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

<!-- Bootstrap -->
<link href=<c:url value="/css/bootstrap.min.css"/> rel="stylesheet" type="text/css" />

<!-- JavaScript plugins-->
<script type="text/javascript" src="<c:url value="/resource/plugins/jquery-1.11.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resource/plugins/bootstrap.min.js"/>"></script>
<script type="text/javascript">

function recCheck(){
	
	var notiForm = document.userRecNotiForm;
	
	if( $("#ing").val()=="Y")
	{
		 if( confirm('해당 채용공고에 지원하시겠습니까?') )
	     {
		 	var rec_noti_no = $("#rec_noti_no").val();


// 		 	notiForm.action="/KCC_RMS/rms/appdoc/agreement.do";		
// 		 	notiForm.submit();
			var url="<c:url value='/rms/appdoc/agreement.do'/>";
			$("#userRecNotiForm").attr("action",url).submit();	
			 	
	     }
		 else
	     {
			 notiForm.action="/KCC_RMS/rms/recNotice/userNoticeContent.do?rec_noti_no";
	     }
	}
	else
	{
		alert("마감된 채용공고 입니다.");
	}
}


function gotolist(){
	
	var url="<c:url value='/rms/recNotice/userNoticeList.do'/>";
	$("#userRecNotiForm").attr("action",url).submit();	
	
}



// 첨부파일 다운로드
function fileDown(){
	$("#userRecNotiForm").attr("action", "<c:url value='/rms/attfile/fileDownload.do'/>").submit();
}



</script>

<style>
/* .nopadding { */
/* 	padding-right: 5px; */
/* 	padding-left: 5px; */
/* } */
</style>

</head>

<body>
<!-- 	<div class="col-md-offset-1"> -->
<!-- 		<div class="row"> -->
<!-- 			<h2>채용공고</h2> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<br> -->
<!-- 	<br> -->

<%-- 	<form role="form" name="userRecNotiForm" method="post"> --%>
<!-- 		<div class="form-group"> -->
<%-- 			<input type="hidden" id="rec_noti_no" name="rec_noti_no" value="${recNoticeContent.rec_noti_no }"> --%>
<%-- 			<input type="hidden" id="stateCode" name="stateCode" value="${recNoticeContent.state_code }"> --%>
<%-- 			<input type="hidden" id="ing" name="ing" value="${recNoticeContent.ing }"> --%>
<!-- 			<div class="container"> -->
<!-- 				<div class="col-md-12"> -->
							
<!-- 							<table class="table"> -->
<!-- 								<tbody> -->
<!-- 									<tr> -->
<!-- 										<td> -->
<!-- 											<div class="row"> -->
<%-- 												<h3>${recNoticeContent.rec_noti_title }</h3> --%>
<!-- 													<div class="row"> -->
<!-- 														<div class="col-md-12 col-md-offset-9"> -->
<!-- 															합격자 발표일 : -->
<%-- 															<fmt:formatDate value="${recNoticeContent.announce_date }" pattern="yyyy-MM-dd" /> --%>
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 													<div class="row"> -->
<!-- 														<div class="col-md-12 col-md-offset-9"> -->
<!-- 															모집기간 : -->
<%-- 															<fmt:formatDate value="${recNoticeContent.rec_start_date }" pattern="yyyy-MM-dd" /> --%>
<!-- 															~ -->
<%-- 															<fmt:formatDate value="${recNoticeContent.rec_end_date }" pattern="yyyy-MM-dd" /> --%>
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 											</div> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<%-- 										<td><textarea class="form-control" rows="20" >${recNoticeContent.rec_noti_content }</textarea> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td> -->
<!-- 											<div class="row"> -->
<!-- 												첨부파일 : -->
<!-- 											</div> -->
<!-- 										</td> -->
<!-- 										<td></td> -->
<!-- 									</tr> -->
<!-- 								</tbody> -->
<!-- 							</table> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-5 col-md-offset-5"> -->
<!-- 							<button type="button" class="btn btn-primary btn-lg" onclick="recCheck()">입사지원</button> -->
<!-- 							<button type="button" class="btn btn-default btn-lg" onclick="document.location.href='./userNoticeList.do'">취  소</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 		</div> -->
<%-- 	</form> --%>
	
	
	<br/><br/>
	<!-- #### body #### -->
		<form id="userRecNotiForm" name="userRecNotiForm" method="post" action="./agreement.do">
			<input type="hidden" id="rec_noti_no" name="rec_noti_no" value="${recNoticeVO.rec_noti_no }">
			<input type="hidden" id="stateCode" name="stateCode" value="${recNoticeVO.state_code }">
			<input type="hidden" id="ing" name="ing" value="${recNoticeVO.ing }">
			<input type="hidden" id="fileInfo" name="fileInfo" value='<c:out value="${recNoticeVO.att_file_save_path }${recNoticeVO.att_file_name }"/>' />
            <input type="hidden" id="att_file_orig_name" name="att_file_orig_name" value='<c:out value="${recNoticeVO.att_file_orig_name }"/>' />
		<table>
				<tr>
					<td style="padding:25 0 0 25" width="657">
						<!-- #### title #### -->
						<table border="0" cellpadding="0" cellspacing="0" class="mgn_b01">
							<tr>
								<td background="/KCC_RMS/images/rms/kcc/bg_subTitle.gif">
									<table width="657" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="76"><img src="/KCC_RMS/images/rms/kcc/title_news.gif"></td>
											<td valign="top" style="padding-top:6"><img src="/KCC_RMS/images/rms/kcc/bg_newsExp.gif"></td>
											<td align="right" class="history"><a href="#" class="history">Home</a> >  <a href="#" class="history">기업정보</a> > <a href="#" class="history">채용정보</a> > <span class="history"><strong>채용뉴스</strong></span></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<!-- #### //title #### -->
						<!-- #### view #### -->
						<table border="0" cellpadding="0" cellspacing="0" width="100%" class="box_01">
							<tr>
								<td class="t_brown bl" colspan="5" style="padding:11px 12px 0 11px">${recNoticeVO.rec_noti_title }</td>
							</tr>
							<tr height="20">
								<td>&nbsp;</td>
								<td width="71" class="bg_bar01"><img src="/KCC_RMS/images/rms/kcc/txt_date01.gif"></td>
								<td width="75"><fmt:formatDate value="${recNoticeVO.announce_date }" pattern="yyyy-MM-dd" /></td>
								<td width="51" class="bg_bar01"><img src="/KCC_RMS/images/rms/kcc/txt_date02.gif"></td>
								<td width="142">
										<fmt:formatDate value="${recNoticeVO.rec_start_date }" pattern="yyyy-MM-dd" />
																	~
										<fmt:formatDate value="${recNoticeVO.rec_end_date }" pattern="yyyy-MM-dd" />
								</td>
							</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td class="view_01 t_gray lh_01">
<!-- 									<style='t_gray1 t_g12 lh_03'> -->
										<textarea class="form-control" rows="20">${recNoticeVO.rec_noti_content }</textarea>
<!-- 									</style> -->
								</td>
							</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="100%" class="box_02">
							<tr height="25">
								<td width="70" class="aln_st01 bg_bar02"><img src="/KCC_RMS/images/rms/kcc/txt_file.gif"></td>
								<td class="t_gray tbpad_01">
									  <c:choose>
		                                    <c:when test="${recNoticeVO.att_file_no == 'FILE00000' }">
		                                    		<c:out value="첨부파일이 없습니다."></c:out>
		                                    </c:when>
		                                    <c:otherwise>
		                                    		<a href="#" onclick="fileDown()"><u>${recNoticeVO.att_file_orig_name }</u></a>
		                                    </c:otherwise>
	                                   </c:choose>
								</td>
							</tr>
						</table>
						<!-- #### //view #### -->
						<!-- #### 여백 #### -->
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr><td class="h_01"></td></tr>
						</table>
						<!-- #### //여백 #### -->
						<!-- #### button & 페이징 #### -->
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td width="60" class="lpad_02"><a><img src="/KCC_RMS/images/rms/kcc/btn_list.gif" onclick="gotolist()"></a></td>
								<td width="300"  class="aln_st01 tpad_01">
									<!-- #### 페이징 #### -->
									<!-- #### //페이징 #### -->
								</td>
								<td width="250" class="rpad_02 aln_st02">								
								  
<!-- 									<button type="button" onclick="recCheck()"  onfocus="this.blur();"> -->
											<a><img src="/KCC_RMS/images/rms/kcc/btn_online.gif" onclick="recCheck()"></a>
<!-- 									</button>&nbsp;&nbsp;&nbsp; -->
<!-- 									<a href="./userNoticeList.do" onfocus="this.blur();"><img src="/KCC_RMS/images/rms/kcc/btn_modify01.gif"></a> -->
								  </td>
							</tr>
						</table>
						<!-- #### //button & 페이징 #### -->
					</td>
				</tr>
			</table>
			<!-- #### //body #### -->

			<!-- #### 여백 #### -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td class="h_04"></td></tr>
			</table>
			<!-- #### //여백 #### -->

			<!--table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td></td>
				</tr>
			</table-->
		</td>
	</tr>
	<tr>
		<td colspan=2 height="100%"></td>
	</tr>
</table>
	
</body>
</html>
