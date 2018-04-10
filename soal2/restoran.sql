-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 10, 2018 at 08:07 AM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabang_restoran`
--

CREATE TABLE `cabang_restoran` (
  `id` int(100) NOT NULL,
  `nama_cabang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cabang_restoran`
--

INSERT INTO `cabang_restoran` (`id`, `nama_cabang`) VALUES
(1, 'warteg serpong'),
(2, 'warteg alam sutera'),
(3, 'warteg senayan city');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `menu_id` varchar(100) NOT NULL,
  `qty` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `menu_id`, `qty`) VALUES
(1, 'Kasir', '2', 5),
(2, 'Kasir', '1', 3);

-- --------------------------------------------------------

--
-- Table structure for table `detailInvoice`
--

CREATE TABLE `detailInvoice` (
  `id` int(11) NOT NULL,
  `idInvoice` int(11) NOT NULL,
  `namaMenu` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(100) NOT NULL,
  `nama_stock` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `waktu_transaksi` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `nama_stock`, `user`, `waktu_transaksi`) VALUES
(2, 'Kecap', 'Chef', '2018-04-10 14:55:58.972000'),
(3, 'Saos', 'Chef', '2018-04-10 14:56:17.837000'),
(4, 'Tepung', 'Chef', '2018-04-10 14:56:23.873000');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `kodeInvoice` varchar(30) NOT NULL,
  `waktuInvoice` datetime NOT NULL,
  `totalHarga` int(11) NOT NULL,
  `karyawan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id` int(100) NOT NULL,
  `kategori_id` varchar(100) NOT NULL,
  `jenis_makanan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id`, `kategori_id`, `jenis_makanan`) VALUES
(1, '1', 'Appetizer'),
(2, '1', 'Main Course'),
(3, '1', 'Dessert'),
(4, '2', 'Dessert'),
(5, '2', 'Main Course'),
(6, '2', 'Appetizer'),
(7, '2', 'Juice'),
(8, '2', 'Tea'),
(9, '2', 'Coffe'),
(10, '2', 'Mineral'),
(11, '1', 'Mineral'),
(12, '1', 'Coffe'),
(13, '1', 'Juice');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(100) NOT NULL,
  `restoran_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `gaji` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `restoran_id`, `nama`, `gaji`, `role`, `gender`) VALUES
(1, 1, 'Miya', '2000000', 'Pelayan', 'Perempuan'),
(2, 1, 'Mira', '1000000', 'Kasir', 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(100) NOT NULL,
  `cabang_restoran_id` varchar(100) NOT NULL,
  `kategori_makanan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `cabang_restoran_id`, `kategori_makanan`) VALUES
(1, '1', 'food'),
(2, '1', 'beverage'),
(3, '2', 'food');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(100) NOT NULL,
  `jenis_id` varchar(100) NOT NULL,
  `menu_makanan` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `jenis_id`, `menu_makanan`, `harga`) VALUES
(1, '2', 'Nasi Goreng', 20000),
(2, '2', 'Nasi Padang', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id` int(11) NOT NULL,
  `namaStok` varchar(30) NOT NULL,
  `jumlahStok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id`, `namaStok`, `jumlahStok`) VALUES
(1, 'Kecap', 50),
(3, 'Tepung', 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabang_restoran`
--
ALTER TABLE `cabang_restoran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detailInvoice`
--
ALTER TABLE `detailInvoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cabang_restoran`
--
ALTER TABLE `cabang_restoran`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detailInvoice`
--
ALTER TABLE `detailInvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
