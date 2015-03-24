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
<script language="JavaScript" src="../js/flash.js"></script>
<script language="JavaScript" src="/KCC_RMS/src/main/webapp/js/rms/kcc/selectbox.js"></script>
<script language="JavaScript" src="../js/common2.js"></script>
<script type="text/javascript">
/* 글 목록 화면 function */
function fn_egov_selectList() {
	document.listForm.action = "<c:url value='/rms/qna/qnaBoardlist.do'/>";
   	document.listForm.submit();
}
</script>
<style type="text/css">
.subLeftBase {
	background: url("/KCC_RMS/images/rms/kcc/bg_subLeftMenuBase.jpg")
		no-repeat;
	padding-top: 34px;
	padding-left: 31px;
}
</style>
</head>
<body style="margin: 0">

<div id='layer1' style='width:687; height:79; position:absolute; left:225px; top:66px;'>
<script language="javascript"/>



				<!-- #### body #### -->
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td style="padding: 25 0 0 25" width="657">
							<!-- #### title #### -->

							<table border="0" cellpadding="0" cellspacing="0" class="mgn_b01">
								<tr>
									<td background="/KCC_RMS/images/rms/kcc/bg_subTitle.gif">
										<table width="657" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td width="49"><img
													src="/KCC_RMS/images/rms/kcc/title_qna.gif"></td>
												<td valign="top" style="padding-top: 6"><img
													src="/KCC_RMS/images/rms/kcc/bg_newsExp.gif"></td>
												<td align="right" class="history"><a
													href="../index.asp" class="history">Home</a> > <a
													href="../about/sub_main.asp" class="history">기업정보</a> > <a
													href="../recruit/news.asp" class="history">채용정보</a> > <span
													class="history"><strong>채용 Q&A</strong></span></td>
											</tr>
										</table>
									</td>
								</tr>
							</table> 
							<!-- #### //title #### --> 
							<h1>여기가 본문 시작</h1>

							<form:form commandName="pagingVO" name="listForm" method="post">	
							<span style="float: right;">
                                     <form:select path="searchCondition" class="sel_st01" style="height:20px; width: 65px">
                                    		<form:option value="title" label="제목"/>
                                    		<form:option value="content" label = "내용"/>
                                    		<form:option value="writer" label="작성자"></form:option>
                                    </form:select>
                                   <form:input path="searchKeyword" class="ipt_st01" style="height:15px; width: 131px"/>
									<a href="javascript:fn_egov_selectList();" onfocus="this.blur();">
									<img onclick="fn_egov_selectList()" src="/KCC_RMS/images/rms/kcc/btn_search.gif">
									</a> 
							</span>


                                
							<!-- #### search #### --> 							
<!-- 							<span style="float: right;"> -->
<!-- 								<table border="0" cellpadding="0" cellspacing="0"> -->
<!-- 									<tr> -->
<%-- 										<form name="frm" method="post"> --%>
<!-- 											<input type="hidden" name="kind" value="1"> <input -->
<!-- 												type="hidden" name="Page" value="1"> <input -->
<!-- 												type="hidden" name="PK" value=""> <input -->
<!-- 												type="hidden" name="secret" value="0"> <input -->
<!-- 												type="hidden" name="Pwd" value=""> -->
<!-- 											<td class="lpad_02"> -->
<!-- 											<select size="" name="sTextKind" -->
<!-- 												class="sel_st01" style="width: 65px"> -->
<!-- 													<option value="">선택</option> -->
<!-- 													<option value="Write_Name">작성자</option> -->
<!-- 													<option value="Title">제목</option> -->
<!-- 													<option value="Content">내용</option> -->
<!-- 											</select></td> -->
<!-- 											<td class="lrpad_01"><input type="text" name="sText" -->
<!-- 												class="ipt_st01" style="width: 131px" value=""></td> -->
<!-- 											<td><a href="javascript:search();" -->
<!-- 												onfocus="this.blur();"><img -->
<!-- 													src="/KCC_RMS/images/rms/kcc/btn_search.gif"></a></td> -->
<%-- 										</form> --%>
<!-- 									</tr> -->
<!-- 								</table> -->
<!-- 							</span> -->
							<!-- #### search #### --> 
							
							
							
							 <!-- #### table #### -->

							<table border="0" cellpadding="0" cellspacing="0" width="100%"
								class="tbl_01" style="height: ">
							<colgroup>
                                <col style="width:10%" class="aln_st01" />
                                <col style="width:15%" class="aln_st01" />
                                <col style="width:*%" class="aln_st01" />
                                <col style="width:15%" class="aln_st01" />
                                <col style="width:15%" class="aln_st01" />
                                <col style="width:10%" class="aln_st01" />
                            </colgroup>
                            
								<tr>
									<th class="lb">	
									<img src="/KCC_RMS/images/rms/kcc/txt_num.gif"></th>
									<th>Q&A 유형</th>
									<th><img src="/KCC_RMS/images/rms/kcc/txt_subject.gif"></th>
									<th><img src="/KCC_RMS/images/rms/kcc/txt_writer.gif"></th>
									<th><img src="/KCC_RMS/images/rms/kcc/txt_date.gif"></th>
									<th  class="rb"><img src="/KCC_RMS/images/rms/kcc/txt_inquiry.gif"></th>
									
								</tr>
								<!-- #### //thead #### -->
								<!-- #### 게시물 리스팅 Loop #### -->
								
								<c:forEach var="list" items="${list}" varStatus="vs">
		                                <tr>
		                                    <td align="center">${list.num}</td>
		                                    <td align="center">${list.qna_type_code}</td>
		                                    <td >
		                                    	<a id="pwchk" href="#" onclick="aa('${list.qna_quest_no}','${list.qna_quest_scr_tf}')"  tabindex="7" class="list" onfocus="this.blur();">
		                                    		${list.qna_quest_title}&nbsp;&nbsp;
		                                    		<c:if test="${list.reple_cnt!=0}">
		                                    			[${list.reple_cnt }]		                                    			
		                                    		</c:if>
		                                    	</a>
		                                    </td>
		                                    <td align="center">${list.writer}</td>
		                                    <td align="center"><fmt:formatDate value="${list.write_date}" pattern="yyyy-MM-dd"/></td>
		                                    <td align="center">${list.qna_quest_hits}</td>
		                                </tr>
		                   	 	</c:forEach>

								<!-- #### //게시물 리스팅 Loop #### -->
							</table> 
							<!-- #### //table #### --> 
							
							
							<!-- #### 여백 #### -->
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="h_01"></td>
								</tr>
							</table> 
							<!-- #### //여백 #### --> 

							<!-- #### 글쓰기 #### -->
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td class="rpad_02 aln_st02"><a
										href="/recruit/qna_write.asp" onfocus="this.blur();"><img
											src="/KCC_RMS/images/rms/kcc/btn_write.gif"></a></td>
								</tr>
								<tr>
									<td class="h_05" colspan="2"></td>
								</tr>
							</table> 
							<!-- #### 글쓰기 #### -->


