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
<script language="javascript"> 
// 	msemb = new MS_Embed(); 
// 	msemb.init('../flash/subTop1.swf?mainMenu=5&subMenu=7','687','79'); 
// 	msemb.parameter('wmode','transparent');  
// 	msemb.show(); 
</script>
</div>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="">
	<tr>
			<td colspan="2" valign="top"
				background="/KCC_RMS/images/rms/kcc/bg_subTop.gif">
				<!-- #### 상단 메뉴 #### -->

				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="900" height="75"
							background="/KCC_RMS/images/rms/kcc/bg_subTopVisual.jpg"
							valign="top">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td style="padding-top: 21; padding-left: 31" valign="top"><a
										href="http://main.kcc.co.kr/index.asp" onfocus="this.blur();"><img
											src="/KCC_RMS/images/rms/kcc/ci_top.jpg" border="0"></a></td>
									<td width="100%" align="right" valign=top>
										<table border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td height="9"></td>
											</tr>
											<tr>
												<!-- 맨 윗줄 -->
												<td>
														<a href="http://www.kcc.co.kr" onfocus="this.blur()">
														<img src="/KCC_RMS/images/rms/kcc/btn_topHerb.gif" border="0">
														</a>
														<img src="/KCC_RMS/images/rms/kcc/img_clon.gif">
														<a href="javascript:openWin('http://main.kcc.co.kr/history/history.html', 'history', 'width=990,height=720,scrollbars=no');" onfocus="this.blur();">
														<img	 src="/KCC_RMS/images/rms/kcc/btn_topHistory.gif" border="0">
														</a> 
														<a href="http://main.kcc.co.kr/about/ceo_profile.asp" onfocus="this.blur();">
														<img src="/KCC_RMS/images/rms/kcc/btn_topCeo.gif" border="0">
														</a>
														<a href="http://main.kcc.co.kr/about/contact.asp" onfocus="this.blur();">
														<img	 src="/KCC_RMS/images/rms/kcc/btn_topContact.gif" border="0">
														</a> 
														<a href="http://main.kcc.co.kr/etc/sitemap.asp" onfocus="this.blur();">
														<img	 src="/KCC_RMS/images/rms/kcc/btn_topSitemap.gif"	border="0">
														</a> 
														<a href="http://main.kcc.co.kr/eng/index.html" target="_blank" onfocus="this.blur();">
														<img	 src="/KCC_RMS/images/rms/kcc/btn_topEng.gif" border="0">
														</a>
												</td>
											</tr>
											<tr>
												<td height="36"></td>
											</tr>
											<tr>
												<!-- 두번째 줄 -->
												<td align="right">
													<a href="http://main.kcc.co.kr/about/sub_main.asp">
													<img src="/KCC_RMS/images/rms/kcc/btn_topAbout_o.jpg" alt="" border=0 id=top1>
													</a>
													<a href="http://main.kcc.co.kr/product/sub_main.asp" onfocus="this.blur()" onmouseover="top2.src='/KCC_RMS/images/rms/kcc/btn_topProduct_o.jpg'"	 onmouseout="top2.src='/KCC_RMS/images/rms/kcc/btn_topProduct.jpg'">
													<img src="/KCC_RMS/images/rms/kcc/btn_topProduct.jpg" alt="" border=0 id=top2>
													</a> 
													<a href="http://main.kcc.co.kr/customer/sub_main.asp" onfocus="this.blur()"	onmouseover="top3.src='/KCC_RMS/images/rms/kcc/btn_topCustomer_o.jpg'" onmouseout="top3.src='/KCC_RMS/images/rms/kcc/btn_topCustomer.jpg'">
													<img src="/KCC_RMS/images/rms/kcc/btn_topCustomer.jpg" alt="" border=0 id=top3>
													</a>
												</td>
											</tr>
										</table>
									</td>

									<td width="150"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="900" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="32" bgcolor="#3F3214"></td>
									<td width="181" height="31" valign="top" bgcolor="#3F3214"
										class="pad_leftTopTitle"><img
										src="/KCC_RMS/images/rms/kcc/title_about.gif"></td>
									<td width="687" bgcolor="#A08B60">&nbsp;여기 움직이는 이미지들이 필요한데
										안보인다..왤까..</td>
								</tr>
							</table>
						</td>
					</tr>
				</table> 
				<!-- #### //상단 메뉴 #### -->
			</td>
		</tr>
		<tr>
			<td width="219" height="254" class="subLeftBase" valign="top">
				<!-- #### 좌측 메뉴 #### -->

				<table width="188" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td><img
							src="/KCC_RMS/images/rms/kcc/img_leftTitleRecruit.gif"></td>
					</tr>
					<tr>
						<td height="21"></td>
					</tr>
					<tr>
						<td><a href="https://main.kcc.co.kr/recruit/news.asp"
							onfocus="this.blur()"
							onmouseover="m1.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit1_o.gif'"
							onmouseout="m1.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit1.gif'"><img
								src="/KCC_RMS/images/rms/kcc/img_leftMenuRecruit1.gif" alt=""
								border="0" id="m1"></a></td>
					</tr>
					<tr>
						<td height="14"></td>
					</tr>
					<tr>
						<td><a href="http://main.kcc.co.kr/recruit/process.asp"
							onfocus="this.blur()"
							onmouseover="m2.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit2_o.gif'"
							onmouseout="m2.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit2.gif'"><img
								src="/KCC_RMS/images/rms/kcc/img_leftMenuRecruit2.gif" alt=""
								border="0" id="m2"></a></td>
					</tr>
					<tr>
						<td height="14"></td>
					</tr>
					<tr>
						<td><a href="http://main.kcc.co.kr/recruit/talent.asp"
							onfocus="this.blur()"
							onmouseover="m3.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit3_o.gif'"
							onmouseout="m3.src=/KCC_RMS/images/rms/kcc/img_leftMenuRecruit3.gif'"><img
								src="/KCC_RMS/images/rms/kcc/img_leftMenuRecruit3.gif" alt=""
								border="0" id="m3"></a></td>
					</tr>
					<tr>
						<td height="14"></td>
					</tr>
					<tr>
						<td><a href="http://main.kcc.co.kr/recruit/welfare.asp"
							onfocus="this.blur()"
							onmouseover="m4.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit4_o.gif'"
							onmouseout="m4.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit4.gif'"><img
								src="/KCC_RMS/images/rms/kcc/img_leftMenuRecruit4.gif" alt=""
								border="0" id="m4"></a></td>
					</tr>
					<tr>
						<td height="14"></td>
					</tr>
					<tr>
						<td><a href="https://main.kcc.co.kr/recruit/online.asp"
							onfocus="this.blur()"
							onmouseover="m5.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit5_o.gif'"
							onmouseout="m5.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit5.gif'"><img
								src="/KCC_RMS/images/rms/kcc/img_leftMenuRecruit5.gif" alt=""
								border="0" id="m5"></a></td>
					</tr>
					<tr>
						<td height="14"></td>
					</tr>
					<tr>
						<td><a href="https://main.kcc.co.kr/recruit/successful.asp"
							onfocus="this.blur()"
							onmouseover="m6.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit6_o.gif'"
							onmouseout="m6.src='/KCC_RMS/images/rms/kcc/img_leftMenuRecruit6.gif'"><img
								src="/KCC_RMS/images/rms/kcc/img_leftMenuRecruit6.gif" alt=""
								border="0" id="m6"></a></td>
					</tr>
					<tr>
						<td height="14"></td>
					</tr>
					<tr>
						<td><a href="https://main.kcc.co.kr/recruit/qna.asp"
							onfocus="this.blur()"><img
								src="/KCC_RMS/images/rms/kcc/img_leftMenuRecruit7_o.gif" alt=""
								border="0" id="m7"></a></td>
					</tr>
					<tr>
						<td height="46"></td>
					</tr>
					<tr>
						<td><a
							href="javascript:openWin('http://main.kcc.co.kr/history/history.html', 'history', 'width=990,height=720,scrollbars=no');"
							onfocus="this.blur();"><img
								src="/KCC_RMS/images/rms/kcc/btn_history.gif" border="0"></a></td>
					</tr>
					<tr>
						<td><a href="http://main.kcc.co.kr/about/open.asp"
							onfocus="this.blur();"><img
								src="/KCC_RMS/images/rms/kcc/btn_webzine.gif" border="0"></a></td>
					</tr>
					<tr>
						<!--td><a href="http://www.kcc.co.kr/ob/" onfocus="this.blur();" target="_blank"><img src="../imgs/common/btn_ob.gif" border="0"></a></td-->
						<td><a href="#" onfocus="this.blur();"><img
								src="/KCC_RMS/images/rms/kcc/btn_ob.gif" border="0"></a></td>
					</tr>
					<tr>
						<td height="3"></td>
					</tr>
					<tr>
						<td><a
							href="javascript:openWin('../chairman/chairman.html', 'chairman', 'width=930,height=550,scrollbars=no');"
							onfocus="this.blur();"><img
								src="/KCC_RMS/images/rms/kcc/banner_chairman.jpg" border="0"></a></td>
					</tr>
					<!--tr><td height="100%"></td></tr-->
				</table> 
				<!-- #### //좌측 메뉴 #### -->
			</td>
			<td width=100% valign=top>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="39"
							background="/KCC_RMS/images/rms/kcc/bg_subBodyTop.gif">&nbsp;</td>
					</tr>
				</table> <!-- #### body #### -->
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
							<!-- #### 오늘의 날짜 및 글쓰기 #### -->
							<h1>여기가 본문 시작</h1>
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
							<!-- #### //오늘의 날짜 및 글쓰기 #### -->
							
							<span style="float: right;">
								<table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<form name="frm" method="post">
											<input type="hidden" name="kind" value="1"> <input
												type="hidden" name="Page" value="1"> <input
												type="hidden" name="PK" value=""> <input
												type="hidden" name="secret" value="0"> <input
												type="hidden" name="Pwd" value="">
											<td class="lpad_02"><select size="" name="sTextKind"
												class="sel_st01" style="width: 65px">
													<option value="">선택</option>
													<option value="Write_Name">작성자</option>
													<option value="Title">제목</option>
													<option value="Content">내용</option>
											</select></td>
											<td class="lrpad_01"><input type="text" name="sText"
												class="ipt_st01" style="width: 131px" value=""></td>
											<td><a href="javascript:search();"
												onfocus="this.blur();"><img
													src="/KCC_RMS/images/rms/kcc/btn_search.gif"></a></td>
										</form>
									</tr>
								</table>
							</span>
							
							
							
							 <!-- #### table #### -->

							<table border="0" cellpadding="0" cellspacing="0" width="100%"
								class="tbl_01">
							<colgroup>
                                <col style="width:10%" class="aln_st01" />
                                <col style="width:15%" class="aln_st01" />
                                <col style="width:*%" class="aln_st01" />
                                <col style="width:15%" class="aln_st01" />
                                <col style="width:15%" class="aln_st01" />
                                <col style="width:10%" class="aln_st01" />
