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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
		function checkAll(bool){
		// 	alert(bool);	
			var doc = document.getElementsByName("checkSell");
			for ( var i = 0; i < doc.length; i++) {
				doc[i].checked = bool;
			}
			}
	
		$(document).ready(function() {
			$("#searchbutton").click(function() {
				$("#listSearch").attr("action","<c:url value='./qnaFrqBoardlist.do'/>").submit();
				})
		})

// 		$(document).ready(function() {
// 				$("#qnaFrqDelete").click(function() {
// 					$("#qndFrqList").attr("action","<c:url value='./qnaFrqDeleteBoard.do'/>").submit();
// 					})
// 			})
			
		function qnaFrqDelete(){
			if(confirm('<spring:message code="common.delete.msg"/>')){			
	  	 		document.listForm.action = "<c:url value='./qnaFrqDeleteBoard.do'/>";
	   			document.listForm.submit();		
			}
		}
			
			/* pagination 페이지 링크 function */
		function fn_egov_link_page(pageNo){
			document.listForm.pageIndex.value = pageNo;
			document.listForm.action = "<c:url value='/rms/qna/qnafrq/qnaFrqBoardlist.do'/>";
		   	document.listForm.submit();
		}
		
		/* 글 목록 화면 function */
		function fn_egov_selectList() {
			document.listForm.action = "<c:url value='/rms/qna/qnafrq/qnaFrqBoardlist.do'/>";
		   	document.listForm.submit();
		}
</script>
</head>
<body onload="firstMenuList();">

<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"  />

<!-- 	<header>header:시작  -->
<!--     	<div dlass="hWrap">hwrap:시작  -->
<!--             <h1><a href="#" class="ir">demo</a></h1> -->
<!--             <nav id="gnb">gnb:시작  -->
<!--                 <ul class="gnbLst"> -->
<!--                     <li> -->
<!--                         <h2 class="oD_1"><a href="#" class="on" >홈페이지관리</a></h2> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_2"><a href="#">지원서관리</a></h2> -->
<!--                    	</li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_3"><a href="#">계정관리</a></h2> -->
<!--                    	</li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_4"><a href="#">항목관리</a></h2> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_5"><a href="#">통계관리</a></h2> -->
<!--                    	</li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_6"><a href="#">코드관리</a></h2> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_7"><a href="#">서비스관리</a></h2> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </nav>gnb:끝 -->
<!-- 			<div class="utility"> -->
<!--                 <a href="#"  class="btn_log">Logout</a> -->
<!--             </div> -->
<!--     	</div>hwrapr:끝  -->
<!-- 	</header>header:끝  -->



    <div id="wrap">
    
        <jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>
        
<%--     	<section id="contL"> --%>
<!--         	<nav id="lnb">gnb:시작  -->
<!--             	<h1><a class="lnb_h1_1">홈페이지관리</a></h1> -->
<!--                 <ul> -->
<!--                 	<li class="on"><h2><a href="#" class="on">채용소식관리</a></h2></li> -->
<!--                     <li class=""><h2><a href="#">채용공고관리</a></h2></li> -->
<!--                     <li class=""><h2><a href="#">Q&A 관리</a></h2></li> -->
<!--                     <li class=""><h2><a href="#">FAQ 관리</a></h2></li> -->
<!--                 </ul> -->
<!--             </nav>gnb:끝  -->
<%--         </section><!--//contL:끝--> --%>

        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 홈페이지관리 &gt; <strong>동일유형답변관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>동일유형답변 관리</h1>
                <div class="contents">
                	<div class="listSearch">
                        <div class="listSearch_pos">
                        	<form:form commandName="pagingVO" name="listForm" method="post">
                        	<input type="hidden" id="frq_answer_no"name="frq_answer_no" />

<%--                             <form id="listSearch" name="listSearch" action="./qnaFrqBoardlist.do"> --%>
                                <fieldset>
                                    <legend>선택</legend>
                                    <form:select path="searchCondition" class="slt_search">
                                    		<form:option value="type" label="질문유형"/>
                                    		<form:option value="content" label = "답변내용"/>
                                    </form:select>

									<form:input path="searchKeyword"/>
									<a href="javascript:fn_egov_selectList();">
									<img onclick="fn_egov_selectList()" src="/KCC_RMS/images/rms/cmn/btn/btn_search.gif">
                                </fieldset>
<%--                             </form> --%>
                        </div>
                   	</div>

                    <div class="listType2 mt10">
<%--                     	<form action="./qnaFrqDeleteBoard.do" method="post" id="qndFrqList"> --%>
						<input type="hidden" name="frq_answer_no" value="${vo.frq_answer_no}">
						<input type="hidden" name="enable_tf" value="${vo.enable_tf }">
                        <table>
                            <caption>채용소식관리</caption>
                            <colgroup>
                                <col style="width:5%"/>
                                <col style="width:5%" />
                                <col style="width:10%" />
                                <col style="width:*%" />
                                <col style="width:8%" />
                                <col style="width:8%" />
                                <col style="width:8%" />
                                <col style="width:10%" />
                            </colgroup>
                            <thead>
                                <tr> 
                                    <th scope="col"><input type="checkbox" name="checkAllSEL" onclick="checkAll(this.checked)"></th>
                                    <th scope="col">번 호</th>
                                    <th scope="col">질문유형</th>
                                    <th scope="col">Q&A 답변내용</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col" class="last">작성일</th>
