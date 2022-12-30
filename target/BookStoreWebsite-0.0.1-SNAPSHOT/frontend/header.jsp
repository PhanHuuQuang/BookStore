<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align='center'> 
	

	<div>
	   <form action="search" method="get">
		    <input type="text" name="keyword" size="50" /> 
		    <input type="submit"value="Search" /> 
	
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <c:if test="${loggedCustomer == null}">
			     <a href="login" style="margin-right: 20px;">Sign In</a> 
			     <a href="register" style="margin-right: 20px;">Register</a> 
			 </c:if>
			 <a href="view_cart" style="margin-right: 20px;">Cart</a>
			 <c:if test="${loggedCustomer != null}">
			     <a href="view_profile" style="margin-right: 20px;">Welcome, ${loggedCustomer.fullname}</a> 
			     <a href="view_orders" style="margin-right: 20px;">My Orders</a> 
			     <a href="logout" style="margin-right: 20px;">Logout</a> 
			 </c:if>
			
	   </form>
	</div>
	<div>&nbsp;</div>
	<div>
	     <c:forEach var="category" items="${listCategory}" varStatus="status">
	        <a href="view_category?id=${category.categoryId}">
	            <font size="+1"><b><c:out value="${category.name}"/></b></font>
	        </a>
	        <c:if test="${not status.last}">
	        &nbsp; | &nbsp;
	        </c:if>
	     </c:forEach>
	</div>
</div>