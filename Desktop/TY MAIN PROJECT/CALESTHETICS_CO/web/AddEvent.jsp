<%-- 
    Document   : AddEvent
    Created on : Feb 2, 2018, 8:38:07 AM
    Author     : Aniket J
--%>
<%
	String email = (String) session.getAttribute("admin");
	if (email == null) {
		response.sendRedirect("AdminLogin.jsp");
	} else {
		String id = (String) session.getAttribute("id");
			
%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Event</title>
        <link href="src/css/bootstrap.min.css" rel="stylesheet">
        <link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="src/mycss/MemberAccount.css" rel="stylesheet">
        <script src="src/js/jquery.min.js"></script>
        <script language="javascript">
           $(document).ready(function() {
		
		var AdminId = $("#AdminId").val();
                $("#btnPostUpload").click(function(e)	{
			 
			 if($(eventCaption).val().length==0 || $(eventDate).val().length==0 || $(eventDays).val()<=0)
				$("[event-invalid-modal]").modal();	 
			 
			 else
				{
				 var caption = $("#eventCaption").val();
				 var date = $("#eventDate").val();
				 var days = $("#eventDays").val();
				 
				 $.ajax({
		        		type : "POST",
		        		url : "AddEventAction.jsp",
		        		data : "AdminId=" + "101" + "&caption=" + caption + "&date=" + date + "&days=" + days,
		        		success : function(response) {
                                            eval(response);
		        		}
					 }) 
				}
			});
		
		/* myLoop();
		
		function myLoop (i) {  
			alert(i);  
			   setTimeout(function () {    
			  	   alert('hello');  
			   }, i*1000)
			}
		
		
		for(i=0;i<=3;i++)
			{
			
				myLoop(i);
				
			}
		 */
		 
		 
		 $("#myTab a").click(function(e){
		    	e.preventDefault();
		    	$(this).tab('show');
		    });
		 
		 $('#allPosts').load("ShowAlPosts.jsp");
		 
		 $("#logout").click(function(e)	{
			 $.ajax({
         		type : "POST",
         		url : "Logout.jsp",
         		success : function(response) {
         		eval(response);
         		}
			 })
			 
			});
		
		 $("#postSubmit").click(function(e) {
				alert("Post Uploded");	
			});
	

		
		
				$("label[post-lblComment]").css({
					"background-color" : "#fff",
					"font-size" : "14px",
					"padding" : "3px"
				})
				
				 $("#search").on('keyup click',function(e) {
    				e.preventDefault();
    				var search = $(this).val();
    				var key = e.which || e.keycode;
    				if(search=="" || key==32)
        			{
        				$("#result").text(" ");
        			}
        			else
        			{
        			$.ajax({
                		type : "POST",
                		url : "SearchResults.jsp",
                		data : "search=" + search,
                		success : function(response) {
                		$("#result").html(response);
                }
            });
        	} 
    });
				
				$("#here").click(function(e) {
					e.preventDefault();
					userId = $("#userId").val();
					postId = $(this).val();
					$.ajax({
							type : "POST",
							url : "PostLikeChecker.jsp",
							data : "userId=" + userId + "&postId="+ postId,
							success : function(response) {
								$("button[post-like-btn='"+ postId + "']").html(response);
								alert(response);
							}
						});

							$.ajax({
									type : "POST",
									url : "ShareChecker.jsp",
									data : "postId=" + postId + "&userId="+ userId,
									success : function(response) {
										$("button[post-share-btn='"+ postId + "']").html(response);
										alert(response);
										}
									});
						});

				$("button[post-like]").click(function(e) {
							e.preventDefault();
							postId = $(this).val();
							userId = $("#userId").val();
							$.ajax({
									type : "POST",
									url : "PostLiker.jsp",
									data : "postId=" + postId + "&userId="+ userId,
									success : function(response) {
									$("[post-like-btn='" + postId + "']").html(response);
										}
									});
						});
				

				/* $('#btnss').click(function(e){
					e.preventDefault();
					
					$.ajax({
					       type : "POST",
				                url : "ShowAllMembers.jsp",
				                
				                success : function(response) {
				                	$("#content").html(response);
				                	
				                }
				            });
				}); */

				$("button[post-comment]").click(function(e) {
							e.preventDefault();
							postId = $(this).val();
							userId = $("#userId").val();
							comment = $("textarea[post-comment='" + postId + "']").val();
							if (comment.length == 0) {
							} else {
								$.ajax({
									type : "POST",
									url : "AddCommentAction.jsp",
									data : +"postId=" + postId + "&userId="+ userId + "&desc=" + comment,
									success : function(response) {
										$("label[post-lblComment='"+ postId + "']").fadeOut();
										$("label[post-lblComment='"+ postId + "']").html(response);
									}
								});

								$("textarea[post-comment='" + postId + "']").val('');
								$("label[post-lblComment='" + postId + "']").fadeIn(1000);
							}

						});

				$("label[post-lblComment]").fadeOut();

				$("button[post-share]").click(function(e) {
					e.preventDefault();
					postId = $(this).val();
					userId = $("#userId").val();
					$.ajax({
						type : "POST",
						url : "ShareModalChecker.jsp",
						data : "postId=" + postId + "&userId=" + userId,
						success : function(response) {
							eval(response);
						}
					});

				});

				$("button[post-shared-yes]").click(
						function(e) {
							e.preventDefault();
							postId = $(this).val();
							userId = $("#userId").val();
							$.ajax({
									type : "POST",
									url : "AddShareAction.jsp",
									data : "postId=" + postId + "&userId="+ userId,
									success : function(response) {
									$("button[post-share='"+ postId + "']").html(response);
									}
								});
						});
			});
				
		
       </script>
            
    </head>
    <body style="font-weight: 700;background-color: lightblue">
        <br>
    <div class="navbar navbar-fixed-top navbar-inverse" id="navbarTop">
		<div class="navbar-header">
			<div class="navbar-brand"> ABSOLUTE FIT</div>
			<button ="button" class="navbar-toggle btn-md" data-toggle="collapse"
				data-target="#navbarAccount">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="collapse navbar-collapse" id="navbarAccount">

			<ul class="nav navbar-nav navbar-left">
				<li><img src="src/mycss/images/AJ1.png" alt="Project CAL Logo" title="Project CAL" width="35" height="35" style="margin-top:7px; "></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><a href="AdminAccount.jsp"><span
						class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Home</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
			
				<li class="dropdown"><a class="dropdown-toggle" type="button"
					data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>&nbsp; ADMIN
						<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="">View Profile</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Account Settings</li>
						<li><a href="MgmtAccountUpdate.jsp"><span    
								class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;Update
								Account</a></li>
						<li><a href="PostUpdate.jsp"><span
								class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;Update
								Post</a></li>		
						<li id="logout"><a href=""><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Logout</a></li>
					</ul>
				</li>
			</ul>

		</div>
	</div>
        <div class="col-lg-3" style="margin-top: 60px">

		<div class="input-group">
			
			<input type="text" placeholder="Search" class="form-control" id="search">
			<div class="input-group-addon">
				<span class="glyphicon glyphicon-search"></span>
			</div>
		</div>

		<div id="result"></div>


	</div>
       
	<br><br><br><br>
       <div class="col-lg-12" style="width:60%;padding-left: 120px">
		<div id="postUploadPanel"></div>

		<div class="UploadTabs">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a href="#eventUpload">Event Upload</a></li>
			</ul>
                                <div id="eventUpload" class="tab-pane active">
				<br><br>
					<div class="panel panel-default">
						
						<div class="panel panel-body">

							<input type="text" class="form-control" placeholder="Caption" 
								name="caption" id="eventCaption">
							<hr>
							
							<div class="row">
							<div class="col-md-8">
							<input type="text" class="form-control" name="date" value=""
								placeholder="Date" onblur="(this.type='text')"
								onfocus="(this.type='date')" id="eventDate">
							</div>	
							<div class="col-md-4">
							<input type="number" min="1" placeholder="Days" name="num"
								 id="eventDays" class="form-control">
							</div>
							</div>	

						</div>
						<div class="panel panel-footer" align="center">
							<button class="btn btn-primary" id="btnPostUpload">Upload</button>
                                                       
                                                </div>
					</div>


				</div>
			
									
							
									
								
				</div>
				
			</div>
		</div>

	

	
	
	<div event-invalid-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Event details are incorrect.</h3>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div event-success class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Event uploaded successfully.</h3>
				</div>

				<div class="modal-footer">
					<a href="AdminAccount.jsp" class="btn btn-default">OK</a>
				</div>
			</div>
		</div>
	</div>
	
	<div event-unsuccess class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Event could not be uploaded</h3>
					<h4>Please try again later</h4>
				</div>

				<div class="modal-footer">
					<a href="AddEvent.jsp" class="btn btn-default">OK</a>
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