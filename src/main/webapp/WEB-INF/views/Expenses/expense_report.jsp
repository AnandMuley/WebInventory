
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
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Expenses Report</h1>
						   <!-- /.panel-heading -->
							<div class="panel-body" >
								<div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
								<th>Project Name</th>
							<th>Project In Amount</th>
							<th> Work Order Amount</th>
						    <th> Expense Amount</th>
							<th>Profit</th>
						</tr>
					</thead>
					         <tbody>
										<%
									     int cnt = 1;
								         %>
										<c:forEach var="ProjectDetailsModels" items="${ProjectDetailsModels}">
										
										    <tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=cnt++%></td>
												<td>${ProjectDetailsModels. nameproject}</td>
												<td>${ProjectDetailsModels. project_amount}</td>
												<td>${ProjectDetailsModels. expense_amount}</td>
												<td>${ProjectDetailsModels. work_amount}</td>
												<td>${ProjectDetailsModels. profit_amount}</td>
												
											</tr>
										</c:forEach>
							</tbody>  
				   </table>
					</div>
				 </div>		
			</div>
                   
                   
                   
                   
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->


</body>

</html>
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

