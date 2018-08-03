<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<head>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.5.2.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/models/model.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/sale/sale.js" />"></script>

<!-- search code start -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/jquery-ui.css" />">

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
	width: 55%;
	height: auto;
	/*background: blue;*/
}

.PO {
	clear: both;
	padding-top: 10px;
}

.PO input {
	width: 100px;
	height: 24px;
	padding: 3px 8px;
	height: 24px;
}

.POrightinner {
	padding-left: 35%;
}

.POrightinner input {
	border-radius: 0px;
}

.PO label {
	float: left;
}
</style>

<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
<spring:url value="/addManufacturing" var="ProductDeleteurl" />

<meta charset="utf-8">


</head>



<body onload="getBillNumber();">
	<div id="wrapper">

		<!-- Navigation -->

		<!-- Page Content -->
		<div id="page-wrapper">

			<div class="container-fluid">
				<div class="row">
					<!--style="background:#23527C;color:#FFFFFF;"-->
					<h1 class="page-header" style="text-align: center;">Sale Bill</h1>
					<!-- Accordian Start -->
					<div class="bs-example">

						<div class="panel-group" id="accordion4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion4"
											href="#collapseBill">BILL</a>
									</h4>
								</div>
								<div id="collapseBill" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="col-xs-3">
											<label>Bill No.</label> <input type="text" id="billNo"
												name="billNo" class="form-control" placeholder="Bill No">

										</div>
										<div class="col-xs-3">
											<label>Bill Date</label> <input type="text" id="billDate"
												name="billDate" class="form-control" placeholder="Bill Date">

										</div>


									</div>

								</div>

							</div>
						</div>



						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseOne">CUSTOMER</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="col-xs-3">
											<label>Customer Name</label> <select id="customerNames"
												style="display: none;">
												<c:forEach varStatus="theCount" items="${customerList}"
													var="customer">
													<option value="${customer.id}">${customer.customerName}</option>
												</c:forEach>
											</select> <input type="text" id="customerName" name="customerName"
												class="form-control" placeholder="Customer Name"> <input
												type="hidden" id="customerId" name="customerId">

										</div>
										<div class="col-xs-3">
											<label>Mobile No.</label> <select
												id="customerNamesWithMobile" style="display: none;">
												<c:forEach varStatus="theCount" items="${customerList}"
													var="customer">
													<option value="${customer.id}">${customer.customerName}&nbsp;&nbsp;&nbsp;${customer.mobileNo}</option>
												</c:forEach>
											</select> <input type="number" id="mobileNo" name="mobileNo"
												class="form-control" placeholder="Mobile No."
												pattern="\d{3}[\-]\d{3}[\-]\d{4}" required>
										</div>

										<div class="col-xs-3">
											<label>Address </label><input type="text" id="address"
												name="address" class="form-control" placeholder="Address ">
										</div>


									</div>
									<div class="container"
										style="padding-bottom: 2%; margin-left: 40%;">

										<button type="button" onclick="clearCustomerDetails();"
											class="btn btn-info">
											<spring:message code="label.page.clear" />
										</button>
										<button type="button"
											onclick="javascript:getCustomerDetailsByMobileNo($('#mobileNo').val());"
											class="btn btn-info">
											<spring:message code="label.page.search" />
										</button>
									</div>
								</div>

							</div>
						</div>

						<div class="panel-group" id="accordion1">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion1"
											href="#collapseOne1">PRODUCT</a>
									</h4>
								</div>
								<div id="collapseOne1" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="col-xs-3">
											<label>Product Category</label> <select id="productCategory"
												onchange="getProductDetailsByCatId(this.value)">
												<option>select Category</option>
												<c:forEach varStatus="theCount" items="${categoryList}"
													var="category">
													<option value="${category.categoryId}">${category.categoryName}</option>
												</c:forEach>
											</select> <input type="hidden" name="productId" id="productId">

										</div>
										<div class="col-xs-3">
											<label>Product Name</label> <select id="productNames"
												onchange="getProductDetailsById(this.value)">
												<option>select Product</option>
											</select> <input type="hidden" name="productName" id="productName">
											<input type="hidden" name="productCode" id="productCode">
											<input type="hidden" name="vat" id="vat"> <input
												type="hidden" name="unit" id="unit"> <input
												type="hidden" name="allRow" id="allRow"> <input
												type="hidden" name="saleOrderId" id="saleOrderId" value="0">
										</div>

										<div class="col-xs-3">
											<label>Sale Price</label><input type="text" id="salePrice"
												name="salePrice" class="form-control"
												placeholder="Sale Price">
										</div>
										<div class="col-xs-3">
											<label>Available Quantity</label><input type="text"
												id="availableQuantity" name="availableQuantity"
												class="form-control">
										</div>
										<div class="col-xs-3">
											<label>Quantity</label><input type="text" id="quantity"
												name="quantity" class="form-control" placeholder="Quantity"
												onkeydown="if (event.keyCode == 13)return addrow();">
										</div>



									</div>
									<div class="container"
										style="padding-bottom: 2%; margin-left: 40%;">

										<button type="button" id="save" name="save"
											class="btn btn-primary" onclick="return addrow();">
											<spring:message code="label.page.saveButton" />
										</button>

										<button type="button" class="btn btn-info"
											onclick="clearProductDetailNew()">
											<spring:message code="label.page.clear" />
										</button>


									</div>
								</div>

							</div>
						</div>

					</div>

					<div>
						<table id="table2" border="1px" cellpadding="3">
							<tr style="height: 35px;">
								<th width="6%">Sr.</th>
								<th width="15%">Product Code</th>
								<th width="15%">Product Name</th>
								<th width="6%">Qty</th>
								<th width="7%">Unit</th>
								<th width="12%">Sale Rate/Unit</th>
								<th width="6%">GST(%)</th>
								<th width="9%">GST Amount</th>
								<th width="12%">Total</th>


								<th width="5%"><input type="hidden" id="lastid" value="1">
									<input type="hidden" id="deleterow1" value=""></th>
								<th style="display: none;">Product Id</th>
							</tr>


						</table>

					</div>


					<!-- /.panel -->
					<div class="row" style="padding-top: 20px;">
						<div class="polowersec">
							<div class="poleft">
								<div class="col-xs-12 PO">
									<div class="col-xs-4">
										<label>Delivery date :</label>
									</div>
									<div class="col-xs-6">
										<input type="text" class="form-control" name="deliveryDate"
											id="datepickerdelivery" placeholder="Delivery date"
											data-date-format="dd-mm-yyyy">
									</div>

								</div>
								<div class="col-xs-12 PO">
									<div class="col-xs-4">
										<label>Paid Amount</label>
									</div>
									<div class="col-xs-6">
										<input type="text" id="paidAmount" name="paidAmount"
											readonly="readonly" class="form-control "
											placeholder="Paid Amount">
									</div>
								</div>
								<div class="col-xs-12 PO">
									<div class="col-xs-4">
										<label>Balance Amount</label>
									</div>
									<div class="col-xs-6">
										<input type="text" id="balanceAmount" name="balanceAmount"
											readonly="readonly" class="form-control "
											placeholder="Balance Amount">
									</div>
								</div>


							</div>

							<div class="poright">
								<div class="POrightinner">
									<div class="col-xs-12 PO">
										<div class="col-xs-4" style="width: 39%;">
											<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total</label>
										</div>
										<div class="col-xs-4">
											<input type="text" id="totalAmount" name="totalAmount"
												readonly="readonly" class="form-control" placeholder="Total">
										</div>
									</div>


									<div class="col-xs-12 PO" style="display: none;">
										<div class="col-xs-4" style="width: 39%;">
											<label>Service Tax(%)</label>
										</div>

										<div class="col-xs-4">
											<select id="serviceTax" name="serviceTax"
												class="form-control" style="width: 100px;"
												onchange="calculateTotal();">
												<option value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Service
													Tax</option>
												<c:forEach items="${serviceTaxList}" var="serviceTax"
													varStatus="theCount">
													<option value="${serviceTax.serviceTaxPercent}">${serviceTax.serviceTaxPercent}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-xs-4" style="width: 27%;">

											<label style="float: none;" for="serviceTaxAmount"
												id="serviceTaxAmount">0</label>
										</div>
									</div>

									<div class="col-xs-12 PO">
										<div class="col-xs-4" style="width: 39%;">
											<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G. S. T.(%)</label>
										</div>
										<div class="col-xs-4">
											<select id="vatTax" name="vatTax" class="form-control"
												style="width: 100px;" onchange="calculateTotal();">
												<option value="0">G. S. T.</option>
												<c:forEach items="${gstList}" var="gst" varStatus="theCount">
													<option value="${gst.gstPercentage}">${gst.gstPercentage}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-xs-4" style="width: 27%;">
											<label for="vatTaxAmount" id="vatTaxAmount">0</label>
										</div>
									</div>

									<div class="col-xs-12 PO">
										<div class="col-xs-4" style="width: 39%;">
											<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Net Amount</label>
										</div>
										<div class="col-xs-4">
											<input type="text" class="form-control" id="netAmount"
												name="netAmount" placeholder="Net Amount"
												readonly="readonly">
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>

					<div class="panel panel-default" style="margin-top: 20px;">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapsePayment">Payment Details</a>
							</h4>
						</div>
						<div id="collapsePayment" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="col-xs-12">
									<div class="col-xs-4">
										<div class="col-xs-5">
											<label style="color: #0066FF; font-size: 13px;">Payment
												Mode</label>
										</div>
										<div class="col-xs-7">
											<select id="paymentMode" class="form-control"
												style="width: 90%;">
												<option value="0">--Select--</option>
												<option value="Cash">Cash</option>
												<option value="Card">Card</option>
												<option value="Cheque">Cheque</option>
											</select>
										</div>
									</div>
									<div class="col-xs-4">
										<div class="col-xs-5">
											<label style="color: #0066FF; font-size: 13px;">Amount</label>
										</div>
										<div class="col-xs-7">
											<input type="text" id="qaPaidAmount" name="qaPaidAmount"
												class="form-control" placeholder="Amount"
												style="width: 90%;">
										</div>
									</div>
									<div class="col-xs-4">
										<div class="col-xs-5" style="width: 47%;">
											<label style="color: #0066FF; font-size: 13px;">Payment
												Date.</label>
										</div>
										<div class="col-xs-7" style="width: 53%;">
											<input type="text" id="paymentDate" name="paymentDate"
												class="form-control" placeholder="Payment Date"
												style="width: 90%;">
										</div>
									</div>

								</div>
								<div class="col-xs-12" style="padding-top: 20px;">

									<div class="col-xs-4">
										<div class="col-xs-5">
											<label style="color: #0066FF; font-size: 13px;">Bank
												Name</label>
										</div>
										<div class="col-xs-7">
											<input type="text" id="bankName" name="bankName"
												class="form-control" placeholder="Bank Name"
												style="width: 90%;">
										</div>
									</div>
									<div class="col-xs-4">
										<div class="col-xs-5">
											<label style="color: #0066FF; font-size: 13px;">Branch
												Name</label>
										</div>
										<div class="col-xs-7">
											<input type="text" id="branchName" name="branchName"
												class="form-control" placeholder="Branch Name"
												style="width: 90%;">
										</div>
									</div>
									<div class="col-xs-4">
										<div class="col-xs-5" style="width: 47%;">
											<label style="color: #0066FF; font-size: 13px;">Transaction
												No.</label>
										</div>
										<div class="col-xs-7" style="width: 53%;">
											<input type="text" id="transactionNo" name="transactionNo"
												class="form-control" placeholder="Transaction No."
												style="width: 90%;">
										</div>
									</div>



								</div>
								<div class="col-xs-12" style="padding-top: 20px;">
									<div class="col-xs-5"></div>
									<div class="col-xs-2">
										<div class="col-xs-6">
											<input type="button" value="Add" name="Add"
												class="btn btn-primary"
												onkeydown="if (event.keyCode == 13)return addPaymentRow();"
												onclick="return addPaymentRow();">
										</div>
										<div class="col-xs-6">
											<input type="button" value="Clear" name="Clear"
												class="btn btn-info"
												onkeydown="if (event.keyCode == 13)return clearPaymentData();"
												onclick="return clearPaymentData();">
										</div>
									</div>
									<div class="col-xs-5"></div>
								</div>
								<div class="col-xs-12"
									style="padding-top: 20px; padding-bottom: 20px;">

									<table id="tblPaymentDetails" border="1px" cellpadding="3"
										style="width: 100%;">
										<tr style="height: 35px;">
											<th>Sr. No.</th>
											<th>Amount</th>
											<th>Payment Mode</th>
											<th>Date</th>
											<th>Bank Name</th>
											<th>Branch Name</th>
											<th>Transaction No.</th>
											<th>Action</th>
										</tr>
									</table>
								</div>
							</div>
						</div>


					</div>
					<div class="row col-xs-12" style="height: 50px;"></div>
					<div class="row col-xs-12">
						<div class="col-xs-5">
							<input type="button" onclick="printBill();"
								value="Clear All Data">
						</div>
						<div class="col-xs-1">
							<input type="button" style="height: 36px; width: 76px;"
								value="save" class="btn btn-success" onclick="saveBill()">
						</div>
						<div class="col-xs-1">
							<input type="button" style="height: 36px; width: 76px;"
								value="print" class="btn btn-success" onclick="billPrint()">
						</div>
						<div class="col-xs-5"></div>

					</div>

					<div class="row col-xs-12" style="height: 50px;"></div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>

	</div>

	<script type="text/javascript">
		$("#datepickerdelivery").datepicker({
			format : "dd-MM-yyyy",
		});

		$("#paymentDate").datepicker({
			format : "dd-MM-yyyy",
		});

		$("#billDate").datepicker({
			format : "dd-MM-yyyy",
		});

		/* .datepicker("setValue", new Date()); */
	</script>

</body>
</html>