<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form id="userAjaxForm" name="userAjaxForm" method="post">
	<input type="hidden" id="adminTarget" name="adminTarget" value="">
	<table>

		<colgroup>
			<col style="width: 5%" />
			<col style="width: 5%" />
			<col style="width: 15%" />
			<col style="width: *%" />
			<col style="width: *%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: *%" />
			<col style="width: *%" />
			<col style="width: 5%" />
			<col style="width: *%" />
			<col style="width: *%" />
			<col style="width: 10%" />
			<col style="width: 5%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col" rowspan="2"><input type="checkbox"
					id="checkAllBtn" name="checkAllBtn" onclick="checkAll()"></th>
				<th scope="col" rowspan="2">번 호</th>
				<th scope="col" rowspan="2">채용공고</th>
				<th scope="col" rowspan="2">지원분야</th>
				<th scope="col" rowspan="2">경력구분</th>
				<th scope="col" rowspan="2">입사지원일시</th>
				<th scope="col" rowspan="2">이름</th>
				<th scope="col" rowspan="2">생년월일</th>
				<th scope="col" rowspan="2">지역</th>
				<th scope="col" rowspan="2">시험유무</th>
				<th scope="col" colspan="2">검토결과건수</th>
				<th scope="col" rowspan="2">전형상태</th>
				<th scope="col" rowspan="2" class="last">전형일정여부</th>
			</tr>
			<tr>
				<th scope="col">검토전체</th>
				<th scope="col">검토합격</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${userList.size() == 0}">
				<tr class="odd">
					<td colspan="13" style="text-align: center;"><spring:message
							code="info.nodata.msg" /></td>
				</tr>
			</c:if>
			<c:forEach var="i" items="${ userList }" varStatus="st">
				<c:choose>
					<c:when test="${st.index % 2 == 1}">
						<c:set var="rowClass" value="odd" />
					</c:when>
					<c:otherwise>
						<c:set var="rowClass" value="even" />
					</c:otherwise>
				</c:choose>
				<tr class="${rowClass }">
					<td scope="col"><input type="checkbox" id="checkBtn"
						name="checkBtn${st.index}" value="${i.app_user_no}"></td>
					<td class="num" style="cursor: pointer; curosr: hand;"
						onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.num}</td>
					<td class="" style="cursor: pointer; curosr: hand;"
						onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.rec_noti_title}</td>
					<td class="" style="cursor: pointer; curosr: hand;"
						onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.rec_field_name}</td>
					<td class="" style="cursor: pointer; curosr: hand;"
						onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.career_div_code}</td>
					<td class="num" style="cursor: pointer; curosr: hand;"
						onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.write_date}</td>
					<td class="" style="cursor: pointer; curosr: hand;"
						onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.app_user_name}</td>
					<td class="" style="cursor: pointer; curosr: hand;"
						onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.app_user_birth
						}</td>
					<td class="" style="cursor: pointer; curosr: hand;"
						onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">서울</td>
					<td>O</td>
					<c:choose>
						<c:when
							test="${i.rec_res_code == '합격' || i.rec_res_code == '진행중'}">
							<td class="tb_style_1">${i.countAll}</td>
							<c:choose>
								<c:when test="${i.countPass >= 1 }">
									<td class="tb_style_1">${i.countPass}</td>
								</c:when>
								<c:otherwise>
									<td class="tb_style_1">0</td>
								</c:otherwise>
							</c:choose>

							<td class="tb_style_1">${i.step_item_code}전형
								${i.rec_res_code}</td>

							<c:choose>
								<c:when
									test="${i.rec_sch_content == null || i.rec_sch_content == ''}">
									<td class="tb_style_1" style="cursor: pointer; curosr: hand;"
										onclick="gotoScheduler('${i.app_user_no}', '${i.rec_noti_no }', '${i.step_item_code}','${i.rec_res_code}')">
										<input type="hidden" id="schNo" name="schNo" value="N">NO
									</td>
								</c:when>
								<c:otherwise>
									<td class="tb_style_1 last"
										style="cursor: pointer; curosr: hand;"
										onclick="gotoScheduler('${i.app_user_no}', '${i.rec_noti_no }', '${i.step_item_code}','${i.rec_res_code}')">
										<input type="hidden" id="schYes" name="schYes" value="Y">YES
									</td>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<td class="tb_style_1 font_color_red">${i.countAll}</td>
							<c:choose>
								<c:when test="${i.countPass >= 1 }">
									<td class="tb_style_1 font_color_red">${i.countPass}</td>
								</c:when>
								<c:otherwise>
									<td class="tb_style_1 font_color_red">0</td>
								</c:otherwise>
							</c:choose>
							<td class="tb_style_1 font_color_red">${i.step_item_code}전형
								${i.rec_res_code}</td>
							<c:choose>
								<c:when
									test="${i.rec_sch_content == null || i.rec_sch_content == ''}">
									<td class="tb_style_1 font_color_red"
										style="cursor: pointer; curosr: hand;"
										onclick="gotoScheduler('${i.app_user_no}', '${i.rec_noti_no }', '${i.step_item_code}','${i.rec_res_code}')">
										<input type="hidden" id="schNo" name="schNo" value="N">NO
									</td>
								</c:when>
								<c:otherwise>
									<td class="tb_style_1 font_color_red last"
										style="cursor: pointer; curosr: hand;"
										onclick="gotoScheduler('${i.app_user_no}', '${i.rec_noti_no }', '${i.step_item_code}','${i.rec_res_code}')">
										<input type="hidden" id="schYes" name="schYes" value="Y">YES
									</td>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>

				</tr>

			</c:forEach>
		</tbody>
	</table>
	<br>
	<br>
	<div class="pager">
		<div id="paging">
			<ui:pagination paginationInfo="${paginationInfo}" type="image"
				jsFunction="fn_egov_link_page" />
			<form:hidden path="pageIndex" />
		</div>
	</div>
</form>