
<html>
<head><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
</head>
<body>
	<spring:url value="/addUnit" var="addUnitUrl" />
	<spring:url value="/deleteUnit" var="deleteUnitUrl" />
	<spring:url value="/updateUnit" var="updateUnitUrl" />
	<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
	<div id="wrapper">

		<!-- Navigation -->

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							<spring:message code="label.page.addUnit" />
						</h1>
					</div>

					<br> <br>
					<form:form class="mws-form" Commandname="addUnit" name="addUnit"
						id="myForm" modelAttribute="addUnit" action="${addUnitUrl}"
						method="post">


						<div class="row">
							<div>
								<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
							</div>
							<div class="col-xs-3">
								<label><spring:message code="label.page.unitName" /></label><input
									type="text" id="unitName" name="unitName" class="form-control"
									placeholder="<spring:message code="label.page.unitName" />">
								<input type="hidden" id="unitId" name="unitId">
							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.description" /></label><input
									type="text" id="description" name="description"
									class="form-control"
									placeholder="<spring:message code="label.page.description" />">
							</div>



						</div>

						<br>
						<br>

						<div class="container">

							<button type="submit" id="save" name="save"
								class="btn btn-primary">
								<spring:message code="label.page.saveButton" />
							</button>
							
							<button type="reset" class="btn btn-info">
								<spring:message code="label.page.clear" />
							</button>
							<!--  	<button type="submit" class="btn btn-info">Update</button>-->
						</div>

					</form:form>
					<!-- /.row -->
				</div>

				<!-- /.container-fluid -->
				<br> <br>

				<div class="row">

					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<spring:message code="label.page.allUnit" />
								</div>
								<!-- /.panel-heading -->
								<div class="col-xs-12">
									<table id="dataTable" class="display">


										<thead>
											<tr>
												<th><spring:message code="label.page.srno" /></th>
												<th><spring:message code="label.page.unitName" /></th>
												<th><spring:message code="label.page.action" /></th>

											</tr>
										</thead>


										<tbody>

											<c:forEach items="${unitList}" var="unit"
												varStatus="theCount">
												<tr class="gradeA odd" role="row">
													<td class="sorting_1">${theCount.count}</td>
													<td>${unit.unitName}</td>

													<td class="center"><a
														href="${updateUnitUrl}/${unit.id}/${unit.active}"> <img
															src="<%=request.getContextPath()%>/resources/images/edit-notes.png">
															${unit.active==true? 'Inactive' : 'Active'}
													</a> &nbsp; <a href="${deleteUnitUrl}/${unit.id}"> <img
															src="<%=request.getContextPath()%>/resources/images/edit-notes.png">Delete
													</a>&nbsp;</td>

												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>

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
<script type="text/javascript">
	$('#dataTable').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});
</script>
<script>
	$("#update12").prop('disabled', false);
	function getGodownDetails(godownId, godownname, address1, sate, city,
			pinno, phoneno, incharge) {

		$("#addgodowanid").val(godownId);
		$("#addgodowanName").val(godownname);
		$("#addressLine1").val(address1);
		$("#state").val(sate);
		$("#city").val(city);
		$("#pinno").val(pinno);
		$("#phoneno").val(phoneno);
		$("#Incharge").val(incharge);
		$("#save").prop('disabled', true);
		$("#update12").prop('disabled', false);
	}
	$("#unitName").blur(function(){
         var text = $("#unitName").val()
        if(isEmpty(text))
        var transText = translatedText(text,"#unitName");

    });
    $("#description").blur(function(){
        var text = $("#description").val()
        if(isEmpty(text))
        var transText = translatedText(text,"#description");

    });

</script>
