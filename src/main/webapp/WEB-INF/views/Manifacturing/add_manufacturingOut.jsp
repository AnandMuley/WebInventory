<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<head>
        <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
     <spring:url value="/addManufacturing"  var ="ProductDeleteurl"/>
     </head>


<div id="wrapper">
	
	<!-- Navigation -->

	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Manufacturing Out</h1>
				</div>
				<!-- /.col-lg-12 -->
				<form:form modelAttribute="product" action="/addManufacturing/saveManufacturingOutProduct"
					method="post">
					
							<div class="row">
							
							 <div>
						   <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
					 <div class="col-xs-3">
							<label>Godowan</label>
							  <select name="godowanModel" id="godowanModel" class="form-control" style="width:90%;">
														    <option>---Select Godown---- </option>
													<c:forEach var="addgodowanlist" items="${addgodowanlist}">
													    <option value="${addgodowanlist.addgodowanId}">${addgodowanlist.addgodowanName} </option>
													</c:forEach>
							 </select>
						</div>
						   <div class="col-xs-3" style="width: 50%;">
							<label style="color: #0066FF; font-size: 13px;">Manufacturing
								Date</label> <input type="text" class="form-control" placeholder="Date"
								id="datepicker" name="ManufacturingDate">
							</div>
					 </div>
					<div class="row">
						<div class="col-xs-3">
							<label>Product Code</label>
							<form:input path="productCode" class="form-control"
								placeholder="Product code" id="productCode" />
						</div>
						<div class="col-xs-3">
							<label>Name</label>
							<form:input path="productName" class="form-control"
								placeholder="Name" id="productName" />
						</div>
						<div class="col-xs-3">
							<label>Product Description</label>
							<form:input path="productDisc" class="form-control"
								placeholder="Product Description" id="productDis" />
							<!--<textarea class="form-control" rows="1"></textarea>-->
						</div>
						<div class="col-xs-3">
							<label>Category</label>
							  <select name="categoryObj" id="categoryId" class="form-control" style="width:90%;">
														    <option>---Select Category---- </option>
													<c:forEach var="addCategorylist" items="${addCategorylist}">
													    <option value="${addCategorylist.categoryId}">${addCategorylist.categoryName} </option>
													</c:forEach>
							 </select>
						</div>

						<div class="col-xs-3">
							<label>Unit</label>
							<form:select path="unit" class="form-control" id="unit">
								<form:option value="">Select Unit</form:option>
								<form:option value="Pieces">Pieces</form:option>
								<form:option value="Kg">Kg</form:option>
								<form:option value="Meter">Meter</form:option>
								<form:option value="Box">Box</form:option>
								<form:option value="Gram">Gram</form:option>
								<form:option value="Litre">Litre</form:option>
							</form:select>
						</div>

						 <div class="col-xs-3">
							<label>Product Quantity</label>
							<form:input path="productQuantity" class="form-control"
								placeholder="productQuantity" id="productQuantity" />
						</div> 
						<div class="col-xs-3">
							<label>Vat(%)</label>
							<select name= "vatPercent" id="vatPercent" class="form-control" style="width:90%;">
														    <option>---Select Vat---- </option>
													<c:forEach var="addVatlist" items="${addVatlist}">
													 <option value="${addVatlist.vatPercent}">${addVatlist.vatPercent} </option>
													</c:forEach>
							</select>
						</div>
					</div>
					<br>
					<br>
					<form:input path="purchaseRate" id="purchaseRate" value="0" type="hidden" />
					<form:input path="productId" id="productId"  name="productId" type="hidden" />
					<input type="text" id="id" name="id" hidden="true">
					<div class="container">
						<button type="submit" class="btn btn-primary" id="save">Save</button>
						<button type="submit" class="btn btn-info">Update</button>
					</div>
           <input type="text" id="SaveOrUpdate" name ="SaveOrUpdate" class="form-control" value="Save" style="visibility: hidden"  >
				
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
							<th>Sr. No.</th>
							<th>Godown</th>
							<th>Product Code</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Date</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					                  <tbody>
												<c:forEach var="productObj" items="${outproductList }"
													varStatus="theCount">
													<tr class="gradeA odd" role="row">
														<td class="sorting_1">${theCount.count }</td>
														<td>${ productObj.productModel.godowanModel.addgodowanName}</td>
														<td>${ productObj.productModel.productCode}</td>
														<td>${ productObj.productModel.productName}</td>
														<td>${ productObj.quantity}</td>
														<td>${ productObj.manufacturingDate}</td>
														<td class="center"><a href="#"
															onclick="fun('${ productObj.id}','${productObj.productModel.productCode }','${productObj.productModel.productName }','${productObj.productModel.productDisc }','${productObj.productModel.godowanModel.addgodowanId }','${ productObj.quantity}','${productObj.productModel.purchaseRate }','${productObj.productModel.vatPercent }','${ productObj.productModel.unit}','${ productObj.manufacturingDate}','${ productObj.productModel.productId}')"><img
																src="<%=request.getContextPath()%>/resources/images/edit-notes.png" ></a></td>
																	<td class="center"> <a href="${ProductDeleteurl}/${productObj.id}?muOutProductdelete"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
																
														
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
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	
</script>
<script>
	function fun(id, productCode, productName, productDisc, addgodowanId,
			productQuantity, purchaseRate, vatPer, unit ,Date ,productId) {
		$("#SaveOrUpdate").val("Update");
		$("#save").prop('disabled',true);
		$("#productId").val(productId);
		$("#id").val(id);
		$("#productCode").val(productCode);
		$("#productName").val(productName);
		$("#productDis").val(productDisc);
		$("#godowanModel").val(addgodowanId);
		$("#productQuantity").val(productQuantity);
		$("#purchaseRate").val(purchaseRate);
		$("#vatPercent").val(vatPer);
		$("#datepicker").val("" + Date);
		 $("#godown option").each(function() {
			if ($(this).attr("selected") == "selected") {
				$(this).removeAttr("selected");
			}
		});
		var selectedIndex = "";
		$("#godown option").each(function() {
			if ($(this).text() == addgodowanName) {
				selectedIndex = $(this).val();
				$(this).attr('selected', 'selected');
			}
		});
		$("#godown").val(selectedIndex); 
		
		$("#unit option").each(function() {
			if ($(this).attr("selected") == "selected") {
				$(this).removeAttr("selected");
			}
		});
		$("#unit option").each(function() {
			if ($(this).text() == unit) {
				selectedIndex = $(this).val();
				$(this).attr('selected', 'selected');
			}
		});
		$("#unit").val(selectedIndex);
	};
</script>
<script type="text/javascript">
	$("#datepicker").datepicker({
		format : 'dd-mm-yyyy'
	}).datepicker("setValue", new Date());
	
</script>
<!-- /#wrapper -->


