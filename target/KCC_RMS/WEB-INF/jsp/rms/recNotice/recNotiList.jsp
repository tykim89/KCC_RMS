<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

	//체크된 값 | 구분자로 연결하여 리턴
	function getCheckedValue() {
		var idList = [];
		var itemStr = "";
		
		$("input[id=fieldCheckBtn]:checked").each(function() {
			idList.push(this.value)
		});

		$.each(idList, function(index, item) {
			itemStr += item + "|"
		});

		return itemStr;
	}

	
	//체크된 값 넘기기
	function selectField() {
		
		var checkedValueId = getCheckedValue();
		
		if (checkedValueId == "" && $("#rec_year option:selected").val() == "" && $("#career_div_code option:selected").val() == "" ) {
			alert('<spring:message code = "common.alert.noSelect" />');
	
		}else {

			$("#selectTarget").val(checkedValueId);
			document.listForm.action = "<c:url value='/rms/recNotice/recNoticeList.do'/>";
		   	document.listForm.submit();
		}
		
	}
	
/* 
	function fn_egov_selectList() {
		document.listForm.action = "<c:url value='/rms/recNotice/recNoticeList.do'/>";
	   	document.listForm.submit();
	} */

	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo){
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/rms/recNotice/recNoticeList.do'/>";
	   	document.listForm.submit();
	}
	
	</script>
</head>

<body onload="firstMenuList();">
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"/>
	<form:form commandName="pagingVO" name="listForm" method="post">
<%-- 	<header><!--header:시작-->
		
    	<div dlass="hWrap"><!--hwrap:시작-->
            <h1><a href="#" class="ir">demo</a></h1>
            <nav id="gnb"><!--gnb:시작-->
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
            </nav><!--//gnb:끝-->
			<div class="utility">
                <a href="#"  class="btn_log">Logout</a>
            </div>
    	</div><!--//hwrapr:끝-->
	</header><!--//header:끝--> --%>
    <div id="wrap">
    <jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>
