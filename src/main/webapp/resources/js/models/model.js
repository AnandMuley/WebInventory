function Sale(id, billNo, billDate,deliveryDate,saleOrderNo, totalAmount, paidAmount, netAmount,
		balanceAmount, discountPerc, discountRs, customerId) {
	this.id = id;
	this.billNo = billNo;
	this.deliveryDate = deliveryDate;
	this.billDate=billDate;
	this.saleOrderNo = saleOrderNo;
	this.totalAmount = totalAmount;
	this.paidAmount = paidAmount;
	this.netAmount = netAmount;
	this.balanceAmount = balanceAmount;
	this.discountPerc = discountPerc;
	this.discountRs = discountRs;
	this.customerId = customerId;
	this.saleDetailsList = new Array();
	this.salePaymentDetails = new SalePaymentDetails();
	this.setId = function(id) {
		this.id = id;
	};

	this.getId = function() {
		return this.id;
	};

	this.setBillNo = function(billNo) {
		this.billNo = billNo;
	};

	this.getBillNo = function() {
		return this.billNo;
	};
	
	this.setBillDate = function(billDate) {
		this.billDate = billDate;
	};

	this.getBillDate = function() {
		return this.billDate;
	};
	
	this.setDeliveryDate = function(deliveryDate) {
		this.deliveryDate = deliveryDate;
	};

	this.getDeliveryDate = function() {
		return this.deliveryDate;
	};

	this.setSaleOrderNo = function(saleOrderNo) {
		this.saleOrderNo = saleOrderNo;
	};

	this.getSaleOrderNo = function() {
		return this.saleOrderNo;
	};

	this.setTotalAmount = function(totalAmount) {
		this.totalAmount = totalAmount;
	};

	this.getTotalAmount = function() {
		return this.totalAmount;
	};
	this.setPaidAmount = function(paidAmount) {
		this.paidAmount = paidAmount;
	};

	this.getPaidAmount = function() {
		return this.paidAmount;
	};

	this.setNetAmount = function(netAmount) {
		this.netAmount = netAmount;
	};

	this.getNetAmount = function() {
		return this.netAmount;
	};

	this.setBalanceAmount = function(balanceAmount) {
		this.balanceAmount = balanceAmount;
	};

	this.getBalanceAmount = function() {
		return this.balanceAmount;
	};

	this.setDiscountPerc = function(discountPerc) {
		this.discountPerc = discountPerc;
	};

	this.getDiscountPerc = function() {
		return this.discountPerc;
	};
	this.setDiscountRs = function(discountRs) {
		this.discountRs = discountRs;
	};

	this.getDiscountRs = function() {
		return this.discountRs;
	};

	this.setCustomerId = function(customerId) {
		this.customerId = customerId;
	};

	this.getCustomerId = function() {
		return this.customerId;
	};

	this.getSaleDetailsList = function() {
		return this.saleDetailsList;
	};

	this.setSaleDetailsList = function(saleDetails) {
		this.saleDetailsList.push(saleDetails);
	};

	this.getSalePaymentDetails = function() {
		return this.salePaymentDetails;
	};

	this.setSalePaymentDetails = function(salePaymentDetails) {
		this.salePaymentDetails = salePaymentDetails;
	};
}

