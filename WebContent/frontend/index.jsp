<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONLINE BOOKSTORE</title>
<link rel="stylesheet" href="./css/style.css" > 
</head>
<body>
	<jsp:directive.include file="header.jsp"/>
    <div align='center'>
         <div >
         <h2>New Books</h2>
         <c:forEach items="${listNewBooks}" var="book">
          <jsp:directive.include file="book_group.jsp" />
       </c:forEach>
       <hr width="60%"/>
    </div>
      <div align="next-row">
        <h2>Best-Selling Books</h2>
         <c:forEach items="${listBestSellingBooks}" var="book">
             <jsp:directive.include file="book_group.jsp" />
       </c:forEach>
       <hr width="60%"/>
      </div>
      <div align="next-row">
        <h2>Most-favored Books</h2>
        <c:forEach items="${listFavoredBooks}" var="book">
          <jsp:directive.include file="book_group.jsp" />
       </c:forEach>
       <hr width="100%"/>
      </div>
    </div>
    <jsp:directive.include file="footer.jsp"/>
</body>
</html>