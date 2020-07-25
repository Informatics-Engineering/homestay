-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2018 at 09:08 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homestay`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `homestay`
--

CREATE TABLE `homestay` (
  `kd_homestay` char(5) NOT NULL,
  `nm_homestay` varchar(100) NOT NULL,
  `harga_promo` int(12) NOT NULL,
  `harga_jual` int(12) NOT NULL DEFAULT '0',
  `stok` int(4) NOT NULL,
  `keterangan` text NOT NULL,
  `file_gambar` varchar(100) NOT NULL,
  `kd_kategori` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homestay`
--

INSERT INTO `homestay` (`kd_homestay`, `nm_homestay`, `harga_promo`, `harga_jual`, `stok`, `keterangan`, `file_gambar`, `kd_kategori`) VALUES
('H0002', 'Pak Kusnadi', 300000, 400000, 1, '<p>terdapat 3 ruangan</p>\r\n<p>1 kamar mandi</p>\r\n<p>1 kamar tidur</p>\r\n<p>1 ruangan tamu</p>', 'H0002.kusnadi-pelabuan.jpg', 'K002'),
('H0001', 'Pak Riki ', 350000, 200000, 3, '<p>terdapat 4 ruangan</p>\r\n<p>1 ruangan tamu</p>\r\n<p>1 kamar mandi</p>\r\n<p>2 kamar tidur</p>', 'H0001.depan.jpg', 'K001'),
('H0003', 'Ibu Febi', 330000, 400000, 1, '<p>terdapat 2 ruangan</p>\r\n<p>1 kamar mandi</p>\r\n<p>1 kamar tidur</p>', 'H0003.ujung-genteng.jpg', 'K003'),
('H0004', 'Pak Yoga', 250000, 300000, 1, '<p>terdapat 4 ruangan</p>\r\n<p>1 ruangan tamu</p>\r\n<p>1 kamar mandi</p>\r\n<p>2 kamar tidur</p>', 'H0004.bettah-cimaja2-.jpg', 'K002'),
('H0005', 'Ibu Aliah', 125000, 200000, 1, '<p>terdapat 3 ruangan</p>\r\n<p>1 kamar tidur</p>\r\n<p>1 kamar mandi</p>\r\n<p>1 ruang tamu</p>', 'H0005..aliah_geopark.jpg', 'K001'),
('H0006', 'Pak Ryan', 310000, 325000, 1, '<p>. . .</p>', 'H0006.ujung-genteng-2.jpg', 'K003');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kd_kategori` char(4) NOT NULL,
  `nm_kategori` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kd_kategori`, `nm_kategori`) VALUES
('K001', 'Geopark '),
('K002', 'Pelabuhan Ratu'),
('K003', 'Ujung Genteng');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id` int(4) NOT NULL,
  `no_pemesanan` varchar(8) NOT NULL,
  `nm_pelanggan` varchar(100) NOT NULL,
  `jumlah_transfer` int(12) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`id`, `no_pemesanan`, `nm_pelanggan`, `jumlah_transfer`, `keterangan`, `tanggal`) VALUES
(14, 'PS000003', 'naufal', 230428, 'sudah di bayar', '2018-08-16'),
(13, 'PS000001', 'naufa', 430585, 'sudah di transfer', '2018-08-02'),
(15, 'PS000015', 'Riki', 200000, 'Baik', '2018-09-07');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kd_pelanggan` char(6) NOT NULL,
  `nm_pelanggan` varchar(100) NOT NULL,
  `kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `tgl_daftar` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kd_pelanggan`, `nm_pelanggan`, `kelamin`, `email`, `no_telepon`, `username`, `password`, `tgl_daftar`) VALUES
('P00001', 'Muhammad', 'Laki-laki', 'bertahanmelawan23@gmail.com', '081287795428', 'Naufal', '21232f297a57a5a743894a0e4a801fc3', '2018-08-05');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `no_pemesanan` char(8) NOT NULL,
  `kd_pelanggan` char(6) NOT NULL,
  `tgl_pemesanan` date NOT NULL DEFAULT '0000-00-00',
  `nama_pemesan` varchar(60) NOT NULL,
  `alamat_lengkap` varchar(200) NOT NULL,
  `kd_provinsi` char(3) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `kode_pos` varchar(6) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `status_bayar` enum('Pesan','Lunas','Batal') NOT NULL DEFAULT 'Pesan'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`no_pemesanan`, `kd_pelanggan`, `tgl_pemesanan`, `nama_pemesan`, `alamat_lengkap`, `kd_provinsi`, `kota`, `kode_pos`, `no_telepon`, `status_bayar`) VALUES
