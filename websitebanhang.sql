-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 15, 2026 lúc 7:42 AM
-- Phiên bản máy phục vụ: 15.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `websitebanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Điện thoại & Smartphone'),
(2, 'Laptop & Máy tính'),
(3, 'Máy tính bảng (Tablet)'),
(4, 'Máy ảnh & Ống kính'),
(5, 'Thiết bị âm thanh (Loa, Tai nghe)'),
(6, 'Đồng hồ thông minh'),
(7, 'Màn hình máy tính'),
(8, 'Bàn phím & Chuột'),
(9, 'Phụ kiện (Sạc, Cáp, Pin)'),
(10, 'Tủ lạnh'),
(11, 'Máy giặt'),
(12, 'Điều hòa & Máy lạnh'),
(13, 'Gia dụng nhà bếp'),
(14, 'Thiết bị thông minh (Smart Home)'),
(15, 'Linh kiện máy tính');


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`, `fullname`, `phone`, `address`) VALUES
(1, 2, 'Nguyễn Hoàng Nam', '0905123456', 'Hà Nội'),
(2, 3, 'Lê Thị Mai Chi', '0918223344', 'Đà Nẵng'),
(3, 4, 'Trần Minh Quân', '0987654321', 'TP HCM'),
(4, 5, 'Đặng Thu Thảo', '0355667788', 'Cần Thơ'),
(5, 6, 'Bùi Anh Tuấn', '0944112233', 'Huế'),
(6, 7, 'Ngô Thanh Vân', '0909001122', 'Hải Phòng'),
(7, 8, 'Phạm Gia Bảo', '0888334455', 'Nam Định'),
(8, 9, 'Trịnh Kim Ngân', '0922889900', 'Nghệ An'),
(9, 10, 'Đỗ Hữu Phước', '0777556677', 'Bình Dương'),
(10, 1, 'Quản trị viên', '0123456789', 'Hệ thống');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 1, 35000000.00),
(2, 2, 3, 1, 32000000.00),
(3, 3, 6, 1, 1200000.00),
(4, 4, 7, 1, 55000000.00),
(5, 5, 8, 1, 9500000.00),
(6, 7, 10, 1, 18000000.00),
(7, 8, 1, 1, 35000000.00),
(8, 9, 5, 1, 25000000.00),
(9, 10, 2, 1, 42000000.00),
(10, 2, 6, 2, 1200000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','confirmed','shipping','delivered','cancelled') DEFAULT 'pending',
  `total_amount` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `status`, `total_amount`) VALUES
(1, 1, '2025-03-10 00:00:00', 'delivered', 35000000.00),
(2, 2, '2025-03-15 00:00:00', 'delivered', 32000000.00),
(3, 3, '2025-04-01 00:00:00', 'shipping', 1200000.00),
(4, 4, '2025-04-09 00:00:00', 'pending', 55000000.00),
(5, 5, '2025-03-20 00:00:00', 'delivered', 9500000.00),
(6, 6, '2025-03-25 00:00:00', 'cancelled', 21000000.00),
(7, 7, '2025-03-05 00:00:00', 'delivered', 18000000.00),
(8, 8, '2025-03-12 00:00:00', 'delivered', 35000000.00),
(9, 9, '2025-03-28 00:00:00', 'delivered', 25000000.00),
(10, 1, '2026-04-10 00:00:00', 'pending', 42000000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `display_status` enum('show','hide') DEFAULT 'show'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `description`, `price`, `stock_quantity`, `image_url`, `display_status`) VALUES
(1, 1, 'Macbook Air M2', NULL, 25000000.00, 4, NULL, 'show'),
(2, 1, 'Dell XPS 13', NULL, 30000000.00, 12, NULL, 'show'),
(3, 2, 'iPhone 15 Pro Max', NULL, 28000000.00, 8, NULL, 'show'),
(4, 2, 'Xiaomi 15 Ultra', NULL, 20000000.00, 15, NULL, 'show'),
(5, 3, 'iPad Pro M5', NULL, 32000000.00, 3, NULL, 'show'),
(6, 4, 'AirPods Pro 3', NULL, 5000000.00, 20, NULL, 'show'),
(7, 5, 'Canon EOS R8', NULL, 58000000.00, 2, NULL, 'show'),
(8, 6, 'Loa Marshall Middleton', NULL, 8000000.00, 7, NULL, 'show'),
(9, 7, 'Apple Watch Ultra 2', NULL, 19000000.00, 11, NULL, 'show'),
(10, 8, 'Tủ lạnh Samsung Bespoke Multidoor ', NULL, 55000000.00, 4, NULL, 'show');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin_system', 'admin@web.com', 'hash_password_123', 'admin', '2026-04-10 08:03:54'),
(2, 'nam.hoang', 'nam.hoang@gmail.com', 'user_pass_1', 'customer', '2026-04-10 08:03:54'),
(3, 'chi.le', 'chi.le.dn@gmail.com', 'user_pass_2', 'customer', '2026-04-10 08:03:54'),
(4, 'quan.tran', 'quantm.sg@gmail.com', 'user_pass_3', 'customer', '2026-04-10 08:03:54'),
(5, 'thao.dang', 'thaotthu@gmail.com', 'user_pass_4', 'customer', '2026-04-10 08:03:54'),
(6, 'tuan.anh', 'anhtuan.bui@gmail.com', 'user_pass_5', 'customer', '2026-04-10 08:03:54'),
(7, 'van.ngo', 'vanthanh.ngo@gmail.com', 'user_pass_6', 'customer', '2026-04-10 08:03:54'),
(8, 'bao.pham', 'giabao.pham@gmail.com', 'user_pass_7', 'customer', '2026-04-10 08:03:54'),
(9, 'ngan.trinh', 'kimngan.trinh@gmail.com', 'user_pass_8', 'customer', '2026-04-10 08:03:54'),
(10, 'phuoc.do', 'phuoc.do.bd@gmail.com', 'user_pass_9', 'customer', '2026-04-10 08:03:54');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
