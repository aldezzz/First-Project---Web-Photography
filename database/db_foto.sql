-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2022 at 01:40 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_foto`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `UserName`, `Password`, `updationDate`, `Image`) VALUES
(1, 'admin', 'admin', 'abcd', '2022-12-15 12:39:13', 'C. A. H.png');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id_cu` int(11) NOT NULL,
  `nama_visit` varchar(100) DEFAULT NULL,
  `email_visit` varchar(120) DEFAULT NULL,
  `telp_visit` char(16) DEFAULT NULL,
  `pesan` longtext DEFAULT NULL,
  `tgl_posting` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id_cu`, `nama_visit`, `email_visit`, `telp_visit`, `pesan`, `tgl_posting`, `status`, `id`) VALUES
(1, 'ME', 'gome@gmail.com', '2147483647', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '2017-06-18 10:03:07', 1, 0),
(3, 'aldes', 'aldestifany27@gmail.com', '087776099556', 'mau booking package 2', '2022-12-14 12:22:11', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contactusinfo`
--

CREATE TABLE `contactusinfo` (
  `id_info` int(11) NOT NULL,
  `alamat_kami` tinytext DEFAULT NULL,
  `email_kami` varchar(255) DEFAULT NULL,
  `telp_kami` char(20) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contactusinfo`
--

INSERT INTO `contactusinfo` (`id_info`, `alamat_kami`, `email_kami`, `telp_kami`, `id`) VALUES
(1, 'Jl. Mekarmukti', 'cahphotography@gmail.com', '+62 812-9389-4270', 1);

-- --------------------------------------------------------

--
-- Table structure for table `galery`
--

CREATE TABLE `galery` (
  `id_galery` int(11) NOT NULL,
  `nama_galery` varchar(100) NOT NULL,
  `foto_galery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `galery`
--

INSERT INTO `galery` (`id_galery`, `nama_galery`, `foto_galery`) VALUES
(1, 'Street Photography', 'Galeri8.jpg'),
(2, 'Random ', 'Galeri2.jpg'),
(3, 'Random', 'Galeri11.jpg'),
(4, 'Random', 'Galeri3.jpg'),
(5, 'random', 'Galeri9.jpg'),
(6, 'random', 'Galeri7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(120) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `ket_paket` text NOT NULL,
  `foto_paket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `harga`, `ket_paket`, `foto_paket`) VALUES
(1, 'Regular', 3000, 'Regular Customer = Rp. 3,000.00/photos.\r\nWe only provide street photography so the price is very affordable\r\n', 'REGULAR.png'),
(2, 'Membership', 2000, 'Discount for Members = 2000/photos.\r\nWe only provide street photography so the price is very affordable.\r\n\r\nIf you have registered as a membership.\r\n', 'MEMBER.png'),
(3, 'Package 1', 7000, 'Package 1 for Regular Customer = Rp. 7,000.00/5 photos.\r\nWe only provide street photography so the price is very affordable.', 'PACKAGE1.png'),
(4, 'Package 2', 5000, 'Package 2 for Members = Rp.5,000.00/5 photos.\r\nWe only provide street photography so the price is very affordable.', 'PACKAGE 2.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '											<p align=\"justify\"><span style=\"color: rgb(153, 0, 0); font-size: small; font-weight: 700;\">This is Therms and Conditions</span></p><p align=\"justify\"><br></p>											'),
(5, 'Bank Account', 'rekening', '																																	123456789 Bank BRI a/n Helmi'),
(2, 'Privacy Policy', 'privacy', '											<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">This is Privacy Policy</span>'),
(3, 'ABOUT US', 'aboutus', '																																												<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Kami menyediakan berbagai macam paket jasa fotografi untuk anda</span>'),
(11, 'FAQs', 'faqs', '																						<div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Q : Bagaimana cara booking paket jasa fotografi disini?</span></div><div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">A : Pertama anda harus mendaftar terlebih dahulu sebagai member melalui menu yang telah disediakan.</span></div>																						');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_trx` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `tgl_trx` date NOT NULL,
  `stt_trx` varchar(50) NOT NULL,
  `tgl_take` date NOT NULL,
  `jam_take` varchar(20) NOT NULL,
  `catatan` text NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bukti_bayar` text NOT NULL,
  `ubah_tgl` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id_cu`);

--
-- Indexes for table `contactusinfo`
--
ALTER TABLE `contactusinfo`
  ADD PRIMARY KEY (`id_info`);

--
-- Indexes for table `galery`
--
ALTER TABLE `galery`
  ADD PRIMARY KEY (`id_galery`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_trx`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id_cu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contactusinfo`
--
ALTER TABLE `contactusinfo`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `galery`
--
ALTER TABLE `galery`
  MODIFY `id_galery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
