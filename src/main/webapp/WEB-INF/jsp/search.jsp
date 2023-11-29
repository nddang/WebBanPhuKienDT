<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="tieude">Sản phẩm</div>
<p style="padding: 30px;">
	Tìm kiếm: ${name}</>
	<c:forEach var="product" items="${listP}">

		<ul class="product">
			<li><a href="/detailproduct/${product.id}"> <img
					src="<c:out value="${product.imgurl}" />" width="150" height="150" />
					<p style="color: black">
						<c:out value="${product.name}" />
					</p>
					<p>
						<c:out value="${product.price}" />
						VND
					</p>
			</a></li>
		</ul>
	</c:forEach>
<div class="clear"></div>
<div class="pagination">
	<a href="/home/searchpage?name=${name}&page=1"> << </a>
	<c:if test="${pagenumber>1}">
		<a href="/home/searchpage?name=${name}&page=${pagenumber-1}"> < </a>
	</c:if>
	<c:if test="${pagenumber-1<1}">
		<a href="/home/searchpage?name=${name}&page=1"> < </a>
	</c:if>
	<a>${pagenumber}</a>
	<c:if test="${pagenumber+1>lastpage}">
		<a href="/home/searchpage?name=${name}&page=${lastpage}"> > </a>
	</c:if>
	<c:if test="${pagenumber<lastpage}">
		<a href="/home/searchpage?name=${name}&page=${pagenumber+1}"> > </a>
	</c:if>
	<a href="/home/searchpage?name=${name}&page=${lastpage}"> >> </a>
</div>