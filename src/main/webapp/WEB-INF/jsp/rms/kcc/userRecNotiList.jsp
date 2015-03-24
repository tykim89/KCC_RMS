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

<style>
/* 	.nopadding{ */
/* 		padding-right: 5px; */
/* 		padding-left: 5px; */
/* 	} */
</style>
</head>
<body>
<!-- 	<div class="col-md-offset-1"> -->
<!-- 		<div class="row"> -->
<!-- 			<h2>채용공고</h2> -->
<!-- 		</div> -->
<!-- 	</div><br><br> -->

<%-- 	<form  role="form"> --%>
<%-- 	<input type="hidden" id="ing" name="ing" value="${recNoticeVO.ing }"> --%>
<!-- 		<div class="form-group"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-12"> -->
<!-- 					<div class="col-md-1 col-md-offset-7 nopadding"> -->
<!-- 						<select class="form-control input-sm" id="" name=""> -->
<!-- 							<option value="">선택</option> -->
<!-- 							<option value="">제목</option> -->
<!-- 							<option value="">내용</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-2 nopadding"> -->
<!-- 						<input type="text" class="form-control input-sm" placeholder="검색어" id="" name="" /> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-2 nopadding"> -->
<!-- 						<button type="button" class="btn btn-primary btn-sm" id="" name="">검색</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="col-md-12"> -->
<!-- 				<table class="table table-striped table-hover"> -->
<!-- 					<thead> -->
<!-- 						<th class="text-center">번호</th> -->
<!-- 						<th class="text-center">모집년도</th> -->
<!-- 						<th class="text-center">모집구분</th> -->
<!-- 						<th class="text-center">모집분야</th> -->
<!-- 						<th class="text-center">채용공고 제목</th> -->
<!-- 						<th class="text-center">응시기간</th> -->
<!-- 						<th>진행상태</th> -->
<!-- 					</thead> -->
<!-- 					<tbody> -->
<%-- 						<c:forEach items="${recNoticeList }" var="recNoticeVO"> --%>
<!-- 							<tr -->
<%-- 								onclick="location.href='userNoticeContent.do?rec_noti_no=${recNoticeVO.rec_noti_no }'"> --%>
<%-- 								<td class="text-center">${recNoticeVO.no }</td> --%>
<%-- 								<td class="text-center">${recNoticeVO.rec_year }</td> --%>
<%-- 								<td class="text-center">${recNoticeVO.career_div_code }</td> --%>
<%-- 								<td class="text-center">${recNoticeVO.rec_field_name }</td> --%>
<%-- 								<td class="text-center">${recNoticeVO.rec_noti_title }</td> --%>
<%-- 								<td class="text-center"><fmt:formatDate --%>
<%-- 										value="${recNoticeVO.rec_start_date }" pattern="yyyy-MM-dd" /> --%>
<%-- 									~ <fmt:formatDate value="${recNoticeVO.rec_end_date }" --%>
<%-- 										pattern="yyyy-MM-dd" /></td> --%>
										
<%-- 								<c:choose>	 --%>
<%--                                 	<c:when test="${recNoticeVO.ing == 'Y'}"> --%>
<!--                                     	<td class="text-primary">진행중</span></td> -->
<%--                             		</c:when>		 --%>
<%-- 									<c:otherwise> --%>
<!-- 										<td class="text-danger">마감</span></td> -->
<%--                                 	</c:otherwise> --%>
<%--                                 </c:choose> --%>
                                
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<!-- 					</tbody> -->
<!-- 				</table> -->
<!-- 			</div> -->
<!-- 		</div>	 -->
<%-- 	</form> --%>
	
	
	
	
			<br/><br/>
	<!-- #### body #### -->
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding:25 0 0 25" width="657">
						<!-- #### title #### -->
						<table border="0" cellpadding="0" cellspacing="0" class="mgn_b01">
							<tr>
								<td background="../imgs/common/bg_subTitle.gif">
									<table width="657" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="76"><img src="/KCC_RMS/images/rms/kcc/title_news.gif"></td>
											<td valign="top" style="padding-top:6"><img src="/KCC_RMS/images/rms/kcc/bg_newsExp.gif"></td>
											<td align="right" class="history"><a href="../index.asp" class="history">Home</a> >  <a href="../about/sub_main.asp" class="history">기업정보</a> > <a href="./news.asp" class="history">채용정보</a> > <span class="history"><strong>채용뉴스</strong></span></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<!-- #### //title #### -->
						
						<!-- #### //search #### -->
						<form:form commandName="pagingVO" name="listForm" method="post" >	
								<span style="float: right;" class="lpad_02" >
							               <form:select path="searchCondition">
							              			<form:option value="" label="제목"/>
							              			<form:option value="" label = "내용"/>
							              </form:select>
							             <form:input path="searchKeyword" class="input_style"  style="width:211;height:18"/>
										<a href="javascript:fn_egov_selectList();" onfocus="this.blur();">
											<img onclick="fn_egov_selectList()" src="/KCC_RMS/images/rms/kcc/btn_search.gif">
										</a> 
								</span>
						<!-- #### //search #### -->

						<br/><br/>
						
						<!-- #### table #### -->
						<table border="0" cellpadding="0" cellspacing="0" width="100%" class="tbl_01">
						<input type="hidden" id="ing" name="ing" value="${recNoticeVO.ing }">
