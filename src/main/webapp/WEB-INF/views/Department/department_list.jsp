<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
<spring:url value="/addDepartmentPermission" var="addDepartmentPermission" />
<spring:url value="/addDepartment" var="deptDeleteurl" />
</head>

<body>

	<div id="wrapper">
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<form:form method="POST" action="${addDepartmentPermission}">
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">Department Module</h1>
						</div>
						<div class="col-xs-3">
							<label>Select Department :</label> <select class="form-control"
								id="departmentId" name="departmentName" onchange="getDepartmentModule(this.value)">
								<option>---Select Department---</option>
								<c:forEach items="${listDepartment}" var="departmentObj">
									<option value="${departmentObj.id}">${departmentObj.departmentName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div id="deptModuleId" class="col-md-12">
					
					
					</div>
					
					<!-- /.row -->
				</form:form>

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>

</html>
<script>
function getDepartmentModule(value)
{
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/addDepartmentPermission/getDepartmentPermission.html",
		data : "deptId=" + value,
		success : function(data) 
		{
			$("#deptModuleId").html(data);
		},
		error : function(e) {
			alert(e);
		}
	});	
}
</script>