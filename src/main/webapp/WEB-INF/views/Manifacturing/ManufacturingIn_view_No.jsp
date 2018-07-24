

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


	<div id="page-wrapper">
		<div class="container-fluid">
			<form:form class="mws-form" id="myForm">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Manufacturing</h1>
					</div>
					<div class="col-xs-3" style="width: 50%;">
						<label>Manufacturing No.: ${addmanufacturinglist[0].manufacturing_no}<br>
						Manufacturing Name : ${addmanufacturinglist[0].manufacturingModel.manufacturingName}<br> 
						Date : ${addmanufacturinglist[0].manufacturingDate}</label><br> 
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
								<c:forEach items="${addmanufacturinglist}" var="MuInObj"
									varStatus="theCount">
									<tr>
										<td><c:out value="${theCount.count}"></c:out></td>
										<td>${MuInObj.productModel.godowanModel.addgodowanName}</td>
										<td>${MuInObj.productModel.productName}</td>
										<td>${MuInObj.quantity}</td>
										<td>${MuInObj.unit}</td>
									</tr>
								</c:forEach>
									<!-- <tr>
						<td colspan="4"><input type="button" onClick="closePopUp();"
							value="Cancel" class="btn btn_danger" /></td>
					</tr> -->
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