<!-- 							<div id="paging"> -->
<%-- 								<ui:pagination paginationInfo = "${paginationInfo}" --%>
<%-- 										   type="image" --%>

<%-- 										   jsFunction="fn_egov_link_page" --%>
<%-- 										   /> --%>
<%-- 								<form:hidden path="pageIndex" /> --%>
<!-- 							</div> -->
							

						<!-- #### //search #### --> <!-- #### 페이징 #### --> 
<!-- 						<span -->
<!-- 							style="float: right" class="rpad_02"> -->
<!-- 								<table border="0" cellpadding="0" cellspacing="0"> -->
<!-- 									<tr> -->
<!-- 										<td><img src="/KCC_RMS/images/rms/kcc/btn_prev.gif" -->
<!-- 											align="absmiddle"></td> -->
<!-- 										<td class="page_pad t_gray1"><b>1</b> <img -->
<!-- 											src="/KCC_RMS/images/rms/kcc/bar_01.gif"> <a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=2">2</a> -->
<!-- 											<img src="/KCC_RMS/images/rms/kcc/bar_01.gif"> <a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=3">3</a> -->
<!-- 											<img src="/KCC_RMS/images/rms/kcc/bar_01.gif"> <a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=4">4</a> -->
<!-- 											<img src="/KCC_RMS/images/rms/kcc/bar_01.gif"> <a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=5">5</a> -->
<!-- 											<img src="/KCC_RMS/images/rms/kcc/bar_01.gif"> <a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=6">6</a> -->
<!-- 											<img src="/KCC_RMS/images/rms/kcc/bar_01.gif"> <a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=7">7</a> -->
<!-- 											<img src="/KCC_RMS/images/rms/kcc/bar_01.gif"> <a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=8">8</a> -->
<!-- 											<img src="/KCC_RMS/images/rms/kcc/bar_01.gif"> <a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=9">9</a> -->
<!-- 											<img src="/KCC_RMS/images/rms/kcc/bar_01.gif"> <a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=10">10</a> -->
<!-- 										</td> -->
<!-- 										<td><a -->
<!-- 											href="/recruit/qna.asp?sTextKind=&sText=&kind=1&Page=2" -->
<!-- 											onfocus="this.blur();"><img -->
<!-- 												src="/KCC_RMS/images/rms/kcc/btn_next.gif" border="0" -->
<!-- 												align="absmiddle"></a></td> -->
<!-- 									</tr> -->
<!-- 								</table> -->

<!-- 						</span>  -->
<!-- 						#### //페이징 #### -->
						</td>
					</tr>
				</table> 
				<!-- #### //body #### --> 
				<!-- #### 여백 #### -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="h_04"></td>
					</tr>
				</table> <!-- #### //여백 #### --> 
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
		<tr>
			<td colspan=2 background="/KCC_RMS/images/rms/kcc/bg_btm.gif"
				valign="top">
				<!-- #### 하단 #### -->
				<table width="900" height="81" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td style="padding: 15 0 0 28" valign="top"><img
							src="/KCC_RMS/images/rms/kcc/txt_btm.jpg"></td>
						<td style="padding: 14 0 0 0" valign="top"><img
							src="/KCC_RMS/images/rms/kcc/txt_priv.gif" style="cursor: hand;"
							onclick="javascript:openWin('../about/privacy.asp','privacy','width=800,height=600,scrollbars=yes');"></td>
						<td valign="top" style="padding-top: 14"><img
							src="/KCC_RMS/images/rms/kcc/txt_family.jpg"></td>
						<td valign="top" style="padding-top: 14"><script>openSELECT2("relation","onChange=goPG(this.value)",138,19)</script>
							<option value="">KCC관계사 :::</option>
							<option value="http://www.sysone.co.kr/">시스원</option>
							<option value="http://www.kccsecurity.co.kr/">KCC
								Security</option>
							<option value="http://www.hondacarskcc.co.kr">KCC 모터스</option>
							<option value="http://www.jongha.kr/">종하E&C</option>
							<option value="http://www.ksystem.co.kr/">영림원소프트랩</option>
							<option value="http://www.sysware.co.kr/">SYSWARE</option> <script>closeSELECT()</script>
						</td>
					</tr>
				</table>
<!-- 	</table> -->

			<!-- #### //하단 #### -->
		</td>
	</tr>
</table>

</form:form>	

</body>
</html>