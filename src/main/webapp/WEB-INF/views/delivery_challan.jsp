<?php include('doctype.php');?>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <?php include('menu.php');?>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Delivery Challan</h1>
                    </div>
                    <!-- /.col-lg-12 -->
					<div class="col-xs-3">
								<label>Challan No</label><input type="text" class="form-control" placeholder="W.O Id">
				    </div>
					<div class="col-xs-3">
								<label>Challan Date</label><input type="text" class="form-control" placeholder="Date">
				    </div>
					<div class="col-xs-3">
								<label>Order No</label><input type="text" class="form-control" placeholder="Ref">
				    </div>
					<div class="col-xs-3">
								<label>Transport Through</label><input type="text" class="form-control" placeholder="Description">
				    </div>
					<br /><br />
                </div>
                <!-- /.row -->
				<div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Returnable Item/Non Returnable Item</h3>
                    </div>
                    <!-- /.col-lg-12 -->
					<div class="col-xs-3">
								<label>MDL Sr. No.</label><input type="text" class="form-control" placeholder="MDL Sr. No.">
				    </div>
					<div class="col-xs-3">
								<label>Compartment No.</label><input type="text" class="form-control" placeholder="Compartment No.">
				    </div>
					<div class="col-xs-3">
								<label>Description</label><input type="text" class="form-control" placeholder="Description">
				    </div>
					<div class="col-xs-3">
								<label>UOM</label><input type="text" class="form-control" placeholder="UOM">
				    </div>
					<div class="col-xs-3">
								<label>Quantity</label><input type="text" class="form-control" placeholder="Quantity">
				    </div>
					<br /><br />
                </div>
                <!-- /.row -->
				<br><br>

					<div class="container">
								<button type="button" class="btn btn-primary">Add</button>
								<button type="button" class="btn btn-info">Update</button>
					</div>
            </div>
            <!-- /.container-fluid --><br /><br />

			<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            All Challans
                        </div>
                        <!-- /.panel-heading -->
							<div class="panel-body" >
								<div class="dataTable_wrapper">
									<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer"><div class="row"><div class="col-sm-6"><div class="dataTables_length" id="dataTables-example_length"><label>Show <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div></div><div class="col-sm-6"><div id="dataTables-example_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTables-example"></label></div></div></div><div class="row"><div class="col-sm-12"><table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
										<thead>
											<tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 156px;">MPL Sr No.</th><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 181px;">Compartment</th><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 165px;">Description</th><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 135px;">Uom</th><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 97px;">Qty.</th><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 135px;">Edit</th><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 97px;">Delete</th></tr>
										</thead>
										<tbody>
										<tr class="gradeA odd" role="row">
												<td class="sorting_1">1</td>
												<td>1234JK</td>
												<td>Switch Board</td>
												<td>1234JK</td>
												<td>20</td>
												<td class="center"><img src="../bower_components/images/edit-notes.png"></td>
												<td class="center"><img src="../bower_components/images/DeleteRed.png"></td>
											</tr><tr class="gradeA even" role="row">
												<td class="sorting_1">2</td>
												<td>4567LM</td>
												<td>Bulbs</td>
												<td>1234JK</td>
												<td>100</td>
												<td class="center"><img src="../bower_components/images/edit-notes.png"></td>
												<td class="center"><img src="../bower_components/images/DeleteRed.png"></td>
											</tr></tbody>
									</table></div></div><div class="row"><div class="col-sm-6"><div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">Showing 1 to 2 of 57 entries</div></div><div class="col-sm-6"><div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate"><ul class="pagination"><li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">Previous</a></li><li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="#">1</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">2</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">3</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">4</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">5</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">6</a></li><li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">Next</a></li></ul></div></div></div></div>
								</div>
								<!-- /.table-responsive -->
								<!--<div class="well">
									<h4>DataTables Usage Information</h4>
									<p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
									<a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
								</div>-->
							</div>
							<!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
		  	<br>
					<div class="container">
	<button type="button" class="btn btn-default btn-default active">Save</button>
							<button type="button" class="btn btn-default btn-default active">Update</button>
							<button type="button" class="btn btn-default btn-default active">Edit</button>
							<button type="button" class="btn btn-default btn-default active">Delete</button>
							<button type="button" class="btn btn-default btn-default active">Print</button>
					<button type="button" class="btn btn-default btn-default active">PDF</button>					</div>
			
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

<?php include('jq.php');?>

</body>

</html>
