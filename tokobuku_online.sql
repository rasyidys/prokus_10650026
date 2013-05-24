-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2011 at 04:10 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `uid` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uid`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE IF NOT EXISTS `buku` (
  `isbn` char(10) NOT NULL COMMENT 'ISBN',
  `judul` varchar(50) NOT NULL COMMENT 'Judul',
  `nomorEdisi` varchar(12) NOT NULL COMMENT 'Nomor Edisi',
  `copyright` int(11) NOT NULL COMMENT 'Copyright',
  `deskripsi` varchar(100) NOT NULL COMMENT 'Deskripsi',
  `IDPenerbit` int(11) NOT NULL COMMENT 'ID Penerbit',
  `fileGambar` varchar(25) NOT NULL COMMENT 'File Gambar',
  `harga` int(11) NOT NULL COMMENT 'Harga',
  PRIMARY KEY (`isbn`),
  KEY `IDPenerbit` (`IDPenerbit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`isbn`, `judul`, `nomorEdisi`, `copyright`, `deskripsi`, `IDPenerbit`, `fileGambar`, `harga`) VALUES
('123', 'Belajar MySQL', '1231', 2011, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the', 123459, '1306721315.jpg', 10000),
('12345', 'Ajax', '12', 2011, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the', 123459, '1306721165.jpg', 20000),
('Hele', 'Oracle', '231', 2011, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the', 123459, '1306721387.jpg', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `DetailOrder`
--

CREATE TABLE IF NOT EXISTS `DetailOrder` (
  `IDOrderDetail` int(11) NOT NULL AUTO_INCREMENT,
  `IDOrder` int(11) NOT NULL,
  `ISBN` char(15) NOT NULL,
  `JumlahBeli` int(11) NOT NULL,
  PRIMARY KEY (`IDOrderDetail`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `DetailOrder`
--

INSERT INTO `DetailOrder` (`IDOrderDetail`, `IDOrder`, `ISBN`, `JumlahBeli`) VALUES
(30, 14, '123', 1),
(31, 14, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id_member` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `NamaLengkap` varchar(50) NOT NULL,
  `Alamat` varchar(75) NOT NULL,
  `LevelMember` enum('admin','member') NOT NULL,
  `Provinsi` varchar(20) NOT NULL,
  `Kota` varchar(20) NOT NULL,
  PRIMARY KEY (`id_member`),
  UNIQUE KEY `username` (`username`),
  KEY `id_member` (`id_member`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `username`, `password`, `NamaLengkap`, `Alamat`, `LevelMember`, `Provinsi`, `Kota`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Tejo Murti', 'Jl. Gejayan', 'admin', '', ''),
(2, '', '', 'Tejo Murti', 'Jl. Gejayan', 'member', 'Jogja', 'Sleman');

-- --------------------------------------------------------

--
-- Table structure for table `OrderData`
--

CREATE TABLE IF NOT EXISTS `OrderData` (
  `IDOrder` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(25) NOT NULL,
  `TanggalOrder` date NOT NULL,
  `StatusOrder` enum('baru','lunas','terkirim') NOT NULL,
  PRIMARY KEY (`IDOrder`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `OrderData`
--

INSERT INTO `OrderData` (`IDOrder`, `UserName`, `TanggalOrder`, `StatusOrder`) VALUES
(14, '', '2011-05-29', 'terkirim');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE IF NOT EXISTS `penerbit` (
  `IDPenerbit` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Penerbit',
  `namaPenerbit` varchar(25) NOT NULL COMMENT 'Nama Penerbit',
  `alamatPenerbit` varchar(50) NOT NULL COMMENT 'Alamat Penerbit',
  PRIMARY KEY (`IDPenerbit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123460 ;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`IDPenerbit`, `namaPenerbit`, `alamatPenerbit`) VALUES
(123459, 'Andi Publisher', 'Jl. gejayan 12');

-- --------------------------------------------------------

--
-- Table structure for table `ShoppingCart`
--

CREATE TABLE IF NOT EXISTS `ShoppingCart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SessionId` varchar(50) NOT NULL,
  `ISBN` char(15) NOT NULL,
  `JumlahBeli` int(11) NOT NULL,
  `TanggalOrder` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `ShoppingCart`
--

INSERT INTO `ShoppingCart` (`ID`, `SessionId`, `ISBN`, `JumlahBeli`, `TanggalOrder`) VALUES
(9, '4sq77opn15iabo0pq1snaggfq3', '112', 3, '2011-04-05'),
(10, '4sq77opn15iabo0pq1snaggfq3', '110', 102, '2011-04-05'),
(11, '4sq77opn15iabo0pq1snaggfq3', '113', 1, '2011-04-05'),
(12, '6ung95euvmtv8nuibifl723ak2', '112', 1, '2011-05-25'),
(28, '1i6o7a9cvnbs84f7ocmh1eheo1', '123', 1, '2011-05-29'),
(29, 'mas0l4eb38b0oo4895f8atau10', '12345', 1, '2011-05-30'),
(30, 'mas0l4eb38b0oo4895f8atau10', '123', 2, '2011-05-30');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`IDPenerbit`) REFERENCES `penerbit` (`IDPenerbit`) ON DELETE CASCADE ON UPDATE CASCADE;
