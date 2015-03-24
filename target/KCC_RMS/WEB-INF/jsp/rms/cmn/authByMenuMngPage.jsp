<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible"
	content="IE=Edge; text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/rms/cmn/base.css'/>" />
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javaScript" language="javascript">
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

   //선택된 권한에 따라서 사용 및 미사용메뉴 Ajax로 조회
   function getAuthByMenuList()
   {
      //흐리게
      //$("#usingMenuList").fadeTo(0,0.2);
      //차후에 로딩중 처리해야함

      $.post("<c:url value='/rms/cmn/getAuthByMenuUsingList.do'/>", $("#authByMenuMngForm").serialize(), function(html)
      {
         $("#usingMenuList").html(html);
      });

      $.post("<c:url value='/rms/cmn/getAuthByMenuUnusingList.do'/>", $("#authByMenuMngForm").serialize(), function(html)
      {
         $("#unusingMenuList").html(html);
      });
   }
   
   
   //권한에 체크된 메뉴 추가
   function addMenu()
   {
      var addTarget = getCheckedValue("unusingListCheckBtn");
      
      if(addTarget == "")
      {
         alert("<spring:message code='alert.add.noSelect' />");
      }
      else
      {
         if(confirm("<spring:message code='common.update.msg' />"))
         {
            $("#modifyTarget").val(addTarget);
            $("#authByMenuMngForm").attr("action", "<c:url value='/rms/cmn/addAuthByMenu.do'/>").submit();
         }
         else
         {
            $("#modifyTarget").val("");
         }
         
      }
   }
   
 	//권한에 체크된 메뉴 제거
   function removeMenu()
   {
      var removeTarget = getCheckedValue("usingListCheckBtn");
      
      if(removeTarget == "")
      {
         alert("<spring:message code='alert.remove.noSelect' />");
      }
      else
      {
         if(confirm("<spring:message code='common.update.msg' />"))
         {
            $("#modifyTarget").val(removeTarget);
            $("#authByMenuMngForm").attr("action", "<c:url value='/rms/cmn/removeAuthByMenu.do'/>").submit();
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
	<form id="authByMenuMngForm" name="authByMenuMngForm" action="" method="post">
		<input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="modifyTarget" name="modifyTarget" value="">
		<div id="wrap"><!-- wrap -->
			<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />
			<section id="contR"> <!-- contR --> 
				<section class="cont_top">
					<div class="path">
						<img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 관리자 &gt; <strong>권한별메뉴관리</strong>
					</div>
					
					<div class="name">
						<span class="name_st">관리자</span>님 반갑습니다.
					</div>
				</section> 
				
				<article>
					<h1>권한별메뉴관리</h1>
					<div class="contents"><!-- contents -->
		
						<section class="sec_half" style="padding-right:1%">
							<div class="listSearch_left">
								<select id="authSelect" name="authSelect" onchange="getAuthByMenuList()" class="select" title="" style="width: 185px">
									<option value="">선택</option>
									<c:forEach items="${authList}" var="authVO" varStatus="st">
										<option value="${authVO.auth_id}">${authVO.auth_name}</option>
									</c:forEach>
								</select>
							</div>
							
							<section class="sec_half2 mt10">
								<h3>사용 메뉴</h3>
								<div class="tree_wrap" style="height: 520px;">
									<div id="usingMenuList" class="listType4">
										<table>
											<caption></caption>
											<colgroup>
												<col style="width: 5%" />
												<col style="width: 20%" />
												<col style="width: *%" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col"><input name="" id="" class="" type="checkbox" /></th>
													<th scope="col">메뉴명</th>
													<th scope="col" class="last">메뉴설명</th>
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
							
							<section class="sec_half2_tit" style="height:320px; padding-top:200px;"> 
								<a href="#" class="move_right" onclick="removeMenu()"><img src="/KCC_RMS/images/rms/cmn/btn/move_right.gif" alt="제거"></a>
								<a href="#" class="move_left" onclick="addMenu()"><img src="/KCC_RMS/images/rms/cmn/btn/move_left.gif" alt="추가"></a>
							</section> 
							
							<section class="sec_half2 mt10" style="padding-right:1%">
								<h3>미사용 메뉴</h3>
								<div class="tree_wrap" style="height: 520px;">
									<div id="unusingMenuList" class="listType4">
										<table>
											<caption></caption>
											<colgroup>
												<col style="width: 5%" />
												<col style="width: 20%" />
												<col style="width: *%" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col"><input name="" id="" class="" type="checkbox" /></th>
													<th scope="col">메뉴명</th>
													<th scope="col" class="last">메뉴설명</th>
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
						</section>
					</div><!-- contents --> 
				</article> 
			</section><!-- contR -->
		</div><!-- wrap -->
		<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />
	</form>
</body>
</html>