<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align='center' style="margin-top: 20px;"> 
	

	<div class="header" id="myHeader">
	   <form action="search" method="get" >
	   	<div class="content">
	   		<a href="/BookStoreWebsite/" style="margin-right: -20px; font-size: 20px; font-weight: bold;">
	   		<img src="./images/home1.png" width="25" height="25"/> Home</a>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <c:if test="${loggedCustomer == null}">
			     <a href="login" style="margin-right: 20px; font-size: 20px; font-weight: bold;">
			     <img src="./images/user1.png" width="25" height="25"/>Sign In</a> 
			     <a href="register" style="margin-right: 20px;font-size: 20px; font-weight: bold;">
			     <img src="./images/key22.png" width="25" height="25"/>Register</a> 
			 </c:if>
			 <a href="view_cart" style="margin-right: 20px; font-size: 20px; font-weight: bold;">
			 <img src="./images/cart.png" width="25" height="25"/> Cart</a>
			 <c:if test="${loggedCustomer != null}">
			      
			     <a href="view_orders" style="margin-right: 20px; font-size: 20px; font-weight: bold;">
			     <img src="./images/order1.png" width="25" height="25"/> My Orders</a>
			     <a href="view_profile" style="margin-right: 20px; font-size: 20px; font-weight: bold;">
			     <img src="./images/user1.png" width="25" height="25"/> ${loggedCustomer.fullname}</a> 
			     <a href="logout" style="margin-right: 20px; font-size: 20px; font-weight: bold;"><input type="button" value="Logout" /></a>
			 </c:if>
			 
			</div>
	   </form>
	   <hr width="100%" style="margin-top: 20px;"/>
	</div>
	<div>&nbsp;</div>
	<div>
		<form action="search" method="get" >
			<b style="font-size: 20px; margin-right: 15px;">Categories:</b>
		    <c:forEach var="category" items="${listCategory}" varStatus="status">
		        <a href="view_category?id=${category.categoryId}">
		            <font size="+1"><b><c:out value="${category.name}"/></b></font>
		        </a>
		        <c:if test="${not status.last}">
		        &nbsp; | &nbsp;
		        </c:if>
		     </c:forEach>
		     	<input type="text" name="keyword" size="20" style="margin-left: 60px;" placeholder="Enter comic name..."/> 
			    <input type="submit" value="Search"/>
		  </form> 
	     <hr width="60%" style="margin-top: 20px;"/>
	</div>
</div>