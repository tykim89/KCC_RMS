<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>채용관리시스템</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rms/cmn/base.css'/>" />

<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
 
 <script type="text/javascript">
	
	
/* 	function listSearch(){
		$("#listform").attr("action", "<c:url value='/rms/faq/faqList.do'/>").submit();
	} */
	
	
	/* 글 목록 화면 function */
	function fn_egov_selectList() {
		document.listForm.action = "<c:url value='/rms/faq/faqList.do'/>";
	   	document.listForm.submit();
	}

	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo){
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/rms/faq/faqList.do'/>";
	   	document.listForm.submit();
	}

	
 </script>
 
</head>

<body onload="firstMenuList();">
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"/>
<!-- 	<header>header:시작
    	<div dlass="hWrap">hwrap:시작
            <h1><a href="#" class="ir">demo</a></h1>
            <nav id="gnb">gnb:시작
                <ul class="gnbLst">
                    <li>
                        <h2 class="oD_1"><a href="#" >홈페이지관리</a></h2>
                    </li>
                    <li>
                    	<h2 class="oD_2"><a href="#">지원서관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_3"><a href="#">계정관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_4"><a href="#" class="on">항목관리</a></h2>
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
    	<!-- <section id="contL">
        	<nav id="lnb">gnb:시작
            	<h1><a class="lnb_h1_4">홈페이지관리</a></h1>
                <ul>
                	<li class="on"><h2><a href="#" class="on">채용소식관리</a></h2></li>
                    <li class=""><h2><a href="#">채용공고관리</a></h2></li>
                    <li class=""><h2><a href="#">Q&A 관리</a></h2></li>
                    <li class=""><h2><a href="#">FAQ 관리</a></h2></li>
                </ul>
            </nav>gnb:끝
        </section>//contL:끝 -->
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 홈페이지관리 &gt; <strong>FAQ관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>FAQ관리</h1>
                <div class="contents">
                	<div class="listSearch">
	                	<!--//테이블2-->
	                    <div class="listSearch mt10">
	                        <div class="listSearch_pos">
								<form:form commandName="pagingVO" name="listForm" method="post">
	                                <fieldset>
	                                    <legend>선택</legend>
	                                    	<!-- <select name="searchKey" class="slt_search">
												<option value="faq_type_code">질문유형</option>
												<option value="faq_quest_content">제목</option>
												<option value="writer">작성자</option>
											</select>  -->
	                                    	<form:select path="searchCondition" class="slt_search">
												<form:option value="" label="선택" />
												<form:option value="faq_type_code" label="질문유형" />
												<form:option value="faq_quest_content" label="제목" />
												<form:option value="writer" label="작성자" />
											</form:select>
	                                    <form:input path="searchKeyword" type="text" class="ipt_search"  />
	                                    <input type="image" src="/KCC_RMS/images/rms/cmn/btn/btn_search.gif" onclick="fn_egov_selectList()" alt="검색" />
	                                </fieldset>
								
	                        </div>
	                   	</div>
                   	</div>

                    <div class="listType2 mt10">
                        <table>
                            <caption>채용절차관리</caption>
                            <colgroup>
                                <col style="width:5%"/>
                                <col style="width:15%" />
                                <col style="width:*%" />
                                <col style="width:10%" />
                                <col style="width:15%"/>
                            </colgroup>
                            <thead>
                                <tr> 
                                    <th scope="col">번 호</th>
                                    <th scope="col">질문유형</th>
                                    <th scope="col">질문제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col" class="last">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty faqList }">
                            		<tr class="odd" >
                            			<a href="#">게시글이 없습니다.</a>
                            		</tr>
                            		</c:when>
                            		<c:otherwise>
		                           		<c:forEach items="${faqList }" var="flist" varStatus="st">
		                                <tr class="even" onclick="location.href='faqContent.do?faq_no=${flist.faq_no }'">
		                                    <td class="num">${flist.no }</td>
		                                    <td class="tb_style_1">${flist.faq_type_name}</td>
		                                    <td class="left">${flist.faq_quest_content }</td>
		                                    <td class="tb_style_1">${flist.writer }</td>
		                                    <td class="last num"><fmt:formatDate value="${flist.write_date }" pattern="yyyy-MM-dd"/> </td>
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
                        		<a class="" href="#" onclick="document.location.href='./insertFaqForm.do'"><span class="ico_v"></span>FAQ 등록</a>
                        	</span>
                        </div><!--//paging_right-->  
                        <br>
                        <div id="paging">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
							<form:hidden path="pageIndex" />
						</div>
						
					</form:form>
<!-- 				    	<div class="paging">
							<a href="#" class="prev"><img src="/KCC_RMS/images/rms/cmn/btn/btn_prev.gif" alt="이전"></a>
							<span class="current" >1</span>
                            <span><a href="#" >2</a></span>
                            <span><a href="#" >3</a></span>
                            <span><a href="#" >4</a></span>
                            <span><a href="#" >5</a></span>
                            <span><a href="#" >6</a></span>
                            <span><a href="#" >7</a></span>
                            <span><a href="#" >8</a></span>
                            <span><a href="#" >9</a></span>
                            <span><a href="#" >10</a></span>
                            <a href="#"class="next"><img src="/KCC_RMS/images/rms/cmn/btn/btn_next.gif" alt="다음"></a>
						</div>//paging   -->
						
				    </div><!--//pager-->
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
	<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>

</body>
</html>


