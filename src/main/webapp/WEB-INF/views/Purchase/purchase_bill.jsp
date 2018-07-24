<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>

<script type="text/javascript">
	$(function() {
		$("#purchaseDate").datepicker();
		$("#chequeDate").datepicker();
		$("#tranctionDate").datepicker();
	});
	function loadProducts(POId) {
		var innerHtml = "";
		var url = "${pageContext.request.contextPath}/getProductsByPO/" + POId;
		$
				.post(
						url,
						function(data, textStatus) {
							var table = document.getElementById("table");
							var rowCount = table.rows.length;
							for (var i = 0; i < data.length; i++) {
								var productObj = data[i];
								innerHtml += "<tr><td align='center'>"
										+ (rowCount+i )
										+ "</td><td><input name='pname[]' type='text' value="
					+ productObj.productName + "></input></td><td><input name='pquentity[]' type='text' value="
					+ productObj.quentity + "></input></td><td><input  name='punit[]' tye='text' value="
					+ productObj.unit + "></input></td><td><input name='prate[]' type='text' value="
					+ productObj.unitCost + "></input></td><td><input  name='pamt[]' type='text' value="
										+ (productObj.unitCost)
										* (productObj.quentity)
										+ "></input></td></tr>";
							}
							$("#productTable").html(innerHtml);
						}, "json");
	}
	
	var productId = new Array();
	var productName=new Array();
	var productCode=new Array();
</script>
<c:forEach  var="entry" items="${productList}">
<script>
productCode.push('${entry.productCode}');
productId.push('${entry.productId}');
productName.push('${entry.productName}');

</script>
</c:forEach>

<script>
function checkValue(id,abc)
{
	for(j=0;j<productId.length;j++){
		if(id==productCode[j]){	
		$(abc).parent("td").next().find("input").val(productName[j]);
		}
	}	
}

$(function() {
	var availableTags = productCode;
	$( ".productCodeClass" ).autocomplete({source: availableTags});

	});
</script>

