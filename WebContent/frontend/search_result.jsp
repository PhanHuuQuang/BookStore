<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result for ${keyword} - ONLINE BOOKSTORE</title>
<link rel="stylesheet" href="css/style.css" >
</head>
<body>
	<jsp:directive.include file="header.jsp"/>
    <div align='center'>
    <c:if test="${fn:length(result) == 0}">
     <h2>No Results for "${keyword}"</h2>
    </c:if>
    <c:if test="${fn:length(result) > 0}">
         <div class="book-group">
         <center><h2>Results for keyword "${keyword}"</h2></center>
         <c:forEach items="${result}" var="book">
         <div>
         <div id="search-image" >
            <div >
             <a href="view_book?id=${book.bookId}">
               <img class="book-small"
               src="data:image/jpg;base64, ${book.base64Image}" />
              </a>
            </div>
         </div>
         <div  id="search-description">
            <div>
               <h2 style="margin-top: -10px; margin-bottom: 5px;"><a href="view_book?id=${book.bookId}">
                  <b>${book.title}</b>
               </a></h2>
            </div>
            <div><jsp:directive.include file="book_rating.jsp"/> <br/></div>
            <div  style="margin-top: 5px;"><i>Author: ${book.author}</i></div>
            <div><p><b>Description:</b> ${book.description}</p></div>
         </div>
         <div id="search-price">
            <h3>$${book.price}</h3>
            <h3><a href="add_to_cart?book_id=${book.bookId}"><input type="button" value="Add To Cart"/></a></h3>
         </div>
         </div>
         <hr width="80%" style="margin-top: 20px;"/>
       </c:forEach>
      </div>
    </c:if>
      </div>
    <jsp:directive.include file="footer.jsp"/>
</body>
</html>