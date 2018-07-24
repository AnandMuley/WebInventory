
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- add link in controller -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- add link in controller -->
<spring:url value="/addGodown" var="addGodownUrl" />
<spring:url value="/addcategory" var="addcategoryUrl" />
<spring:url value="/showUnit" var="addUnitUrl" />
<spring:url value="/addGst" var="addGstUrl" />
<spring:url value="/addServiceTax" var="addServiceTax" />


<spring:url value="/addProduct" var="addProductUrl" />
<spring:url value="/showVendor" var="showVendorUrl" />
<spring:url value="/addproject" var="addprojectUrl" />
<spring:url value="/addprn" var="addPRNUrl" />
<spring:url value="/addprn/viewprn" var="viewaddPRNUrl" />
<spring:url value="/addsrn" var="addSRNUrl" />
<spring:url value="/addsrn/viewsrn" var="viewSRNUrl" />
<spring:url value="/addMuIn" var="addMuInUrl" />
<spring:url value="/addManufacturing/viewMuIn" var="viewaddMuInUrl" />
<spring:url value="/addManufacturing" var="addManufacturingUrl" />
<spring:url value="/addManufacturing/addMuOut" var="addMuOutUrl" />
<spring:url value="/addPurchaseOrder" var="addPurchaseOrderUrl" />
<spring:url value="/importProduct" var="importProduct" />
<spring:url value="/addPurchaseBill" var="addPurchaseBillUrl" />
<spring:url value="/addExpenses" var="addExpensesUrl" />
<spring:url value="/addExpenses/viewExpenses" var="viewExpensesUrl" />
<spring:url value="/addworkOrder" var="addWorkUrl" />
<spring:url value="/addDepartment" var="departmentUrl" />
<spring:url value="/addUser" var="userUrl" />
<spring:url value="/addDepartmentPermission"
	var="departmentPermissionUrl" />
<spring:url value="/viewPOByNO" var="viewPOByNOUrl" />
<spring:url value="/viewPurchaseOrder" var="viewPirchaseOrderUrl" />
<spring:url value="/addSaleBill" var="addSaleBillUrl" />
<spring:url value="/addSaleBill/addCustomers" var="addClientUrl" />
<spring:url value="/addUserPermission" var="userPermission" />
<spring:url value="/addCustomer" var="showCustomerUrl" />
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/home"> <strong><spring:message
					code="label.page.ShopName" /></strong></a>

	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-messages">
				<li><a href="#">
						<div>
							<strong>John Smith</strong> <span class="pull-right text-muted">
								<em>Yesterday</em>
							</span>
						</div>
						<div>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit. Pellentesque eleifend...</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<strong>John Smith</strong> <span class="pull-right text-muted">
								<em>Yesterday</em>
							</span>
						</div>
						<div>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit. Pellentesque eleifend...</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<strong>John Smith</strong> <span class="pull-right text-muted">
								<em>Yesterday</em>
							</span>
						</div>
						<div>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit. Pellentesque eleifend...</div>
				</a></li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>Read
							All Messages</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-messages --></li>
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-tasks">
				<li><a href="#">
						<div>
							<p>
								<strong>Task 1</strong> <span class="pull-right text-muted">40%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
									<span class="sr-only">40% Complete (success)</span>
								</div>
							</div>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<p>
								<strong>Task 2</strong> <span class="pull-right text-muted">20%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
									style="width: 20%">
									<span class="sr-only">20% Complete</span>
								</div>
							</div>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<p>
								<strong>Task 3</strong> <span class="pull-right text-muted">60%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-warning"
									role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 60%">
									<span class="sr-only">60% Complete (warning)</span>
								</div>
							</div>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<p>
								<strong>Task 4</strong> <span class="pull-right text-muted">80%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-danger" role="progressbar"
									aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
									style="width: 80%">
									<span class="sr-only">80% Complete (danger)</span>
								</div>
							</div>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>See
							All Tasks</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-tasks --></li>
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li><a href="#">
						<div>
							<i class="fa fa-comment fa-fw"></i> Generate PRN <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-twitter fa-fw"></i> Work Order <span
								class="pull-right text-muted small">12 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-envelope fa-fw"></i> Purchase Order <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>

				<li><a class="text-center" href="#"> <strong>See
							All Alerts</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-alerts --></li>
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i> User
						Profile</a></li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
				<li class="divider"></li>
				<li><a href="<c:url value='j_spring_security_logout'/>"><i
						class="fa fa-sign-out fa-fw"></i> Logout</a></li>
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> <!-- /input-group -->
				</li>
				<li><a href="home.php"><i class="fa fa-dashboard fa-fw"></i>
						Dashboard</a></li>

				<!-- Inventory Menu -->
				<c:set var="showMenu" value="false" />
				<li id="inventory"><a href="#"><i
						class="fa fa-bar-chart-o fa-fw"></i> <spring:message
							code="label.menu.inventory" /><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<!--	<c:if test="${fn:contains(permissionList, 'Add Godown' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addGodownUrl}"><spring:message code="label.menu.addGodown" /></a></li>
						</c:if>