<div id="wrapper">

	<!-- Navigation -->

	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<form:form id="formId" commandName="purchaseOrderDetailsObj"
				method="POST">
				<div class="row">
					<div class="col-xs-12">
						<h1 class="page-header">Purchase Bill</h1>
						<div class="col-xs-3"
							style="margin-top: -10px; width: 300px; position: absolute; right: 10px; top: 16px;">
							<label style="color: #0066FF; font-size: 13px;"><lable>Purchase
								Date</label><input type="text" class="form-control" placeholder="Date"
								name="purchaseDate" id="purchaseDate">
						</div>
					</div>

					<!-- /.col-lg-12 -->
					<div class="row">
						<div class="col-xs-3">
							<label>Select Purchase Order</label> <select id="POId"
								onchange="loadProducts(this.value);">
								<option value="0">---Select----</option>
								<c:forEach items="${POList}" var="POObj" varStatus="theCount">
									<option value="${POObj.purchaseId}">${POObj.poNo}</option>
								</c:forEach>
							</select>
						</div>

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
							<label>Tin No.</label><input type="text" class="form-control"
								placeholder="Tin No.">
						</div>
						<div class="col-xs-3">
							<label>Purchase Bill No.</label><input type="text"
								class="form-control" placeholder="Purchase Bill No."
								name="purchaseNo" value="${PBNo}">
						</div>
						<div class="col-xs-3">
							<label>Address Line1</label><input type="text"
								class="form-control" placeholder="Address Line1"
								id="addressLine1">
							<!--<textarea rows="1" class="form-control"></textarea>-->
						</div>
						<div class="col-xs-3">
							<label>Address Line2</label><input type="text"
								class="form-control" placeholder="Address Line2"
								id="addressLine2">
							<!--<textarea rows="1" class="form-control"></textarea>-->
						</div>
						<div class="col-xs-3">
							<label>Phone No.</label><input type="text" class="form-control"
								placeholder="Phone No." id="email">
						</div>
						<div class="col-xs-3">
							<label>Email</label><input type="text" class="form-control"
								placeholder="Email" id="phoneNo">
						</div>
						<div class="col-xs-12">
							<hr>
						</div>
						
						<!-- /.row -->
						<div class="col-xs-12">
							<table class="table table-striped table-responsive" id="table">
								<thead>
									<tr>
										<th>Sr..</th>
										<th>Product Discribtion</th>
										<th>Quentity</th>
										<th>unit</th>
										<th>unit prize</th>
										<th>Amount</th>
									</tr>
									<input type="hidden" id="lastid" value="1"> 
										   <input type="hidden" id="deleterow1" value=""></th>
								</thead>
								<tbody id="productTable">

								</tbody>
								<button type="button" onclick="return addrow();">
							<img src="<%=request.getContextPath()%>/resources/images/add.png">
						</button>
							</table>
						</div>

						<!-- /.panel-body -->
						<div class="row">
							<div class="col-xs-3">
								<label>Total</label> <input type="text" class="form-control"
									placeholder="Total" name="total" id="total">
							</div>
							<div class="col-xs-3">
								<label>Vat&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; </label> <select
									id="vat" name="vat" onchange="addServiceTax(this.value)">
									<option value="0">--Select--</option>
									<c:forEach items="${vatList }" var="vatObj">
										<option value="${ vatObj.vatPercent}">${ vatObj.vatPercent}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-xs-3">
								<label>Service Tax</label> <select id="serviceTax"
									name="serviceTax" onchange="addServiceTax(this.value)">
									<option value="0">--Select--</option>
									<c:forEach items="${serviceTaxList }" var="serviceObj">
										<option value="${ serviceObj.servicetaxPercent}">${ serviceObj.servicetaxPercent}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-xs-3">
								<label>Excise Duty</label> <select id="excise" name="excise"
									onchange="addServiceTax(this.value)">
									<option value="0">--Select--</option>
									<c:forEach items="${exciseList }" var="exciseObj">
										<option value="${ exciseObj.excisePercent}">${ exciseObj.excisePercent}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-xs-3">
								<label>Import/Export Duty</label> <select id="import"
									name="importDuty" onchange="addServiceTax(this.value)">
									<option value="0">--Select--</option>
									<c:forEach items="${importList }" var="importObj">
										<option value="${ importObj.import_export_percent}">
											${ importObj.import_export_percent}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-xs-3">
								<label>Net Amount</label> <input type="text"
									class="form-control " placeholder="Net Amount" name="netAmount"
									id="netAmount">
							</div>
							<div class="col-xs-3">
								<label>Select Payment Mode</label> <select class="form-control"
									onChange="hidepaymentmode(this.value)" id="paymentMode"
									name="paymentMode">
									<option value="Cash">Cash</option>
									<!--  <option value="Credit">Credit</option> -->
									<option value="Cheque">Cheque</option>
									<option value="Card">By Card</option>
								</select>
							</div>
							<div class="col-xs-3">
								<div id="ChNo" class="" style="width: 100%;">
									<label>Check No:</label> <input type="text" name="chequeNo"
										class="form-control">
								</div>
							</div>
							<div id="TrNo" style="display: none" class="col-xs-3">
								<label>Transaction No:</label> <input type="text"
									name="transctionNo" class="form-control">
							</div>
							<div id="ChD" style="display: none" class="col-xs-3">
								<label>Check Date:</label> <input type="text" name="chequeDate"
									id="chequeDate" class=" form-control">
							</div>
							<div id="TrD" style="display: none" class="col-xs-3">
								<label>Transaction Date:</label> <input type="text"
									name="tranctionDate" id="tranctionDate" class=" form-control">
							</div>
							<div id="TotlCh" class="col-xs-3">
								<label> Paying Amount</label>
								<div class="form-group">
									<label class="sr-only" for="">Purchase Rate</label>
									<div class="input-group">
										<div class="input-group-addon">Rs.</div>
										<input type="text" class="form-control" name="payingAmt"
											id="payingAmt" placeholder="Amount">

									</div>
								</div>
								<!-- <label>Paying Cash:</label>
                    <input type="text" name="paying_cash" id="paying_cash" class="form-control"> -->
							</div>


							<div class="col-xs-3">
								<label>Discription</label>
								<textarea class="form-control" rows="1" name="discribtion"></textarea>
							</div>

						</div>
						<div style="clear: both;"></div>

						<!-- /.container-fluid -->
					</div>
					<!-- /#page-wrapper -->
					<div class="btns">
						<button type="button" class="btn btn-default btn-default active">Save</button>
						<button type="button" class="btn btn-default btn-default active">Update</button>
						<button type="button" class="btn btn-default btn-default active">Edit</button>
						<button type="button" class="btn btn-default btn-default active">Delete</button>
						<button type="button" class="btn btn-default btn-default active">Print</button>
						<button type="button" class="btn btn-default btn-default active">PDF</button>


						<button type="button" class="btn btn-primary"
							onclick="savePurchaseBill();">Submit</button>
						<button type="button" class="btn btn-default btn-default active">Cancel</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('#dataTable1').dataTable();
	});
	$('#dataTable1').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});

	function hidepaymentmode(str) {

		if (str == "Cash") {
			document.getElementById("TotlCh").style.display = "table-row";
			document.getElementById("ChD").style.display = "none";
			document.getElementById("ChNo").style.display = "none";
			document.getElementById("BkName").style.display = "none";
			document.getElementById("TrD").style.display = "none";
			document.getElementById("TrNo").style.display = "none";
		} else if (str == "Cheque") {
			document.getElementById("TotlCh").style.display = "table-row";
			document.getElementById("ChD").style.display = "table-row";
			document.getElementById("ChNo").style.display = "table-row";
			document.getElementById("BkName").style.display = "table-row";
			document.getElementById("TrD").style.display = "none";
			document.getElementById("TrNo").style.display = "none";
		} else if (str == "Card") {
			document.getElementById("TotlCh").style.display = "table-row";
			document.getElementById("TrD").style.display = "table-row";
			document.getElementById("TrNo").style.display = "table-row";
			document.getElementById("BkName").style.display = "table-row";
			document.getElementById("ChD").style.display = "none";
			document.getElementById("ChNo").style.display = "none";
		} else if (str == "Credit") {
			document.getElementById("TotlCh").style.display = "none";
			document.getElementById("ChD").style.display = "none";
			document.getElementById("ChNo").style.display = "none";
			document.getElementById("BkName").style.display = "none";
			document.getElementById("TrD").style.display = "none";
			document.getElementById("TrNo").style.display = "none";
		}
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

	function savePurchaseBill() {
		$.ajax({
			type : "POST",
			data : $("#formId").serialize(),
			url : "${pageContext.request.contextPath}/savePurchaseBill",
			async : false,
			cache : false,
			success : function(data) {
				alert(data);
				location.reload();
			},
			error : function(e) {
				alert("error " + e);
			}
		})
	}
	
	
	function addrow() {
		var table = document.getElementById("table");
		var rowCount = table.rows.length;
		var row1 = rowCount;
		var row = table.insertRow(rowCount);
		var lastid = document.getElementById("lastid").value;
		document.getElementById("lastid").value = eval(lastid) + 1;
		rowCount = eval(eval(lastid) + 1);
		//code for Yarn Composition cell in fabric compostion table
		var cell1 = row.insertCell(0);
		var srno = "<td style='margin-bottom:5px;' align='center'><input type='text' name='srno' value="
				+ row1
				+ " id='srno"
				+ rowCount
				+ "' class=' form-control required' style='background-color: white;width:95%;' readonly='readonly'></td>";
		cell1.innerHTML = srno;

		var cell2 = row.insertCell(1);
		var productCode1 = "<input type='text' name='productCode[]' id='productCode"
				+ rowCount
				+ "' class='required' style='float:none;width:95%;' onChange='checkValue(this.value,this)'>";
		cell2.innerHTML = productCode1;
	
		var cell8 = row.insertCell(2);
		var productName = "<input type='text' name='productName[]' id='productName"
				+ rowCount
				+ "' class='required' style='float:none;width:95%;' onblur='calldemo(this.id)'>";
		cell8.innerHTML = productName;
		
		var cell3 = row.insertCell(3);
		var quantity = "<input type='text' name='quantity[]' id='quantity"
				+ rowCount
				+ "' class='required' style='float:none;width:95%;' >";
		cell3.innerHTML = quantity;

		var cell4 = row.insertCell(4);
		var unit_name = "<td align='center'><input type='text' name='unitPrice[]' id='unit_name"
				+ rowCount
				+ "' class='mws-select2 medium' style='width:95%;' onchange='return gettotalcost(this,this.value);'/></td>";
		cell4.innerHTML = unit_name;

		var cell5 = row.insertCell(5);
		var discount = "<input type='text' name='discount[]' id='discount"
				+ rowCount
				+ "' class='required' style='float:none;width:95%;' readonly='readonly'>";
		cell5.innerHTML = discount;

		var cell6 = row.insertCell(6);
		var cost = "<input type='text' name='totalCost[]' id='cost"
				+ rowCount
				+ "' class='required' style='float:none;width:95%;' readonly='readonly'>";
		cell6.innerHTML = cost;

	

		var cell7 = row.insertCell(7);
		cell7.innerHTML = "<td ><button type='button'  class='sm-btn btn-danger' onclick='deleterow(this);'><i class='icon-minus'>del</i></button></td>";

		var availableTags = productCode;
		
		$("#table tr").each(function() {
			$(this).find("td:first").next().find("input").autocomplete({source: availableTags});
			
		});
	}
	function deleterow(o) {
		var p = o.parentNode.parentNode.rowIndex;
		document.getElementById("table").deleteRow(p);
		var k = 1;
		var tbllen = document.getElementById("lastid").value;
		for ( var i = 1; i <= tbllen; i++) {
			if (document.getElementById("srno" + i) != null)
				document.getElementById("srno" + i).value = k++;
		}
		deletevalue();
	}
</script>

