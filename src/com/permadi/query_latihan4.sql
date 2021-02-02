-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2021 at 08:49 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `query_latihan4`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `Kd_dosen` varchar(10) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `Tanggal_lahir` date NOT NULL,
  `Pendidikan_terakhir` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`Kd_dosen`, `Nama`, `Alamat`, `Tanggal_lahir`, `Pendidikan_terakhir`) VALUES
('DS06001', 'Agus', 'Jln. Gajah Mada 115A, Jakarta Pusat', '1970-08-01', 'S2 ITB Informatika'),
('DS06002', 'Amin', 'Jln. Bungur sari v No, 178, bandung', '1977-05-03', 'S2 ITB Elektro'),
('DS06003', 'Yusuf', 'Jln. Yosodpuro 15, surabaya', '1973-08-09', 'S2 ITB Elektro'),
('DS07004', 'Alyssa', 'Jln. Cendana No. 6 Bandung', '1983-02-14', 'S2 ITB Elektro'),
('DS07005', 'Maulana', 'Jln. Ampera Raya No 1', '1985-10-10', 'S2 ITB Elektro'),
('DS07006', 'Afika', 'Jln. Pejaten Barat No 6A', '1987-03-09', 'S2 ITB Informatika'),
('DS07007', 'James', 'Jln. Padjadjaran No. 111, bandung', '1988-05-19', 'S2 ITB Informatika'),
('DS09008', 'Octavanus', 'Jln. Gajah Mada 101. Semarang', '1988-10-07', 'S2 ITB Informatika'),
('DS09009', 'Nugroho', 'Jln. Duren Tiga 196, Jakarta selatan', '1988-01-20', 'S2 ITB Informatika'),
('DS09010', 'Raisa', 'Jln. Nangka Jakarta selatan', '1989-12-29', 'S2 ITB Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `Kd_matakuliah` varchar(10) NOT NULL,
  `Kd_Dosen` varchar(30) NOT NULL,
  `Hari` smallint(6) NOT NULL,
  `Jam_Mulai` time NOT NULL,
  `Jam_Selesai` time NOT NULL,
  `No_Ruangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`Kd_matakuliah`, `Kd_Dosen`, `Hari`, `Jam_Mulai`, `Jam_Selesai`, `No_Ruangan`) VALUES
('MK0001', 'DS06001', 1, '08:00:00', '09:40:00', 'R001'),
('MK0002', 'DS06003', 1, '10:00:00', '11:40:00', 'R001'),
('MK0003', 'DS06003', 2, '08:00:00', '09:40:00', 'R001'),
('MK0004', 'DS07004', 2, '10:00:00', '11:40:00', 'R002'),
('MK0005', 'DS06001', 3, '10:00:00', '11:40:00', 'R003'),
('MK0006', 'DS07006', 3, '13:00:00', '14:40:00', 'R004');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `Kd_matakuliah` varchar(10) NOT NULL,
  `Nama_Matakuliah` varchar(30) NOT NULL,
  `Jumlah_Sks` smallint(6) NOT NULL,
  `Keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`Kd_matakuliah`, `Nama_Matakuliah`, `Jumlah_Sks`, `Keterangan`) VALUES
('MK0001', 'Struktur Data', 4, ''),
('MK0002', 'Analisa Perancangan Perangkat ', 4, ''),
('MK0003', 'Algoritma Pemograman 1', 4, ''),
('MK0004', 'Algoritma Pemograman 2', 4, ''),
('MK0005', 'Analisa Perancangan Perangkat ', 4, ''),
('MK0006', 'Matematika Diskrit', 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `No_Ruangan` varchar(10) NOT NULL,
  `Nama_Ruangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`No_Ruangan`, `Nama_Ruangan`) VALUES
('R001', 'Ruangan Kelas 001'),
('R002', 'Ruangan Kelas 002'),
('R003', 'Ruangan Kelas 003'),
('R004', 'Ruangan Kelas 004');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`Kd_dosen`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`Kd_matakuliah`),
  ADD KEY `Kd_Dosen` (`Kd_Dosen`,`No_Ruangan`),
  ADD KEY `No_Ruangan` (`No_Ruangan`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`Kd_matakuliah`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`No_Ruangan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`Kd_matakuliah`) REFERENCES `matakuliah` (`Kd_matakuliah`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`Kd_Dosen`) REFERENCES `dosen` (`Kd_dosen`),
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`No_Ruangan`) REFERENCES `ruangan` (`No_Ruangan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
