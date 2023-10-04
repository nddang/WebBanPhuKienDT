-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 02, 2023 lúc 05:01 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `cus_id` bigint(20) NOT NULL,
  `payment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'tai nghe'),
(2, 'sac'),
(3, 'man hinh'),
(4, 'pin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `location`, `name`, `password`, `phone_number`, `username`) VALUES
(1, 'Bắc Ninh', 'dang', '14112001', '0123456789', 'dang1411');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) NOT NULL,
  `number_product` bigint(20) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `prd_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `des` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `des`, `imgurl`, `name`, `number`, `price`, `category_id`) VALUES
(1, 'tai nghe 1', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'tai nghe 1', 100, 100, 1),
(2, 'tai nghe 2', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'tai nghe 2', 100, 100, 1),
(3, 'sac 1', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'sac 1', 100, 100, 2),
(4, 'sac 2', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'sac 2', 100, 100, 2),
(5, NULL, 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'man hinh 1', 100, 100, 3),
(6, 'pin 1', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'pin 1', 0, 100, 4),
(7, NULL, 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'tai nghe 3', 100, 100, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmnna9itmhlgs92eaae3t4dsqy` (`cus_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpjqcdsnd61ax28qrm9v9wjkep` (`cart_id`),
  ADD KEY `FKr3ybfixltnme92jfus189f6hh` (`prd_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FKmnna9itmhlgs92eaae3t4dsqy` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `FKpjqcdsnd61ax28qrm9v9wjkep` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FKr3ybfixltnme92jfus189f6hh` FOREIGN KEY (`prd_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
