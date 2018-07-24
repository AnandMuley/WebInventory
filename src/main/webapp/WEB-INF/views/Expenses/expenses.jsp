<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <head>
          <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	  <jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
         
          <spring:url value="/addExpenses"  var ="addexpenesurl"/>
          <spring:url value="/addExpenses" var ="expneseDeleteurl"/></head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
       

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
             <form:form class="mws-form"  id="myForm">
						
                <div class="row" style="width:100%;" >
                    <div class="col-lg-12">
                        <h1 class="page-header">Expenses</h1>
                    </div>
                       <div "col-xs-3">
						<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						</div>
						
                    <!-- /.col-lg-12 -->
                    
                    <div style="width:30% !important;height:200px !important;overflow:scroll;" class="col-xs-3">
					<table  id="table123">
					<thead>
						<tr>
						   <th>Project name</th>
							<th>Percent</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${projectlist}" var="projectlist"
							>
							<tr>
								
								<td><input type="checkbox" value="${projectlist.projectId}" name="projectId[]" /><span class="sis_form_key">${projectlist.projectname}</span></td>
								<td><input type="text" value="0" style="width:50;" name="percent[]" id="percent" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					</div>
					
					<%-- <div class="col-xs-3">
					 
						<label>Project</label>
								 <select name="projectId[]" id="projectId" class="form-control" style="width:100%;" multiple="multiple">
														    <option>---Select Project---- </option>
													<c:forEach var="projectlist" items="${projectlist}">
													    <option value="${projectlist.projectId}">${projectlist.projectname} </option>
													</c:forEach>
							   </select>
					    </div> --%>
		<div  style="width:70% !important;height:200px;float:left;">
					<div class="col-xs-3" style="width:180px !important;" >
								<label>Expense Description</label><input type="text"  id="specification" name="specification" class="form-control" placeholder="Expense Name">
				    </div>
				    <div class="col-xs-3"style="width:180px !important;">
						<label>Select Payment Mode</label>
							<select class="form-control"  onChange="hidepaymentmode(this.value)" id="paymentMode" name="paymentMode">
                                     <option value="Cash">Cash</option>
                    	           <option value="Cheque">Cheque</option>
                                    <option value="Card">By Card</option>
                    </select>
				    </div>
				     <div class="col-xs-3" style="width:180px !important;">
				     <label>Expense Date:</labe	l>
                      <input type="text" name="expensesDate" id="datepicker" class=" form-control" >
                     </div>
         </div>
				   </div>
				   <!-- row close  div-->
	         <div class="row" style="margin-left:25%;">
         
			     <div  id="ChNo" style="display:none" class="col-xs-3">
                    <label>Check No:</label>
                    <input type="text" name="bank_cheque" class="form-control">
                </div> 
               <div id="TrNo" style="display:none" class="col-xs-3">
                    <label>Transaction No:</label>
                    <input type="text" name="bank1_cheque" class="form-control">
               </div>
              <div id="ChD" style="display:none" class="col-xs-3">
                    <label>Check Date:</label>
                    <input type="text" name="cheque_date" id="datepicker" class=" form-control" >
              </div>
              <div id="TrD" style="display:none" class="col-xs-3">
                    <label>Transaction Date:</label>
                    <input type="text" name="cheque1_date" id="datepicker" class=" form-control" >
              </div>
              <div id="TotlCh" class="col-xs-3">
                     <label> Paying Amount</label>
								  <div class="form-group" >
									<label class="sr-only" for="">Purchase Rate</label>
									<div class="input-group">
									  <div class="input-group-addon">Rs.</div>
									  <input type="text" class="form-control" style="width:70px;" name="netAmount"  id="netAmount" placeholder="Amount">
									 
									</div>
								  </div>
                    <!-- <label>Paying Cash:</label>
                    <input type="text" name="paying_cash" id="paying_cash" class="form-control"> -->
              </div>
        </div>  
        <!-- row close  div-->  
					<!-- <div class="col-xs-3">
								<label>Amount</label>
								  <div class="form-group" >
									<label class="sr-only" for="">Purchase Rate</label>
									<div class="input-group">
									  <div class="input-group-addon">Rs.</div>
									  <input type="text" class="form-control" name="netAmount"  id="netAmount" placeholder="Amount">
									  <div class="input-group-addon">.00</div>
									</div>
								  </div>
					    </div> -->
					
               
                <!-- /.row -->
				<br><br>
         
				    <div class="container">
					     <button type="button" id="save" name="save" class="btn btn-primary" onclick="validate_form();">Save</button>
					</div>
					<input type="text" id="expensesId" name ="expensesId" class="form-control" value="0" style="visibility: hidden"  >
					 </form:form>
            </div>
            
             
            <!-- /.container-fluid -->
		<br><br>
		<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          View Expenses
                        </div>
                        <!-- /.panel-heading -->
							<div class="panel-body" >
								<div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th> Expenese Description</th>
							<th>Amount</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					         <tbody>
										<%
									     int cnt = 1;
								         %>
										<c:forEach var="Expenseslist" items="${Expenseslist}">
										
										    <tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=cnt++%></td>
												<td>${Expenseslist. specification}</td>
												<td>${Expenseslist. netAmount}</td>
												<td class="center"><a href="#"
								                 onclick="getExpenesDetails('${Expenseslist.expensesId}','${Expenseslist.projectobj.projectId}','${Expenseslist.specification}','${Expenseslist.netAmount}','${Expenseslist.paymentMode}','${Expenseslist.expensesDate}')"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png">
								                 </a></td>
												<td class="center"> <a href="${expneseDeleteurl}/${Expenseslist.expensesId}?DeleteExpenses"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
											</tr>
										</c:forEach>
							</tbody> 
				  </table>
					</div>
						 </div>		
							</div>
							<!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
					
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->


