<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="tieude">Chi tiết sản phẩm</div>

<div class="box_chitietsp">
	<div class="box_hinhanh">
		<img src="${product.imgurl}"  width="200" height="200" />
	</div>

	<div class="box_info">
		<form action="/cart/add/${product.id}" method="post">
			<p>
				<strong>Tên sản phẫm: </strong><em style="color: red">
					${product.name}</em>
			</p>
			<p>
				<strong>Giá bán:</strong><span style="color: red;">${product.price}
					$</span>
			</p>
			<c:if test="${product.number>0}">
				<p style="color: blue;">
					<strong> Tình trạng:</strong> Còn hàng
				</p>
				<p>
					<strong>Số lượng còn trong kho:</strong> ${product.number}
				</p>
				<input class="button_mua" type="submit" name="add_to_cart" value="Mua hàng" />
			</c:if>
			<c:if test="${product.number<=0}">
				<p style="color: red;">
					<strong> Tình trạng:</strong> Hết hàng
				</p>
			</c:if>
		</form>
	</div>
	<!-- Ket thuc box box_info -->

</div>
<!-- Ket thuc box chitiet sp -->

<div class="tabs_panel">
	<ul class="tabs">
		<li rel="panel1" class="active">Thông tin sản phẩm</li>
	</ul>

	<div id="panel1" class="panel active">
		<c:if test="${product.des!=null}">
			<p>${product.des}</p>
		</c:if>
		<c:if test="${!(product.des!=null)}">
			<p style="padding: 30px;">Hiện chưa có thông tin chính thức</p>
		</c:if>
	</div>
</div>

<div class="sanphamlienquan">
	<div class="tieude">Sản phẩm tương tự</div>
	<c:if test="${sameproduct!=null}">
		<ul>
			<c:forEach var="sameP" items="${sameproduct}">
				<c:if test="${sameP.id!=product.id}">
					<li><a href="/detailproduct/${sameP.id}"> <img src="<c:out value="${sameP.imgurl}" />" width="150" height="150" />
						<p> <c:out value="${sameP.name}" /></p>
						<p style="color: red;">Giá : <c:out value="${sameP.price}" />$</p>
					</a></li>
				</c:if>
			</c:forEach>
					<li><a href="/category/${product.category.id}"> <img src="/resources/imgs/bacham.jpg" width="150" height="150" />
						<p>Xem thêm</p>
					</a></li>
		</ul>
	</c:if>
</div>
	<c:if test="${sameproduct==null}">
		<p style="padding: 30px;">Hiện chưa có thêm sản phẩm nào</>
	</c:if>
<!-- Ket thuc box sp liên quan -->

<div class="clear"></div>
