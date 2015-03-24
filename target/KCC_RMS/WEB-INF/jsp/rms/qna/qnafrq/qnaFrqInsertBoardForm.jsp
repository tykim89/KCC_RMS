<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function() {
	$("#gotoinsert").click(function() {
		$("#qnaFrqInsert").attr("action","<c:url value='./qnaFrqInsertBoard.do'/>").submit();
		})
})
</script>
</head>
<body onload="firstMenuList();">
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"  />
<!-- 	<header>header:시작 -->
<!--     	<div dlass="hWrap">hwrap:시작 -->
<!--             <h1><a href="#" class="ir">demo</a></h1> -->
<!--             <nav id="gnb">gnb:시작 -->
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
<!--             </nav>//gnb:끝 -->
<!-- 			<div class="utility"> -->
<!--                 <a href="#"  class="btn_log">Logout</a> -->
<!--             </div> -->
<!--     	</div>//hwrapr:끝 -->
<!-- 	</header>//header:끝 -->
	
	
	
    <div id="wrap">
    <jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>
<%--     	<section id="contL"> --%>
<!--         	<nav id="lnb">gnb:시작 -->
<!--             	<h1><a class="lnb_h1_1">홈페이지관리</a></h1> -->
<!--                 <ul> -->
<!--                 	<li class="on"><h2><a href="#" class="on">채용소식관리</a></h2></li> -->
<!--                     <li class=""><h2><a href="#">채용공고관리</a></h2></li> -->
<!--                     <li class=""><h2><a href="#">Q&A 관리</a></h2></li> -->
<!--                     <li class=""><h2><a href="#">FAQ 관리</a></h2></li> -->
<!--                 </ul> -->
<!--             </nav>gnb:끝 -->
<%--         </section><!--//contL:끝--> --%>
        
        
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; Q&A관리 &gt; 동일유형답변관리 &gt;<strong>동일유형답변입력</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>동일유형답변 입력</h1>
                <div class="contents">
                	<div class="listType3 mt30">
                	<form action="./qnaFrqInsertBoard.do" method="post" id="qnaFrqInsert" name="qnaFrqInsert">
                		<table summary="">
                		
                            <colgroup>
                                <col width="15%" />
                                <col width="85% "/>
                            </colgroup>
                         	<tbody>

                                <tr class="odd">
                                	<th>질문유형</th>
                                	<td>
                                    		<select name="qna_type_code" style="width: 250px;" class="ipt_listIn2 num">
													<c:forEach var="type" items="${itemList}" varStatus="vs">
													<option value="<c:out value="${type.detail_code_name}"/>">${type.detail_code_name}</option>
													<c:if test="${vo.qna_type_code == type.detail_code_name}">selected="selected"</c:if>
													<c:out value="${type.detail_code_name}"/>
													</c:forEach>
											</select>
									</td>
                                </tr>
                                <tr class="even">
                                <th>내&nbsp;&nbsp;&nbsp;용</th>
                                    <td class="left">
                                    		<textarea id="frq_answer_content" name="frq_answer_content" style="width:650px; height:200px;"></textarea>
                                    </td>
                                </tr>

                        	</tbody>
                    	</table>
                    	</form>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">
                        	<span class="btn-pack btn-type_5">
                        		<a class="" href="#" onclick="document.location.href='./qnaFrqBoardlist.do'"><span class="ico_list"></span>목 록</a>
                            </span>
                            <span class="btn-pack btn-type_5">
                        		<a class="" href="#" id="gotoinsert" name="gotoinsert"><span class="ico_modify"></span>등 록</a>
                            </span>
                        </div><!--//paging_right-->  
				    	
				    </div><!--//pager-->
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
    
    <jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>
    
<!--     <footer> -->
<!--         <div class="fWrap"> -->
<!--         	<span>COPYRIGHT ⓒ 2014 <b>CRM.</b></span> -->
<!--         	<span>ALL RIGHT RESERVED.</span> -->
<!--         </div> -->
<!-- 	</footer> -->


<!-- <form action="./qnaFrqInsertBoard.do" method="post" name="qnaFrqInsert"> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td>질문유형</td> -->
<!-- 			<td> -->
<!-- 				aa -->
<!-- 				<select name="qna_type_code"  > -->
<%-- 				<c:forEach var="type" items="${itemList}" varStatus="vs"> --%>
<%-- 				<option value="<c:out value="${type.detail_code_name}"/>">${type.detail_code_name}</option> --%>
<%-- 				<c:if test="${vo.qna_type_code == type.detail_code_name}">selected="selected"</c:if> --%>
<%-- 				<c:out value="${type.detail_code_name}"/> --%>
<%-- 				</c:forEach> --%>
<!-- 			</select> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>내용</td> -->
<!-- 			<td> -->
<!-- 				<textarea rows="5" cols="50" id="frq_answer_content" name="frq_answer_content"></textarea> -->
<!-- 			</td> -->
<!-- 		</tr>	 -->
<!-- 	</table> -->
	
<!-- <input type="submit" value="등록"> -->
<!-- </form> -->
</body>
</html>