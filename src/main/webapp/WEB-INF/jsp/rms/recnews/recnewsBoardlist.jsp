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
/* function init()
{
	if($("#message").val() != "")
	{
		alert($("#message").val());
	}
} */
	function checkAll(bool){
// 	alert(bool);	
	var doc = document.getElementsByName("checkSell");
	for ( var i = 0; i < doc.length; i++) {
		doc[i].checked = bool;
	}
}
	
	function recnewsdelete(){
		if(confirm('<spring:message code="common.delete.msg"/>')){			
	   	document.listForm.action = "<c:url value='./recnewsDeleteBoard.do'/>";
	   	document.listForm.submit();		
		}
	}
	
// 	$(document).ready(function() {
// 		$("#recnewsdelete").click(function() {
// 			$("#recnewsboard").attr("action","<c:url value='./recnewsdeleteboard.do'/>").submit();
// 			})
// 	})
	
		$(document).ready(function() {
			$("#searchbutton").click(function() {
				$("#listSearch").attr("action","<c:url value='./recnewsBoardlist.do'/>").submit();
				})
		})
		
	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo){
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/rms/recnews/recnewsBoardlist.do'/>";
	   	document.listForm.submit();
	}
	
	/* 글 목록 화면 function */
	function fn_egov_selectList() {
		document.listForm.action = "<c:url value='/rms/recnews/recnewsBoardlist.do'/>";
	   	document.listForm.submit();
	}
</script>
</head>
<!-- <body onload="fnInit();"> -->
<body onload="firstMenuList();">
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"  />
<!-- 	<header>header:시작
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
 <%--    	<section id="contL">
        	<nav id="lnb"><!--gnb:시작-->
            	<h1><a class="lnb_h1_1">홈페이지관리</a></h1>
                <ul>
                	<li class="on"><h2><a href="#" class="on">채용소식관리</a></h2></li>
                    <li class=""><h2><a href="#">채용공고관리</a></h2></li>
                    <li class=""><h2><a href="#">Q&A 관리</a></h2></li>
                    <li class=""><h2><a href="#">FAQ 관리</a></h2></li>
                </ul>
            </nav><!--gnb:끝-->
        </section><!--//contL:끝--> --%>
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 홈페이지관리 &gt; <strong>채용소식관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>채용소식관리</h1>
            	
            	
                <div class="contents">
                	<div class="listSearch">
                        <div class="listSearch_pos">
<%--                             <form id="listSearch" name="listSearch" class="form_pos" action="./recnewsBoardlist.do"> --%>
								<form:form commandName="pagingVO" name="listForm" method="post">
<%-- 								<input type="hidden" id="message" name="message" value="${message}">								 --%>
								<input type="hidden" id="rec_news_no"name="rec_news_no" />			
                               
									<fieldset>
                                    <legend>선택</legend>
                                    <form:select path="searchCondition" class="slt_search">
                                    		<form:option value="title" label="제목"/>
                                    		<form:option value="content" label = "내용"/>
                                    </form:select>
                                    
<!--                                      <select name="searchCondition" class="slt_search"> -->
<!-- 										<option value="title">제목</option> -->
<!-- 										<option value="content">내용</option>       -->
<!--                                     </select>  -->

									<form:input path="searchKeyword"/>
 									<a href="javascript:fn_egov_selectList();">
									<img onclick="fn_egov_selectList()" src="/KCC_RMS/images/rms/cmn/btn/btn_search.gif">
									</a>
<%-- 									<img src="<c:url value='/KCC_RMS/images/rms/cmn/btn/btn_search.gif'/>"> --%>
									
									
<!--                                     <input type="text" class="ipt_search"id="searchKeyword" name="searchKeyword" value=""/> -->
<!--                                     <input type="image" name="" id="searchbutton"  src="/KCC_RMS/images/rms/cmn/btn/btn_search.gif" alt="검색"> -->
                                </fieldset>
<%--                             </form> --%>

                        </div>
                   	</div>

                    <div class="listType2 mt10">
<%--                     <form id="recnewsBoard" name="recnewsBoard"> --%>

                        <table border="1" class="data">
                            <caption>채용소식관리</caption>
                            <colgroup>
                                <col style="width:5%"/>
                                <col style="width:5%" />
                                <col style="width:*%" />
                                <col style="width:10%" />
                                <col style="width:8%" />
                                <col style="width:8%" />
                                <col style="width:8%" />
                                <col style="width:10%" />
                            </colgroup>
                            <thead>
                                <tr> 
                                    <th scope="col"><input type="checkbox" name="checkAllSEL" onclick="checkAll(this.checked)"/></th>
                                    <th scope="col">번 호</th>
                                    <th scope="col">제 목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">메 인</th>
                                    <th scope="col">허브메인</th>
                                    <th scope="col">프론트</th>
                                    <th scope="col" class="last">등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <c:choose>
                            	<c:when test="${isc==true }">
                            		<tr>
                            			<td class="last num" colspan="8">글이 존재하지 않습니다</td>
                            		</tr>
                            	</c:when>
                            	<c:otherwise>

                            <c:forEach var="list" items="${list}" varStatus="vs">
							<tr>
							<td><input type="checkbox" name="checkSell" value="${list.rec_news_no}"></td>
