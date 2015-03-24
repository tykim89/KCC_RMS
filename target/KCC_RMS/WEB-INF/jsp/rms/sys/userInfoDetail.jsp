<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/css/rms/cmn/base.css'/>"
	type="text/css">
<title>계정정보 상세</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="/js/rms/com/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javaScript" language="javascript">

function InitPw(){
	var id = $("#admin_id").val();
	if(confirm("비밀번호를 초기화 하시겠습니까?")){
		
		$.post("<c:url value='/rms/sys/pwInit.do'/>", {admin_id : id}, function(xml)
	
		                  {						
					 			if($(xml).find('check').text()==0)
					 			{
					 				alert("비밀번호 초기화 실패.");
					 			}else
					 			{
					 				alert("비밀번호 초기화 성공.");
					 			}
		                  });
	}
}

function deleteUser(){
	var id = $("#admin_id").val();
	if(confirm("계정을 삭제 하시겠습니까?")){
		$.post("<c:url value='/rms/sys/deleteUser.do'/>", {admin_id : id}, function(xml)
				
                  {						
			 			if($(xml).find('check1').text()==0)
			 			{
			 				alert("계정삭제 실패.");
			 			}else
			 			{
			 				alert("계정삭제 성공.");
			 				closeUserDetail();
			 			}
                  });
	}
}

function modiUser(){
	if(confirm("저장 하시겠습니까?")){
		$.post("<c:url value='/rms/sys/modiUserByAdmin.do'/>", $("#userDetailForm").serialize(), function(xml)
				
                  {						
			 			if($(xml).find('check2').text()==0)
			 			{
			 				alert("계정수정 실패.");
			 			}else
			 			{
			 				alert("계정수정 성공.");
			 			}
                  });
	}
}

