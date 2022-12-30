 <%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core"  
%>
 <div class="book">
            <div>
             <a href="view_book?id=${book.bookId}">
               <img class="book-small" 
               src="data:image/jpg;base64, ${book.base64Image}" />
              </a>
            </div>
            <div>
               <a href="view_book?id=${book.bookId}">
                  <b>${book.title}</b>
               </a>
            </div>
            <div>
            	<c:forTokens items="${book.ratingStars}" delims="," var="star">
            		<c:if test="${star eq 'on' }">
            			<img src="images/rating_on.png"/>
            		</c:if>
            		<c:if test="${star eq 'off' }">
            			<img src="images/rating_off.png"/>
            		</c:if>
            		<c:if test="${star eq 'half' }">
            			<img src="images/rating_half.png"/>
            		</c:if>
            	</c:forTokens>
            </div>
            <div><i>by ${book.author}</i></div>
            <div><b>$${book.price}</b></div>
         </div>