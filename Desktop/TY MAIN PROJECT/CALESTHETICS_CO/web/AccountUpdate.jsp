<%@ page import="cal_java.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	String name = (String) session.getAttribute("username");
	if (name == null) {
		response.sendRedirect("MemberLogin.jsp");
	} else {
		String id = (String) session.getAttribute("id");
		String entity = (String) session.getAttribute("entity");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Account Update</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">

<script src="src/js/jquery.min.js"></script>

<script language="javascript">

$(document).ready(function() {
	
	var entity = $("#entity").val();
	
	$("#btnEmail").click(function(e) {
		e.preventDefault();
    	var userId = $(this).val();
		var emailId = $("#emailId").val();
		var mobileNo = "";
		var address = "";
		var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        var chkEmail = expr.test(emailId);
        if(emailId.length==0 || chkEmail == false)
		{
        	$("[emailId-invalid-modal]").modal();
        	$("#emailId").focus();
		}
    	else
    	{
      	 	$.ajax({		
                type : "POST",
                url : "AccountUpdateAction.jsp",
                data : "userId=" + userId + "&entity=" + entity + "&emailId=" + emailId + "&mobileNo=" + mobileNo + "&address=" + address,
                success : function(response) {
 					eval(response);
                }
            });  
    		
    	}
    	
		
	});
	
	$("#btnMobile").click(function(e) {
		e.preventDefault();
    	var userId = $(this).val();
    	var emailId = "";
	var address = "";
    	var mobileNo = $("#mobileNo").val();
    	if(isNaN(mobileNo) || mobileNo.length!=10)
		{
        	$("[mobileNo-invalid-modal]").modal();
        	$("#mobileNo").val('');
		}

    	else
    	{
      	 	$.ajax({
                type : "POST",
                url : "AccountUpdateAction.jsp",
                data : "userId=" + userId + "&entity=" + entity + "&emailId=" + emailId + "&mobileNo=" + mobileNo + "&address=" + address,
                success : function(response) {
 					eval(response);
                	
                }
            });  
    		
    	}
    	
	});
	
	$("#btnAddress").click(function(e) {
		e.preventDefault();
    	var userId = $(this).val();
    	var address = $("#address").val();
    	var emailId = "";
	var mobileNo = "";
    	if(address.length<0 && address.length>=30)
    	{
        	$("[address-invalid-modal]").modal();
    		$("#address").focus();
    	}

    	else
    	{
      	 	$.ajax({
      	 		
                type : "POST",
                url : "AccountUpdateAction.jsp",
                data : "userId=" + userId + "&entity=" + entity + "&emailId=" + emailId + "&mobileNo=" + mobileNo + "&address=" + address,
                success : function(response) {
 					eval(response);
                	
                }
            });  
    		
    	}

    	
    });
	

});
	
</script>
</head>

<body style="background-color: lightgray;font-weight: 700">
<input type="hidden" id="entity" value="<%=entity%>">
	<div class="navbar navbar-fixed-top navbar-inverse" id="navbarTop">
		<div class="navbar-header">
			<div class="navbar-brand">ABSOLUTE FIT</div>
			<button ="button" class="navbar-toggle btn-md" data-toggle="collapse"
				data-target="#navbarAccount">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="collapse navbar-collapse" id="navbarAccount">

			<ul class="nav navbar-nav navbar-left">
				<li> <img src="src/mycss/images/AJ1.png" alt="Project CAL Logo" title="Project CAL" width="35" height="35" style="margin-top:7px; "> </li> 
				<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><a href="MemberAccount.jsp"><span
						class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Home</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				
				<li><a href="AccountUpdate.jsp"><span
								class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;
								Account</a></li>
				<li><a href="PostUpdate.jsp"><span
								class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;
								Post</a></li>	
                                <li><a href="Feedback.jsp"><span
								class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;
								Feedback</a></li>	
								
				<li><a href=""><span
								class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;
								<%=name%></a></li>			
					<li><a href="Logout.jsp"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Logout</a></li>
											
			</ul>


		</div>
	</div>
	<%
		Member memb = MemberWorker.getMemberById(Integer.parseInt(id));
	%>

	<div class="row">
		<br>	<br>

		<div class="col-sm-0"></div>
		<div class="col-xs-12">
			<div class="container">

				<div class="panel panel-default">

					<div class="well" align="center">
						<h3>UPDATE YOUR ACCOUNT</h3>
					</div>


					<div class="panel panel-body" style="padding: 1%; margin: 0%;">

						<div class="row">
							<div class="col-lg-4">
							
								<div class="panel panel-default">
									<div class="panel panel-header" align="center">
										<h4>PROFILE PHOTO</h4>
										<a href="AccountUpdate.jsp" class="glyphicon glyphicon-refresh"></a>
									</div>

									<div class="panel panel-body" align="center"
										style="padding: 1%; margin: 0%;">
										<%
											String image = MemberWorker.getJspPath() + memb.getProfilePhoto();
										%>
										<img src="<%=image%>" class="img img-circle img-responsive"
											style="height: 80%; width: 80%;">
										<form method="post" action="ProfilePhotoUploader.jsp" enctype="multipart/form-data">
										<input type="file" required name="photo" accept="image/*">
										<input type="hidden" name="id" value="<%=id%>">
										<input type="hidden" name="entity" value="<%=entity%>">
									</div>

									<div class="panel panel-footer" align="center"
										style="margin: 0%;">
										<button type="submit" class="btn btn-primary">Update Profile Photo</button>
										</form>
										
										
									</div>
								</div>
							
							</div>

							<div class="col-lg-8">
								<div class="panel panel-default">
									<div class="panel panel-header" align="center">
										<h4>PERSONAL DETAILS</h4>
									</div>

									<div class="panel panel-body" style="padding: 1%; margin: 0%;">
										<div>

											<div class="row">
											<div class="col-sm-2">
											</div>
											<div class="col-sm-6">
											<div class="input-group">
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-user"></span>
												</div>
												<input class="form-control" name="name"
													value="<%=memb.getName()%>" disabled>
											</div>
											</div>
											</div>

											<br>
											
											<div class="row">
											<div class="col-sm-2">
											</div>
											<div class="col-sm-6">
											<div class="input-group">
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-user"></span>
												</div>
												<input class="form-control" name="gender"
													value="<%=memb.getGender()%>" disabled>
											</div>
											</div>
											</div>
											

											<br>

											<div class="row">
											<div class="col-sm-2">
											</div>
											<div class="col-sm-6">
											<div class="input-group">
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-envelope"></span>
												</div>
												<input class="form-control"
													id="emailId" value="<%=memb.getEmailId()%>">
											</div>
											</div>
											<div class="col-sm-2">
											<button id="btnEmail" value="<%=id%>" class="btn btn-primary">Update Email</button>
											</div>
											</div>
											<br>

											<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-6">
											<div class="input-group">
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-phone"></span>
												</div>
												<input type="text" class="form-control"
													id="mobileNo" value="<%=memb.getMobileNo()%>" webkit-appearance=none>
											</div>
											</div>
											<div class="col-sm-2">
											<button id="btnMobile" value="<%=id%>" class="btn btn-primary">Update Mobile</button>
											</div>
											</div>
											<br>

											<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-6">
											<div class="input-group">
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-home"></span>
												</div>
												<textarea class="form-control" placeholder="Address"
													id="address" style="height: 65px; resize: vertical;"
													><%=memb.getAddress()%></textarea>
											</div>
											</div>
											<div class="col-sm-2">
											<button id="btnAddress" value="<%=id%>" class="btn btn-primary">Update Address</button>
											</div>
											</div>
											<br>
											

										</div>
									</div>

								</div>
							</div>

						</div>
					</div>




				</div>
			</div>
		</div>

		<div class="col-sm-0"></div>

	</div>
	
	<div email-exists-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Email ID you entered already exists.</h3>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div mobile-exists-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Mobile Number you entered already exists.</h3>
				</div>
  
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div update-success-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Your account has been updated!</h3>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div update-unsuccess-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Account cannot be updated.</h3>
					<h4>Please try again later.</h4>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div emailId-invalid-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Enter a valid Email-Id.</h3>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div mobileNo-invalid-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Enter a valid 10-digit Mobile Number.</h3>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div address-invalid-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Enter a valid Address.</h3>
					<h4>Address should be between 0-30 characters.</h4>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>



	
	<script src="src/js/jquery.min.js"></script>
	<script src="src/js/bootstrap.min.js"></script>

</body>
</html>
<%
	}
%>