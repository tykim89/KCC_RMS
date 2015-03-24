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
				var recFieldItemModiResult = '${recFieldItemModiResult}';
				var recFieldItemResult = '${recFieldItemResult}';
				var fieldItemDeleteResult = '${recFieldItemDeleteResult}';
				
				//alert(recFieldItemModiResult+"-"+recFieldItemResult+"-"+fieldItemDeleteResult);
				if(recFieldItemResult !="")
				{
					if(recFieldItemResult != 0)
					{
						alert("모집분야 항목 등록 성공.");					
					}else if(recFieldItemResult == 0)
					{
						alert("모집분야 항목 등록 실패.");
					}
				}
				if(recFieldItemModiResult !="")
				{
					if(recFieldItemModiResult != 0)
					{
						alert("모집분야 항목 수정 성공.");					
					}else if(recFieldItemModiResult == 0)
					{
						alert("모집분야 항목 수정 실패.");
					}
				}
				 if(fieldItemDeleteResult !="")
				{
					if(fieldItemDeleteResult != 0)
					{
						alert("모집분야 항목 삭제 성공.");					
					}else if(fieldItemDeleteResult == 0)
					{
						alert("모집분야 항목 삭제 실패.");
					}
				} 
				/*  $("tr").click(function(){
					   var obj = $(this);
					   obj.toggleClass("odd");
				   });	 */
			}
				
	);

	function rowClick(index, codeName, sortSeq, val, version)
	{
		 var id = 'checkedRecField'+index;
		
			if($("#detail_code").val()==index)
			{
				$("#detail_code").val("");
				$("#detail_code_name").val("");
				$("#sort_seq").val("");
				$("#val1").val("");
				$("#version").val("0");
			}else{
				$("#detail_code").val(index);
				$("#detail_code_name").val(codeName);
				$("#sort_seq").val(sortSeq);
				$("#val1").val(val);
				$("#version").val(version);
			}
	
	/* 	$("#detail_code_name").val(codeName);
		$("#sort_seq").val(sortSeq);
		$("#val1").val(val); */
		
		
	}
	function checkClick(index)
	{
		 var id = 'checkedRecField'+index;
			
		 if(!$("input[id=" + id + "]").prop("checked"))
		{
			
			$("input[id=" + id + "]").prop("checked", true);
			
		}else
		{
			$("input[id=" + id + "]").prop("checked", false);
			
		}  
	}
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
	   
	   
	   function addSubmit()
	   {
		 	if($("#detail_code_name").val()=="")
			{
			   alert("항목명을 입력하십시오.");
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
				   	 	$("#recFieldManageForm").attr("action", "<c:url value='/rms/jal/addItem.do'/>").submit();
					}
				}
			}	
	   }
	   
	   function modiSubmit()
	   {
		  	if($("#detail_code").val()=="")
			{
			   alert("수정할 항목을 선택하십시오.");
			}
		   	else
			{
		   		
		   		if($("#detail_code_name").val()=="")
				{
				   alert("항목명을 입력하십시오.");
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
					   	if(confirm("수정 하시겠습니까?"))
						{
					   		$("#recFieldManageForm").attr("action", "<c:url value='/rms/jal/modiItem.do'/>").submit();
						}
					}
				}	
		   		
			}
			
	   }
	   function deleteSubmit()
	   {
		   var checkString = getCheckedValue('checkedRecField');
		  
		   	if(checkString == '')
			{
			   alert("삭제할 항목을 선택하십시오.");
			}
		   	else
			{
		   		if(confirm("삭제 하시겠습니까?"))
		   		{			
					$("#checkedValue").val(checkString);					
			   		$("#recFieldManageForm").attr("action", "<c:url value='/rms/jal/deleteItem.do'/>").submit();
		   	
		   		}
			}
		   			
	   }
	 /*    $(document).ready(function(){
		   $("tr").click(function(){
			   var obj = $(this);
			   obj.toggleClass("selected");
		   });
	   });  */
</script>
<!-- <style type="text/css">
	.seleted{
	background-color:Red;
	}
