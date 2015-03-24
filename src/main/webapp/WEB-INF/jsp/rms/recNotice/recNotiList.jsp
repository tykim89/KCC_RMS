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
	
	
	function searchCheck(){
		
		if($("#searchCondition").val()==""){
			alert("검색 조건을 선택하여 주세요.");
		}else if($("#searchKeyword").val()==""){
			alert("검색어를 입력하여 주세요.")
		}else{
			document.listForm.action = "<c:url value='/rms/recNotice/recNoticeList.do'/>";
			document.listForm.submit();
		}
		
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

    <div id="wrap">
    <jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>

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
						<input type="hidden" id="selectTarget" name="selectTarget" value=""/>
						<input type="hidden" id="ing" name="ing" value="${rnlist.ing }"/>
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
										<form:option value="${nextYear }" label="${nextYear }"/>
										<form:option value="${year }" label="${year }"/>
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

                    </div>
                	<!--//테이블2-->
                    <div class="listSearch mt10">
                        <div class="listSearch_pos">

                                <fieldset>
                                    <legend>선택</legend>
                                    <form:select path="searchCondition" class="slt_search">
                                        <form:option value="" label="선택"/>
                                        <form:option value="rec_noti_title" label="제목"/>
                                        <form:option value="rec_noti_content" label="내용"/>
                                    </form:select> 
                                    <form:input path="searchKeyword" type="text" class="ipt_search" />
                                    <input type="image" name="" id=""  src="/KCC_RMS/images/rms/cmn/btn/btn_search.gif" onclick="searchCheck()" alt="검색"/>
                                </fieldset>

                        </div>
                   	</div>

                    <div class="listType2 mt10">
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
                            <c:choose>
                           		<c:when test="${empty recNoticeList }">
                           		<tr class="odd" >
                           			<a href="#">게시글이 없습니다.</a>
                           		</tr>
                           		</c:when>
                           		<c:otherwise>
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
                                		<c:when test="${rnlist.ing =='Y'}">
                                    <td class="tb_style_1 last">진행중</span></td>
                            			</c:when>		
										<c:otherwise>
									<td class="font_color_red tb_style_1 last">마감</span>
                                		</c:otherwise>
                                	</c:choose>

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