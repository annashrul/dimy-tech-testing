-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jul 2022 pada 17.24
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `customer_name`) VALUES
(1, 'Annashrul Yusuf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer_address`
--

INSERT INTO `customer_address` (`id`, `customer_id`, `address_date`) VALUES
(1, 1, '2022-07-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_payment_method_order`
--

CREATE TABLE `detail_payment_method_order` (
  `id` int(11) NOT NULL,
  `order_id` int(50) NOT NULL,
  `payment_method_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_payment_method_order`
--

INSERT INTO `detail_payment_method_order` (`id`, `order_id`, `payment_method_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 32, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_product_order`
--

CREATE TABLE `detail_product_order` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_product_order`
--

INSERT INTO `detail_product_order` (`id`, `order_id`, `product_id`, `qty`, `subtotal`) VALUES
(1, 1, 1, 2, '70000'),
(2, 1, 2, 2, '80000'),
(3, 19, 2, 10, '0'),
(4, 19, 1, 2, '0'),
(5, 20, 2, 10, '0'),
(6, 20, 1, 2, '0'),
(7, 21, 2, 10, '40000'),
(8, 21, 1, 2, '75000'),
(9, 23, 2, 10, '400000'),
(10, 23, 1, 2, '470000'),
(11, 24, 2, 10, '400000'),
(12, 24, 1, 2, '470000'),
(13, 32, 2, 10, '400000'),
(14, 32, 1, 2, '70000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_order`
--

CREATE TABLE `master_order` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `customer_address_id` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_order`
--

INSERT INTO `master_order` (`id`, `code`, `customer_address_id`, `total`, `created_at`, `updated_at`) VALUES
(1, 'KD#0107220001', 1, '130000', '2022-07-01 14:48:35', '2022-07-01 15:15:30'),
(19, 'KD#0107220002', 1, '1000', '2022-07-01 14:48:38', '2022-07-01 15:15:30'),
(20, 'KD#0107220003', 1, '1000', '2022-07-01 14:48:40', '2022-07-01 15:15:30'),
(21, 'KD#0107220004', 1, '1000', '2022-07-01 14:48:42', '2022-07-01 15:15:30'),
(23, 'KD#0107220005', 1, '1000', '2022-07-01 14:48:45', '2022-07-01 15:15:30'),
(24, 'KD#0107220006', 1, '1000', '2022-07-01 14:48:47', '2022-07-01 15:15:30'),
(30, 'KD#0107220007', 1, '1000', '2022-07-01 15:20:04', '2022-07-01 15:20:04'),
(31, 'KD#0107220008', 1, '1000', '2022-07-01 15:21:05', '2022-07-01 15:21:05'),
(32, 'KD#0107220009', 1, '1000', '2022-07-01 15:21:18', '2022-07-01 15:21:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `payment_method`
--

INSERT INTO `payment_method` (`id`, `name`, `is_active`) VALUES
(1, 'Cash', 1),
(2, 'Debit Card', 1),
(3, 'Credit Card', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `name`, `price`) VALUES
(1, 'aromanis simping', '35000'),
(2, 'aromanis cup', '40000');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_customer`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_customer` (
`customer_address_id` int(11)
,`customer_id` int(11)
,`name` varchar(50)
,`address_date` date
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_detail_payment_method_order`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_detail_payment_method_order` (
`detail_order_id` int(11)
,`order_id` int(50)
,`payment_method_id` int(11)
,`name` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_detail_product_order`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_detail_product_order` (
`id` int(11)
,`name` varchar(100)
,`price` decimal(10,0)
,`detail_order_id` int(11)
,`order_id` int(11)
,`qty` int(11)
,`subtotal` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_order`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_order` (
`order_id` int(11)
,`customer_id` int(11)
,`customer_address_id` int(11)
,`code` varchar(50)
,`name` varchar(50)
,`total` decimal(10,0)
,`address_date` date
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_customer`
--
DROP TABLE IF EXISTS `view_customer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_customer`  AS SELECT `ca`.`id` AS `customer_address_id`, `c`.`id` AS `customer_id`, `c`.`customer_name` AS `name`, `ca`.`address_date` AS `address_date` FROM (`customer_address` `ca` join `customer` `c` on(`c`.`id` = `ca`.`customer_id`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_detail_payment_method_order`
--
DROP TABLE IF EXISTS `view_detail_payment_method_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_payment_method_order`  AS SELECT `dpmo`.`id` AS `detail_order_id`, `dpmo`.`order_id` AS `order_id`, `pm`.`id` AS `payment_method_id`, `pm`.`name` AS `name` FROM (`detail_payment_method_order` `dpmo` join `payment_method` `pm` on(`pm`.`id` = `dpmo`.`payment_method_id`)) WHERE `pm`.`is_active` = 1 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_detail_product_order`
--
DROP TABLE IF EXISTS `view_detail_product_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_product_order`  AS SELECT `p`.`id` AS `id`, `p`.`name` AS `name`, `p`.`price` AS `price`, `dpo`.`id` AS `detail_order_id`, `dpo`.`order_id` AS `order_id`, `dpo`.`qty` AS `qty`, `dpo`.`subtotal` AS `subtotal` FROM (`product` `p` join `detail_product_order` `dpo` on(`dpo`.`product_id` = `p`.`id`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_order`
--
DROP TABLE IF EXISTS `view_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order`  AS SELECT `mo`.`id` AS `order_id`, `vc`.`customer_id` AS `customer_id`, `vc`.`customer_address_id` AS `customer_address_id`, `mo`.`code` AS `code`, `vc`.`name` AS `name`, `mo`.`total` AS `total`, `vc`.`address_date` AS `address_date`, `mo`.`created_at` AS `created_at` FROM (`master_order` `mo` join `view_customer` `vc` on(`vc`.`customer_address_id` = `mo`.`customer_address_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indeks untuk tabel `detail_payment_method_order`
--
ALTER TABLE `detail_payment_method_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `payment_method_id` (`payment_method_id`);

--
-- Indeks untuk tabel `detail_product_order`
--
ALTER TABLE `detail_product_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `master_order`
--
ALTER TABLE `master_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kd_trx` (`code`),
  ADD KEY `customer_address_id` (`customer_address_id`);

--
-- Indeks untuk tabel `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `detail_payment_method_order`
--
ALTER TABLE `detail_payment_method_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `detail_product_order`
--
ALTER TABLE `detail_product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `master_order`
--
ALTER TABLE `master_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Ketidakleluasaan untuk tabel `detail_payment_method_order`
--
ALTER TABLE `detail_payment_method_order`
  ADD CONSTRAINT `detail_payment_method_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `master_order` (`id`),
  ADD CONSTRAINT `detail_payment_method_order_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`);

--
-- Ketidakleluasaan untuk tabel `detail_product_order`
--
ALTER TABLE `detail_product_order`
  ADD CONSTRAINT `detail_product_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `master_order` (`id`),
  ADD CONSTRAINT `detail_product_order_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Ketidakleluasaan untuk tabel `master_order`
--
ALTER TABLE `master_order`
  ADD CONSTRAINT `master_order_ibfk_1` FOREIGN KEY (`customer_address_id`) REFERENCES `customer_address` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
