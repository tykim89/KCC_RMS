<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채용관리시스템</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />

<link rel="stylesheet" href="<c:url value='/css/rms/cmn/base.css'/>"
	type="text/css">


<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javaScript" language="javascript">
	function searchSubmit()
	{
		var key = $("#searchKey").val();
		var value = $("#searchValue").val();
		 $.post("<c:url value='/rms/sys/searchUser.do'/>", {searchKey : key, searchValue : value}, function(html){
			$("#userForm").html(html);	
		});  
		//$("#searchForm").attr("action", "<c:url value='/rms/sys/getUserList.do'/>").submit();
	}

	function openWindowForUserInfoDetail(admin_id)
	{
		window.open('','detailWindow','scrollbars=no,resizable=yes,width=1200 height=400');
		$("#userForm").attr('target', 'detailWindow');
		$('#userForm input[name=admin_id]').val(admin_id);
		//alert($("#admin_id").val());
		$("#userForm").submit();
		
	}
	
</script>
</head>

<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"  />
    <div id="wrap">
    	 <jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 항목관리 &gt; <strong>지원서양식관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>계정정보조회</h1>
                <div class="contents">
                	<div class="listType1">
                	
                	<form id="searchForm" action="" method="post">
                        <table>
                            <caption>테이블</caption>
                            <colgroup>
                           		<col style="width:70%;" />
                                <col style="width:150px;" />
                                <col style="width:*" />
                               
                            </colgroup>
                            <tr>
                            </tr>
                             
                            <tr>
                           		<td></td>
                           		<th scope="row"><select class="select" title="" name="searchKey" id="searchKey">
                                  		<option value="admin_name">이름</option>
                                        <option value="admin_id">아이디</option>
                                        <option value="position">직급</option>
                                        <option value="company">회사</option>
                                        <option value="dept">부서</option>
                                        <option value="admin_email_addr">이메일</option>
                                        <option value="admin_phone_num">휴대폰</option>
                                        <option value="admin_tel_num">회사전화번호</option>
                                    </select>
								</th>
                              <td colspan="3" class="btn">
                              	<input type="text" id="searchValue" name="searchValue" style="width:180px;"class="ipt_listIn" />
                              	<span class="btn-pack btn-type_2" style="margin-left:5px;">
                                  		<a class="" href="#" onclick="searchSubmit();"><span class="ico_ser"></span>검 색</a>
                                    </span></td>                                
                            </tr>                            
                            <tr>
                         
                        	</tr>
                        </table>
                        </form>
                    </div>
                	<!--//테이블2-->
                	
                    <div class="listType2 mt10">
                    <form id="userForm" name="userForm" action="<c:url value='getUserDetail.do'/>" method="post">
                    <input type="hidden" id="admin_id" name="admin_id" value=""/>
								
                        <table>
                            <caption>테이블</caption>
                            <colgroup>
                                <col style="width:5%"/>
                                <col style="width:5%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:10%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                            </colgroup>
                            <thead>
                                <tr> 
                                	<th scope="col" ><input name="" id="" class="" type="checkbox" /></th>
                                    <th scope="col"  >번 호</th>
                                    <th scope="col"  >아이디</th>
                                    <th scope="col"  >이름</th>
                                    <th scope="col"  >직급</th>
                                    <th scope="col"  >회사</th>
                                    <th scope="col"  >부서</th>
                                    <th scope="col"  >이메일</th>
                                    <th scope="col"	 >휴대폰 번호</th>
                                    <th scope="col"  class="last">회사 전화번호</th>
                                
                                </tr>
                            
                            </thead>
                            <tbody>
                                               
                                <c:if test="${userList.size() == 0}">
								<tr class="odd">
									<td colspan="10" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
								</tr>
								</c:if>
								
								<c:forEach var="uList" items="${userList}" varStatus="st">
										<c:choose>
									<c:when test="${st.index %2 ==0 }">
										<c:set var="rowClass" value="odd"/>
									</c:when>
									<c:otherwise>
										<c:set var="rowClass" value="even"/>
									</c:otherwise>
									</c:choose>
									<tr class="${rowClass }"  style='cursor:pointer;cursor:hand;' onclick="openWindowForUserInfoDetail('<c:out value="${uList.admin_id}"></c:out>');">
										<%-- <td><input type="checkbox" id="notOwnCheckBtn" name="notOwnCheckBtn${st.index }" value="${authVO.auth_id}"></td>
										<td><c:out value="${authVO.auth_name}"></c:out></td>
										<td><c:out value="${authVO.auth_description}"></c:out></td> --%>
										
										<td scope="col"><input name="" id="" class="" type="checkbox" /></td>
										<td class="left num"><c:out value="${st.index+1}"></c:out></td>
										<td class="left"><c:out value="${uList.admin_id}"></c:out></td>
	                                    <td class="left"><c:out value="${uList.admin_name}"></c:out></td>
	                                    <td class="left"><c:out value="${uList.detail_code_name}"></c:out></td>
	                                    <td class="left"><c:out value="${uList.dep_name}"></c:out></td>
	                                    <td class="left"><c:out value="${uList.company_name}"></c:out></td>
	                                    <td class="left"><c:out value="${uList.admin_email_addr}"></c:out></td>
	                                    <td class="left"><c:out value="${uList.admin_phone_num}"></c:out></td>
	                                    <td class="left"><c:out value="${uList.admin_tel_num}"></c:out></td>
									</tr>
								</c:forEach>
                        		
                            </tbody>
                        </table>
                        
                        </form>
                    </div><!--//테이블2-->
                    <div class="pager">
				    	<div class="paging">
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
						</div><!--//paging-->  
				    </div><!--//pager-->
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
   <jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>
</body>
</html>
