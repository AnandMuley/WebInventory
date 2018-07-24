function getCustomerDetailsById(id) {

	if (id.match('[0-9]{10}')) {

	} else {
		alert("कृपया वैध मोबाईल क्रमांक प्रविष्ट करा");
		return false;
	}

	$.ajax({
		method : 'GET',
		url : 'getCustomerDetails',
		dataType : 'json',
		data : {
			id : id
		},
		success : function(data) {
			clearCustomerDetails();
			$("#customerId").val(data.id);
			$("#customerName").val(data.customerName);
			$("#mobileNo").val(data.mobileNo);
			$("#address").val(data.address);
			document.getElementById("customerName").focus();
		},
		error : function(data) {
			alert("कृपया ग्राहक नोंद करा");
			document.getElementById("mobileNo").focus();
		}
	});
}

function clearCustomerDetails() {
	$("#customerName").val('');
	$("#mobileNo").val('');
	$("#address").val('');
}

function getProductDetailsByCatId(id) {
	$('#productNames').find("option").remove();

	$.ajax({
		method : 'GET',
		url : 'getProductList',
		dataType : 'json',
		data : {
			id : id
		},
		success : function(data) {
			var defaultOption = '<option>select Product</option>';
			$('#productNames').append(defaultOption);
			$(data).each(function() {
				// this refers to the current item being iterated over

				var option = $('<option />');
				option.attr('value', this.id).text(this.productName);

				$('#productNames').append(option);
			});

		},
		error : function(data) {
			// if user select 'select category' option
			$('#productNames').find("option").remove();
			var defaultOption = '<option>select Product</option>';
			$('#productNames').append(defaultOption);
		}
	});
}

function getProductDetailsById(id) {

	$.ajax({
		method : 'GET',
		url : 'getProductDetails',
		dataType : 'json',
		data : {
			id : id
		},
		success : function(data) {
			$("#productId").val(data.id);
			$("#productCode").val(data.productCode);
			$("#productName").val(data.productName);
			$("#unit").val(data.unitName);
			if (isInt(data.gstPerc))
				$("#vat").val(data.gstPerc.toFixed(1));
			else
				$("#vat").val(data.gstPerc);
			$("#salePrice").val(data.saleRate);
			$("#availableQuantity").val(data.quantity);

			document.getElementById("salePrice").focus();

		},
		error : function(data) {
			// if user select default option 'select product'
			// clear all existing product details
			$("#salePrice").val("");
			$("#availableQuantity").val("");
			$("#quantity").val("");

		}
	});
}

