
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:if test="${not empty msg}">
	<c:if test="${msgType eq '1'}">
		<div class="alert alert-success alert-dismissable" id="add">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			<strong>Success: </strong>${msg}
		</div>
	</c:if>
	<c:if test="${msgType eq '2'}">
		<div class="alert alert-info alert-dismissable" id="update">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			<strong>Information: </strong>${msg}
		</div>
	</c:if>
	<c:if test="${msgType eq '3'}">
		<div class="alert alert-danger alert-dismissable" id="delete">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			<strong>Error: </strong>${msg}
		</div>
	</c:if>
	<c:if test="${msgType eq '4'}">
		<div class="alert alert-warning alert-dismissable" id="unable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			<strong>Warning: </strong>${msg}
		</div>
	</c:if>
	
</c:if>

<script>
var val='${msgType}';
if(val=='1')
{
	$(window).scrollTop(0);
	$("#add").slideDown();
	$("#add").fadeOut(7000);
}
if(val=='2')
{
	$(window).scrollTop(0);
	$("#update").slideDown();
	$("#update").fadeOut(7000);
}
if(val=='3')
{
	$(window).scrollTop(0);
	$("#delete").slideDown();
	$("#delete").fadeOut(7000);
}
if(val=='4')
{
	$(window).scrollTop(0);
	$("#unable").slideDown();
	$("#unable").fadeOut(7000);
}



</script>