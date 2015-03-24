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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rms/cmn/base.css'/>" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>

<script type="text/javascript">

	function testResultInsert(){
		
		if(confirm("등록 하시겠습니까?")){
			$("#testResultForm").attr("action", "<c:url value='/rms/appmanage/insertTestResult.do'/>").submit();
		}
		
	}
	
</script>

</head>
<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />

	<form action="testResultSearch" name="testResultSearch" method="post">
		<input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="careerDiv" name="careerDiv" value="">
		<input type="hidden" id="recNoti" name="recNoti" value="">
		<input type="hidden" id="recStep" name="recStep" value=""> 
		<input type="hidden" id="recRes" name="recRes" value="">
		<input type="hidden" id="userId" name="userId" value="">

		<div id="wrap">
			<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />

			<section id="contR"><!--contR:시작--> <section
				class="cont_top">
			<div class="path">
				<img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 지원서관리 &gt; <strong>시험결과조회</strong>
			</div>
			<div class="name">
				<span class="name_st">관리자</span>님 반갑습니다.
			</div>
			</section> <article>
			<h1>시험결과조회</h1>
			<div class="contents">
				<div class="listSearch">
					<span class="btn-pack btn-type_5" id="searchFormBtn"> 
						<a href="#LINK" onClick="selectUserSearch()" tabindex="7">
					<span class="ico_ser"></span>검 색</a>
					</span>
				</div>
				<div class="listType1 mt10">
					<table>
						<colgroup>
							<col style="width: 100px;" />
							<col style="width: *" />
							<col style="width: 100px;" />
							<col style="width: *" />
							<col style="width: 100px;" />
							<col style="width: *" />
						</colgroup>
						<tr>
						<th scope="row">채용공고</th>
							<td><select id="recNotiSelect" class="select" title="" style="width: 185px" onchange="loadRecNoti()">
									<option value="">전체</option>
									<c:forEach var="i" items="${recNotiList }" varStatus="st">
										<option value="${i.rec_noti_no}">${i.rec_noti_title}</option>
									</c:forEach>
							</select></td>
							
							<th scope="row">경력구분</th>
							<td><select id="careerDivSelect" class="select" title="" style="width: 185px" onchange="loadCareerDiv()">
									<option value="">전체</option>
									<c:forEach var="i" items="${ careerDivList }" varStatus="st">
										<option value="${i.career_div_code}">${i.career_div_name}</option>
									</c:forEach>
							</select></td>

							<th scope="row">이름</th>
							<td class="btn"><input type="text" id="userName" name="userName"
								style="width: 180px;" class="ipt_listIn" />
							</td>
						</tr>
					</table>
				</div>
			</form>
				<!--//테이블2-->
			<form id="testResultForm" name="testResultForm" method="post" >
				<div class="listSearch mt20">
					<span class="btn-pack btn-type_1"> <a class="" href="#" onClick="testResultInsert()">
						<span class="ico_v"></span> 저 장 </a>
					</span>
				</div>
				
				<div class="listType2 mt10" >
					<table>
						<colgroup>
							<col style="width: 5%" />
							<col style="width: 20%" />
							<col style="width: 7%" />
							<col style="width: 7%" />
							<col style="width: 10%" />
							<col style="width: 10%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: *%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" rowspan="2">번 호</th>
								<th scope="col" rowspan="2">채용공고</th>
								<th scope="col" rowspan="2">지원분야</th>
								<th scope="col" rowspan="2">경력구분</th>
								<th scope="col" rowspan="2">입사지원일시</th>
								<th scope="col" rowspan="2">이름</th>
								<th scope="col" rowspan="2">생년월일</th>
								<th scope="col" rowspan="2">인성검사</th>
								<th scope="col" rowspan="2">직무적성검사</th>
								<th scope="col" rowspan="2" class="last">IT필기시험</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${userList.size() == 0}">
								<tr class="odd">
									<td colspan="14" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
								</tr>
							</c:if>
							
							<c:forEach var="i" items="${ userList }" varStatus="st">
								<c:choose>
									<c:when test="${st.index % 2 == 1}">
										<c:set var="rowClass" value="odd"/>
									</c:when>
									<c:otherwise>
										<c:set var="rowClass" value="even"/>
									</c:otherwise>
								</c:choose>
									<tr class="${rowClass }">
										<td class="num" style="cursor: pointer; curosr: hand;" >${i.num}</td>
										<td class="" style="cursor: pointer; curosr: hand;" >${i.rec_noti_title}</td>
										<td class="" style="cursor: pointer; curosr: hand;" >${i.rec_field_name}</td>
										<td class="" style="cursor: pointer; curosr: hand;" >${i.career_div_code}</td>
										<td class="num" style="cursor: pointer; curosr: hand;" >${i.write_date}</td>
										<td class="" style="cursor: pointer; curosr: hand;" >${i.app_user_name}</td>
										<td class="" style="cursor: pointer; curosr: hand;" >${i.app_user_birth }</td>
										<td><input type="text" style="width: 120px;" id="" name="TEI_0010|${i.app_user_no }|${i.rec_noti_no }" /></td>
										<td><input type="text" style="width: 120px;" id="" name="TEI_0020|${i.app_user_no }|${i.rec_noti_no }" /></td>
										<td class="last"><input type="text" style="width: 120px;" id="" name="TEI_0030|${i.app_user_no }|${i.rec_noti_no }" /></td>
									</tr>
								</c:forEach>
						</tbody>
					</table>
				
				<br><br>
				<div class="pager">
                    <div id="paging">
						<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
						<form:hidden path="pageIndex" />
					</div>
				</div>
				</div>
		</form>
	</div>
	</article>
	</section>
	</div>
	</form>
	<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />
	
</body>
</html>