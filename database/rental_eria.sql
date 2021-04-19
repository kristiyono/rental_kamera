-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2019 at 08:33 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_eria`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2018-03-28 23:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `kode_booking` varchar(8) NOT NULL,
  `id_mobil` int(11) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `durasi` int(11) NOT NULL,
  `driver` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pickup` varchar(30) NOT NULL,
  `tgl_booking` date NOT NULL,
  `bukti_bayar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`kode_booking`, `id_mobil`, `tgl_mulai`, `tgl_selesai`, `durasi`, `driver`, `status`, `email`, `pickup`, `tgl_booking`, `bukti_bayar`) VALUES
('TRX00001', 8, '2019-05-26', '2019-05-26', 1, 200000, 'Sudah Dibayar', 'test@gmail.com', 'Pickup Sesuai Alamat', '2019-05-25', '2505201920111034788684_10209405168685237_8233778212845387776_n.JPEG'),
('TRX00002', 9, '2019-05-26', '2019-05-27', 2, 0, 'Menunggu Pembayaran', 'rizalit2@gmail.com', 'Ambil Sendiri', '2019-05-25', '');

-- --------------------------------------------------------

--
-- Table structure for table `cek_booking`
--

CREATE TABLE `cek_booking` (
  `kode_booking` varchar(8) NOT NULL,
  `id_mobil` int(11) NOT NULL,
  `tgl_booking` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cek_booking`
--

INSERT INTO `cek_booking` (`kode_booking`, `id_mobil`, `tgl_booking`, `status`) VALUES
('TRX00001', 8, '2019-05-26', 'Sudah Dibayar'),
('TRX00002', 9, '2019-05-26', 'Menunggu Pembayaran'),
('TRX00002', 9, '2019-05-27', 'Menunggu Pembayaran');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id_cu` int(11) NOT NULL,
  `nama_visit` varchar(100) DEFAULT NULL,
  `email_visit` varchar(120) DEFAULT NULL,
  `telp_visit` char(16) DEFAULT NULL,
  `pesan` longtext,
  `tgl_posting` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id_cu`, `nama_visit`, `email_visit`, `telp_visit`, `pesan`, `tgl_posting`, `status`) VALUES