<%-- 							 <td class="left num">${list.rec_news_no}</td> --%>
							<td>${list.num}</td>
							<td class="left tb_style_1">
							<a href="./recnewsBoarddetail.do?rec_news_no=${list.rec_news_no}&pageIndex=${pagingVO.pageIndex}">
							${list.rec_news_title}</a></td>
							<%-- <td>${list.rec_news_content}</td> --%>
							<%-- <td>${list.rec_news_hits}</td> --%>

							<td class="left">${list.writer}</td>
					
							<c:choose>
								<c:when test="${list.main_view_tf=='T'}">
								<td><img src="/KCC_RMS/images/rms/cmn/btn/btn_O.gif"></td>
								</c:when>
								<c:otherwise>
								<td class="btn_X"></td>
								</c:otherwise>
							</c:choose>
							<%-- <td>${list.hubmain_view_tf}</td> --%>
							<c:choose>
								<c:when test="${list.hubmain_view_tf=='T'}">
								<td><img src="/KCC_RMS/images/rms/cmn/btn/btn_O.gif"></td>
								</c:when>
								<c:otherwise>
								<td class="btn_X">${list.hubmain_view_tf }</td>
								</c:otherwise>
							</c:choose>
							<%-- <td>${list.main_view_tf}</td> --%>
							<c:choose>
								<c:when test="${list.front_view_tf=='T'}">
								<td><img src="/KCC_RMS/images/rms/cmn/btn/btn_O.gif"></td>
								</c:when>
								<c:otherwise>
								<td class="btn_X"></td>
								</c:otherwise>
							</c:choose>
							<%-- <td>${list.front_view_tf}</td> --%>
							<td class="last num"><fmt:formatDate value="${list.write_date}" pattern="yyyy-MM-dd"/></td>
							</tr>
							</c:forEach>
							
							
							</c:otherwise>

                            </c:choose>
<!--                                 <tr class="odd"> -->
<!--                                 	<td><input name="" id="" class="" type="checkbox" /></td> -->
<!--                                     <td class="left num">1</td> -->
<!--                                     <td class="left tb_style_1"><a href="#">합격자 발표가 났습니다.</a></td> -->
<!--                                     <td class="left">관리자</td> -->
<!--                                     <td class="btn_X">N</td> -->
<!--                                     <td class="btn_X">N</td> -->
<!--                                     <td class="btn_X">N</td> -->
<!--                                     <td class="last num">2014.04.23</td> -->
<!--                                 </tr> -->
<!--                                 <tr class="even"> -->
<!--                                 	<td><input name="" id="" class="" type="checkbox" /></td> -->
<!--                                     <td class="left num">2</td> -->
<!--                                     <td class="left tb_style_1"><a href="#">마감일이 연장되었습니다.</a></td> -->
<!--                                     <td class="left">관리자</td> -->
<!--                                     <td class="btn_O">Y</td> -->
<!--                                     <td class="btn_O">Y</td> -->
<!--                                     <td class="btn_X">N</td> -->
<!--                                     <td class="last num">2014.04.23</td> -->
<!--                                 </tr> -->
                             
                            </tbody>
                        </table>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">

                            <span class="btn-pack btn-type_1">
                        	<a class="" href="#" onclick="document.location.href='./recnewsInsertBoardForm.do'"><span class="ico_v"></span>등 록</a>
                        </span>
                        <span class="btn-pack btn-type_4">
                        	<a class="" href="#" id="recnewsDelete" onclick="recnewsdelete()"><span class="ico_x"></span>삭 제</a>
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
<%-- </form>  --%>
</form:form>

<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>





<!-- <form action="./recnewsBoardlist.do"> -->
<!-- 	<select name="searchKey"> -->
<!-- 		<option value="title">제목</option> -->
<!-- 		<option value="content">내용</option> -->
<!-- 	</select> -->
<!-- 	<input type="text" name="searchValue"> -->
<!-- 	<input type="submit" value="검색"> -->
<!-- </form> -->

<!-- <form action="./recnewsDeleteBoard.do" method="post"> -->
	
<!-- 	<table border="1" class="data"> -->
<!-- 		<tr> -->
<!-- 			<th><input type="checkbox" name="checkAllSEL" onclick="checkAll(this.checked)"></th><th>번호</th><th>제목</th><th>내용</th><th>작성일</th> -->
<!-- 			<th>조회수</th><th>허브메인노출</th><th>메인노출</th><th>프론트노출</th> -->
<!-- 		</tr> -->
<%-- 		<c:forEach var="list" items="${list}" varStatus="vs"> --%>
<!-- 			<tr> -->
<%-- 			<td><input type="checkbox" name="checkSell" value="${list.rec_news_no}"></td> --%>
<%-- 			<td>${list.rec_news_no}</td> --%>
<!-- 			<td> -->
<%-- 			<a href="./recnewsBoarddetail.do?rec_news_no=${list.rec_news_no}">${list.rec_news_title}</a></td> --%>
<%-- 			<td>${list.rec_news_content}</td> --%>
<%-- 			<td><fmt:formatDate value="${list.write_date}" pattern="yyyy-MM-dd(E)"/></td> --%>
<%-- 			<td>${list.rec_news_hits}</td> --%>
<%-- 			<td>${list.hubmain_view_tf}</td> --%>
<%-- 			<td>${list.main_view_tf}</td> --%>
<%-- 			<td>${list.front_view_tf}</td> --%>

<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</table> -->
<!-- 	<input type="button" value="등록" onclick="document.location.href='./recnewsInsertBoardForm.do'"> -->
<!-- 	<input type="submit" value="삭제">	 -->
<!-- </form> -->
</body>
</html>