package com.freemind.print;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import com.freemind.model.Sale;
import com.freemind.model.SaleDetails;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

public class BillPrint {

	public void addBillDetails(Sale sale) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("billDate", simpleDateFormat.format(sale.getBillDate()));
			parameters.put("bilNo", "" + sale.getId());
			parameters.put("customerName", sale.getCustomer().getCustomerName());
			parameters.put("shopName", "माऊली हाय-टेक रोपवाटिका");
			parameters.put("shopAddress", "आंबेगाव ता. कडेगांव, जि. सांगली.");
			parameters.put("customerMobileNo", "" + sale.getCustomer().getMobileNo());
			parameters.put("termsAndCondition", "विकलेली झाडे परत घेतली जाणार नाहीत");
			parameters.put("Notes", "विकलेली झाडे परत घेतली जाणार नाहीत");
			parameters.put("discountRs", "" + 000);
			parameters.put("grandTotal", "" + sale.getPaidAmount());
			parameters.put("total", "" + sale.getTotalAmount());
			parameters.put("licenceNo", "ला. नं. LASB 1300073");
			parameters.put("mobileNo", "मोबाईल : 8698636100 / 7030327100");

			List<BillDetails> billDetailsList = new ArrayList<BillDetails>();
			int i = 0;
			for (SaleDetails saleDetails : sale.getListSaleDetails()) {
				BillDetails billDetails = new BillDetails("" + (i + 1), saleDetails.getProduct().getProductName(),
						saleDetails.getQuantity(), saleDetails.getSaleRate(),
						saleDetails.getQuantity() * saleDetails.getSaleRate());
				billDetailsList.add(billDetails);
				i++;
			}

			JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(billDetailsList);
			InputStream in = BillPrint.class.getResourceAsStream("/3InchPrint.jrxml");
			JasperReport jasperReport = JasperCompileManager.compileReport(in);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, beanColDataSource);
			JasperPrintManager.printReport(jasperPrint, true);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
