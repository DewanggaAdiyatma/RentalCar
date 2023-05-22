-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2023 at 04:13 AM
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
  `notelp_customer` bigint(20) NOT NULL,
  `noktp_customer` bigint(16) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `id_role`, `nama_customer`, `alamat_customer`, `notelp_customer`, `noktp_customer`, `username`, `password`) VALUES
(1, 5, 'Sasa', 'Jalan Simokerto No 12', 81255334768, 3602041211870001, 'sasa123', 'sasa123');

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
  `subtotal` bigint(20) NOT NULL,
  `terlambat` int(11) NOT NULL,
  `denda` bigint(20) NOT NULL,
  `catatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dtrans`
--

INSERT INTO `dtrans` (`id_trans`, `id_mobil`, `id_pegawai`, `tgl_ambil`, `tgl_kembali`, `total_hari_sewa`, `subtotal`, `terlambat`, `denda`, `catatan`) VALUES
(1, 1, 4, '2023-05-19 12:09:53', '2023-05-22 09:09:53', 2, 500000, 0, 0, 'kembali dalam kondisi baik');

-- --------------------------------------------------------

--
-- Table structure for table `htrans`
--

CREATE TABLE `htrans` (
  `id_trans` int(11) NOT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_customer` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total` bigint(20) NOT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `htrans`
--

INSERT INTO `htrans` (`id_trans`, `tgl_transaksi`, `id_customer`, `status`, `total`, `tgl_pembayaran`) VALUES
(1, '2023-05-18 09:08:26', 1, '3', 500000, '2023-05-19 09:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `jenismobil`
--

CREATE TABLE `jenismobil` (
  `id_jenismobil` int(11) NOT NULL,
  `jenismobil` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenismobil`
--

INSERT INTO `jenismobil` (`id_jenismobil`, `jenismobil`) VALUES
(1, 'mpv'),
(2, 'suv'),
(3, 'sedan'),
(4, 'hatchback'),
(5, 'pick up'),
(6, 'sport'),
(7, 'off road'),
(8, 'double cabin');

-- --------------------------------------------------------

--
-- Table structure for table `kritiksaran`
--

CREATE TABLE `kritiksaran` (
  `id_kritiksaran` int(11) NOT NULL,
  `id_trans` int(11) NOT NULL,
  `penilaian` int(1) NOT NULL,
  `ulasan` varchar(255) NOT NULL,
  `kritik` varchar(255) DEFAULT NULL,
  `saran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kritiksaran`
--

INSERT INTO `kritiksaran` (`id_kritiksaran`, `id_trans`, `penilaian`, `ulasan`, `kritik`, `saran`) VALUES
(1, 1, 5, 'pelayanan baik dan ramah', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `merkmobil`
--

CREATE TABLE `merkmobil` (
  `id_merkmobil` int(11) NOT NULL,
  `nama_merkmobil` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merkmobil`
--

INSERT INTO `merkmobil` (`id_merkmobil`, `nama_merkmobil`) VALUES
(1, 'toyota'),
(2, 'honda'),
(3, 'suzuki'),
(4, 'daihatsu'),
(5, 'nissan');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(11) NOT NULL,
  `nama_mobil` varchar(50) NOT NULL,
  `id_merkmobil` int(11) NOT NULL,
  `noplat_mobil` varchar(10) NOT NULL,
  `warna_mobil` varchar(10) NOT NULL,
  `id_jenismobil` int(1) NOT NULL,
  `tahun_mobil` year(4) NOT NULL,
  `status` int(1) NOT NULL,
  `harga_sewa` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `nama_mobil`, `id_merkmobil`, `noplat_mobil`, `warna_mobil`, `id_jenismobil`, `tahun_mobil`, `status`, `harga_sewa`) VALUES
(1, 'avanza', 1, 'L 5476 DB', 'merah', 1, 2020, 1, 250000),
(2, 'ignis', 3, 'L 1143 WA', 'hitam', 2, 2022, 1, 350000),
(4, 'brio', 2, 'L 9374 AX', 'putih', 4, 2021, 1, 400000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `alamat_pegawai` varchar(255) NOT NULL,
  `notelp_pegawai` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `id_role`, `nama_pegawai`, `alamat_pegawai`, `notelp_pegawai`, `username`, `password`) VALUES
(1, 1, 'owner', 'owner', 87956358705, 'owner', 'owner'),
(2, 2, 'Juan', 'Jalan Kertajaya Indah Timur No 22', 87958368905, 'juan123', 'juan123'),
(3, 4, 'Cecil', 'Jalan Sutorejo No 154', 87745287403, 'cecil123', 'cecil123'),
(4, 3, 'Toni', 'Jalan Setro No 33', 85764359357, 'toni123', 'toni123');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'pemilik'),
(2, 'manager'),
(3, 'staff dealer'),
(4, 'admin'),
(5, 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD UNIQUE KEY `id_role` (`id_role`),
  ADD UNIQUE KEY `id_role_2` (`id_role`);

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
-- Indexes for table `jenismobil`
--
ALTER TABLE `jenismobil`
  ADD PRIMARY KEY (`id_jenismobil`);

--
-- Indexes for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  ADD PRIMARY KEY (`id_kritiksaran`),
  ADD UNIQUE KEY `id_trans` (`id_trans`);

--
-- Indexes for table `merkmobil`
--
ALTER TABLE `merkmobil`
  ADD PRIMARY KEY (`id_merkmobil`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`),
  ADD UNIQUE KEY `jenis_mobil` (`id_jenismobil`),
  ADD UNIQUE KEY `id_merkmobil` (`id_merkmobil`);

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
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jenismobil`
--
ALTER TABLE `jenismobil`
  MODIFY `id_jenismobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  MODIFY `id_kritiksaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `merkmobil`
--
ALTER TABLE `merkmobil`
  MODIFY `id_merkmobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id_mobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `mobil_ibfk_1` FOREIGN KEY (`id_jenismobil`) REFERENCES `jenismobil` (`id_jenismobil`),
  ADD CONSTRAINT `mobil_ibfk_2` FOREIGN KEY (`id_merkmobil`) REFERENCES `merkmobil` (`id_merkmobil`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
