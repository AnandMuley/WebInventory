

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


	<div id="page-wrapper">
		<div class="container-fluid">
			<form:form class="mws-form" id="myForm">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">SRN</h1>
					</div>
					<div class="col-xs-3" style="width: 50%;">
						<label>SRN No.: ${srnList[0].srnNumber}<br>
						 Project Name : ${srnList[0].projectobj.projectname}<br> 
						Date : ${srnList[0].srnDate}</label><br> 
					</div>
					<div class="col-xs-12">
						<table id="dataTable1" class="display">
							<thead>
								<tr>
									<th>Sr. No.</th>
									<th>Godown</th>
									<th>Product</th>
									<th>Quantity</th>
									<th>Unit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${srnList}" var="srnObj"
									varStatus="theCount">
									<tr>
										<td><c:out value="${theCount.count}"></c:out></td>
										<td>${srnObj.productModel.godowanModel.addgodowanName}</td>
										<td>${srnObj.productModel.productName}</td>
										<td>${srnObj.quantity}</td>
										<td>${srnObj.unit}</td>
									</tr>
								</c:forEach>
									
							</tbody>
						</table>
					</div>

				</div>
			    <br><br>
                 <div class="col-xs-12">
					<button type="button" id="save" name="save" class="btn btn-primary" onClick="closePopUp();">Cancel</button>
				</div>
			</form:form>
		</div>
	</div>

<script type="text/javascript">
	$('#dataTable1').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});
</script>

