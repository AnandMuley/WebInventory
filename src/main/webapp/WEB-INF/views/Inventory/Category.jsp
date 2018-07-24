
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
	<spring:url value="/addcategory" var="addCategoryurl" />
	<spring:url value="/addcategory" var="categoryDeleteurl" />
</head>
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
					<h1 class="page-header">
						<spring:message code="label.page.addCategory" />
					</h1>
				</div>

				<br> <br>
				<form:form class="mws-form" Commandname="addCategory"
					name="addCategoryForm" id="myForm" modelAttribute="addCategory"
					action="${addCategoryurl}" method="post">

					<div class="row">
						<div>
							<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.categoryName" /></label><input
								type="text" id="categoryName" name="categoryName"
								class="form-control"
								placeholder="<spring:message code="label.page.categoryName" />">
							<input type="hidden" id="categoryId" name="categoryId">
						</div>

						<div class="col-xs-3">
							<label><spring:message code="label.page.description" /></label><input
								type="text" id="categoryDescription" name="categoryDescription"
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
						<c:set var="showEdit" value="false" />
						<c:if
							test="${fn:contains(sessionScope.permissionList, 'Update Category' ) || sessionScope.userName=='admin'}">
							<c:set var="showEdit" value="true" />
							<c:set var="showDelete" value="true" />
							<button type="submit" class="btn btn-info">
								<spring:message code="label.page.updateButton" />
							</button>
						</c:if>
						<button type="reset" class="btn btn-info">
							<spring:message code="label.page.clear" />
						</button>
					</div>
					<input type="text" id="categoryId" name="categoryId"
						class="form-control" value="0" style="visibility: hidden">
				</form:form>
			</div>

			<!-- /.container-fluid -->
			<br> <br>

			<div class="row">

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<spring:message code="label.page.allCategory" />
							</div>
							<!-- /.panel-heading -->
							<div class="col-xs-12">
								<table id="dataTable" class="display">


									<thead>
										<tr>
											<th><spring:message code="label.page.srno" /></th>
											<th><spring:message code="label.page.categoryName" /></th>
											<th><spring:message code="label.page.description" /></th>
											<th><spring:message code="label.page.action" /></th>

										</tr>
									</thead>


									<tbody>


										<%
											int cnt = 1;
										%>
										<c:forEach var="addCategorylist" items="${addCategorylist}">

											<tr class="gradeA even" role="row">
												<td class="sorting_1"><%=cnt++%></td>
												<td>${addCategorylist.categoryName}</td>
												<td>${addCategorylist.categoryDescription}</td>
												<td class="center"><c:if test="${showEdit}">
														<a href="#"
															onclick="getCategoryDetails('${addCategorylist.categoryId}','${addCategorylist.categoryName}','${addCategorylist.categoryDescription}')">
															<img src="<%=request.getContextPath()%>/resources/images/edit-notes.png">
														</a>
													</c:if> <c:if test="${showDelete}">
														<a
															href="${categoryDeleteurl}/${addCategorylist.categoryId}?Deletecategorye"><img
															src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a>
													</c:if></td>
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
	$("#update").prop('disabled', false);
	function getCategoryDetails(catgoryeId, catgoryeName, catgoryeDecst) {

		$("#categoryId").val(catgoryeId);
		$("#categoryName").val(catgoryeName);
		$("#categoryDescription").val(catgoryeDecst);

		$("#save").prop('disabled', true);
		$("#update").prop('disabled', false);
	}
	$("#categoryName").blur(function(){
         var text = $("#categoryName").val()
        if(isEmpty(text))
        var transText = translatedText(text,"#categoryName");

    });
    $("#categoryDescription").blur(function(){
        var text = $("#categoryDescription").val()
        if(isEmpty(text))
        var transText = translatedText(text,"#categoryDescription");

    });


</script>


