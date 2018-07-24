<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
<spring:url value="/addUserPermission" var="addUserPermission" />

</head>

<body>

	<div id="wrapper">
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<%-- <form:form method="POST" action="${addUserPermission}" onsubmit="removeUnnecessaryCheck();"> --%>
					<form:form id="userPermissionForm">
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">User Permission</h1>
						</div>
						<div class="col-xs-3">
							<label>Select User :</label> <select class="form-control"
								id="userId" name="userName" onchange="getUserPermission(this.value)">
								<option>---Select User---</option>
								<c:forEach items="${listUser}" var="userObj">
									<option value="${userObj.userId}">${userObj.userName}</option>
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
function getUserPermission(value)
{
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/addUserPermission/getUserPermission.html",
		data : "userId=" + value,
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