function isInt(n) {
	return Number(n) === n && n % 1 === 0;
}
function clearProductDetails() {
	$("#productId").val('');
	$("#productCode").val('');
	$("#productName").val('');
	$("#unit").val("0");
	$("#vat").val("0");
	$('#salePrice').val('');
}
var isAvaialable = false;
function addrow() {
	if ($("#billNo").val() == '' && $("#billNo").val() == undefined) {
		alert("Bill number is invalid");
		return;
	}

	if ($("#billDate").val() == '' && $("#billDate").val() == undefined) {
		alert("Bill date is invalid");
		return;
	}
	if ($("#mobileNo").val() != '' && $("#mobileNo").val() != undefined) {

		var productIdText = $("#productId").val();
		var productCodeText = $("#productCode").val();
		var productNameText = $("#productName").val();
		var unitText = $("#unit").val();
		var vatText = $("#vat").val();
		var quantityText = $("#quantity").val();
		var salePriceText = $("#salePrice").val();
		var saleOrderIdText = $("saleOrderId").val();
		if (saleOrderIdText == undefined) {
			saleOrderIdText = 0;
		}

		var customerIdText = $("#customerId").val();
		total = Math.round((quantityText * salePriceText) * 100) / 100;

		var totalAmountDeductedVatAmount = Math
				.round((total / (1 + (vatText / 100))) * 100) / 100;

		var vatAmountRs = Math
				.round((total - totalAmountDeductedVatAmount) * 100) / 100;

		var position = 0;
		$('#table2 tr').each(function(index) {
			if ($(this).find('td').eq(10).text() == productIdText) {
				isAvaialable = true;
				position = index;
			}
		});

		if (isAvaialable)
			$("tr").eq(position).remove();

		var table = document.getElementById("table2");
		var rowCount = table.rows.length;
		var row1 = rowCount;
		var row = table.insertRow(rowCount);
		var lastid = document.getElementById("lastid").value;
		document.getElementById("lastid").value = eval(lastid) + 1;
		rowCount = eval(eval(lastid) + 1);
		// code for Yarn Composition cell in fabric compostion table
		var cell1 = row.insertCell(0);
		var srno = "<td>" + row1 + "</td>";
		cell1.style = "margin-bottom:5px;text-align:right;";
		cell1.innerHTML = srno;

		var cell2 = row.insertCell(1);
		var productCode1 = "<td>" + productCodeText + "</td>";
		cell2.style = "margin-bottom:5px;text-align:center;";
		cell2.innerHTML = productCode1;

		var cell3 = row.insertCell(2);
		var productName = "<td>" + productNameText + "</td>";
		cell3.style = "margin-bottom:5px;text-align:center;";
		cell3.innerHTML = productName;

		var cell4 = row.insertCell(3);
		var quantity = "<td>" + quantityText + "</td>";
		cell4.style = "margin-bottom:5px; text-align:right;";
		cell4.innerHTML = quantity;

		var cell5 = row.insertCell(4);
		var unit = "<td>" + unitText + "</td>";
		cell5.style = "margin-bottom:5px; text-align:center;";
		cell5.innerHTML = unit;

		var cell6 = row.insertCell(5);
		var saleRate = "<td>" + salePriceText + "</td>";
		cell6.style = "margin-bottom:5px; text-align:right;";
		cell6.innerHTML = saleRate;

		var cell7 = row.insertCell(6);
		var vatPerc = "<td>" + vatText + "</td>";
		cell7.style = "margin-bottom:5px; text-align:right;";
		cell7.innerHTML = vatPerc;

		var cell8 = row.insertCell(7);
		var vatAmount = "<td>" + vatAmountRs + "</td>";
		cell8.style = "margin-bottom:5px; text-align:right;";
		cell8.innerHTML = vatAmount;

		var cell9 = row.insertCell(8);
		var totalTable = "<td>" + total + "</td>";
		cell9.style = "margin-bottom:5px; text-align:right;";
		cell9.innerHTML = totalTable;

		var cell10 = row.insertCell(9);
		cell10.innerHTML = "<td ><button type='button'  class='sm-btn btn-danger' onclick='deleterow(this);'><i class='icon-minus'>del</i></button></td>";

		var cell11 = row.insertCell(10);
		var productIdTd = '<td>' + productIdText + '</td>';
		cell11.style = "margin-bottom:5px; text-align:right;display:none;";
		cell11.innerHTML = productIdTd;
		calculateTotal();

		$("#productNames").val("select Product").focus();
		$("#salePrice").val("");
		$("#availableQuantity").val("");
		$("#quantity").val("");

	} else {
		alert("Please select Customer");
	}
	isAvaialable = false;

}
function deleterow(o) {
	var p = o.parentNode.parentNode.rowIndex;
	document.getElementById("table2").deleteRow(p);
	var k = 1;
	var tbllen = document.getElementById("lastid").value;
	for (var i = 1; i <= tbllen; i++) {
		if (document.getElementById("srno" + i) != null)
			document.getElementById("srno" + i).value = k++;
	}
}

