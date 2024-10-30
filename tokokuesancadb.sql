-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2024 at 05:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokokuesancadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(20) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `email_customer` varchar(100) NOT NULL,
  `noTelp_customer` varchar(20) DEFAULT NULL,
  `alamat_customer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`, `email_customer`, `noTelp_customer`, `alamat_customer`) VALUES
('CUST001', 'Aldo Pratama', 'aldo.pratama@example.com', '081234567890', 'Jalan Melati No. 123'),
('CUST002', 'Budi Santoso', 'budi.santoso@example.com', '082345678901', 'Jalan Kenanga No. 456'),
('CUST003', 'Cindy Ayu', 'cindy.ayu@example.com', '083456789012', 'Jalan Mawar No. 789');

-- --------------------------------------------------------

--
-- Table structure for table `detailtransaksi`
--

CREATE TABLE `detailtransaksi` (
  `id_detail` varchar(20) NOT NULL,
  `id_transaksi` varchar(20) NOT NULL,
  `id_kue` varchar(20) NOT NULL,
  `harga_kue` decimal(10,2) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subTotal_transaksi` decimal(10,2) GENERATED ALWAYS AS (`harga_kue` * `jumlah`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailtransaksi`
--

INSERT INTO `detailtransaksi` (`id_detail`, `id_transaksi`, `id_kue`, `harga_kue`, `jumlah`) VALUES
('DETAIL001', 'TRANS001', 'KUE001', 150000.00, 2),
('DETAIL002', 'TRANS001', 'KUE002', 120000.00, 1),
('DETAIL003', 'TRANS002', 'KUE003', 180000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kue`
--

CREATE TABLE `kue` (
  `id_kue` varchar(20) NOT NULL,
  `nama_kue` varchar(100) NOT NULL,
  `deskripsi_kue` text DEFAULT NULL,
  `harga_kue` decimal(10,2) NOT NULL,
  `stok_kue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kue`
--

INSERT INTO `kue` (`id_kue`, `nama_kue`, `deskripsi_kue`, `harga_kue`, `stok_kue`) VALUES
('KUE001', 'Kue Coklat', 'Kue coklat lezat dengan frosting kaya', 150000.00, 10),
('KUE002', 'Kue Vanila', 'Kue vanila klasik dengan lapisan krim', 120000.00, 15),
('KUE003', 'Kue Red Velvet', 'Kue red velvet lembut dengan frosting krim keju', 180000.00, 8);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(20) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `email_pegawai` varchar(100) NOT NULL,
  `noTelp_pegawai` varchar(20) DEFAULT NULL,
  `alamat_pegawai` text DEFAULT NULL,
  `username_pegawai` varchar(20) NOT NULL,
  `password_pegawai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `email_pegawai`, `noTelp_pegawai`, `alamat_pegawai`, `username_pegawai`, `password_pegawai`) VALUES
('PEG001', 'Wira Buana', 'wira.buana@example.com', '081234567890', 'Jalan Kemenangan No. 1', 'pakwb123', '$2y$10$56KrfOW0YogO4LQgPJVIA.YweunPb..ies7A51FIPzI3yoCCXG78y'),
('PEG002', 'Narendera Sancaya', 'narendera.sancaya@example.com', '082345678901', 'Jalan Persahabatan No. 2', 'sanca123', '$2y$10$n6RP529uY9072nkriCNN1.x880kwATMCNRaWCuuhq85UUVyWsLceq'),
('PGW003', 'devasya', 'devasya@gmail.com', '081555555555', 'perpus udayana', 'devasya123', '$2y$10$Wi07iJmYmrzbG8bh7rrq..Ly5RPpWeSpNPkm2.iEJ8FShAhSbMaYq'),
('PGW004', 'rama ', 'rama@rama.com', '2151154156', 'tas sekolah', 'rama123', '$2y$10$hzFndIHcjO5k05toQDt6leuhX2i1BrJtO9UHEhiA5DXNJDFb0Um36'),
('PGW005', 'aa', 'aa@gmail.com', '00000', 'aaaa', 'aa', '$2y$10$HcMSA8di1HBL7Fr/rZkCU.F3XK4HRcedZTF69LN/dVLr43diLxtSW');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(20) NOT NULL,
  `id_customer` varchar(20) NOT NULL,
  `id_pegawai` varchar(20) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `grandTotal_transaksi` decimal(10,2) NOT NULL,
  `deskripsi_transaksi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_customer`, `id_pegawai`, `tanggal_transaksi`, `grandTotal_transaksi`, `deskripsi_transaksi`) VALUES
('TRANS001', 'CUST001', 'PEG001', '2024-10-24 08:36:38', 420000.00, 'saya ingin main game'),
('TRANS002', 'CUST002', 'PEG002', '2024-10-24 08:36:38', 180000.00, 'saya ingin tidur');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_kue` (`id_kue`);

--
-- Indexes for table `kue`
--
ALTER TABLE `kue`
  ADD PRIMARY KEY (`id_kue`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
  ADD CONSTRAINT `detailtransaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `detailtransaksi_ibfk_2` FOREIGN KEY (`id_kue`) REFERENCES `kue` (`id_kue`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