('PS000001', 'P00001', '2018-09-07', 'Indah Indriyanna', 'Jl. Margahayu, Way Jepara, Lampung Timur', 'P17', 'Sukadana', '12345', '081911111111', 'Pesan'),
('PS000002', 'P00001', '2014-03-04', 'teti winarni', 'jl. palbapang no 32, sewon, bantul', 'P05', 'bantu', '55667', '08156767890', 'Lunas'),
('PS000003', 'P00003', '2014-03-04', 'Fitria Prasetiawati', 'jln. palbapang no 69, sewo, bantul', 'P05', 'Bantul', '66909', '08675987890', 'Lunas'),
('PS000004', 'P00004', '2014-03-12', 'Dion Alfantinus Markucel', 'Jl. Janti, 111, Karang Jambe, Yogyakarta', 'P05', 'Banguntapan', '55221', '081918181818', 'Lunas'),
('PS000005', 'P00003', '2014-03-12', 'Fitria Prasetiawati', 'Jl. Parangtritis, No 111, Bantul Kota, Yogyakarta', 'P05', 'Bantul', '55222', '085222111000', 'Lunas'),
('PS000006', 'P00005', '2014-03-12', 'Asyifa Indriana', 'Jl. Parangtritis, No 111, Bantul Kota, Yogyakarta', 'P05', 'Bantul', '55222', '085222111000', 'Lunas'),
('PS000007', 'P00001', '2014-03-12', 'Indah Indriyanna', 'Jl. Pramuka, Margayahu, Labuhan Ratu 1, Way Jepara', 'P17', 'Sukadana', '12345', '0819123123123', 'Lunas'),
('PS000008', 'P00002', '2014-03-12', 'Septi Suhesti', 'Jl. Suhada, Margahayu, Labuhan Ratu Baru, Way Jepara', 'P17', 'Sukadana', '34196', '085712345678', 'Lunas'),
('PS000009', 'P00003', '2014-03-12', 'Fitria Prasetiawati', 'Jl. Janti, Karang Jambe, 111, Bangungatan, Bantul', 'P05', 'Jogja', '55222', '081912345123', 'Pesan'),
('PS000010', 'P00003', '2014-04-03', 'Fitria Prasetiawati', 'Jl. Pasar Tempel, Raman Aji, Persil 1, Lampung Timur', 'P17', 'Sukadana', '12345', '081234561234', 'Pesan'),
('PS000011', 'P00006', '2015-05-23', 'sarah', 'jalan bhayangkara no.45 sukabumi', 'P02', 'sukabumi', '43122', '085759595773', 'Pesan'),
('PS000012', 'P00006', '2015-05-26', 'Sarah', 'Komplek Setukpa Polri, Sukabumi', 'P02', 'Sukabumi', '43122', '08981873131', 'Lunas'),
('PS000013', 'P00007', '2015-06-21', 'Didik', 'Jawa Barat', 'P02', 'Bandung', '12345', '1234567', 'Lunas'),
('PS000014', 'P00008', '2016-05-19', 'Dicsr', 'Jawa Barat', 'P02', 'Sukabumi', '12345', '123456789', 'Pesan'),
('PS000015', 'P00001', '2018-09-07', 'Riki', 'Jabar', '', 'Jabar', '', '0266123456', 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_item`
--

CREATE TABLE `pemesanan_item` (
  `id` int(4) NOT NULL,
  `no_pemesanan` char(8) NOT NULL,
  `kd_homestay` char(5) NOT NULL,
  `harga` int(12) NOT NULL,
  `jumlah` int(3) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesanan_item`
--

INSERT INTO `pemesanan_item` (`id`, `no_pemesanan`, `kd_homestay`, `harga`, `jumlah`) VALUES
(31, 'PS000003', 'H0001', 200000, 1),
(30, 'PS000002', 'H0001', 200000, 1),
(29, 'PS000001', 'H0001', 200000, 1),
(28, 'PS000003', 'H0001', 200000, 1),
(27, 'PS000002', 'B1', 40000, 1),
(26, 'PS000001', 'B0001', 400000, 1),
(32, 'PS000015', 'H0001', 200000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `kd_provinsi` char(3) NOT NULL,
  `nm_provinsi` varchar(100) NOT NULL,
  `biaya_kirim` int(12) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`kd_provinsi`, `nm_provinsi`, `biaya_kirim`) VALUES
('P01', 'Jawa Tengah', 15000),
('P02', 'Jawa Barat', 10000),
('P03', 'Jawa Timur', 15000),
('P04', 'DKI Jakarta', 15000),
('P05', 'Yogyakarta, D.I', 30000),
('P06', 'Bali', 20000),
('P07', 'Bengkulu', 20000),
('P08', 'Banten', 20000),
('P09', 'Gorontalo', 35000),
('P10', 'Irian Jaya Barat', 35000),
('P11', 'Jambi', 25000),
('P12', 'Kalimantan Barat', 30000),
('P13', 'Kalimantan Tengah', 30000),
('P14', 'Kalimantan Timur', 30000),
('P15', 'Kalimantan Selatan', 30000),
('P16', 'Kepulauan Bangka Belitung', 30000),
('P17', 'Lampung', 20000),
('P18', 'Maluku', 25000),
('P19', 'Maluku Utara', 25000),
('P20', 'Aceh, D.I', 30000),
('P21', 'Nusa Tenggara Barat', 25000),
('P22', 'Nusa Tenggara Timur', 25000),
('P23', 'Papua', 35000),
('P24', 'Riau', 25000),
('P25', 'Kepulauan Riau', 25000),
('P26', 'Sulawesi Barat', 25000),
('P27', 'Sulawesi Tengah', 25000),
('P28', 'Sulawesi Tenggara', 25000),
('P29', 'Sulawesi Selatan', 25000),
('P30', 'Sulawesi Utara', 25000),
('P31', 'Sumatera Barat', 34000),
('P32', 'Sumatera Selatan', 35000);

-- --------------------------------------------------------

--
-- Table structure for table `tmp_keranjang`
--

CREATE TABLE `tmp_keranjang` (
  `id` int(5) NOT NULL,
  `kd_homestay` char(5) NOT NULL,
  `harga` int(12) NOT NULL,
  `jumlah` int(3) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `kd_pelanggan` char(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homestay`
--
ALTER TABLE `homestay`
  ADD PRIMARY KEY (`kd_homestay`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`no_pemesanan`);

--
-- Indexes for table `pemesanan_item`
--
ALTER TABLE `pemesanan_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`kd_provinsi`);

--
-- Indexes for table `tmp_keranjang`
--
ALTER TABLE `tmp_keranjang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pemesanan_item`
--
ALTER TABLE `pemesanan_item`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tmp_keranjang`
--
ALTER TABLE `tmp_keranjang`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
