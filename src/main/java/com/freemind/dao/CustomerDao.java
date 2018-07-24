package com.freemind.dao;

import java.util.List;

import com.freemind.model.Customer;

public interface CustomerDao {
	public List<Customer> getAllCustomerList();

	public Customer getCustomerById(int id);

	public Customer getCustomerByMobileNo(String no);

	public void save(Customer customer);

	public void update(Customer customer);

	public void deleteCustomerById(int id);

	public void updateCustomerActivityStatus(int id, boolean status);

	public void updateCustomerDefaulter(int id, boolean defaulter);

}
