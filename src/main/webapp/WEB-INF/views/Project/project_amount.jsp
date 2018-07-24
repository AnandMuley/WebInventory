<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
        <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
         
         <spring:url value="/addprojectAmount"  var ="addProjectAmturl"/>
         <spring:url value="/addvat"  var ="vatDeleteurl"/></head>
  
   <body>
        
    <div id="wrapper">

        <!-- Navigation -->
       
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
              <form:form class="mws-form" Commandname="addProjectAmount" name="addProjectAmountForm" id="myForm"
						modelAttribute="addProjectAmount" action="${addProjectAmturl}" method="post">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Project Amount</h1>
                           <div>
						      <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
						   	<div class="col-xs-3">
						
						    <label>Project</label>
								        <select name="projectobj" id="projectId" class="form-control" style="width:100%;">
														    <option>---Select Project---- </option>
													<c:forEach var="projectlist" items="${addprojectlist}">
													    <option value="${projectlist.projectId}">${projectlist.projectname} </option>
													</c:forEach>
							   </select>
					    </div>
					   
						<div class="col-xs-3">
								<label>Project Amount</label><input type="text" id="project_amount" name="project_amount" class="form-control" placeholder="Project_amount">
					    </div>
					     <div class="col-xs-3" style="width: 50%;">
							<label style="color: #0066FF; font-size: 13px;">Amount
								Date</label> <input type="text" class="form-control" placeholder="Date"
								id="datepicker" name="project_amount_Date">
					</div>
						
			          </div>
                     <!-- /.col-lg-12 -->
                      </div><br><br>

				     <div class="container">
				  	    <button type="sumbit" id ="save"  name="save" class="btn btn-primary">Save</button>
					    <button type="sumbit" id="update" name="update" class="btn btn-info">Update</button>
				     </div>
				   	<input type="text"  id="id" name ="id" class="form-control"  style="visibility: hidden" >
					
                <!-- /.row --><br>
               <br>
                 </form:form>
				<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Project Amount
                        </div>
                          <div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Project Name</th>
							<th>Project Amount</th>
							<th> Amount Date</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					          <tbody>
										<%
									     int cnt = 1;
								         %>
										<c:forEach var="Projectamountlist" items="${Projectamountlist}">
										
										    <tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=cnt++%></td>
												<td>${Projectamountlist. projectobj.projectname}</td>
												<td>${Projectamountlist. project_amount}</td>
												<td>${Projectamountlist. project_amount_Date}</td>
												<td class="center"><a href="#"
								                 onclick="getVatDetails('${Projectamountlist.id}','${Projectamountlist.project_amount}')"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png">
								                 </a></td>
												<td class="center"> <a href="${vatDeleteurl}/${Projectamountlist.id}?DeleteProjectAmt"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
											</tr>
										</c:forEach>
										</tbody> 
				</table>
					</div>
                       
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>
<script type="text/javascript">
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	$("#datepicker").datepicker({
		format : 'dd-mm-yyyy'
	}).datepicker("setValue", new Date());
	
</script>
<script>
   $("#update").prop('disabled',false);
	function getVatDetails(vatId, vatPercent) {
		
		$("#vatId").val(vatId);
		$("#vatPercent").val(vatPercent);
		$("#save").prop('disabled',true);
		$("#update").prop('disabled',false);	
	}
	</script>

</html>
