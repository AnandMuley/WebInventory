<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>

<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>

<spring:url value="/addsrn" var="addSrnurl" />
<spring:url value="/addcategory" var="categoryDeleteurl" />
<script>
	function validate_form() {
		var arrAvailableQty = [];
		var arrQty = [];
		$("#dataTable tr").each(
				function() {
					var val = $(this).find("td:first").next().next().find(
							'input:checkbox:checked').val();

					if (!isNaN(val)) {
						arrAvailableQty.push($(this).find("td:first").next()
								.next().next().find('input').val());
						arrQty.push($(this).find("td:first").next().next()
								.next().next().find('input').val());
					}
				});

		var formData = $("#myForm").serialize();
		formData += "&arrAvailableQty=" + encodeURIComponent(arrAvailableQty);
		formData += "&arrQty=" + encodeURIComponent(arrQty);
		$.ajax({
			url : "${pageContext.request.contextPath}/addsrn",
			type : "POST",
			data : formData,
			success : function(data) {
				location.reload(true);
				alert("SRN saved successfully");
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert("err" + thrownError + xhr.responseText);

				return false;
			}
		});
		return true;
	}
</script>

</head>

<body>
	<div id="page-wrapper">
		<div class="container-fluid">
			<form:form class="mws-form" id="myForm">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Generate SRN</h1>
					</div>
					<div style="margin-top: 20px;"
						class="alert alert-success alert-dismissable"
						id="srnSavedSuccessfully">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">&times;</button>
						<strong>Success: </strong>SRN Added successfully.
					</div>
					<div class="col-xs-3">
						<label>SRN No : </label><input class="form-control" type="text"
							value="${srnNo}" readonly />
					</div>
					<div class="col-xs-3">
						<label>Project</label> <select name="projectId" id="projectId"
							class="form-control" style="width: 90%;">
							<option>---Select Project----</option>
							<c:forEach items="${projectlist}" var="productObj">
								<option value="${productObj.projectId}">${productObj.projectname}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-xs-3" style="width: 50%;">
						<label style="color: #0066FF; font-size: 13px;">SRN Date</label> <input
							type="text" class="form-control" placeholder="Date"
							id="datepicker" name="srnDate">
					</div>
					<div class="col-xs-12">
						<table id="dataTable" class="display">
							<thead>
								<tr>
									<th>Sr. No.</th>
									<th>Godown</th>
									<th>Product</th>
									<th>Available Qty</th>
									<th>Qty</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${productList}" var="productObj"
									varStatus="theCount">
									<tr>
										<td><c:out value="${theCount.count}"></c:out></td>
										<td><input type="text"
											value="${productObj.godowanModel.addgodowanName}"
											name="godownId[]" readonly /></td>
										<td><input type="checkbox"
											value="${productObj.productId}" name="productId[]" /><span
											class="sis_form_key">${productObj.productName}</span></td>
										<td><input type="text"
											value="${productObj.productQuantity}"
											name="productAvailQty[]" readonly /></td>
										<td><input type="text" value="0" name="productQty[]" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
				<br>
				<br>
				<div class="container">
					<button type="button" id="save" name="save" class="btn btn-primary"
						onclick="validate_form();">Save</button>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>
<script type="text/javascript">
$("#srnSavedSuccessfully").hide();
	$('#dataTable').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});

	$("#datepicker").datepicker({
		format : 'dd-mm-yyyy'
	}).datepicker("setValue", new Date());
</script>

