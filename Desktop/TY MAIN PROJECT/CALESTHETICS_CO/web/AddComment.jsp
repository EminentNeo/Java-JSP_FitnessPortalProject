<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title> AddComment </title>
   </head>
   <body>
   <form method="post" action="AddCommentAction.jsp">
        <br><br>
        PostId : <input type="text" name="postId">
        <br><br>
        UserId : <input type="text" name="userId">
        <br><br>
        Description : <input type="text" name="description">
    <br><br>       <input type="submit" value="Submit">
   </form>
   </body>
</html>