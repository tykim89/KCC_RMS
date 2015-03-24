<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>채용관리시스템</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rms/cmn/base.css'/>" />
<!--[if lt IE 9]>
		<script type="text/javascript" src="./common/js/respond.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
		<script type="text/javascript" src="./common/js/html5shiv.js"></script>
<![endif]-->
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
 

<script type="text/javascript">

function init()
{
	if($("#message").val() != "")
	{
		alert($("#message").val());
	}
}

function deleteRecProcess(no){
	
    var fcf  = document.listForm;
	
	$("#rec_prog_no").val(no);
	
    if( confirm('<spring:message code="common.delete.msg" />') )
    {
    	fcf.action = './deleteRecProcess.do?';
    }

    fcf.submit();
}

</script>

</head>

<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />
<form:form commandName="pagingVO" name="listForm" method="post">
    <div id="wrap">
		<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />

        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 항목관리 &gt; <strong>채용절차관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>채용절차관리</h1>
                <div class="contents">
                	<div class="listSearch">
                        <div class="listSearch_pos">
                            <form class="form_pos">
                                <fieldset>
                                    <legend>선택</legend>
                                    <select id="searchKey" name="searchKey" class="slt_search" style="width:90px">
                                        <option value="">선택</option>
                                        <option value="rec_prog_name">채용절차명</option>
                                        <option value="rec_prog_memo">메모</option>
                                    </select> 
                                    <input type="text" class="ipt_search" id="searchValue" name="searchValue" />
                                    <input type="image" name="" id="" onclick="document.location.href='./recNoticeList.do'" src="/KCC_RMS/images/rms/cmn/btn/btn_search.gif" alt="검색">
                                </fieldset>
                            </form>
                        </div>
                   	</div>

                    <div class="listType2 mt10">
                        <table>
                            <caption>채용절차관리</caption>
                            <colgroup>
                                <col style="width:5%"/>
                                <col style="width:20%" />
                                <col style="width:*%" />
                                <col style="width:10%" />
                                <col style="width:10%" />
                                <col style="width:15%"/>
                            </colgroup>
                            <thead>
                                <tr> 
                                    <th scope="col">번 호</th>
                                    <th scope="col">채용절차명</th>
                                    <th scope="col">채용절차</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">작성일</th>
                                    <th scope="col" class="last"></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${recProcessList }" var="rpList" >
                                <tr class="even" <%-- onclick="location.href='recProcessContent.do?rec_prog_no=${rpList.rec_prog_no }'" --%>>
                                    <td class="left num">${rpList.no }</td>
                                    <td class="left tb_style_1">${rpList.rec_prog_name }</td>
                                    <td class="left">${rpList.step_item_list }</td>
                                    <td class="left tb_style_1">${rpList.writer }</td>
                                    <td class="left">${rpList.write_date }</td>
                                    <td class="btn last ">
                                    <input type="hidden"  id="rec_prog_no" name="rec_prog_no" value="">
                                    <span class="btn-pack btn-type_2">
                                    	<a class="" href="#"><span class="ico_modify"></span>수 정</a></span>
                                    <span class="btn-pack btn-type_2">
                                  		<a class="" href="#" onclick="deleteRecProcess('${rpList.rec_prog_no }')"><span class="ico_x2"></span>삭 제</a></span>
                             		</td>   		
                                </tr>
                            </c:forEach>    
                            </tbody>
                        </table>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">
                            <span class="btn-pack btn-type_1">
                        	<a class="" href="#" onclick="document.location.href='./insertRecProcessForm.do'"><span class="ico_v"></span>채용절차등록</a>
                        </span>
                        </div><!--//paging_right-->  
                        
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
	<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>
</form:form>
</body>
</html>