</style> -->
</head>
<body onload="firstMenuList();">
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />
	<div id="wrap">
	<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 항목관리 &gt; <strong>지원서양식관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>모집분야항목관리</h1>
                <div class="contents">
                	
                    <section class="sec_thirdX2" style="padding-right:1%">
                    	                        <!--//테이블1-->
                        <h3 class="mt5">모집분야 등록/수정</h3>
                        <div class="listType1">
                        <form action="" id="recFieldManageForm" method="post">
                            <table>
                                <caption>테이블</caption>
                                <colgroup>
                                    <col style="width:12%" />
                                    <col style="width:13%" />
                                    <col style="width:7%" />
                                    <col style="width:13%" />
                                    <col style="width:7%" />
                                    <col style="width:29%" />
                                    <col style="width:*%" />
                                </colgroup>
                                <tr>
                                    <th scope="row">모집분야 항목명</th>
                                    <td>
                                    	<input type="hidden" id="group_code" name="group_code" value="REC_FIELD"/>
                                    	<input type="hidden" id="detail_code" name="detail_code" value=""/>
                                    	<input type="hidden" id="version" name="version" value="0"/>
                                    	<input type="hidden" id="checkedValue" name="checkedValue" value=""/>
                                        <input type="text" id="detail_code_name" style="width:100px;" name="detail_code_name" class="ipt_listIn" value=""/>
                                    </td>
                                    <th scope="row">우선순위</th>
                                    <td>
                                   		<input type="text" id="sort_seq" name="sort_seq" style="width:100px;" class="ipt_listIn2" value=""/>
                                    </td>
                                    <th scope="row">비 고</th>
                                    <td>
                                    	<input type="text" id="val1" name="val1" style="width:250px;" class="ipt_listIn2" value=""/>
                                    </td>
                                    <td class="btn">
                                    	  <span class="btn-pack btn-type_2" style="margin-left:5px;">
                                  			<a class="" href="#" onclick="addSubmit();"><span class="ico_v2"></span>등 록</a>
                                    	</span>
                                    	<span class="btn-pack btn-type_2" style="margin-left:5px;">
                                  			<a class="" href="#" onclick="modiSubmit();"><span class="ico_modify"></span>수 정</a>
                                    	</span>
                                    	<span class="btn-pack btn-type_2" style="margin-left:5px;">
                                                <a class="" href="#" onclick="deleteSubmit();"><span class="ico_x2"></span>삭 제</a>
                                        </span>                 	
                                    </td>
                                </tr>
                            </table>
                            </form>
                        </div>
                        <!--//테이블1-->
                        <h3 class="mt10">모집분야 항목 목록</h3>
                        <div class="tree_wrap" style="height:600px;">
                        	<div class="listType4">
                                <table>
                                    <caption>모집분야 항목 목록</caption>
                                    <colgroup>
                                        <col style="width:5%" />
                                        <col style="width:50%" />
                                        <col style="width:10%" />
                                        <col style="width:*%" />
                                    </colgroup>
                                    <thead>
                                        <tr> 
                                            <th scope="col"><input name="checkedAllRecField" id="checkedAllRecField" class="" type="checkbox" onchange="checkAll('checkedAllRecField', 'checkedRecField');"/></th>
                                            <th scope="col">코드명</th>
                                            <th scope="col">우선순위</th>
                                            <th scope="col">비    고</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="iList" varStatus="st" items="${itemList }">
                                    		<c:choose>
												<c:when test="${st.index %2 ==0 }">
													<c:set var="rowClass" value="odd"/>
												</c:when>
												<c:otherwise>
													<c:set var="rowClass" value="even"/>
												</c:otherwise>
											</c:choose>
                                    
                                        <tr class="${rowClass}" style='cursor:pointer;cursor:hand;'  onclick="rowClick('<c:out value='${iList.detail_code }'/>', '<c:out value='${iList.detail_code_name}'/>','<c:out value='${iList.sort_seq}'/>', '<c:out value='${iList.val1}'/>', '<c:out value='${iList.version}'/>');">
                                            <td><input name="checkedRecField" id="checkedRecField${iList.detail_code }" class="" type="checkbox" value="${iList.detail_code }" />
                                            </td>
                                            <td><c:out value="${iList.detail_code_name }"></c:out></td>
                                            <td><c:out value="${iList.sort_seq }"></c:out></td>
                                            <td class="last"><c:out value="${iList.val1 }"></c:out></td>
                                       
                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
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