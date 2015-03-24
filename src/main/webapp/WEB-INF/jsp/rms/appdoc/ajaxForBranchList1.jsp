<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javaScript" language="javascript">
</script>
<c:forEach items="${branchList1}" var="branchList1" varStatus="vs">
<option><c:out value="${branchList1.branch_name}"/></option>
</c:forEach>


