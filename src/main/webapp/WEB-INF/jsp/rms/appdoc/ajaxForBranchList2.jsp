<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javaScript" language="javascript">
</script>
<c:forEach items="${branchList2}" var="branchList2" varStatus="vs">
<option><c:out value="${branchList2.branch_name}"/></option>
</c:forEach>


