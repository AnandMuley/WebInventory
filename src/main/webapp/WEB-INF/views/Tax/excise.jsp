<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
        <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
         
         <spring:url value="/addExciesDuty"  var ="addExciseurl"/>
         <spring:url value="/addvat"  var ="vatDeleteurl"/></head>
  

<body>

    <div id="wrapper">

        <!-- Navigation -->
      

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
             <form:form class="mws-form" Commandname="addExcise" name="ExciseForm" id="myForm"
						modelAttribute="addExcise" action="${addExciseurl}" method="post">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Add Excise Duty</h1>
                         <div>
						      <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
						<div class="col-xs-3">
								<label>Excise Duty(%)</label><input type="text" id ="excisePercent " name="excisePercent" class="form-control" placeholder="Excise Duty">
					    </div>
						
                    </div>
                    <!-- /.col-lg-12 -->
                </div><br><br>

			   <div class="container">
				  	    <button type="sumbit" id ="save"  name="save" class="btn btn-primary">Save</button>
					    <button type="sumbit" id="update" name="update" class="btn btn-info">Update</button>
				     </div>
				   	<input type="text"  id="exciseId" name ="exciseId" class="form-control"  style="visibility: hidden" >
                <!-- /.row --><br>
<br>
            </form:form>
				<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Excise
                        </div>
                        <!-- /.panel-heading -->
						
                          <div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Excise Percent</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					          <tbody>
										<%
									     int cnt = 1;
								         %>
										<c:forEach var="ExciseList" items="${ExciseList}">
										
										    <tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=cnt++%></td>
												<td>${ExciseList. excisePercent}</td>
												<td class="center"><a href="#"
								                 onclick="getVatDetails('${ExciseList.exciseId}','${ExciseList.excisePercent}')"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png">
								                 </a></td>
												<td class="center"> <a href="${addExciseurl}/${ExciseList.exciseId}?DeleteVat"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
											</tr>
										</c:forEach>
										</tbody> 
				</table>
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
