
<html>
<head>

    <title>Poll Template | PrepBootstrap</title>


 <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
 
 
 <style>
    body {
        margin-top: 20px;
    }

    .panel-body:not(.two-col) {
        padding: 0px;
    }

    .glyphicon {
        margin-right: 5px;
    }

    .glyphicon-new-window {
        margin-left: 5px;
    }

    .panel-body .radio, .panel-body .checkbox {
        margin-top: 0px;
        margin-bottom: 0px;
    }

    .panel-body .list-group {
        margin-bottom: 0;
    }

    .margin-bottom-none {
        margin-bottom: 0;
    }

    .panel-body .radio label, .panel-body .checkbox label {
        display: block;
    }
</style>
</head>
<body>

<div class="container">

<div class="page-header">
    <h1>Poll <small>Bootstrap Poll Template</small></h1>
</div>

<!-- Poll - START -->
<div class="container">
    <div class="col-md-4"></div>

    <div class="col-md-4">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><span class="fa fa-line-chart"></span> Please Rate our service</h3>
            </div>
            <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value=""> Excellent
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value=""> Good
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value=""> Satisfactory
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value=""> Needs Improvement
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value=""> Poor
                            </label>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="panel-footer text-center">
                <button type="button" class="btn btn-primary btn-block btn-sm">
                    Vote</button>
                <a href="#" class="small">View Result</a>
            </div>
        </div>
    </div>
</div>



<!-- Poll - END -->

</div>

</body>
</html>