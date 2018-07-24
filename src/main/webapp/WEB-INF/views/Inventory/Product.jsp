<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
<spring:url value="/addProduct" var="ProductDeleteurl" />
<spring:url value="/addProduct" var="addProductUrl" />
<div id="wrapper">

	<!-- Navigation -->

	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<spring:message code="label.menu.addProduct" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
				<form:form class="mws-form" Commandname="addProduct"
					name="addProductForm" id="myForm" modelAttribute="addProduct"
					action="${addProductUrl}" method="post">
					<div class="row">

						<div>
							<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-3">
							<label><spring:message code="label.page.productName" /></label>
							<input type="text" id="productName" name="productName"
								class="form-control"
								placeholder="<spring:message code="label.page.productName"/>">
						</div>
						<div class="col-xs-3">
							<label><spring:message
									code="label.page.productDescription" /></label> <input type="text"
								id="productDescription" name="productDescription"
								class="form-control"
								placeholder="<spring:message code="label.page.productDescription"/>">
							<!--<textarea class="form-control" rows="1"></textarea>-->
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.categoryName" /></label>
							<select name="categoryModel" id="categoryModel"
								class="form-control" style="width: 90%;">
								<option value="-1">---Select Category----</option>
								<c:forEach var="category" items="${categoryList}">
									<option value="${category.categoryId}">${category.categoryName}
									</option>
								</c:forEach>
							</select>
						</div>

						<div class="col-xs-3">
							<label><spring:message code="label.page.unitName" /></label> <select
								name="unitName" id="unitName" class="form-control"
								style="width: 90%;">
								<option value="-1">---Select Unit----</option>
								<c:forEach var="unit" items="${unitList}">
									<option value="${unit.unitName}">${unit.unitName}</option>
								</c:forEach>
							</select>

						</div>

						<div class="col-xs-3">
							<label><spring:message code="label.page.saleRate" /></label>
							<div class="form-group">
								<label class="sr-only" for=""><spring:message
										code="label.page.saleRate" /></label>
								<div class="input-group">
									<div class="input-group-addon">
										<spring:message code="label.page.rs" />
									</div>
									<input type="text" class="form-control" id="saleRate"
										name="saleRate"
										placeholder="<spring:message code="label.page.amount"/>" />
									<div class="input-group-addon">.00</div>
								</div>
							</div>
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.productQuantity" /></label>
							<input type="text" id="quantity" name="quantity"
								class="form-control"
								placeholder="<spring:message code="label.page.productQuantity"/>" />
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.vat" />(%)</label> <select
								name="gstPerc" id="gstPerc" class="form-control"
								style="width: 90%;">
								<option>---Select Vat----</option>
								<c:forEach var="gst" items="${gstList}">
									<option value="${gst.gstPercentage}">${gst.gstPercentage}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<br>
					<br>
					<div class="container">
						<button type="submit" class="btn btn-primary">
							<spring:message code="label.page.saveButton" />
						</button>
						<c:set var="showEdit" value="false" />
						<c:if
							test="${fn:contains(sessionScope.permissionList, 'Update Product' ) || sessionScope.userName=='admin'}">
							<c:set var="showEdit" value="true" />
							<button type="submit" class="btn btn-info">
								<spring:message code="label.page.updateButton" />
							</button>
						</c:if>
					</div>
					<input type="text" id="id" name="id" class="form-control" value="0"
						style="visibility: hidden">
				</form:form>
			</div>

			<!-- /.row -->
		</div>

		<!-- /.container-fluid -->
		<br> <br>
		<div class="row">

			<div class="col-xs-12">
				<table id="dataTable" class="display">
					<thead>
						<tr>
							<th><spring:message code="label.page.srno" /></th>
							<th style="display: none;"><spring:message code="label.page.productCode" /></th>
							<th><spring:message code="label.page.productName" /></th>
							<th><spring:message code="label.page.availableQty" /></th>
							<th><spring:message code="label.page.saleRate" /></th>
							<th><spring:message code="label.page.action" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="productObj" items="${productList }"
							varStatus="theCount">
							<tr class="gradeA odd" role="row">
								<td class="sorting_1">${theCount.count }</td>
								<td style="display: none;">${ productObj.id}</td>
								<td>${ productObj.productName}</td>
								<td>${ productObj.quantity}</td>
								<td>${ productObj.saleRate}</td>
								<c:if test="${showEdit}">
									<td class="center"><a href="#"
										onclick="fun('${ productObj.id}','${productObj.productName }','${productObj.productDescription }','${ productObj.quantity}','${productObj.gstPerc }','${ productObj.categoryModel.categoryId}','${ productObj.unitModel.id}','${ productObj.saleRate}')"><img
											src="resources/images/edit-notes.png"></a></td>
								</c:if>
								<c:if test="${showDelete}">
									<td class="center"><a
										href="addproductdelete.html?id=${ productObj.id}"><img
											src="resources/images/DeleteRed.png"></a></td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<!-- /#page-wrapper -->

</div>

<div id="modal-from-dom" class="modal hide fade">
	<div class="modal-header">
		<a href="#" class="close">&times;</a>
		<h3>Delete URL</h3>
	</div>
	<div class="modal-body">
		<p>You are about to delete one track url, this procedure is
			irreversible.</p>
		<p>Do you want to proceed?</p>
		<p id="debug-url"></p>
	</div>
	<div class="modal-footer">
		<a href="delete.php?ref=" class="btn danger">Yes</a>
		<!-- <a href="delete.php?some=param&ref=" class="btn danger">Yes 2</a> -->
		<a href="#" data-dismiss="modal" class="btn secondary">No</a>
	</div>
</div>

<script type="text/javascript">
	$('#dataTable').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});
	function fun(id, productName, productDisc, productQuantity, gstPerc,
			category, unit, saleRate) {
		$("#productId").val(id);
		$("#productName").val(productName);
		$("#productDescription").val(productDisc);
		$("#quantity").val(productQuantity);
		$("#gstPerc").val(vatPer);
		$("#categoryModel").val(category);
		$("#saleRate").val(saleRate);
		$("#unitModel").val(unit);

	};
	$("#productName").blur(function(){
             var text = $("#productName").val();
            if(isEmpty(text))
            var transText = translatedText(text,"#productName");

    });
    $("#productDescription").blur(function(){
        var text = $("#productDescription").val();
        if(isEmpty(text))
        var transText = translatedText(text,"#productDescription");

    });
    $("#saleRate").blur(function(){
             var text = $("#saleRate").val();
            if(!isEmpty(text) || $.isNumeric())
                alert("Please Enter Number only");

    });

</script>
<!-- /#wrapper -->


