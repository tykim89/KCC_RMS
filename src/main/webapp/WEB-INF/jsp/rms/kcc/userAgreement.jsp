<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<SCRIPT LANGUAGE="JavaScript">

	function rec_submit(){		
		if (frm.agree[0].checked)
		{			
			$("#frm").attr("action","<c:url value='/rms/appdoc/appUserLogin.do'/>").submit();

		}
		else
		{
			alert("개인정보보호정책에 동의하지 않으시면  \n\n 입사지원 하실 수 없습니다.");
			return;
		}
	}


</SCRIPT>
</head>
<body style="margin: 0">

<br/><br/>
<!-- #### body #### -->

			
<%-- 			<h1>${rec_noti_no}</h1> --%>
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
								<td class="lpad_01"><img src="/KCC_RMS/images/rms/kcc/txt_online03_01.gif"></td>
							</tr>
						<!-- #### 여백 #### -->
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr><td class="h_02"></td></tr>
						</table>
						<!-- #### //여백 #### -->
						<!-- #### 개인정보보호정책 #### -->
						<form id="frm" name="frm" method="post">
						<input type="hidden" id="rec_noti_no" name="rec_noti_no" value="${rec_noti_no}">
						<table border="0" cellpadding="0" cellspacing="0">
						<input type="hidden" name="PK" value="291">
						<input type="hidden" name="sec" value="all">
							<tr>
								<td class="lpad_01 tpad_01" valign="top"><img src="/KCC_RMS/images/rms/kcc/txt_policy.gif"></td>
								<td style="padding-left:7px">
								<textarea name="" style="width:550px; height:310px">
케이씨씨정보통신㈜ 가족사(이하 '회사')는 채용 절차 진행을 위하여 아래와 같이 가족사 내에서 입사 지원자의 개인정보, 고유식별정보, 민감정보의 수집 이용에 관한 내용을 관계 법령에 따라 고지하오니 동의하여 주시기 바랍니다.


1. 개인정보 수집 및 이용에 관한 동의
(1) 개인정보 수집 항목
이름(국문,영문,한문), 생년월일, 성별, 국적, 비밀번호, 전화번호(자택,휴대폰,긴급전화), 주소, 이메일, 학력, 전공, 성적, 어학성적,해외경험, 자격사항, 경력사항, 병역사항, 가족사항 등 입사지원서 상 개인정보 관련 항목
(2) 개인정보 수집 및 이용 목적 
- 입사 지원에 따른 본인 확인, 입사지원서의 수정
- 전형 단계 별 본인 안내 및 합격 여부 확인 등 지원자와의 원활한 의사 소통을 위한 정보 활용
(3) 개인정보 보유 및 이용기간 
입사 지원자의 과거 지원 이력 관리 및 인재 Pool을 통해 채용이 필요한 경우 상시 채용을 위한 목적으로 5년 간 보관
(4) 입사 지원자는 개인정보 수집 및 이용과 관련하여 동의를 거부할 권리가 있으며,
동의거부 시 회사는 공정하고 정확한 채용을 진행 할 수 없으므로 입사 지원 등 채용 절차 진행이 불가 합니다.



2. 고유식별정보의 수집 및 이용에 관한 동의
(1) 고유식별 정보 수집 항목 
주민등록번호, 외국인의 경우 외국인등록번호
(2) 고유식별 정보 수집 및 이용 목적 
입사 지원에 따른 본인 확인
(3) 고유식별 정보 보유 및 이용기간 
입사 지원자의 과거 지원 이력 관리 및 인재 Pool을 통해 채용이 필요한 경우 상시 채용을 위한 목적으로 5년 간 보관
(4) 입사 지원자는 고유식별정보의 수집 및 이용과 관련하여 동의를 거부할 권리가 있으며, 동의거부 시 회사는 공정하고 정확한 채용을 진행 할 수 없으므로 입사 지원 등 채용 절차 진행이 불가 합니다.

입사지원자의 고유식별정보(주민등록번호)는 회사 내부 규정 및 지침에 따라 안전한 암호화 방법을 적용하여 저장,관리하고 있습니다. 




3. 민감정보의 수집 및 이용에 관한 동의
(1) 민감정보 수집 항목 
장애 정보(장애 등급 및 장애 유형 등), 소득 정보(기초생활수급대상자 및 차상위계층), 보훈대상 여부
(2) 민감정보 수집 및 이용 목적 
모집 분야 의 특성에 따른 업무 수행 가능 여부 확인 및 채용 단계 별 진행에 있어 필요 시 우대 적용
(3) 민감 정보 보유 및 이용기간 
입사 지원자의 과거 지원 이력 관리 및 인재 Pool을 통해 채용이 필요한 경우 상시 채용을 위한 목적으로 5년 간 보관
(4) 입사 지원자는 민감 정보 수집 및 이용과 관련하여 동의를 거부할 권리가 있으며, 
동의거부 시 회사는 공정하고 정확한 채용을 진행 할 수 없으므로 입사 지원 등 채용 절차 진행이 불가 합니다.

								</textarea></td>
							</tr>
							<tr>
								<td></td>
								<td class="t_gray lpad_02">
									<input type="radio" name="agree" class="ipt_st02">개인정보 정책을 읽었고 동의합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="agree" class="ipt_st02">동의하지 않습니다.
								</td>
							</tr>
							<tr>
								<td class="aln_st02" style="padding-top:27px" colspan="2">
									<a href="javascript:rec_submit();" onfocus="this.blur();">
										<img src="/KCC_RMS/images/rms/kcc/btn_support01.gif" id="btn_support01" name="btn_support01">
									</a>
								</td>
							</tr>
						</table>	
						</form>
						<!-- #### //개인정보보호정책 #### -->
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