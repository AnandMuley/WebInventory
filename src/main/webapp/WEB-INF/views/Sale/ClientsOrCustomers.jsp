<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<head>
    <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
     <spring:url value="/billing/save/customer"  var ="addCustomerUrl"/>
     </head>
     <style>
     .col-xs-3
     {
     width:30% !important;
     }
     </style>
 <div id="wrapper">

        <!-- Navigation -->
     
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12" ><!--style="background:#23527C;color:#FFFFFF;"-->
                        <h1 class="page-header">Customer Registration</h1>
                    </div>
                   
					<br><br>
					<form:form class="mws-form" Commandname="addGodowan" name="addGodownForm" id="myForm"
						modelAttribute="customer" action="${addCustomerUrl}" method="post">
					

							<div class="row">
							<div>
						      <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
							  <div class="col-xs-3">
								<label>First Name</label><input type="text"  id="firstName" name ="firstName" class="form-control" placeholder="FirstName">
								
							  </div>
							  <div class="col-xs-3">
							  <label>Middle Name</label><input type="text"  id="middleName" name ="middleName" class="form-control" placeholder="MiddleName">
							</div>
							<div class="col-xs-3">	
								<label>Last Name</label><input type="text"  id="lastName" name ="lastName" class="form-control" placeholder="LastName">
								</div>
					<div class="col-xs-3" >
								<label>Tin No.</label><input type="text" id="tinNo" name="tinNo"  class="form-control" placeholder="Tin No.">
				    </div>
							
							<div class="col-xs-3">
										<label>Address Line1</label><input type="text"  id="addressLine1" name="addressLine1" class="form-control" placeholder="Address Line1">
										<!--<textarea rows="1" class="form-control"></textarea>-->
							</div>
							<div class="col-xs-3">
										<label>Address Line2</label><input type="text" id="addressLine2" name="addressLine2" class="form-control" placeholder="Address Line2">
										<!--<textarea rows="1" class="form-control"></textarea>-->
							</div>
							<div class="col-xs-3">
						<label>State</label>
						<select id="state" name="state" class="form-control"
									onchange="getCityNameByState(this.value);">
										<option value="0">---Select State---</option>
										<c:forEach items="${stateList}" var="state"
											varStatus="theCount">
											<option value="${state}">
												${state}</option>
										</c:forEach>
								</select>
							
                      </div>
				<div class="col-xs-3" >
						<label>City</label>
							<select id="city" name="city" class="form-control">
							<option value="0">---Select City---</option>
									<%-- <c:forEach items="${stateCityList}" var="stateCityList"
										varStatus="theCount">
										<option value="${cityList.cityName}">${cityList.cityName}</option>
									</c:forEach> --%>
							</select>
                </div>
					<div class="col-xs-3" >
								<label>Pin No.</label><input type="text" id="pinNo" name="pinNo"  class="form-control" placeholder="Pin No.">
				    </div>
					<div class="col-xs-3">
								<label>Telephone No.</label><input type="text" id="telephoneNo" name="telephoneNo"  class="form-control" placeholder="Phone No.">
				    </div>
				    <div class="col-xs-3">
								<label>Phone No 1.</label><input type="text" id="phoneNo1" name="phoneNo1"  class="form-control" placeholder="Phone No 1.">
				    </div>
				    <div class="col-xs-3">
								<label>Phone No 2.</label><input type="text" id="phoneNo2" name="phoneNo2"  class="form-control" placeholder="Phone No 2.">
				    </div>
				     <div class="col-xs-3">
								<label>Email .</label><input type="text" id="email" name="email"  class="form-control" placeholder="Email Id 2.">
				    </div>
					<div class="col-xs-3">
								<label>Credit Balance</label><input type="text"  id="creditBalance" name="creditBalance"  class="form-control" placeholder="0.0" value="0.0">
				    </div>
					<div class="col-xs-3">
								<label>Debit Balance</label><input type="text"  id="debitBalance" name="debitBalance"  class="form-control" placeholder="0.0" value="0.0">
				    </div>
				    <div class="col-xs-3">
								<label>Credit Limit</label><input type="text"  id="creditLimit" name="creditLimit"  class="form-control" placeholder="0.0" value="0.0">
				    </div>
					</div>
							<br><br>
							<div class="container">
							
							<button type="submit" id ="save"  name="save" class="btn btn-primary">Save</button>
							<button type="submit" id="update12"  name="update12" class="btn btn-info">Update</button>
							</div>
				</form:form>
                <!-- /.row -->
            </div>
          
            <!-- /.container-fluid -->
			<br><br>
			
			
							<!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
        </div>
        <!-- /#page-wrapper -->
</body>

</html>