function closeUserDetail()
{
	opener.parent.searchSubmit();
	window.close();
}
</script>
</head>
<body>
    <div id="wrap">
        <section id="contR"><!--contR:시작-->
			<article>
            	<h1>계정정보 상세 조회</h1>
                <div class="contents">
                	<div class="listSearch">
                    	<span class="btn-pack btn-type_5">
                        	<a class="" href="#" onclick="InitPw();"><span class="ico_again"></span>비밀번호초기화</a>
                       	</span>
                    	<span class="btn-pack btn-type_4">
                        	<a class="" href="#" onclick="deleteUser();"><span class="ico_x"></span>삭  제</a>
                        </span>
                        <span class="btn-pack btn-type_1">
                        
                        	<a class="" href="#" onclick="modiUser();"><span class="ico_v"></span>저  장</a>
                        </span>
                        <span class="btn-pack btn-type_5">
                        	<a class="" href="#" onclick="closeUserDetail();"><span class="ico_cancel"></span>닫 기</a>
                        </span>
                   	</div>
                	<div class="listType3 mt10">
                	<form action="" method="post" id="userDetailForm">
                		<table summary="">
                            <colgroup>
                                <col width="180px" />
                                <col width="15%" />
                                <col width="*%" />
                            </colgroup>
                            
                         	<tbody>
                         		<c:set var="user" value="${userDetail}"/>
                                <tr class="odd">
                                	<th rowspan="10"><img src="/KCC_RMS/images/rms/cmn/btn/photo_sample.gif" alt="사진" /></th>
                                    <th>아이디</th>
                                    <td class="left"><input type="text" id="admin_id" name="admin_id" style="width:170px;" class="ipt_listIn2" value="<c:out value="${user.admin_id }"></c:out>"/></td>
                                </tr>
                                <tr class="even">
                                	<th>성명</th>
                                    <td class="left"><input type="text" id="admin_name" name="admin_name" style="width:170px;" class="ipt_listIn2" value="<c:out value="${user.admin_name }"></c:out>"/></td>
                                </tr>
                          		
                               	<tr class="even">
                                	<th>부서</th>
                                    <td class="left">
                                    	<c:set var="selectC" value="${user.company_no}"/>
                                    	<c:set var="selectB" value="${user.branch_no}"/>
                                    	<c:set var="selectD" value="${user.dep_no}"/>
                                    	<c:set var="selectP" value="${user.position_code}"/>                               
                                        <select name="company_no" style="width: 150px;"
								class="slt_blank">
											<c:forEach var="cList" items="${ companyList }">
												<c:choose>
													<c:when test="${selectC== cList.company_no}">
														<option SELECTED value="<c:out value='${cList.company_no }'></c:out>"><c:out value="${cList.company_name }"></c:out></option>						
													</c:when>
													<c:otherwise>
														<option value="${cList.company_no }"><c:out value="${cList.company_name }"></c:out></option>
													</c:otherwise>
												</c:choose>												
											</c:forEach>
										</select> <select name="branch_no" style="width: 150px;" class="slt_blank">
											<c:forEach var="bList" items="${ branchList }">
											<c:choose>
													<c:when test="${selectB== bList.branch_no}">
														<option SELECTED value="${bList.branch_no }"><c:out value="${bList.branch_name }"></c:out></option>					
													</c:when>
													<c:otherwise>
														<option value="${bList.branch_no }"><c:out value="${bList.branch_name }"></c:out></option>
													</c:otherwise>
											</c:choose>		
												
											</c:forEach>
										</select> <select name="dep_no" style="width: 150px;" class="slt_blank">
											<c:forEach var="dList" items="${ deptList }">
											<c:choose>
													<c:when test="${selectD== dList.dep_no}">
														<option SELECTED value="${dList.dep_no }"><c:out value="${dList.dep_name }"></c:out></option>				
													</c:when>
													<c:otherwise>
														<option value="${dList.dep_no }"><c:out value="${dList.dep_name }"></c:out></option>
													</c:otherwise>
											</c:choose>		
											</c:forEach>
										</select>
                                    </td>
                                </tr>
                                <tr class="odd">
                                	<th>직급</th>
                                    <td class="left">
	                                    <select name="position_code" style="width: 150px;" class="slt_blank">
											<c:forEach var="pList" items="${ positionList }">									
											<c:choose>
													<c:when test="${selectP== pList.detail_code}">
														<option value="${pList.detail_code }"  SELECTED><c:out value="${pList.detail_code_name }"></c:out></option>				
													</c:when>
													<c:otherwise>
														<option value="${pList.detail_code }"><c:out value="${pList.detail_code_name }"></c:out></option>
													</c:otherwise>
											</c:choose>		
											</c:forEach>
										</select>
                                    </td> 
                                </tr>
                                <tr class="even">
                                	<th>휴대폰번호</th>
                                    <td class="left">
                                        <select id="" name="phone_num1" style="width:70px;" class="slt_blank">
                                            <option value="010">010</option>
                                        </select> - 
                                        <input type="tel" id="phone_num2" name="phone_num2" style="width:80px;" class="ipt_listIn2" value="<c:out value='${user.phone_num2}'></c:out>"/> - 
                                        <input type="tel" id="phone_num3" name="phone_num3" style="width:80px;"  class="ipt_listIn2" value="<c:out value='${user.phone_num3}'></c:out>"/>
                                    </td>
                                    
                                </tr>
                                <tr class="odd">
                                	<th>내선번호</th>
                                    <td class="left">
                                    	<select id="" name="tel_num1" style="width:70px;" class="slt_blank">
                                            <option value="02">02</option>
                                        </select> - 
                                        <input type="tel" id="tel_num2" name="tel_num2" style="width:80px;" class="ipt_listIn2" value="<c:out value='${user.tel_num2}'></c:out>"/> - 
                                        <input type="tel" id="tel_num3" name="tel_num3" style="width:80px;"  class="ipt_listIn2" value="<c:out value='${user.tel_num3}'></c:out>"/>
                                    </td>
                                    
                                </tr>
                                <tr class="even">
                                	<th>E-mail</th>
                                    <td class="left">
                                    	
                                    	<input type="text" id="admin_email_id" name="admin_email_id" style="width:150px;" class="ipt_listIn2" value="${user.admin_email_id }"/>                           
                                        <select id="admin_email_addr_url"name="admin_email_addr_url" style="width:150px;" class="slt_search" >         
                                            <c:set var="i" value="${user.admin_email_addr_url}"/>
                                           
                                            <c:choose>
                                            	<c:when test="${i == 'kcc.co.kr'}">
                                            		<option value='kcc.co.kr' SELECTED>@ kcc.co.kr</option>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<option value='kcc.co.kr'>@ kcc.co.kr</option>
                                            	</c:otherwise>
                                            </c:choose>
                                             <c:choose>
                                            	<c:when test="${i=='kccsecurity.com' }">
                                            		<option value='kccsecurity.com' SELECTED>@ kccsecurity.com</option>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<option value='kccsecurity.com'>@ kccsecurity.com</option>
                                            	</c:otherwise>
                                            </c:choose>
                                             <c:choose>
                                            	<c:when test="${i=='sysone.co.kr' }">
                                            		<option value='sysone.co.kr' SELECTED>@ sysone.co.kr</option>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<option value='sysone.co.kr'>@ sysone.co.kr</option>
                                            	</c:otherwise>
                                            </c:choose>
                               
                                        </select>
                                    </td>
                                </tr>
                            
                        	</tbody>
                    	</table>
                    	<input type="hidden" id="thisVersion" name="version" value="${user.version }"/>
                    	</form>
                    </div>
                	<!--//테이블2-->
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->

</body>
</html>