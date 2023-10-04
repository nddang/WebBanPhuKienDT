<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>Danh Sach sp</title>
</head>
<div class="tieude">Chi tiết sản phẩm</div>

<div class="box_chitietsp">
	<div class="box_hinhanh">
		<img src="${product.imgurl}" data-zoom-image="#" width="250"
			height="250" />
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
					<strong>Số lượng:</strong> ${product.number}
				</p>
				<input type="submit" name="add_to_cart" value="Mua hàng"
					style="margin: 10px; width: 100px; height: 40px; background: #9F6; color: #000; font-size: 18px; border-radius: 8px;" />
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
	<div class="tieude">Sản phẩm liên quan</div>
	<c:if test="${sameproduct!=null}">
		<c:forEach var="sameP" items="${sameproduct}">
			<c:if test="${sameP.id!=product.id}">
				<ul>
					<li><a href="/detailproduct/${sameP.id}"> <img src="<c:out value="${sameP.imgurl}" />" width="150" height="150" />
						<p>Tên sp : <c:out value="${sameP.name}" /></p>
						<p style="color: red;">Giá : <c:out value="${sameP.price}" />$</p>
					</a></li>
				</ul>
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${sameproduct==nul}">
		<p style="padding: 30px;">Hiện chưa có thêm sản phẩm nào</p>
	</c:if>
</div>
<!-- Ket thuc box sp liên quan -->

<div class="clear"></div>
