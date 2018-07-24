

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


	<div id="page-wrapper">
		<div class="container-fluid">
			<form:form class="mws-form" id="myForm">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Purchase Order</h1>
					</div>
					<div class="col-xs-3" style="width: 50%;">
						<label>PO No.: ${purchaseOrder.poNo}<br>
						 Vendor Name : ${purchaseOrder.vendorModel.vendorName}<br> 
						Date : ${purchaseOrder.purchaseDate}</label><br> 
					</div>
					<div class="col-xs-12">
						<table id="dataTable1" class="display">
							<thead>
								<tr>
									<th>Sr. No.</th>
									<th>Product</th>
									<th>Quantity</th>
									<th>Unit</th>
									<th>Unit Cost</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${purchaseOrder.purchaseOrderDetailsList}" var="PODObj"
									varStatus="theCount">
									<tr>
										<td><c:out value="${theCount.count}"></c:out></td>
										<td>${PODObj.productName}</td>
										<td>${PODObj.quentity}</td>
										<td>${PODObj.unit}</td>
										<td>${PODObj.unitCost}</td>
									</tr>
								</c:forEach>
									
							</tbody>
						</table>
					</div>

				</div>
			    <br><br>
                 <div class="col-xs-12">
					<button type="button" id="save" name="save" class="btn btn-primary" onClick="closePopUp();">Cancel</button>
				</div>
			</form:form>
		</div>
	</div>

<script type="text/javascript">
	$('#dataTable1').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});
</script>