<!--     	<section id="contL">
        	<nav id="lnb">gnb:시작
            	<h1><a class="lnb_h1_1">홈페이지관리</a></h1>
                <ul>
                	<li class=""><h2><a href="#">채용소식관리</a></h2></li>
                    <li class="on"><h2><a href="#" class="on">채용공고관리</a></h2></li>
                    <li class=""><h2><a href="#">Q&A 관리</a></h2></li>
                    <li class=""><h2><a href="#">FAQ 관리</a></h2></li>
                </ul>
            </nav>gnb:끝
        </section>//contL:끝 -->
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 홈페이지관리 &gt; <strong>채용공고관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>채용공고관리</h1>
                <div class="contents">
                	<div class="listSearch">
                	<div class="listType1 mt10">
						<input type="hidden" id="selectTarget" name="selectTarget">
                        <table>
                            <caption>테이블</caption>
                            <colgroup>
                                <col style="width:12%" />
                                <col style="width:30%" />
                                <col style="width:12%" />
                                <col style="width:*%" />
                            </colgroup>
                            <tr>
                                <th scope="row">년도</th>
                                <td>
                                    <form:select path="rec_year" id="rec_year" name="rec_year" class="select" title="모집년도" style="width:85px">
                                        <form:option value="" label="선택"/>
										<form:option value="2020" label="2020"/>
										<form:option value="2019" label="2019"/>
										<form:option value="2018" label="2018"/>
										<form:option value="2017" label="2017"/>
										<form:option value="2016" label="2016"/>
										<form:option value="2015" label="2015"/>
										<form:option value="2014" label="2014"/>
										<form:option value="2013" label="2013"/>
                                    </form:select>
                                </td>
                                <th scope="row">신입/경력</th>
                                <td>
                                    <form:select path="career_div_code" id="career_div_code" name="career_div_code" class="select" title="신입경력구분" style="width:85px">
										<form:option value="" label="선택"/>
										<form:option value="CAD_0010" label="신입"/>
										<form:option value="CAD_0020" label="경력"/>
										<form:option value="CAD_0030" label="신입/경력"/>
                                    </form:select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">모집분야</th>
                                <td colspan="3" class="btn">
                                <c:forEach var="i" items="${recFieldList}" varStatus="st">
                                	<label class="chk_label" ><form:input path="recFieldList" type="checkbox" class="chk" name="fieldCheckBtn${st.index}" id="fieldCheckBtn"  value="${i.rec_field_name}" /><span class="chk_txt">${i.rec_field_name}</span></label>
                                </c:forEach>
                                    <span class="btn-pack btn-type_2" style="margin-left:50px;">
                                  		<a class="" onClick="selectField()" href="#"><span class="ico_ser"></span>검 색</a>
                                    </span>
                                </td>
                            </tr>
                        </table>
                     </form>
                    </div>
                	<!--//테이블2-->
                    <div class="listSearch mt10">
                        <div class="listSearch_pos">
                            <form class="form_pos">
                                <fieldset>
                                    <legend>선택</legend>
                                    <select id="searchCondition" name="searchCondition" class="slt_search">
                                        <option value=''>선택</option>
                                        <option value='rec_noti_title'>제목</option>
                                        <option value='rec_noti_content'>내용</option>
                                    </select> 
                                    <input type="text" class="ipt_search" id="" name="searchKeyword" />
                                    <input type="image" name="" id=""  src="/KCC_RMS/images/rms/cmn/btn/btn_search.gif" onclick="document.location.href='./recNoticeList.do'" alt="검색">
                                </fieldset>
                            </form>
                        </div>
                   	</div>

                    <div class="listType2 mt10">
                    <form action="/rms/recNotice/recNoticeList.do" id="recNoticeList" name="recNoticeList" method="post">
                        <table>
                            <caption>채용공고관리</caption>
                            <colgroup>
                                <col style="width:5%"/>
                                <col style="width:7%"/>
                                <col style="width:7%"/>
                                <col style="width:7%"/>
                                <col style="width:*%" />
                                <col style="width:9%"/>
                                <col style="width:9%"/>
                                <col style="width:10%"/>
                            </colgroup>
                            <thead>
                                <tr> 
                                    <th scope="col">번 호</th>
                                    <th scope="col">모집년도</th>
                                    <th scope="col">경력구분</th>
                                    <th scope="col">모집분야</th>
                                    <th scope="col">채용공고제목</th>
                                    <th scope="col">응시시작일</th>
                                    <th scope="col">응시마감일</th>
                                    <th scope="col" class="last">상태</th>
                                </tr>
                            </thead>
              
                            <tbody>
                            <tr class="odd">
								<c:forEach items="${recNoticeList }" var="rnlist">
                                    <tr class="even" onclick="location.href='recNoticeContent.do?rec_noti_no=${rnlist.rec_noti_no }'">
                                    <td class="num">${rnlist.no }</td>
                                    <td class="num">${rnlist.rec_year }</td>
                                    <td class="left tb_style_1">${rnlist.career_div_code}</td>
                                    <td class="left tb_style_1">${rnlist.rec_field_name }</td>
                                    <td class="left tb_style_1">${rnlist.rec_noti_title }</td>
                                    <td class="num"><fmt:formatDate value="${rnlist.rec_start_date }" pattern="yyyy-MM-dd"/></td>
                                    <td class="last num"><fmt:formatDate value="${rnlist.rec_end_date }" pattern="yyyy-MM-dd"/></td>
                                    
                                    <c:choose>
                                		<c:when test="${rnlist.state_code =='진행중'}">
                                    <td class="tb_style_1 last">${rnlist.state_code }</span></td>
                            			</c:when>		
										<c:otherwise>
									<td class="font_color_red tb_style_1 last">${rnlist.state_code }</span>
                                		</c:otherwise>
                                	</c:choose>

                             </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">
	                        <span class="btn-pack btn-type_1">
	                        	<a class="" href="#LINK" onclick="document.location.href='./insertRecNoticeForm.do'"><span class="ico_v"></span>채용공고등록</a>
	                        </span>
	                    </div><!--//paging_right-->  
	                    <br>
                        <div id="paging">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
							<form:hidden path="pageIndex" />
						</div>
						
				    	<!-- <div class="paging">
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
    </form:form>
<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>
</body>
</html>