-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 26 Okt 2024 pada 03.48
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
('2c44047c-d1ab-401b-aaef-669531bb931d', 'Ambulance', 'Support', '3_X_4_final-removebg-preview.png', 0, '2024-08-26 12:09:01', '2024-08-26 12:21:15'),
('2c6993f3-4038-4fbf-9159-76dfb0cbe102', 'tes', 'tes', '1729914037797-1729913681005-mobil.jpeg', 0, '2024-10-26 10:40:37', '2024-10-26 10:40:37'),
('5e64bd2d-0461-40cc-9fdd-864fb7b5f9ae', 'Zieger 3', 'Pemadam', '1729914093646-1729914037797-1729913681005-mobil.jpeg', 0, '2024-08-26 13:00:24', '2024-10-26 10:41:33'),
('7224b6f4-463b-44bb-8e07-94ef0a02c540', 'Zieger 2', 'Pemadam', '1729914104185-images.jpeg', 0, '2024-08-26 12:25:44', '2024-10-26 10:41:44'),
('c38e8f7c-e350-4d04-be0d-c21fabb3babc', 'Zieger', 'Pemadam', '3_X_4_final-removebg-preview.png', 0, '2024-08-26 11:54:05', '2024-08-26 11:54:05'),
('d5d375b7-6fe6-4d65-ba82-846d114381d6', 'tes', 'tes', '3_X_4_final-removebg-preview.png', 0, '2024-08-26 12:57:35', '2024-08-26 12:57:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `uuid` varchar(36) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `division` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `photo` longtext,
  `no_sk` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`uuid`, `name`, `position`, `division`, `photo`, `no_sk`, `is_deleted`, `created_At`, `updated_At`) VALUES
