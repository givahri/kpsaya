-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Sep 2023 pada 20.18
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` varchar(100) NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `stock_minimal` int(11) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `barcode`, `nama_barang`, `harga_beli`, `harga_jual`, `stock`, `satuan`, `stock_minimal`, `gambar`) VALUES
('Brg-001', '99695848484', 'beras', 200000, 220000, 249993, 'piece', 10, 'Brg-001.png'),
('Brg-002', '1234567889', 'sampo', 20000, 30000, 20015, 'piece', 4, 'Brg-002.png'),
('Brg-003', '553353537575', 'milku', 2000, 3000, 3456, 'piece', 6, 'Brg-003.png'),
('Brg-005', '8993002010431', 'scarlett', 40000, 50000, 92, 'botol', 5, 'Brg-005.png'),
('Brg-006', '8992752011408', 'vit air mineral', 2000, 5000, 2797, 'piece', 2, 'gambar2.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_beli_detail`
--

CREATE TABLE `tbl_beli_detail` (
  `id` int(11) NOT NULL,
  `no_beli` varchar(20) NOT NULL,
  `tgl_beli` date NOT NULL,
  `kode_brg` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `jml_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_beli_detail`
--

INSERT INTO `tbl_beli_detail` (`id`, `no_beli`, `tgl_beli`, `kode_brg`, `nama_barang`, `qty`, `harga_beli`, `jml_harga`) VALUES
(11, 'PB0001', '2023-08-17', 'Brg-001', 'beras', 2, 200000, 400000),
(20, 'PB0002', '2023-08-28', 'Brg-001', 'beras', 5, 200000, 1000000),
(21, 'PB0003', '2023-09-04', 'Brg-006', 'vit air mineral', 1, 2000, 2000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_beli_head`
--

CREATE TABLE `tbl_beli_head` (
  `no_beli` varchar(20) NOT NULL,
  `tgl_beli` date NOT NULL,
  `suplier` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_beli_head`
--

INSERT INTO `tbl_beli_head` (`no_beli`, `tgl_beli`, `suplier`, `total`, `keterangan`) VALUES
('', '2023-08-12', 'PT. marteliasa', 1242000, ''),
('PB0001', '2023-08-17', 'PT.Kupang sejahtera', 800000, ''),
('PB0002', '2023-08-28', '', 1000000, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id_customer` int(11) NOT NULL,
  `nama` varchar(256) NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `deskripsi` varchar(256) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_customer`
--

INSERT INTO `tbl_customer` (`id_customer`, `nama`, `telepon`, `deskripsi`, `alamat`) VALUES
(2, 'Heni', '0203847374', 'beli sari roti', 'flores'),
(3, 'Putri', '08223448585', 'beli snack', 'kupang'),
(4, 'Rani', '085337025492', 'beli sabun mandi', 'sumba'),
(5, 'fahri', '085375839593', 'beli roko surya', 'bumi baru'),
(7, 'joose', '08534759697', 'beli sampo zink', 'luwuk'),
(8, 'agus', '085337025492', 'beli coklat', 'cilacap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jual_detail`
--

CREATE TABLE `tbl_jual_detail` (
  `id` int(11) NOT NULL,
  `no_jual` varchar(20) NOT NULL,
  `tgl_jual` date NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `jml_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_jual_detail`
--

INSERT INTO `tbl_jual_detail` (`id`, `no_jual`, `tgl_jual`, `barcode`, `nama_barang`, `qty`, `harga_jual`, `jml_harga`) VALUES
(1, '', '2023-08-17', 'Brg-001', 'beras', 2, 220000, 440000),
(2, 'PJ0001', '2023-08-17', 'Brg-001', 'beras', 2, 220000, 440000),
(3, '', '2023-08-17', '553353537575', 'milku', 1, 3000, 3000),
(6, 'PJ0001', '2023-08-17', '8889655754', 'korek api', 13, 3000, 39000),
(7, 'PJ0001', '2023-08-17', '1234567889', 'sampo', 3, 30000, 90000),
(9, 'PJ0002', '2023-08-18', '553353537575', 'milku', 1, 3000, 3000),
(10, 'PJ0003', '2023-08-18', '553353537575', 'milku', 10, 3000, 30000),
(11, 'PJ0004', '2023-08-18', '553353537575', 'milku', 1, 3000, 3000),
(12, 'PJ0005', '2023-08-18', '8889655754', 'korek api', 1, 3000, 3000),
(13, 'PJ0006', '2023-08-18', '99695848484', 'beras', 2, 220000, 440000),
(14, 'PJ0007', '2023-08-18', '99695848484', 'beras', 4, 220000, 880000),
(15, 'PJ0007', '2023-08-18', '8889655754', 'korek api', 4, 3000, 12000),
(16, 'PJ0008', '2023-08-18', '8889655754', 'korek api', 5, 3000, 15000),
(17, 'PJ0009', '2023-08-18', '99695848484', 'beras', 2, 220000, 440000),
(18, 'PJ0010', '2023-08-18', '99695848484', 'beras', 2, 220000, 440000),
(19, 'PJ0011', '2023-08-18', '8889655754', 'korek api', 4, 3000, 12000),
(20, 'PJ0012', '2023-08-18', '8889655754', 'korek api', 1, 3000, 3000),
(21, 'PJ0013', '2023-08-18', '8889655754', 'korek api', 1, 3000, 3000),
(22, 'PJ0014', '2023-08-18', '99695848484', 'beras', 3, 220000, 660000),
(38, 'PJ0021', '2023-08-18', '8992752011408', 'vit air mineral', 2, 5000, 10000),
(39, 'PJ0022', '2023-08-18', '8993002010431', 'scarlett', 1, 50000, 50000),
(40, 'PJ0022', '2023-08-18', '553353537575', 'milku', 1, 3000, 3000),
(45, 'PJ0023', '2023-08-19', '8992752011408', 'vit air mineral', 1, 5000, 5000),
(46, 'PJ0024', '2023-08-19', '8992752011408', 'vit air mineral', 3, 5000, 15000),
(47, 'PJ0025', '2023-08-19', '8992752011408', 'vit air mineral', 2, 5000, 10000),
(48, 'PJ0026', '2023-08-19', '8992752011408', 'vit air mineral', 18, 5000, 90000),
(51, 'PJ0028', '2023-08-19', '8993002010431', 'scarlett', 1, 50000, 50000),
(52, 'PJ0029', '2023-08-19', '8992752011408', 'vit air mineral', 4, 5000, 20000),
(53, 'PJ0027', '2023-08-19', '8992752011408', 'vit air mineral', 4, 5000, 20000),
(54, 'PJ0028', '2023-08-20', '8992752011408', 'vit air mineral', 5, 5000, 25000),
(55, 'PJ0030', '2023-08-20', '8992752011408', 'vit air mineral', 3, 5000, 15000),
(56, 'PJ0031', '2023-08-20', '8993002010431', 'scarlett', 2, 50000, 100000),
(57, 'PJ0032', '2023-08-20', '8993002010431', 'scarlett', 7, 50000, 350000),
(58, 'PJ0033', '2023-08-20', '8993002010431', 'scarlett', 2, 50000, 100000),
(59, 'PJ0034', '2023-08-20', '8992752011408', 'vit air mineral', 4, 5000, 20000),
(60, 'PJ0035', '2023-08-20', '8992752011408', 'vit air mineral', 6, 5000, 30000),
(61, 'PJ0036', '2023-08-20', '8993002010431', 'scarlett', 3, 50000, 150000),
(62, 'PJ0037', '2023-08-20', '8993002010431', 'scarlett', 5, 50000, 250000),
(66, 'PJ0038', '2023-08-28', '8992752011408', 'vit air mineral', 5, 5000, 25000),
(67, 'PJ0039', '2023-08-28', '8992752011408', 'vit air mineral', 5, 5000, 25000),
(68, 'PJ0040', '2023-08-28', '8992752011408', 'vit air mineral', 5, 5000, 25000),
(69, 'PJ0041', '2023-08-30', '8992752011408', 'vit air mineral', 5, 5000, 25000),
(70, 'PJ0042', '2023-09-04', '8993002010431', 'scarlett', 3, 50000, 150000),
(71, 'PJ0042', '2023-09-04', '99695848484', 'beras', 2, 220000, 440000),
(72, 'PJ0042', '2023-09-04', '8992752011408', 'vit air mineral', 7, 5000, 35000),
(73, 'PJ0042', '2023-09-04', '553353537575', 'milku', 5, 3000, 15000),
(74, 'PJ0043', '2023-09-04', '8992752011408', 'vit air mineral', 10, 5000, 50000),
(75, 'PJ0043', '2023-09-04', '8993002010431', 'scarlett', 5, 50000, 250000),
(76, 'PJ0043', '2023-09-04', '553353537575', 'milku', 8, 3000, 24000),
(77, 'PJ0043', '2023-09-04', '99695848484', 'beras', 1, 220000, 220000),
(78, 'PJ0044', '2023-09-04', '8992752011408', 'vit air mineral', 7, 5000, 35000),
(79, 'PJ0045', '2023-09-04', '8992752011408', 'vit air mineral', 6, 5000, 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jual_head`
--

CREATE TABLE `tbl_jual_head` (
  `no_jual` varchar(20) NOT NULL,
  `tgl_jual` date NOT NULL,
  `customer` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `jml_bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_jual_head`
--

INSERT INTO `tbl_jual_head` (`no_jual`, `tgl_jual`, `customer`, `total`, `keterangan`, `jml_bayar`, `kembalian`) VALUES
('PJ0001', '2023-08-17', '', 569000, '', 600000, 31000),
('PJ0002', '2023-08-18', '', 3000, '', 5000, 2000),
('PJ0003', '2023-08-18', '', 30000, '', 50000, 20000),
('PJ0004', '2023-08-18', '', 3000, '', 6000, 3000),
('PJ0005', '2023-08-18', '', 3000, '', 50000, 47000),
('PJ0006', '2023-08-18', '', 440000, '', 600000, 160000),
('PJ0007', '2023-08-18', '', 892000, '', 1000000, 108000),
('PJ0008', '2023-08-18', '', 15000, '', 20000, 5000),
('PJ0009', '2023-08-18', '', 440000, '', 500000, 60000),
('PJ0010', '2023-08-18', '', 440000, '', 500000, 60000),
('PJ0011', '2023-08-18', '', 12000, '', 15000, 3000),
('PJ0012', '2023-08-18', '', 3000, '', 5000, 2000),
('PJ0013', '2023-08-18', '', 3000, '', 5000, 2000),
('PJ0014', '2023-08-18', '', 1014000, '', 1050000, 36000),
('PJ0015', '2023-08-18', '', 15000, '', 20000, 5000),
('PJ0016', '2023-08-18', '', 30000, '', 40000, 10000),
('PJ0017', '2023-08-18', '', 250000, '', 300000, 50000),
('PJ0026', '2023-08-19', '', 90000, '', 100000, 10000),
('PJ0027', '2023-08-19', '', 20000, '', 30000, 10000),
('PJ0028', '2023-08-20', '', 75000, '', 100000, 25000),
('PJ0029', '2023-08-20', '', 20000, '', 50000, 30000),
('PJ0037', '2023-08-20', '', 250000, '', 250000, 0),
('PJ0038', '2023-08-28', '', 25000, 'utang', 30000, 5000),
('PJ0039', '2023-08-28', '', 25000, '', 50000, 25000),
('PJ0040', '2023-08-28', '', 25000, '', 50000, 25000),
('PJ0041', '2023-08-30', '', 25000, '', 50000, 25000),
('PJ0042', '2023-09-04', '', 640000, 'utang', 700000, 60000),
('PJ0043', '2023-09-04', '', 544000, 'utang', 0, -544000),
('PJ0044', '2023-09-04', '', 35000, '', 40000, 5000),
('PJ0045', '2023-09-04', '', 30000, '', 50000, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama` varchar(256) NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `deskripsi` varchar(256) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id_supplier`, `nama`, `telepon`, `deskripsi`, `alamat`) VALUES
(14, 'PT. marteliasa', '0203847300', 'supplier barang sembako', 'jaya bakti'),
(15, 'PT.Kupang sejahtera', '085337025492', 'goyang dumang', 'oepura kupang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `address` varchar(100) NOT NULL,
  `level` int(1) NOT NULL COMMENT '1-administrator\r\n2-supervisor\r\n3-operator',
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`userid`, `username`, `fullname`, `password`, `address`, `level`, `foto`) VALUES
(14, 'kasir', 'kasir toko saya', '$2y$10$1K/gsz/DxhRBBMuIV6i7uu4ClCP395h4vEN8kV5uKBdrDaKUaUGei', 'moilong', 3, '199-pngwing.com (48).png'),
(16, 'admin', 'administrator', '$2y$10$R1o7z/ctLZQbxj0TbkR60egjQ.9msukQlUaWIeQYUu018i1JE2rxO', 'moilong', 1, '64-IMG-20230201-WA0000 (1).jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `tbl_beli_detail`
--
ALTER TABLE `tbl_beli_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_beli_head`
--
ALTER TABLE `tbl_beli_head`
  ADD PRIMARY KEY (`no_beli`);

--
-- Indeks untuk tabel `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `tbl_jual_detail`
--
ALTER TABLE `tbl_jual_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_jual_head`
--
ALTER TABLE `tbl_jual_head`
  ADD PRIMARY KEY (`no_jual`);

--
-- Indeks untuk tabel `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_beli_detail`
--
ALTER TABLE `tbl_beli_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_jual_detail`
--
ALTER TABLE `tbl_jual_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT untuk tabel `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