function SaleDetails(id, saleId, productId, productCode, productName, qauntity,
		unit, gstPerc, gstRs, saleRate, total) {
	this.id = id;
	this.saleId = saleId;
	this.productId = productId;
	this.productCode = productCode;
	this.productName = productName;
	this.qauntity = qauntity;
	this.unit = unit;
	this.gstPerc = gstPerc;
	this.gstRs = gstRs;
	this.saleRate = saleRate;
	this.total = total;

	this.setId = function(id) {
		this.id = id;
	};

	this.getId = function() {
		return this.id;
	};

	this.setSaleId = function(saleId) {
		this.saleId = saleId;
	};

	this.getSaleId = function() {
		return this.saleId;
	};

	this.setProductId = function(productId) {
		this.productId = productId;
	};

	this.getProductId = function() {
		return this.productId;
	};

	this.setProductCode = function(productCode) {
		this.productCode = productCode;
	};

	this.getProductCode = function() {
		return this.productCode;
	};

	this.setProductName = function(productName) {
		this.productName = productName;
	};

	this.getProductName = function() {
		return this.productName;
	};

	this.setQauntity = function(qauntity) {
		this.qauntity = qauntity;
	};

	this.getQauntity = function() {
		return this.qauntity;
	};

	this.setUnit = function(unit) {
		this.unit = unit;
	};

	this.getUnit = function() {
		return this.unit;
	};

	this.setGSTRs = function(gstRs) {
		this.gstRs = gstRs;
	};

	this.getGSTRs = function() {
		return this.gstRs;
	};
	this.setGstPerc = function(gstPerc) {
		this.gstPerc = gstPerc;
	};

	this.getGstPerc = function() {
		return this.gstPerc;
	};

	this.setSaleRate = function(saleRate) {
		this.saleRate = saleRate;
	};

	this.getSaleRate = function() {
		return this.saleRate;
	};

	this.setTotal = function(total) {
		this.total = total;
	};

	this.getTotal = function() {
		return this.total;
	};
}

function SalePaymentDetails(id, saleId) {
	this.id = id;
	this.saleId = saleId;

	this.paymentDetailsList = new Array();

	this.setId = function(id) {
		this.id = id;
	};

	this.getId = function() {
		return this.id;
	};

	this.setSaleId = function(saleId) {
		this.saleId = saleId;
	};

	this.getSaleId = function() {
		return this.saleId;
	};
	this.getPaymentDetailsList = function() {
		return this.paymentDetailsList;
	};

	this.setPaymentDetailsList = function(paymentDetails) {
		this.paymentDetailsList.push(paymentDetails);
	};
}

function PaymentDetails(id, paymentMode, bankName, branchName,
		chequeTransactionNo, amount, purchasePaymentDetailsId,
		salePaymentDetailsId, paymentDate) {
	this.id = id;
	this.paymentMode = paymentMode;
	this.bankName = bankName;
	this.branchName = branchName;
	this.chequeTransactionNo = chequeTransactionNo;
	this.amount = amount;
	this.purchasePaymentDetailsId = purchasePaymentDetailsId;
	this.salePaymentDetailsId = salePaymentDetailsId;
	this.paymentDate = paymentDate;

	this.setId = function(id) {
		this.id = id;
	};

	this.getId = function() {
		return this.id;
	};

	this.setPaymentMode = function(paymentMode) {
		this.paymentMode = paymentMode;
	};

	this.getPaymentMode = function() {
		return this.paymentMode;
	};
	this.setBankName = function(bankName) {
		this.bankName = bankName;
	};

	this.getBankName = function() {
		return this.bankName;
	};

	this.setBranchName = function(branchName) {
		this.branchName = branchName;
	};

	this.getBranchName = function() {
		return this.branchName;
	};

	this.setChequeTransactionNo = function(chequeTransactionNo) {
		this.chequeTransactionNo = chequeTransactionNo;
	};

	this.getChequeTransactionNo = function() {
		return this.chequeTransactionNo;
	};

	this.setAmount = function(amount) {
		this.amount = amount;
	};

	this.getAmount = function() {
		return this.amount;
	};

	this.setPurchasePaymentDetailsId = function(purchasePaymentDetailsId) {
		this.purchasePaymentDetailsId = purchasePaymentDetailsId;
	};

	this.getPurchasePaymentDetailsId = function() {
		return this.purchasePaymentDetailsId;
	};

	this.setSalePaymentDetailsId = function(salePaymentDetailsId) {
		this.salePaymentDetailsId = salePaymentDetailsId;
	};

	this.getSalePaymentDetailsId = function() {
		return this.salePaymentDetailsId;
	};
	this.setPaymentDate = function(paymentDate) {
		this.paymentDate = paymentDate;
	};

	this.getPaymentDate = function() {
		return paymentDate;
	};
}

function clearCollectionArray() {
	// saleDetailsList = [];
	// salePaymentDetailsList = [];
	// paymentDetailsList = [];
}