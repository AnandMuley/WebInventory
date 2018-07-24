<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>

<link href="/resources/FileStyle/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"
	src="/resources/FileStyle/bootstrap-filestyle.js">
	
</script>
<spring:url value="/importProductFromExcel" var="importProduct" />
<spring:url value="/addcategory" var="categoryDeleteurl" />
</head>
<body>

	<div id="wrapper">
		<!-- Navigation -->

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<form:form class="mws-form" method="POST"
					enctype="multipart/form-data" action="${importProduct}">
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">Import Product</h1>
						</div>
						<div>
						<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						</div>
						<!-- /.col-lg-12 -->
						<div class="col-xs-3">
							<label>Choose Godown</label><select id="godownId"
								name="godownName[]" class="form-control" multiple>
								<c:forEach items="${addGodowanlist}" var="godown">
									<option value="${godown.addgodowanId}">${godown.addgodowanName}</option>
								</c:forEach>

							</select>
						</div>
						<div class="col-xs-3">
							<label>Choose File</label><input type="file" class="filestyle"
								data-buttonName="btn-primary" name="file">
						</div>
					</div>
					<br>
					<br>
               <br><br> 	
					<div class="container">
						<button type="submit" id="save" name="save"
							class="btn btn-primary">Import</button>
					</div>
				</form:form>
			</div>
			<!-- /.row -->
			<br>
			<br>


		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->


</body>
<script>
	$(":file").filestyle({
		buttonName : "btn-primary"
	});
	
</script>

</html>
