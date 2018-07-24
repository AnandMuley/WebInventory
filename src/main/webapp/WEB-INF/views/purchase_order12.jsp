<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="body.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<!--Date chooser  -->

<spring:url value="/addworkOrder" var="workorderUrl" />

<script>
	$(function() {
		$("#datepicker").datepicker();
		$("#datepickerdelivery").datepicker();
	});
</script>

<div id="wrapper">

	<!-- Navigation -->

	<!-- Page Content -->
	<div id="page-wrapper">
	   <form:form modelAttribute="workOrder" commandName="workOrder" id="mws-wizard-form" class="mws-form" action="${workorderUrl}" method="Post">
		<div class="container-fluid">
			<div class="row">
				<table id="table1">
					<h1 class="page-header">Work Order</h1>
					
					
					<!-- /.col-lg-12 -->
					<div class="row">
					
					<div class="col-xs-3">
					 
						<label>Project</label>
								 <select name="projectobj" id="projectId" class="form-control" style="width:100%;">
														    <option>---Select Project---- </option>
													<c:forEach var="projectlist" items="${projectlist}">
													    <option value="${projectlist.projectId}">${projectlist.projectname} </option>
													</c:forEach>
							   </select>
					    </div>
						<div class="col-xs-3">
						<label>Vendor</label><select id="venderId"
							class="form-control" onchange="getvendorInfo(this.value);" name="vendorModel.id">
							<option value="0">---Select----</option>
							<c:forEach items="${vendorList}" var="vendorObj">
								<option value="${vendorObj.id}">${vendorObj.vendorName}</option>
							</c:forEach>
						</select>
					</div>
					     <div class="col-xs-3" >
							<label>W.O. No.</label><input type="text" id="woNo" name="woNo"   class="form-control"
								value=${workNumber} placeholder="P.O. No.">
						</div>
						<div class="col-xs-3" >
							<label style="color: #0066FF; font-size: 13px;">Work
								Date</label> <input type="text" class="form-control" id="datepicker" name="workorderDate" placeholder="Date">
							
						</div>
						<div class="col-xs-3">
							<label>Ref</label><input type="text" id="ref" name="ref" class="form-control"
								placeholder="Ref">
						</div>

						<div class="col-xs-3">
							<label>Phone No.</label><input type="text" id="phoneno" name="phonename" class="form-control"
								placeholder="Phone No.">
						</div>
						<div class="col-xs-3">
							<label>Email</label><input type="text" id="email" name="email" class="form-control"
								placeholder="Email">
						</div>

						<div class="col-xs-3">
							<label>Address Line1</label>
							<input type="text" class="form-control"  id="Address1" ame="Address1" placeholder="Address"></textarea>

						</div>
						<div class="col-xs-3">
							<label>Address Line2</label>
							<input type="text" class="form-control"  id="Address2" ame="Address2" placeholder="Address"></textarea>

						</div>
						<div class="col-xs-12">
							<hr>
						</div>
						<div>
							<table id="table2" border="1px" cellpadding="3">
								<tr>
									<th width="6%">Sr.</th>
									<th width="35%">Product Description</th>
									<th width="12%">Quntity</th>
									<th width="12%">Unit Price</th>
									<th width="12%">Amount</th>
									<th width="12%">Total</th>


									<th width="5%"><button type="button"
											onclick="return addrow();">
											<img
												src="<%=request.getContextPath()%>/resources/images/add.png">
										</button> <input type="hidden" id="lastid" value="1"> 
										   <input type="hidden" id="deleterow1" value=""></th>
								</tr>
								<tr>
									<td><input type="text" value="1" name="srno" id="srno1"
										class="form-control required"
										style="width: 90%; background-color: white;"
										readonly="readonly"></td>
										<td><input type="text" name="productDescrption[]" id="productDescrption1"
										class="required" style="float: none; width: 95%;"/></td>
									  <td><input type="text" name="quantity[]" id="quantity1"
										class="required" style="float: none; width: 95%;"
										/></td>
									
									<td><input type="text" id=unit_name1 name="unitPrice[]"
										style="width: 95%;" onchange="return gettotalcost(this,this.value);"/></td>

									<td><input type="text" name="discount[]" id="discount1"
										class="required" style="width: 95%;" readonly="readonly"></td>
									<td><input type="text" name="totalCost[]" id="cost1"
										class="required" style="width: 95%;" readonly="readonly"></td>
								
									
								</tr>

							</table>
							
						</div>
					</div>
					<!-- /.container-fluid -->
					<br>
				
					
					
					
						<!-- /.panel -->
					<div class="row">
							<div class="polowersec">
								<div class="poleft">
									<div class="col-xs-6 PO">
										<label>Delivery date :</label> <input type="text"
											class="form-control" id="datepicker" name="deliveryDate"  placeholder="Delivery date" id="datepickerdelivery" >
											
									</div>
									<div class="col-xs-6 PO">
										<label>Paid</label> <input type="text"  id="paidAmount" name="paidAmount" class="form-control "
											placeholder="PAN No">
									</div>


								</div>

								<div class="poright">
									<div class="POrightinner">
										<div class="col-xs-6 PO">
											<label>Total</label> <input type="text" id="totalAmount" name="totalAmount" class="form-control"
												placeholder="Total">
										</div>


										<div class="col-xs-6 PO">
											<label>Service Tax</label> <input type="text"
												class="form-control "  id="serviceTax" name="serviceTax" placeholder="Service Tax" onchange="return getderviceTax(this.value);"/>
												
										</div>
										<div class="col-xs-6 PO">
											<label>Vat </label> <input type="text" id="vat"  name="vat" class="form-control "
												placeholder="Vat" onchange="return getVat(this.value);"/>
												
										</div>
										<div class="col-xs-6 PO">
											<label>Net Amount</label> <input type="text"
												class="form-control" id="netAmount" name="netAmount" placeholder="Net Amount">
										</div>


										
									</div>
								</div>
							</div>
							<br>
                              
                               
            
						</div>
						 <div><input type="submit" value="Submit" class="btn btn-success" ></div>
						</table>
						</form:form>
						<!-- /.col-lg-12 -->

						<script>
							function addrow() {
								var table = document.getElementById("table2");
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
								var productName = "<input type='text' name='productDescrption[]' id='quantity"
										+ rowCount
										+ "' class='required' style='float:none;width:95%;' onblur='calldemo(this.id)'>";
								cell2.innerHTML = productName;
								/* 	$
											.getJSON(
													'${pageContext.request.contextPath}/sales_details/itemList',
													function(data) {
														$
																.each(
																		data,
																		function(i, item) {
																			product_item_name += "<option value='"+item['id']+"'>"
																					+ item['product_item_name']
																					+ "</option>";
																		});
														product_item_name += "</select>";
														cell2.innerHTML = product_item_name;
													}); */

								var cell3 = row.insertCell(2);
								var quantity = "<input type='text' name='quantity[]' id='quantity"
										+ rowCount
										+ "' class='required' style='float:none;width:95%;' >";
								cell3.innerHTML = quantity;

								var cell4 = row.insertCell(3);
								var unit_name = "<td align='center'><input type='text' name='unitPrice[]' id='unit_name"
										+ rowCount
										+ "' class='mws-select2 medium' style='width:95%;' onchange='return gettotalcost(this,this.value);'/></td>";
								cell4.innerHTML = unit_name;

								var cell5 = row.insertCell(4);
								var discount = "<input type='text' name='discount[]' id='discount"
										+ rowCount
										+ "' class='required' style='float:none;width:95%;' readonly='readonly'>";
								cell5.innerHTML = discount;

								var cell6 = row.insertCell(5);
								var cost = "<input type='text' name='totalCost[]' id='cost"
										+ rowCount
										+ "' class='required' style='float:none;width:95%;' readonly='readonly'>";
								cell6.innerHTML = cost;

							

								var cell7 = row.insertCell(6);
								cell7.innerHTML = "<td ><button type='button'  class='sm-btn btn-danger' onclick='deleterow(this);'><i class='icon-minus'>del</i></button></td>";

							}
							function deleterow(o) {
								var p = o.parentNode.parentNode.rowIndex;
								document.getElementById("table2").deleteRow(p);
								var k = 1;
								var tbllen = document.getElementById("lastid").value;
								for ( var i = 1; i <= tbllen; i++) {
									if (document.getElementById("srno" + i) != null)
										document.getElementById("srno" + i).value = k++;
								}
								deletevalue();
							}
						</script>
						
  <script>
  function gettotalcost(abc,currentPrice) {
	  var amount123=amount=0;
	  
	 var qty= $(abc).parent('td').prev('td').find('input').val();
	$(abc).parent('td').next('td').find('input').val(currentPrice*qty);
	$(abc).parent('td').next('td').find('input').val();
	 var iRowCount =document.getElementById("lastid").value;

	 for(var i=1; i<=iRowCount; i++)
     {
    	 amount =document.getElementById("discount"+i).value
    	 amount123=eval(amount123)+eval(amount);
    	
     }
	 document.getElementById("totalAmount").value=amount123;
	 document.getElementById("netAmount").value=amount123;
	
     
     }
  
  </script>