function addPaymentRow() {

	var paidAmount = $("#qaPaidAmount").val();
	var paymentMode = $("#paymentMode").val();
	var bankName = $("#bankName").val();
	var branchName = $("#branchName").val();
	var transactionNo = $("#transactionNo").val();
	var paymentDate = $("#paymentDate").val();

	var totalPaidAmount = 0;

	var table = document.getElementById("tblPaymentDetails");
	var rowCount = table.rows.length;
	var row1 = rowCount;
	var row = table.insertRow(rowCount);
	var lastid = document.getElementById("lastid").value;
	document.getElementById("lastid").value = eval(lastid) + 1;
	rowCount = eval(eval(lastid) + 1);
	// code for Yarn Composition cell in fabric compostion table
	var cell1 = row.insertCell(0);
	var srno = "<td style='margin-bottom:5px;text-align: right;' align='center'>"
			+ row1 + "</td>";
	cell1.innerHTML = srno;

	var cell2 = row.insertCell(1);
	var paidAmountTd = "<td style='margin-bottom:5px; text-align: right;' align='center'>"
			+ paidAmount + "</td>";
	cell2.innerHTML = paidAmountTd;

	var cell3 = row.insertCell(2);
	var paymentModeTd = "<td style='margin-bottom:5px;text-align: center;' align='center'>"
			+ paymentMode + "</td>";
	cell3.innerHTML = paymentModeTd;

	var cell4 = row.insertCell(3);
	var dateTd = "<td style='margin-bottom:5px;text-align: center;' align='center'>"
			+ paymentDate + "</td>";
	cell4.innerHTML = dateTd;

	var cell5 = row.insertCell(4);
	var bankNameTd = "<td style='margin-bottom:5px;' align='center'>"
			+ bankName + "</td>";
	cell5.innerHTML = bankNameTd;

	var cell6 = row.insertCell(5);
	var branchNameTd = "<td style='margin-bottom:5px;' align='center'>"
			+ branchName + "</td>";
	cell6.innerHTML = branchNameTd;

	var cell7 = row.insertCell(6);
	var transactionNoTd = "<td style='margin-bottom:5px;' align='center'>"
			+ transactionNo + "</td>";
	cell7.innerHTML = transactionNoTd;

	var cell8 = row.insertCell(7);
	cell8.innerHTML = "<td ><button type='button'  class='sm-btn btn-danger' onclick='deletePaymentRow(this);'><i class='icon-minus'>del</i></button></td>";

	$('#tblPaymentDetails tr').each(
			function(index) {

				if ($(this).find('td').eq(1).text() != undefined
						&& $(this).find('td').eq(1).text() != "")
					totalPaidAmount = totalPaidAmount
							+ parseFloat($(this).find('td').eq(1).text());
			});

	$("#paidAmount").val(totalPaidAmount);
	/*
	 * var cell11 = row.insertCell(10); var productIdTd = '<td class="td_11"  style="display:none;" >' +
	 * productIdText + '</td>'; cell11.innerHTML = productIdTd;
	 * calculateTotal();
	 */

	$("#qaPaidAmount").val("");
	$("#bankName").val("");
	$("#branchName").val("");
	$("#transactionNo").val("");
	calculateBalanceAmountPayment();
}

function clearPaymentData() {
	$("#qaPaidAmount").val("");
	$("#bankName").val("");
	$("#branchName").val("");
	$("#transactionNo").val("");
}

function deletePaymentRow(o) {
	var p = o.parentNode.parentNode.rowIndex;
	document.getElementById("table2").deleteRow(p);
	var k = 1;
	var tbllen = document.getElementById("lastid").value;
	for (var i = 1; i <= tbllen; i++) {
		if (document.getElementById("srno" + i) != null)
			document.getElementById("srno" + i).value = k++;
	}

	var totalPaidAmount = 0;
	$('#tblPaymentDetails tr').each(
			function(index) {
				totalPaidAmount = totalPaidAmount
						+ parseFloat($(this).find('td').eq(1).text());
			});

	$("#paidAmount").val(totalPaidAmount);
	calculateBalanceAmountPayment();
}

function calculateTotal() {
	var cells = Array.prototype.slice.call(document.getElementById("table2")
			.getElementsByTagName("td"));
	var total = 0.0;
	for ( var i in cells) {

		if (i % 10 == 8) {
			total = total + parseFloat(cells[i].innerHTML);
		}
	}

	var vatTaxPerc = $("#vatTax").val();

	var vatTaxAmount = Math.round((total * (vatTaxPerc / 100)) * 100) / 100;

	var netAmount = Math.round((total + vatTaxAmount) * 100) / 100;

	$("label[for='vatTaxAmount']").html(vatTaxAmount);
	$("label[for='serviceTaxAmount']").html(serviceTaxAmount);
	$("#vatTaxAmount").val(vatTaxAmount);
	$("#serviceTaxAmount").val(serviceTaxAmount);
	$("#totalAmount").val(total);
	$("#netAmount").val(netAmount);

}

