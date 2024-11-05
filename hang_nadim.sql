-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Nov 2024 pada 14.50
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

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
  `uuid` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `type` varchar(75) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `photo` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data untuk tabel `car`
--

INSERT INTO `car` (`uuid`, `name`, `type`, `photo`, `is_deleted`, `created_At`, `updated_At`) VALUES
('109be085-71e0-4fb5-94f0-43bfc9f9a931', 'Ziegler 1', 'kendaraan utama', '1730006758884-ziegler.jpg', 0, '2024-10-27 12:25:58', '2024-10-27 12:25:58'),
('6748b770-7e87-4f80-bfbc-05aa7cf6d4f1', 'Ambulance', 'kendaraa pendukung', '1730009862534-foto ambulance.jpg', 0, '2024-10-27 13:17:42', '2024-10-27 13:17:42'),
('74564a5f-63b8-4f8f-bd7a-f4f5372eaa86', 'Ziegler 2', 'kendaraan utama', '1730009704724-ziegler.jpg', 0, '2024-10-27 13:15:04', '2024-10-27 13:15:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `position` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `division` varchar(70) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `photo` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `no_sk` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`uuid`, `name`, `position`, `division`, `photo`, `no_sk`, `is_deleted`, `created_At`, `updated_At`) VALUES
('0207b73f-70f1-4757-9552-0f201e8117bc', 'Mediyanto Safutra', 'Basic', 'Alpha', '1730631554421-MEDI-removebg-preview.png', 'CE 155-1722', 0, '2024-11-03 17:59:14', '2024-11-03 17:59:14'),
('0833fbb7-4a13-4880-b3bc-40a0e54c16ea', 'Suhendra', 'Basic', 'Charlie', '1730626790143-SUHENDRA-removebg-preview.png', 'CE 165-1722', 0, '2024-11-03 16:39:50', '2024-11-03 18:13:15'),
('084bba8e-37d8-4483-b10b-3e71b9a24cf3', 'Nurdiansyah', 'Basic', 'Bravo', '1730629173024-NURDIN-removebg-preview.png', 'CE 158-1722', 0, '2024-11-03 17:19:33', '2024-11-03 18:13:25'),
('15a0286f-e7fb-4d4b-8ba9-6ad0350aff27', 'M Azhari Lazuardi', 'Basic', 'Bravo', '1730628940015-ARDI-removebg-preview.png', 'CE 081-1722', 0, '2024-11-03 17:15:40', '2024-11-03 18:13:35'),
('1a07ce63-30d2-44fb-b65b-fc767adc9bee', 'Rotden', 'Team leader Bravo', 'Bravo', '1730388672813-WhatsApp_Image_2024-10-31_at_22.28.01-removebg-preview.png', 'PNS 012-1722', 0, '2024-08-03 10:10:04', '2024-11-03 18:13:46'),
('1dc7292e-fc2c-4358-9507-e4751a5c376a', 'Ansyori Fauzi', 'Squad Leader', 'Alpha', '1730631007642-ANSYORI_FAUZI-removebg-preview.png', 'PNS 128-1722', 0, '2024-11-03 17:50:10', '2024-11-03 17:50:10'),
('214a494b-2a5f-462e-b053-13bc3b31553e', 'Maizar', 'Team leader Alpha', 'Alpha', '1730388902615-WhatsApp_Image_2024-10-31_at_22.29.02-removebg-preview.png', 'PNS 011-1722', 0, '2024-10-31 22:35:04', '2024-11-03 16:12:28'),
('22eb7ad1-c01b-4b53-b4c0-d154a53092e8', 'Wahyu Sugandi', 'Squad Leader', 'Bravo', '1730628615066-WAHYU-removebg-preview.png', 'PNS 148-1722', 0, '2024-11-03 17:10:15', '2024-11-03 18:13:59'),
('239f55d3-8a86-434d-86e0-5cc055a32825', 'Saipul Anuar', 'Squad Leader', 'Charlie', '1730626261912-SAIPUL-removebg-preview.png', 'PNS 144-1722', 0, '2024-11-03 16:31:02', '2024-11-03 18:14:22'),
('23a23f4d-6f47-4955-898c-4bbd49a34369', 'Daniel Firmansyah', 'Basic', 'Charlie', '1730626900532-DANIL-removebg-preview.png', 'CE 149-1722', 0, '2024-11-03 16:41:40', '2024-11-03 18:14:29'),
('23eaf467-5ee3-4fb5-a14e-4c309c4e5915', 'Angga Pratama', 'Basic', 'Bravo', '1730628983706-ANGGA-removebg-preview.png', 'PNS 075-1722', 0, '2024-11-03 17:16:25', '2024-11-03 17:16:25'),
('27c1ad0f-e530-412b-b7da-714840f4b357', 'Suwartoyo', 'Basic', 'Charlie', '1730626673497-TOYO-removebg-preview.png', 'CE 166-1722', 0, '2024-11-03 16:37:53', '2024-11-03 16:37:53'),
('28d2a62a-d88f-41aa-8d4d-f26d2cb2e8b0', 'Agus Agustus', 'Squad Leader', 'Alpha', '1730631039092-AGUS_SUNDA-removebg-preview.png', 'PNS 127-1722', 0, '2024-11-03 17:50:39', '2024-11-03 17:50:39'),
('2a93ccd5-7593-4027-86b6-23ab8e1fec64', 'Aturan Situmeang', 'Squad Leader', 'Charlie', '1730625117530-MEANG-removebg-preview.png', 'PNS 131-1722', 0, '2024-11-03 16:12:00', '2024-11-03 16:12:00'),
('305a4086-e098-4195-9b0d-355787cbc347', 'Febri Harianto', 'Basic', 'Alpha', '1730631447192-FEBRI-removebg-preview.png', 'CE 150-1722', 0, '2024-11-03 17:57:27', '2024-11-03 17:57:27'),
('3427df69-c702-45ee-8777-72adb0de2b82', 'Ilham Prasetyo', 'Basic', 'Charlie', '1730626712419-ILHAM-removebg-preview.png', 'CE 153-1722', 0, '2024-11-03 16:38:34', '2024-11-03 16:38:34'),
('36e0a7c3-7963-4c60-8fa1-3abe21101ad9', 'Bambang Hartono', 'head of oprational', 'Alpha', '3_X_4_final-removebg-preview.png', '12.010/DP-KM/IX/2019', 1, '2024-08-26 12:41:02', '2024-10-27 12:02:20'),
('380e4109-987e-4dbe-96f3-8c7fcf39f3e6', 'Igif Pranata', 'Basic', 'Bravo', '1730629327310-IGIF-removebg-preview.png', 'CE 152-1722', 0, '2024-11-03 17:22:07', '2024-11-03 17:22:07'),
('382b80e7-bdf3-4f69-8829-f084000fba4a', 'Iqbal Fauzi', 'Basic', 'Alpha', '1730389134119-WhatsApp_Image_2024-10-27_at_13.45.19-removebg-preview.png', 'CE 1069-722', 1, '2024-10-27 13:45:55', '2024-10-31 22:41:28'),
('39aa42c3-5070-4ba3-86f8-8819acdc2706', 'Ryan Bastia Defrizal', 'Basic', 'Alpha', '1730631676858-RYAN-removebg-preview.png', 'CE 162-1722', 0, '2024-11-03 18:01:18', '2024-11-03 18:01:18'),
('3bd71d29-2320-42c4-9430-757f1781e848', 'Hertanto Wicaksono', 'head of oprational', 'Bravo', '3_X_4_final-removebg-preview.png', '12.010/DP-KM/IX/2019', 1, '2024-08-26 11:57:19', '2024-10-27 12:02:21'),
('440adad3-e068-4a2c-ad66-b057ed241e48', 'M Agus Chalim', 'Squad Leader', 'Alpha', '1730630957369-AGUS_CHALIM-removebg-preview.png', 'PNS 140-1722', 0, '2024-11-03 17:49:17', '2024-11-03 17:49:17'),
('49bfb37f-2cfd-41e4-adf0-8f91ffbad90d', 'Sufridanto Sitanggang', 'Basic', 'Charlie', '1730626753838-SUPRI-removebg-preview.png', 'CE 164-1722', 0, '2024-11-03 16:39:13', '2024-11-03 16:39:13'),
('523a95ac-ad91-4b31-b37f-2e4f6adca34c', 'Ansyory Al Fath', 'Squad Leader', 'Charlie', '1730626383080-ANSYORY-removebg-preview.png', 'PNS 129-1722', 0, '2024-11-03 16:33:04', '2024-11-03 16:33:04'),
('531cd39d-12cd-4517-ad38-408cd5000a22', 'M Ricky Setiawan', 'Basic', 'Alpha', '1730631640154-RICKY-removebg-preview.png', 'CE 157-1722', 0, '2024-11-03 18:00:40', '2024-11-03 18:00:40'),
('6732c5d1-0a7b-4f44-b50d-7366849719ec', 'Rayusman', 'Squad Leader', 'Charlie', '1730626214929-RAYUSMAN-removebg-preview.png', 'PNS 143-1722', 0, '2024-11-03 16:30:17', '2024-11-03 16:30:17'),
('67c5d690-90d3-4047-bf55-e04d606924ca', 'Rocky Pasaribu', 'Basic', 'Bravo', '1730632282506-ROCKY-removebg-preview.png', 'CE 161-1722', 0, '2024-11-03 17:22:49', '2024-11-03 18:11:22'),
('6a9b3000-172d-4a16-ae1a-71adf3722617', 'Hari Kusuma Atmaja', 'Basic', 'Charlie', '1730626509513-HARI-removebg-preview.png', 'CE 080-1722', 0, '2024-11-03 16:35:09', '2024-11-03 16:35:09'),
('75dc158b-e13c-4375-9956-bd4353022acb', 'Agung Wijayanto', 'Squad Leader', 'Charlie', '1730626341130-AGUNG-removebg-preview.png', 'PNS 126-1722', 0, '2024-11-03 16:32:22', '2024-11-03 16:32:22'),
('78ce6cbd-7057-4916-88dd-d99d7aabb35e', 'Sigit Gunadi', 'Basic', 'Alpha', '1730631409490-SIGIT-removebg-preview.png', 'CE 079-1722', 0, '2024-11-03 17:56:49', '2024-11-03 17:56:49'),
('7c32c45f-69f3-4b39-aac9-9c756ea23a7d', 'Dicky Darmawan', 'Basic', 'Charlie', '1730626452642-DICKY-removebg-preview.png', 'CE 078-1722', 0, '2024-11-03 16:34:14', '2024-11-03 16:34:14'),
('7c7ec87e-776f-47e0-9406-2feb36f606be', 'Iqbal Fauzi', 'Junior', 'Alpha', '1730389299949-WhatsApp_Image_2024-10-27_at_13.45.19-removebg-preview.png', 'CE-1069-1722', 0, '2024-08-03 11:30:36', '2024-11-01 15:41:03'),
('82b6923a-1a75-4069-b594-381db87fa887', 'Zeni Aris Setiawan', 'Basic', 'Bravo', '1730629232799-ZENI-removebg-preview.png', 'CE 169-1722', 0, '2024-11-03 17:20:35', '2024-11-03 17:20:35'),
('8bb5c6b0-a54b-4c25-aa8d-1f873e85f01a', 'Syahrul Ramadhan', 'Basic', 'Alpha', '1730631595325-SAHRUL-removebg-preview.png', 'CE 167-1722', 0, '2024-11-03 17:59:55', '2024-11-03 17:59:55'),
('8d46f956-3ebb-4b8f-a07d-608d4361b212', 'Jansen Nababan', 'Squad Leader', 'Alpha', '1730632044229-JANSEN-removebg-preview.png', 'PNS 136-1722', 0, '2024-11-03 17:47:38', '2024-11-03 18:07:24'),
('9219504a-9af1-4b48-b456-2eb1e43c16de', 'Setiyono', 'Squad Leader', 'Bravo', '1730628731304-STIYONO-removebg-preview.png', 'PNS 145-1722', 0, '2024-11-03 17:12:11', '2024-11-03 17:12:11'),
('944f6d9d-761b-44b5-a60b-5825dfcd3d98', 'Try Rezki Arya', 'Basic', 'Alpha', '1730631724266-ARYA-removebg-preview.png', 'CE 168-1722', 0, '2024-11-03 18:02:04', '2024-11-03 18:02:04'),
('952b88a4-bfcc-4320-9dba-81b99593ba89', 'Langgeng Argiansyah', 'Basic', 'Alpha', '1730631276968-LANGGENG-removebg-preview.png', 'CE 073-1722', 0, '2024-11-03 17:54:39', '2024-11-03 17:54:39'),
('960af65d-1ca4-4af9-843e-e5771a386681', 'Dedy Susmanto', 'Squad Leader', 'Bravo', '1730628841699-DEDY-removebg-preview.png', 'PNS 133-1722', 0, '2024-11-03 17:14:01', '2024-11-03 17:14:01'),
('967cbc81-da14-4fd9-9d11-6c03a5dd853a', 'Reza Fetrik', 'Basic', 'Charlie', '1730626641747-FETRIK-removebg-preview.png', 'CE 160-1722', 0, '2024-11-03 16:37:21', '2024-11-03 16:37:21'),
('a3a6e319-f9b4-46a1-817f-92272cc59677', 'Clement Sirait', 'Basic', 'Charlie', '1730626555348-CLEMENT-removebg-preview.png', 'CE 076-1722', 0, '2024-11-03 16:35:57', '2024-11-03 16:35:57'),
('a52f7c77-59b5-4cc5-b818-0a701e612789', 'Rahmat Tri Jayanto', 'Basic', 'Charlie', '1730626858841-RAHMAT-removebg-preview.png', 'CE 159-1722', 0, '2024-11-03 16:41:00', '2024-11-03 16:41:00'),
('ab8e519a-edd3-4f92-beff-e05ce694c28e', 'Taufik', 'Team leader Charlie', 'Charlie', '1730388836294-WhatsApp_Image_2024-10-31_at_22.28.39-removebg-preview.png', 'PNS 013-1722', 0, '2024-10-31 22:33:56', '2024-11-03 16:13:27'),
('acef19f1-acc2-4bb3-bab1-f537c4399aa6', 'Budi Priyanto', 'Squad Leader', 'Alpha', '1730631074323-BUDI-removebg-preview.png', 'PNS 132-1722', 0, '2024-11-03 17:51:14', '2024-11-03 17:51:14'),
('ad1b4524-6a13-43dd-8761-0560a9cd9636', 'tes', 'head of oprational', 'Charlie', '1729914201498-1729914037797-1729913681005-mobil.jpeg', '12.010/DP-KM/IX/2019', 1, '2024-10-26 10:43:21', '2024-10-27 12:02:24'),
('b614f198-e770-4659-8d5d-6b7d93f85588', 'Guntur Febrian Agan', 'Basic', 'Bravo', '1730629417296-GUNTUR-removebg-preview.png', 'CE 151-1722', 0, '2024-11-03 17:23:40', '2024-11-03 17:23:40'),
('ba075e5c-97e0-4d23-b5a1-2f52a8eee7e1', 'Abdul Rohim', 'Squad Leader', 'Bravo', '1730628769378-BOIM-removebg-preview.png', 'PNS 125-1722', 0, '2024-11-03 17:12:51', '2024-11-03 17:12:51'),
('c2a2edd6-8914-4723-b85d-c49504399a46', 'Jefri DH Sinaga', 'Squad Leader', 'Alpha', '1730632101559-JEFRI-removebg-preview.png', 'PNS 137-1722', 0, '2024-11-03 17:46:51', '2024-11-03 18:08:24'),
('c6e898eb-e929-4b09-b3d1-31bf284d86d6', 'Ahmad Fajar Shodiq', 'Basic', 'Bravo', '1730629035177-FAJAR-removebg-preview.png', 'CE 147-1722', 0, '2024-11-03 17:17:15', '2024-11-03 17:17:15'),
('c9949660-4dae-4e95-a254-66d15097c7af', 'Krismanto V Nababan', 'Basic', 'Alpha', '1730631362403-NABABAN-removebg-preview.png', 'CE 077-1722', 0, '2024-11-03 17:56:02', '2024-11-03 17:56:02'),
('d2bc443b-71b4-4cf1-890b-b320e68cc80e', 'Syaibir', 'Squad Leader', 'Charlie', '1730626151174-SYIBIR-removebg-preview.png', 'PNS 147-1722', 0, '2024-11-03 16:29:13', '2024-11-03 16:29:13'),
('d571a7ce-4850-4b2e-b0d5-2044d6f6ad4d', 'Suriyadi', 'Squad Leader', 'Charlie', '1730626301304-SURIYADI-removebg-preview.png', 'PNS 146-1722', 0, '2024-11-03 16:31:41', '2024-11-03 16:31:41'),
('d6af79bc-5df5-497d-974f-7f1177f3bc75', 'Pelita Wandri Sihaloho', 'Junior', 'Alpha', '1730631185851-PELITA-removebg-preview.png', 'PNS 103-1722', 0, '2024-11-03 17:53:05', '2024-11-03 17:53:05'),
('d7503b00-9d18-4e3f-b765-5543abf1e6f3', 'Ari Ardian Syaputra', 'Squad Leader', 'Bravo', '1730628885506-ARI_A-removebg-preview.png', 'CE 071-1722', 0, '2024-11-03 17:14:45', '2024-11-03 17:14:45'),
('dcab0354-5db4-4c75-a7be-454b29c7794f', 'Ansori Nurbuat', 'Basic', 'Bravo', '1730629281732-ANSORY_N-removebg-preview.png', 'CE 148-1722', 0, '2024-11-03 17:21:21', '2024-11-03 17:21:21'),
('df096a01-41e3-4251-a196-20d33738aab0', 'Junaidi', 'Squad Leader', 'Bravo', '1730628699557-JUNAIDI-removebg-preview.png', 'PNS 138-1722', 0, '2024-11-03 17:11:39', '2024-11-03 17:11:39'),
('e5d4559f-08f9-44de-b464-506a66b43ba1', 'Siktus Fendi Silaban', 'Basic', 'Bravo', '1730629114060-SIKTUS-removebg-preview.png', 'CE 163-1722', 0, '2024-11-03 17:18:34', '2024-11-03 17:18:34'),
('e9b1a374-ddf8-468a-8371-505224a4359e', 'Namli', 'Junior', 'Bravo', '1730628803341-NAMLI-removebg-preview.png', 'PNS 102-1722', 0, '2024-11-03 17:13:24', '2024-11-03 18:11:43'),
('ea0f8a50-0c71-40fb-82cf-100a3bbaff3b', 'Indra Agus Susanto', 'Squad Leader', 'Bravo', '1730628415662-INDRA_AGUS-removebg-preview.png', 'PNS 135-1722', 0, '2024-11-03 17:06:55', '2024-11-03 17:06:55'),
('eaf1ef8a-3b28-4203-918a-4556191f9e39', 'Budi prayoga', 'head of oprational', 'Alpha', '3_X_4_final-removebg-preview.png', '12.010/DP-KM/IX/2019', 1, '2024-08-27 20:30:05', '2024-10-27 12:02:26'),
('ed9f65da-8f1a-47a3-be2e-06e38e99d19d', 'Munawir Mafildan Manurung', 'Basic', 'Charlie', '1730626612230-NAWIR-removebg-preview.png', 'CE 074-1722', 0, '2024-11-03 16:36:52', '2024-11-03 16:36:52'),
('f36d4944-47d9-4e10-88a6-3c60dcf33afd', 'Juhalidi Iskandar', 'Basic', 'Charlie', '1730626822342-JUHALIDI-removebg-preview.png', 'CE 154-1722', 0, '2024-11-03 16:40:22', '2024-11-03 16:40:22'),
('fac12850-a9bc-42ea-8c90-6f96348e69d1', 'Asep Lugowo ', 'head of oprational', 'Alpha', '3_X_4_final-removebg-preview.png', '12.010/DP-KM/IX/2019', 1, '2024-08-26 12:47:39', '2024-10-27 12:02:27'),
('fbec6bf5-f0b3-4633-8328-a70c7c39b1f2', 'M Ari Wibowo', 'Basic', 'Alpha', '1730631500571-ARI_W-removebg-preview.png', 'CE 156-1722', 0, '2024-11-03 17:58:23', '2024-11-03 17:58:23'),
('fc3c3885-e4f2-41da-b3e2-dbcfbd3c5625', 'Muhammad Azhar', 'Squad Leader', 'Bravo', '1730628661103-AZHAR-removebg-preview.png', 'PNS 142-1722', 0, '2024-11-03 17:11:03', '2024-11-03 17:11:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `maintenance`
--

CREATE TABLE `maintenance` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_in` datetime DEFAULT NULL,
  `date_out` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `id_car` varchar(36) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `id_user` varchar(36) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data untuk tabel `maintenance`
--

INSERT INTO `maintenance` (`uuid`, `type`, `description`, `date_in`, `date_out`, `is_deleted`, `id_car`, `id_user`, `created_At`, `updated_At`) VALUES
('25e22493-c909-4973-86bc-05ec883ae786', 'pergantian ban mobil', 'pergantian ban mobil bagian depan', '2024-10-31 00:00:00', '2024-11-02 00:00:00', 1, '109be085-71e0-4fb5-94f0-43bfc9f9a931', '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-10-31 22:17:21', '2024-10-31 22:17:29'),
('2ae0febc-d0b1-4698-a27d-3e0ab3be3101', 'ganti oli', 'w', '2022-12-07 00:00:00', '2222-02-22 00:00:00', 1, '109be085-71e0-4fb5-94f0-43bfc9f9a931', '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-10-27 13:18:16', '2024-10-27 13:19:15'),
('33b85602-7458-462e-bc4f-da39bc539a25', 'ganti oli', 'b', '2024-10-28 00:00:00', '2024-10-31 00:00:00', 1, '109be085-71e0-4fb5-94f0-43bfc9f9a931', '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-10-27 12:28:10', '2024-10-27 13:14:06'),
('479352cc-ebf1-4893-a3dd-d6ff48bf38bf', 'pergantian ban mobil', 'pergantian ban mobil bagian depan', '2024-10-31 00:00:00', '2024-11-02 00:00:00', 0, '109be085-71e0-4fb5-94f0-43bfc9f9a931', '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-10-31 22:17:21', '2024-10-31 22:17:21'),
('56397752-2968-4564-9da3-7c65717c142e', 'ganti oli', 'ganti oli transmisi', '2024-11-01 00:00:00', '2024-11-03 00:00:00', 1, '6748b770-7e87-4f80-bfbc-05aa7cf6d4f1', '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-11-01 16:04:14', '2024-11-01 16:04:54'),
('d09eb85e-9da1-468d-aa6f-e4868fdc6ff7', 'ganti oli', 'ganti oli transmisi', '2024-11-01 00:00:00', '2024-11-03 00:00:00', 1, '6748b770-7e87-4f80-bfbc-05aa7cf6d4f1', 'eaed8965-f106-4abc-aae2-896157a5dd9c', '2024-11-01 15:42:49', '2024-11-01 15:43:21'),
('ee7fef20-3da5-4384-9553-2a7a7c847211', 'ganti oli', 'mzxnsjk', '2024-10-27 00:00:00', '2024-10-31 00:00:00', 1, '109be085-71e0-4fb5-94f0-43bfc9f9a931', '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-10-27 13:14:30', '2024-10-27 13:14:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

CREATE TABLE `news` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `id_user` varchar(36) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data untuk tabel `news`
--

INSERT INTO `news` (`uuid`, `title`, `content`, `is_deleted`, `id_user`, `created_At`, `updated_At`) VALUES
('54656a76-ec17-490c-8123-f36b82ca540c', 'Pesawat Jatuh', '<p><img src=\"https://images.bisnis.com/posts/2024/05/19/1766723/pesawat_latih_jatuh_di_bsd_-_radio_elshinta_-_bisniscom_bisnis_indonesia_1716113747.jpg\" alt=\"\" width=\"373\" height=\"249\" style=\"display: block; margin-left: auto; margin-right: auto;\"></p><p><br></p><p style=\"text-align: justify;\">Bisnis.com, JAKARTA — Pesawat latih iatuh di Lapangan Sunburst Bumi Serpong Damai (BSD) Tangerang Selatan, Banten pada hari ini, Minggu (19/5/2024). Juru Bicara Kementerian Perhubungan Adita Irawati menjelaskan bahwa pesawat latih yang jatuh di BSD merupakan tipe Cessna 2006 dengan nomor registrasi PK-IFP milik Indonesia Flying Club (Perkumpulan Penerbang Indonesia).<br>Berdasarkan keterangan Direktorat Jenderal Perhubungan Udara Kemenhub, pesawat itu jatuh di Lapangan Sunburst BSD, Tangerang Selatan sekitar pukul pukul 14.30 WIB, Minggu (19/5/2024). Adita juga menjelaskan bahwa dalam pesawat PK-IFP itu terdapat tiga orang, yakni satu orang penerbang, satu orang teknisi (engineer), dan satu orang penumpang.<br><br>Meskipun demikian, Kemenhub belum dapat menyampaikan informasi secara detail seperti penyebab jatuhnya pesawat karena masih dalam proses penelusuran. \"Penjelasan detail mengenai hal ini akan disampaikan lebih lanjut berkoordinasi dengan Tim KNKT [Komite Nasional Keselamatan Transportasi] dan Inspektor Penerbangan dari Ditjen Perhubungan Udara, serta Kepolisian setempat, \" ujar Adita dalam keterangan resminya, Minggu (19/5/2024).<br><br>Adapun, Kabid Humas Polda Metro Jaya Kombes POI Ade Ary Syam Indradi menjelaskan bahwa Polres Tangerang Selatan melakukan evakuasi terhadap tiga korban jiwa yang dinyatakan meninggal dunia di tempat. Selain mengevakuasi korban, menurutnya, Polres Tangerang Selatan juga tengah melakukan olah tempat kejadian perkara (TKP) untuk mengetahui penyebab jatuhnya<br>pesawat tersebut. Ade mengatakan bahwa total korban jiwa saat ini ada tiga orang. Dua orang masih berada di dalam pesawat dan satu orang korban jiwa lainnya sudah keluar dari pesawat. \"Korban tiga orang meninggal dunia, ada dua orang masih d dalam pesawat dan satu tergeletak di luar,\" tuturnya di Jakarta, Minggu (19/5/2024). (Sholahuddin A/ Ayyub\')</p>', 0, '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-08-26 12:05:36', '2024-08-26 12:05:36'),
('77f179da-ad50-4322-bbeb-022f9624e662', 'ttt', '<p>gshds</p>', 1, '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-10-27 13:20:03', '2024-10-27 13:21:31'),
('9c4b3e99-980e-4ba3-912f-8070b3e39117', 'ffbf ', '<p>dvdgdv&nbsp;<img src=\"https://tse4.mm.bing.net/th?id=OIP.0B34S6yMuAqhBRqw8y4gNAHaDV&amp;pid=Api&amp;P=0&amp;h=220\" alt=\"\" width=\"300\"></p>', 1, '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-10-27 13:21:25', '2024-10-27 13:21:34'),
('b11daed1-5ce8-46ea-8754-b3c97f6d2bc9', 'ttt', '<p>gshds</p>', 1, '91e944eb-77c5-41db-a16b-53b698bdd8dd', '2024-10-27 13:20:01', '2024-10-27 13:20:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `id_employee` varchar(36) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`uuid`, `username`, `password`, `is_admin`, `is_deleted`, `id_employee`, `created_At`, `updated_At`) VALUES
('6a30b654-60f3-44bb-bfab-828b67200458', 'Iqbal', '$2b$10$h09VtwPj6URtHxDXueuVZe0wfSIRdTylU70dJIolisQ4h4yvTdgzm', 1, 1, '382b80e7-bdf3-4f69-8829-f084000fba4a', '2024-10-27 13:47:51', '2024-10-31 22:41:28'),
('91e944eb-77c5-41db-a16b-53b698bdd8dd', 'admin', '$2b$10$ly24ZFup4LtD5o7fL.DqRO4RGJy4XCgCuKlw/CjBxusnGvrxhFmW2', 1, 0, '7c7ec87e-776f-47e0-9406-2feb36f606be', '2024-08-20 16:00:37', '2024-10-31 22:39:09'),
('b07ac97f-7665-418a-b7d5-4064d90ddc19', 'budi', '$2b$10$UamL3t0mPpv2zNn8Emp91.ZYZIs/2AhEetOUzDK1.uBEF/hG585SC', 0, 1, '1a07ce63-30d2-44fb-b65b-fc767adc9bee', '2024-08-03 10:15:41', '2024-10-31 22:49:23'),
('d39701ea-071d-4b96-84d1-34dece8fd22b', 'Karyawan', '$2b$10$cNMQYbTiXsF84Gb1g/ruL.eONlrVfll0VhVVnm/7u5SPLwU2qQd6S', 0, 1, 'ad1b4524-6a13-43dd-8761-0560a9cd9636', '2024-10-26 10:44:41', '2024-10-27 12:02:24'),
('da3f5c4a-867c-4480-84ae-21e9c9b9b79f', 'rotden', '$2b$10$MWHGO3Vb4g6IrjA0in8wW.IuVs5VDmxPuXv5NcozDcB.crWhwSIKi', 1, 0, '1a07ce63-30d2-44fb-b65b-fc767adc9bee', '2024-11-01 17:42:37', '2024-11-01 17:45:39'),
('eaed8965-f106-4abc-aae2-896157a5dd9c', 'maizar', '$2b$10$YfVNkS2mNlHdqI1RW/Motus3lEGD3OugXyJShLHsYNWzM.I6VWtnW', 0, 0, '214a494b-2a5f-462e-b053-13bc3b31553e', '2024-10-31 22:49:20', '2024-10-31 22:49:20');

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
