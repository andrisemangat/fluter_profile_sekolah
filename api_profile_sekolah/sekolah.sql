-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2020 at 07:51 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `berita_id` varchar(20) NOT NULL,
  `nama_berita` varchar(100) NOT NULL,
  `isi_berita` text NOT NULL,
  `tgl_berita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`berita_id`, `nama_berita`, `isi_berita`, `tgl_berita`) VALUES
('BER001', 'BERITA LATIHAN', 'SILAHAKAN LATIHAN BUKU MATEMATIKA HAL 20-30', '2020-07-01'),
('BER002', 'TAHUN AJARAN BARO 2020-2021', 'TAHUN AJARAN BARU DI MULAI TGL 15 JULI 2020', '2020-07-12'),
('BER001', 'BERITA LATIHAN', 'SILAHAKAN LATIHAN BUKU MATEMATIKA HAL 20-30', '2020-07-01'),
('BER002', 'TAHUN AJARAN BARO 2020-2021', 'TAHUN AJARAN BARU DI MULAI TGL 15 JULI 2020', '2020-07-12'),
('cek1', 'berita cejk1', 'isi berita cek 1', '0000-00-00'),
('cek2', 'berita cek2', 'isi cek2berita', '0000-00-00'),
('', '', '', '0000-00-00'),
('', '', '', '0000-00-00'),
('CEKAJA', 'NAMA BERITA CWEK AJA', 'ISI BERITA CEK AJA', '0000-00-00'),
('CEKAJA', 'NAMA BERITA CWEK AJA', 'ISI BERITA CEK AJA', '0000-00-00'),
('', '', '', '0000-00-00'),
('', '', '', '0000-00-00'),
('', '', '', '0000-00-00'),
('', '', '', '0000-00-00'),
('cek4', 'beriyita 4', 'isi berita 4', '0000-00-00'),
('cek4', 'beriyita 4', 'isi berita 4', '0000-00-00'),
('cek4', 'berita 4', 'isi berta cek 4', '0000-00-00'),
('cek5	', 'berita cek5', 'isi berita cek5', '0000-00-00'),
('cek6', 'berita6', 'isi berita 6', '0000-00-00'),
('cek6', 'nama cek6', 'isi cek6', '0000-00-00'),
('CEKAJA', 'NAMA BERITA CWEK AJA', 'ISI BERITA CEK AJA', '0000-00-00'),
('CEKAJA', 'NAMA BERITA CWEK AJA', 'ISI BERITA CEK AJA', '0000-00-00'),
('', '', '', '0000-00-00'),
('', '', '', '0000-00-00'),
('', '', '', '0000-00-00'),
('', '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `guru_id` varchar(50) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`guru_id`, `nama_guru`, `tgl_lahir`, `alamat`, `password`) VALUES
('guru000001', 'GURU guru000001', '2020-07-01', 'ALAMAT guru000001', '123456'),
('guru000002', 'GURU guru000001', '2020-07-02', 'ALAMAT guru000001', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kelas_id` varchar(50) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `guru_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kelas_id`, `nama_kelas`, `guru_id`) VALUES
('7A', '7A', 'GURU000001'),
('7B', '7B', 'GURU000002');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_detail`
--

CREATE TABLE `kelas_detail` (
  `kelas_id` varchar(50) NOT NULL,
  `nis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_detail`
--

INSERT INTO `kelas_detail` (`kelas_id`, `nis`) VALUES
('7A', 'murid000001'),
('7A', 'murid000002'),
('7A', 'murid000003'),
('7A', '001');

-- --------------------------------------------------------

--
-- Table structure for table `murid`
--

CREATE TABLE `murid` (
  `userid` text NOT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `nis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `murid`
--

INSERT INTO `murid` (`userid`, `password`, `name`, `email`, `address`, `nis`) VALUES
('andri', '123456', 'andri', '', 'alamat', '001'),
('murid000001', '123456', 'NAMA murid000001', '', 'ALAMAT murid000001', 'murid000001'),
('murid000002', '123456', 'NAMA murid000002', '', 'ALAMAT murid000002', 'murid000002'),
('murid000003', '123456', 'NAMA murid000003', '', 'ALAMAT murid000003', 'murid000003');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `murid`
--
ALTER TABLE `murid`
  ADD PRIMARY KEY (`userid`(100));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