('1a07ce63-30d2-44fb-b65b-fc767adc9bee', 'Budi prayoga', 'head of oprational', 'Alpha', '1729914245305-1729914104185-images.jpeg', '12.010/DP-KM/IX/2019', 0, '2024-08-03 10:10:04', '2024-10-26 10:44:05'),
('36e0a7c3-7963-4c60-8fa1-3abe21101ad9', 'Bambang Hartono', 'head of oprational', 'Alpha', '3_X_4_final-removebg-preview.png', '12.010/DP-KM/IX/2019', 0, '2024-08-26 12:41:02', '2024-08-26 12:41:02'),
('3bd71d29-2320-42c4-9430-757f1781e848', 'Hertanto Wicaksono', 'head of oprational', 'Bravo', '3_X_4_final-removebg-preview.png', '12.010/DP-KM/IX/2019', 0, '2024-08-26 11:57:19', '2024-08-26 12:46:07'),
('7c7ec87e-776f-47e0-9406-2feb36f606be', 'Susanto', 'head of oprational', 'Charlie', '1729914238584-1729914104185-images.jpeg', '12.010/DP-KM/IX/2019', 0, '2024-08-03 11:30:36', '2024-10-26 10:43:58'),
('ad1b4524-6a13-43dd-8761-0560a9cd9636', 'tes', 'head of oprational', 'Charlie', '1729914201498-1729914037797-1729913681005-mobil.jpeg', '12.010/DP-KM/IX/2019', 0, '2024-10-26 10:43:21', '2024-10-26 10:43:21'),
('eaf1ef8a-3b28-4203-918a-4556191f9e39', 'Budi prayoga', 'head of oprational', 'Alpha', '3_X_4_final-removebg-preview.png', '12.010/DP-KM/IX/2019', 0, '2024-08-27 20:30:05', '2024-08-27 20:30:46'),
('fac12850-a9bc-42ea-8c90-6f96348e69d1', 'Asep Lugowo ', 'head of oprational', 'Alpha', '3_X_4_final-removebg-preview.png', '12.010/DP-KM/IX/2019', 0, '2024-08-26 12:47:39', '2024-08-26 12:47:39');

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
('48c8caf0-1f94-4d87-a1d6-a2f8e73e2c2f', 'Maintenance', 'Ganti Ban dan Oli', '2024-08-26 00:00:00', '2024-08-27 00:00:00', 0, 'c38e8f7c-e350-4d04-be0d-c21fabb3babc', '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-08-26 12:50:50', '2024-08-26 12:50:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

CREATE TABLE `news` (
  `uuid` varchar(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `id_user` varchar(36) DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `news`
--

INSERT INTO `news` (`uuid`, `title`, `content`, `is_deleted`, `id_user`, `created_At`, `updated_At`) VALUES
('54656a76-ec17-490c-8123-f36b82ca540c', 'Pesawat Jatuh', '<p><img src=\"https://images.bisnis.com/posts/2024/05/19/1766723/pesawat_latih_jatuh_di_bsd_-_radio_elshinta_-_bisniscom_bisnis_indonesia_1716113747.jpg\" alt=\"\" width=\"373\" height=\"249\" style=\"display: block; margin-left: auto; margin-right: auto;\"></p><p><br></p><p style=\"text-align: justify;\">Bisnis.com, JAKARTA — Pesawat latih iatuh di Lapangan Sunburst Bumi Serpong Damai (BSD) Tangerang Selatan, Banten pada hari ini, Minggu (19/5/2024). Juru Bicara Kementerian Perhubungan Adita Irawati menjelaskan bahwa pesawat latih yang jatuh di BSD merupakan tipe Cessna 2006 dengan nomor registrasi PK-IFP milik Indonesia Flying Club (Perkumpulan Penerbang Indonesia).<br>Berdasarkan keterangan Direktorat Jenderal Perhubungan Udara Kemenhub, pesawat itu jatuh di Lapangan Sunburst BSD, Tangerang Selatan sekitar pukul pukul 14.30 WIB, Minggu (19/5/2024). Adita juga menjelaskan bahwa dalam pesawat PK-IFP itu terdapat tiga orang, yakni satu orang penerbang, satu orang teknisi (engineer), dan satu orang penumpang.<br><br>Meskipun demikian, Kemenhub belum dapat menyampaikan informasi secara detail seperti penyebab jatuhnya pesawat karena masih dalam proses penelusuran. \"Penjelasan detail mengenai hal ini akan disampaikan lebih lanjut berkoordinasi dengan Tim KNKT [Komite Nasional Keselamatan Transportasi] dan Inspektor Penerbangan dari Ditjen Perhubungan Udara, serta Kepolisian setempat, \" ujar Adita dalam keterangan resminya, Minggu (19/5/2024).<br><br>Adapun, Kabid Humas Polda Metro Jaya Kombes POI Ade Ary Syam Indradi menjelaskan bahwa Polres Tangerang Selatan melakukan evakuasi terhadap tiga korban jiwa yang dinyatakan meninggal dunia di tempat. Selain mengevakuasi korban, menurutnya, Polres Tangerang Selatan juga tengah melakukan olah tempat kejadian perkara (TKP) untuk mengetahui penyebab jatuhnya<br>pesawat tersebut. Ade mengatakan bahwa total korban jiwa saat ini ada tiga orang. Dua orang masih berada di dalam pesawat dan satu orang korban jiwa lainnya sudah keluar dari pesawat. \"Korban tiga orang meninggal dunia, ada dua orang masih d dalam pesawat dan satu tergeletak di luar,\" tuturnya di Jakarta, Minggu (19/5/2024). (Sholahuddin A/ Ayyub\')</p>', 0, '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-08-26 12:05:36', '2024-08-26 12:05:36');

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
('91e944eb-77c5-41db-a16b-53b698bdd8dd', 'admin', '$2b$10$ly24ZFup4LtD5o7fL.DqRO4RGJy4XCgCuKlw/CjBxusnGvrxhFmW2', 1, 0, '7c7ec87e-776f-47e0-9406-2feb36f606be', '2024-08-20 16:00:37', '2024-10-26 10:23:48'),
('b07ac97f-7665-418a-b7d5-4064d90ddc19', 'budi', '$2b$10$UamL3t0mPpv2zNn8Emp91.ZYZIs/2AhEetOUzDK1.uBEF/hG585SC', 0, 0, '1a07ce63-30d2-44fb-b65b-fc767adc9bee', '2024-08-03 10:15:41', '2024-08-24 23:39:16'),
('d39701ea-071d-4b96-84d1-34dece8fd22b', 'Karyawan', '$2b$10$cNMQYbTiXsF84Gb1g/ruL.eONlrVfll0VhVVnm/7u5SPLwU2qQd6S', 0, 0, 'ad1b4524-6a13-43dd-8761-0560a9cd9636', '2024-10-26 10:44:41', '2024-10-26 10:44:41');

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
