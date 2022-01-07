-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 01, 2021 lúc 09:14 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `pos`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `qty` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`cartid`, `userid`, `productid`, `qty`) VALUES
(13, 1, 1, 12),
(14, 1, 19, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`categoryid`, `category_name`) VALUES
(1, 'SAMSUNG'),
(2, 'Vsmart'),
(3, 'OPPO');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `userid` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contact` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`userid`, `customer_name`, `address`, `contact`) VALUES
(2, 'Pham Dang Hoa', 'HCM CITY', '0707116820');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory`
--

CREATE TABLE `inventory` (
  `inventoryid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `inventory_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `inventory`
--

INSERT INTO `inventory` (`inventoryid`, `userid`, `action`, `productid`, `quantity`, `inventory_date`) VALUES
(1, 2, 'Purchase', 4, 10, '2021-05-17 09:32:01'),
(2, 2, 'Purchase', 20, 10, '2021-04-17 09:32:01'),
(3, 2, 'Purchase', 1, 99, '2021-04-17 09:32:01'),
(4, 2, 'Purchase', 2, 20, '2021-05-17 09:32:01'),
(5, 2, 'Purchase', 2, 10, '2021-03-17 09:32:01'),
(6, 2, 'Purchase', 2, 10, '2021-05-17 09:32:01'),
(7, 2, 'Purchase', 3, 12, '2021-05-17 09:32:01'),
(8, 2, 'Purchase', 4, 8, '2021-05-17 09:32:01'),
(9, 1, 'Add Product', 27, 10, '2021-05-17 09:32:01'),
(10, 1, 'Update quantity', 27, 20, '2021-05-22 08:37:34'),
(11, 1, 'Add Product', 0, 1232131, '2021-05-22 08:37:34'),
(12, 1, 'Add Product', 0, 1232131, '2021-05-22 08:39:50'),
(13, 1, 'Add Product', 0, 1232131, '2021-05-22 08:49:17'),
(14, 1, 'Add Product', 28, 1232131, '2021-05-22 08:52:38'),
(15, 1, 'Add Product', 29, 0, '2021-05-22 08:54:16'),
(16, 1, 'Add Product', 30, 1232131, '2021-05-22 08:58:25'),
(17, 1, 'Add Product', 31, 1232131, '2021-05-22 09:01:16'),
(18, 1, 'Update Quantity', 31, 123, '2021-05-22 09:09:45'),
(19, 1, 'Update Quantity', 15, 2000, '2021-05-22 09:17:44'),
(20, 1, 'Update Quantity', 15, 2000, '2021-05-22 09:18:17'),
(21, 1, 'Update Quantity', 31, 12312, '2021-05-22 09:18:28'),
(22, 1, 'Update Quantity', 31, 12312, '2021-05-22 09:20:30'),
(23, 1, 'Update Quantity', 31, 12312, '2021-05-22 09:21:19'),
(24, 1, 'Update Quantity', 31, 123, '2021-05-22 09:28:04'),
(25, 1, 'Update Quantity', 15, 9000, '2021-05-22 09:28:38'),
(26, 1, 'Add Product', 32, 123, '2021-05-27 21:52:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `productid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `product_price` double NOT NULL,
  `product_qty` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`productid`, `categoryid`, `product_name`, `product_price`, `product_qty`, `photo`, `supplierid`, `details`) VALUES
(1, 1, 'Samsung Galaxy S21 Plus 5G', 899, 891, 'upload/1.jpg', 4, 'The dimension of the smartphone is 161.5 x 75.6 x 7.8 mm and it weighs 200 grams. The smartphone is pack with 8 GB RAM with 128 GB and 256 GB internal storage options. It is powered by Exynos 2100 and Qualcomm SM8350 Snapdragon 888 processor.'),
(2, 1, 'Samsung Galaxy A72', 799, 948, 'upload/2.jpg', 4, 'The device comes with a big screen of a 6.7 inches Super AMOLED capacitive touchscreen with 1080 x 2400 pixels resolution. The smartphone feature a Penta-camera that includes 64 MP (wide) + 8 MP (telephoto) + 12 (ultrawide) + 5 MP (macro) sensor on the rear side.'),
(3, 1, 'Samsung Galaxy A52', 599, 977, 'upload/3.jpg', 4, 'The dimension of the smartphone is 159.9 x 75.1 x 8.4 mm and it weighs 189 grams. The smartphone is pack with 6 GB and 8 GB RAM with a 128 GB and 256 GB internal storage option. The device runs on the Android 11, One UI 3.1 operating system.'),
(4, 1, 'Samsung Galaxy S20 FE', 399, 982, 'upload/4.jpg', 4, 'The smartphone is powered by the Qualcomm SM8250 Snapdragon 865 Octa-core processor with Adreno 650 MP11 GPU. The device comes with a big display screen of 6.5 inches that consists of a Super AMOLED capacitive touchscreen that provides a resolution of 1080 x 2400 pixels.'),
(5, 1, 'Samsung Galaxy A32', 879, 900, 'upload/5.jpg', 4, 'The smartphone is pack with 4 GB, 6 GB, and 8 GB RAM with 64 GB and 128 GB of internal storage. The device comes with a big screen of a 6.5 inches IPS LCD capacitive touchscreen with 720 x 1600 pixels resolution.'),
(6, 1, 'Samsung Galaxy S21 Ultra 5G', 449.99, 1000, 'upload/6.jpg', 4, 'The smartphone is pack with 12 GB and 16 GB RAM with 128 GB, 256 GB, 512 GB internal storage options. The device is built with a Glass front (Gorilla Glass Victus), a glass back (Gorilla Glass), and an aluminum frame.'),
(7, 1, 'Samsung Galaxy A11', 456, 123, 'upload/7.jpg', 4, 'The smartphone comes in various colors such as Black, Red, Blue, and White. The screen is a TFT  capacitive touchscreen, which has a size of 6.14 inches. The resolution of the display is 720 x 1560 pixels and provides 268 PPI density.'),
(8, 2, 'Vsmart Joy 4 ', 549.99, 1000, 'upload/8.jpg', 3, 'Vsmart Joy 4 (4GB|64GB)  has a luxurious design, 6.53-inch screen  , 4 rear cameras,  8- core Snapdragon 665 chip  , huge battery capacity of  5000 mAh .'),
(9, 2, 'Vsmart Live 4', 599.99, 1000, 'upload/9.jpg', 3, 'Vsmart Live 4 (6GB | 64GB) has a luxurious design, 6.5-inch screen  , 4 rear cameras, 8- core Snapdragon 675 chip , huge battery capacity of  5000 mAh .'),
(10, 2, 'Vsmart Star 5', 599.99, 1000, 'upload/10.jpg', 3, 'Vsmart Star 5  has a large 6.52-inch screen , sharp HD + resolution, a cluster of  three  rear cameras and a  high 5000 mAh battery , suitable for users who like wide-screen smartphones, good batteries.'),
(11, 2, 'Vsmart Star 4', 489.98, 1000, 'upload/11.jpg', 3, 'Vsmart Star 5  owns a 6.52-inch wide screen  , sharp HD + resolution, a cluster of three rear cameras and a   high 5000 mAh battery , suitable for users who like wide-screen smartphones, good batteries.'),
(12, 2, 'Vsmart Joy 3', 749.99, 1000, 'upload/12.jpg', 3, 'Vsmart Joy 3 genuine Vsmart phones with cheap price, meet all user experiences well, (Viet Mobile is committed to selling genuine goods, RECOMMENDED money if fake goods are detected).'),
(13, 2, 'Vsmart Active 3', 799.99, 1000, 'upload/13.jpg', 3, 'Active 3 Vsmart property looks classy, widescreen  6:39 inches , chipsets  MediaTek Helio P60 blunt g 6GB RAM strong, satisfy all user experience. The device is suitable for people who like to play games and surf the web.'),
(14, 2, 'Vsmart Aris Pro', 899.99, 1000, 'upload/14.jpg', 3, 'Vsmart Aris Pro (8GB|128GB) is a smartphone with a beautiful design, 6.39-inch wide screen, AMOLED screen technology. The device is equipped with powerful performance with 8GB RAM memory. Front camera up to 20MP , with many features to take beautiful photos'),
(15, 3, 'Oppo A94 5G', 199.99, 900, 'upload/15.jpg', 2, 'The smartphone is powered by a powerful processor, MediaTek MT6853 Dimensity 800U 5G Octa-core while the GPU is Mali-G57 MC3. The device supports Dual SIM (Nano-SIM, dual stand-by) and runs on the Android 11 + ColorOS 11.1 operating system.'),
(16, 3, 'Oppo Reno 5 ', 649.99, 1000, 'upload/16.jpg', 2, 'Oppo Reno 5G is the latest smartphone launched by Oppo in April 2019. The smartphone is powered by Qualcomm Snapdragon 855 processor.'),
(17, 3, 'Oppo A53 ', 49.99, 1000, 'upload/17.jpg', 2, 'The dimension of the smartphone is 162.2 x 75 x 7.9 mm and it weighs 175 grams. The screen size is 6.5 inches display with IPS LCD capacitive touchscreen technology that provides 1080 x 2400 pixels resolution and 405 PPI density.'),
(18, 3, 'Oppo A93', 79.99, 1000, 'upload/18.jpg', 2, 'The screen comes with a big 6.5 inches display with IPS LCD capacitive touchscreen technology that provides 1080 x 2400 pixels resolution and 405 PPI density. The smartphone runs on the Android 11 + ColorOS 11.1 operating system.'),
(19, 3, 'Oppo A54', 99.99, 1000, 'upload/19.jpg', 2, 'The smartphone is powered by a powerful processor, MediaTek MT6765 Helio P35 Octa-core while the GPU is PowerVR GE8320. The device supports Dual SIM (Nano-SIM, dual stand-by) and runs on the Android 10 + ColorOS 7.2 operating system.'),
(20, 3, 'Oppo A15', 339, 990, 'upload/20.jpg', 2, 'The smartphone supports Dual SIM (Nano-SIM, dual stand-by) and runs on the Android 10 operating system. The device is powered by a powerful processor, Mediatek MT6765 Helio P35 Octa-core while the GPU is PowerVR GE832'),
(21, 3, 'OPPO A12', 339, 1000, 'upload/21.jpg', 2, 'The dimension of the smartphone is 155.9 x 75.5 x 8.3 mm and it weighs 165 grams. The built of the smartphone includes material such as glass for the front, plastic on its back, and the frame is made out of plastic.'),
(22, 3, 'Oppo A74', 619, 1000, 'upload/22.jpg', 2, 'The smartphone is powered by a powerful processor, Qualcomm SM4350 Snapdragon 480 5G Octa-core while the GPU is Adreno 619. The device supports Dual SIM (Nano-SIM, dual stand-by) and runs on the Android 11 + ColorOS 11.1 operating system.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales`
--

CREATE TABLE `sales` (
  `salesid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `sales_total` double NOT NULL,
  `sales_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `sales`
--

INSERT INTO `sales` (`salesid`, `userid`, `sales_total`, `sales_date`) VALUES
(1, 2, 34, '2021-11-11 16:23:38'),
(2, 2, 18, '2021-11-11 16:23:38'),
(3, 2, 6, '2021-11-11 16:23:38'),
(4, 2, 1014244, '2021-11-11 16:23:38'),
(5, 2, 9588, '2021-11-11 16:23:38'),
(6, 2, 88779, '2021-11-11 16:23:38'),
(7, 2, 15579, '2021-11-11 16:23:38'),
(8, 2, 112361, '2021-11-11 16:23:38'),
(9, 2, 7990, '2021-11-11 16:23:38'),
(10, 2, 18370, '2021-11-11 16:23:38'),
(11, 2, 0, '2021-05-22 09:50:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales_detail`
--

CREATE TABLE `sales_detail` (
  `sales_detailid` int(11) NOT NULL,
  `salesid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `sales_qty` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `sales_detail`
--

INSERT INTO `sales_detail` (`sales_detailid`, `salesid`, `productid`, `sales_qty`) VALUES
(1, 2, 1, 12),
(2, 2, 2, 10),
(3, 3, 3, 11),
(4, 4, 2, 50),
(5, 4, 1, 106),
(6, 4, 5, 1000),
(7, 5, 2, 12),
(8, 6, 5, 101),
(9, 7, 1, 10),
(10, 7, 3, 11),
(11, 8, 4, 10),
(12, 8, 20, 10),
(13, 8, 1, 99),
(14, 8, 2, 20),
(15, 9, 2, 10),
(16, 10, 2, 10),
(17, 10, 3, 12),
(18, 10, 4, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `userid` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_address` varchar(150) NOT NULL,
  `contact` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`userid`, `company_name`, `company_address`, `contact`) VALUES
(2, 'OPPO Digital', 'HCM CITY', '272757778'),
(10, 'VIN GROUP', 'HCM CITY', '272757777'),
(11, 'Samsung Electronics', 'HCM CITY', '909756467');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `access` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `access`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, '', '', 2),
(4, 'supplier', '99b0e8da24e29e4ccb5d7d76e677c2ac', 3),
(10, '', '', 3),
(11, '', '', 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`userid`);

--
-- Chỉ mục cho bảng `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventoryid`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`);

--
-- Chỉ mục cho bảng `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`salesid`);

--
-- Chỉ mục cho bảng `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD PRIMARY KEY (`sales_detailid`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`userid`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `sales`
--
ALTER TABLE `sales`
  MODIFY `salesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `sales_detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
