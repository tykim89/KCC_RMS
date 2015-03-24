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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/rms/cmn/base.css'/>" />
<script type="text/javaScript" language="javascript">

	function updateRecResult(){
		var item = "";
		
		// 구분자(|)로 선택된 전형단계항목과 전형결과 저장
		item = $("#stepItemSelect option:selected").val() + "|" + $("#recResultSelect option:selected").val();
		if (item == "|" || item==$("#stepItemSelect option:selected").val()+"|" || item=="|"+$("#recResultSelect option:selected").val()) {
			alert("<spring:message code='alert.add.noSelect' />");
		} else {
			if (confirm("<spring:message code='common.update.msg' />")) {
				$('#updateResultTarget').val(item);
				$("#resultForm").attr("action",	"<c:url value='/rms/appmanage/updateResult.do'/>").submit();
			}
		}
	}

	/* layPop */
	function layPop(id) {
		var layPopH = $(id).height();
		var layPopW = $(id).width();

		var topPos = (($(window).height() - layPopH) / 2);
		var leftPos = (($(window).width() - layPopW) / 2);
		$(id).css({
			'left' : leftPos,
			'top' : topPos
		});

		popup_bg();
		$(id).show();
		$("html").css("overflow", "hidden");

	}
	function layPopClose(id) {
		popup_bg_close();
		$(id).hide();
		$("html").css("overflow", "auto");
	}

	/* popup_bg */
	function popup_bg() {
		$(".popup_bg").height(($(document).height()));
		$(".popup_bg").show();
	}
	function popup_bg_close() {
		$(".popup_bg").hide();
	}
	
	$(document).ready(function(){
		
		layPop(recResultPop);
		
	})
	
</script>
</head>
<!-- loding_pop -->
	
	<div class="layPop" id="loding">
		<div class="loding">
			페이지를 불러오고 있습니다.
			<div class="logo">
				<img src="/KCC_RMS/images/rms/cmn/common/logo_loding.gif" alt="로딩 로고" />
			</div>
		</div>
	</div>
	<!-- //loding_pop -->


	<form id="resultForm" name="resultForm" method="post">
		<input type="hidden" id="updateResultTarget" name="updateResultTarget" value="">
		<input type="hidden" id="selectUsrTarget" name="selectUsrTarget" value="${selectUsrTarget}">	
	</form>
	<div class="layPop" id="recResultPop" name="recResultPop">
		<div class="wrap" style="width: 550px;">
			<div class="cont">
				<dl class="pop_list">
					<dt>전형결과 등록</dt>
					<dd>
						<div class="" style="height: 120px;">
							<div class="wcont">
								<div id="recResultList" class="listType1 mt10">
									<table>
										<colgroup>
											<col style="width: 20%" />
											<col style="width: 30%" />
											<col style="width: 20%" />
											<col style="width: *%" />
										</colgroup>
										<tr>
											<th scope="row">전형단계</th>
											<td><select id="stepItemSelect" name="stepItemSelect" class="select" title=""
												style="width: 110px">
													<option value="">선택</option>
													<c:forEach var="i" items="${ stepItemList }" varStatus="st">
														<option value="${i.stepItemCode}">${i.stepItemName}</option>
													</c:forEach>
											</select></td>
											<th scope="row">전형결과</th>
											<td><select id="recResultSelect" name="recResultSelect" class="select" title="" style="width: 110px">
													<option value="">선택</option>
													<c:forEach var="i" items="${ recResultList }" varStatus="st">
														<option value="${i.resultCode}">${i.resultName}</option>
													</c:forEach>
											</select></td>
										</tr>
									</table>
								</div>
								<!--//테이블2-->
								<div class="pop_btn">
									<span class="btn-pack btn-type_1"> <a class="" href="#LINK" onclick="updateRecResult()"><span
											class="ico_v"></span> 확 인 </a>
									</span>
								</div>
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="layPopClose(recResultPop);"><img
						src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
		</div>
	</div>

	
	<div class="popup_bg"></div>
	</html>
