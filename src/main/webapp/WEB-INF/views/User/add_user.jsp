<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
<spring:url value="/addUser" var="addUser" />
  <spring:url value="/addUser"  var ="userDeleteurl"/>
</head>

<body>

	<div id="wrapper">
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<form:form method="POST" action="${addUser}" modelAttribute="userModel" commandName="userModel">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Create User</h1>
					</div>
				
					<!-- /.col-lg-12 -->
					<form:input path="userId" type="text" style="display:none;"
							placeholder="user" id="userId"/>
					
						<form:input path="userRoll" type="text" style="display:none;"
							placeholder="userRoll" id="userRoll" value="1"/>
					
					<div class="col-xs-3">
						<label>User Id :</label>
						<form:input path="userName" id="userName" type="text" class="form-control"
							placeholder="User" />
					</div>
					<div class="col-xs-3">
						<label>Password :</label>
						<form:input path="password" id="password" type="text" class="form-control"
							placeholder="password" />
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
							<th>User Id</th>
							<th>Password</th>
							<th>Edit</th>
							<th>Delete</th>
						
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="userObj"
							varStatus="theCount">
							<tr>
								<td><c:out value="${theCount.count}"></c:out></td>
								<td>${userObj.userName}</td>
								<td>${userObj.password}</td>
								<td><a href="#" onClick="viewDepartment('${userObj.userId}','${userObj.userName}','${userObj.password}')"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png"></a></td>
									<td class="center"> <a href="${userDeleteurl}/${userObj.userId}?deleteUser"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
									
									
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
$('#dataTable1').dataTable( {
    "bJQueryUI": true,
    "sPaginationType": "full_numbers",
    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
   
   } );
   function viewDepartment(id,userName,password)
   {
	  
	   $("#userName").val(userName);
	   $("#userId").val(id);
	   $("#password").val(password);
	  
   }
</script>