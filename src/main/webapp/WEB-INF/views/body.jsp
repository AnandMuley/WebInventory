
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<spring:theme code="bootstrap.css" var="bootstrapCss" />
<spring:url value="/${bootstrapCss}" var="bootstrap" /> 
<link rel="stylesheet" type="text/css" href="${bootstrap}" media="screen">

<spring:theme code="metisMenu.css" var="metisMenuCss" />
<spring:url value="/${metisMenuCss}" var="metisMenuCss1" /> 
<link rel="stylesheet" type="text/css" href="${metisMenuCss1}" media="screen">

<spring:theme code="timeline.css" var="timelineCss" />
<spring:url value="/${timelineCss}" var="timelineCss1" /> 
<link rel="stylesheet" type="text/css" href="${timelineCss1}" media="screen">

<spring:theme code="custom.css" var="customCss" />
<spring:url value="/${customCss}" var="customCss1" /> 
<link rel="stylesheet" type="text/css" href="${customCss1}" media="screen">

<%-- <spring:theme code="morrisChart.css" var="morrisChartCss" />
<spring:url value="/${morrisChartCss}" var="morrisChartCss1" /> 
<link rel="stylesheet" type="text/css" href="${morrisChartCss1}" media="screen"> --%>


<spring:theme code="fontAwesome.css" var="fontAwesomeCss" />
<spring:url value="/${fontAwesomeCss}" var="fontAwesomeCss1" /> 
<link rel="stylesheet" type="text/css" href="${fontAwesomeCss1}" media="screen">

<spring:theme code="fontAwesomeMin.css" var="fontAwesomeMinCss" />
<spring:url value="/${fontAwesomeMinCss}" var="fontAwesomeMinCss1" /> 
<link rel="stylesheet" type="text/css" href="${fontAwesomeMinCss1}" media="screen">

<spring:theme code="message.css" var="messagecss" />
<spring:url value="/${messagecss}" var="message12" /> 
<link rel="stylesheet" type="text/css" href="${message12}" media="screen">

<spring:theme code="jquery.dataTables.css" var="jqueryDataTablesCss" />
<spring:url value="/${jqueryDataTablesCss}" var="jqueryDataTablesCss1" /> 
<link rel="stylesheet" type="text/css" href="${jqueryDataTablesCss1}" media="screen">

<spring:theme code="glDatePicker.default.css" var="glDatePickerDefaultCss" />
<spring:url value="/${glDatePickerDefaultCss}" var="glDatePickerDefaultCss1" /> 
<link rel="stylesheet" type="text/css" href="${glDatePickerDefaultCss1}" media="screen">

<spring:theme code="popup.css" var="popupCss" />
<spring:url value="/${popupCss}" var="popupCss1" /> 
<link rel="stylesheet" type="text/css" href="${popupCss1}" media="screen">

<spring:theme code="ui.css" var="uicss12" />
<spring:url value="/${uicss12}" var="uicss" /> 
<link rel="stylesheet" type="text/css" href="${uicss}" media="screen">



<!--  jquery file add in   -->


<spring:theme code="JQuery.min.js" var="jqueryMinJs" />
<spring:url value="/${jqueryMinJs}" var="jqueryMinJs1" />
<script src="${jqueryMinJs1}" type="text/javascript"></script>

<spring:theme code="customeTheme.js" var="customeThemeJs" />
<spring:url value="/${customeThemeJs}" var="customeThemeJs1" />
<script src="${customeThemeJs1}" type="text/javascript"></script>

<spring:theme code="bootstrap.min.js" var="bootstrapMinJs" />
<spring:url value="/${bootstrapMinJs}" var="bootstrapMinJs1" />
<script src="${bootstrapMinJs1}" type="text/javascript"></script>

<spring:theme code="metisMenu.min.js" var="metisMenuJs" />
<spring:url value="/${metisMenuJs}" var="metisMenuJs1" />
<script src="${metisMenuJs1}" type="text/javascript"></script>

<spring:theme code="raphael-min.js" var="raphelMinJs" />
<spring:url value="/${raphelMinJs}" var="raphelMinJs1" />
<script src="${raphelMinJs1}" type="text/javascript"></script>




<spring:theme code="highCharts.js" var="highChartsJs" />
<spring:url value="/${highChartsJs}" var="highChartsJs1" />
<script src="${highChartsJs1}" type="text/javascript"></script>

<spring:theme code="bootstrap.filestyle.js" var="bootstrapFilestyleJs" />
<spring:url value="/${bootstrapFilestyleJs}" var="bootstrapFilestyleJs1" />
<script src="${bootstrapFilestyleJs1}" type="text/javascript"></script>

<spring:theme code="jquery.dataTables.js" var="jqueryDataTablesJs" />
<spring:url value="/${jqueryDataTablesJs}" var="jqueryDataTablesJs1" />
<script src="${jqueryDataTablesJs1}" type="text/javascript"></script>

<spring:theme code="bootstrap-datepicker.js" var="glDatePickerMinJs" />
<spring:url value="/${glDatePickerMinJs}" var="glDatePickerMinJs1" />
<script src="${glDatePickerMinJs1}" type="text/javascript"></script>

<spring:theme code="bootstrap-tooltip.js" var="bootstrapTooltipJs" />
<spring:url value="/${bootstrapTooltipJs}" var="bootstrapTooltipJs1" />
<script src="${bootstrapTooltipJs1}" type="text/javascript"></script>


<spring:theme code="ui.js" var="uijs12" />
<spring:url value="/${uijs12}" var="uijs" />
<script src="${uijs}" type="text/javascript"></script>


<!-- Custome Js -->
<spring:theme code="stateCity.js" var="stateCityJs" />
<spring:url value="/${stateCityJs}" var="stateCityJs1" />
<script src="${stateCityJs1}" type="text/javascript"></script>

<style>
	
	{
	margin:0;padding:0;
	}
	html
	{
	overflow-x:hidden;
	}
	.col-xs-3
	{
	width:25% !important; 
	margin-top:10px;
	height:46px !important;
	}
	.col-xs-3 label
	{
	color:#0066FF;
	font-size:13px;
	}
	.page-header
	{
	color:#000066;
	}
	.input-group-addon
	{
	height:10px !imporatant;
	}
	.btns
	{
	margin-top:40px;
	margin-bottom: 10px;
	}
	.col-xs-3 {
width: auto;
}
select
{
width:80%;
}
.page-header
{margin: 10px 0px !important;
font-size:26px !important;
height: 54px;
}
.form-control {
display: block;
width:80%;
height: 24px;
padding: 4px 12px;
font-size: 13px;
line-height: 1.42857143;
color: #555;
background-color: #fff;
background-image: none;
border: 1px solid #ccc;
border-radius: 4px;
-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
table
{
border-collapse: collapse;
border:1px solid #ccc;
}
.required.form-control
{
padding: 6px 5px;
text-align: right;
}
table tr td
{
padding:5px;
border: none;
}
table tr th
{
text-align: center !important;
border:1px solid #ccc;
}
	</style>
<script type="text/javascript">
function isEmpty(text){
        var patt1 = /\W/g;
        var result = text.match(patt1);
        return !result || 0 === result.length
    }
function translatedText(text,field) {
    var url = "https://translation.googleapis.com/language/translate/v2?key=AIzaSyCv2_O2ma_PjNGiWdIvNlPkMOT-gLD1QE4";
    url += "&source=EN";
    url += "&target=MR";
    url += "&q=" + escape(text);
    $.get(url, function (data, status) {
        $(field).val(data.data.translations[0].translatedText);

    });
};
</script>
