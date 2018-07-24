<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row">


	<c:forEach items="${departmentList}" var="departmentObj">
		<div class="col-xs-3">
			<table class="table">
				<thead>
					<tr class="info">

						<!-- User Department -->
						<c:set var="isPermissionFound" value="false" />
						<c:forEach items="${userDeptRoleList}" var="userDeptObj">
							<c:if
								test="${userDeptObj.departmentModel.id == departmentObj.id}">
								<c:set var="isPermissionFound" value="true" />
								<td><input type="checkbox" value="${departmentObj.id}"
									class="checkbox" checked="checked" name="department[]" />${departmentObj.departmentName}
								</td>
							</c:if>
						</c:forEach>
						<c:if test="${isPermissionFound eq false}">
								<td><input type="checkbox" value="${departmentObj.id}"
									class="checkbox" name="department[]" />${departmentObj.departmentName}</td>
							</c:if>


						<!-- User Role-->
							<c:set var="isPermissionFound" value="false" />
						<c:forEach items="${userDeptRoleList}" var="userDeptObj">
							<c:if
								test="${userDeptObj.userDepartmentRole == 'Head' && userDeptObj.departmentModel.id == departmentObj.id}">
								<c:set var="isPermissionFound" value="true" />
								<td><input type="checkbox" value="Head"
									class="checkbox checkAll" checked="checked" name="HeadOrOther[]" />Head</td>
							</c:if>
						</c:forEach>
						<c:if test="${isPermissionFound eq false}">
								<td><input type="checkbox" value="Head"
									class="checkbox checkAll" name="HeadOrOther[]" />Head</td>
							</c:if>

						<c:set var="isPermissionFound" value="false" />
						<c:forEach items="${userDeptRoleList}" var="userDeptObj">
							<c:if
								test="${userDeptObj.userDepartmentRole == 'Other' && userDeptObj.departmentModel.id == departmentObj.id}">
								<c:set var="isPermissionFound" value="true" />
								<td><input type="checkbox" value="Other"
									class="checkbox oherCheck" checked="checked" name="HeadOrOther[]" checked="checked" />Other
								</td>
							</c:if>
						</c:forEach>
						
							<c:if test="${isPermissionFound eq false}">
								<td><input type="checkbox" value="Other"
									class="checkbox oherCheck" name="HeadOrOther[]" />Other</td>
							</c:if>

					</tr>
				</thead>
				<tbody>
					<c:set var="departmentPermissionList"
						value="${departmentObj.departmentPermissionModel}" />
					<c:forEach items="${departmentPermissionList}"
						var="departmentPermissionObj">
						<tr>
						<c:set var="isPermissionFound" value="false" />
						<c:forEach items="${userPermissionList}" var="userPermission">		
							<c:if
								test="${userPermission == departmentPermissionObj.departmentPermission}">
							<c:set var="isPermissionFound" value="true" />
							<td colspan="3"><input type="checkbox"
								value="${departmentPermissionObj.departmentPermission}"
								class="checkbox checkDepartment" checked="checked" name="permission[]" />${departmentPermissionObj.departmentPermission}</td>
							</c:if>
						</c:forEach>
							<c:if test="${isPermissionFound eq false}">
								<td colspan="3"><input type="checkbox"
								value="${departmentPermissionObj.departmentPermission}"
								class="checkbox checkDepartment" name="permission[]" />${departmentPermissionObj.departmentPermission}</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:forEach>


	<div align="center">
		<input type="button" value="Save User Permissions"
			class="btn btn-default" onClick="checkUncheck();" />
	</div>
</div>
<script type="text/javascript">
	$(".checkAll").change(
			function() {

				if ($(this).prop('checked')) {
					$(this).closest("table").children('tbody')
							.find(":checkbox").each(function() {
								$(this).prop('checked', true);
							});
				} else {
					$(this).closest("table").children('tbody')
							.find(":checkbox").each(function() {
								$(this).prop('checked', false);
							});
				}

				$(this).parent('td').prev('td').find(":checkbox").prop(
						'checked', true);
				$(this).parent('td').next('td').find(":checkbox").prop(
						'checked', false);
			
			});

	$(".oherCheck").change(
			function() {

				$(this).closest("table").children('tbody').find(":checkbox")
						.each(function() {
							$(this).prop('checked', false);
						});
				$(this).parent('td').prev('td').find(":checkbox").prop(
						'checked', false);
			});

	$(".checkDepartment").change(
			function() {

				$(this).closest("table").children('thead').children('tr')
						.children('td:first-child').find(":checkbox").prop(
								'checked', true);

			});

	function checkUncheck() {

		$('table').each(function() {

			var check1 = "";
			$(this).children('tbody').find(":checkbox").each(function() {
				if ($(this).prop('checked')) {
					check1 = 1;
					return true;
				}

			});
			if (check1 != "1") {
				$(this).children('thead').find(":checkbox").each(function() {
					$(this).prop('checked', false);
				});
			}
		});

		//  return true;
		var formData = $("#userPermissionForm").serialize();

		$.ajax({
			url : "${pageContext.request.contextPath}/addUserPermission",
			type : "POST",
			data : formData,
			success : function(data) {
				location.reload(true);
				alert("User Permission Saved Successfully");
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert("err" + thrownError + xhr.responseText);

				return false;
			}
		});
		return true;

	}
</script>