</body>
<script type="text/javascript">

$("#srnSavedSuccessfully").hide();
	$('#dataTable').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});

	$("#datepicker").datepicker({
		format : 'dd-mm-yyyy'
	}).datepicker("setValue", new Date());
	
	
	
</script>


 <script>
          function validate_form()
          {
        	  var percent = [];
        	  $("#table123 tr").each(function() {
        		  var val=$(this).find("td:first").find('input:checkbox:checked').val();
        		
        		  if(!isNaN(val))
        			  {
        			  //projectid.push($(this).find("td:first").next().find('input').val());
        			  percent.push($(this).find("td:first").next().find('input').val());
        			  }
        		});
        	 
        	  var formData = $("#myForm").serialize();
        		//formData += "&projectid=" + encodeURIComponent(projectid);
        		formData += "&percent=" + encodeURIComponent(percent); 
        		$.ajax({
        			url : "${pageContext.request.contextPath}/addExpenses",
        			type : "POST",
        			data :formData,
        			success : function(data) {
        				alert("Add Expense successfully");
        				location.reload();
        				$("#myForm")[0].reset();
        			},
        			error : function(xhr, ajaxOptions, thrownError) {
        				alert("err" + thrownError + xhr.responseText);

        				return false;
        			}
        		});
        	  return true;
          }
          
          </script>

<script>
function hidepaymentmode(str)
{

	if(str == "Cash")
	{
		document.getElementById("TotlCh").style.display = "table-row";
		document.getElementById("ChD").style.display = "none";
		document.getElementById("ChNo").style.display = "none";
		document.getElementById("BkName").style.display = "none";
		document.getElementById("TrD").style.display = "none";
		document.getElementById("TrNo").style.display = "none";
	}
	else if(str == "Cheque")
	{
		document.getElementById("TotlCh").style.display = "table-row";
		document.getElementById("ChD").style.display = "table-row";
		document.getElementById("ChNo").style.display = "table-row";
		document.getElementById("BkName").style.display = "table-row";
		document.getElementById("TrD").style.display = "none";
		document.getElementById("TrNo").style.display = "none";
	}
	else if(str == "Card")
	{
		document.getElementById("TotlCh").style.display = "table-row";
		document.getElementById("TrD").style.display = "table-row";
		document.getElementById("TrNo").style.display = "table-row";
		document.getElementById("BkName").style.display = "table-row";
		document.getElementById("ChD").style.display = "none";
		document.getElementById("ChNo").style.display = "none";
	}
	else if(str == "Credit")
	{
	    document.getElementById("TotlCh").style.display = "none";
		document.getElementById("ChD").style.display = "none";
		document.getElementById("ChNo").style.display = "none";
		document.getElementById("BkName").style.display = "none";
		document.getElementById("TrD").style.display = "none";
		document.getElementById("TrNo").style.display = "none";
	}		
} 
</script>
<script>
   $("#update").prop('disabled',false);
	function getExpenesDetails(expenseId, project,specfiction, netamount,paymentmode,datepick) 
	{
		
		$("#expensesId").val(expenseId);
	//	$("#projectId").val(project);
		$("#specification").val(specfiction);
		$("#netAmount").val(netamount);
		$("#paymentMode").val(paymentmode);
		$("#datepicker").val(datepick);
		
		$("#save").prop('disabled',true);
		$("#update").prop('disabled',false);	
		
		$("#table123").children('tbody').find(":checkbox")
		.each(function() {
			if($(this).val()==project)
				{
					$(this).prop('checked',true);
				}
			else
				{
				$(this).prop('checked',false);
				}
		});
	}
	</script>




</html>