(1, 'Anuj Kumar', 'webhostingamigo@gmail.com', '2147483647', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '2017-06-18 10:03:07', 1),
(2, 'kjk', 'jlkl@gmail.com', '98989898', 'kjlkjkljklj', '2018-03-06 14:01:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contactusinfo`
--

CREATE TABLE `contactusinfo` (
  `id_info` int(11) NOT NULL,
  `alamat_kami` tinytext,
  `email_kami` varchar(255) DEFAULT NULL,
  `telp_kami` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactusinfo`
--

INSERT INTO `contactusinfo` (`id_info`, `alamat_kami`, `email_kami`, `telp_kami`) VALUES
(1, 'Rental Mobil \r\nJl. Kemanggisan Raya No.19, RT.4/RW.13, Kemanggisan, Kec. Palmerah, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11480\r\n', 'rentalmobil@gmail.com', '08585233222');

-- --------------------------------------------------------

--
-- Table structure for table `merek`
--

CREATE TABLE `merek` (
  `id_merek` int(11) NOT NULL,
  `nama_merek` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merek`
--

INSERT INTO `merek` (`id_merek`, `nama_merek`, `CreationDate`, `UpdationDate`) VALUES
(14, 'Honda', '2019-06-07 18:05:23', NULL),
(15, 'MercedesBenz', '2019-06-07 18:29:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(11) NOT NULL,
  `nama_mobil` varchar(150) DEFAULT NULL,
  `id_merek` int(11) DEFAULT NULL,
  `nopol` varchar(20) NOT NULL,
  `deskripsi` longtext,
  `harga` int(11) DEFAULT NULL,
  `bb` varchar(100) DEFAULT NULL,
  `tahun` int(6) DEFAULT NULL,
  `seating` int(11) DEFAULT NULL,
  `image1` varchar(120) DEFAULT NULL,
  `image2` varchar(120) DEFAULT NULL,
  `image3` varchar(120) DEFAULT NULL,
  `image4` varchar(120) DEFAULT NULL,
  `image5` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `nama_mobil`, `id_merek`, `nopol`, `deskripsi`, `harga`, `bb`, `tahun`, `seating`, `image1`, `image2`, `image3`, `image4`, `image5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(10, 'hondafreed', 14, 'B 7730 NSP', 'Honda Freed 1500 cc transmision automatic seating capacity 6', 450000, 'Bensin', 2012, 6, 'Honda-Freed-front.jpg', 'Honda-Freed-front.jpg', 'Honda-Freed-Interior.jpg', 'Honda-Freed-front.jpg', 'Honda-Freed-Interior.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2019-06-07 18:09:49', '2019-06-07 18:19:29'),
(11, 'HondaCrv', 14, 'B 9990 RXY', 'Honda CRV Tahun 2011', 1000000, 'Bensin', 2011, 5, 'Honda-CRV-2011-Front.jpg', 'Honda-CRV-2011-Rear.jpg', 'Honda-CRV-2011-Interior.jpg', 'Honda-CRV-2011-Rear.jpg', 'Honda-CRV-2011-Front.jpg', 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, '2019-06-07 18:27:37', NULL),
(12, 'MercedesBenzC', 15, 'B 56789 OPX', 'Mercedes Benz C Class 1800 CC', 1850000, 'Bensin', 2012, 5, 'Merci-Cclass-service1.jpg', 'Merci-Cclass-service2.jpg', 'Merci-Cclass-service3.jpg', 'Merci-Cclass-service3.jpg', 'Merci-Cclass-service1.jpg', 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2019-06-07 18:32:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '																						<h2><font size=\"3\"><span class=\"purple\">Syarat</span> Ketentuan Penyewaan Mobil</font></h2><div><h4>\r\n	<span data-scayt_word=\"Persyaratan\" data-scaytid=\"1\">Persyaratan</span> Rental Mobil <span data-scayt_word=\"untuk\" data-scaytid=\"2\">untuk</span> <span data-scayt_word=\"Perusahaan\" data-scaytid=\"3\">Perusahaan</span></h4>\r\n<ul><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"4\">Fotokopi</span> <span data-scayt_word=\"SIUP\" data-scaytid=\"7\">SIUP</span> <span data-scayt_word=\"dan\" data-scaytid=\"8\">dan</span> <span data-scayt_word=\"NPWP\" data-scaytid=\"9\">NPWP</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"5\">Fotokopi</span> <span data-scayt_word=\"akte\" data-scaytid=\"10\">akte</span> <span data-scayt_word=\"pendirian\" data-scaytid=\"11\">pendirian</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"12\">perusahaan</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"6\">Fotokopi</span> <span data-scayt_word=\"Tanda\" data-scaytid=\"14\">Tanda</span> <span data-scayt_word=\"Daftar\" data-scaytid=\"15\">Daftar</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"13\">perusahaan</span>.</li><li>\r\n		<span data-scayt_word=\"Surat\" data-scaytid=\"20\">Surat</span> <span data-scayt_word=\"keterangan\" data-scaytid=\"22\">keterangan</span> <span data-scayt_word=\"domisili\" data-scaytid=\"23\">domisili</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"16\">perusahaan</span>.</li><li>\r\n		<span data-scayt_word=\"Surat\" data-scaytid=\"21\">Surat</span> <span data-scayt_word=\"pengesahan\" data-scaytid=\"25\">pengesahan</span> <span data-scayt_word=\"keputusan\" data-scaytid=\"26\">keputusan</span> <span data-scayt_word=\"menteri\" data-scaytid=\"27\">menteri</span> <span data-scayt_word=\"Hukum\" data-scaytid=\"28\">Hukum</span> <span data-scayt_word=\"dan\" data-scaytid=\"17\">dan</span> Ham</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"19\">Fotokopi</span> <span data-scayt_word=\"KTP\" data-scaytid=\"32\">KTP</span> <span data-scayt_word=\"direksi\" data-scaytid=\"33\">direksi</span>, <span data-scayt_word=\"dan\" data-scaytid=\"18\">dan</span> <span data-scayt_word=\"pejabat\" data-scaytid=\"34\">pejabat</span> yang <span data-scayt_word=\"bertanggung\" data-scaytid=\"35\">bertanggung</span> <span data-scayt_word=\"jawab\" data-scaytid=\"36\">jawab</span> <span data-scayt_word=\"terhadap\" data-scaytid=\"37\">terhadap</span> unit <span data-scayt_word=\"kendaraan\" data-scaytid=\"38\">kendaraan</span>.</li><li>\r\n		<span data-scayt_word=\"Surat\" data-scaytid=\"39\">Surat</span> <span data-scayt_word=\"kuasa\" data-scaytid=\"58\">kuasa</span> <span data-scayt_word=\"bila\" data-scaytid=\"59\">bila</span> <span data-scayt_word=\"bukan\" data-scaytid=\"60\">bukan</span> <span data-scayt_word=\"direktur\" data-scaytid=\"61\">direktur</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"40\">perusahaan</span> yang <span data-scayt_word=\"bertanggung\" data-scaytid=\"42\">bertanggung</span> <span data-scayt_word=\"jawab\" data-scaytid=\"43\">jawab</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"44\">Fotokopi</span> <span data-scayt_word=\"SIM\" data-scaytid=\"67\">SIM</span> <span data-scayt_word=\"pengemudi\" data-scaytid=\"68\">pengemudi</span>.</li><li>\r\n		Survey <span data-scayt_word=\"lokasi\" data-scaytid=\"69\">lokasi</span> <span data-scayt_word=\"domisili\" data-scaytid=\"45\">domisili</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"41\">perusahaan</span>.</li></ul>\r\n<h4>\r\n	<span data-scayt_word=\"Persyaratan\" data-scaytid=\"53\">Persyaratan</span> Rental Mobil <span data-scayt_word=\"untuk\" data-scaytid=\"54\">untuk</span> <span data-scayt_word=\"Perorangan\" data-scaytid=\"85\">Perorangan</span></h4>\r\n<ul><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"55\">Fotokopi</span> <span data-scayt_word=\"bukti\" data-scaytid=\"88\">bukti</span> <span data-scayt_word=\"kepemilikan\" data-scaytid=\"89\">kepemilikan</span> <span data-scayt_word=\"rumah\" data-scaytid=\"90\">rumah</span> <span data-scayt_word=\"atau\" data-scaytid=\"91\">atau</span> <span data-scayt_word=\"tempat\" data-scaytid=\"92\">tempat</span> <span data-scayt_word=\"tinggal\" data-scaytid=\"93\">tinggal</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"56\">Fotokopi</span> <span data-scayt_word=\"PBB\" data-scaytid=\"94\">PBB</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"75\">Fotokopi</span> <span data-scayt_word=\"NPWP\" data-scaytid=\"79\">NPWP</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"76\">Fotokopi</span> <span data-scayt_word=\"KTP\" data-scaytid=\"80\">KTP</span> <span data-scayt_word=\"atau\" data-scaytid=\"101\">atau</span> <span data-scayt_word=\"KITAS\" data-scaytid=\"126\">KITAS</span> (<span data-scayt_word=\"pemohon\" data-scaytid=\"127\">pemohon</span> <span data-scayt_word=\"dan\" data-scaytid=\"81\">dan</span> <span data-scayt_word=\"penjamin\" data-scaytid=\"129\">penjamin</span>).</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"77\"><span data-scayt_word=\"Foto\" data-scaytid=\"436\">Foto</span>kopi</span> <span data-scayt_word=\"KK\" data-scaytid=\"130\">KK</span> (<span data-scayt_word=\"Kartu\" data-scaytid=\"131\">Kartu</span> <span data-scayt_word=\"Keluarga\" data-scaytid=\"132\">Keluarga</span>).</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"78\">Fotokopi</span> <span data-scayt_word=\"Pasport\" data-scaytid=\"133\">Pasport</span>.</li><li>\r\n		<span data-scayt_word=\"Foto\" data-scaytid=\"134\">Foto</span> <span data-scayt_word=\"kopi\" data-scaytid=\"135\">kopi</span> <span data-scayt_word=\"SIM\" data-scaytid=\"82\">SIM</span>.</li><li>\r\n		<span data-scayt_word=\"Foto\" data-scaytid=\"137\">Foto</span> <span data-scayt_word=\"kopi\" data-scaytid=\"138\">kopi</span> ID Card <span data-scayt_word=\"tempat\" data-scaytid=\"113\">tempat</span> <span data-scayt_word=\"bekerja\" data-scaytid=\"164\">bekerja</span>.</li><li>\r\n		<span data-scayt_word=\"Kartu\" data-scaytid=\"141\">Kartu</span> <span data-scayt_word=\"nama\" data-scaytid=\"166\">nama</span>.</li><li>\r\n		Tim surveyor <span data-scayt_word=\"kami\" data-scaytid=\"167\">kami</span> survey <span data-scayt_word=\"lokasi\" data-scaytid=\"115\">lokasi</span> <span data-scayt_word=\"alamat\" data-scaytid=\"169\">alamat</span> <span data-scayt_word=\"dan\" data-scaytid=\"116\">dan</span> <span data-scayt_word=\"tempat\" data-scaytid=\"114\">tempat</span> <span data-scayt_word=\"tinggal\" data-scaytid=\"117\">tinggal</span> <span data-scayt_word=\"penyewa\" data-scaytid=\"172\">penyewa</span>.</li><li>\r\n		<span data-scayt_word=\"Memiliki\" data-scaytid=\"173\">Memiliki</span> <span data-scayt_word=\"penjamin\" data-scaytid=\"145\">penjamin</span> (<span data-scayt_word=\"bila\" data-scaytid=\"118\">bila</span> <span data-scayt_word=\"diperlukan\" data-scaytid=\"176\">diperlukan</span>).</li><li>\r\n		<span data-scayt_word=\"ketersediaan\" data-scaytid=\"188\">ketersediaan</span> <span data-scayt_word=\"lahan\" data-scaytid=\"189\">lahan</span> <span data-scayt_word=\"parkir\" data-scaytid=\"190\">parkir</span> yang <span data-scayt_word=\"layak\" data-scaytid=\"191\">layak</span> <span data-scayt_word=\"dan\" data-scaytid=\"157\">dan</span> <span data-scayt_word=\"aman\" data-scaytid=\"193\">aman</span>.</li></ul>\r\n<div style=\"padding:15px; background:#efefef\">\r\n	<h4>\r\n		Note</h4>\r\n	<ul><li>\r\n			<span data-scayt_word=\"Prosedur\" data-scaytid=\"194\">Prosedur</span> survey <span data-scayt_word=\"kami\" data-scaytid=\"178\">kami</span> <span data-scayt_word=\"harus\" data-scaytid=\"196\">harus</span> <span data-scayt_word=\"dilakukan\" data-scaytid=\"197\">dilakukan</span> minimal 1 <span data-scayt_word=\"hari\" data-scaytid=\"198\">hari</span> <span data-scayt_word=\"sebelum\" data-scaytid=\"200\">sebelum</span> <span data-scayt_word=\"hari\" data-scaytid=\"199\">hari</span> H. (<span data-scayt_word=\"Perusahaan\" data-scaytid=\"158\">Perusahaan</span> <span data-scayt_word=\"memerlukan\" data-scaytid=\"202\">memerlukan</span> <span data-scayt_word=\"waktu\" data-scaytid=\"203\">waktu</span> <span data-scayt_word=\"untuk\" data-scaytid=\"159\">untuk</span> <span data-scayt_word=\"pengecekan\" data-scaytid=\"205\">pengecekan</span> <span data-scayt_word=\"legalitas\" data-scaytid=\"206\">legalitas</span>/<span data-scayt_word=\"keaslian\" data-scaytid=\"207\">keaslian</span> data customer).</li><li>\r\n			Customer <span data-scayt_word=\"wajib\" data-scaytid=\"208\">wajib</span> <span data-scayt_word=\"Membayar\" data-scaytid=\"209\">Membayar</span> <span data-scayt_word=\"uang\" data-scaytid=\"210\">uang</span> deposit <span data-scayt_word=\"sebagai\" data-scaytid=\"211\">sebagai</span> <span data-scayt_word=\"jaminan\" data-scaytid=\"212\">jaminan</span> <span data-scayt_word=\"asuransi\" data-scaytid=\"213\">asuransi</span> (<span data-scayt_word=\"dikembalikan\" data-scaytid=\"214\">dikembalikan</span> <span data-scayt_word=\"di\" data-scaytid=\"215\">di</span> <span data-scayt_word=\"masa\" data-scaytid=\"216\">masa</span> <span data-scayt_word=\"akhir\" data-scaytid=\"217\">akhir</span> <span data-scayt_word=\"sewa\" data-scaytid=\"218\">sewa</span>).</li><li>\r\n			<span data-scayt_word=\"Kendaraan\" data-scaytid=\"289\">Kendaraan</span> <span data-scayt_word=\"hanya\" data-scaytid=\"290\">hanya</span> <span data-scayt_word=\"dapat\" data-scaytid=\"291\">dapat</span> <span data-scayt_word=\"dikemudikan\" data-scaytid=\"292\">dikemudikan</span> <span data-scayt_word=\"oleh\" data-scaytid=\"293\">oleh</span> <span data-scayt_word=\"orang\" data-scaytid=\"294\">orang</span> yang <span data-scayt_word=\"memiliki\" data-scaytid=\"295\">memiliki</span> <span data-scayt_word=\"SIM\" data-scaytid=\"185\">SIM</span> <span data-scayt_word=\"nasional\" data-scaytid=\"298\">nasional</span> <span data-scayt_word=\"indonesia\" data-scaytid=\"299\">indonesia</span> <span data-scayt_word=\"atau\" data-scaytid=\"187\">atau</span> <span data-scayt_word=\"SIM\" data-scaytid=\"186\">SIM</span> <span data-scayt_word=\"internasional\" data-scaytid=\"301\">internasional</span>.</li><li>\r\n			<span data-scayt_word=\"Semua\" data-scaytid=\"302\">Semua</span> data yang <span data-scayt_word=\"di\" data-scaytid=\"253\">di</span> <span data-scayt_word=\"sertakan\" data-scaytid=\"305\">sertakan</span> <span data-scayt_word=\"berupa\" data-scaytid=\"306\">berupa</span> <span data-scayt_word=\"foto\" data-scaytid=\"307\">foto</span> <span data-scayt_word=\"kopi\" data-scaytid=\"255\">kopi</span>. <span data-scayt_word=\"Penyewa\" data-scaytid=\"309\">Penyewa</span> <span data-scayt_word=\"wajib\" data-scaytid=\"256\">wajib</span> <span data-scayt_word=\"menunjukan\" data-scaytid=\"311\">menunjukan</span> <span data-scayt_word=\"dokumen\" data-scaytid=\"312\">dokumen</span> <span data-scayt_word=\"asli\" data-scaytid=\"314\">asli</span> <span data-scayt_word=\"kepada\" data-scaytid=\"315\">kepada</span> surveyor <span data-scayt_word=\"ketika\" data-scaytid=\"316\">ketika</span> <span data-scayt_word=\"di\" data-scaytid=\"254\">di</span> survey. <span data-scayt_word=\"Guna\" data-scaytid=\"317\">Guna</span> <span data-scayt_word=\"mencocokan\" data-scaytid=\"318\">mencocokan</span> <span data-scayt_word=\"keaslian\" data-scaytid=\"257\">keaslian</span> <span data-scayt_word=\"dokumen\" data-scaytid=\"313\">dokumen</span> <span data-scayt_word=\"dengan\" data-scaytid=\"320\">dengan</span> <span data-scayt_word=\"fotokopi\" data-scaytid=\"321\">fotokopi</span> yang <span data-scayt_word=\"diberikan\" data-scaytid=\"322\">diberikan</span>.</li><li>\r\n			<span data-scayt_word=\"Dilarang\" data-scaytid=\"920\">Dilarang</span> <span data-scayt_word=\"meninggalkan\" data-scaytid=\"921\">meninggalkan</span> <span data-scayt_word=\"STNK\" data-scaytid=\"922\">STNK</span>, <span data-scayt_word=\"kunci\" data-scaytid=\"923\">kunci</span> <span data-scayt_word=\"kontak\" data-scaytid=\"924\">kontak</span> <span data-scayt_word=\"dan\" data-scaytid=\"512\">dan</span> <span data-scayt_word=\"karcis\" data-scaytid=\"926\">karcis</span> <span data-scayt_word=\"parkir\" data-scaytid=\"513\">parkir</span> <span data-scayt_word=\"di\" data-scaytid=\"503\">di</span> <span data-scayt_word=\"dalam\" data-scaytid=\"929\">dalam</span> <span data-scayt_word=\"kendaraan\" data-scaytid=\"515\">kendaraan</span> yang <span data-scayt_word=\"sedang\" data-scaytid=\"932\">sedang</span> <span data-scayt_word=\"di\" data-scaytid=\"504\">di</span> <span data-scayt_word=\"parkir\" data-scaytid=\"514\">parkir</span>.</li><li>\r\n			<span data-scayt_word=\"Penggantian\" data-scaytid=\"933\">Penggantian</span> <span data-scayt_word=\"kendaraan\" data-scaytid=\"516\">kendaraan</span> <span data-scayt_word=\"tidak\" data-scaytid=\"934\">tidak</span> <span data-scayt_word=\"berlaku\" data-scaytid=\"935\">berlaku</span> <span data-scayt_word=\"jika\" data-scaytid=\"936\">jika</span> <span data-scayt_word=\"kerusakan\" data-scaytid=\"937\">kerusakan</span>/<span data-scayt_word=\"kecelakaan\" data-scaytid=\"938\">kecelakaan</span> <span data-scayt_word=\"diakibatkan\" data-scaytid=\"939\">diakibatkan</span> <span data-scayt_word=\"kelalaian\" data-scaytid=\"940\">kelalaian</span> <span data-scayt_word=\"penyewa\" data-scaytid=\"517\">penyewa</span>.</li><li>\r\n			<span id=\"result_box\" lang=\"id\"><span class=\"hps\"><span data-scayt_word=\"Penyewa\" data-scaytid=\"518\">Penyewa</span></span> <span class=\"hps\"><span data-scayt_word=\"dan\" data-scaytid=\"537\">dan</span></span> <span class=\"hps\">driver <span data-scayt_word=\"tambahan\" data-scaytid=\"609\">tambahan</span></span> <span class=\"hps\"><span data-scayt_word=\"harus\" data-scaytid=\"538\">harus</span> <span data-scayt_word=\"memiliki\" data-scaytid=\"539\">memiliki</span> <span data-scayt_word=\"usia\" data-scaytid=\"612\">usia</span> <span data-scayt_word=\"antara\" data-scaytid=\"613\">antara</span></span> <span class=\"hps\">21</span> <span data-scayt_word=\"hingga\" data-scaytid=\"614\">hingga</span> <span class=\"hps\">65 <span data-scayt_word=\"tahun\" data-scaytid=\"615\">tahun</span></span> <span class=\"hps\"><span data-scayt_word=\"untuk\" data-scaytid=\"540\">untuk</span> normal</span> <span class=\"hps\"><span data-scayt_word=\"kendaraan\" data-scaytid=\"541\">kendaraan</span></span> <span class=\"hps\"><span data-scayt_word=\"kategori\" data-scaytid=\"618\">kategori</span></span> <span class=\"hps\"><span data-scayt_word=\"mobil\" data-scaytid=\"619\">mobil</span> <span data-scayt_word=\"standar\" data-scaytid=\"620\">standar</span></span> <span class=\"hps\"><span data-scayt_word=\"dan\" data-scaytid=\"565\">dan</span></span> <span class=\"hps\">berusia</span> <span class=\"hps\">25</span> <span data-scayt_word=\"hingga\" data-scaytid=\"622\">hingga</span><span class=\"hps\"> 65</span> <span class=\"hps\"><span data-scayt_word=\"tahun\" data-scaytid=\"623\">tahun</span></span> <span class=\"hps\"><span data-scayt_word=\"untuk\" data-scaytid=\"566\">untuk</span></span> <span class=\"hps\"><span data-scayt_word=\"kategori\" data-scaytid=\"626\">kategori</span></span> <span class=\"hps\"><span data-scayt_word=\"mobil\" data-scaytid=\"627\">mobil</span> mewah.</span> </span></li><li>\r\n			<span data-scayt_word=\"Penyewaan\" data-scaytid=\"568\">Penyewaan</span> <span data-scayt_word=\"tanpa\" data-scaytid=\"569\">tanpa</span> <span data-scayt_word=\"supir\" data-scaytid=\"570\">supir</span> <span data-scayt_word=\"diwajibkan\" data-scaytid=\"571\">diwajibkan</span> <span data-scayt_word=\"untuk\" data-scaytid=\"323\">untuk</span> <span data-scayt_word=\"memonitor\" data-scaytid=\"572\">memonitor</span> <span data-scayt_word=\"perawatan\" data-scaytid=\"573\">perawatan</span> <span data-scayt_word=\"kendaraan\" data-scaytid=\"324\">kendaraan</span>.</li><li>\r\n			<span data-scayt_word=\"Hasil\" data-scaytid=\"797\">Hasil</span> survey <span data-scayt_word=\"adalah\" data-scaytid=\"798\">adalah</span> <span data-scayt_word=\"murni\" data-scaytid=\"799\">murni</span> data <span data-scayt_word=\"independen\" data-scaytid=\"800\">independen</span> <span data-scayt_word=\"dari\" data-scaytid=\"801\">dari</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"779\">perusahaan</span> <span data-scayt_word=\"kami\" data-scaytid=\"781\">kami</span>, <span data-scayt_word=\"jika\" data-scaytid=\"782\">jika</span> <span data-scayt_word=\"terjadi\" data-scaytid=\"806\">terjadi</span> <span data-scayt_word=\"penolakan\" data-scaytid=\"807\">penolakan</span> <span data-scayt_word=\"hasil\" data-scaytid=\"808\">hasil</span> survey, <span data-scayt_word=\"maka\" data-scaytid=\"810\">maka</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"780\">perusahaan</span> <span data-scayt_word=\"tidak\" data-scaytid=\"783\">tidak</span> <span data-scayt_word=\"akan\" data-scaytid=\"812\">akan</span> <span data-scayt_word=\"memberikan\" data-scaytid=\"813\">memberikan</span> <span data-scayt_word=\"informasi\" data-scaytid=\"814\">informasi</span> <span data-scayt_word=\"apapun\" data-scaytid=\"815\">apapun</span> <span data-scayt_word=\"kepada\" data-scaytid=\"784\">kepada</span> customer <span data-scayt_word=\"mengenai\" data-scaytid=\"817\">mengenai</span> <span data-scayt_word=\"hasil\" data-scaytid=\"809\">hasil</span> <span data-scayt_word=\"analisa\" data-scaytid=\"818\">analisa</span> survey</li></ul>\r\n</div>\r\n<p>&nbsp;\r\n	<br></p></div><p align=\"justify\"><br></p>																						'),
(5, 'Rekening', 'rekening', '																						123456789 Bank BRI a/n IRFAN MAULANA FARDI'),
(0, 'Driver', 'driver', '450000'),
(2, 'Privacy Policy', 'privacy', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span>'),
(3, 'Tentang Kami', 'aboutus', '											<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Kami adalah perusahaan yang bergerak di bidang penyewaan mobil.</span>'),
(11, 'FAQs', 'faqs', '																						<div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Q : Bagaimana cara menyewa mobil di&nbsp; Car Rental?</span></div><div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">A : Pertama anda harus mendaftar terlebih dahulu sebagai user melalui menu yang telah disediakan.</span></div>																						');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(120) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `telp` char(11) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `ktp` varchar(120) NOT NULL,
  `kk` varchar(120) NOT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama_user`, `email`, `password`, `telp`, `alamat`, `ktp`, `kk`, `RegDate`, `UpdationDate`) VALUES
(5, 'Test', 'test@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', '0819898989', 'test doang', '04082018212116dashboard.png', '04082018212116belumkembali.png', '2018-08-04 14:21:16', NULL),
(6, 'farizal hendra putra kusuma', 'rizalit2@gmail.com', '150fb021c56c33f82eef99253eb36ee1', '08782052411', 'bekasi', '2505201915281004082018212116belumkembali.png', '2505201915281004082018212116dashboard.png', '2019-05-25 13:28:10', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`kode_booking`);

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
-- Indexes for table `merek`
--
ALTER TABLE `merek`
  ADD PRIMARY KEY (`id_merek`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

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
  MODIFY `id_cu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contactusinfo`
--
ALTER TABLE `contactusinfo`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `merek`
--
ALTER TABLE `merek`
  MODIFY `id_merek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id_mobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
