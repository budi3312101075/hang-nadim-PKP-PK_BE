-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 23 Agu 2024 pada 16.39
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hang_nadim`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `car`
--

CREATE TABLE `car` (
  `uuid` varchar(36) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `type` varchar(75) DEFAULT NULL,
  `photo` longtext,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `car`
--

INSERT INTO `car` (`uuid`, `name`, `type`, `photo`, `is_deleted`, `created_At`, `updated_At`) VALUES
('273e8c9f-dfd4-43ac-93c6-0eec66855e30', 'Zieger', 'Pemadam', '1722690381346ziegler.jpeg', 0, '2024-08-22 16:35:09', '2024-08-23 23:00:12'),
('9084a8b6-646a-4f73-9fbf-ed91efaaa630', 'Ambulance', 'Support', '1724429841184ambulance.jpg', 0, '2024-08-23 23:17:21', '2024-08-23 23:17:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `uuid` varchar(36) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `photo` longtext,
  `no_sk` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`uuid`, `name`, `position`, `photo`, `no_sk`, `is_deleted`, `created_At`, `updated_At`) VALUES
('1a07ce63-30d2-44fb-b65b-fc767adc9bee', 'Budi prayoga', 'head of oprational', '17226546046711722607278413budi.png', '12.010/DP-KM/IX/2019', 0, '2024-08-03 10:10:04', '2024-08-03 10:10:04'),
('7c7ec87e-776f-47e0-9406-2feb36f606be', 'Budi prayoga', 'head of oprational', '17226594363811722607278413budi.png', '12.010/DP-KM/IX/2019', 0, '2024-08-03 11:30:36', '2024-08-03 11:30:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `maintenance`
--

CREATE TABLE `maintenance` (
  `uuid` varchar(36) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` longtext,
  `date_in` datetime DEFAULT NULL,
  `date_out` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `id_car` varchar(36) DEFAULT NULL,
  `id_user` varchar(36) DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `maintenance`
--

INSERT INTO `maintenance` (`uuid`, `type`, `description`, `date_in`, `date_out`, `is_deleted`, `id_car`, `id_user`, `created_At`, `updated_At`) VALUES
('25fa93f0-843b-42ec-9a9b-782b437b250a', 'Ganti Sparepart', 'Ganti Nozzle', '2024-08-23 00:00:00', '2024-08-26 00:00:00', 0, '273e8c9f-dfd4-43ac-93c6-0eec66855e30', 'b07ac97f-7665-418a-b7d5-4064d90ddc19', '2024-08-23 18:58:08', '2024-08-23 18:59:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

CREATE TABLE `news` (
  `uuid` varchar(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `photo` longtext,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `id_user` varchar(36) DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `uuid` varchar(36) NOT NULL,
  `username` varchar(75) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `id_employee` varchar(36) DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`uuid`, `username`, `password`, `is_admin`, `is_deleted`, `id_employee`, `created_At`, `updated_At`) VALUES
('91e944eb-77c5-41db-a16b-53b698bdd8dd', 'admin', '$2b$10$ly24ZFup4LtD5o7fL.DqRO4RGJy4XCgCuKlw/CjBxusnGvrxhFmW2', 1, 0, '7c7ec87e-776f-47e0-9406-2feb36f606be', '2024-08-20 16:00:37', '2024-08-20 16:00:37'),
('b07ac97f-7665-418a-b7d5-4064d90ddc19', 'budi', '$2b$10$UamL3t0mPpv2zNn8Emp91.ZYZIs/2AhEetOUzDK1.uBEF/hG585SC', 0, 0, '1a07ce63-30d2-44fb-b65b-fc767adc9bee', '2024-08-03 10:15:41', '2024-08-03 10:15:41');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`uuid`);

--
-- Indeks untuk tabel `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`uuid`);

--
-- Indeks untuk tabel `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `fk_maintenance_car` (`id_car`),
  ADD KEY `fk_maintenance_user` (`id_user`);

--
-- Indeks untuk tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `fk_news_user` (`id_user`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `fk_user_employee` (`id_employee`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `fk_maintenance_car` FOREIGN KEY (`id_car`) REFERENCES `car` (`uuid`),
  ADD CONSTRAINT `fk_maintenance_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`uuid`);

--
-- Ketidakleluasaan untuk tabel `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`uuid`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_employee` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`uuid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
