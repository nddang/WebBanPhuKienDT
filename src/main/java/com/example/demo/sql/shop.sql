-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2023 lúc 05:27 AM
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
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `payment_at` datetime(6) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `shipment_place` varchar(255) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `created_at`, `payment_at`, `payment_status`, `shipment_place`, `cus_id`) VALUES
(22, '2023-10-17 20:52:07.000000', '2023-10-17 20:52:07.000000', 'Đã thanh toán', 'Thọ Khê-Đông Thọ-Yên Phong-Bắc Ninh', 8),
(23, '2023-10-17 20:54:16.000000', '2023-10-17 20:54:16.000000', 'Đã thanh toán', 'Thọ Khê-Đông Thọ-Yên Phong-Bắc Ninh', 8),
(24, '2023-10-17 20:57:40.000000', '2023-10-17 20:57:40.000000', 'Đã thanh toán', 'Thọ Khê-Đông Thọ-Yên Phong-Bắc Ninh', 8),
(25, '2023-10-17 21:00:35.000000', '2023-10-17 21:00:35.000000', 'Đã thanh toán', 'Thọ Khê-Đông Thọ-Yên Phong-Bắc Ninh', 8),
(26, '2023-10-17 21:14:07.000000', '2023-10-17 21:14:07.000000', 'Đã thanh toán', 'Phùng Koang - Nam Từ Niêm - Hà Nội', 8);

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
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `location`, `name`, `password`, `phone_number`, `email`) VALUES
(1, 'Bắc Ninh', 'dang', '14112001', '0123456789', 'n.d.dang1411@gmail.com'),
(8, 'Bắc Ninh', 'nguyen duc dang', '1234', '0123456789', 'dang@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) NOT NULL,
  `number_product` bigint(20) NOT NULL,
  `prd_id` bigint(20) NOT NULL,
  `bill_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_product`
--

INSERT INTO `order_product` (`id`, `number_product`, `prd_id`, `bill_id`) VALUES
(29, 1, 1, 22),
(30, 1, 1, 23),
(31, 1, 2, 23),
(32, 7, 1, 24),
(33, 6, 2, 24),
(34, 4, 3, 25),
(35, 1, 5, 26);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phone`
--

CREATE TABLE `phone` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `phone`
--

INSERT INTO `phone` (`id`, `name`) VALUES
(1, 'iPhone'),
(2, 'Samsung');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `des` varchar(1000) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `phone_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `des`, `imgurl`, `name`, `number`, `price`, `category_id`, `phone_id`) VALUES
(1, 'Tai nghe bluetooth Baseus Encok WM01 Plus có độ hoàn thiện cao với những đường bo cong mềm mại tạo cảm giác cực kỳ dễ chịu khi sử dụng. Bạn sẽ không còn cảm giác khó chịu khi đeo tai nghe trong thời gian dài<br>\r\nTrọng lượng 32.5g, dock sạc là cổng cắm Type C cùng đèn báo, màn hình thông minh giúp người dùng có thể xác định được liệu dock đã được kết nối sạc hay chưa và tuổi thọ pin tai nghe bên trái, phải, dung lượng pin còn lại trong dock sạc<br>\r\nMàng loa hợp chất PU có độ đàn hồi cao, cho âm bass dày và treble tốt.. Bluetooth V5.0\r\nTai nghe Baseus Encok WM01 Plus có thể sử dụng tới 5 tiếng đồng hồ với thời gian chờ lên đến 250h. Hộp sạc đi kèm có dung lượng đến 300mAh giúp người dùng có thể dễ dàng nạp pin lại đến 5 lần liên tục. Thời gian sạc chỉ 1.5h<br>\r\nCông nghệ Noise Cancelling giảm tiếng ổn chủ động và tích hợp tất cả thiết bị và hệ điều hành Siri, Google, …', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'Tai nghe bluetooth Baseus Encok WM01 Plus', 80, 100000, 1, 1),
(2, 'tai nghe 2', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'tai nghe 2', 80, 100000, 1, 2),
(3, 'sac 1', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'sac 1', 90, 100000, 2, 1),
(4, 'sac 2', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'sac 2', 100, 100000, 2, 2),
(5, NULL, 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'man hinh 1', 96, 100000, 3, 1),
(6, 'pin 1', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'pin 1', 0, 100000, 4, 2),
(7, NULL, 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'tai nghe 3', 99, 100000, 1, 1),
(8, 'tai nghe 4', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/imgs%2Fproduct.jpg?alt=media&token=2d2b080a-1444-4b1d-98b9-bb06608c3937&_gl=1*fc4de8*_ga*MTYwMDg2MTQ5NS4xNjk0NTMwMTEw*_ga_CW55HF8NVT*MTY5NjI1MjQ1NC4zLjEuMTY5NjI1MjQ4MS4zMy4wLjA.', 'tai nghe 4', 29, 100000, 1, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjfjpp7pouskq4cncmfs5c4x1e` (`cus_id`);

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
  ADD KEY `FKr3ybfixltnme92jfus189f6hh` (`prd_id`),
  ADD KEY `FK5e2mktvdhckvgvqerytj19m8j` (`bill_id`);

--
-- Chỉ mục cho bảng `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  ADD KEY `FKtnch9j7bixc6rosy9fdje8ymx` (`phone_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `phone`
--
ALTER TABLE `phone`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FKjfjpp7pouskq4cncmfs5c4x1e` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `FK5e2mktvdhckvgvqerytj19m8j` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `FKr3ybfixltnme92jfus189f6hh` FOREIGN KEY (`prd_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FKtnch9j7bixc6rosy9fdje8ymx` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
