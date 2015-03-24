<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>채용관리시스템</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/rms/cmn/base.css'/>" />
<link rel="stylesheet" type="text/css"
href="<c:url value='/css/rms/cmn/layout.css'/>" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	
// 	function aa(num){
// 		var no = num;	

// 			layPop(qnaTitlePop);

// 	}
	
	function checkAll(bool){
// 	alert(bool);	
	var doc = document.getElementsByName("checkSell");
	for ( var i = 0; i < doc.length; i++) {
		doc[i].checked = bool;
	}
	}
	
	//비밀번호 확인 팝업 창 띄우기
// 	$(document).ready(function (){		
// 		$(pwchk).click(function() {
// 		layPop(qnaTitlePop);					
// 		})		
// 	})

// 	$(document).ready(function (){
		
// 		$(pwchk).click(function() {
// 			alert(num+"aaa");
// 			alert(scr+"bbb");
// 			var quest_no = $("#qna_quest_no").val();
// 			//alert(quest_no);
// 			var quest_sc = $("#qna_quest_scr_tf").val();
// 			//alert(quest_sc);
// 		})		
// 	})

	function aa(num, scr){
				
				$("#qna_quest_no").val(num);
				$("#qna_quest_scr_tf").val(scr);
				var page_num = $("#pageIndex").val();
				//alert(page_num);
				
				
// 				if(scr == 'F'){
// 					var url ="./qnaBoarddetail.do?qna_quest_no="+num+"&pageIndex="+page_num;
// 	 				location.replace = url;


// 				}else{
// 					layPop(qnaTitlePop);
// 				}

				if(scr == 'T'){
					layPop(qnaTitlePop);
				}else{
					var url ="./qnaBoarddetail.do?qna_quest_no="+num+"&pageIndex="+page_num;
	 				location.replace = url;
				}
				
	}
	
	function qnadelete(){
		if(confirm('<spring:message code="common.delete.msg"/>')){			
	   	document.listForm.action = "<c:url value='/rms/qna/qnaDeleteBoard.do'/>";
	   	document.listForm.submit();		
		}
	}

	
	$(document).ready(function() {
			$("#searchbutton").click(function() {
				$("#listSearch").attr("action","<c:url value='./qnaBoardlist.do'/>").submit();
				})
		})

			/* layPop */
			
			function layPop(id){
				
				var layPopH = $(id).height();
				var layPopW = $(id).width();
			
			
				var topPos = (($(window).height() - layPopH) / 2);
				var leftPos  = (($(window).width() - layPopW ) / 2);
				$(id).css({
					'left' : leftPos,
					'top' : topPos
				});
			
				popup_bg();
				$(id).show();
				$("html").css("overflow", "hidden");
				
			}
			function layPopClose(id){
				popup_bg_close();
				$(id).hide();
				$("html").css("overflow", "auto");
			}
			
			
			/* popup_bg */
			function popup_bg(){
				$(".popup_bg").height(($(document).height()));
				$(".popup_bg").show();
			}
			function popup_bg_close(){
				$(".popup_bg").hide();
			}

			
			function checkQnaPW(){
				
				var quest_no = $("#qna_quest_no").val();
				var quest_pw = $("#qna_quest_pw").val();
				var page_no = $("#pageIndex").val();
// 				alert("페이지번호 : "+page_no);
				 $.post("<c:url value='/rms/qna/qnaboard/checkPW.do'/>", {qna_quest_no : quest_no,qna_quest_pw : quest_pw}, function(xml)
		                  {						
					 			if($(xml).find('check').text()==0)
					 			{
					 				alert("비밀번호 불일치");
					 				layPopClose(qnaTitlePop);
					 			}else
					 			{
					 				

					 				//$("#inputpw").attr("action","<c:url value='/rms/qna/qnaBoarddetail.do'/>").submit();
					 				//$("#inputpw").submit();
							
					 				var url ="./qnaBoarddetail.do?qna_quest_no="+quest_no+"&pageIndex="+page_no;
					 				location.replace(url);
					 				$("#qna_quest_pw").val("");
					 				var temp = $("#qna_quest_pw").val();
// 					 				alert(temp+"비밀번호 초기화 완료");

					 			}
		                  });
			}
			
			
			/* pagination 페이지 링크 function */
			function fn_egov_link_page(pageNo){
				document.listForm.pageIndex.value = pageNo;
				document.listForm.action = "<c:url value='/rms/qna/qnaBoardlist.do'/>";
			   	document.listForm.submit();
			}
			/* 글 목록 화면 function */
			function fn_egov_selectList() {
				document.listForm.action = "<c:url value='/rms/qna/qnaBoardlist.do'/>";
			   	document.listForm.submit();
			}
