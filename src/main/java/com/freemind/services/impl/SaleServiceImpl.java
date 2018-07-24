package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.command.PaymentDetails;
import com.freemind.command.SaleDetails;
import com.freemind.dao.CustomerDao;
import com.freemind.dao.ProductDao;
import com.freemind.dao.SaleDao;
import com.freemind.model.Sale;
import com.freemind.model.SalePaymentDetails;
import com.freemind.services.SaleService;
import com.freemind.util.UtilityFunction;

@Service("SaleService")
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDao saleDao;

	@Autowired
	CustomerDao customerDao;

	@Autowired
	ProductDao productDao;

	@Override
	public List<Sale> getAllSaleList() {
		return saleDao.getAllSaleList();
	}

	@Override
	public Sale getSaleById(int id) {
		return saleDao.getSaleById(id);
	}

	@Override
	public void save(Sale sale) {
		saleDao.save(sale);
	}

	@Override
	public void update(Sale sale) {
		saleDao.update(sale);
	}

	@Override
	public void deleteSaleById(int id) {
		saleDao.deleteSaleById(id);
	}

	@Override
	public boolean saveAll(com.freemind.command.Sale saleCommand) {
		try {
			Sale sale = new Sale();
			sale.setBillNo(saleCommand.getBillNo());
			sale.setCustomer(customerDao.getCustomerById(saleCommand.getCustomerId()));
			sale.setSaleOrderNo(0);
			sale.setTotalAmount(saleCommand.getTotalAmount());
			sale.setPaidAmount(saleCommand.getPaidAmount());
			sale.setNetAmount(saleCommand.getNetAmount());
			sale.setBalanceAmount(saleCommand.getBalanceAmount());
			sale.setDiscountPerc(0);
			sale.setDiscountRs(0);
			sale.setBillDate(UtilityFunction.getDateMMDDYYYY(saleCommand.getBillDate()));

			for (SaleDetails saleDetailsCommand : saleCommand.getSaleDetailsList()) {
				com.freemind.model.SaleDetails saleDetails = new com.freemind.model.SaleDetails();
				saleDetails.setId(0);
				saleDetails.setProduct(productDao.getProductById(saleDetailsCommand.getProductId()));
				saleDetails.setQuantity(saleDetailsCommand.getQauntity());
				saleDetails.setUnit(saleDetailsCommand.getUnit());
				saleDetails.setGetPerc(saleDetailsCommand.getGstPerc());
				saleDetails.setGetRs(saleCommand.getDiscountRs());
				saleDetails.setSaleRate(saleDetailsCommand.getSaleRate());
				saleDetails.setServiceTax(0);
				sale.getListSaleDetails().add(saleDetails);
			}
			SalePaymentDetails salePaymentDetails = new SalePaymentDetails();
			salePaymentDetails.setInsertionDate(new java.util.Date());
			salePaymentDetails.setLastModifyDate(new java.util.Date());

			if (saleCommand.getSalePaymentDetails() != null) {
				for (PaymentDetails paymentDetailsCommand : saleCommand.getSalePaymentDetails()
						.getPaymentDetailsList()) {
					com.freemind.model.PaymentDetails paymentDetails = new com.freemind.model.PaymentDetails();
					paymentDetails.setPaymentMode(paymentDetailsCommand.getPaymentMode());
					paymentDetails
							.setPaymentDate(UtilityFunction.getDateMMDDYYYY(paymentDetailsCommand.getPaymentDate()));
					paymentDetails.setAmount(paymentDetailsCommand.getAmount());
					paymentDetails.setBankName(paymentDetailsCommand.getBankName());
					paymentDetails.setBranchName(paymentDetailsCommand.getBranchName());
					paymentDetails.setChequeTransactionNo(paymentDetailsCommand.getChequeTransactionNo());
					salePaymentDetails.getListPaymentDetails().add(paymentDetails);
				}
			}
			saleDao.saveAll(sale, salePaymentDetails);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Integer getSaleBillNo() {
		Integer billNo = saleDao.getSaleBillNo();
		if (billNo == null)
			billNo = 0;

		billNo = billNo + 1;
		return billNo;
	}

	@Override
	public Sale getBillByBillNo(int billNo) {
		return saleDao.getBillByBillNo(billNo);
	}

}
