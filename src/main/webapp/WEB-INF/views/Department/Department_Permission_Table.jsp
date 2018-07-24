<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<ul class="nav nav-tabs" id="permissionCategoryTabs">
	<li><a href="#inventory" data-toggle="tab" class="tabLink">Inventory</a></li>
	<li><a href="#tax" data-toggle="tab" class="tabLink">Tax</a></li>
	<li><a href="#purchase" data-toggle="tab" class="tabLink">Purchase</a></li>
	<li><a href="#project" data-toggle="tab" class="tabLink">Project</a></li>
	<li><a href="#expenses" data-toggle="tab" class="tabLink">Expenses
	</a></li>
	<li><a href="#manufacturing" data-toggle="tab" class="tabLink">Manufacturing
	</a></li>
	<li><a href="#setting" data-toggle="tab" class="tabLink">Setting</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
	<div class="tab-pane active" id="inventory">
		<table class="table">

			<tr>
				<!-- -----------ID: Add Godown -->
				<c:set var="isPermissionFound" scope="request" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Godown')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" value="Add Godown"
							class="checkbox" checked="checked" name="permission[]" />Add
							Godown</label></td>
				</c:if>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" value="Add Godown"
							class="checkbox" name="permission[]" />Add Godown</label></td>
				</c:if>

				<!-- -----------ID: Update Godown -->
				<c:set var="isPermissionFound" scope="request" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update Godown')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox"
							value="Update Godown" class="checkbox" checked="checked"
							name="permission[]" />Update </label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox"
							value="Update Godown" class="checkbox" name="permission[]" />Update
							Godown</label></td>
				</c:if>

				<!-- -----------ID: Delete Godown -->
				<c:set var="isPermissionFound" scope="request" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete Godown')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox"
							value="Delete Godown" class="checkbox" checked="checked"
							name="permission[]" />Delete Godown</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox"
							value="Delete Godown" class="checkbox" name="permission[]" />Delete
							Godown</label></td>
				</c:if>
				<!-- -----------ID: Add Category -->
				<c:set var="isPermissionFound" scope="request" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Category')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" />Add Category</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" value="Add Category"
							class="checkbox" name="permission[]" />Add Category</label></td>
				</c:if>

				<!-- -----------ID: Update Category -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update Category')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" />Update Category</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Category" />Update Category</label></td>
				</c:if>
				<!-- -----------ID: Delete Category -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete Category')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" />Delete Category</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Category" />Delete Category</label></td>
				</c:if>

				<!-- -----------ID: Add Vat -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Vat')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Add Vat" />Add Vat</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Vat" />Add Vat</label></td>
				</c:if>

				<!-- -----------ID: Update Vat -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update Vat')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Update Vat" />Update
							Vat</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Vat" />Update Vat</label></td>
				</c:if>

				<!-- -----------ID: Delete Vat -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete Vat')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Delete Vat" />Delete
							Vat</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Vat" />Delete Vat</label></td>
				</c:if>


			</tr>
			<tr>
				<!-- -----------ID: Add Product-->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Product')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Add Product" />Add
							Product</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Product" />Add Product</label></td>
				</c:if>

				<!-- -----------ID: Update Product -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update Product')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Update Product" />Update
							Product</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Product" />Update Product</label></td>
				</c:if>

				<!-- -----------ID: Delete Product -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete Product')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Delete Product" />Delete
							Product</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Product" />Delete Product</label></td>
				</c:if>


				<!-- -----------ID: Add Vendor -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Vendor')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Add Vendor" />Add
							Vendor</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Vendor" />Add Vendor</label></td>
				</c:if>


				<!-- -----------ID: Update Vendor -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update Vendor')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Update Vendor" />Update
							Vendor</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Vendor" />Update Vendor</label></td>
				</c:if>


				<!-- -----------ID: Delete Vendor -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete Vendor')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Delete Vendor" />Delete
							Vendor</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Vendor" />Delete Vendor</label></td>
				</c:if>

				<!-- -----------ID: Import Product -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Import Product')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Import Product" />Import
							Product</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Import Product" />Import Product</label></td>
				</c:if>

			</tr>

		</table>
	</div>
	<div class="tab-pane" id="tax">
		<table class="table">
			<tr>
				<!-- -----------ID: Add Service Tax -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Service Tax')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Add Service Tax" />Add
							Service Tax</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Service Tax" />Add Service Tax</label></td>
				</c:if>
				<!-- -----------ID: Update Service Tax -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update Service Tax')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Update Service Tax" />Update
							Service Tax</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Service Tax" />Update Service
							Tax</label></td>
				</c:if>
				<!-- -----------ID: Delete Service Tax -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete Service Tax')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Delete Service Tax" />Delete
							Service Tax</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Service Tax" />Delete Service
							Tax</label></td>
				</c:if>

				<!-- -----------ID: Add Excise Duty -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Excise Duty')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Add Excise Duty" />Add
							Excise Duty</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Excise Duty" />Add Excise Duty</label></td>
				</c:if>

				<!-- -----------ID: Update Excise Duty -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update Excise Duty')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Update Excise Duty" />Update
							Excise Duty</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Excise Duty" />Update Excise
							Duty</label></td>
				</c:if>

				<!-- -----------ID: Delete Excise Duty -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete Excise Duty')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Delete Excise Duty" />Delete
							Excise Duty</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Excise Duty" />Delete Excise
							Duty</label></td>
				</c:if>

				<!-- -----------ID: Add Import/Export Duty -->
				<c:set var="isPermissionFound" value="false" />
				<c:if
					test="${fn:contains(permissionList, 'Add Import/Export Duty')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Add Import/Export Duty" />Add Import/Export Duty</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Import/Export Duty" />Add
							Import/Export Duty</label></td>
				</c:if>

				<!-- -----------ID: Update Import/Export Duty -->
				<c:set var="isPermissionFound" value="false" />
				<c:if
					test="${fn:contains(permissionList, 'Update Import/Export Duty')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Update Import/Export Duty" />Update Import/Export Duty</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Import/Export Duty" />Update
							Import/Export Duty</label></td>
				</c:if>

				<!-- -----------ID: Delete Import/Export Duty -->
				<c:set var="isPermissionFound" value="false" />
				<c:if
					test="${fn:contains(permissionList, 'Delete Import/Export Duty')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Delete Import/Export Duty" />Delete Import/Export Duty</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Import/Export Duty" />Delete
							Import/Export Duty</label></td>
				</c:if>
			</tr>

		</table>
	</div>
	<div class="tab-pane" id="purchase">
		<table class="table">
			<tr>
				<!-- -----------ID: Add SRN -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add SRN')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Add SRN" />Add SRN</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add SRN" />Add SRN</label></td>
				</c:if>

				<!-- -----------ID: Update SRN -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update SRN')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Update SRN" />Update
							SRN</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update SRN" />Update SRN</label></td>
				</c:if>

				<!-- -----------ID: Delete SRN -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete SRN')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Delete SRN" />Delete
							SRN</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete SRN" />Delete SRN</label></td>
				</c:if>


				<!-- -----------ID: View SRN -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'View SRN')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="View SRN" />View SRN</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="View SRN" />View SRN</label></td>
				</c:if>

				<!-- -----------ID: Add PRN -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add PRN')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Add PRN" />Add PRN</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add PRN" />Add PRN</label></td>
				</c:if>

				<!-- -----------ID: Update PRN -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update PRN')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Update PRN" />Update
							PRN</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update PRN" />Update PRN</label></td>
				</c:if>

				<!-- -----------ID: Delete PRN -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete PRN')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Delete PRN" />Delete
							PRN</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete PRN" />Delete PRN</label></td>
				</c:if>


				<!-- -----------ID: View PRN -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'View PRN')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="View PRN" />View PRN</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="View PRN" />View PRN</label></td>
				</c:if>
			</tr>
			<tr>
				<!-- -----------ID: Add Purchase Order -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Purchase Order')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Add Purchase Order" />Add
							Purchase Order</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Purchase Order" />Purchase Order</label></td>
				</c:if>

				<!-- -----------ID: Update Purchase Order -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update Purchase Order')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Update Purchase Order" />Update Purchase Order</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Purchase Order" />Update Order</label></td>
				</c:if>

				<!-- -----------ID: Delete Purchase Order -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete Purchase Order')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Delete Purchase Order" />Delete Purchase Order</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Purchase Order" />Delete
							Purchase Order</label></td>
				</c:if>

				<!-- -----------ID: View Purchase Order -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'View Purchase Order')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="View Purchase Order" />View
							Purchase Order</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="View Purchase Order" />View Purchase
							Order</label></td>
				</c:if>

				<!-- -----------ID: Add Purchase Bill -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Purchase Bill')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="Add Purchase Bill" />Add
							Purchase Bill</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Purchase Bill" />Purchase Bill</label></td>
				</c:if>

				<!-- -----------ID: Update Purchase Bill -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Update Purchase Bill')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Update Purchase Bill" />Update Purchase Bill</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Purchase Bill" />Update
							Purchase Bill</label></td>
				</c:if>

				<!-- -----------ID: Delete Purchase Bill -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Delete Purchase Bill')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Delete Purchase Bill" />Delete Purchase Bill</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Purchase Bill" />Delete
							Purchase Bill</label></td>
				</c:if>

				<!-- -----------ID: View Purchase Bill -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'View Purchase Bill')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]" value="View Purchase Bill" />View
							Purchase Bill</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="View Purchase Bill" />View Purchase
							Bill</label></td>
				</c:if>
			</tr>
			<tr>
				<!-- -----------ID: Add Delivery Challan -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'Add Delivery Challan')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Add Delivery Challan" />Add Delivery Challan</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Delivery Challan" />Add Delivery
							Challan</label></td>
				</c:if>

				<!-- -----------ID: Update Delivery Challan -->
				<c:set var="isPermissionFound" value="false" />
				<c:if
					test="${fn:contains(permissionList, 'Update Delivery Challan')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Update Delivery Challan" />Update Delivery Challan</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Delivery Challan" />Update
							Delivery Challan</label></td>
				</c:if>

				<!-- -----------ID: Delete Delivery Challan -->
				<c:set var="isPermissionFound" value="false" />
				<c:if
					test="${fn:contains(permissionList, 'Delete Delivery Challan')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="Delete Delivery Challan" />Delete Delivery Challan</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Delivery Challan" />Delete
							Delivery Challan</label></td>
				</c:if>

				<!-- -----------ID: View Delivery Challan -->
				<c:set var="isPermissionFound" value="false" />
				<c:if test="${fn:contains(permissionList, 'View Delivery Challan')}">
					<c:set var="isPermissionFound" value="true" />
					<td><label><input type="checkbox" class="checkbox"
							checked="checked" name="permission[]"
							value="View Delivery Challan" />View Delivery Challan</label></td>
				</c:if>

				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="View Delivery Challan" />View Delivery
							Challan</label></td>
				</c:if>

			</tr>
		</table>
	</div>

	<div class="tab-pane" id="project">
		<table class="table">
			<tr>
				<!-- -----------ID: Add Project -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 20}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" value="Add Project"/>Add Project</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Project"/>Add Project</label></td>
				</c:if>

				<!-- -----------ID: Update Project -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 20}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" value="Update Project"/>Update Project</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Project"/>Update Project</label></td>
				</c:if>

				<!-- -----------ID: Delete Project -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 20}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" value="Delete Project"/>Delete Project</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Project"/>Delete Project</label></td>
				</c:if>
			</tr>
		</table>
	</div>
	<div class="tab-pane" id="expenses">
		<table class="table">
			<tr>
				<!-- -----------ID: Add Expenses -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 23}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" value="Add Expenses"/>Add Expenses</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Add Expenses"/>Add Expenses</label></td>
				</c:if>
				<!-- -----------ID: 23 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 23}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" value="Update Expenses"/>Update Expenses</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Update Expenses"/>Update Expenses</label></td>
				</c:if>

				<!-- -----------ID: Delete Expenses -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 23}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" value="Delete Expenses"/>Delete Expenses</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="Delete Expenses"/>Delete Expenses</label></td>
				</c:if>

				<!-- -----------ID: 23 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 23}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" value="View Expenses"/>View Expenses</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" value="View Expenses"/>View Expenses</label></td>
				</c:if>

				<!-- -----------ID: 24 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 24}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Add Work Order</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Add Work Order</label></td>
				</c:if>

				<!-- -----------ID: 24 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 24}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Update Work Order</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Update Work Order</label></td>
				</c:if>


				<!-- -----------ID: 24 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 24}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Delete Work Order</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Delete Work Order</label></td>
				</c:if>


				<!-- -----------ID: 24 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 24}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />View Work Order</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />View Work Order</label></td>
				</c:if>

			</tr>
		</table>
	</div>
	<div class="tab-pane" id="manufacturing">
		<table class="table">
			<tr>
				<!-- -----------ID: 93 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 93}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Add Manufacturing</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Add Manufacturing</label></td>
				</c:if>

				<!-- -----------ID: 93 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 93}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Update Manufacturing</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Update Manufacturing</label></td>
				</c:if>


				<!-- -----------ID: 94 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 94}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Manufacturing In</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Manufacturing In</label></td>
				</c:if>

				<!-- -----------ID: 95 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 95}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />View Manufacturing In</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />View Manufacturing In</label></td>
				</c:if>
			</tr>
			<tr>
				<!-- -----------ID: 96 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 96}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" /> Add Manufacturing Out</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Add Manufacturing Out</label></td>
				</c:if>

				<!-- -----------ID: 96 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 96}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Update Manufacturing
								Out</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Update Manufacturing Out</label></td>
				</c:if>

				<!-- -----------ID: 96 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 96}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Delete Manufacturing
								Out</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Delete Manufacturing Out</label></td>
				</c:if>

			</tr>

		</table>
	</div>
	<div class="tab-pane" id="setting">
		<table class="table">
			<tr>
				<!-- -----------ID: 31 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 31}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Create Department</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Create Department</label></td>
				</c:if>

				<!-- -----------ID: 31 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 31}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Update Department</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Update Department</label></td>
				</c:if>

				<!-- -----------ID: 31 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 31}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Delete Department</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Delete Department</label></td>
				</c:if>

				<!-- -----------ID: 32 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 32}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Department Module</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Department Module</label></td>
				</c:if>

				<!-- -----------ID: 33 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 33}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Create User</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Create User</label></td>
				</c:if>
				<!-- -----------ID: 33 -->
				<c:set var="isPermissionFound" value="false" />
				<c:forEach items="${userPermissionAlreadySet}" var="userPermission">
					<c:if test="${userPermission.permissionId == 33}">
						<c:set var="isPermissionFound" value="true" />
						<td><label><input type="checkbox" class="checkbox"
								checked="checked" name="permission[]" />Assign Permission To
								User</label></td>
					</c:if>
				</c:forEach>
				<c:if test="${isPermissionFound eq false}">
					<td><label><input type="checkbox" class="checkbox"
							name="permission[]" />Assign Permission To User</label></td>
				</c:if>
			</tr>

		</table>
	</div>
</div>
<div align="center">
	<input type="submit" value="Save User Permissions"
		class="btn btn-default" />
</div>
<script type="text/javascript">
	$(".tabLink").on('click', function() {
		var href = $(this).attr("href");
		href = href.substr(1);
		$('.tab-pane').each(function(i, obj) {

			if ($(this).hasClass("active")) {
				$(this).removeClass("active");
			}
			if ($(this).attr("id") == href) {
				$(this).addClass("active");
			}

		});
	});
</script>