</script>
</head>
<body onload="firstMenuList();">
<a href=""/>
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"/>
<!-- <header>header:시작
    	<div dlass="hWrap">hwrap:시작
            <h1><a href="#" class="ir">demo</a></h1>
            <nav id="gnb">gnb:시작
                <ul class="gnbLst">
                    <li>
                        <h2 class="oD_1"><a href="#" class="on" >홈페이지관리</a></h2>
                    </li>
                    <li>
                    	<h2 class="oD_2"><a href="#">지원서관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_3"><a href="#">계정관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_4"><a href="#">항목관리</a></h2>
                    </li>
                    <li>
                    	<h2 class="oD_5"><a href="#">통계관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_6"><a href="#">코드관리</a></h2>
                    </li>
                    <li>
                    	<h2 class="oD_7"><a href="#">서비스관리</a></h2>
                    </li>
                </ul>
            </nav>//gnb:끝
			<div class="utility">
                <a href="#"  class="btn_log">Logout</a>
            </div>
    	</div>//hwrapr:끝
	</header>//header:끝 -->
    <div id="wrap">
    <jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>
    	<%-- <section id="contL">
        	<nav id="lnb"><!--gnb:시작-->
            	<h1><a class="lnb_h1_1">홈페이지관리</a></h1>
                <ul>
                	<li class=""><h2><a href="#" class="">채용소식관리</a></h2></li>
                    <li class=""><h2><a href="#">채용공고관리</a></h2></li>
                    <li class="on"><h2><a href="#" class="on">Q&A 관리</a></h2></li>
                    <li class=""><h2><a href="#">FAQ 관리</a></h2></li>
                </ul>
            </nav><!--gnb:끝-->
        </section><!--//contL:끝--> --%>
			<section id="contR"><!--contR:시작-->
			<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 홈페이지관리 &gt; <strong>Q&A 관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>

<article>
            	<h1>Q&A 관리</h1>
                <div class="contents">
                	<div class="listSearch">
                        <div class="listSearch_pos">
<!--                             <form id="listSearch" name="listSearch" action="./qnaBoardlist.do"> -->
						<form:form commandName="pagingVO" name="listForm" method="post">	
                        	
                                <fieldset>
                                    <legend>선택</legend>
<!--                                     <select id="searchCondition" name="searchCondition"> -->
<!--                                        <option value="title">제목</option> -->
<!-- 										<option value="content">내용</option> -->
<!--                                     </select>  -->

<!--                                     <input type="text" id="searchKeyword" name="searchKeyword"> -->
<!--                                     <input type="image" name="" id="searchbutton"  src="./webapp/images/rms/cmn/btn/btn_search.gif" alt="검색"> -->
                               
                                     <form:select path="searchCondition" class="slt_search">
                                    		<form:option value="title" label="제목"/>
                                    		<form:option value="content" label = "내용"/>
                                    		<form:option value="writer" label="작성자"></form:option>
                                    </form:select>
                                   <form:input path="searchKeyword"/>
									<a href="javascript:fn_egov_selectList();">
									<img onclick="fn_egov_selectList()" src="/KCC_RMS/images/rms/cmn/btn/btn_search.gif">
									</a>
                               

                               
                                </fieldset>
<!--                             </form> -->
                        </div>
                   	</div>

                    <div class="listType2 mt10">     
<!--                             <form name="qnaBoard" action="./qnaDeleteBoard.do" method="post" id="qnaBoard"> -->
<%--                             <input type="hidden" id="qna_quest_scr_tf" name="qna_quest_scr_tf" value="${list.qna_quest_scr_tf}"> --%>
							<table border="1" class="data">
                            <colgroup>
                                <col style="width:5%"/>
                                <col style="width:5%" />
                                <col style="width:10%" />
                                <col style="width:*%" />
                                <col style="width:10%" />
                                <col style="width:10%" />
                                <col style="width:8%" />
<%--                                 <col style="width:10%" /> --%>
                            </colgroup>
                            <thead>
                                <tr> 
                               		<th scope="col"><input type="checkbox" name="checkAllSEL" onclick="checkAll(this.checked)"></th>
                                    <th scope="col">번 호</th>
                                    <th scope="col">Q&A 유형</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">작성일</th>
                                    <th scope="col" class="last">조회수</th>
