
<html>
<head><%@ page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
</head>
<body>
	<spring:url value="/addManufacturing" var="addManufacturingurl" />
	<spring:url value="/addManufacturing" var="ManifacturingDeleteurl" />
	<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
	<div id="wrapper">

		<!-- Navigation -->

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<!--style="background:#23527C;color:#FFFFFF;"-->
						<h1 class="page-header">Add Manufacturing</h1>
					</div>

					<br> <br>
					<form:form class="mws-form" Commandname="addManufacturing"
						name="addManufacturingForm" id="myForm"
						modelAttribute="addManufacturing" action="${addManufacturingurl}"
						method="post">


						<div class="row">
							<div class="col-xs-3">
								<label>Manufacturing</label><input type="text"
									id="manufacturingName" name="manufacturingName"
									class="form-control" placeholder="Manufacturing">

							</div>

							<div class="col-xs-3">
								<label>Address Line1</label><input type="text" id="addressLine1"
									name="addressLine1" class="form-control"
									placeholder="Address Line1">
								<!--<textarea rows="1" class="form-control"></textarea>-->
							</div>
							<div class="col-xs-3">
								<label>Address Line2</label><input type="text" id="addressLine2"
									name="addressLine2" class="form-control"
									placeholder="Address Line2">
								<!--<textarea rows="1" class="form-control"></textarea>-->
							</div>
							<div class="col-xs-3">
								<label>State</label> <select id="state" name="state"
									class="form-control" onchange="getCityFromState(this.value);">
									<option value="0">---Select State---</option>
									<c:forEach items="${stateList}" var="state"
										varStatus="theCount">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>

							</div>
							<div class="col-xs-3">
								<label>City</label> <select id="city" name="city"
									class="form-control">
									<option value="0">---Select City---</option>
									<c:forEach items="${stateCityList}" var="stateCityList"
										varStatus="theCount">
										<option value="${cityList.cityName}">${cityList.cityName}</option>
									</c:forEach>
								</select>
							</div>

							<div class="col-xs-3">
								<label>Pin No.</label><input type="text" id="pinno" name="pinno"
									class="form-control" placeholder="Pin No.">
							</div>
							<div class="col-xs-3">
								<label>Phone No.</label><input type="text" id="phoneno"
									name="phoneno" class="form-control" placeholder="Phone No.">
							</div>
							<div class="col-xs-3">
								<label>Incharge</label><input type="text" id="Incharge"
									name="Incharge" class="form-control" placeholder="Incharge">
							</div>

						</div>

						<br>
						<br>

						<div class="container">

							<button type="submit" id="save" name="save"
								class="btn btn-primary">Save</button>
							<button type="submit" id="update12" name="update12"
								class="btn btn-info">Update</button>
						</div>
						<input type="text" id="manufacturingId" name="manufacturingId"
							class="form-control" style="visibility: hidden">
					</form:form>
					<!-- /.row -->
				</div>

				<!-- /.container-fluid -->
				<br> <br>

				<div class="row">

					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">All Manufacturing</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="dataTable_wrapper">
										<div id="dataTables-example_wrapper"
											class="dataTables_wrapper form-inline dt-bootstrap no-footer">
											<div class="row">
												<div class="col-sm-6">
													<div class="dataTables_length"
														id="dataTables-example_length">
														<label>Show <select
															name="dataTables-example_length"
															aria-controls="dataTables-example"
															class="form-control input-sm"><option value="10">10</option>
																<option value="25">25</option>
																<option value="50">50</option>
																<option value="100">100</option></select> entries
														</label>
													</div>
												</div>
												<div class="col-sm-6">
													<div id="dataTables-example_filter"
														class="dataTables_filter">
														<label>Search:<input type="search"
															class="form-control input-sm" placeholder=""
															aria-controls="dataTables-example"></label>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12">
													<table
														class="table table-striped table-bordered table-hover dataTable no-footer"
														id="dataTables-example" role="grid"
														aria-describedby="dataTables-example_info">
														<thead>
															<tr role="row">
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTables-example" rowspan="1"
																	colspan="1" aria-sort="ascending"
																	aria-label="Rendering engine: activate to sort column descending"
																	style="width: 156px;">Serial No.</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTables-example" rowspan="1"
																	colspan="1"
																	aria-label="Browser: activate to sort column ascending"
																	style="width: 181px;">Manufacturing</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTables-example" rowspan="1"
																	colspan="1"
																	aria-label="Engine version: activate to sort column ascending"
																	style="width: 135px;">Edit</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTables-example" rowspan="1"
																	colspan="1"
																	aria-label="CSS grade: activate to sort column ascending"
																	style="width: 97px;">Delete</th>
															</tr>
														</thead>
														<tbody>
															<%
																int cnt = 1;
															%>
															<c:forEach var="addManifacturinglist"
																items="${addManifacturinglist}">

																<tr class="gradeA odd" role="row">
																	<td class="sorting_1"><%=cnt++%></td>
																	<td>${addManifacturinglist.manufacturingName}</td>
																	<td class="center"><a href="#"
																		onclick="getManufacDetails('${addManifacturinglist.manufacturingId}','${addManifacturinglist.manufacturingName}','${addManifacturinglist.addressLine1}','${addManifacturinglist.addressLine2}','${addManifacturinglist.state}','${addManifacturinglist.city}','${addManifacturinglist.pinno}','${addManifacturinglist.phoneno}','${addManifacturinglist.incharge}')">
																		<img src="<%=request.getContextPath()%>/resources/images/edit-notes.png"> </a></td>
																	<td class="center"><a
																		href="${ManifacturingDeleteurl}/${addManifacturinglist.manufacturingId}?Deletemanufacturing"><img
																			src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
																</tr>

															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-6">
													<div class="dataTables_info" id="dataTables-example_info"
														role="status" aria-live="polite">Showing 1 to 2 of
														57 entries</div>
												</div>
												<div class="col-sm-6">
													<div class="dataTables_paginate paging_simple_numbers"
														id="dataTables-example_paginate">
														<ul class="pagination">
															<li class="paginate_button previous disabled"
																aria-controls="dataTables-example" tabindex="0"
																id="dataTables-example_previous"><a href="#">Previous</a></li>
															<li class="paginate_button active"
																aria-controls="dataTables-example" tabindex="0"><a
																href="#">1</a></li>
															<li class="paginate_button "
																aria-controls="dataTables-example" tabindex="0"><a
																href="#">2</a></li>
															<li class="paginate_button "
																aria-controls="dataTables-example" tabindex="0"><a
																href="#">3</a></li>
															<li class="paginate_button "
																aria-controls="dataTables-example" tabindex="0"><a
																href="#">4</a></li>
															<li class="paginate_button "
																aria-controls="dataTables-example" tabindex="0"><a
																href="#">5</a></li>
															<li class="paginate_button "
																aria-controls="dataTables-example" tabindex="0"><a
																href="#">6</a></li>
															<li class="paginate_button next"
																aria-controls="dataTables-example" tabindex="0"
																id="dataTables-example_next"><a href="#">Next</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>

	</div>
	<!-- /#page-wrapper -->
</body>

</html>
<script>
	$("#update12").prop('disabled', false);
	function getManufacDetails(manufacturingId, manufacturingName, address1,
			address2, sate, city, pinno, phoneno, incharge) {
		
		$("#manufacturingId").val(manufacturingId);
		$("#manufacturingName").val(manufacturingName);
		$("#addressLine1").val(address1);
		$("#addressLine2").val(address2);
		$("#state").val(sate);
		getCityFromState(sate);
		$("#city").val(city);
		$("#pinno").val(pinno);
		$("#phoneno").val(phoneno);
		$("#Incharge").val(incharge);
		$("#save").prop('disabled', true);
		$("#update12").prop('disabled', false);

	}
</script>