<%-- 						<col width="30" class="aln_st01"> --%>
<%-- 						<col width="50" class="aln_st01"> --%>
<%-- 						<col width="70" class="aln_st01"> --%>
<%-- 						<col class="lpad_01"> --%>
<%-- 						<col width="150" class="aln_st01"> --%>
<%-- 						<col width="70" class="aln_st01"> --%>
							<!-- #### thead #### -->
								<th class="lb"><img src="/KCC_RMS/images/rms/kcc/txt_num.gif" align="center"  style="padding-left: 10px;"></th>
<!-- 								<th>모집년도<img src=""></th> -->
								<th><img src="/KCC_RMS/images/rms/kcc/txt_career.gif" style="padding-left: 40px;"></th>
								<th align="center"><img src="/KCC_RMS/images/rms/kcc/txt_recruit01.gif" style="padding-left: 40px;"></th>
								<th align="center"><img src="/KCC_RMS/images/rms/kcc/txt_subject.gif"  style="padding-left: 60px;"></th>
								<th align="center"><img src="/KCC_RMS/images/rms/kcc/txt_acc.gif" style="padding-left: 70px;"></th>								
								<th class="rb"><img src="/KCC_RMS/images/rms/kcc/txt_div.gif" style="padding-left: 10px;"></th>
							<!-- #### //thead #### -->
							<!-- #### 게시물 리스팅 Loop #### -->

							
							<tr><td class="" colspan="5">&nbsp;</td></tr>
							
							<c:forEach items="${recNoticeList }" var="recNoticeVO">
							<tr	onclick="location.href='userNoticeContent.do?rec_noti_no=${recNoticeVO.rec_noti_no }'">
								<td class="text-center">${recNoticeVO.no }</td>
<%-- 								<td class="text-center">${recNoticeVO.rec_year }</td> --%>
								<td class="text-center">${recNoticeVO.career_div_code }</td>
								<td class="text-center">${recNoticeVO.rec_field_name }</td>
								<td class="text-center">${recNoticeVO.rec_noti_title }</td>
								<td class="text-center"><fmt:formatDate
										value="${recNoticeVO.rec_start_date }" pattern="yyyy-MM-dd" />
									~ <fmt:formatDate value="${recNoticeVO.rec_end_date }"
										pattern="yyyy-MM-dd" /></td>
										
								<c:choose>	
                                	<c:when test="${recNoticeVO.ing == 'Y'}">
                                    	<td class="text-primary">진행중</span></td>
                            		</c:when>		
									<c:otherwise>
										<td class="text-danger">마감</span></td>
                                	</c:otherwise>
                                </c:choose>
                                
							</tr>
							<tr><td class="" colspan="5">&nbsp;</td></tr>
						</c:forEach>
							
				
						<!-- #### //게시물 리스팅 Loop #### -->	
						</table>
						<!-- #### //table #### -->
						<!-- #### 여백 #### -->
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr><td class="h_01"></td></tr>
						</table>
						<!-- #### //여백 #### -->
						
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
</form:form>
	
	
</body>
</html>
