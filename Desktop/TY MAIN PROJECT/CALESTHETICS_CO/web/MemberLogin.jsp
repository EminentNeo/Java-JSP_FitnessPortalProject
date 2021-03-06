<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html lang="en">
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Member Login</title>
    <link href="src/css/bootstrap.css" rel="stylesheet">
    <link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="src/css/Montserrat.css" rel="stylesheet">
    <link href="src/mycss/MemberLogin.css" rel="stylesheet">
    
    <script src="src/js/jquery.min.js"></script>
<script language="javascript">
	$(document).ready(function() {	
		
		

				$("#memberLogin").click(function(e) {
					e.preventDefault();
					emailId = $("#txtEmailId").val();
					password = $("#txtPassword").val();
					entity = "member";
					
					if(emailId.length==0)
					{
							$("[email-modal]").modal();
					}
					else if(password.length==0)
					{
						$("[password-modal]").modal();
					}
					else
					{
						$.ajax({
							type : "POST",
							url : "MemberLoginCheck.jsp",
							data : "username=" + emailId +  "&password=" + password,
							success : function(response) {
								eval(response);
							}
						}); 
					}
						
					

				});

		});
</script>

</head>

<body>

  <div class="navbar navbar-inverse navbar-top" id="navbarTop">
      <div class="container-fluid">

        <div class="navbar-header">
          <div class="navbar-brand">
             <p style="font-weight: 600"> ABSOLUTE FIT </p>
              <!-- <span class="h4" style="color:#1A5276">Project</span>
              <span class="h4" style="color:#C0392B ">MAD</span> -->
          </div>
          <button="button" class="navbar-toggle btn-md" data-toggle="collapse" data-target="#navbarHome">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
           <span class="icon-bar"></span> 
          </button>    
        </div>

        <div class="collapse navbar-collapse" id="navbarHome">
          <ul class="nav navbar-nav">
            <li> <img src="src/mycss/images/AJ1.png" alt="Project CAL Logo" title="Project CAL" width="35" height="35" style="margin-top:7px; "> </li> 
            <li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li class="active"><a href="Home.jsp" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;HOME</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">

                        <li style="font-weight: 500"><a href="aboutus.jsp">&nbsp;&nbsp;WORKOUTS</a></li>
			<li style="font-weight: 500"><a href="Registration.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;SIGN UP</a></li>
				<li class="dropdown"><a class="dropdown-toggle" type="button"data-toggle="dropdown"> <span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;SIGN IN&nbsp;
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li style="font-weight: 400"><a href="MemberLogin.jsp">MEMBER LOGIN</a></li>
							
				</ul>
				</li>
			</ul>
            
        </div>

      </div>
    </div>

     <div class="col-xs-0"></div>

    <div class="col-md-4 col-xs-10">
      <div id="loginPanel" class="panel panel-default">
        <br>
        <div class="panel panel-header">
          <h1><span class="glyphicon glyphicon-user"></span></h1>
        </div>
        <br>
		
        <div class="input-group" id="txtUser">
          <div class="input-group-addon">
            <button class="glyphicon glyphicon-envelope"></button>
          </div>
          <input type="text" required class="form-control" name="username"  id="txtEmailId" placeholder="Email-ID">
        </div> 
        <br>

        <div class="input-group" id="txtPass">
          <div class="input-group-addon">
            <button class="glyphicon glyphicon-eye-open"></button>
          </div>
          <input type="password" minlength="6" required class="form-control" name="password" id="txtPassword" placeholder="Password">
        </div>
        <br>

        <div>
          <button id="memberLogin" class="btn btn-primary btn-submit" id="btnMemberSubmit">Member Login</button> 
        </div><br>

        <a href="" data-toggle="modal" data-target="#forgot">Forgot Password?</a>
        <form action="forgotmail.jsp" method="post">
        <div class="modal fade" id="forgot">
              
        <div class="modal-dialog modal-md">
        <div class="modal-content">

           <div class="modal-header">
            <h3>Forgot Password?</h3>
           </div>
              
           <div class="modal-body">
            <h4>Password will be sent to your registered Email-ID.</h4>
            <br>
            <div class="input-group" name="txtEmail">
              <div class="input-group-addon">
                <span class="glyphicon glyphicon-envelope"></span>
              </div>
               
                <input type="email" name="txtEmail"  class="form-control" placeholder="Enter your Email-ID" required>
               
           </div>
           </div>

           <div class="modal-footer">
               <input type="submit" value="Send E-Mail" class="btn btn-primary"/>
          <!-- <a href=""  class="btn btn-primary">Send E-Mail</a> -->
            <a href="" class="btn btn-default" data-dismiss="modal">Close</a>
           </div>
           
        </div>
        </div>
                
        </div>
           </form>

        <br><br>


      </div>
    </div>

    <div class="col-xs-0"></div>
    
    <div email-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Please enter your Email-Id.</h3>
				</div>

				<div class="modal-footer">
					<a class="btn btn-primary" href="MemberLogin.jsp">OK</a>
				</div>
			</div>
		</div>
	</div>
      <div email-failed-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Please enter valid Email-Id to get your Password</h3>
				</div>

				<div class="modal-footer">
					<a class="btn btn-primary" href="MemberLogin.jsp">OK</a>
				</div>
			</div>
		</div>
	</div>
	
	<div password-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Please enter your Password.</h3>
				</div>

				<div class="modal-footer">
					<a class="btn btn-primary" href="MemberLogin.jsp">OK</a>
				</div>
			</div>
		</div>
	</div>
	
	
	<div login-failed-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Login Failed</h3>
				</div>
				
				<div class="modal-body">
					<h4>Email-ID and Password did not match with each other</h4>
				</div>

				<div class="modal-footer">
					<a class="btn btn-primary "href="MemberLogin.jsp">Try Again</a>
				</div>
			</div>
		</div>
	</div>
	
    <script src="src/js/jquery.min.js"></script>
    <script src="src/js/bootstrap.min.js"></script>
    <script src="src/js/Validations.js"></script>
   
</body>
</html>