<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookstore Administration</title>
    <link rel="stylesheet" href="../css/style.css" >
</head>
<body>
     <jsp:directive.include file="header.jsp"/>
     <div align="center">
         <h2 class="pageheading">Administative Dashboard</h2>
     </div>
     
     <div align="center">
         <hr width="60%"/>
         <h2 class="pageheading">Quick Actions</h2>
         <a href="new_book">New Book</a> &nbsp;
         <a href="user_form.jsp">New User</a> &nbsp;
         <a href="category_form.jsp">New Category</a> &nbsp;
         <a href="new_customer">New Customer</a> 
     </div>
     
     <div align="center">
     	<h2>Recent sales:</h2>
     </div>
     
     <div align="center">
     	<h2>Recent sales:</h2>
     </div>
     
     <div align="center">
     	<h2>Recent reviews:</h2>
     </div>
     
     <div align="center">
     	<h2>Statistics:</h2>
     </div>
     <jsp:directive.include file="footer.jsp"/>
</body>
</html>