function saveBill() {
	var saleOrderIdText = $("#saleOrderId").val();
	var totalAmountText = $("#totalAmount").val();
	var netAmountText = $("#netAmount").val();
	var paidAmountText = $("#paidAmount").val();
	var balanceAmountText = $("#balanceAmount").val();
	var customerIdText = $("#customerId").val();
	var billNo = $("#billNo").val();
	var billDate = $("#billDate").val();
	var deliveryDate = $("#datepickerdelivery").val();

	var sale = new Sale(0, billNo, billDate, deliveryDate, saleOrderIdText,
			totalAmountText, paidAmountText, netAmountText, balanceAmountText,
			0, 0, customerIdText);
	var count = 0;
	$('#table2 tr').each(
			function() {
				if (count != 0) {
					var productId = $(this).find('td').eq(10).text();
					var productCode = $(this).find('td').eq(1).text();
					var productName = $(this).find('td').eq(2).text();
					var productQty = $(this).find('td').eq(3).text();
					var unit = $(this).find('td').eq(4).text();
					var saleRate = $(this).find('td').eq(5).text();
					var gstRs = $(this).find('td').eq(6).text();
					var gstPerc = $(this).find('td').eq(7).text();
					var total = $(this).find('td').eq(8).text();

					var saleDetails = new SaleDetails(0, 0, productId,
							productCode, productName, productQty, unit,
							gstPerc, gstRs, saleRate, total);
					sale.setSaleDetailsList(saleDetails);
				}
				count++;

			});
	count = 0;
	var salePaymentDetails = new SalePaymentDetails(0, 0);
	$('#tblPaymentDetails tr').each(
			function() {
				if (count != 0) {
					var srNo = $(this).find('td').eq(0).text();
					var amount = parseFloat($(this).find('td').eq(1).text());
					var paymentMode = $(this).find('td').eq(2).text();
					var paymentDate = $(this).find('td').eq(3).text();
					var bankName = $(this).find('td').eq(4).text();
					var branchName = $(this).find('td').eq(5).text();
					var transactionNo = $(this).find('td').eq(6).text();

					var paymentDetails = new PaymentDetails(0, paymentMode,
							bankName, branchName, transactionNo, amount, 0, 0,
							paymentDate);
					salePaymentDetails.setPaymentDetailsList(paymentDetails);
				}
				count++;
			});

	sale.salePaymentDetails = salePaymentDetails;

	console.log("Sale->" + JSON.stringify(sale));

	$.ajax({
		contentType : 'application/json;',
		method : 'POST',
		url : 'saveBillData',
		dataType : 'json',
		data : JSON.stringify(sale),
		success : function(data) {
			if (data) {
				printBill();
				clearAllDetails();
				getBillNumber();
			}

		}
	});

}
function clearAllDetails() {

	$("#customerId").val("");
	$("#customerName").val("");
	$("#mobileNo").val("");
	$("#address").val("");
	$("#billNo").val("");
	$("#billDate").val("");
	$("#salePrice").val("");
	$("#availableQuantity").val("");
	$("#quantity").val("");
	$("#qaPaidAmount").val("");
	$("#bankName").val("");
	$("#branchName").val("");
	$("#transactionNo").val("");

	$("#datepickerdelivery").val("");
	$("#totalAmount").val("");
	$("#netAmount").val("");
	$("#paidAmount").val("");
	$("#balanceAmount").val("");
	$("#tblPaymentDetails").find("tr:gt(0)").remove();
	$("#table2").find("tr:gt(0)").remove();
	getBillNumber();

}
function getBillNumber() {
	$.ajax({
		contentType : 'application/json;',
		method : 'POST',
		url : 'getBillNumber',
		dataType : 'json',
		data : "",
		success : function(data) {
			$("#billNo").val(data);

		}
	});
}

function printBill() {
	var billNo = Number($("#billNo").val());
	$.ajax({
		contentType : 'application/json;',
		method : 'GET',
		url : 'printBill',
		dataType : 'json',
		data : {
			billNo : billNo
		},
		success : function(data) {
			if (data) {
				alert(data);
			}

		}
	});
}

function calculateBalanceAmountPayment() {
	console.log("Net Amount - > " + $("#netAmount").val());
	console.log("Paid Amount - > " + $("#paidAmount").val());
	var balanceAmt = 0;
	balanceAmt = parseFloat($("#netAmount").val())
			- parseFloat($("#paidAmount").val());
	$("#balanceAmount").val(balanceAmt);
}

function calculateBalanceAmount() {

	if (parseFloat($("#netAmount").val()) > 0
			&& parseFloat($("#paidAmount").val()) > 0) {
		var balanceAmt = 0;
		balanceAmt = parseFloat($("#netAmount").val())
				- parseFloat($("#paidAmount").val());
		$("#balanceAmount").val(balanceAmt);
	} else {
		alert("NetAmount  and / or PaidAmount is not correct");
	}
}