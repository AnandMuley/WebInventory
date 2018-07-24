<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
<!--Date chooser  -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">

<!-- <script src="../resources/customeJs/purchaseOrder.js"></script> -->
<script>
	$(function() {
		$("#datepicker").datepicker();
		$("#datepickerdelivery").datepicker();
	});
	function loadProducts() {
		var total=0;
		var innerHtml = "";
		var dataToBeSent = $("#formId1").serialize();
		var url = "${pageContext.request.contextPath}/getProductsBySrn";
		$
				.post(
						url,
						dataToBeSent,
						function(data, textStatus) {
							for (var i = 0; i < data.length; i++) {
								var productObj = data[i];
								innerHtml += "<tr><td align='center'>"
										+ (i + 1)
										+ "</td><td><input style='border:0px' name='pname[]' type='text' value="
						+ productObj.productModel.productName + "></input></td><td><input style='border:0px' name='pquentity[]' type='text' value="
						+ productObj.quantity + "></input></td><td><input style='border:0px' name='punit[]' tye='text' value="
						+ productObj.productModel.unit + "></input></td><td><input style='border:0px' name='prate[]' type='text' value="
						+ productObj.productModel.purchaseRate + "></input></td><td><input style='border:0px' name='pamt[]' type='text' value="
										+ (productObj.productModel.purchaseRate)
										* (productObj.quantity)
										+ "></input></td></tr>";
								total+=eval((productObj.productModel.purchaseRate)
										* (productObj.quantity));
							}
							$("#productTable").html(innerHtml);
							$("#total").val(total);
							$("#netAmount").val(total);
						}, "json");
		
		
	}
	function getvendorInfo(vendorId) {
		if (vendorId == 0) {
			$("#phoneNo").val("");
			$("#email").val("");
			$("#addressLine1").val("");
			$("#addressLine2").val("");
		}
		$.getJSON('getVendorInfo/' + vendorId, function(data) {
			$("#phoneNo").val(data.phoneno);
			$("#email").val(data.email);
			$("#addressLine1").val(data.addressLine1);
			$("#addressLine2").val(data.addressLine2);
		});
	}
</script>
<style>
.polowersec {
	width: 100%;
	/*background: red;*/
}

.poleft {
	float: left;
	width: 45%;
	height: auto;
}

.poright {
	float: left;
	right: 0px;
	width: 45%;
	height: auto;
	width: 45%;
	/*background: blue;*/
}

.PO {
	clear: both;
	float: left;
}

.PO input {
	width: 100px;
	height: 24px;
	padding: 3px 8px;
	height: 24px;
}

.POrightinner {
	padding-left: 200px; //
	float: right;
}

.POrightinner input {
	border-radius: 0px;
}

