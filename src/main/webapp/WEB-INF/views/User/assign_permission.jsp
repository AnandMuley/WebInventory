<?php include('doctype.php');?>
<style>

/*-----------Tabs------------------*/
	ul.tabs {
		margin:0px;
		margin-top:0px;
		margin-bottom:0;
		//box-shadow: 0px 5px 5px #888888;
		padding-left:0px;
		float: left;
		list-style: none;
		height: auto;
		border-bottom: 2px solid #000033;
		//border-left: 1px solid #999999;
		width: 100%;
	}
	ul.tabs li {
		float: left;
		margin-top:5px;
		margin-right:3px;
		cursor: pointer;
		border-top-left-radius:3px;
		border-top-right-radius:3px;
		//border:1px solid #ffffff;
		//border-bottom:none;
		padding: 0px 10px ;
		color:#006699;
		padding-top:0px;
		height: 35px;
		line-height: 31px;
		font-size:16px;
		//border: 1px solid #999999;
		border-left: none;
		//border:1px solid #CCCCCC;
		//background: #EEEEEE;
		overflow: hidden;
		position: relative;
	}
	ul.tabs li:hover {
		background: #0D477A;
		color:#fff;
		//border:1px solid #CCCCCC;
		//border-bottom:2px solid #222222;
		//background: none;
	}	
	ul.tabs li.active{
		background: #0D477A;
		color:#fff;
		//border:1px solid #FFFFFF;
		//border-bottom:2px solid #222222;
	}
	.tab_container {
		//border: 1px solid #999999;
		border-top: none;
		clear: both;
		//float: left; 
		margin-top:20px;
		width: 100%;
		//background: #D5D9DC;
	}
	.tab_content {
		//padding: 20px;
		font-size: 1.2em;
		display: none;
		width:100%;
		//height:600px;
		 height:100vh; 
		//background:#D5D9DC;
	}
	/*#tab1,#tab2,#tab3,#tab4,#tab5,#tab6,#tab7,#tab8#,tab9,#tab10,#tab11
	{
	height:400px !important;
	border:1px solid #ffffff;
	background:#000000;
	}*/
	#container {
		width: 100%;
		margin: 0 auto;	
	}


</style>
<body>

    <div id="wrapper">

        <!-- Navigation -->
        <?php include('menu.php');?>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Assign Permission to user</h1>
                    </div>
                    <!-- /.col-lg-12 -->
				</div><!-- /.row -->	
               
<div id="container" >

  <ul class="tabs"> 
        <li class="active" rel="tab1" data-toggle="tooltip" title=""> Inventory</li>
        <li rel="tab2" data-toggle="tooltip" title=""> Purchase</li>
        <li rel="tab3" data-toggle="tooltip" title="Student Attandence">Project</li>
  </ul>
  
 <!-- <div style="clear:both;"></div>-->
<div class="tab_container"> 
     <div id="tab1" class="tab_content" > 
					<div class="col-xs-3"style="margin-bottom:20px";>
											<label>Select User</label>
											<select class="form-control">
												 <option>Select User</option>
												 <option>User1</option>
												 <option>User2</option>
										</select>
								</div>

					 <div class="Container" style="Clear:both;margin:0px 0 0 15px;">
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								Add Godown
							  </label>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								Add Product
							  </label>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								Add Category
							  </label>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								Add Vat
							  </label>
							</div>
					</div>
     </div><!-- #tab1 -->
     <div id="tab2" class="tab_content"> 
      	<div class="Container" style="Clear:both;margin:0px 0 0 15px;">
		<br>

							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								Purchase Bill
							  </label>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								SRN
							  </label>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								PRN
							  </label>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								Purchase Order
							  </label>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								Vendor
							  </label>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								Work Order
							  </label>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" value="">
								Delivery Challan
							  </label>
							</div>
					</div>
		
     </div><!-- #tab2 -->
     <div id="tab3" class="tab_content"> 
			<br>
		<div class="Container" style="Clear:both;margin:0px 0 0 15px;">
			<div class="checkbox">
			  <label>
				<input type="checkbox" value="">
				Add Project
			  </label>
			</div>
			<div class="checkbox">
			  <label>
				<input type="checkbox" value="">
				Expenses
			  </label>
			</div>
		</div><br>
		<div class="container">
								<button type="button" class="btn btn-primary">Assign Permissions</button>
								<button type="button" class="btn btn-default btn-default active">Cancel</button>
					</div>
     </div><!-- #tab3 -->
</div> <!-- tab_container --> 
					


</div>

<br><br>

				<div class="container">
					<button type="button" class="btn btn-primary">Save</button>
					<button type="button" class="btn btn-info">Update</button>
					</div>
                
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

<?php include('jq.php');?>
<script>
$(document).ready(function() {
	$(".tab_content").hide();
	$(".tab_content:first").show(); 

	$("ul.tabs li").click(function() {
	<!--alert($(this).val());-->
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).fadeIn(); 
	});
});
</script>
</body>

</html>