-->
						<c:if
							test="${fn:contains(permissionList, 'Add Category' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addcategoryUrl}"><spring:message
										code="label.menu.addCategory" /> </a></li>
						</c:if>

						<c:if
							test="${fn:contains(permissionList, 'Add Category' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addUnitUrl}"><spring:message
										code="label.menu.addUnit" /> </a></li>
						</c:if>

						<c:if
							test="${fn:contains(permissionList, 'Add Vat' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addGstUrl}"><spring:message
										code="label.menu.addVat" /></a></li>
						</c:if>

						<!--	<c:if test="${fn:contains(permissionList, 'Add Vat' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addServiceTax}"><spring:message code="label.page.serviceTax" /></a></li>
						</c:if>
						
						-->
						<c:if
							test="${fn:contains(permissionList, 'Add Product' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addProductUrl}"><spring:message
										code="label.menu.addProduct" /></a></li>
						</c:if>

						<!--	<c:if test="${fn:contains(permissionList, 'Add Vendor' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${showVendorUrl}"><spring:message code="label.menu.addVendor"/></a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Import Product' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${importProduct}"><spring:message code="label.menu.importProduct"/> </a></li>
						</c:if>-->

						<c:if
							test="${fn:contains(permissionList, 'Add Vendor' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${showCustomerUrl}"><spring:message
										code="label.menu.customer" /></a></li>
						</c:if>

					</ul> <!-- /.nav-second-level --></li>

				<c:if test="${not showMenu}">
					<script>
						$("#inventory").addClass("hide");
					</script>
				</c:if>

				<!-- Tax Menu -->
				<c:set var="showMenu" value="false" />
				<!--			<li id="tax"><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
						Tax<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<c:if test="${fn:contains(permissionList, 'Add Service Tax' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="service_tax.php"><spring:message code="label.menu.addServiceTax"/></a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Add Excise Duty' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="excise.php"><spring:message code="label.menu.addExciseDuty"/></a></li>
						</c:if>
						<c:if
							test="${fn:contains(permissionList, 'Add Import/Export Duty' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="import_export.php"><spring:message code="label.menu.addIEDuty"/></a></li>
						</c:if>
					</ul> </li>

				<c:if test="${not showMenu}">
					<script>
						$("#tax").addClass("hide");
					</script>
				</c:if> -->

				<!-- Purchase Menu -->
				<c:set var="showMenu" value="false" />
				<!--	<li id="purchase"><a href="#"><i
						class="fa fa-bar-chart-o fa-fw"></i> Purchase<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<c:if test="${fn:contains(permissionList, 'Add SRN' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addSRNUrl}">SRN</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'View SRN' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${viewSRNUrl}">View SRN</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Add PRN' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addPRNUrl}">PRN</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'View PRN' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${viewaddPRNUrl}"> View PRN</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Add Purchase Order' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addPurchaseOrderUrl }">Purchase Order</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'View Purchase Order' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${viewPirchaseOrderUrl }">Purchase Order
									view</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Add Purchase Bill' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addPurchaseBillUrl }">Purchase Bill</a></li>
						</c:if>

						<c:if
							test="${fn:contains(permissionList, 'Add Delivery Challan' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="delivery_challan.jsp">Delivery Challan</a></li>
						</c:if>
					</ul> </li>-->

				<c:if test="${not showMenu}">
					<script>
						$("#purchase").addClass("hide");
					</script>
				</c:if>

				<!-- Project Menu -->
				<c:set var="showMenu" value="false" />

				<c:if test="${not showMenu}">
					<script>
						$("#project").addClass("hide");
					</script>
				</c:if>

				<!-- Expenses Menu -->
				<c:set var="showMenu" value="false" />
				<!-- 	<li id="expenses"><a href="#"><i
						class="fa fa-bar-chart-o fa-fw"></i> Expenses<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<c:if test="${fn:contains(permissionList, 'Add Expenses' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addExpensesUrl}">Expenses</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Add Project' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addWorkUrl}">Add Work Order</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Add Project' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addExpensesUrl}">Project Amount</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'View Expenses' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${viewExpensesUrl}">View Expenses</a></li>
						</c:if>

					</ul> </li><!-- /.nav-second-level -->
				<c:if test="${not showMenu}">
					<script>
						$("#expenses").addClass("hide");
					</script>
				</c:if>

				<!-- Manufacturing Menu -->
				<c:set var="showMenu" value="false" />
				<!--	<li id="manufacturing"><a href="#"><i
						class="fa fa-bar-chart-o fa-fw"></i> Manufacturing<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<c:if test="${fn:contains(permissionList, 'Add Manufacturing' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addManufacturingUrl}">Add Manufacturing</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Manufacturing In' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addMuInUrl}">Manufacturing In</a></li>
						</c:if>
						<c:if
							test="${fn:contains(permissionList, 'View Manufacturing In' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${viewaddMuInUrl}"> View Manufacturing In</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Manufacturing Out' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addMuOutUrl}">Manufacturing Out</a></li>
						</c:if>

					</ul> </li><!-- /.nav-second-level -->
				<c:if test="${not showMenu}">
					<script>
						$("#manufacturing").addClass("hide");
					</script>
				</c:if>
				<!-- Sale Menu -->
				<c:set var="showMenu" value="false" />
				<li id="sale"><a href="#"><i
						class="fa fa-bar-chart-o fa-fw"></i> <spring:message
							code="label.page.bill" /><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<!--<c:if test="${fn:contains(permissionList, 'Add Client/Customer' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addClientUrl}">Client/Customer</a></li>
						</c:if>-->
						<c:if
							test="${fn:contains(permissionList, 'Add Sale Bill' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${addSaleBillUrl}"><spring:message
										code="label.page.SaleBill" /></a></li>
						</c:if>
					</ul> <!-- /.nav-second-level --></li>
				<c:if test="${not showMenu}">
					<script>
						$("#sale").addClass("hide");
					</script>
				</c:if>

				<!-- Setting Menu -->
				<c:set var="showMenu" value="false" />
				<!--		<li id="setting"><a href="#"><i
						class="fa fa-bar-chart-o fa-fw"></i> Setting<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<c:if test="${fn:contains(permissionList, 'Create Department' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${departmentUrl}">Create Department</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Department Permission' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${departmentPermissionUrl}">Department
									Permission</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Create User' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${userUrl}">Create User</a></li>
						</c:if>
						<c:if test="${fn:contains(permissionList, 'Assign Permission to user' ) || sessionScope.userName=='admin'}">
							<c:set var="showMenu" value="true" />
							<li><a href="${userPermission}">Assign Permission to
									user</a></li>
						</c:if>
					</ul> </li><!-- /.nav-second-level -->
				<c:if test="${not showMenu}">
					<script>
						$("#setting").addClass("hide");
					</script>
				</c:if>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>
