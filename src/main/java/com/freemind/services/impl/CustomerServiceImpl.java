package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.CustomerDao;
import com.freemind.model.Customer;
import com.freemind.services.CustomerService;


@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDao customerDao;

	@Override
	public List<Customer> getAllCustomerList() {
		return customerDao.getAllCustomerList();
	}

	@Override
	public Customer getCustomerById(int id) {
		return customerDao.getCustomerById(id);
	}
	@Override
	public Customer getCustomerByMobileNo(String id) {
		return customerDao.getCustomerByMobileNo(id);
	}
	@Override
	public void save(Customer customer) {
		customerDao.save(customer);
	}

	@Override
	public void update(Customer customer) {
		customerDao.update(customer);
	}

	@Override
	public void deleteCustomerById(int id) {
		customerDao.deleteCustomerById(id);
	}

	@Override
	public void updateCustomerActivityStatus(int id, boolean status) {
		customerDao.updateCustomerActivityStatus(id, status);
	}

	@Override
	public void updateCustomerDefaulter(int id, boolean defaulter) {
		customerDao.updateCustomerDefaulter(id, defaulter);
	}

}
