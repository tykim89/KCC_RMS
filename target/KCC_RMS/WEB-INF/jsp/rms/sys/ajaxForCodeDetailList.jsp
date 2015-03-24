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
 $(document).ready(
			function(){
				'${codeDetailList}';
				var codeDetailAddResult = '${codeDetailAddResult}';
				//var codeDetailList = '${codeDetailList}';
				//var groupModiResult ='${groupModiResult}';
				/* var recFieldItemResult = '${recFieldItemResult}';
				var fieldItemDeleteResult = '${recFieldItemDeleteResult}'; */
				
				//alert(recFieldItemModiResult+"-"+recFieldItemResult+"-"+fieldItemDeleteResult);
				if(codeDetailAddResult !="")
				{
					if(codeDetailAddResult != 0)
					{
						alert("코드 등록 성공.");					
					}else if(codeDetailAddResult == 0)
					{
						alert("코드 등록 실패.");
					}
				}
			
			 	/* if(groupModiResult !="")
				{
					if(groupModiResult != 0)
					{
						alert("코드그룹 수정 성공.");					
					}else if(groupModiResult == 0)
					{
						alert("코드그룹 수정 실패.");
					}
				} */
			 	/*
				 if(fieldItemDeleteResult !="")
				{
					if(fieldItemDeleteResult != 0)
					{
						alert("모집분야 항목 삭제 성공.");					
					}else if(fieldItemDeleteResult == 0)
					{
						alert("모집분야 항목 삭제 실패.");
					}
				}  */
			
			}
				
	);
 
 function checkAll(allBtnId, checkBtnId)
	{
		
		if ($("#" + allBtnId).is(":checked"))
		{
			$("input[name=" + checkBtnId + "]").prop("checked", true);
		}
	      else
	      {
	         $("input[name=" + checkBtnId + "]").prop("checked", false);
	      }
	   }
	 
	   //체크된 값 | 구분자로 연결하여 리턴
	   function getCheckedValue(checkBtnId)
	   {
	      var idList = [];
	      var itemStr = "";

	      $("input[name=" + checkBtnId + "]:checked").each(function()
	      {
	         idList.push(this.value)
	      });

	      $.each(idList, function(index, item)
	      {
	         itemStr += item + "|"
	      });
	      return itemStr;
	   }
	   
 function detailCodeRowClick(detail_code, val1, detail_code_name, sort_seq, version)
 {
	 
	if($("#detail_code").val()==detail_code){
		$("#group_code_forDetail").val("");
		$("#detail_code").val("");
		$("#val1").val("");
		$("#detail_code_name").val("");
		$("#sort_seq").val("");
		$("#version_detail").val(version);
	}else
		{
		$("#group_code_forDetail").val($("#group_code").val());
		$("#detail_code").val(detail_code);
		$("#val1").val(val1);
		$("#detail_code_name").val(detail_code_name);
		$("#sort_seq").val(sort_seq);
		$("#version_detail").val(version);
		}
	 
 }


 </script>

                        	<form action="" id="detailCodeListForm" name="detailCodeListForm" method="post">
                        	
                                <table>
                                    <caption>입사지원현황 통계</caption>
                                    <colgroup>
                                        <col style="width:15%" />
                                        <col style="width:25%" />
                                        <col style="width:*%" />
                                    </colgroup>
                                    <thead>
                                        <tr> 
                                            <th scope="col"><input name="" id="" class="" type="checkbox" /></th>
                                            <th scope="col">코드그룹</th>
                                            <th scope="col">코드</th>
                                            <th scope="col">코드명</th>
                                            <th scope="col">우선순위</th>
                                            <th scope="col" class="last">코드설명</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:if test="${codeDetailList ==null}">
										<tr class="odd">
											<td colspan="6" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
										</tr>
										</c:if>
                                    	<c:forEach var="cdList" varStatus="st" items="${codeDetailList }">
                                    		<c:choose>
												<c:when test="${st.index %2 ==0 }">
													<c:set var="rowClass" value="odd"/>
												</c:when>
												<c:otherwise>
													<c:set var="rowClass" value="even"/>
												</c:otherwise>
											</c:choose>
                                        <tr class="${rowClass }" onclick="detailCodeRowClick('<c:out value="${cdList.detail_code }"></c:out>', '<c:out value="${cdList.val1 }"></c:out>', '<c:out value="${cdList.detail_code_name }"></c:out>', '<c:out value="${cdList.sort_seq }"></c:out>', '<c:out value="${cdList.version }"></c:out>');">
                                            <td><input name="" id="" class="" type="checkbox" /></td>
                                            <td><c:out value="${cdList.group_code }"></c:out></td>
                                            <td><c:out value="${cdList.detail_code }"></c:out></td>
                                            <td><c:out value="${cdList.detail_code_name }"></c:out></td>
                                            <td><c:out value="${cdList.sort_seq }"></c:out></td>
                                            <td class="last"><c:out value="${cdList.val1 }"></c:out></td>
                                        </tr>
                                       </c:forEach>                         
                                    </tbody>
                                </table>
                                </form>
                     
</html>