<!--                                     <th scope="col" class="last">등록일</th> -->
                                </tr>
                            </thead>
                            <tbody>
                            
                            <c:choose>
                            	<c:when test="${isc==true }">
                            		<tr>
                            			<td class="last num" colspan="7">글이 존재하지 않습니다</td>
                            		</tr>
                            	</c:when>
                            	<c:otherwise>                         		
		                           		<c:forEach var="list" items="${list}" varStatus="vs">
		                                <tr class="odd">
		                                    <td><input type="checkbox" id="checkSell" name="checkSell" value="${list.qna_quest_no}"></td>
		                                    <td class="left">${list.num}</td>
		                                    <td>${list.qna_type_code}</td>
		                                    <td  class="left tb_style_1">
<%-- 		                                    	<a id="pwchk" href="#" onclick="aa('${list.qna_quest_no}','${list.qna_quest_scr_tf}')"  tabindex="7"> --%>
													<a id="" href="#" onclick="aa('${list.qna_quest_no}','${list.qna_quest_scr_tf}')"  tabindex="7">
		                                    		${list.qna_quest_title}&nbsp;
		                                    		<c:if test="${list.reple_cnt!=0}">
		                                    			[${list.reple_cnt }]		                                    			
		                                    		</c:if>
		                                    	</a>
		                                    </td>
		                                    <td class="left">${list.writer}</td>
		                                    <td><fmt:formatDate value="${list.write_date}" pattern="yyyy-MM-dd"/></td>
		                                    <td class="last num">${list.qna_quest_hits}</td>
		<!--                                     <td class="last num">2014.04.23</td> -->
		                                </tr>
		                                </c:forEach>
                            	</c:otherwise>
                            </c:choose>
                            
                            
                            
                            </tbody>
                        </table>
                    </div><!--//테이블2-->

                    <div class="pager">
                    	<div class="paging_right">
                            <span class="btn-pack btn-type_1">
                        	<a class="" href="#"  onclick="document.location.href='./qnaInsertBoardForm.do'"><span class="ico_v"></span>등 록</a>
                        </span>
                        <span class="btn-pack btn-type_4">
                        	<a class="" id="qnadelete" onclick="qnadelete()"><span class="ico_x"></span>삭 제</a>
                        </span>

                        </div><!--//paging_right--> 
                         
                        <div align="center" style="height: 40px;">
						</div>
						
                        	<div id="paging">
								<ui:pagination paginationInfo = "${paginationInfo}"
										   type="image"
										   jsFunction="fn_egov_link_page"
										   />
								<form:hidden path="pageIndex" />
							</div>
				    </div><!--//pager-->
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
    
</form:form>
<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>

<!-- loding_pop -->
	<div class="layPop" id="loding">
		<div class="loding">
			페이지를 불러오고 있습니다.
			<div class="logo">
				<img src="./common/images/common/logo_loding.gif" alt="로딩 로고" />
			</div>
		</div>
	</div>
	<!-- //loding_pop -->
	

<div class="layPop" id="qnaTitlePop">
		<div class="wrap" style="width: 550px;">
			<div class="cont" >
				<dl class="pop_list">
					<dt>비밀번호 입력</dt>
					<dd>
<!-- 						<div class="con_wrap" style="height: 100px;"> -->
							<div>
							<div class="wcont">
								<div class="listType1 mt10">
									<form action="" method="post" id="inputpw" name="inputpw">
									<input type="hidden"id="qna_quest_no"name="qna_quest_no" value="">
									<table>
										<caption>테이블</caption>
										<colgroup>
											<col style="width: 30%" />
											<col style="width: *%" />
										</colgroup>
										<tr align="center">
											<th scope="row" align="center">비밀번호</th>
											<td align="center"><input type="text" id="qna_quest_pw" name="qna_quest_pw"></td>
										</tr>
									</table>									
								</div>
								<!--//테이블2-->
								<div class="pop_btn">
									<span class="btn-pack btn-type_1"> <a class="" href="#" id="checkpw" onclick="checkQnaPW();"><span
											class="ico_v"></span> 확 인 </a>
									</span>
								</div>
								</form>
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="layPopClose(qnaTitlePop);"><img
						src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
		</div>
	</div>

	<div class="popup_bg"></div>

</body>
</html>