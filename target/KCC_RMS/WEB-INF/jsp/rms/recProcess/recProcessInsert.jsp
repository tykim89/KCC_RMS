<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
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

$(document).ready();

function init()
{
   if ($("#message").val() != "" && $("#message").val() != undefined)
   {
      alert($("#message").val());
   }
}

//전체 체크
function checkAll(allBtnId, checkBtnId)
{
   if ($("#" + allBtnId).is(":checked"))
   {
      $("input[id=" + checkBtnId + "]").prop("checked", true);
   }
   else
   {
      $("input[id=" + checkBtnId + "]").prop("checked", false);
   }
}

//체크된 값 | 구분자로 연결하여 리턴
function getCheckedValue(checkBtnId)
{
   var idList = [];
   var itemStr = "";

   $("input[id=" + checkBtnId + "]:checked").each(function()
   {
      idList.push(this.value)
   });

   $.each(idList, function(index, item)
   {
      itemStr += item + "|"
   });

   return itemStr;
}



function getUnUseStepList()
{
   $.post("<c:url value='/rms/recProcess/getUnUseStepList.do'/>", $("#recProcessInsert").serialize(), function(html)
         {
            $("#unUseProcess").html(html);
         });
}


function getUseStepList()
{
   $.post("<c:url value='/rms/recProcess/getUseStepList.do'/>", $("#recProcessInsert").serialize(), function(html)
         {
            $("#useProcess").html(html);
         });
}


//체크된 절차 항목 비사용
function unUseProcess()
{
   var unuseTarget = getCheckedValue("useProcessCheckBtn");
   
   if(unuseTarget == "")
   {
      alert("<spring:message code='alert.add.noSelect' />");
   }
   else
   {
      if(confirm("<spring:message code='common.update.msg' />"))
      {
         $("#modifyTarget").val(unuseTarget);
         $.post("<c:url value='/rms/recProcess/unUseProcessStepItem.do'/>", $("#recProcessInsert").serialize(), function(message)
               {
            		 $("#message").val(message);
            		 
            		  getUnUseStepList();

            		  getUseStepList();
               });
      }
      else
      {
         $("#modifyTarget").val("");
      }
      
   }
}


//체크된 절차 항목 사용
function useProcess()
{
   var useTarget = getCheckedValue("unUseProcessCheckBtn");
   
   if(useTarget == "")
   {
      alert("<spring:message code='alert.remove.noSelect' />");
   }
   else
   {
      if(confirm("<spring:message code='common.update.msg' />"))
      {
         $("#modifyTarget").val(useTarget);
         $.post("<c:url value='/rms/recProcess/useProcessStepItem.do'/>", $("#recProcessInsert").serialize(), function(message)
               {
            		 $("#message").val(message);
            		 
            		  getUnUseStepList();

            		  getUseStepList();
               });
      }
      else
      {
         $("#modifyTarget").val("");
      }
      
   }
}

</script>
 
</head>

<body onload="init();firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />
	<form id="recProcessInsert" name="recProcessInsert" action="" method="post">
		<input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="adminId" name="adminId" value="">
		<input type="hidden" id="modifyTarget" name="modifyTarget" value="">
		
    <div id="wrap">
		<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 항목관리 &gt; 채용절차관리 &gt;<strong>채용절차등록</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>채용절차관리</h1>
                <div class="contents">
                	<section class="sec_third mt30" style="padding-right:1%" >
                        <div class="listType3">
                            <table summary="">
                                <colgroup>
                                    <col width="18%" />
                                    <col width="*%"/>
                                </colgroup>
                                <tbody>
                                    <tr class="odd">
                                        <th>양식명</th>
                                        <td class="left"><input type="text" id="rec_prog_name" name="rec_prog_name" class="ipt_listIn" value=""/></td>
                                    </tr>
                                    <tr class="even">
                                        <th>메모</th>
                                        <td class="left">
                                            <textarea type="text" id="rec_prog_memo" name="rec_prog_memo" class="textarea_st" style="height:300px;" ></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!--//테이블1-->
                  	</section>
				  	<section class="sec_thirdX2 mt30" style="padding-right:1%">
                        <section class="sec_half2">
                        	<div class="tree_wrap" style="height: 250px;">
									<div id="unUseProcess" class="listType4">
										<table>
											<caption></caption>
											<colgroup>
												<col style="width: 10%" />
												<col style="width: 90%" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col"><input name="unUseProcessAllCheckBtn" id="unUseProcessAllCheckBtn" class="" type="checkbox" onchange="checkAll('unUseProcessAllCheckBtn','unUseProcessCheckBtn')"/></th>
													<th scope="col" class="last">선택</th>
												</tr>
											</thead>
											<tbody>			
											<c:forEach items="${stepItemList }" var="item" varStatus="st">
	                                        	<c:choose >
	                                        		<c:when test="${st.index % 2 == 0}">
	                                        			 <tr class="odd" >
	                                        				<td><input type="checkbox" id="unUseProcessCheckBtn" name="unUseProcessCheckBtn${st.index }" value="${item.detail_code}"></td>
	                                        			 	<td class="last" id="${item.detail_code }" ><a href="#" >${item.detail_code_name }</a></td>
	                                        			 </tr>
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<tr class="even">
	                                        				<td><input type="checkbox" id="unUseProcessCheckBtn" name="unUseProcessCheckBtn${st.index }" value="${item.detail_code}"></td>
	                                        				<td class="last" id="${item.detail_code }" ><a href="#" >${item.detail_code_name }</a></td>
	                                        			</tr>
	                                        		</c:otherwise>
	                                        	</c:choose>
	                                        </c:forEach>
											</tbody>
										</table>
									</div>
								</div>

                            <div class="btn mt10">
                                <span class="btn-pack btn-type_2" >
                                    <a class="" href="#"><span class="ico_v2"></span>추 가</a>
                                </span>
                                <span class="btn-pack btn-type_2" >                                
                                	<a class="" href="#"><span class="ico_x2"></span>삭 제</a>
                                </span>
                            </div>
                            </section>
                            
                            <section class="sec_half2_tit" style="height:160px; padding-top:100px;">
                                <a href="#" class="move_right" onclick="useProcess()"><img src="/KCC_RMS/images/rms/cmn/btn/move_right.gif" alt="사용"></a>
                                <a href="#" class="move_left" onclick="unUseProcess()"><img src="/KCC_RMS/images/rms/cmn/btn/move_left.gif" alt="미사용"></a>
                            </section>
                            
                                <section class="sec_half2">
                                    <div class="tree_wrap" style="height: 250px;">
										<div id="useProcess" class="listType4">
											<table>
												<caption></caption>
												<colgroup>
													<col style="width: 10%" />
													<col style="width: 90%" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col"><input name="" id="" class="" type="checkbox" /></th>
														<th scope="col" class="last">선택</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td colspan="3" style="text-align: center;"><spring:message code="common.alert.noSelect" /></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

                                </section>
                                
                                        <div class="pager">
				                    	<div class="paging_right">
				                            <span class="btn-pack btn-type_1">
				                        	<a class="" href="#"><span class="ico_v"></span>등 록</a>
				                        </span>
				                        <span class="btn-pack btn-type_5">
				                        	<a class="" href="#" onclick="document.location.href='./recProcessList.do'"><span class="ico_cancel"></span>취 소</a>
				                        </span>
				                        </div><!--//paging_right-->  
								    </div><!--//pager-->
                    </section>
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
    
    <jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />
    </form>	
</body>
</html>


