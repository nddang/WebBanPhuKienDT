<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="box_list">
	<div class="tieude">
	<div class="search_bar">
		<form action="/home/search?name" method="get">
			<input type="text" placeholder="Nhập tên sản phẩm.." name="name">
			<button type="submit">Search</button>
		</form>
	</div>
	</div>
    <div class="tieude">
        <h3>Loại phụ kiện</h3>
    </div>
    <ul class="list">
        <c:forEach var="category" items="${listC}">
       		<li><a href="/category/${category.id}"><c:out value="${category.name}" /></a></li>
		</c:forEach>
   	</ul>
</div><!--Ket thuc div box loai phu kien -->