.form-inline {
	color: #06F;
}
}
</style>
<div id="wrapper">
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<h1 class="page-header">Purchase Order</h1>
					<div
						style="color: #0066FF; float: right; margin-top: -18px; position: absolute; width: 400px; right: 10px; top: 16px">
					</div>
				</div>
			</div>
			<!-- /.col-lg-12 -->
			<div>
				<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
			</div>
			<form:form commandName="purchaseObj" id="formId">
				<div class="row">
					<div class="col-xs-3">
						<label>Vendor</label><select id="venderId" class="form-control"
							onchange="getvendorInfo(this.value);" name="vendorModel.id">
							<option value="0">---Select----</option>
							<c:forEach items="${vendorList}" var="vendorObj">
								<option value="${vendorObj.id}">${vendorObj.vendorName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-xs-3">
						<label>Ref</label><input type="text" class="form-control"
							placeholder="Ref" name="ref" id="ref">
					</div>
					<div class="col-xs-3"
						style="width: 170px !important; float: right;">
						<label>P.O. No.</label>
						
						<input type="text" class="form-control"
							placeholder="P.O. No." name="poNo" id="poNo" value="${poNo}" readonly="readonly">
					</div>
					<div class="col-xs-3"
						style="width: 170px !important; float: right;">
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${now}" pattern="dd/MM/yyyy" var="newdatevar" />
						<label style="color: #0066FF; font-size: 13px;">Purchase
							Date</label> <input type="text" class="form-control"
							 placeholder="Date" value="${newdatevar}"
							id="datepicker" name="purchaseDate">
					</div>
					
					<div class="col-xs-3">
						<label>Phone No.</label><input type="text" class="form-control"
							placeholder="Phone No." name="vendorModel" id="phoneNo">
					</div>
					<div class="col-xs-3">
						<label>Email</label><input type="text" class="form-control"
							placeholder="Email" name="email" id="email">
					</div>

					<div class="col-xs-3">
						<label>Address Line1</label> <input type="text"
							class="form-control" placeholder="Address line 1"
							name="addressLine1" id="addressLine1">

					</div>
					<div class="col-xs-3">
						<label>Address Line2</label> <input type="text"
							class="form-control" placeholder="Address line 2"
							name="addressLine2" id="addressLine2">

					</div>


					<div class="col-xs-12">
						<hr>
					</div>

				</div>
				<!-- /.container-fluid -->

				<br>

				<button type="button" class="btn btn-primary " data-toggle="modal"
					data-target="#myModal">Select PRN</button>
<br><br>
				<div class="col-xs-12">
					<table style="width: 99%" class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>Sr..</th>
								<th>Product Discribtion</th>
								<th>Quentity</th>
								<th>unit</th>
								<th>unit prize</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tbody id="productTable">

						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-xs-3">
						<label>Delivery date :</label> <input type="text"
							class="form-control " placeholder="Delivery date"
							id="datepickerdelivery" name="deliveryDate">
					</div>

					<div class="col-xs-3">
						<label>Total</label> <input type="text" class="form-control"
							placeholder="Total" name="total" id="total">
					</div>
					<div class="col-xs-3">
						<label>Vat&nbsp; &nbsp;&nbsp;  </label> <select id="vat" name="vat" onchange="addServiceTax(this.value)">
						<option value="0">--Select--</option>
						<c:forEach items="${vatList }" var="vatObj">
						<option value="${ vatObj.vatPercent}"> ${ vatObj.vatPercent}</option>
						</c:forEach>
						</select>
					</div>

					<div class="col-xs-3">
						<label>Service Tax</label> <select id="serviceTax" name="serviceTax" onchange="addServiceTax(this.value)">
						<option value="0">--Select--</option>
						<c:forEach items="${serviceTaxList }" var="serviceObj">
						<option value="${ serviceObj.servicetaxPercent}"> ${ serviceObj.servicetaxPercent}</option>
						</c:forEach>
						</select>
					</div>
					<div class="col-xs-3">
						<label>Excise Duty</label> <select id="excise" name="excise" onchange="addServiceTax(this.value)">
						<option value="0">--Select--</option>
						<c:forEach items="${exciseList }" var="exciseObj">
						<option value="${ exciseObj.excisePercent}"> ${ exciseObj.excisePercent}</option>
						</c:forEach>
						</select>
					</div>
					<div class="col-xs-3">
						<label>Import/Export Duty</label> <select id="import" name="importDuty"  onchange="addServiceTax(this.value)">
						<option value="0">--Select--</option>
						<c:forEach items="${importList }" var="importObj">
						<option value="${ importObj.import_export_percent}"> ${ importObj.import_export_percent}</option>
						</c:forEach>
						</select>
					</div>
					<div class="col-xs-3">
						<label>Net Amount</label> <input type="text" class="form-control "
							placeholder="Net Amount" name="netAmount" id="netAmount">
					</div>


					<br>
				</div>
				<br></br>

				<div class="col-xs-3">
					<button type="button" id="save" name="save" class="btn btn-primary" onclick="savePurchaseOrderDetails();">Save</button>
				</div>
			</form:form>

		</div>
	</div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Select PRN</h4>
			</div>
			<form action="" id="formId1">
				<div class="modal-body">
					<table class="dataTable">

							<tr>

								<c:forEach items="${prnList}" var="prnObj" varStatus="theCount">


									<td><input type="checkbox" value="${prnObj.prnNumber}"
										name="prnId[]" onchange="loadProducts();">&nbsp;&nbsp;&nbsp;${prnObj.prnNumber}</input></td>
									<c:if test="${theCount.count %5 eq 0}">
							</tr>
							<tr>
								</c:if>
								</c:forEach>
							</tr>
					</table>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$('#dataTable1').dataTable({
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   });
	$('#dataTable').dataTable({
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   });

	function savePurchaseOrderDetails() {
		 var dataString = $("#formId,#formId1").serialize();
		$.ajax({
			type : "post",
			data : dataString,
			async : false,
			cache : false,
			url : "${pageContext.request.contextPath}/savePurchaseOrder",
			success : function(data) {
				alert(data);
				location.reload();
			
			},
			error : function(e) {
				alert("error " + e);
			}
		});
	}
	
	function addServiceTax(serviceTax){
		var total=$("#total").val();
		
		var sTax=eval(total)*eval($("#serviceTax").val())/100;
		var excise=eval(total)*eval($("#excise").val())/100;
		var importDuty=eval(total)*eval($("#import").val())/100;
		var vat=eval(total)*eval($("#vat").val())/100;
		$("#netAmount").val(eval(total)+eval(sTax)+eval(excise)+eval(importDuty)+eval(vat));
	}

</script>

	
	
	
