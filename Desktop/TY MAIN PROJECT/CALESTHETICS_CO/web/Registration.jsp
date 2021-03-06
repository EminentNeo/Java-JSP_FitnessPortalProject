<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
<link href="src/css/bootstrap.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">

<link href="src/mycss/Registration.css" rel="stylesheet">
</head>
<body background-color="lightgray">
	<div class="navbar navbar-inverse navbar-top" id="navbarTop">
      <div class="container-fluid">

        <div class="navbar-header">
          <div class="navbar-brand">
             <p style="font-weight: 700"> ABSOLUTE FIT </p>
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

	<div class="col-xs-0 col-sm-0 col-md-0 col-lg-4"></div>
	<div class="col-xs-0 col-sm-3 col-md-3 col-lg-4"></div>

	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
		<div id="regPanel" class="panel panel-default">
			<br>
			<div class="panel panel-header">
				<h3>Register in just few seconds!</h3>
			</div>

			<div class="panel panel-body">

				<form autocomplete="off" method="post" action="AddMemberAction.jsp">

					<div class="input-group" id="txtName">
						<div class="input-group-addon">
							<button no-click class="glyphicon glyphicon-user"></button>
						</div>
						<input type="text" required data-accept="name" class="form-control" name="name"
							placeholder="Name">
					</div>
					<label data-msg="name"></label>
					<br>
					
					
					<div class="input-group" id="txtMobile">
						<div class="input-group-addon">
							<button no-click class="glyphicon glyphicon-phone"></button>
						</div>
						<input type="text" required data-accept="mobile" class="form-control" name="mobileNo"
							placeholder="Mobile No">
					</div>
					<label data-msg="mobile"></label>
					<br>

					<div class="input-group" id="txtEmail">
						<div class="input-group-addon">
							<button no-click class="glyphicon glyphicon-envelope"></button>
						</div>
						<input type="text" required data-accept="email" class="form-control" name="emailId"
							placeholder="Email-ID">
					</div>
					<label data-msg="email"></label>
					<br>

					<div class="input-group" id="txtPassword">
						<div class="input-group-addon">
							<button no-click class="glyphicon glyphicon-eye-open"></button>
						</div>
						<input type="password" required data-accept="password" class="form-control" name="password"
							placeholder="Password">
					</div>
					<label data-msg="password"></label>
					<br>

					<div class="input-group" id="txtCnfPassword">
						<div class="input-group-addon">
							<button no-click class="glyphicon glyphicon-eye-open"></button>
						</div>
						<input type="password" required data-accept="cnfPassword" class="form-control" name="cnfPassword"
							placeholder="Confirm Password">
					</div>
					<label data-msg="cnfPassword"></label>
					<br>
					
					<div class="input-group" id="dob">
						<div class="input-group-addon">
							<button no-click class="glyphicon glyphicon-calendar"></button>
						</div>
						<input type="text" required data-accept="dob" class="form-control" name="dob"
							placeholder="Date of Birth" onblur="(this.type='text')" onfocus="(this.type='date')" min ="1920-01-01" max="2002-03-31">
					</div>
					<label data-msg="dob"></label>
					<br>
					
					<div class="input-group" id="chkGender">
						<div class="input-group-addon">
							<button no-click class="glyphicon glyphicon-user"></button>
						</div>
						<select required class="form-control" name="gender" id="gender">
							<option value="">Gender</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
						</select>
					</div>
					<label data-msg="gender"></label>
					<br>
					
					<div>
						<button type="submit" class="btn btn-primary"style="font-weight: 700">Submit</button>
					</div>
				</form>

				<br> <a href="MemberLogin.jsp" style="font-weight: 700">Already have an account?</a>
			</div>

		</div>
	</div>


	<script src="src/js/jquery.min.js"></script>
	<script src="src/js/bootstrap.min.js"></script>
	<script src="src/js/Validations.js"></script>
</body>
</html>