<script>
   function getderviceTax(tax)
   {
	
	var totalamount=netamt=totamt=0;
	 totalamount = document.getElementById("totalAmount").value;
	 netamt =(eval(tax)*eval(totalamount))/100;
	 totamt=  eval(totalamount+netamt);
	 totamt=  (eval(netamt)+eval(totalamount));
	 document.getElementById("netAmount").value=totamt;
	
	}
   function getVat(vat)
   
    {
	alert(vat);
	
	 var totalamount=netamt=totamt=0;
	 totalamount = document.getElementById("totalAmount").value;
	 netamt =(eval(vat)*eval(totalamount))/100;
	 totamt=  (eval(netamt)+eval(totalamount));
	 document.getElementById("netAmount").value=totamt;
	}


       function deletevalue()
      {
    	 
    	   var iRowCount =document.getElementById("lastid").value;
    	   alert("hii"+iRowCount);
    		 for(var i=1; i<=iRowCount; i++)
    	     {
    	    	 amount =document.getElementById("discount"+i).value
    	    	 amount123=eval(amount123)+eval(amount);
    	    	
    	     }
    		 document.getElementById("totalAmount").value=amount123;
    		
    	       
    	   
       }
	function getvendorInfo(vendorId) {
		if (vendorId == 0) {
			$("#phoneNo").val("");
			$("#email").val("");
			$("#addressLine1").val("");
			$("#addressLine2").val("");
		}
		$.getJSON('getVendorInfo/' + vendorId, function(data) {
			$("#phoneno").val(data.phoneno);
			$("#email").val(data.email);
			$("#Address1").val(data.addressLine1);
			$("#Address2").val(data.addressLine2);
		});
	}
</script>
 <script>
	$("#datepicker").datepicker({
		format : 'dd-mm-yyyy'
	}).datepicker("setValue", new Date());
</script>

<style>
.polowersec {
	width: 100%;
	/*background: red;*/
}

.poleft {
	float: left;
	width: 45%;
	height: auto;
}

.poright {
	float: left;
	right: 0px; width : 45%;
	height: auto;
	width: 45%;
	/*background: blue;*/
}

.PO {
	clear: both;
}

.PO input {
	width: 100px; height : 24px;
	padding: 3px 8px;
	height: 24px;
}

.POrightinner {
	padding-left: 200px; //
	float: right;
}

.POrightinner input {
	border-radius: 0px;
}
}
</style>