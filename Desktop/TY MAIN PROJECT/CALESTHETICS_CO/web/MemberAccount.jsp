
<%@page import="cal_java.*"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
	String name = (String) session.getAttribute("username");
	int ids = 101;
	if (name == null) {
		response.sendRedirect("MemberLogin.jsp");
	} else {
		String id = (String) session.getAttribute("id");
		String entity = (String) session.getAttribute("entity");
		
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Member Account</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">

<link href="src/mycss/MemberAccount.css" rel="stylesheet">

<script src="src/js/jquery.min.js"></script>
<script language="javascript">
	$(document).ready(function() {
		
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
		 
		 $('#allPosts').load("ShowAllPosts.jsp");
		
		 $("#postSubmit").click(function(e) {
				alert("Post Uploaded");	
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
  
    <body style="background-color: lightgrey;font-weight: 600">
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
	<br><br><br><br>


	<div class="col-lg-3">

		

		
		<br>
		
		<div id="events" align="center">
		<div class="well" align="center"><span class="h3">EVENTS</span></div>
			<% ArrayList<Event> list = EventWorker.getAllEvents();
				if(list.isEmpty())
				{
					%>
						<h3>No Events to Display !</h3>
					<%
				}
				else
				{
					%>
					<table class="table">
					<%
					for(Event event:list)
					{
					%>	
						<div class="well">
						<h4><%=event.getCaption()%></h4>
						<span class="h4"><%=event.getDate()%></span> (<%=event.getDays()%> Days)
						</div>
					<%
					}
					%>
					</table>
					<%
				}
			%>
			
			<a class="btn btn-primary" href="EventParticipation.jsp">Participate</a>
		</div>
	</div>

	<div class="col-lg-6">
		<div id="postUploadPanel"style:"height:200px; width:575px;"></div>

		<div class="panel panel-default">
			<form method="post" action="AddPostAction.jsp"
				enctype="multipart/form-data">
				<div class="panel panel-header">
					<div style="width: 100%">
						<textarea class="form-control" required placeholder="What's on your mind?"
							name="description" cols="1" rows="5"
							style="max-height: 100% max-width:100%; resize: vertical;"></textarea>
					</div>
				</div>
				
				<div class="panel panel-footer">
					<div class="row">
						<div class="col-xs-5 col-sm-4">
							<input type="file" accept="image/*" name="photo" required size="10px"
								style="display: inline-block width:200px;">
								<input type="hidden" name="userId" value="<%=id%>">
								<input type="hidden" name="userType" value="<%=entity%>">
						</div>
						<div class="col-xs-4 col-sm-4"></div>
						<div class="col-xs-2 col-sm-4">
						<button type="reset" class="btn btn-default">Reset</button>
						<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<button id="postSubmit" type="submit" class="btn btn-primary">Post</button>
						</div>
					</div>
				</div>
			</form>
		</div>

		
		<div id="allPosts">
		</div>		
		
		<br> <br>
	</div>

	<div class="col-lg-3">
		

		<div class="panel panel-default col-md-8"
			style="text-align: center;">
			<hr>
			<div class="well">
			<a href="ShowWorkoutPrograms.jsp" class="btn btn-primary">VIEW PROGRAMS</a>
			</div>
			
			<div class="well">
			<a href="AddCard.jsp" class="btn btn-primary">ADD CARD</a>
			</div>
			
			<div class="well">
			<a href="ShowAllCards.jsp" class="btn btn-primary">SHOW CARD</a>
			</div>
		
                        <div class="well">
				<a href="ShowNotifications.jsp" class="btn btn-primary">ANNOUCEMENTS</a>
			</div>

		</div>
			

	</div>
	<div post-success-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Your Post has been uploaded!</h3>
				</div>

				<div class="modal-footer">
					<a class="btn btn-primary "href="MemberAccount.jsp">OK</a>
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
    
