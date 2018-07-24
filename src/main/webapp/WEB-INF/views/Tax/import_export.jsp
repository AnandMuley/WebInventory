<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
        <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
         
         <spring:url value="/addExport"  var ="addExporturl"/>
         <spring:url value="/addvat"  var ="vatDeleteurl"/></head>
  

<body>

    <div id="wrapper">

        <!-- Navigation -->
    

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
             <form:form class="mws-form" Commandname="addexportModel" name="addexportModelForm" id="myForm"
						modelAttribute="addexportModel" action="${addExporturl}" method="post">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Add Import/Export Duty</h1>
                         <div>
						      <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
						<div class="col-xs-3">
								<label>Import/Export Duty Type</label>
							
								<select class="form-control" id="import_export" name="import_export">
									<option>Select Import/Export</option>
									 <option>Import</option>
									 <option>Export</option>
								</select>
					    </div>
						<div class="col-xs-3">
								<label>Duty(%)</label><input type="text" id="import_export_percent" name="import_export_percent"  class="form-control" placeholder="Duty">
					    </div>
						
                    </div>
                    <!-- /.col-lg-12 -->
                </div><br><br>

				   <div class="container">
				  	    <button type="sumbit" id ="save"  name="save" class="btn btn-primary">Save</button>
					    <button type="sumbit" id="update" name="update" class="btn btn-info">Update</button>
				     </div>
				   	<input type="text"  id="import_export_Id" name ="import_export_Id" class="form-control"  style="visibility: hidden" >
                <!-- /.row --><br>
<br>
      </form:form>
				<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Import/Export
                        </div>
                        <!-- /.panel-heading -->
							 
                          <div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Import/Export</th>
							<th>Import/Export Percent</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					          <tbody>
										<%
									     int cnt = 1;
								         %>
										<c:forEach var="importExportlist" items="${importExportlist}">
										
										    <tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=cnt++%></td>
												<td>${importExportlist. import_export}</td>
												<td>${importExportlist. import_export_percent}</td>
												<td class="center"><a href="#"
								                 onclick="getVatDetails('${importExportlist.import_export_Id}','${importExportlist.import_export_percent}')"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png">
								                 </a></td>
												<td class="center"> <a href="${addExporturl}/${importExportlist.import_export_Id}?DeleteVat"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
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

</html>
<script type="text/javascript">
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	
</script>
