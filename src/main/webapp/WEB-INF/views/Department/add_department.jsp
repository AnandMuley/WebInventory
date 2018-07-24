<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
<spring:url value="/addDepartment" var="addDepartment" />
<spring:url value="/addDepartment" var="deptDeleteurl" />
</head>

<body>

	<div id="wrapper">
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<form:form method="POST" action="${addDepartment}"
					modelAttribute="departmentModel" commandName="departmentModel">
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">Create Department</h1>
						</div>

						<!-- /.col-lg-12 -->

						<form:input path="id" type="text" style="display:none;"
							placeholder="Department" id="departmentId" />

						<div class="col-xs-3">
							<label>Department Name :</label>
							<form:input path="departmentName" id="departmentName" type="text"
								class="form-control" placeholder="Department" />
						</div>
					</div>
					<!-- /.row -->
					<br>
					<br>
					<div class="container">
						<button type="submit" class="btn btn-primary">Save</button>
						<button type="submit" class="btn btn-info">Update</button>
					</div>
				</form:form>
				<div class="col-xs-12">
					<table id="dataTable1" class="display">
						<thead>
							<tr>
								<th>Sr. No.</th>
								<th>Department Name</th>
								<c:set var="showEdit" value="false" />
								<c:if
									test="${fn:contains(sessionScope.permissionList, 'Update Department' ) || sessionScope.userName=='admin'}">
									<c:set var="showEdit" value="true" />
									<th>Edit</th>
								</c:if>
								<th>Delete</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${departmentList}" var="deptObj"
								varStatus="theCount">
								<tr>
									<td><c:out value="${theCount.count}"></c:out></td>
									<td>${deptObj.departmentName}</td>
										<c:if test="${showEdit}">
									<td><a href="#"
										onClick="viewDepartment('${deptObj.id}','${deptObj.departmentName}')"><img
											src="<%=request.getContextPath()%>/resources/images/edit-notes.png"></a></td>
									</c:if>
									<td class="center"><a
										href="${deptDeleteurl}/${deptObj.id}?deleteDept"><img
											src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>


								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->


</body>

</html>
<script>
	$('#dataTable1').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});
	function viewDepartment(id, departmentName) {

		$("#departmentName").val(departmentName);
		$("#departmentId").val(id);

	}
</script>