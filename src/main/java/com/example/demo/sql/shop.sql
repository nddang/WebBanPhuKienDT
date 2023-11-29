-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 29, 2023 lúc 07:46 AM
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
  `cus_id` bigint(20) DEFAULT NULL,
  `total_price` double NOT NULL,
  `shipment_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `created_at`, `payment_at`, `payment_status`, `shipment_place`, `cus_id`, `total_price`, `shipment_status`) VALUES
(33, '2023-11-23 07:40:26.000000', '2023-11-23 07:40:26.000000', 'Đã thanh toán', 'Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội', 9, 100000, 'Đã nhận'),
(34, '2023-11-29 10:33:15.000000', '2023-11-29 12:36:46.000000', 'Đã thanh toán', 'Phùng Koang - Nam Từ Niêm - Hà Nội', 9, 100000, 'Đã nhận'),
(35, '2023-11-29 10:37:53.000000', NULL, 'Chưa thanh toán', 'Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội', 9, 100000, 'Đang giao'),
(36, '2023-11-29 10:43:18.000000', NULL, 'Chưa thanh toán', 'Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội', 9, 100000, 'Chưa giao'),
(37, '2023-11-29 11:34:19.000000', NULL, 'Chưa thanh toán', 'Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội', 9, 100000, 'Chưa giao');

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
(1, 'Tai nghe'),
(2, 'Sạc'),
(3, 'Màn hình'),
(4, 'Pin'),
(5, 'Ốp lưng - Bao da');

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
(9, 'Bắc Ninh', 'dang', '1234', '0123456789', 'dang@gmail.com');

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
(43, 1, 1, 33),
(44, 1, 2, 34),
(45, 1, 2, 35),
(46, 1, 1, 36),
(47, 1, 7, 37);

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
(1, 'Samsung Galaxy S21'),
(2, 'Samsung Galaxy S22'),
(3, 'iPhone 7'),
(4, 'iPhone 8'),
(5, 'Samsung Galaxy A53'),
(6, 'Samsung Galaxy M53'),
(7, 'iPhone 11'),
(8, 'iPhone 12'),
(9, 'iPhone 13'),
(10, 'iPhone 14'),
(11, 'iPhone 15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `des` varchar(2000) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `phonename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `des`, `imgurl`, `name`, `number`, `price`, `category_id`, `phonename`) VALUES
(1, '<p>Tai nghe bluetooth Baseus Encok WM01 Plus c&oacute; độ ho&agrave;n thiện cao với những đường bo cong mềm mại tạo cảm gi&aacute;c cực kỳ dễ chịu khi sử dụng. Bạn sẽ kh&ocirc;ng c&ograve;n cảm gi&aacute;c kh&oacute; chịu khi đeo tai nghe trong thời gian d&agrave;i<br /> Trọng lượng 32.5g, dock sạc l&agrave; cổng cắm Type C c&ugrave;ng đ&egrave;n b&aacute;o, m&agrave;n h&igrave;nh th&ocirc;ng minh gi&uacute;p người d&ugrave;ng c&oacute; thể x&aacute;c định được liệu dock đ&atilde; được kết nối sạc hay chưa v&agrave; tuổi thọ pin tai nghe b&ecirc;n tr&aacute;i, phải, dung lượng pin c&ograve;n lại trong dock sạc<br /> M&agrave;ng loa hợp chất PU c&oacute; độ đ&agrave;n hồi cao, cho &acirc;m bass d&agrave;y v&agrave; treble tốt.. Bluetooth V5.0 Tai nghe Baseus Encok WM01 Plus c&oacute; thể sử dụng tới 5 tiếng đồng hồ với thời gian chờ l&ecirc;n đến 250h. Hộp sạc đi k&egrave;m c&oacute; dung lượng đến 300mAh gi&uacute;p người d&ugrave;ng c&oacute; thể dễ d&agrave;ng nạp pin lại đến 5 lần li&ecirc;n tục. Thời gian sạc chỉ 1.5h<br /> C&ocirc;ng nghệ Noise Cancelling giảm tiếng ổn chủ động v&agrave; t&iacute;ch hợp tất cả thiết bị v&agrave; hệ điều h&agrave;nh Siri, Google, &hellip;</p>', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/434ddea8-4790-4ba6-ae51-22e84d556a10.jpg?alt=media&token=434ddea8-4790-4ba6-ae51-22e84d556a10.jpg', 'Tai nghe bluetooth Baseus Encok WM01 Plus', 78, 100000, 1, 'iPhone 11,iPhone 12,iPhone 13,iPhone 14,iPhone 15,iPhone 7,iPhone 8,Samsung Galaxy A53,Samsung Galaxy M53,Samsung Galaxy S21,Samsung Galaxy S22,'),
(2, '<p>tai nghe 2</p>', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/73bb1a29-b8ff-4013-9629-1c56fbd52f13.png?alt=media&token=73bb1a29-b8ff-4013-9629-1c56fbd52f13.png', 'tai nghe 2', 78, 100000, 1, 'iPhone 11,iPhone 12,iPhone 13,iPhone 14,iPhone 15,iPhone 7,iPhone 8,Samsung Galaxy A53,Samsung Galaxy M53,Samsung Galaxy S21,Samsung Galaxy S22,'),
(3, '<p>sac 1</p>', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/affa0c29-aac6-4bc3-bb39-fdaca3787514.png?alt=media&token=affa0c29-aac6-4bc3-bb39-fdaca3787514.png', 'sac 1', 90, 100000, 2, 'iPhone 11,iPhone 12,iPhone 13,iPhone 14,iPhone 15,iPhone 7,iPhone 8,'),
(4, '<p>sac 2</p>', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/4ebbd65f-5168-43c6-a976-4ca0f34ebb76.png?alt=media&token=4ebbd65f-5168-43c6-a976-4ca0f34ebb76.png', 'sac 2', 100, 100000, 2, 'Samsung Galaxy A53,Samsung Galaxy M53,Samsung Galaxy S21,Samsung Galaxy S22,'),
(6, '<p>pin 1</p>', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/31ea2b10-3220-4e38-ae2d-45a4ba631361.png?alt=media&token=31ea2b10-3220-4e38-ae2d-45a4ba631361.png', 'pin 1', 0, 100000, 4, 'Samsung Galaxy S21,Samsung Galaxy S22,'),
(7, '', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/40c9a2e4-ce14-4c31-a04b-4d303e484080.png?alt=media&token=40c9a2e4-ce14-4c31-a04b-4d303e484080.png', 'tai nghe 3', 98, 100000, 1, 'iPhone 11,iPhone 12,iPhone 13,iPhone 14,iPhone 15,iPhone 7,iPhone 8,Samsung Galaxy A53,Samsung Galaxy M53,Samsung Galaxy S21,Samsung Galaxy S22,'),
(8, '<p>tai nghe 4</p>', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/abbefa60-07c3-42ea-a2ce-b537f13606fb.png?alt=media&token=abbefa60-07c3-42ea-a2ce-b537f13606fb.png', 'tai nghe 4', 29, 100000, 1, 'iPhone 11,iPhone 12,iPhone 13,iPhone 14,iPhone 15,iPhone 7,iPhone 8,Samsung Galaxy A53,Samsung Galaxy M53,Samsung Galaxy S21,Samsung Galaxy S22,'),
(9, '<p><span style=\"color: #202124; font-family: consolas, \'lucida console\', \'courier new\', monospace; font-size: 12px; white-space-collapse: preserve;\">PIN PISEN cho c&aacute;c d&ograve;ng m&aacute;y 5s/5se/6/6s/6plus/6splus/7/7plus/8/8plus/X/Xs/Xr/Xsmax/11/11Pro/11Promax</span></p>', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/bff1485c-b133-4da5-8079-27b548058049.jpg?alt=media&token=bff1485c-b133-4da5-8079-27b548058049.jpg', 'PIN PISEN cho các dòng máy iphone', 50, 600000, 4, 'iPhone 11,iPhone 7,iPhone 8,'),
(10, '<p>op lung iphone 15pro max</p>', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/3c679a8e-885b-4c7b-b36a-e22aaeeefc6d.jpg?alt=media&token=3c679a8e-885b-4c7b-b36a-e22aaeeefc6d.jpg', 'op lung iphone 15', 50, 20000, 5, 'iPhone 15,'),
(19, '<p>abc</p>', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/58e0c9bc-ad9c-4444-959c-9c33f810ea0a.jpg?alt=media&token=58e0c9bc-ad9c-4444-959c-9c33f810ea0a.jpg', 'Màn hình samsung a53', 20, 450000, 3, 'Samsung Galaxy A53,'),
(20, '', 'https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/aecf0c77-2609-456a-8b6e-2b8061d3b2e4.jpg?alt=media&token=aecf0c77-2609-456a-8b6e-2b8061d3b2e4.jpg', 'pin samsung s22', 20, 400000, 4, 'Samsung Galaxy S22,');

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
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `phone`
--
ALTER TABLE `phone`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

