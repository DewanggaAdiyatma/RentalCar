-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 04:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectmvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `nama_customer` varchar(255) NOT NULL,
  `alamat_customer` varchar(255) NOT NULL,
  `notelp_customer` int(13) NOT NULL,
  `noktp_customer` int(16) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dtrans`
--

CREATE TABLE `dtrans` (
  `id_trans` int(11) NOT NULL,
  `id_mobil` int(11) DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `tgl_ambil` datetime NOT NULL,
  `tgl_kembali` datetime NOT NULL,
  `total_hari_sewa` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `terlambat` int(11) NOT NULL,
  `catatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `htrans`
--

CREATE TABLE `htrans` (
  `id_trans` int(11) NOT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_customer` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total` int(11) NOT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kritiksaran`
--

CREATE TABLE `kritiksaran` (
  `id_kritiksaran` int(11) NOT NULL,
  `id_trans` int(11) NOT NULL,
  `kritik` varchar(255) NOT NULL,
  `saran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(11) NOT NULL,
  `nama_mobil` varchar(50) NOT NULL,
  `merk_mobil` varchar(50) NOT NULL,
  `noplat_mobil` varchar(10) NOT NULL,
  `warna_mobil` varchar(10) NOT NULL,
  `tahun_mobil` year(4) NOT NULL,
  `status` int(1) NOT NULL,
  `harga_sewa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `alamat_pegawai` varchar(255) NOT NULL,
  `notelp_pegawai` int(13) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD UNIQUE KEY `id_role` (`id_role`);

--
-- Indexes for table `dtrans`
--
ALTER TABLE `dtrans`
  ADD PRIMARY KEY (`id_trans`),
  ADD UNIQUE KEY `id_mobil` (`id_mobil`),
  ADD UNIQUE KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `htrans`
--
ALTER TABLE `htrans`
  ADD PRIMARY KEY (`id_trans`),
  ADD UNIQUE KEY `id_customer` (`id_customer`);

--
-- Indexes for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  ADD PRIMARY KEY (`id_kritiksaran`),
  ADD UNIQUE KEY `id_trans` (`id_trans`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `id_role` (`id_role`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  MODIFY `id_kritiksaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id_mobil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

--
-- Constraints for table `dtrans`
--
ALTER TABLE `dtrans`
  ADD CONSTRAINT `dtrans_ibfk_1` FOREIGN KEY (`id_trans`) REFERENCES `htrans` (`id_trans`),
  ADD CONSTRAINT `dtrans_ibfk_2` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id_mobil`),
  ADD CONSTRAINT `dtrans_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `htrans`
--
ALTER TABLE `htrans`
  ADD CONSTRAINT `htrans_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Constraints for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  ADD CONSTRAINT `kritiksaran_ibfk_1` FOREIGN KEY (`id_trans`) REFERENCES `htrans` (`id_trans`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
