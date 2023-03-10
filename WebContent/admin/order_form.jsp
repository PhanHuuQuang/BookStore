<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <title>Edit Order - SUAH Bookstore Administration</title>
     <link rel="stylesheet" href="../css/style.css" >
     <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
     <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">Edit Order ID: ${order.orderId}</h2>
	</div>
	
	<c:if test="${message != null}">
	<div align="center">
	    <h4 class="message">${message}</h4>
	</div>
	</c:if>
    
    <form action="update_order" method="post" id="orderForm">
	<div align="center">
		 <h2>Recipient Information</h2>
		 <table>		 
		 	<tr>
		        <td><b>Ordered By: </b></td>
		        <td>${order.customer.fullname}</td>
		    </tr>
		    
		    <tr>
		        <td><b>Ordered Date: </b></td>
		        <td>${order.orderDate}</td>
		    </tr>
		    
		     <tr>
		        <td><b>Recipient Name: </b></td>
		        <td><input type="text" name="recipientName" value="${order.recipientName}" size="45"/></td>
		    </tr>
		    
		    <tr>
		        <td><b>Recipient Phone: </b></td>
		        <td><input type="text" name="recipientPhone" value="${order.recipientPhone}" size="45"/></td>
		    </tr>
		    
		    <tr>
		        <td><b>Ship to: </b></td>
		        <td><input type="text" name="shippingAddress" value="${order.shippingAddress}" size="45"/></td>
		    </tr>
		    
		    <tr>
		        <td><b>Payment Method: </b></td>
		        <td>
		            <select name="paymentMethod">
		               <option value="Cash On Delivery">Cash On Delivery</option>
		            </select>
		        </td>
		    </tr>
		    
		    <tr>
		        <td><b>Order Status: </b></td>
		        <td>
		           <select name="orderStatus">
		               <option value="Processing">Processing</option>
		               <option value="Shipping">Shipping</option>
		               <option value="Delivered">Delivered</option>
		               <option value="Completed">Completed</option>
		               <option value="Cancelled">Cancelled</option>
		           </select>
		        </td>
		    </tr>
		 
		</table>
	</div>
	<div align="center">
	   <h2>Ordered Books</h2>
	   <table border="1">
	       <tr>
	           <th>Index</th>
	           <th>Book Title</th>
	           <th>Author</th>
	           <th>Price</th>
	           <th>Quantity</th>
	           <th>Subtotal</th>
	           <th></th>
	       </tr>
	       <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
	       <tr>
	           <td>${status.index + 1}</td>
	           <td>${orderDetail.book.title}</td>
	           <td>${orderDetail.book.author}</td>
	           
	           <td>
	           <input type="hidden" name="price" value="${orderDetail.book.price}"/>
	           $${orderDetail.book.price}
	           </td>
	           <td>
	           		<input type="hidden" name="bookId" value="${orderDetail.book.bookId}" />
	           		<input type="text" name="quantity${status.index + 1}" value="${orderDetail.quantity}" size="5" />
	           </td>
	           <td>$${orderDetail.subtotal}</td>
	           <td><a href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a></td>
	       </tr>
	       </c:forEach>
	       <tr>
	           <td colspan="4" align="right">
	              <p><i>TOTAL:</i></p>
	           </td>
	           <td>
	           	  <p>${order.bookCopies}</p>
	           </td>
	           <td>
	           	  <p>$<fmt:formatNumber value="${order.total}"/></p>
	           </td>
	       </tr>
	   </table>
	</div>
	<div align="center">
	    <br/>
	    <a href="javascript:showAddBookPopup()"><b>Add Books</b></a>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="submit" value="Save" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="Cancel" onclick="javascript:window.location.href='list_order';"/>
	</div>
</form>
	<jsp:directive.include file="footer.jsp" />
	
	<script>
	     
	   function showAddBookPopup() {
		   var width = 600;
		   var height = 250;
		   var left = (screen.width - width) / 2;
		   var top = (screen.height - height) / 2;
		   
		   window.open('add_book_form', '_blank', 
				   'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
	   }
	   
	   $(document).ready(function(){
			$("#orderForm").validate({
				rules: {
					recipientName: "required",
					recipientPhone: "required",
					shippingAddress: "required",
					
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
			           quantity${status.index + 1}: {
			    	        required: true, number: true, min: 1
			    	   },
			       </c:forEach>
				},
				
				messages: {
					recipientName: "Please enter recipient name",
					recipientPhone: "Please enter recipient phone",
					shippingAddress: "Please enter shipping address",
					
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
			             quantity${status.index + 1}: {
			    	        required: "Please enter quantity",
			    	        number: "Quantity must be a number",
			    	        min: "Quantity must be greater than 0"
			    	   },
			        </c:forEach>
				}
			});
			
		});
	
	</script>
</body>
</html>