<!--                                     <th scope="col" class="last">사용여부</th> -->
		
                                </tr>
                            </thead>
                            <tbody>
                            
						        <c:forEach var="list" items="${list}" varStatus="vs">
								<c:if test="${list.enable_tf=='T'}">
								<tr class="odd">
									<td><input type="checkbox" name="checkSell" value="${list.frq_answer_no}"></td>
									<td class="left num">${list.num}</td>
<%-- 									<td><c:out value="${vs.count}"/></td> --%>
									<td>${list.qna_type_code}</td>
									<td  class="left tb_style_1"><a href="./qnaFrqBoarddetail.do?frq_answer_no=${list.frq_answer_no}">${list.frq_answer_content}</a></td>
									<td class="left">${list.writer}</td>
									<td class="last num"><fmt:formatDate value="${list.write_date}" pattern="yyyy-MM-dd"/></td>
<%-- 									<td  class="last num">${list.enable_tf}</td>									 --%>
								</tr>			
								</c:if>
								</c:forEach>

                            </tbody>
                        </table>
<%--                        </form> --%>
                    </div><!-- 테이블2 -->
                    <div class="pager">
                    	<div class="paging_right">
                        <span class="btn-pack btn-type_1">
                         	<a class="" href="#" onclick="document.location.href='./qnaFrqInsertBoardForm.do'" style="display:none;"><span class="ico_v"></span>등 록</a>                    	
                        </span> 
                      	<span class="btn-pack btn-type_1">
                        	<a class="" href="#" onclick="document.location.href='./qnaFrqInsertBoardForm.do'"><span class="ico_v"></span>등 록</a>
                        </span>
                        <span class="btn-pack btn-type_4">
                        	<a class="" href="#" id="qnaFrqDelete" onclick="qnaFrqDelete()"><span class="ico_x"></span>삭 제</a>
                        </span>
                        </div><!--paging_right    -->
                        <div align="center" style="height: 40px;">
						</div>
				    	<div class="paging">
				    	
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
	
<!--     <footer> -->
<!--         <div class="fWrap"> -->
<!--         	<span>COPYRIGHT ⓒ 2014 <b>CRM.</b></span> -->
<!--         	<span>ALL RIGHT RESERVED.</span> -->
<!--         </div> -->
<!-- 	</footer> -->


<!-- <form action="./qnaFrqBoardlist.do"> -->
<!-- 	<select name="searchKey"> -->
<!-- 		<option value="type">질문유형</option> -->
<!-- 		<option value="content">내용</option> -->
<!-- 	</select> -->
<!-- 	<input type="text" name="searchValue"> -->
<!-- 	<input type="submit" value="검색"> -->
<!-- </form> -->

<!-- <form action="./qnaFrqDeleteBoard.do" method="post" id="qndFrqList"> -->
<%-- <input type="hidden" name="frq_answer_no" value="${vo.frq_answer_no}"> --%>
<%-- <input type="hidden" name="enable_tf" value="${vo.enable_tf }"> --%>
<!-- 	<table border="1"> -->
<!-- 		<tr> -->
<!-- 			<td><input type="checkbox" name="checkAllSEL" onclick="checkAll(this.checked)"></td> -->
<!-- 			<td>번호</td><td>질문유형</td><td>Q&A 답변내용</td> -->
<!-- 			<td>작성자</td><td>작성일</td> -->
<!-- 			<td>사용여부</td> -->
<!-- 		</tr> -->
<%-- 		<c:forEach var="list" items="${list}" varStatus="vs"> --%>
<%-- 		<c:if test="${list.enable_tf=='T'}"> --%>
<!-- 		<tr> -->
<%-- 			<td><input type="checkbox" name="checkSell" value="${list.frq_answer_no}"></td> --%>
<%-- 			<td>${list.frq_answer_no}</td> --%>
<%-- 			<td>${list.qna_type_code}</td> --%>
<%-- 			<td><a href="./qnaFrqBoarddetail.do?frq_answer_no=${list.frq_answer_no}">${list.frq_answer_content}</a></td> --%>
<%-- 			<td>${list.writer}</td> --%>
<%-- 			<td><fmt:formatDate value="${list.write_date}" pattern="yyyy-MM-dd"/></td> --%>
<%-- 			<td>${list.enable_tf}</td> --%>
			
<!-- 		</tr>			 -->
<%-- 		</c:if> --%>
<%-- 		</c:forEach> --%>
<!-- 	</table> -->
<!-- 	<input type="button" value="등록" onclick="document.location.href='./qnaFrqInsertBoardForm.do'"> -->
<!-- 	<input type="submit" value="삭제"> -->
</form>


</body>
</html>