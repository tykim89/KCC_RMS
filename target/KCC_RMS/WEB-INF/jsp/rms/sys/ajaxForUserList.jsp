<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/css/rms/cmn/base.css'/>"
	type="text/css">


<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javaScript" language="javascript">
function openWindowForUserInfoDetail2(admin_id)
{
	window.open('','detailWindow','scrollbars=yes,resizable=yes,width=1200 height=400');
	$("#userForm1").attr('target', 'detailWindow');
	$('#userForm1 input[name=admin_id]').val(admin_id);
	//alert($("#admin_id").val());
	$("#userForm1").submit();
	
}
</script>

<form id="userForm1" name="userForm1" action="<c:url value='getUserDetail.do'/>" method="post">
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
									<tr class="${rowClass }" onclick="openWindowForUserInfoDetail2('<c:out value="${uList.admin_id}"></c:out>');">
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
</html>