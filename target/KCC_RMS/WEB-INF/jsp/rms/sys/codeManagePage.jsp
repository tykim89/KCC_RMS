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
<script src="/js/rms/com/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
 <script type="text/javaScript" language="javascript">
 $(document).ready(
			function(){
				var groupAddResult = '${groupAddResult}';
				var groupModiResult ='${groupModiResult}';
				/* var recFieldItemResult = '${recFieldItemResult}';
				var fieldItemDeleteResult = '${recFieldItemDeleteResult}'; */
				
				//alert(recFieldItemModiResult+"-"+recFieldItemResult+"-"+fieldItemDeleteResult);
				if(groupAddResult !="")
				{
					if(groupAddResult != 0)
					{
						alert("코드그룹 등록 성공.");					
					}else if(groupAddResult == 0)
					{
						alert("코드그룹 등록 실패.");
					}
				}
			 	if(groupModiResult !="")
				{
					if(groupModiResult != 0)
					{
						alert("코드그룹 수정 성공.");					
					}else if(groupModiResult == 0)
					{
						alert("코드그룹 수정 실패.");
					}
				}
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
	   
	   
	   function getDetailCode(group_code, group_name, version)
	   {
		   if($("#group_code").val()==group_code){
			   $.post("<c:url value='/rms/sys/getCodeDetailList.do'/>", {group_code : ''}, function(html){
					$("#detailCodeListForm").html(html);	
				});  
			   $("#group_code").val("");
	
			   $("#group_name").val("");
			   $("#group_version").val("0");
			   $("input[name=group_code]").attr("disabled",false);
		   }else
			   {
			   
			   $.post("<c:url value='/rms/sys/getCodeDetailList.do'/>", {group_code : group_code}, function(html){
					$("#detailCodeListForm").html(html);	
				});  
			   $("#group_code").val(group_code);
		
			   $("#group_name").val(group_name);
			   $("#group_version").val(version);
			   $("input[name=group_code]").attr("disabled",true);
			   }
	   }
	   function codeGroupAddSubmit()
	   {
		   if($("#group_name").val()=="")
			{
			   alert("코드그룹명을 입력하십시오.");
			   $("#group_name").focus();
			}
			else
			{
			   	if($("#group_code").val()=="")
				{
				   alert("코드를 입력하십시오.");
				   $("#group_code").focus();
				}
			  	else
				{
				   	if(confirm("등록하시겠습니까?"))
					{
				   	 	$("#groupCodeForm").attr("action", "<c:url value='/rms/sys/addCodeGroup.do'/>").submit();
					}
				}
			}	
	   }
	   function codeGroupModiSubmit()
	   {
		   if($("#group_name").val()=="")
			{
			   alert("코드그룹명을 입력하십시오.");
			   $("#group_name").focus();
			}
			else
			{
			   	if($("#group_code").val()=="")
				{
				   alert("코드를 입력하십시오.");
				   $("#group_code").focus();
				}
			  	else
				{
				   	if(confirm("수정하시겠습니까?"))
					{
				   		$("input[name=group_code]").attr("disabled",false);
				   	 	$("#groupCodeForm").attr("action", "<c:url value='/rms/sys/modiCodeGroup.do'/>").submit();
				   	 	$("input[name=group_code]").attr("disabled",true);
					}
				}
			}	
	   }
	   
	   function codeGroupDeleteSubmit()
	   {
		   var checkedValue=getCheckedValue('groupCodeChecked');
		 
		   	if(checkedValue=="|")
			{
			   alert("삭제할 항목을 선택하십시오.");
			}
		   	else
			{
		   		if(confirm("삭제 하시겠습니까?"))
		   		{
		   			$("#checkedValue").val(checkedValue);
		   			$("#groupCodeForm").attr("action", "<c:url value='/rms/sys/deleteCodeGroup.do'/>").submit();
		   		}
			}
			
	   }
	   function codeDetailAddSubmit()
	   {
	  	
	  	   if($("#detail_code_name").val()=="")
	  		{
	  		   alert("코드명을 입력하십시오.");
	  		   $("#detail_code_name").focus();
	  		}
	  		else
	  		{
	  		   	if($("#sort_seq").val()=="")
	  			{
	  			   alert("정렬순서를 입력하십시오.");
	  			   $("#sort_seq").focus();
	  			}
	  		  	else
	  			{
	  			   	if(confirm("등록하시겠습니까?"))
	  				{
	  			   	 	$("#group_code1").val($("#group_code").val());
	  			   	 	
	  			   		
	  			   		$.post("<c:url value='/rms/sys/addCodeDetail.do'/>", $("#detailCodeForm").serialize(), function(html){
	  			   			$("#detailCodeListForm").html(html);
	  			   			
						});  
	  				}
	  			}
	  		}
	   }
	   function codeDetailModiSubmit()
	   {
	  	
	  	   if($("#detail_code_name").val()=="")
	  		{
	  		   alert("코드명을 입력하십시오.");
	  		   $("#detail_code_name").focus();
	  		}
	  		else
	  		{
	  		   	if($("#sort_seq").val()=="")
	  			{
	  			   alert("정렬순서를 입력하십시오.");
	  			   $("#sort_seq").focus();
	  			}
	  		  	else
	  			{
	  			   	if(confirm("수정하시겠습니까?"))
	  				{
	  			   	 	$("#group_code1").val($("#group_code").val());
	  			   	 	
	  			   		
	  			   		$.post("<c:url value='/rms/sys/modiCodeDetail.do'/>", $("#detailCodeForm").serialize(), function(html){
	  			   			$("#detailCodeListForm").html(html);
	  			   			
						});  
	  				}
	  			}
	  		}
	   }
 </script>
</head>

<body onload="firstMenuList();">
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"  />
    <div id="wrap">
    	 <jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="./common/images/btn/btn_path_home.gif" alt="home" />HOME &gt; 항목관리 &gt; <strong>지원서양식관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>코드관리</h1>
                <div class="contents">
                	<section class="sec_third" style="padding-right:1%" >
                    	<h3 class="mt30">그룹 분류코드 목록</h3>
                        <div class="tree_wrap" style="height:527px;">
                        	<div class="listType4">
                                <table>
                                    <caption>입사지원현황 통계</caption>
                                    <colgroup>
                                        <col style="width:15%" />
                                        <col style="width:25%" />
                                        <col style="width:*%" />
                                    </colgroup>
                                    <thead>
                                        <tr> 
                                            <th scope="col"><input name="checkedAllGroupCode" id="checkedAllGroupCode" class="" type="checkbox" onchange="checkAll('checkedAllGroupCode', 'groupCodeChecked');"/></th>
                                            <th scope="col">코드</th>
                                            <th scope="col" class="last">코드그룹명</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                          <c:forEach var="cgList" varStatus="st" items="${codeGroupList }">
                                    		<c:choose>
												<c:when test="${st.index %2 ==0 }">
													<c:set var="rowClass" value="odd"/>
												</c:when>
												<c:otherwise>
													<c:set var="rowClass" value="even"/>
												</c:otherwise>
											</c:choose>
                                    
                                         <tr class="${rowClass }" onclick="getDetailCode('<c:out value="${cgList.group_code }"></c:out>', '<c:out value="${cgList.group_name }"></c:out>', '<c:out value="${cgList.version }"></c:out>')">
                                            <td><input name="groupCodeChecked" id="groupCodeChecked" class="" type="checkbox" value="${cgList.group_code }"/></td>
                                            <td><c:out value="${cgList.group_code }"></c:out></td>
                                            <td class="last"><c:out value="${cgList.group_name }"></c:out></td>
                                        </tr>
                                       </c:forEach>                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                  	</section>
                    <section class="sec_thirdX2" style="padding-right:1%">
                    	<h3 class="mt30">그룹 분류코드 등록/수정</h3>
                        <div class="listType1">
                        <form action="" name="groupCodeForm" id="groupCodeForm" method="post">
                        <input type="hidden" id="checkedValue" name="checkedValue" value=""/>
                            <table>
                                <caption>테이블</caption>
                                <colgroup>
                                    <col style="width:18%" />
                                    <col style="width:27%" />
                                    <col style="width:12%" />
                                    <col style="width:*%" />
                                </colgroup>
                                <tr>
                                    <th scope="row">코드그룹명</th>
                                    <td>
                                    	<input type="text" id="group_name" name="group_name"class="ipt_listIn" value=""/>
                                    	<input type="hidden" id="group_version" name="version" value="0"/>
                                    </td>
                                    <th scope="row">코드</th>
                                    <td  class="btn">
                                    	<input type="text" id="group_code" name="group_code" style="width:80px;" class="ipt_listIn2" value=""/>
                                        <span class="btn-pack btn-type_2" style="margin-left:5px;">
                                  			<a class="" href="#" onclick="codeGroupAddSubmit();"><span class="ico_v2"></span>등 록</a>
                                    	</span>
                                    	<span class="btn-pack btn-type_2" style="margin-left:5px;">
                                  			<a class="" href="#" onclick="codeGroupModiSubmit();"><span class="ico_modify"></span>수 정</a>
                                    	</span>
                        				<span class="btn-pack btn-type_2" style="margin-left:5px;">
                                                <a class="" href="#" onclick="codeGroupDeleteSubmit();"><span class="ico_x2"></span>삭 제</a>
                                            </span>
                        				
                                    </td>
                                </tr>
                            </table>
                            </form>
                        </div>
                        <!--//테이블1-->
                        <h3 class="mt5">하위 코드 등록/수정</h3>
                        <form name="detailCodeForm" id ="detailCodeForm" action="" method="post">
                        <input type="hidden" name="group_code1" id="group_code1" value=""/>
                        <input type="hidden" id ="version" name="version" value="0"/>
                        <div class="listType1">
                        
                        
                            <table>
                                <caption>테이블</caption>
                                <colgroup>
                                    <col style="width:15%" />
                                    <col style="width:27%" />
                                    <col style="width:15%" />
                                    <col style="width:*%" />
                                </colgroup>
                                <tr>
                                    <th scope="row">코드</th>
                                    <td>
                                    	
                                        <input type="text" id="detail_code" name="detail_code" class="ipt_listIn" value=""/> </td>
                                    <th scope="row">코드설명</th>
                                    <td>
                                    	<input type="text" id="val1" name="val1" style="width:120px;" class="ipt_listIn2" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">코드명</th>
                                    <td>
                                        <input type="text" id="detail_code_name" name="detail_code_name" class="ipt_listIn" value=""/>
                                    </td>
                                    <th scope="row">정렬순서</th>
                                    <td class="btn">
                                    	<input type="text" id="sort_seq" name="sort_seq" style="width:80px;" class="ipt_listIn2" value=""/>
                                         <span class="btn-pack btn-type_2" style="margin-left:5px;">
                                  			<a class="" href="#" onclick="codeDetailAddSubmit();"><span class="ico_v2"></span>등 록</a>
                                    	</span>
                                    	<span class="btn-pack btn-type_2" style="margin-left:5px;">
                                  			<a class="" href="#" onclick="codeDetailModiSubmit();"><span class="ico_modify"></span>수 정</a>
                                    	</span>
                                    	<span class="btn-pack btn-type_2" style="margin-left:5px;">
                                                <a class="" href="#" onclick="codeDetailDeleteSubmit();"><span class="ico_x2"></span>삭 제</a>
                                            </span>
                                    	
                                    </td>
                                </tr>
                            </table>
                       

                        </div>
                        </form>
                        <!--//테이블1-->
                        <h3 class="mt10">하위코드 등록/수정</h3>
                        <div class="tree_wrap" style="height:320px;">
                        	<div class="listType4">
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
                                    	                     
                                    </tbody>
                                </table>
                                </form>
                            </div><!--//테이블1-->
                        </div><!--//tree-->
                      
                    </section>
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
   <jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>
</body>
</html>
