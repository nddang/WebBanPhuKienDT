<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="box_list">
    <div class="tieude">
        <h3>Loại phụ kiện</h3>
    </div>
    <ul class="list">
        <c:forEach var="category" items="${listC}">
       		<li><a href="/category/${category.id}"><c:out value="${category.name}" /></a></li>
		</c:forEach>
   	</ul>
</div><!--Ket thuc div box loai phu kien -->

<div class="box_list">
    <div class="tieude">
        <h3>Hàng mới</h3>
    </div>
    
    <ul class="hangmoi">	
       	<c:forEach var="newproduct" items="${listNewP}">
       		<li>${newproduct}</li>
		</c:forEach>
    </ul>
</div><!--Ket thuc div box hang moi-->