<%--                                 <col style="width:10%" /> --%>
                            </colgroup>
                            
<%-- 								<col width="60" class="aln_st01"> --%>
<%-- 								<col class="lpad_01"> --%>
<%-- 								<col width="80" class="aln_st01"> --%>
<%-- 								<col width="80" class="aln_st01"> --%>
<%-- 								<col width="60" class="aln_st01"> --%>
								<!-- #### thead #### -->
								<tr>
									<th class="lb">	
									<img src="/KCC_RMS/images/rms/kcc/txt_num.gif"></th>
									<th>Q&A 유형</th>
									<th><img src="/KCC_RMS/images/rms/kcc/txt_subject.gif"></th>
									<th><img src="/KCC_RMS/images/rms/kcc/txt_date.gif"></th>
									<th><img src="/KCC_RMS/images/rms/kcc/txt_writer.gif"></th>
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
							</table> <!-- #### //table #### --> <!-- #### 여백 #### -->

							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="h_01"></td>
								</tr>
							</table> 
							<!-- #### //여백 #### --> 
							<!-- #### search #### --> 


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
				</table> <!-- #### //body #### --> <!-- #### 여백 #### -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="h_04"></td>
					</tr>
				</table> <!-- #### //여백 #### --> <!--table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
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
	

</body>
</html>