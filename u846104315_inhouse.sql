-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 21, 2021 at 09:59 AM
-- Server version: 10.4.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u846104315_inhouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentmeta`
--

CREATE TABLE `commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`ID`, `company`, `email`, `full_name`, `phone`, `note`) VALUES
(13, 'StartPress Solutions', 'nhutfs@gmail.com', 'Minh Nhựt', '0939935198', 'Test SMTP'),
(14, 'StartPress Solutions', 'nhutfs@gmail.com', 'Lê Hồng Minh Nhựt', '0939935198', 'Test SMTP'),
(15, 'Maxxservice', 'maxxservicevn@gmail.com', 'Nguyen The Nhan', '0903228182', 'Test'),
(16, 'Maxxservice', 'maxxservicevn@gmail.com', 'Nguyen The Nhan', '0903228182', 'Test'),
(17, 'Maxxservice', 'maxxservicevn@gmail.com', 'Nguyen The Nhan', '0903228182', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_02_25_012947_create_users_table', 1),
(2, '2021_02_25_021000_create_options_table', 1),
(3, '2021_02_25_021615_create_terms_table', 1),
(4, '2021_02_25_022029_create_termmeta_table', 1),
(5, '2021_02_25_022438_create_term_relationships_table', 1),
(6, '2021_02_25_023643_create_term_taxonomy_table', 1),
(7, '2021_02_25_025711_create_usermeta_table', 1),
(8, '2021_02_25_030031_create_posts_table', 1),
(9, '2021_02_25_031227_create_postmeta_table', 1),
(10, '2021_02_25_031453_create_comments_table', 1),
(11, '2021_02_25_032723_create_commentmeta_table', 1),
(12, '2021_04_07_133610_add_menu_order_to_posts_table', 1),
(13, '2021_04_17_133846_contact_form_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_name`, `option_value`) VALUES
(1, 'user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:18:\"Quản trị viên\";s:12:\"capabilities\";a:17:{s:10:\"list_users\";b:1;s:12:\"create_users\";b:1;s:10:\"edit_users\";b:1;s:12:\"delete_users\";b:1;s:12:\"upload_files\";b:1;s:10:\"edit_files\";b:1;s:17:\"manage_categories\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:17:\"Biên tập viên\";s:12:\"capabilities\";a:13:{s:12:\"upload_files\";b:1;s:10:\"edit_files\";b:1;s:17:\"manage_categories\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:10:\"Tác giả\";s:12:\"capabilities\";a:13:{s:12:\"upload_files\";b:1;s:10:\"edit_files\";b:1;s:17:\"manage_categories\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:17:\"Cộng tác viên\";s:12:\"capabilities\";a:0:{}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:23:\"Thành viên đăng ký\";s:12:\"capabilities\";a:0:{}}}'),
(2, 'site_name', 'IFA'),
(3, 'site_description', 'Đào tạo Inhouse theo yêu cầu doanh nghiệp'),
(4, 'site_url', 'http://daotaoinhouse-ifa.edu.vn'),
(5, 'posts_per_page', '10'),
(6, 'menu_locations', 'a:2:{s:12:\"primary-menu\";s:1:\"2\";s:11:\"footer-menu\";s:1:\"4\";}');

-- --------------------------------------------------------

--
-- Table structure for table `postmeta`
--

CREATE TABLE `postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postmeta`
--

INSERT INTO `postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'menu_item_type', 'custom'),
(2, 1, 'menu_item_object', 'custom'),
(3, 1, 'menu_item_parent', '0'),
(4, 1, 'menu_item_object_id', '1'),
(5, 1, 'menu_item_target', ''),
(6, 1, 'menu_item_url', '#gioi-thieu'),
(7, 2, 'menu_item_type', 'custom'),
(8, 2, 'menu_item_object', 'custom'),
(9, 2, 'menu_item_parent', '0'),
(10, 2, 'menu_item_object_id', '2'),
(11, 2, 'menu_item_target', ''),
(12, 2, 'menu_item_url', '#chuyen-gia'),
(13, 3, 'menu_item_type', 'custom'),
(14, 3, 'menu_item_object', 'custom'),
(15, 3, 'menu_item_parent', '0'),
(16, 3, 'menu_item_object_id', '3'),
(17, 3, 'menu_item_target', ''),
(18, 3, 'menu_item_url', '#quy-trinh-dao-tao'),
(19, 4, 'menu_item_type', 'custom'),
(20, 4, 'menu_item_object', 'custom'),
(21, 4, 'menu_item_parent', '0'),
(22, 4, 'menu_item_object_id', '4'),
(23, 4, 'menu_item_target', ''),
(24, 4, 'menu_item_url', '#chuong-trinh-dao-tao'),
(25, 5, 'menu_item_type', 'custom'),
(26, 5, 'menu_item_object', 'custom'),
(27, 5, 'menu_item_parent', '0'),
(28, 5, 'menu_item_object_id', '5'),
(29, 5, 'menu_item_target', ''),
(30, 5, 'menu_item_url', '#chuong-trinh-elearning'),
(31, 6, 'menu_item_type', 'custom'),
(32, 6, 'menu_item_object', 'custom'),
(33, 6, 'menu_item_parent', '0'),
(34, 6, 'menu_item_object_id', '6'),
(35, 6, 'menu_item_target', ''),
(36, 6, 'menu_item_url', '#lien-he'),
(41, 10, 'attached_file', '2021/04/post-thumbnail.png'),
(42, 10, 'attachment_metadata', 'a:4:{s:5:\"width\";i:372;s:6:\"height\";i:269;s:4:\"file\";s:26:\"2021/04/post-thumbnail.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"post-thumbnail-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:26:\"post-thumbnail-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(43, 11, 'attached_file', '2021/04/elearning-1.png'),
(44, 11, 'attachment_metadata', 'a:4:{s:5:\"width\";i:118;s:6:\"height\";i:113;s:4:\"file\";s:23:\"2021/04/elearning-1.png\";s:5:\"sizes\";a:0:{}}'),
(45, 12, 'attached_file', '2021/04/elearning-2.png'),
(46, 12, 'attachment_metadata', 'a:4:{s:5:\"width\";i:118;s:6:\"height\";i:122;s:4:\"file\";s:23:\"2021/04/elearning-2.png\";s:5:\"sizes\";a:0:{}}'),
(47, 13, 'attached_file', '2021/04/elearning-3.png'),
(48, 13, 'attachment_metadata', 'a:4:{s:5:\"width\";i:125;s:6:\"height\";i:126;s:4:\"file\";s:23:\"2021/04/elearning-3.png\";s:5:\"sizes\";a:0:{}}'),
(49, 14, 'attached_file', '2021/04/elearning-4.png'),
(50, 14, 'attachment_metadata', 'a:4:{s:5:\"width\";i:122;s:6:\"height\";i:118;s:4:\"file\";s:23:\"2021/04/elearning-4.png\";s:5:\"sizes\";a:0:{}}'),
(51, 15, 'attached_file', '2021/04/elearning-5.png'),
(52, 15, 'attachment_metadata', 'a:4:{s:5:\"width\";i:121;s:6:\"height\";i:107;s:4:\"file\";s:23:\"2021/04/elearning-5.png\";s:5:\"sizes\";a:0:{}}'),
(55, 34, 'study_program_title', 'CHƯƠNG TRÌNH ĐÀO TẠO QUẢN LÝ CẤP TRUNG'),
(56, 34, 'study_program_content', '<ul class=\"tox-checklist\">\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Ph&aacute;t triển năng lực quản l&yacute; cấp trung</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng quản l&yacute; đội ngũ v&agrave; ph&aacute;t triển đối t&aacute;c</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Ph&aacute;t triển v&agrave; quản l&yacute; nh&acirc;n t&agrave;i (Talent Management)</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Năng lực quản l&yacute; v&agrave; huấn luyện nh&acirc;n vi&ecirc;n</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Bộ 10 kỹ năng thiết yếu d&agrave;nh cho đội ngũ Quản l&yacute; cấp trung</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Lập kế hoạch, thực thi v&agrave; quản l&yacute;&nbsp;</span></li>\r\n</ul>'),
(57, 34, 'study_program_url', '#lien-he'),
(58, 34, 'study_program_gallery', 'a:1:{i:0;s:3:\"214\";}'),
(69, 39, 'study_program_title', 'CHƯƠNG TRÌNH ĐÀO TẠO PHÁT TRIỂN NĂNG LỰC LÃNH ĐẠO'),
(70, 39, 'study_program_content', '<ul class=\"tox-checklist\">\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Ph&aacute;t triển năng lực l&atilde;nh đạo thời kỳ VUCA</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">X&acirc;y dựng chiến lược c&ocirc;ng ty theo xu hướng chuyển đổi số 4.0</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">L&atilde;nh đạo chủ động</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">L&atilde;nh đạo tỉnh thức</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">L&atilde;nh đạo đột ph&aacute;</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Ph&aacute;t triển đội ngũ l&atilde;nh đạo kế thừa (Nextgen Leaders)</span></li>\r\n</ul>'),
(71, 39, 'study_program_url', '#lien-he'),
(72, 39, 'study_program_gallery', 'a:1:{i:0;s:3:\"202\";}'),
(73, 40, 'attached_file', '2021/04/certificate-1.png'),
(74, 40, 'attachment_metadata', 'a:4:{s:5:\"width\";i:596;s:6:\"height\";i:597;s:4:\"file\";s:25:\"2021/04/certificate-1.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"certificate-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"certificate-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(75, 41, 'attached_file', '2021/04/welcome-img.png'),
(76, 41, 'attachment_metadata', 'a:4:{s:5:\"width\";i:675;s:6:\"height\";i:499;s:4:\"file\";s:23:\"2021/04/welcome-img.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"welcome-img-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"welcome-img-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(77, 42, 'menu_item_type', 'custom'),
(78, 42, 'menu_item_object', 'custom'),
(79, 42, 'menu_item_parent', '0'),
(80, 42, 'menu_item_object_id', '42'),
(81, 42, 'menu_item_target', ''),
(82, 42, 'menu_item_url', '#'),
(83, 43, 'menu_item_type', 'custom'),
(84, 43, 'menu_item_object', 'custom'),
(85, 43, 'menu_item_parent', '0'),
(86, 43, 'menu_item_object_id', '43'),
(87, 43, 'menu_item_target', ''),
(88, 43, 'menu_item_url', '#'),
(89, 44, 'menu_item_type', 'custom'),
(90, 44, 'menu_item_object', 'custom'),
(91, 44, 'menu_item_parent', '0'),
(92, 44, 'menu_item_object_id', '44'),
(93, 44, 'menu_item_target', ''),
(94, 44, 'menu_item_url', '#'),
(95, 45, 'menu_item_type', 'custom'),
(96, 45, 'menu_item_object', 'custom'),
(97, 45, 'menu_item_parent', '0'),
(98, 45, 'menu_item_object_id', '45'),
(99, 45, 'menu_item_target', ''),
(100, 45, 'menu_item_url', '#'),
(101, 46, 'menu_item_type', 'custom'),
(102, 46, 'menu_item_object', 'custom'),
(103, 46, 'menu_item_parent', '0'),
(104, 46, 'menu_item_object_id', '46'),
(105, 46, 'menu_item_target', ''),
(106, 46, 'menu_item_url', '#'),
(110, 50, 'welcome_title', 'IFA - CHÌA KHÓA CHẠM THÀNH CÔNG <span>INHOUSE</span>'),
(111, 50, 'welcome_desc', 'IFA là viện đào phát triển doanh nghiệp chất lượng hàng đầu Việt Nam về nội dung chương trình, chất lượng giảng viên và sự chuyên nghiệp.'),
(112, 50, 'welcome_url', '#lien-he'),
(113, 50, 'welcome_img', '41'),
(114, 51, 'welcome_title', 'Tiêu đề'),
(115, 51, 'welcome_desc', 'Mô tả'),
(116, 51, 'welcome_url', '#'),
(117, 51, 'welcome_img', ''),
(118, 52, 'welcome_title', 'Tiêu đề cập nhật'),
(119, 52, 'welcome_desc', ''),
(120, 52, 'welcome_url', ''),
(121, 52, 'welcome_img', ''),
(122, 53, 'member_name', 'Thầy Hoàng Văn Hòa'),
(123, 53, 'member_desc', 'GIám đốc truyền thông tiếp thị Volkswagen tại thị trường Việt Nam'),
(124, 53, 'member_img', '180'),
(128, 55, 'attached_file', '2021/04/member.png'),
(129, 55, 'attachment_metadata', 'a:4:{s:5:\"width\";i:206;s:6:\"height\";i:206;s:4:\"file\";s:18:\"2021/04/member.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"member-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(130, 56, 'member_name', 'Thầy Trần Minh Lộc'),
(131, 56, 'member_desc', 'GĐ chi nhánh tập đoàn tư vấn nghiên cứu thị trường Gerson Lehrman Group'),
(132, 56, 'member_img', '181'),
(133, 57, 'member_name', 'Thầy Hà Tuấn Anh'),
(134, 57, 'member_desc', 'Chủ tịch Công Ty Qms Việt Nam; Ceo Qms Australia.'),
(135, 57, 'member_img', '182'),
(136, 58, 'study_program_title', 'CHƯƠNG TRÌNH ĐÀO TẠO BÁN HÀNG & DỊCH VỤ KHÁCH HÀNG'),
(137, 58, 'study_program_content', '<ul class=\"tox-checklist\">\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng b&aacute;n h&agrave;ng v&agrave; đ&agrave;m ph&aacute;n b&aacute;n h&agrave;ng</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Trở th&agrave;nh người b&aacute;n h&agrave;ng truyền cảm hứng</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Quản trị tr&atilde;i nghiệm kh&aacute;ch h&agrave;ng CEM</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng thiết lập v&agrave; kết nối kh&aacute;ch h&agrave;ng (Netwoking Skills)</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng b&aacute;n h&agrave;ng B2B v&agrave; quản l&yacute; Key Account</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng ph&aacute;t triển t&acirc;m l&yacute; giao tiếp ứng xử trong b&aacute;n h&agrave;ng.</span></li>\r\n</ul>'),
(138, 58, 'study_program_url', '#lien-he'),
(139, 58, 'study_program_gallery', 'a:1:{i:0;s:3:\"221\";}'),
(140, 59, 'study_program_title', 'CHƯƠNG TRÌNH ĐÀO TẠO QUẢN TRỊ NHÂN SỰ - L&D'),
(141, 59, 'study_program_content', '<ul class=\"tox-checklist\">\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Quản trị nh&acirc;n sự thời kỳ chuyển đổi số 4.0</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Chiến lược x&acirc;y dựng v&agrave; ph&aacute;t triển năng lực L&amp;D</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">X&acirc;y dựng từ điển năng lực quản l&yacute; chuẩn Quốc tế</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Đ&agrave;o tạo v&agrave; ph&aacute;t triển giảng vi&ecirc;n nội bộ (Train the Trainer)</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">X&acirc;y dựng hệ thống đ&agrave;o tạo doanh nghiệp hiệu quả</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng kết nối v&agrave; tư vấn nh&acirc;n sự cho doanh nghiệp.</span></li>\r\n</ul>'),
(142, 59, 'study_program_url', '#lien-he'),
(143, 59, 'study_program_gallery', 'a:1:{i:0;s:3:\"211\";}'),
(144, 60, 'header_hotline', '0942.993.979'),
(145, 60, 'header_facebook', 'https://www.facebook.com/vienquantrivataichinh'),
(146, 60, 'header_zalo', 'https://id.zalo.me/'),
(147, 60, 'header_youtube', 'https://www.youtube.com/'),
(148, 61, 'footer_desc', 'Hệ thống quản lý chất lượng được chứng nhận bởi Các tổ chức chứng nhận uy tín trên thế giới – IFA đã thực sự trở thành nhà cung cấp dịch vụ tư vấn quản lý và đào tạo chất lượng hàng đầu Việt Nam'),
(149, 61, 'footer_facebook', 'https://www.facebook.com/vienquantrivataichinh'),
(150, 61, 'footer_zalo', 'https://id.zalo.me/'),
(151, 61, 'footer_youtube', 'https://www.youtube.com/channel/UCwwh1wgTiSKqCExAKdNDezA'),
(152, 61, 'footer_address', '<b>Trụ sở chính:</b> 60 Nguyễn Văn Thủ, P.Đakao, Q.1, TP.HCM.<br><br> <b>VP Cần Thơ: </b> 24 Trần Văn Hoài, Q.Ninh Kiều, TP.Cần Thơ'),
(153, 61, 'footer_email', 'training@ifa.edu.vn <br> vpcantho@ifa.edu.vn'),
(154, 61, 'footer_phone', '0942.993.979 (TP.HCM)<br> 0942.997.111 (VP Cần Thơ)'),
(158, 63, 'attached_file', '2021/04/partner-1.png'),
(159, 63, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:79;s:4:\"file\";s:21:\"2021/04/partner-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"partner-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(160, 64, 'attached_file', '2021/04/partner-2.png'),
(161, 64, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:79;s:4:\"file\";s:21:\"2021/04/partner-2.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"partner-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(162, 65, 'attached_file', '2021/04/partner-3.png'),
(163, 65, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:78;s:4:\"file\";s:21:\"2021/04/partner-3.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"partner-3-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(164, 66, 'attached_file', '2021/04/partner-4.png'),
(165, 66, 'attachment_metadata', 'a:4:{s:5:\"width\";i:281;s:6:\"height\";i:56;s:4:\"file\";s:21:\"2021/04/partner-4.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"partner-4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(166, 67, 'attached_file', '2021/04/partner-5.png'),
(167, 67, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:78;s:4:\"file\";s:21:\"2021/04/partner-5.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"partner-5-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(168, 68, 'attached_file', '2021/04/partner-6.png'),
(169, 68, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:79;s:4:\"file\";s:21:\"2021/04/partner-6.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"partner-6-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(170, 69, 'attached_file', '2021/04/partner-7.png'),
(171, 69, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:78;s:4:\"file\";s:21:\"2021/04/partner-7.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"partner-7-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(172, 70, 'attached_file', '2021/04/partner-8.png'),
(173, 70, 'attachment_metadata', 'a:4:{s:5:\"width\";i:169;s:6:\"height\";i:68;s:4:\"file\";s:21:\"2021/04/partner-8.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"partner-8-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(174, 71, 'attached_file', '2021/04/partner-9.png'),
(175, 71, 'attachment_metadata', 'a:4:{s:5:\"width\";i:171;s:6:\"height\";i:69;s:4:\"file\";s:21:\"2021/04/partner-9.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"partner-9-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(176, 72, 'attached_file', '2021/04/partner-10.png'),
(177, 72, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:79;s:4:\"file\";s:22:\"2021/04/partner-10.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-10-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(178, 73, 'attached_file', '2021/04/partner-11.png'),
(179, 73, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:78;s:4:\"file\";s:22:\"2021/04/partner-11.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-11-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(180, 74, 'attached_file', '2021/04/partner-12.png'),
(181, 74, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:79;s:4:\"file\";s:22:\"2021/04/partner-12.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-12-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(182, 75, 'attached_file', '2021/04/partner-13.png'),
(183, 75, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:79;s:4:\"file\";s:22:\"2021/04/partner-13.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-13-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(184, 76, 'attached_file', '2021/04/partner-14.png'),
(185, 76, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:79;s:4:\"file\";s:22:\"2021/04/partner-14.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-14-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(186, 77, 'attached_file', '2021/04/partner-15.png'),
(187, 77, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:78;s:4:\"file\";s:22:\"2021/04/partner-15.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-15-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(188, 78, 'attached_file', '2021/04/partner-16.png'),
(189, 78, 'attachment_metadata', 'a:4:{s:5:\"width\";i:195;s:6:\"height\";i:79;s:4:\"file\";s:22:\"2021/04/partner-16.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-16-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(190, 79, 'attached_file', '2021/04/partner-17.png'),
(191, 79, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:79;s:4:\"file\";s:22:\"2021/04/partner-17.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-17-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(192, 80, 'attached_file', '2021/04/partner-18.png'),
(193, 80, 'attachment_metadata', 'a:4:{s:5:\"width\";i:191;s:6:\"height\";i:66;s:4:\"file\";s:22:\"2021/04/partner-18.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-18-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(194, 81, 'attached_file', '2021/04/partner-19.png'),
(195, 81, 'attachment_metadata', 'a:4:{s:5:\"width\";i:195;s:6:\"height\";i:79;s:4:\"file\";s:22:\"2021/04/partner-19.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-19-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(196, 82, 'attached_file', '2021/04/partner-20.png'),
(197, 82, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:78;s:4:\"file\";s:22:\"2021/04/partner-20.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"partner-20-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(198, 83, 'partner_name', 'Partner 1'),
(199, 83, 'partner_url', '#'),
(200, 83, 'partner_img', '63'),
(201, 84, 'partner_name', 'Bibica'),
(202, 84, 'partner_url', '#'),
(203, 84, 'partner_img', '64'),
(204, 85, 'partner_name', 'Partner 3'),
(205, 85, 'partner_url', '#'),
(206, 85, 'partner_img', '65'),
(207, 86, 'partner_name', 'Partner 4'),
(208, 86, 'partner_url', '#'),
(209, 86, 'partner_img', '66'),
(210, 87, 'partner_name', 'Dumex'),
(211, 87, 'partner_url', '#'),
(212, 87, 'partner_img', '67'),
(213, 88, 'partner_name', 'FPT'),
(214, 88, 'partner_url', '#'),
(215, 88, 'partner_img', '68'),
(216, 89, 'partner_name', 'Partner 7'),
(217, 89, 'partner_url', '#'),
(218, 89, 'partner_img', '69'),
(219, 90, 'partner_name', 'ICM'),
(220, 90, 'partner_url', '#'),
(221, 90, 'partner_img', '70'),
(222, 91, 'partner_name', 'Khai-Hoan-Land'),
(223, 91, 'partner_url', '#'),
(224, 91, 'partner_img', '71'),
(225, 92, 'certificate_title', 'CHỨNG CHỈ QUỐC TẾ'),
(226, 92, 'certificate_content', 'IFA hợp tác với Trường Đại học California, Dominguez Hills, USA (CSUDH) đưa vào Việt Nam các chương trình đào tạo cao cấp dành cho doanh nghiệp. Sau khi hoàn thành các chương trình đào tạo tại Việt Nam, kết quả học tập của học viên được gửi trực tiếp sang CSUDH để công nhận kết quả và cấp chứng chỉ. Ngoài ra, học viên có cơ hội được tham gia học tập và chia sẽ cùng những giáo sư, chuyên gia hàng đầu đến từ CSUDH, USA. Ngoài những chương trình đào tạo tại Việt Nam thì thông qua việc hợp tác này, Viện IFA tổ chức chương trình Doanh nhân học tập và tham quan tại CSUDH, hàng năm, Viện IFA tổ chức 5 kỳ học tập tại CSUDH vào các kỳ: March, May, July, September, November.'),
(227, 92, 'certificate_url', '#lien-he'),
(228, 93, 'certificate_title', 'Chứng chỉ quốc tế'),
(229, 93, 'certificate_content', 'Sứ mệnh của IFA trong mảng \"Custom Programs / Đào tạo In-house\" là: \"Thực hiện từng phần hoặc đầy đủ các chức năng và nhiệm vụ của \"Bộ Phận Đào Tạo\" tại doanh nghiệp\". Từ đó, góp phần phát triển và nâng cao năng lực chuyên môn, năng lực quản lý và lãnh đạo, nền tảng văn hóa và kỹ năng làm việc cho từng nhân viên, từng bộ phận và cho cả đội ngũ nhân sự của doanh nghiệp.'),
(230, 93, 'certificate_url', '#'),
(231, 92, 'certificate_gallery', 'a:2:{i:0;s:2:\"10\";i:1;s:2:\"41\";}'),
(232, 94, 'elearning_name', 'CHỦ ĐỘNG HỌC TẬP Giúp học viên tiếp cận kiến thức một cách chủ động, mọi lúc mọi nơi'),
(233, 94, 'elearning_url', '#lien-he'),
(234, 94, 'elearning_img', '15'),
(235, 95, 'elearning_name', 'One-by-one live Trải nghiệm con đường tiếp cận kiến thức thông qua tương tác trực tuyến'),
(236, 95, 'elearning_url', '#lien-he'),
(237, 95, 'elearning_img', '12'),
(238, 96, 'elearning_name', 'Cộng đồng học tập đươc xây dựng theo mô hình cộng đồng học tập built-in giúp học viên tương tác, hỗ trợ lẫn nhau'),
(239, 96, 'elearning_url', '#lien-he'),
(240, 96, 'elearning_img', '13'),
(241, 97, 'elearning_name', 'Kiểm tra kiến thức với các bài kiểm tra, bài thi đánh giá năng lực, giúp học viên thực nghiệm lại kiến thức'),
(242, 97, 'elearning_url', '#lien-he'),
(243, 97, 'elearning_img', '14'),
(244, 98, 'elearning_name', 'Kì thi thực tế  với việc thi trực tuyến mô phỏng như đang thi thật, kết quả được công bằng, chính xác.'),
(245, 98, 'elearning_url', '#lien-he'),
(246, 98, 'elearning_img', '15'),
(247, 99, 'elearning_object_title', 'Chương trình <span>Elearning <br> của IFA</span>'),
(248, 99, 'elearning_object_desc', 'Hoạt động E-Learning đã và đang là xu hướng không thể thiếu của hoạt động đào tạo, phát triển nguồn nhân lực của mọi doanh nghiệp và các tập đoàn lớn trên thế giới. Còn doanh nghiệp bạn thì đã có hay chưa?'),
(249, 100, 'elearning_object_title', 'Chương trình <span>Elearning <br> của IFA</span>'),
(250, 100, 'elearning_object_desc', ''),
(251, 102, 'timeline_object_title', 'Quy Trình Đào Tạo Inhouse'),
(252, 102, 'timeline_object_desc', 'Thiết kế chương trình đào tạo, biên soạn tài liệu giảng dạy với nội dung phù hợp nhằm đảm bảo tối ưu về mặt hiệu quả và tính kinh tế cho doanh nghiệp có nhu cầu.'),
(253, 101, 'timeline_name', 'Khảo sát, tư vấn, thiết lập & thống nhất mục tiêu đào tạo (TNA)'),
(254, 101, 'timeline_img', ''),
(255, 103, 'timeline_name', 'Phân tích đối tượng và thiết kế chương trình đào tạo inhouse'),
(256, 103, 'timeline_img', ''),
(257, 104, 'timeline_name', 'Biên soạn tài liệu, mẫu biểu, công cụ học tập và giảng dạy'),
(258, 104, 'timeline_img', ''),
(259, 105, 'timeline_name', 'Triển khai đào tạo inhouse'),
(260, 105, 'timeline_img', ''),
(261, 106, 'timeline_name', 'Đánh giá sau đào tạo'),
(262, 106, 'timeline_img', ''),
(265, 108, 'timeline_name', 'Chứng nhận tốt nghiệp'),
(266, 108, 'timeline_desc', 'Sau khi học viên hoàn thành chương trình học, tùy vào mỗi chương trình đào tạo inhouse khác nhau mà Viện IFA đưa ra các hình thức đánh giá sau khóa học khác nhau. Học viên đạt yêu cầu sẽ được cấp chứng chỉ của Viện Quản trị và Tài chính có giá trị'),
(267, 101, 'timeline_desc', 'Viện IFA kết hợp với doanh nghiệp có nhu cầu tiến hành khảo sát thu thập thông tin về kỳ vọng của lãnh đạo, về hiện trạng của đội ngũ hiện hữu. Sau đó, tiến hành phân tích, đánh giá và tư vấn trực tiếp nhằm xác lập mục tiêu đào tạo cụ thể, phù hợp với nhu cầu riêng và đặc thù của doanh nghiệp.'),
(268, 103, 'timeline_desc', 'Sau khi thiết lập được mục tiêu đào tạo cho chương trình đào tạo cụ thể ở Bước 1, đội ngũ chuyên gia của Viện IFA sẽ nghiên cứu, phân tích đối tượng tham dự và thiết kế nội dung chương trình đào tạo sao cho đảm bảo tối ưu về mặt hiệu quả và tính kinh tế cho doanh nghiệp có nhu cầu.'),
(269, 104, 'timeline_desc', 'Tiến hành biên soạn tài liệu, mẫu biểu, công cụ học tập, tình huống,… sử dụng để giảng dạy và cung cấp cho học viên. Song song với việc biên soạn, đội ngũ chuyên gia của Viện IFA cũng sẽ tiến hành phân bổ nội dung chương trình cũng như cách thức truyền tải.'),
(270, 105, 'timeline_desc', 'Sau khi đã thống nhất chương trình đào tào theo yêu cầu doanh nghiệp, Viện IFA sẽ phối hợp với doanh nghiệp tổ chức triển khai đào tạo đảm bảo theo đúng chương trình, giảng viên và sự kỳ vọng của khóa học.'),
(271, 106, 'timeline_desc', 'Thực hiện bài kiểm tra trực tiếp vào cuối khóa; Phỏng vấn trực tiếp từng học viên hay nhóm đại diện sau đào tạo; Đánh giá thông qua việc thực hiện đề tài / kế hoạch ứng dụng sau khóa học; Đánh giá trực tiếp sau thời gian đào tạo (1 tháng/ 3 tháng/ 6 tháng...)…'),
(272, 109, 'member_object_title', 'Đội ngũ <span>Chuyên gia</span>'),
(273, 109, 'member_object_desc', 'Thiết kế chương trình đào tạo, biên soạn tài liệu giảng dạy với nội dung phù hợp nhằm đảm bảo tối ưu về mặt hiệu quả và tính kinh tế cho doanh nghiệp có nhu cầu.'),
(274, 109, 'member_object_url', '#lien-he'),
(275, 110, 'why_object_title', 'Tại sao chọn <span>IFA</span>'),
(276, 110, 'why_object_desc', 'IFA từng bước khẳng định mình là một học viện đào phát triển doanh nghiệp chất lượng hàng đầu Việt Nam về nội dung chương trình, chất lượng giảng viên và sự chuyên nghiệp'),
(277, 111, 'why_name', 'Năm kinh nghiệm'),
(278, 111, 'why_desc', 'Sứ mệnh đưa Việt Nam từ một đất nước rất nghèo trở thành quốc gia có thu nhập trung bình'),
(279, 111, 'why_number', '15+'),
(280, 112, 'why_name', 'Doanh nghiệp tin tưởng'),
(281, 112, 'why_desc', 'Các doanh nghiệp lớn nhỏ trên mọi miền đất nước đều đang sử dụng dịch vụ của IFA cho doanh nghiệp mình'),
(282, 112, 'why_number', '500+'),
(283, 113, 'why_name', 'Chuyên gia hàng đầu'),
(284, 113, 'why_desc', 'Đội ngũ chuyên gia đến từ nhiều lĩnh vực, chuyên môn sâu, sẽ đáp ứng nhu cầu đào tạo Inhouse'),
(285, 113, 'why_number', '500+'),
(286, 114, 'why_name', 'Chương trình đào tạo'),
(287, 114, 'why_desc', 'Giáo trình độc quyền, tư liệu phong phú, bài giảng sinh động, ví dụ thực tế sẽ giúp học viên nắm bài tốt nhất'),
(288, 114, 'why_number', '100+'),
(289, 115, 'attached_file', '2021/04/why-us.png'),
(290, 115, 'attachment_metadata', 'a:4:{s:5:\"width\";i:547;s:6:\"height\";i:313;s:4:\"file\";s:18:\"2021/04/why-us.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"why-us-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"why-us-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(291, 110, 'why_object_img', '115'),
(292, 116, 'study_program_title', 'CHƯƠNG TRÌNH ĐÀO TẠO KỸ NĂNG MỀM PHÁT TRIỂN NHÂN VIÊN'),
(293, 116, 'study_program_content', '<ul class=\"tox-checklist\">\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng tạo động lực l&agrave;m việc</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng thuyết tr&igrave;nh v&agrave; b&aacute;o c&aacute;o</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng x&acirc;y dựng lộ tr&igrave;nh kế hoạch ph&aacute;t triển c&aacute; nh&acirc;n (IDP)</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">X&acirc;y dựng h&igrave;nh ảnh c&aacute; nh&acirc;n chuy&ecirc;n nghiệp</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng quản l&yacute; v&agrave; kiểm so&aacute;t xung đột</span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif;\">Kỹ năng tạo ảnh hưởng với đồng nghiệp</span></li>\r\n</ul>'),
(294, 116, 'study_program_url', '#lien-he'),
(295, 116, 'study_program_gallery', 'a:1:{i:0;s:3:\"217\";}'),
(296, 117, 'slide_desc', 'HỢP TÁC VỚI TRƯỜNG ĐẠI HỌC CÔNG LẬP CALIFORNIA, DOMINGUEZ HILLS, LOS ANGELES, HOA KỲ'),
(297, 117, 'slide_img', '200'),
(298, 118, 'slide_desc', 'HỢP TÁC VỚI TRƯỜNG ĐẠI HỌC CÔNG LẬP CALIFORNIA, DOMINGUEZ HILLS, LOS ANGELES, HOA KỲ'),
(299, 118, 'slide_img', '41'),
(300, 120, 'attached_file', '2021/04/cung-meo-tita-day-tre-ky-nang-song-1.png'),
(301, 120, 'attachment_metadata', 'a:4:{s:5:\"width\";i:380;s:6:\"height\";i:254;s:4:\"file\";s:48:\"2021/04/cung-meo-tita-day-tre-ky-nang-song-1.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"cung-meo-tita-day-tre-ky-nang-song-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"cung-meo-tita-day-tre-ky-nang-song-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(310, 123, 'attached_file', '2021/04/TruongMinhHanh.jpg'),
(311, 123, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1206;s:6:\"height\";i:1590;s:4:\"file\";s:26:\"2021/04/TruongMinhHanh.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"TruongMinhHanh-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:26:\"TruongMinhHanh-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:39:\"TruongMinhHanh-776.69433962264x1024.jpg\";s:5:\"width\";i:776;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(312, 124, 'attached_file', '2021/04/tran_minh_loc.jpg'),
(313, 124, 'attachment_metadata', 'a:4:{s:5:\"width\";i:249;s:6:\"height\";i:289;s:4:\"file\";s:25:\"2021/04/tran_minh_loc.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"tran_minh_loc-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(320, 128, 'attached_file', '2021/04/HoangVanHoa-172x235.jpg'),
(321, 128, 'attachment_metadata', 'a:4:{s:5:\"width\";i:170;s:6:\"height\";i:196;s:4:\"file\";s:31:\"2021/04/HoangVanHoa-172x235.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"HoangVanHoa-172x235-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(322, 129, 'attached_file', '2021/04/ifa-gs-charles-willson.png'),
(323, 129, 'attachment_metadata', 'a:4:{s:5:\"width\";i:162;s:6:\"height\";i:207;s:4:\"file\";s:34:\"2021/04/ifa-gs-charles-willson.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"ifa-gs-charles-willson-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(324, 130, 'attached_file', '2021/04/ifa-gs-thomas-jame-norman.png'),
(325, 130, 'attachment_metadata', 'a:4:{s:5:\"width\";i:183;s:6:\"height\";i:275;s:4:\"file\";s:37:\"2021/04/ifa-gs-thomas-jame-norman.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:37:\"ifa-gs-thomas-jame-norman-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(326, 131, 'attached_file', '2021/04/ifa-ths-ngo-kim-phuong.jpg'),
(327, 131, 'attachment_metadata', 'a:4:{s:5:\"width\";i:96;s:6:\"height\";i:122;s:4:\"file\";s:34:\"2021/04/ifa-ths-ngo-kim-phuong.jpg\";s:5:\"sizes\";a:0:{}}'),
(328, 132, 'attached_file', '2021/04/ifa-ths-nguyen-kien-tri.jpg'),
(329, 132, 'attachment_metadata', 'a:4:{s:5:\"width\";i:186;s:6:\"height\";i:270;s:4:\"file\";s:35:\"2021/04/ifa-ths-nguyen-kien-tri.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"ifa-ths-nguyen-kien-tri-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(330, 133, 'attached_file', '2021/04/ifa-ths-nguyen-xuan-hai.jpg'),
(331, 133, 'attachment_metadata', 'a:4:{s:5:\"width\";i:177;s:6:\"height\";i:192;s:4:\"file\";s:35:\"2021/04/ifa-ths-nguyen-xuan-hai.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"ifa-ths-nguyen-xuan-hai-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(332, 134, 'attached_file', '2021/04/tran_duc_tuan.png'),
(333, 134, 'attachment_metadata', 'a:4:{s:5:\"width\";i:137;s:6:\"height\";i:186;s:4:\"file\";s:25:\"2021/04/tran_duc_tuan.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"tran_duc_tuan-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(336, 136, 'attached_file', '2021/04/ts-cao-hao-thi-1.png'),
(337, 136, 'attachment_metadata', 'a:4:{s:5:\"width\";i:174;s:6:\"height\";i:196;s:4:\"file\";s:28:\"2021/04/ts-cao-hao-thi-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"ts-cao-hao-thi-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(338, 137, 'attached_file', '2021/04/ts-diep-gia-hoang-3.jpg'),
(339, 137, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1280;s:6:\"height\";i:800;s:4:\"file\";s:31:\"2021/04/ts-diep-gia-hoang-3.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:29:\"ts-diep-gia-hoang-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:29:\"ts-diep-gia-hoang-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:30:\"ts-diep-gia-hoang-1024x640.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:640;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(340, 138, 'attached_file', '2021/04/ifa-tien-si-ha-tuan-anh1.jpg'),
(341, 138, 'attachment_metadata', 'a:4:{s:5:\"width\";i:140;s:6:\"height\";i:160;s:4:\"file\";s:36:\"2021/04/ifa-tien-si-ha-tuan-anh1.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"ifa-tien-si-ha-tuan-anh1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(342, 139, 'attached_file', '2021/04/ifa-truongngocmaihuong-images.jpg'),
(343, 139, 'attachment_metadata', 'a:4:{s:5:\"width\";i:150;s:6:\"height\";i:150;s:4:\"file\";s:41:\"2021/04/ifa-truongngocmaihuong-images.jpg\";s:5:\"sizes\";a:0:{}}'),
(344, 140, 'attached_file', '2021/04/ifa-ts-le-tan-phuoc.jpg'),
(345, 140, 'attachment_metadata', 'a:4:{s:5:\"width\";i:194;s:6:\"height\";i:260;s:4:\"file\";s:31:\"2021/04/ifa-ts-le-tan-phuoc.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"ifa-ts-le-tan-phuoc-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(346, 141, 'attached_file', '2021/04/ifa-ts-nguyen-minh-nghi.jpg'),
(347, 141, 'attachment_metadata', 'a:4:{s:5:\"width\";i:140;s:6:\"height\";i:160;s:4:\"file\";s:35:\"2021/04/ifa-ts-nguyen-minh-nghi.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"ifa-ts-nguyen-minh-nghi-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(348, 142, 'attached_file', '2021/04/ifa-ts-nguyen-ngoc-duong.jpg'),
(349, 142, 'attachment_metadata', 'a:4:{s:5:\"width\";i:270;s:6:\"height\";i:187;s:4:\"file\";s:36:\"2021/04/ifa-ts-nguyen-ngoc-duong.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"ifa-ts-nguyen-ngoc-duong-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(350, 143, 'attached_file', '2021/04/ifa-ts-nguyen-phu-dong-ha.jpg'),
(351, 143, 'attachment_metadata', 'a:4:{s:5:\"width\";i:304;s:6:\"height\";i:345;s:4:\"file\";s:37:\"2021/04/ifa-ts-nguyen-phu-dong-ha.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:37:\"ifa-ts-nguyen-phu-dong-ha-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:37:\"ifa-ts-nguyen-phu-dong-ha-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(352, 145, 'attached_file', '2021/04/icon1_2.png'),
(353, 145, 'attachment_metadata', 'a:4:{s:5:\"width\";i:48;s:6:\"height\";i:51;s:4:\"file\";s:19:\"2021/04/icon1_2.png\";s:5:\"sizes\";a:0:{}}'),
(354, 144, 'member_name', 'Thầy Lê Thẩm Dương'),
(355, 144, 'member_desc', 'Trưởng khoa tài chính - trường ĐH Ngân Hàng TP.HCM'),
(356, 146, 'attached_file', '2021/04/IMG_9052.JPG'),
(357, 146, 'attachment_metadata', 'a:4:{s:5:\"width\";i:4032;s:6:\"height\";i:3024;s:4:\"file\";s:20:\"2021/04/IMG_9052.JPG\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9052-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_9052-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"IMG_9052-1024x768.JPG\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(360, 144, 'member_img', '179'),
(361, 138, 'attachment_image_alt', 'ifa-tien-si-ha-tuan-anh1'),
(363, 148, 'member_name', 'Thầy Lê Duy Quang'),
(364, 148, 'member_desc', 'Tiến Sĩ nghiên cứu Đại Học Tarlac'),
(365, 148, 'member_img', '184'),
(366, 149, 'attached_file', '2021/04/le-tham-duong.jfif'),
(367, 149, 'attachment_metadata', 'a:4:{s:5:\"width\";i:691;s:6:\"height\";i:461;s:4:\"file\";s:26:\"2021/04/le-tham-duong.jfif\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"le-tham-duong-150x150.jfif\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:26:\"le-tham-duong-300x300.jfif\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(368, 149, 'attachment_image_alt', 'le-tham-duong'),
(369, 150, 'attached_file', '2021/04/le-tham-duong.jpg'),
(370, 150, 'attachment_metadata', 'a:4:{s:5:\"width\";i:200;s:6:\"height\";i:200;s:4:\"file\";s:25:\"2021/04/le-tham-duong.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"le-tham-duong-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(371, 150, 'attachment_image_alt', 'le-tham-duong'),
(373, 151, 'member_name', 'Thầy Đoàn Đức Minh'),
(374, 151, 'member_desc', 'Nguyên GĐ quan hệ khách hàng và quản lý rủi ro tại nhân hàng Shinhan Việt Nam'),
(375, 151, 'member_img', '183'),
(376, 123, 'attachment_image_alt', 'TruongMinhHanh'),
(377, 128, 'attachment_image_alt', 'HoangVanHoa'),
(378, 152, 'member_name', 'Thầy Trương Minh Hạnh'),
(379, 152, 'member_desc', 'Chuyên gia huấn luyện về lãnh đạo, quản lý và kỹ năng mềm.'),
(380, 152, 'member_img', '123'),
(383, 155, 'member_name', 'Thầy Lại Văn Chương'),
(384, 155, 'member_desc', 'Trưởng khối phát triển kênh phân phối và huấn luyện - Vinamilk'),
(385, 155, 'member_img', '185'),
(389, 157, 'member_name', 'Tiến Sĩ Trần Huỳnh Thanh Nghị'),
(390, 157, 'member_desc', 'Trưởng Bộ Môn Luật Kinh Tế - Khoa Luật Kinh Tế Đại Học Kinh Tế Tp.Hcm'),
(391, 157, 'member_img', '186'),
(393, 160, 'attached_file', '2021/04/ifa-ts-nguyen-ngoc-duong-1.jpg'),
(394, 160, 'attachment_metadata', 'a:4:{s:5:\"width\";i:270;s:6:\"height\";i:187;s:4:\"file\";s:38:\"2021/04/ifa-ts-nguyen-ngoc-duong-1.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"ifa-ts-nguyen-ngoc-duong-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(395, 159, 'member_name', 'Thầy Nguyễn Ngọc Dương'),
(396, 159, 'member_desc', 'Nguyên giám đốc (CEO ) VẠN PHÁT HƯNG'),
(397, 159, 'member_img', '187'),
(398, 160, 'attachment_image_alt', 'ifa-ts-nguyen-ngoc-duong'),
(399, 136, 'attachment_image_alt', 'ts-cao-hao-thi'),
(400, 161, 'member_name', 'Thầy Cao Hào Thi'),
(401, 161, 'member_desc', 'Giảng Viên Chương Trình Fulbright Hoa Kỳ Tại Việt Nam'),
(402, 161, 'member_img', '188'),
(403, 133, 'attachment_image_alt', 'ifa-ths-nguyen-xuan-hai'),
(404, 143, 'attachment_image_alt', 'ifa-ts-nguyen-phu-dong-ha'),
(405, 162, 'member_name', 'Thầy Nguyễn Xuân Hải'),
(406, 162, 'member_desc', 'Giám đốc nhân sự (CPO) Tập đoàn VFC CORP.'),
(407, 162, 'member_img', '189'),
(408, 163, 'member_name', 'Chuyên gia Nguyễn Phú Đông Hà'),
(409, 163, 'member_desc', 'Chủ tịch quỹ EXPERT FUND'),
(410, 163, 'member_img', '143'),
(411, 129, 'attachment_image_alt', 'ifa-gs-charles-willson'),
(412, 130, 'attachment_image_alt', 'ifa-gs-thomas-jame-norman'),
(413, 164, 'member_name', 'Giáo sư Charles Wilson'),
(414, 164, 'member_desc', 'Giảng viên trường ĐẠI HỌC OREGON'),
(415, 164, 'member_img', '129'),
(416, 165, 'member_name', 'Prof. Thomas Norman'),
(417, 165, 'member_desc', 'Phó hiệu trưởng trường kinh doanh và chính sách công California, Los Angeles, USA'),
(418, 165, 'member_img', '192'),
(419, 167, 'attached_file', '2021/04/ifa-ts-nguyen-van-hiep.png'),
(420, 167, 'attachment_metadata', 'a:4:{s:5:\"width\";i:181;s:6:\"height\";i:188;s:4:\"file\";s:34:\"2021/04/ifa-ts-nguyen-van-hiep.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"ifa-ts-nguyen-van-hiep-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(421, 166, 'member_name', 'PGS TS Nguyễn Văn Hiệp'),
(422, 166, 'member_desc', 'Nguyên phó giám đốc sở xây dựngTP.HCM'),
(423, 166, 'member_img', '190'),
(424, 167, 'attachment_image_alt', 'ifa-ts-nguyen-van-hiep'),
(425, 131, 'attachment_image_alt', 'ifa-ths-ngo-kim-phuong'),
(426, 168, 'member_name', 'THẠC SĨ NGÔ KIM PHƯỢNG'),
(427, 168, 'member_desc', 'Giảng viên FullBright Việt Nam'),
(428, 168, 'member_img', '191'),
(429, 170, 'attached_file', '2021/04/ifa-ts-vu-thi-phuong.jpg'),
(430, 170, 'attachment_metadata', 'a:4:{s:5:\"width\";i:180;s:6:\"height\";i:182;s:4:\"file\";s:32:\"2021/04/ifa-ts-vu-thi-phuong.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"ifa-ts-vu-thi-phuong-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(431, 140, 'attachment_image_alt', 'ifa-ts-le-tan-phuoc'),
(432, 169, 'member_name', 'Tiến sĩ Vũ Thị Phượng'),
(433, 169, 'member_desc', 'GIảng viên trường Đại Học Kinh Tết TP.HCM'),
(434, 169, 'member_img', '198'),
(435, 171, 'member_name', 'Tiến Sĩ Nguyễn Tấn Phước'),
(436, 171, 'member_desc', 'GIảng viên ĐH Kinh Tế - CEO GREEN STAR COMPANY.'),
(437, 171, 'member_img', '196'),
(438, 170, 'attachment_image_alt', 'ifa-ts-vu-thi-phuong'),
(439, 139, 'attachment_image_alt', 'ifa-truongngocmaihuong-images'),
(440, 172, 'member_name', 'Thạc Sĩ Trương Ngọc Mai Hương'),
(441, 172, 'member_desc', 'Giám đốc kinh doanh công ty SAMQUA Việt Nam'),
(442, 172, 'member_img', '194'),
(443, 141, 'attachment_image_alt', 'ifa-ts-nguyen-minh-nghi'),
(444, 132, 'attachment_image_alt', 'ifa-ths-nguyen-kien-tri'),
(445, 134, 'attachment_image_alt', 'tran_duc_tuan'),
(446, 137, 'attachment_image_alt', 'ts-diep-gia-hoang'),
(447, 173, 'member_name', 'Tiến Sĩ Nguyễn Minh Nghị'),
(448, 173, 'member_desc', 'GS Đại học CONCORDIA (CANADA)'),
(449, 173, 'member_img', '195'),
(450, 174, 'member_name', 'Ông Nguyễn Kiên Trì'),
(451, 174, 'member_desc', 'CEO – Tổng giám đốc các công ty FUTUREONE'),
(452, 174, 'member_img', '193'),
(453, 175, 'member_name', 'Thầy Trần Đức Tuấn'),
(454, 175, 'member_desc', 'Chuyên gia huấn luyện và đào tạo đội ngũ'),
(455, 175, 'member_img', '197'),
(456, 176, 'member_name', 'Tiến sĩ Diệp Gia Hoàng'),
(457, 176, 'member_desc', 'Giảng viên trường ĐH UBIS (Thụy sỹ) ĐH Saint Petersburg State (Nga)'),
(458, 176, 'member_img', '199'),
(459, 177, 'attached_file', '2021/04/quy-trinh-dao-tao-inhouse.png'),
(460, 177, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:37:\"2021/04/quy-trinh-dao-tao-inhouse.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:37:\"quy trinh dao tao inhouse-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:37:\"quy trinh dao tao inhouse-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:38:\"quy trinh dao tao inhouse-1024x768.png\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(461, 178, 'thumbnail_id', '177'),
(462, 177, 'attachment_image_alt', 'quy trinh dao tao inhouse'),
(463, 179, 'attached_file', '2021/04/le-tham-duong.png'),
(464, 179, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:25:\"2021/04/le-tham-duong.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"le-tham-duong-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(465, 179, 'attachment_image_alt', 'le-tham-duong'),
(466, 180, 'attached_file', '2021/04/hoang-van-hoa.png'),
(467, 180, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:25:\"2021/04/hoang-van-hoa.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"hoang-van-hoa-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(468, 181, 'attached_file', '2021/04/tran-minh-loc.jfif'),
(469, 181, 'attachment_metadata', 'a:4:{s:5:\"width\";i:225;s:6:\"height\";i:225;s:4:\"file\";s:26:\"2021/04/tran-minh-loc.jfif\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"tran-minh-loc-150x150.jfif\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(470, 182, 'attached_file', '2021/04/ha-tuan-anh.png'),
(471, 182, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:23:\"2021/04/ha-tuan-anh.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"ha-tuan-anh-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(472, 180, 'attachment_image_alt', 'hoang-van-hoa'),
(473, 181, 'attachment_image_alt', 'tran-minh-loc'),
(474, 182, 'attachment_image_alt', 'ha-tuan-anh'),
(475, 183, 'attached_file', '2021/04/thay-doan-duc-minh.png'),
(476, 183, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:30:\"2021/04/thay-doan-duc-minh.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"thay-doan-duc-minh-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(477, 184, 'attached_file', '2021/04/thay-le-duy-quang.png'),
(478, 184, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:29:\"2021/04/thay-le-duy-quang.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:29:\"thay-le-duy-quang-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(479, 185, 'attached_file', '2021/04/thay-lai-van-chuong.png'),
(480, 185, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:31:\"2021/04/thay-lai-van-chuong.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"thay-lai-van-chuong-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(481, 186, 'attached_file', '2021/04/tien-si-tran-huynh-thanh-nghi.png'),
(482, 186, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:41:\"2021/04/tien-si-tran-huynh-thanh-nghi.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"tien-si-tran-huynh-thanh-nghi-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(483, 184, 'attachment_image_alt', 'thay-le-duy-quang'),
(484, 183, 'attachment_image_alt', 'thay-doan-duc-minh'),
(485, 185, 'attachment_image_alt', 'thay-lai-van-chuong'),
(486, 186, 'attachment_image_alt', 'tien-si-tran-huynh-thanh-nghi'),
(487, 187, 'attached_file', '2021/04/nguyen-ngoc-duong.png'),
(488, 187, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:29:\"2021/04/nguyen-ngoc-duong.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:29:\"nguyen-ngoc-duong-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(489, 188, 'attached_file', '2021/04/cao-hao-thi.png'),
(490, 188, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:23:\"2021/04/cao-hao-thi.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"cao-hao-thi-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(491, 189, 'attached_file', '2021/04/nguyen-xuan-hai.png'),
(492, 189, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:27:\"2021/04/nguyen-xuan-hai.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"nguyen-xuan-hai-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(493, 189, 'attachment_image_alt', 'nguyen-xuan-hai'),
(494, 188, 'attachment_image_alt', 'cao-hao-thi'),
(495, 187, 'attachment_image_alt', 'nguyen-ngoc-duong'),
(496, 190, 'attached_file', '2021/04/nguyen-van-hiep.png'),
(497, 190, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:27:\"2021/04/nguyen-van-hiep.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"nguyen-van-hiep-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(498, 191, 'attached_file', '2021/04/thac-si-ngo-kim-phuong.png'),
(499, 191, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:34:\"2021/04/thac-si-ngo-kim-phuong.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"thac-si-ngo-kim-phuong-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(500, 192, 'attached_file', '2021/04/thomas-norman.png'),
(501, 192, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:25:\"2021/04/thomas-norman.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"thomas norman-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(502, 192, 'attachment_image_alt', 'thomas norman'),
(503, 190, 'attachment_image_alt', 'nguyen-van-hiep'),
(504, 191, 'attachment_image_alt', 'thac-si-ngo-kim-phuong'),
(505, 193, 'attached_file', '2021/04/nguyen-kien-tri.png'),
(506, 193, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:27:\"2021/04/nguyen-kien-tri.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"nguyen-kien-tri-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}');
INSERT INTO `postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(507, 194, 'attached_file', '2021/04/thac-si-truong-ngoc-mai-huong.png'),
(508, 194, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:41:\"2021/04/thac-si-truong-ngoc-mai-huong.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"thac-si-truong-ngoc-mai-huong-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(509, 195, 'attached_file', '2021/04/tien-si-nguyen-minh-nghi.png'),
(510, 195, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:36:\"2021/04/tien-si-nguyen-minh-nghi.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"tien-si-nguyen-minh-nghi-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(511, 196, 'attached_file', '2021/04/tien-si-nguyen-tan-phuoc.png'),
(512, 196, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:36:\"2021/04/tien-si-nguyen-tan-phuoc.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"tien-si-nguyen-tan-phuoc-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(513, 197, 'attached_file', '2021/04/tran-duc-tuan.png'),
(514, 197, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:25:\"2021/04/tran-duc-tuan.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"tran-duc-tuan-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(515, 198, 'attached_file', '2021/04/vu-thi-phuong.png'),
(516, 198, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:25:\"2021/04/vu-thi-phuong.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"vu-thi-phuong-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(517, 199, 'attached_file', '2021/04/diep-gia-hoang.png'),
(518, 199, 'attachment_metadata', 'a:4:{s:5:\"width\";i:230;s:6:\"height\";i:230;s:4:\"file\";s:26:\"2021/04/diep-gia-hoang.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"diep-gia-hoang-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(519, 198, 'attachment_image_alt', 'vu-thi-phuong'),
(520, 196, 'attachment_image_alt', 'tien-si-nguyen-tan-phuoc'),
(521, 194, 'attachment_image_alt', 'thac-si-truong-ngoc-mai-huong'),
(522, 195, 'attachment_image_alt', 'tien-si-nguyen-minh-nghi'),
(523, 193, 'attachment_image_alt', 'nguyen-kien-tri'),
(524, 197, 'attachment_image_alt', 'tran-duc-tuan'),
(525, 199, 'attachment_image_alt', 'diep-gia-hoang'),
(526, 200, 'attached_file', '2021/04/chungnhan.png'),
(527, 200, 'attachment_metadata', 'a:4:{s:5:\"width\";i:777;s:6:\"height\";i:600;s:4:\"file\";s:21:\"2021/04/chungnhan.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"chungnhan-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"chungnhan-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(528, 201, 'attached_file', '2021/04/_DSC0774.JPG'),
(529, 201, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1811;s:6:\"height\";i:1080;s:4:\"file\";s:20:\"2021/04/_DSC0774.JPG\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"_DSC0774-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"_DSC0774-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:33:\"_DSC0774-1024x610.66813914964.JPG\";s:5:\"width\";i:1024;s:6:\"height\";i:610;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(530, 202, 'attached_file', '2021/04/DSC_0258.JPG'),
(531, 202, 'attachment_metadata', 'a:4:{s:5:\"width\";i:6000;s:6:\"height\";i:4000;s:4:\"file\";s:20:\"2021/04/DSC_0258.JPG\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"DSC_0258-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"DSC_0258-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:33:\"DSC_0258-1024x682.66666666667.JPG\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(532, 203, 'attached_file', '2021/04/DSC_0443.JPG'),
(533, 203, 'attachment_metadata', 'a:4:{s:5:\"width\";i:800;s:6:\"height\";i:536;s:4:\"file\";s:20:\"2021/04/DSC_0443.JPG\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"DSC_0443-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"DSC_0443-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(534, 204, 'attached_file', '2021/04/DSC_1110.JPG'),
(535, 204, 'attachment_metadata', 'a:4:{s:5:\"width\";i:800;s:6:\"height\";i:536;s:4:\"file\";s:20:\"2021/04/DSC_1110.JPG\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"DSC_1110-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"DSC_1110-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(536, 205, 'attached_file', '2021/04/DSC_1137.JPG'),
(537, 205, 'attachment_metadata', 'a:4:{s:5:\"width\";i:800;s:6:\"height\";i:536;s:4:\"file\";s:20:\"2021/04/DSC_1137.JPG\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"DSC_1137-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"DSC_1137-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(538, 206, 'attached_file', '2021/04/DSCF9152.JPG'),
(539, 206, 'attachment_metadata', 'a:4:{s:5:\"width\";i:3264;s:6:\"height\";i:2448;s:4:\"file\";s:20:\"2021/04/DSCF9152.JPG\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"DSCF9152-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"DSCF9152-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"DSCF9152-1024x768.JPG\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(540, 207, 'attached_file', '2021/04/ifa-hoi-thao-tai-ha-noi-79.JPG'),
(541, 207, 'attachment_metadata', 'a:4:{s:5:\"width\";i:800;s:6:\"height\";i:558;s:4:\"file\";s:38:\"2021/04/ifa-hoi-thao-tai-ha-noi-79.JPG\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:38:\"ifa-hoi-thao-tai-ha-noi-79-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:38:\"ifa-hoi-thao-tai-ha-noi-79-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(542, 208, 'attached_file', '2021/04/IMG_0011.jpg'),
(543, 208, 'attachment_metadata', 'a:4:{s:5:\"width\";i:2272;s:6:\"height\";i:1704;s:4:\"file\";s:20:\"2021/04/IMG_0011.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_0011-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_0011-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"IMG_0011-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(544, 209, 'attached_file', '2021/04/IMG_0020.jpg'),
(545, 209, 'attachment_metadata', 'a:4:{s:5:\"width\";i:2272;s:6:\"height\";i:1704;s:4:\"file\";s:20:\"2021/04/IMG_0020.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_0020-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_0020-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"IMG_0020-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(546, 210, 'attached_file', '2021/04/IMG_0021.JPG'),
(547, 210, 'attachment_metadata', 'a:4:{s:5:\"width\";i:4032;s:6:\"height\";i:3024;s:4:\"file\";s:20:\"2021/04/IMG_0021.JPG\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_0021-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_0021-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"IMG_0021-1024x768.JPG\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(548, 211, 'attached_file', '2021/04/DSCF0803.JPG'),
(549, 211, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1440;s:6:\"height\";i:1080;s:4:\"file\";s:20:\"2021/04/DSCF0803.JPG\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"DSCF0803-150x150.JPG\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"DSCF0803-300x300.JPG\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"DSCF0803-1024x768.JPG\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(550, 212, 'attached_file', '2021/04/IMG_2441.jpg'),
(551, 212, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_2441.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_2441-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_2441-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(552, 213, 'attached_file', '2021/04/IMG_1977.jpg'),
(553, 213, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_1977.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_1977-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_1977-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(554, 214, 'attached_file', '2021/04/IMG_1980.jpg'),
(555, 214, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_1980.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_1980-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_1980-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(556, 215, 'attached_file', '2021/04/IMG_2456.jpg'),
(557, 215, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_2456.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_2456-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_2456-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(558, 216, 'attached_file', '2021/04/IMG_2472.jpg'),
(559, 216, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_2472.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_2472-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_2472-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(560, 217, 'attached_file', '2021/04/IMG_3196.jpg'),
(561, 217, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_3196.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_3196-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_3196-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(562, 218, 'attached_file', '2021/04/IMG_3213.jpg'),
(563, 218, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_3213.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_3213-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_3213-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(564, 219, 'attached_file', '2021/04/IMG_3387.jpg'),
(565, 219, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_3387.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_3387-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_3387-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(566, 220, 'attached_file', '2021/04/IMG_3439.jpg'),
(567, 220, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_3439.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_3439-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_3439-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(568, 221, 'attached_file', '2021/04/IMG_3487.jpg'),
(569, 221, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:4:\"file\";s:20:\"2021/04/IMG_3487.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_3487-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_3487-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(576, 224, 'attached_file', '2021/04/chungnhan-1.png'),
(577, 224, 'attachment_metadata', 'a:4:{s:5:\"width\";i:320;s:6:\"height\";i:240;s:4:\"file\";s:23:\"2021/04/chungnhan-1.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"chungnhan-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"chungnhan-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(578, 225, 'attached_file', '2021/04/doanh-nhan-vo-ngoc-huyen.png'),
(579, 225, 'attachment_metadata', 'a:4:{s:5:\"width\";i:348;s:6:\"height\";i:521;s:4:\"file\";s:36:\"2021/04/doanh-nhan-vo-ngoc-huyen.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"doanh-nhan-vo-ngoc-huyen-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:36:\"doanh-nhan-vo-ngoc-huyen-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(580, 226, 'attached_file', '2021/04/doanh-nhan-vo-ngoc-huyen-2.jpg'),
(581, 226, 'attachment_metadata', 'a:4:{s:5:\"width\";i:640;s:6:\"height\";i:960;s:4:\"file\";s:38:\"2021/04/doanh-nhan-vo-ngoc-huyen-2.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:38:\"doanh-nhan-vo-ngoc-huyen-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:38:\"doanh-nhan-vo-ngoc-huyen-2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(582, 227, 'attached_file', '2021/04/doanh-nhan-vo-ngoc-huyen-3.jpg'),
(583, 227, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:639;s:4:\"file\";s:38:\"2021/04/doanh-nhan-vo-ngoc-huyen-3.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:38:\"doanh-nhan-vo-ngoc-huyen-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:38:\"doanh-nhan-vo-ngoc-huyen-3-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(584, 228, 'attached_file', '2021/04/le-trao-bang-tai-ifa.png'),
(585, 228, 'attachment_metadata', 'a:4:{s:5:\"width\";i:625;s:6:\"height\";i:437;s:4:\"file\";s:32:\"2021/04/le-trao-bang-tai-ifa.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"le-trao-bang-tai-ifa-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"le-trao-bang-tai-ifa-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(586, 229, 'attached_file', '2021/04/be-khanh-an.jpg'),
(587, 229, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:640;s:4:\"file\";s:23:\"2021/04/be-khanh-an.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"be-khanh-an-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"be-khanh-an-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(588, 230, 'attached_file', '2021/04/doanh-nhan-vo-ngoc-huyen.jpg'),
(589, 230, 'attachment_metadata', 'a:4:{s:5:\"width\";i:437;s:6:\"height\";i:960;s:4:\"file\";s:36:\"2021/04/doanh-nhan-vo-ngoc-huyen.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"doanh-nhan-vo-ngoc-huyen-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:36:\"doanh-nhan-vo-ngoc-huyen-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(590, 229, 'attachment_image_alt', 'be-khanh-an'),
(591, 225, 'attachment_image_alt', 'doanh-nhan-vo-ngoc-huyen'),
(592, 230, 'attachment_image_alt', 'doanh-nhan-vo-ngoc-huyen'),
(593, 228, 'attachment_image_alt', 'le-trao-bang-tai-ifa'),
(594, 226, 'attachment_image_alt', 'doanh-nhan-vo-ngoc-huyen-2'),
(595, 227, 'attachment_image_alt', 'doanh-nhan-vo-ngoc-huyen-3'),
(596, 231, 'thumbnail_id', '232'),
(597, 232, 'attached_file', '2021/04/doanh-nhan-dinh-vo-ngoc-huyen.png'),
(598, 232, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:41:\"2021/04/doanh-nhan-dinh-vo-ngoc-huyen.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"doanh-nhan-dinh-vo-ngoc-huyen-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:41:\"doanh-nhan-dinh-vo-ngoc-huyen-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:42:\"doanh-nhan-dinh-vo-ngoc-huyen-1024x768.png\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(599, 232, 'attachment_image_alt', 'doanh-nhan-dinh-vo-ngoc-huyen'),
(600, 233, 'attached_file', '2021/04/dao-tao-inhouse-giam-doc-tai-chinh-cfo-2.jpg'),
(601, 233, 'attachment_metadata', 'a:4:{s:5:\"width\";i:643;s:6:\"height\";i:427;s:4:\"file\";s:52:\"2021/04/dao-tao-inhouse-giam-doc-tai-chinh-cfo-2.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:52:\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:52:\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(602, 234, 'attached_file', '2021/04/dao-tao-inhouse-giam-doc-tai-chinh-cfo-3.jpg'),
(603, 234, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:800;s:4:\"file\";s:52:\"2021/04/dao-tao-inhouse-giam-doc-tai-chinh-cfo-3.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:52:\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:52:\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-3-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-3-1024x682.66666666667.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(604, 235, 'attached_file', '2021/04/do-viet-phuong-ke-toan-truong.jpg'),
(605, 235, 'attachment_metadata', 'a:4:{s:5:\"width\";i:800;s:6:\"height\";i:1200;s:4:\"file\";s:41:\"2021/04/do-viet-phuong-ke-toan-truong.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"do-viet-phuong-ke-toan-truong-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:41:\"do-viet-phuong-ke-toan-truong-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:54:\"do-viet-phuong-ke-toan-truong-682.66666666667x1024.jpg\";s:5:\"width\";i:682;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(606, 236, 'attached_file', '2021/04/ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa.jpg'),
(607, 236, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:800;s:4:\"file\";s:78:\"2021/04/ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:78:\"ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:78:\"ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:91:\"ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa-1024x682.66666666667.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(608, 237, 'attached_file', '2021/04/dao-tao-inhouse-giam-doc-tai-chinh-cfo.jpg'),
(609, 237, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:800;s:4:\"file\";s:50:\"2021/04/dao-tao-inhouse-giam-doc-tai-chinh-cfo.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:50:\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:50:\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-1024x682.66666666667.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(610, 234, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-3'),
(611, 233, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-2'),
(612, 235, 'attachment_image_alt', 'do-viet-phuong-ke-toan-truong'),
(613, 236, 'attachment_image_alt', 'ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa'),
(614, 237, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo'),
(615, 238, 'thumbnail_id', '237'),
(637, 249, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg.jpg'),
(638, 249, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:67:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(639, 250, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg.jpg'),
(640, 250, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:67:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(641, 251, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg.jpg'),
(642, 251, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:67:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(643, 252, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg.jpg'),
(644, 252, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:67:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(645, 253, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg.jpg'),
(646, 253, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:67:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(647, 254, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-7-min.jpg.jpg'),
(648, 254, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:67:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-7-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-7-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-7-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-7-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(649, 255, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg.jpg'),
(650, 255, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:67:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(651, 256, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg.jpg'),
(652, 256, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:67:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(653, 257, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg.jpg'),
(654, 257, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:68:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:68:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(655, 258, 'attached_file', '2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg.jpg'),
(656, 258, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:65:\"2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(657, 259, 'thumbnail_id', '253'),
(658, 258, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg'),
(659, 250, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg'),
(660, 251, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg'),
(661, 252, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg'),
(662, 253, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg'),
(663, 249, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg'),
(664, 255, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg'),
(665, 256, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg'),
(666, 257, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg'),
(675, 264, 'thumbnail_id', '265'),
(676, 265, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2-min.jpg.jpg'),
(677, 265, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:77:\"2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:77:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:77:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:78:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2-min.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(678, 266, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3-min.jpg.jpg'),
(679, 266, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:77:\"2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:77:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:77:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:78:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3-min.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(680, 267, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4-min.jpg.jpg'),
(681, 267, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:77:\"2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:77:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:77:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:78:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4-min.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(682, 268, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-min.jpg.jpg'),
(683, 268, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:75:\"2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-min.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-min.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-min.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:76:\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-min.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(684, 268, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep.jpg'),
(685, 265, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2.jpg'),
(686, 266, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3.jpg'),
(687, 267, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4.jpg'),
(688, 273, 'why_2_object_title', 'Chương trình  <span>Elearning của IFA</span>'),
(689, 273, 'why_2_object_desc', 'Hoạt động E-Learning đã và đang là xu hướng không thể thiếu của hoạt động đào tạo, phát triển nguồn nhân lực của mọi doanh nghiệp và các tập đoàn lớn trên thế giới. Còn doanh nghiệp bạn thì đã có hay chưa? Hãy'),
(690, 273, 'why_2_object_img', '232'),
(691, 273, 'why_2_object_text_1', 'One by one live'),
(692, 273, 'why_2_object_text_2', 'Trải nghiệm con đường tiếp cận kiến thức thông qua tương tác trực tuyến với chuyên gia đầu ngành'),
(693, 269, 'why_2_name', 'Học online'),
(694, 269, 'why_2_desc', 'Chủ động học tập giúp học viên tiếp cận kiến thức một cách chủ động, mọi lúc mọi nơi'),
(695, 270, 'why_2_name', 'Cộng đồng'),
(696, 270, 'why_2_desc', 'Mô hình cộng đồng học tập built-in giúp học viên tương tác, hỗ trợ lẫn nhau'),
(697, 271, 'why_2_name', 'Kiểm tra cuối khóa'),
(698, 271, 'why_2_desc', 'Kiểm tra kiến thức thông qua bài thi đánh giá năng lực, giúp thực nghiệm lại kiến thức đã học'),
(699, 272, 'why_2_name', 'Kỳ thi thực tế'),
(700, 272, 'why_2_desc', 'Thi trực tuyến mô phỏng như đang thi thật, kết quả được công bằng, chính xác.'),
(701, 274, 'attached_file', '2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-1.png'),
(702, 274, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:65:\"2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-1.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(703, 275, 'attached_file', '2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2.png'),
(704, 275, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:65:\"2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(705, 276, 'attached_file', '2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3.png'),
(706, 276, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:65:\"2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(707, 277, 'attached_file', '2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung.png'),
(708, 277, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:63:\"2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(709, 278, 'attached_file', '2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4.png'),
(710, 278, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:65:\"2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(711, 279, 'attached_file', '2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5.png'),
(712, 279, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:540;s:4:\"file\";s:65:\"2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(713, 280, 'attached_file', '2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6.png'),
(714, 280, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:65:\"2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:65:\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(715, 277, 'attachment_image_alt', NULL),
(716, 275, 'attachment_image_alt', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2'),
(717, 276, 'attachment_image_alt', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3'),
(718, 278, 'attachment_image_alt', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4'),
(719, 279, 'attachment_image_alt', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5'),
(720, 280, 'attachment_image_alt', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6'),
(721, 281, 'thumbnail_id', '280'),
(722, 282, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg.jpg'),
(723, 282, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:62:\"2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(724, 283, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg.jpg'),
(725, 283, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:676;s:4:\"file\";s:60:\"2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:60:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:60:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg-1024x576.85333333333.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(726, 284, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg.jpg'),
(727, 284, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:62:\"2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(728, 285, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg.jpg'),
(729, 285, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:62:\"2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(730, 286, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg.jpg'),
(731, 286, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:62:\"2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(732, 287, 'attached_file', '2021/04/team-building-pv-oil.jpg.jpg'),
(733, 287, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:899;s:4:\"file\";s:36:\"2021/04/team-building-pv-oil.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"team-building-pv-oil.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:36:\"team-building-pv-oil.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:49:\"team-building-pv-oil.jpg-1024x767.14666666667.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:767;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(734, 288, 'attached_file', '2021/04/team-building-pv-oil-1.jpg.jpg'),
(735, 288, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:38:\"2021/04/team-building-pv-oil-1.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:38:\"team-building-pv-oil-1.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:38:\"team-building-pv-oil-1.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:39:\"team-building-pv-oil-1.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(736, 289, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg.jpg');
INSERT INTO `postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(737, 289, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:62:\"2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(738, 290, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg.jpg'),
(739, 290, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:62:\"2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(740, 291, 'attached_file', '2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg.jpg'),
(741, 291, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:62:\"2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:62:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:63:\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(742, 292, 'attached_file', '2021/04/team-building-pv-oil-2.jpg.jpg'),
(743, 292, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:38:\"2021/04/team-building-pv-oil-2.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:38:\"team-building-pv-oil-2.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:38:\"team-building-pv-oil-2.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:39:\"team-building-pv-oil-2.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(744, 293, 'attached_file', '2021/04/team-building-pv-oil-3.jpg.jpg'),
(745, 293, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:38:\"2021/04/team-building-pv-oil-3.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:38:\"team-building-pv-oil-3.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:38:\"team-building-pv-oil-3.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:39:\"team-building-pv-oil-3.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(746, 294, 'attached_file', '2021/04/team-building-pv-oil-4.jpg.jpg'),
(747, 294, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:38:\"2021/04/team-building-pv-oil-4.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:38:\"team-building-pv-oil-4.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:38:\"team-building-pv-oil-4.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:39:\"team-building-pv-oil-4.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(748, 295, 'thumbnail_id', '291'),
(749, 289, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg'),
(750, 291, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg'),
(751, 283, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg'),
(752, 284, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg'),
(753, 285, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg'),
(754, 286, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg'),
(755, 282, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg'),
(756, 290, 'attachment_image_alt', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg'),
(757, 287, 'attachment_image_alt', 'team-building-pv-oil.jpg'),
(758, 288, 'attachment_image_alt', 'team-building-pv-oil-1.jpg'),
(759, 292, 'attachment_image_alt', 'team-building-pv-oil-2.jpg'),
(760, 293, 'attachment_image_alt', 'team-building-pv-oil-3.jpg'),
(761, 294, 'attachment_image_alt', 'team-building-pv-oil-4.jpg'),
(762, 296, 'attached_file', '2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg.jpg'),
(763, 296, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:69:\"2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:70:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(764, 297, 'attached_file', '2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg.jpg'),
(765, 297, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:69:\"2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:70:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(766, 298, 'attached_file', '2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-7.png.png'),
(767, 298, 'attachment_metadata', 'a:4:{s:5:\"width\";i:862;s:6:\"height\";i:403;s:4:\"file\";s:69:\"2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-7.png.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-7.png-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-7.png-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(768, 299, 'attached_file', '2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png.png'),
(769, 299, 'attachment_metadata', 'a:4:{s:5:\"width\";i:895;s:6:\"height\";i:574;s:4:\"file\";s:69:\"2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(770, 300, 'attached_file', '2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg.jpg'),
(771, 300, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:67:\"2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:67:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(772, 301, 'attached_file', '2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg.jpg'),
(773, 301, 'attachment_metadata', 'a:4:{s:5:\"width\";i:959;s:6:\"height\";i:720;s:4:\"file\";s:69:\"2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(774, 302, 'attached_file', '2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg.jpg'),
(775, 302, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:69:\"2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(776, 303, 'attached_file', '2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg.jpg'),
(777, 303, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:69:\"2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(778, 304, 'attached_file', '2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg.jpg'),
(779, 304, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:69:\"2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:69:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:70:\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(780, 300, 'attachment_image_alt', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg'),
(781, 301, 'attachment_image_alt', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg'),
(782, 302, 'attachment_image_alt', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg'),
(783, 303, 'attachment_image_alt', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg'),
(784, 304, 'attachment_image_alt', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg'),
(785, 296, 'attachment_image_alt', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg'),
(786, 297, 'attachment_image_alt', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg'),
(787, 298, 'attachment_image_alt', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-7.png'),
(788, 299, 'attachment_image_alt', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png'),
(789, 305, 'thumbnail_id', '296'),
(790, 306, 'attached_file', '2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg.jpg'),
(791, 306, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:75:\"2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:76:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(792, 307, 'attached_file', '2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg.jpg'),
(793, 307, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:75:\"2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:76:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(794, 308, 'attached_file', '2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg.jpg'),
(795, 308, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:75:\"2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:76:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(796, 309, 'attached_file', '2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-5.jpg.jpg'),
(797, 309, 'attachment_metadata', 'a:4:{s:5:\"width\";i:694;s:6:\"height\";i:316;s:4:\"file\";s:75:\"2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-5.jpg.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-5.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-5.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(798, 310, 'attached_file', '2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-6.jpg.jpg'),
(799, 310, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:75:\"2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-6.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-6.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-6.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:76:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-6.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(800, 311, 'attached_file', '2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg.jpg'),
(801, 311, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:73:\"2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:74:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(802, 312, 'attached_file', '2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg.jpg'),
(803, 312, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:75:\"2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:75:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:76:\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(804, 311, 'attachment_image_alt', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg'),
(805, 312, 'attachment_image_alt', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg'),
(806, 306, 'attachment_image_alt', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg'),
(807, 307, 'attachment_image_alt', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg'),
(808, 308, 'attachment_image_alt', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg'),
(809, 309, 'attachment_image_alt', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-5.jpg'),
(810, 313, 'thumbnail_id', '306'),
(811, 314, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg.jpg'),
(812, 314, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:70:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:70:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:70:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:71:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(813, 315, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg.jpg'),
(814, 315, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:72:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(815, 316, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg.jpg'),
(816, 316, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:72:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(817, 317, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg.jpg'),
(818, 317, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:72:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(819, 318, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-4.jpg.jpg'),
(820, 318, 'attachment_metadata', 'a:4:{s:5:\"width\";i:675;s:6:\"height\";i:900;s:4:\"file\";s:72:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-4.jpg.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-4.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-4.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(821, 314, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg'),
(822, 315, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg'),
(823, 316, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg'),
(824, 317, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg'),
(825, 318, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-4.jpg'),
(826, 319, 'thumbnail_id', '323'),
(827, 320, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg.jpg'),
(828, 320, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:72:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(829, 321, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg.jpg'),
(830, 321, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:72:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(831, 322, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-8.jpg.jpg'),
(832, 322, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:72:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-8.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-8.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-8.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-8.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(833, 323, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg.jpg'),
(834, 323, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:72:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(835, 324, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg.jpg'),
(836, 324, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:73:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:74:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(837, 325, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg.jpg'),
(838, 325, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:73:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:74:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(839, 326, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg.jpg'),
(840, 326, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:73:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:74:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(841, 327, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg.jpg'),
(842, 327, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:73:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:74:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(843, 328, 'attached_file', '2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg.jpg'),
(844, 328, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:72:\"2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:72:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:73:\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(845, 320, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg'),
(846, 323, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg'),
(847, 328, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg'),
(848, 321, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg'),
(849, 324, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg'),
(850, 325, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg'),
(851, 326, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg'),
(852, 327, 'attachment_image_alt', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg'),
(853, 329, 'attached_file', '2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1.jpg-min.jpg'),
(854, 329, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:84:\"2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1.jpg-min.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1.jpg-min-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1.jpg-min-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:85:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1.jpg-min-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(855, 330, 'attached_file', '2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2.jpg-min.jpg'),
(856, 330, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:84:\"2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2.jpg-min.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2.jpg-min-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2.jpg-min-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:85:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2.jpg-min-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(857, 331, 'attached_file', '2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3.jpg-min.jpg'),
(858, 331, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:84:\"2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3.jpg-min.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3.jpg-min-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3.jpg-min-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:85:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3.jpg-min-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(859, 332, 'attached_file', '2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4.jpg-min.jpg'),
(860, 332, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:84:\"2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4.jpg-min.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4.jpg-min-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4.jpg-min-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:85:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4.jpg-min-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(861, 333, 'attached_file', '2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5.jpg-min.jpg'),
(862, 333, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:84:\"2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5.jpg-min.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5.jpg-min-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5.jpg-min-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:85:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5.jpg-min-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(863, 334, 'attached_file', '2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6.jpg-min.jpg'),
(864, 334, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:84:\"2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6.jpg-min.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6.jpg-min-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6.jpg-min-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:85:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6.jpg-min-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(865, 335, 'attached_file', '2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7.jpg-min.jpg'),
(866, 335, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:84:\"2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7.jpg-min.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7.jpg-min-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:84:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7.jpg-min-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:85:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7.jpg-min-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(867, 336, 'attached_file', '2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min.jpg'),
(868, 336, 'attachment_metadata', 'a:4:{s:5:\"width\";i:1070;s:6:\"height\";i:900;s:4:\"file\";s:82:\"2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:82:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:82:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:95:\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min-1024x861.30841121495.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:861;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(869, 336, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min'),
(870, 329, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1'),
(871, 330, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2'),
(872, 331, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3'),
(873, 332, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4'),
(874, 333, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5'),
(875, 334, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6'),
(876, 335, 'attachment_image_alt', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7'),
(877, 337, 'thumbnail_id', '336'),
(878, 339, 'thumbnail_id', '341'),
(879, 340, 'attached_file', '2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1.jpg'),
(880, 340, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:66:\"2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(881, 341, 'attached_file', '2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2.jpg'),
(882, 341, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:66:\"2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(883, 342, 'attached_file', '2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3.jpg'),
(884, 342, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:66:\"2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(885, 343, 'attached_file', '2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4.jpg'),
(886, 343, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:66:\"2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(887, 344, 'attached_file', '2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-5.jpg'),
(888, 344, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:66:\"2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-5.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-5-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(889, 345, 'attached_file', '2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6.jpg'),
(890, 345, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:66:\"2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:66:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(891, 346, 'attached_file', '2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai.jpg'),
(892, 346, 'attachment_metadata', 'a:4:{s:5:\"width\";i:960;s:6:\"height\";i:720;s:4:\"file\";s:64:\"2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:64:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:64:\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}}'),
(893, 345, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6'),
(894, 346, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai'),
(895, 340, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1'),
(896, 341, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2'),
(897, 342, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3'),
(898, 343, 'attachment_image_alt', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4'),
(899, 344, 'attachment_image_alt', NULL),
(909, 353, 'study_program_title', 'CHƯƠNG TRÌNH ĐÀO TẠO KỸ NĂNG LÀM VIỆC CHUYÊN NGHIỆP'),
(910, 353, 'study_program_content', '<ul class=\"tox-checklist\">\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">Kỹ<span lang=\"VI\"> năng lập kế hoạch c&ocirc;ng việc</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">Kỹ<span lang=\"VI\"> năng tự thay đổi v&agrave; th&iacute;ch nghi</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">Kỹ<span lang=\"VI\"> năng tư duy v&agrave; giải quyết vấn đề&nbsp;</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">Kỹ<span lang=\"VI\"> năng quản l&yacute; thời gian hiệu quả</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">Kỹ<span lang=\"VI\"> năng l&agrave;m việc đội nh&oacute;m</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">Kỹ<span lang=\"VI\"> năng giao tiếp ứng xử nơi c&ocirc;ng sở</span></span></li>\r\n</ul>'),
(911, 353, 'study_program_url', '#lien-he'),
(912, 353, 'study_program_gallery', 'a:1:{i:0;s:3:\"300\";}'),
(913, 354, 'study_program_title', 'CHƯƠNG TRÌNH ĐÀO TẠO QUẢN TRỊ SẢN SUẤT HIỆN ĐẠI');
INSERT INTO `postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(914, 354, 'study_program_content', '<ul class=\"tox-checklist\">\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">Đ&agrave;o tạo<span lang=\"VI\">, tư vấn dự &aacute;n </span>Lean<span lang=\"VI\"> Sixsigma Black Belt</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">Quản<span lang=\"VI\"> l&yacute; sản xuất thời kỳ chuyển đổi số 4.0</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\"><span lang=\"VI\">07 c&ocirc;ng cụ kiểm so&aacute;t chất lượng QCC&nbsp;&nbsp;</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">06<span lang=\"VI\"> trụ cột d&agrave;nh cho nh&agrave; Quản l&yacute; sản xuất</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">X&acirc;y<span lang=\"VI\"> dựng tinh thần owership trong nh&agrave; m&aacute;y</span></span></li>\r\n<li><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\">Kỹ<span lang=\"VI\"> năng quản l&yacute; d&agrave;nh cho Quản l&yacute; nh&agrave; m&aacute;y</span></span></li>\r\n</ul>'),
(915, 354, 'study_program_url', '#lien-he'),
(916, 354, 'study_program_gallery', 'a:1:{i:0;s:3:\"256\";}'),
(917, 355, 'study_program_title', 'CHƯƠNG TRÌNH ĐÀO TẠO KỸ NĂNG QUẢN LÝ ĐỘI NGŨ'),
(918, 355, 'study_program_content', '<ul class=\"tox-checklist\">\r\n<li>Kỹ năng tư vấn, hướng dẫn nh&acirc;n vi&ecirc;n (Coaching on Job)</li>\r\n<li>Kỹ năng quản l&yacute; đội nh&oacute;m l&agrave;m việc hiệu quả</li>\r\n<li>Kỹ năng dẫn dắt đội ngũ v&agrave; tạo động lực</li>\r\n<li>Kỹ năng giao việc v&agrave; ph&acirc;n c&ocirc;ng ph&acirc;n nhiệm</li>\r\n<li>Kỹ năng tạo networking trong tổ chức</li>\r\n<li>Kỹ năng quản trị sự thay đổi v&agrave; kiểm so&aacute;t xung đột.</li>\r\n</ul>\r\n<p>&nbsp;</p>'),
(919, 355, 'study_program_url', '#lien-he'),
(920, 355, 'study_program_gallery', 'a:1:{i:0;s:3:\"280\";}'),
(921, 356, 'attached_file', '2021/05/PVD.png'),
(922, 356, 'attachment_metadata', 'a:4:{s:5:\"width\";i:127;s:6:\"height\";i:164;s:4:\"file\";s:15:\"2021/05/PVD.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"PVD-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(923, 357, 'partner_name', 'Petro VietNam'),
(924, 357, 'partner_url', '#'),
(925, 357, 'partner_img', '356'),
(926, 358, 'attached_file', '2021/05/VCB.png'),
(927, 358, 'attachment_metadata', 'a:4:{s:5:\"width\";i:258;s:6:\"height\";i:172;s:4:\"file\";s:15:\"2021/05/VCB.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"VCB-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(928, 359, 'attached_file', '2021/05/Vedan.png'),
(929, 359, 'attachment_metadata', 'a:4:{s:5:\"width\";i:270;s:6:\"height\";i:122;s:4:\"file\";s:17:\"2021/05/Vedan.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"Vedan-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(930, 360, 'attached_file', '2021/05/Viags.png'),
(931, 360, 'attachment_metadata', 'a:4:{s:5:\"width\";i:300;s:6:\"height\";i:168;s:4:\"file\";s:17:\"2021/05/Viags.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"Viags-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(932, 361, 'attached_file', '2021/05/Vietsovpetro.png'),
(933, 361, 'attachment_metadata', 'a:4:{s:5:\"width\";i:239;s:6:\"height\";i:156;s:4:\"file\";s:24:\"2021/05/Vietsovpetro.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"Vietsovpetro-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(934, 362, 'attached_file', '2021/05/Vinmec.png'),
(935, 362, 'attachment_metadata', 'a:4:{s:5:\"width\";i:218;s:6:\"height\";i:147;s:4:\"file\";s:18:\"2021/05/Vinmec.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"Vinmec-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(936, 363, 'attached_file', '2021/05/Zoetis.png'),
(937, 363, 'attachment_metadata', 'a:4:{s:5:\"width\";i:310;s:6:\"height\";i:137;s:4:\"file\";s:18:\"2021/05/Zoetis.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"Zoetis-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"Zoetis-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(938, 364, 'attached_file', '2021/05/Ricons.png'),
(939, 364, 'attachment_metadata', 'a:4:{s:5:\"width\";i:260;s:6:\"height\";i:116;s:4:\"file\";s:18:\"2021/05/Ricons.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"Ricons-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(940, 365, 'attached_file', '2021/05/Scancom.png'),
(941, 365, 'attachment_metadata', 'a:4:{s:5:\"width\";i:143;s:6:\"height\";i:143;s:4:\"file\";s:19:\"2021/05/Scancom.png\";s:5:\"sizes\";a:0:{}}'),
(942, 366, 'attached_file', '2021/05/Sheraton.png'),
(943, 366, 'attachment_metadata', 'a:4:{s:5:\"width\";i:252;s:6:\"height\";i:143;s:4:\"file\";s:20:\"2021/05/Sheraton.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"Sheraton-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(944, 367, 'attached_file', '2021/05/Shimizu.png'),
(945, 367, 'attachment_metadata', 'a:4:{s:5:\"width\";i:247;s:6:\"height\";i:162;s:4:\"file\";s:19:\"2021/05/Shimizu.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"Shimizu-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(946, 368, 'attached_file', '2021/05/Duoc-Hau-Giang.png'),
(947, 368, 'attachment_metadata', 'a:4:{s:5:\"width\";i:166;s:6:\"height\";i:166;s:4:\"file\";s:26:\"2021/05/Duoc-Hau-Giang.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"Duoc Hau Giang-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(948, 369, 'attached_file', '2021/05/EVN.png'),
(949, 369, 'attachment_metadata', 'a:4:{s:5:\"width\";i:333;s:6:\"height\";i:141;s:4:\"file\";s:15:\"2021/05/EVN.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"EVN-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:15:\"EVN-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(950, 370, 'attached_file', '2021/05/Khatoco.png'),
(951, 370, 'attachment_metadata', 'a:4:{s:5:\"width\";i:160;s:6:\"height\";i:189;s:4:\"file\";s:19:\"2021/05/Khatoco.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"Khatoco-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(952, 371, 'attached_file', '2021/05/Mavin.png'),
(953, 371, 'attachment_metadata', 'a:4:{s:5:\"width\";i:224;s:6:\"height\";i:135;s:4:\"file\";s:17:\"2021/05/Mavin.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"Mavin-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(954, 372, 'attached_file', '2021/05/PVGAS.png'),
(955, 372, 'attachment_metadata', 'a:4:{s:5:\"width\";i:118;s:6:\"height\";i:170;s:4:\"file\";s:17:\"2021/05/PVGAS.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"PVGAS-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(956, 373, 'attached_file', '2021/05/Refico.png'),
(957, 373, 'attachment_metadata', 'a:4:{s:5:\"width\";i:227;s:6:\"height\";i:127;s:4:\"file\";s:18:\"2021/05/Refico.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"Refico-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(958, 374, 'attached_file', '2021/05/Ricofeed.png'),
(959, 374, 'attachment_metadata', 'a:4:{s:5:\"width\";i:254;s:6:\"height\";i:170;s:4:\"file\";s:20:\"2021/05/Ricofeed.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"Ricofeed-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(960, 375, 'attached_file', '2021/05/USFeed.png'),
(961, 375, 'attachment_metadata', 'a:4:{s:5:\"width\";i:222;s:6:\"height\";i:160;s:4:\"file\";s:18:\"2021/05/USFeed.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"USFeed-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(962, 376, 'attached_file', '2021/05/CP-Group.png'),
(963, 376, 'attachment_metadata', 'a:4:{s:5:\"width\";i:224;s:6:\"height\";i:168;s:4:\"file\";s:20:\"2021/05/CP-Group.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"CP Group-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(964, 377, 'attached_file', '2021/05/Datxanh-Group.png'),
(965, 377, 'attachment_metadata', 'a:4:{s:5:\"width\";i:252;s:6:\"height\";i:127;s:4:\"file\";s:25:\"2021/05/Datxanh-Group.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"Datxanh Group-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(966, 378, 'attached_file', '2021/05/BIDV.png'),
(967, 378, 'attachment_metadata', 'a:4:{s:5:\"width\";i:247;s:6:\"height\";i:102;s:4:\"file\";s:16:\"2021/05/BIDV.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"BIDV-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(968, 379, 'attached_file', '2021/05/CJ.png'),
(969, 379, 'attachment_metadata', 'a:4:{s:5:\"width\";i:193;s:6:\"height\";i:204;s:4:\"file\";s:14:\"2021/05/CJ.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"CJ-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}}'),
(970, 359, 'attachment_image_alt', 'dao-tao-inhouse-vedan'),
(971, 380, 'partner_name', 'dao-tao-inhouse-Vedan'),
(972, 380, 'partner_url', '#'),
(973, 380, 'partner_img', '359'),
(974, 360, 'attachment_image_alt', 'dao-tao-inhouse-Viags'),
(975, 381, 'partner_name', 'dao-tao-inhouse-Viags'),
(976, 381, 'partner_url', '#'),
(977, 381, 'partner_img', '360'),
(978, 361, 'attachment_image_alt', 'dao-tao-inhouse-Vietsovpetro'),
(979, 382, 'partner_name', 'dao-tao-inhouse-Vietsovpetro'),
(980, 382, 'partner_url', '#'),
(981, 382, 'partner_img', '361'),
(982, 362, 'attachment_image_alt', 'dao-tao-inhouse-Vinmec'),
(983, 363, 'attachment_image_alt', 'dao-tao-inhouse-Zoetis'),
(984, 383, 'partner_name', 'Đào tạo inhouse VinMec'),
(985, 383, 'partner_url', '#'),
(986, 383, 'partner_img', '362'),
(987, 384, 'partner_name', 'Đào tạo inhouse Zoetis'),
(988, 384, 'partner_url', '#'),
(989, 384, 'partner_img', '363'),
(990, 364, 'attachment_image_alt', 'dao-tao-inhouse-Ricons'),
(991, 385, 'partner_name', 'dao-tao-inhouse-Ricons'),
(992, 385, 'partner_url', '#'),
(993, 385, 'partner_img', '364'),
(994, 365, 'attachment_image_alt', 'dao-tao-inhouse-Scancom'),
(995, 367, 'attachment_image_alt', 'dao-tao-inhouse-Shimizu'),
(996, 371, 'attachment_image_alt', 'dao-tao-inhouse-Mavin'),
(997, 386, 'partner_name', 'dao-tao-inhouse-Scancom'),
(998, 386, 'partner_url', '#'),
(999, 386, 'partner_img', '365'),
(1000, 387, 'partner_name', 'dao-tao-inhouse-Shimizu'),
(1001, 387, 'partner_url', '#'),
(1002, 387, 'partner_img', '367'),
(1003, 388, 'partner_name', 'dao-tao-inhouse-Mavin'),
(1004, 388, 'partner_url', '#'),
(1005, 388, 'partner_img', '371'),
(1006, 373, 'attachment_image_alt', 'dao-tao-inhouse-Refico'),
(1007, 374, 'attachment_image_alt', 'dao-tao-inhouse-Ricofeed'),
(1008, 375, 'attachment_image_alt', 'dao-tao-inhouse-USFeed'),
(1009, 389, 'partner_name', 'dao-tao-inhouse-Refico'),
(1010, 389, 'partner_url', '#'),
(1011, 389, 'partner_img', '373'),
(1012, 390, 'partner_name', 'dao-tao-inhouse-Ricofeed'),
(1013, 390, 'partner_url', '#'),
(1014, 390, 'partner_img', '374'),
(1015, 391, 'partner_name', 'dao-tao-inhouse-USFeed'),
(1016, 391, 'partner_url', '#'),
(1017, 391, 'partner_img', '375'),
(1018, 358, 'attachment_image_alt', 'dao-tao-inhouse-Vietcombank'),
(1019, 392, 'partner_name', 'dao-tao-inhouse-Vietcombank'),
(1020, 392, 'partner_url', '#'),
(1021, 392, 'partner_img', '358'),
(1022, 366, 'attachment_image_alt', 'dao-tao-inhouse-Sheraton'),
(1023, 368, 'attachment_image_alt', 'dao-tao-inhouse-DHG'),
(1024, 369, 'attachment_image_alt', 'dao-tao-inhouse-EVN'),
(1025, 370, 'attachment_image_alt', 'dao-tao-inhouse-Khatoco'),
(1026, 372, 'attachment_image_alt', 'dao-tao-inhouse-PVGAS'),
(1027, 393, 'partner_name', 'dao-tao-inhouse-PVGAS'),
(1028, 393, 'partner_url', '#'),
(1029, 393, 'partner_img', '372'),
(1030, 394, 'partner_name', 'dao-tao-inhouse-Khatoco'),
(1031, 394, 'partner_url', '#'),
(1032, 394, 'partner_img', '370'),
(1033, 395, 'partner_name', 'dao-tao-inhouse-EVN'),
(1034, 395, 'partner_url', '#'),
(1035, 395, 'partner_img', '369'),
(1036, 396, 'partner_name', 'dao-tao-inhouse-DHG'),
(1037, 396, 'partner_url', '#'),
(1038, 396, 'partner_img', '368'),
(1039, 397, 'partner_name', 'dao-tao-inhouse-Sheraton'),
(1040, 397, 'partner_url', '#'),
(1041, 397, 'partner_img', '366'),
(1042, 379, 'attachment_image_alt', 'dao-tao-inhouse-CJ'),
(1043, 377, 'attachment_image_alt', 'dao-tao-inhouse-DatxanhGroup'),
(1044, 378, 'attachment_image_alt', 'dao-tao-inhouse-BIDV'),
(1045, 398, 'partner_name', 'dao-tao-inhouse-BIDV'),
(1046, 398, 'partner_url', '#'),
(1047, 398, 'partner_img', '378'),
(1048, 399, 'partner_name', 'dao-tao-inhouse-DatXanhGroup'),
(1049, 399, 'partner_url', '#'),
(1050, 399, 'partner_img', '377'),
(1051, 400, 'partner_name', 'dao-tao-inhouse-CJ'),
(1052, 400, 'partner_url', '#'),
(1053, 400, 'partner_img', '379'),
(1054, 376, 'attachment_image_alt', 'dao-tao-inhouse-CP-Group'),
(1055, 401, 'partner_name', 'dao-tao-inhouse-CP-Group'),
(1056, 401, 'partner_url', '#'),
(1057, 401, 'partner_img', '376'),
(1058, 402, 'attached_file', '2021/05/kiemtra-1.png'),
(1059, 402, 'attachment_metadata', 'a:4:{s:5:\"width\";i:80;s:6:\"height\";i:80;s:4:\"file\";s:21:\"2021/05/kiemtra-1.png\";s:5:\"sizes\";a:0:{}}'),
(1060, 403, 'attached_file', '2021/05/network-1.png'),
(1061, 403, 'attachment_metadata', 'a:4:{s:5:\"width\";i:71;s:6:\"height\";i:70;s:4:\"file\";s:21:\"2021/05/network-1.png\";s:5:\"sizes\";a:0:{}}'),
(1062, 404, 'attached_file', '2021/05/online-learning-1.png'),
(1063, 404, 'attachment_metadata', 'a:4:{s:5:\"width\";i:81;s:6:\"height\";i:81;s:4:\"file\";s:29:\"2021/05/online-learning-1.png\";s:5:\"sizes\";a:0:{}}'),
(1064, 405, 'attached_file', '2021/05/thi-1.png'),
(1065, 405, 'attachment_metadata', 'a:4:{s:5:\"width\";i:81;s:6:\"height\";i:81;s:4:\"file\";s:17:\"2021/05/thi-1.png\";s:5:\"sizes\";a:0:{}}'),
(1066, 269, 'why_img', '404'),
(1067, 270, 'why_img', '403'),
(1068, 271, 'why_img', '402'),
(1069, 272, 'why_img', '405');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`ID`, `post_author`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_name`, `post_modified`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2021-04-17 16:21:36', '', 'Giới thiệu', '', 'publish', 'closed', 'closed', '', '2021-04-20 09:37:02', 1, 'menu_item', '', 0),
(2, 1, '2021-04-17 16:21:43', '', 'Chuyên gia', '', 'publish', 'closed', 'closed', '', '2021-04-20 09:37:02', 2, 'menu_item', '', 0),
(3, 1, '2021-04-17 16:21:51', '', 'Quy trình đào tạo', '', 'publish', 'closed', 'closed', '', '2021-04-20 09:37:02', 3, 'menu_item', '', 0),
(4, 1, '2021-04-17 16:22:00', '', 'Chương trình đào tạo', '', 'publish', 'closed', 'closed', '', '2021-04-20 09:37:02', 4, 'menu_item', '', 0),
(5, 1, '2021-04-17 16:22:21', '', 'Chương trình Elearning', '', 'publish', 'closed', 'closed', '', '2021-04-20 09:37:02', 5, 'menu_item', '', 0),
(6, 1, '2021-04-17 16:22:28', '', 'Liên hệ', '', 'publish', 'closed', 'closed', '', '2021-04-20 09:37:02', 6, 'menu_item', '', 0),
(10, 1, '2021-04-18 01:41:12', '', 'post-thumbnail', '', 'inherit', 'open', 'closed', 'post-thumbnail', '2021-04-18 01:41:12', 0, 'attachment', 'image/png', 0),
(11, 1, '2021-04-18 02:58:36', '', 'elearning-1', '', 'inherit', 'open', 'closed', 'elearning-1', '2021-04-18 02:58:36', 0, 'attachment', 'image/png', 0),
(12, 1, '2021-04-18 02:58:36', '', 'elearning-2', '', 'inherit', 'open', 'closed', 'elearning-2', '2021-04-18 02:58:36', 0, 'attachment', 'image/png', 0),
(13, 1, '2021-04-18 02:58:36', '', 'elearning-3', '', 'inherit', 'open', 'closed', 'elearning-3', '2021-04-18 02:58:36', 0, 'attachment', 'image/png', 0),
(14, 1, '2021-04-18 02:58:36', '', 'elearning-4', '', 'inherit', 'open', 'closed', 'elearning-4', '2021-04-18 02:58:36', 0, 'attachment', 'image/png', 0),
(15, 1, '2021-04-18 02:58:36', '', 'elearning-5', '', 'inherit', 'open', 'closed', 'elearning-5', '2021-04-18 02:58:36', 0, 'attachment', 'image/png', 0),
(34, 1, '2021-04-18 04:01:48', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-06 14:02:41', 2, 'study_program', '', 0),
(39, 1, '2021-04-18 07:39:46', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-06 14:02:41', 1, 'study_program', '', 0),
(40, 1, '2021-04-18 07:47:43', '', 'certificate-1', '', 'inherit', 'open', 'closed', 'certificate-1', '2021-04-18 07:47:43', 0, 'attachment', 'image/png', 0),
(41, 1, '2021-04-18 07:47:58', '', 'welcome-img', '', 'inherit', 'open', 'closed', 'welcome-img', '2021-04-18 07:47:58', 0, 'attachment', 'image/png', 0),
(42, 1, '2021-04-18 07:49:56', '', 'Giới thiệu', '', 'publish', 'closed', 'closed', '', '2021-04-18 07:50:26', 1, 'menu_item', '', 0),
(43, 1, '2021-04-18 07:50:04', '', 'Chuyên gia', '', 'publish', 'closed', 'closed', '', '2021-04-18 07:50:26', 2, 'menu_item', '', 0),
(44, 1, '2021-04-18 07:50:11', '', 'Quy trình đào tạo', '', 'publish', 'closed', 'closed', '', '2021-04-18 07:50:26', 3, 'menu_item', '', 0),
(45, 1, '2021-04-18 07:50:17', '', 'Chương trình đào tạo', '', 'publish', 'closed', 'closed', '', '2021-04-18 07:50:26', 4, 'menu_item', '', 0),
(46, 1, '2021-04-18 07:50:24', '', 'Chương trình Elearning', '', 'publish', 'closed', 'closed', '', '2021-04-18 07:50:26', 5, 'menu_item', '', 0),
(50, 1, '2021-04-18 09:03:06', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-18 09:03:06', 0, 'welcome', '', 0),
(51, 1, '2021-04-18 09:03:25', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-18 09:03:25', 0, 'welcome', '', 0),
(52, 1, '2021-04-18 09:03:46', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-18 09:03:46', 0, 'welcome', '', 0),
(53, 1, '2021-04-18 10:24:51', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 15:14:50', 2, 'member', '', 0),
(55, 1, '2021-04-18 10:47:14', '', 'member', '', 'inherit', 'open', 'closed', 'member', '2021-04-18 10:47:14', 0, 'attachment', 'image/png', 0),
(56, 1, '2021-04-18 10:47:33', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 15:14:50', 3, 'member', '', 0),
(57, 1, '2021-04-18 10:47:42', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 15:14:50', 4, 'member', '', 0),
(58, 1, '2021-04-18 10:56:42', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-06 14:02:41', 3, 'study_program', '', 0),
(59, 1, '2021-04-18 10:57:16', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-06 14:02:41', 4, 'study_program', '', 0),
(60, 1, '2021-04-18 15:16:17', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-18 15:16:17', 0, 'header', '', 0),
(61, 1, '2021-04-18 15:37:38', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-18 15:37:38', 0, 'footer', '', 0),
(63, 1, '2021-04-19 12:54:28', '', 'partner-1', '', 'inherit', 'open', 'closed', 'partner-1', '2021-04-19 12:54:28', 0, 'attachment', 'image/png', 0),
(64, 1, '2021-04-19 12:54:28', '', 'partner-2', '', 'inherit', 'open', 'closed', 'partner-2', '2021-04-19 12:54:28', 0, 'attachment', 'image/png', 0),
(65, 1, '2021-04-19 12:54:28', '', 'partner-3', '', 'inherit', 'open', 'closed', 'partner-3', '2021-04-19 12:54:28', 0, 'attachment', 'image/png', 0),
(66, 1, '2021-04-19 12:54:29', '', 'partner-4', '', 'inherit', 'open', 'closed', 'partner-4', '2021-04-19 12:54:29', 0, 'attachment', 'image/png', 0),
(67, 1, '2021-04-19 12:54:29', '', 'partner-5', '', 'inherit', 'open', 'closed', 'partner-5', '2021-04-19 12:54:29', 0, 'attachment', 'image/png', 0),
(68, 1, '2021-04-19 12:54:29', '', 'partner-6', '', 'inherit', 'open', 'closed', 'partner-6', '2021-04-19 12:54:29', 0, 'attachment', 'image/png', 0),
(69, 1, '2021-04-19 12:54:29', '', 'partner-7', '', 'inherit', 'open', 'closed', 'partner-7', '2021-04-19 12:54:29', 0, 'attachment', 'image/png', 0),
(70, 1, '2021-04-19 12:54:29', '', 'partner-8', '', 'inherit', 'open', 'closed', 'partner-8', '2021-04-19 12:54:29', 0, 'attachment', 'image/png', 0),
(71, 1, '2021-04-19 12:54:29', '', 'partner-9', '', 'inherit', 'open', 'closed', 'partner-9', '2021-04-19 12:54:29', 0, 'attachment', 'image/png', 0),
(72, 1, '2021-04-19 12:54:29', '', 'partner-10', '', 'inherit', 'open', 'closed', 'partner-10', '2021-04-19 12:54:29', 0, 'attachment', 'image/png', 0),
(73, 1, '2021-04-19 12:54:59', '', 'partner-11', '', 'inherit', 'open', 'closed', 'partner-11', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(74, 1, '2021-04-19 12:54:59', '', 'partner-12', '', 'inherit', 'open', 'closed', 'partner-12', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(75, 1, '2021-04-19 12:54:59', '', 'partner-13', '', 'inherit', 'open', 'closed', 'partner-13', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(76, 1, '2021-04-19 12:54:59', '', 'partner-14', '', 'inherit', 'open', 'closed', 'partner-14', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(77, 1, '2021-04-19 12:54:59', '', 'partner-15', '', 'inherit', 'open', 'closed', 'partner-15', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(78, 1, '2021-04-19 12:54:59', '', 'partner-16', '', 'inherit', 'open', 'closed', 'partner-16', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(79, 1, '2021-04-19 12:54:59', '', 'partner-17', '', 'inherit', 'open', 'closed', 'partner-17', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(80, 1, '2021-04-19 12:54:59', '', 'partner-18', '', 'inherit', 'open', 'closed', 'partner-18', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(81, 1, '2021-04-19 12:54:59', '', 'partner-19', '', 'inherit', 'open', 'closed', 'partner-19', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(82, 1, '2021-04-19 12:54:59', '', 'partner-20', '', 'inherit', 'open', 'closed', 'partner-20', '2021-04-19 12:54:59', 0, 'attachment', 'image/png', 0),
(83, 1, '2021-04-19 12:56:33', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 13, 'partner', '', 0),
(84, 1, '2021-04-19 12:56:49', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 14, 'partner', '', 0),
(85, 1, '2021-04-19 12:56:58', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 15, 'partner', '', 0),
(86, 1, '2021-04-19 12:57:14', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 16, 'partner', '', 0),
(87, 1, '2021-04-19 12:57:24', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 17, 'partner', '', 0),
(88, 1, '2021-04-19 12:57:36', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 18, 'partner', '', 0),
(89, 1, '2021-04-19 12:57:57', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 19, 'partner', '', 0),
(90, 1, '2021-04-19 12:58:07', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 20, 'partner', '', 0),
(91, 1, '2021-04-19 12:58:15', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 21, 'partner', '', 0),
(92, 1, '2021-04-19 13:14:27', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 13:14:27', 0, 'certificate', '', 0),
(93, 1, '2021-04-19 13:19:46', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 13:19:46', 0, 'certificate', '', 0),
(94, 1, '2021-04-19 13:41:24', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 13:41:46', 1, 'elearning', '', 0),
(95, 1, '2021-04-19 13:42:05', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 13:42:28', 2, 'elearning', '', 0),
(96, 1, '2021-04-19 13:42:29', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 13:43:07', 3, 'elearning', '', 0),
(97, 1, '2021-04-19 13:42:42', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 13:43:07', 4, 'elearning', '', 0),
(98, 1, '2021-04-19 13:42:58', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 13:43:07', 5, 'elearning', '', 0),
(99, 1, '2021-04-19 13:51:35', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 13:51:35', 0, 'elearning_object', '', 0),
(100, 1, '2021-04-19 13:53:36', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 13:53:36', 0, 'elearning_object', '', 0),
(101, 1, '2021-04-19 14:01:52', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:15:42', 1, 'timeline', '', 0),
(102, 1, '2021-04-19 14:02:36', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:02:36', 0, 'timeline_object', '', 0),
(103, 1, '2021-04-19 14:02:47', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:15:42', 2, 'timeline', '', 0),
(104, 1, '2021-04-19 14:02:55', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:15:42', 3, 'timeline', '', 0),
(105, 1, '2021-04-19 14:03:04', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:15:42', 4, 'timeline', '', 0),
(106, 1, '2021-04-19 14:03:16', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:15:42', 5, 'timeline', '', 0),
(108, 1, '2021-04-19 14:04:40', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:15:42', 6, 'timeline', '', 0),
(109, 1, '2021-04-19 14:26:42', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:26:42', 0, 'member_object', '', 0),
(110, 1, '2021-04-19 14:33:22', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:33:22', 0, 'why_object', '', 0),
(111, 1, '2021-04-19 14:33:24', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:33:41', 1, 'why', '', 0),
(112, 1, '2021-04-19 14:33:43', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:34:35', 2, 'why', '', 0),
(113, 1, '2021-04-19 14:33:54', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:34:35', 3, 'why', '', 0),
(114, 1, '2021-04-19 14:34:20', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-19 14:34:35', 4, 'why', '', 0),
(115, 1, '2021-04-19 14:39:41', '', 'why-us', '', 'inherit', 'open', 'closed', 'why-us', '2021-04-19 14:39:41', 0, 'attachment', 'image/png', 0),
(116, 1, '2021-04-19 16:47:48', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-06 14:02:41', 5, 'study_program', '', 0),
(117, 1, '2021-04-24 09:19:06', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-24 09:19:26', 1, 'certificate_slider', '', 0),
(118, 1, '2021-04-24 09:19:21', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-24 09:19:26', 2, 'certificate_slider', '', 0),
(120, 1, '2021-04-25 14:07:23', '', 'cung-meo-tita-day-tre-ky-nang-song-1', '', 'inherit', 'open', 'closed', 'cung-meo-tita-day-tre-ky-nang-song-1', '2021-04-25 14:07:23', 0, 'attachment', 'image/png', 0),
(123, 1, '2021-04-25 14:45:53', 'TruongMinhHanh', 'TruongMinhHanh', 'TruongMinhHanh', 'inherit', 'open', 'closed', 'TruongMinhHanh', '2021-04-25 22:39:53', 0, 'attachment', 'image/jpeg', 0),
(124, 1, '2021-04-25 15:05:14', '', 'tran_minh_loc', '', 'inherit', 'open', 'closed', 'tran_minh_loc', '2021-04-25 15:05:14', 0, 'attachment', 'image/png', 0),
(128, 1, '2021-04-25 15:05:15', 'HoangVanHoa', 'HoangVanHoa-172x235', 'HoangVanHoa', 'inherit', 'open', 'closed', 'HoangVanHoa-172x235', '2021-04-25 22:41:04', 0, 'attachment', 'image/jpeg', 0),
(129, 1, '2021-04-25 15:05:15', 'ifa-gs-charles-willson', 'ifa-gs-charles-willson', 'ifa-gs-charles-willson', 'inherit', 'open', 'closed', 'ifa-gs-charles-willson', '2021-04-25 23:01:20', 0, 'attachment', 'image/png', 0),
(130, 1, '2021-04-25 15:05:15', 'ifa-gs-thomas-jame-norman', 'ifa-gs-thomas-jame-norman', 'ifa-gs-thomas-jame-norman', 'inherit', 'open', 'closed', 'ifa-gs-thomas-jame-norman', '2021-04-25 23:02:27', 0, 'attachment', 'image/png', 0),
(131, 1, '2021-04-25 15:05:15', 'ifa-ths-ngo-kim-phuong', 'ifa-ths-ngo-kim-phuong', 'ifa-ths-ngo-kim-phuong', 'inherit', 'open', 'closed', 'ifa-ths-ngo-kim-phuong', '2021-04-26 12:58:54', 0, 'attachment', 'image/jpeg', 0),
(132, 1, '2021-04-25 15:05:15', 'ifa-ths-nguyen-kien-tri', 'ifa-ths-nguyen-kien-tri', 'ifa-ths-nguyen-kien-tri', 'inherit', 'open', 'closed', 'ifa-ths-nguyen-kien-tri', '2021-04-26 13:07:50', 0, 'attachment', 'image/jpeg', 0),
(133, 1, '2021-04-25 15:05:15', 'ifa-ths-nguyen-xuan-hai', 'ifa-ths-nguyen-xuan-hai', 'ifa-ths-nguyen-xuan-hai', 'inherit', 'open', 'closed', 'ifa-ths-nguyen-xuan-hai', '2021-04-25 22:58:59', 0, 'attachment', 'image/jpeg', 0),
(134, 1, '2021-04-25 15:06:21', 'tran_duc_tuan', 'tran_duc_tuan', 'tran_duc_tuan', 'inherit', 'open', 'closed', 'tran_duc_tuan', '2021-04-26 13:08:44', 0, 'attachment', 'image/png', 0),
(136, 1, '2021-04-25 15:06:21', 'ts-cao-hao-thi', 'ts-cao-hao-thi', 'ts-cao-hao-thi', 'inherit', 'open', 'closed', 'ts-cao-hao-thi-1', '2021-04-25 22:57:30', 0, 'attachment', 'image/png', 0),
(137, 1, '2021-04-25 15:06:21', 'ts-diep-gia-hoang', 'ts-diep-gia-hoang', 'ts-diep-gia-hoang', 'inherit', 'open', 'closed', 'ts-diep-gia-hoang-3', '2021-04-26 13:10:03', 0, 'attachment', 'image/jpeg', 0),
(138, 1, '2021-04-25 15:06:22', 'ifa-tien-si-ha-tuan-anh1', 'ifa-tien-si-ha-tuan-anh1', 'ifa-tien-si-ha-tuan-anh1', 'inherit', 'open', 'closed', 'ifa-tien-si-ha-tuan-anh1', '2021-04-25 22:29:43', 0, 'attachment', 'image/jpeg', 0),
(139, 1, '2021-04-25 15:06:22', 'ifa-truongngocmaihuong-images', 'ifa-truongngocmaihuong-images', 'ifa-truongngocmaihuong-images', 'inherit', 'open', 'closed', 'ifa-truongngocmaihuong-images', '2021-04-26 13:05:24', 0, 'attachment', 'image/jpeg', 0),
(140, 1, '2021-04-25 15:06:22', 'ifa-ts-le-tan-phuoc', 'ifa-ts-le-tan-phuoc', 'ifa-ts-le-tan-phuoc', 'inherit', 'open', 'closed', 'ifa-ts-le-tan-phuoc', '2021-04-26 13:03:58', 0, 'attachment', 'image/jpeg', 0),
(141, 1, '2021-04-25 15:06:22', 'ifa-ts-nguyen-minh-nghi', 'ifa-ts-nguyen-minh-nghi', 'ifa-ts-nguyen-minh-nghi', 'inherit', 'open', 'closed', 'ifa-ts-nguyen-minh-nghi', '2021-04-26 13:06:56', 0, 'attachment', 'image/jpeg', 0),
(142, 1, '2021-04-25 15:06:22', '', 'ifa-ts-nguyen-ngoc-duong', '', 'inherit', 'open', 'closed', 'ifa-ts-nguyen-ngoc-duong', '2021-04-25 15:06:22', 0, 'attachment', 'image/jpeg', 0),
(143, 1, '2021-04-25 15:06:22', 'ifa-ts-nguyen-phu-dong-ha', 'ifa-ts-nguyen-phu-dong-ha', 'ifa-ts-nguyen-phu-dong-ha', 'inherit', 'open', 'closed', 'ifa-ts-nguyen-phu-dong-ha', '2021-04-25 22:59:58', 0, 'attachment', 'image/jpeg', 0),
(144, 1, '2021-04-25 15:11:02', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 15:14:50', 1, 'member', '', 0),
(145, 1, '2021-04-25 15:12:07', '', 'icon1_2', '', 'inherit', 'open', 'closed', 'icon1_2', '2021-04-25 15:12:07', 0, 'attachment', 'image/png', 0),
(146, 1, '2021-04-25 15:16:04', '', 'IMG_9052', '', 'inherit', 'open', 'closed', 'IMG_9052', '2021-04-25 15:16:04', 0, 'attachment', 'image/jpeg', 0),
(148, 1, '2021-04-25 22:31:37', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 22:34:05', 5, 'member', '', 0),
(149, 1, '2021-04-25 22:34:19', 'le-tham-duong', 'le-tham-duong', 'le-tham-duong', 'inherit', 'open', 'closed', 'le-tham-duong', '2021-04-25 22:34:33', 0, 'attachment', 'image/jpeg', 0),
(150, 1, '2021-04-25 22:36:12', 'le-tham-duong', 'le-tham-duong', 'le-tham-duong', 'inherit', 'open', 'closed', 'le-tham-duong', '2021-04-25 22:36:28', 0, 'attachment', 'image/jpeg', 0),
(151, 1, '2021-04-25 22:37:11', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 22:38:57', 6, 'member', '', 0),
(152, 1, '2021-04-25 22:39:19', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 22:41:09', 7, 'member', '', 0),
(155, 1, '2021-04-25 22:50:20', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 22:51:29', 8, 'member', '', 0),
(157, 1, '2021-04-25 22:51:51', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 22:54:14', 9, 'member', '', 0),
(159, 1, '2021-04-25 22:55:17', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 22:56:28', 10, 'member', '', 0),
(160, 1, '2021-04-25 22:55:42', 'ifa-ts-nguyen-ngoc-duong', 'ifa-ts-nguyen-ngoc-duong', 'ifa-ts-nguyen-ngoc-duong', 'inherit', 'open', 'closed', 'ifa-ts-nguyen-ngoc-duong-1', '2021-04-25 22:56:39', 0, 'attachment', 'image/jpeg', 0),
(161, 1, '2021-04-25 22:56:52', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 22:57:35', 11, 'member', '', 0),
(162, 1, '2021-04-25 22:58:02', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 23:00:02', 12, 'member', '', 0),
(163, 1, '2021-04-25 22:59:06', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 23:00:02', 13, 'member', '', 0),
(164, 1, '2021-04-25 23:00:24', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 23:02:35', 14, 'member', '', 0),
(165, 1, '2021-04-25 23:00:25', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-25 23:02:35', 15, 'member', '', 0),
(166, 1, '2021-04-26 12:56:17', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-26 12:57:49', 16, 'member', '', 0),
(167, 1, '2021-04-26 12:57:39', 'ifa-ts-nguyen-van-hiep', 'ifa-ts-nguyen-van-hiep', 'ifa-ts-nguyen-van-hiep', 'inherit', 'open', 'closed', 'ifa-ts-nguyen-van-hiep', '2021-04-26 12:58:04', 0, 'attachment', 'image/png', 0),
(168, 1, '2021-04-26 12:58:19', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-26 12:58:57', 17, 'member', '', 0),
(169, 1, '2021-04-26 13:01:50', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-26 13:04:00', 18, 'member', '', 0),
(170, 1, '2021-04-26 13:03:00', 'ifa-ts-vu-thi-phuong', 'ifa-ts-vu-thi-phuong', 'ifa-ts-vu-thi-phuong', 'inherit', 'open', 'closed', 'ifa-ts-vu-thi-phuong', '2021-04-26 13:04:20', 0, 'attachment', 'image/jpeg', 0),
(171, 1, '2021-04-26 13:03:04', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-26 13:04:00', 19, 'member', '', 0),
(172, 1, '2021-04-26 13:04:33', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-26 13:05:27', 20, 'member', '', 0),
(173, 1, '2021-04-26 13:06:29', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-26 13:10:09', 21, 'member', '', 0),
(174, 1, '2021-04-26 13:06:59', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-26 13:10:09', 22, 'member', '', 0),
(175, 1, '2021-04-26 13:07:54', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-26 13:10:10', 23, 'member', '', 0),
(176, 1, '2021-04-26 13:08:46', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-26 13:10:10', 24, 'member', '', 0),
(177, 1, '2021-04-26 15:05:07', 'quy trinh dao tao inhouse', 'quy trinh dao tao inhouse', 'quy trinh dao tao inhouse', 'inherit', 'open', 'closed', 'quy-trinh-dao-tao-inhouse', '2021-04-26 15:05:29', 0, 'attachment', 'image/png', 0),
(178, 1, '2021-04-26 15:05:16', '<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Nhằm triển khai c&aacute;c chương tr&igrave;nh đ&agrave;o tạo theo y&ecirc;u cầu một c&aacute;ch hiệu quả, đồng thời kh&ocirc;ng l&agrave;m mất nhiều thời gian, chi ph&iacute; v&agrave; nguồn lực của doanh nghiệp, chương</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> tr&igrave;nh đ&agrave;o tạo Inhouse</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> của</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> Viện</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> IFA thường triển khai c&aacute;c chương tr&igrave;nh đ&agrave;o tạo (theo y&ecirc;u cầu doanh nghiệp n&oacute;i tr&ecirc;n) theo quy tr&igrave;nh bao gồm 0</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">6</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> bước như sau:</span></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><strong><u><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Bước&nbsp;1:&nbsp;Khảo</span></u></strong><strong><u><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> s&aacute;t, t</span></u></strong><strong><u><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">ư&nbsp;vấn,&nbsp;thiết&nbsp;lập&nbsp;&amp;&nbsp;thống&nbsp;nhất&nbsp;mục&nbsp;ti&ecirc;u&nbsp;đ&agrave;o&nbsp;tạo</span></u></strong><strong><u><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> (TNA)</span></u></strong></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Trong bước n&agrave;y, Viện IFA kết hợp với doanh nghiệp c&oacute; nhu cầu tiến h&agrave;nh</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> khảo s&aacute;t</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> thu thập th&ocirc;ng tin về kỳ vọng của l&atilde;nh đạo, về hiện trạng của đội ngũ hiện hữu. Sau đ&oacute;, tiến h&agrave;nh ph&acirc;n t&iacute;ch, đ&aacute;nh gi&aacute; v&agrave; tư vấn trực tiếp nhằm x&aacute;c lập mục ti&ecirc;u đ&agrave;o tạo cụ thể, ph&ugrave; hợp với nhu cầu ri&ecirc;ng v&agrave; đặc th&ugrave; của doanh nghiệp.</span></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><strong><u><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Bước&nbsp;2:&nbsp;Ph&acirc;n&nbsp;t&iacute;ch&nbsp;đối&nbsp;tượng&nbsp;v&agrave;&nbsp;thiết&nbsp;kế&nbsp;chương&nbsp;tr&igrave;nh&nbsp;đ&agrave;o&nbsp;tạo</span></u></strong></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Sau khi thiết lập được mục ti&ecirc;u đ&agrave;o tạo cho chương tr&igrave;nh đ&agrave;o tạo cụ thể ở Bước 1, đội ngũ chuy&ecirc;n gia của Viện IFA sẽ nghi&ecirc;n cứu, ph&acirc;n t&iacute;ch đối tượng tham dự v&agrave; thiết kế nội dung chương tr&igrave;nh đ&agrave;o tạo sao cho đảm bảo tối ưu về mặt hiệu quả v&agrave; t&iacute;nh kinh tế cho doanh nghiệp c&oacute; nhu cầu.</span></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><strong><u><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Bước&nbsp;3:&nbsp;Bi&ecirc;n&nbsp;soạn&nbsp;t&agrave;i&nbsp;liệu,&nbsp;mẫu&nbsp;biểu,&nbsp;c&ocirc;ng&nbsp;cụ&nbsp;học&nbsp;tập&nbsp;v&agrave;&nbsp;giảng&nbsp;dạy&hellip;</span></u></strong></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Với mục đ&iacute;ch tối ưu h&oacute;a hiệu quả đ&agrave;o tạo, trong bước n&agrave;y, đội ngũ chuy&ecirc;n gia của Viện IFA sẽ tiến h&agrave;nh bi&ecirc;n soạn t&agrave;i liệu, mẫu biểu, c&ocirc;ng cụ học tập, t&igrave;nh huống,&hellip; sử dụng để giảng dạy v&agrave; cung cấp cho học vi&ecirc;n. Song song với việc bi&ecirc;n soạn, đội ngũ chuy&ecirc;n gia của Viện IFA cũng sẽ tiến h&agrave;nh ph&acirc;n bổ nội dung chương tr&igrave;nh cũng như c&aacute;ch thức truyền tải của từng phần sao cho đảm bảo t&iacute;nh ph&ugrave; hợp nhất với đặc th&ugrave; của nh&oacute;m đối tượng tham dự.</span></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><strong><u><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Bước&nbsp;4:&nbsp;Triển&nbsp;khai&nbsp;đ&agrave;o&nbsp;tạo</span></u></strong></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Sau</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> khi đ&atilde; thống nhất chương tr&igrave;nh đ&agrave;o t&agrave;o, </span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Viện IFA sẽ phối hợp với doanh nghiệp tổ</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> chức </span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">triển khai đ&agrave;o tạo</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> đảm bảo theo đ&uacute;ng chương tr&igrave;nh, giảng vi&ecirc;n v&agrave; sự kỳ vọng của kh&oacute;a học</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">.</span></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><strong><u><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Bước&nbsp;5:&nbsp;Đ&aacute;nh&nbsp;gi&aacute;&nbsp;sau&nbsp;đ&agrave;o&nbsp;tạo</span></u></strong></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">T&ugrave;y theo đặc th&ugrave; của chương tr&igrave;nh đ&agrave;o tạo v&agrave; y&ecirc;u cầu ri&ecirc;ng từ Ban L&atilde;nh đạo doanh nghiệp, với</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> </span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">chương</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> tr&igrave;nh đ&agrave;o tạo inhouse, Viện </span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">IFA sẽ nghi&ecirc;n cứu v&agrave; tiến h&agrave;nh đ&aacute;nh gi&aacute; sau đ&agrave;o tạo. N&oacute;i c&aacute;ch kh&aacute;c, bước n&agrave;y sẽ thực hiện nếu doanh nghiệp c&oacute; y&ecirc;u cầu. V&agrave; t&ugrave;y theo mức độ đ&aacute;nh gi&aacute; sẽ ph&aacute;t sinh th&ecirc;m những hạng mục c&ocirc;ng việc mới m&agrave; hai b&ecirc;n rất cần thiết phải trao đổi v&agrave; thống nhất trước khi thực hiện.</span></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Cụ thể, c&ocirc;ng t&aacute;c đ&aacute;nh gi&aacute; sau đ&agrave;o tạo c&oacute; thể được tiến h&agrave;nh th&ocirc;ng qua một trong số c&aacute;c phương ph&aacute;p như sau:</span></p>\r\n<ul style=\"margin-bottom: 0in; margin-top: 0px;\" type=\"disc\">\r\n<li style=\"color: black; background: white; margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif;\">Thực hiện b&agrave;i kiểm tra trực tiếp v&agrave;o cuối kh&oacute;a;</span></li>\r\n<li style=\"color: black; background: white; margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif;\">Phỏng vấn trực tiếp từng học vi&ecirc;n hay nh&oacute;m đại diện sau đ&agrave;o tạo;</span></li>\r\n<li style=\"color: black; background: white; margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif;\">Đ&aacute;nh gi&aacute; th&ocirc;ng qua việc thực hiện đề t&agrave;i / kế hoạch ứng dụng sau kh&oacute;a học;</span></li>\r\n<li style=\"color: black; background: white; margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif;\">Đ&aacute;nh gi&aacute; trực tiếp sau thời gian đ&agrave;o tạo (1 th&aacute;ng/ 3 th&aacute;ng/ 6 th&aacute;ng...)&hellip;</span></li>\r\n</ul>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Mục ti&ecirc;u ch&iacute;nh của việc đ&aacute;nh gi&aacute; n&agrave;y l&agrave; nhằm gi&uacute;p cho c&aacute;c nh&agrave; quản l&yacute;, doanh nghiệp tham gia đ&agrave;o tạo c&oacute; th&ecirc;m th&ocirc;ng tin, luận chứng, cơ sở để x&acirc;y dựng giải ph&aacute;p ph&aacute;t triển nguồn nh&acirc;n lực tiếp theo, g&oacute;p phần ph&aacute;t huy tối đa sở trường của đội ngũ cũng như hạn chế tối thiểu c&aacute;c</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\"> tồn tại </span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">(nếu c&oacute;) của c&aacute;c học vi&ecirc;n.</span></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><strong><u><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Bước 6: Chứng nhận tốt nghiệp</span></u></strong></p>\r\n<p style=\"margin: 0in 0in 7.5pt; text-align: justify; background: white; font-size: 12pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif; color: black;\">Sau khi học vi&ecirc;n ho&agrave;n th&agrave;nh chương tr&igrave;nh học, t&ugrave;y v&agrave;o mỗi chương tr&igrave;nh đ&agrave;o tạo kh&aacute;c nhau m&agrave; Viện IFA đưa ra c&aacute;c h&igrave;nh thức đ&aacute;nh gi&aacute; sau kh&oacute;a học kh&aacute;c nhau. Học vi&ecirc;n đạt y&ecirc;u cầu sẽ được cấp chứng chỉ của Viện Quản trị v&agrave; T&agrave;i ch&iacute;nh c&oacute; gi&aacute; trị. Ngo&agrave;i ra, một số chương tr&igrave;nh đ&agrave;o tạo của Viện IFA được chuẩn nhận (accredited) bởi Trường ĐH California th&igrave; học vi&ecirc;n sẽ nhận chứng chỉ do trường ĐH C&ocirc;ng lập California cấp c&oacute; gi&aacute; trị Quốc tế.</span></p>', 'Quy trình đào tạo Inhouse tại IFA', '', 'draft', 'open', 'open', 'quy-trinh-dao-tao-inhouse-tai-ifa', '2021-04-29 06:53:38', 0, 'post', '', 0),
(179, 1, '2021-04-26 22:49:31', 'le-tham-duong', 'le-tham-duong', 'le-tham-duong', 'inherit', 'open', 'closed', 'le-tham-duong', '2021-04-26 22:49:57', 0, 'attachment', 'image/png', 0),
(180, 1, '2021-04-26 22:55:55', 'hoang-van-hoa', 'hoang-van-hoa', 'hoang-van-hoa', 'inherit', 'open', 'closed', 'hoang-van-hoa', '2021-04-26 22:56:13', 0, 'attachment', 'image/png', 0),
(181, 1, '2021-04-26 22:55:55', 'tran-minh-loc', 'tran-minh-loc', 'tran-minh-loc', 'inherit', 'open', 'closed', 'tran-minh-loc', '2021-04-26 22:56:23', 0, 'attachment', 'image/jpeg', 0),
(182, 1, '2021-04-26 22:55:55', 'ha-tuan-anh', 'ha-tuan-anh', 'ha-tuan-anh', 'inherit', 'open', 'closed', 'ha-tuan-anh', '2021-04-26 22:56:39', 0, 'attachment', 'image/png', 0),
(183, 1, '2021-04-26 22:59:28', 'thay-doan-duc-minh', 'thay-doan-duc-minh', 'thay-doan-duc-minh', 'inherit', 'open', 'closed', 'thay-doan-duc-minh', '2021-04-26 23:02:27', 0, 'attachment', 'image/png', 0),
(184, 1, '2021-04-26 22:59:28', 'thay-le-duy-quang', 'thay-le-duy-quang', 'thay-le-duy-quang', 'inherit', 'open', 'closed', 'thay-le-duy-quang', '2021-04-26 23:02:18', 0, 'attachment', 'image/png', 0),
(185, 1, '2021-04-26 23:01:33', 'thay-lai-van-chuong', 'thay-lai-van-chuong', 'thay-lai-van-chuong', 'inherit', 'open', 'closed', 'thay-lai-van-chuong', '2021-04-26 23:02:37', 0, 'attachment', 'image/png', 0),
(186, 1, '2021-04-26 23:01:33', 'tien-si-tran-huynh-thanh-nghi', 'tien-si-tran-huynh-thanh-nghi', 'tien-si-tran-huynh-thanh-nghi', 'inherit', 'open', 'closed', 'tien-si-tran-huynh-thanh-nghi', '2021-04-26 23:02:46', 0, 'attachment', 'image/png', 0),
(187, 1, '2021-04-26 23:06:08', 'nguyen-ngoc-duong', 'nguyen-ngoc-duong', 'nguyen-ngoc-duong', 'inherit', 'open', 'closed', 'nguyen-ngoc-duong', '2021-04-26 23:08:04', 0, 'attachment', 'image/png', 0),
(188, 1, '2021-04-26 23:06:10', 'cao-hao-thi', 'cao-hao-thi', 'cao-hao-thi', 'inherit', 'open', 'closed', 'cao-hao-thi', '2021-04-26 23:07:56', 0, 'attachment', 'image/png', 0),
(189, 1, '2021-04-26 23:07:33', 'nguyen-xuan-hai', 'nguyen-xuan-hai', 'nguyen-xuan-hai', 'inherit', 'open', 'closed', 'nguyen-xuan-hai', '2021-04-26 23:07:48', 0, 'attachment', 'image/png', 0),
(190, 1, '2021-04-26 23:10:54', 'nguyen-van-hiep', 'nguyen-van-hiep', 'nguyen-van-hiep', 'inherit', 'open', 'closed', 'nguyen-van-hiep', '2021-04-26 23:11:24', 0, 'attachment', 'image/png', 0),
(191, 1, '2021-04-26 23:10:54', 'thac-si-ngo-kim-phuong', 'thac-si-ngo-kim-phuong', 'thac-si-ngo-kim-phuong', 'inherit', 'open', 'closed', 'thac-si-ngo-kim-phuong', '2021-04-26 23:11:33', 0, 'attachment', 'image/png', 0),
(192, 1, '2021-04-26 23:10:54', 'thomas norman', 'thomas norman', 'thomas norman', 'inherit', 'open', 'closed', 'thomas-norman', '2021-04-26 23:11:15', 0, 'attachment', 'image/png', 0),
(193, 1, '2021-04-26 23:15:54', 'nguyen-kien-tri', 'nguyen-kien-tri', 'nguyen-kien-tri', 'inherit', 'open', 'closed', 'nguyen-kien-tri', '2021-04-26 23:17:50', 0, 'attachment', 'image/png', 0),
(194, 1, '2021-04-26 23:15:54', 'thac-si-truong-ngoc-mai-huong', 'thac-si-truong-ngoc-mai-huong', 'thac-si-truong-ngoc-mai-huong', 'inherit', 'open', 'closed', 'thac-si-truong-ngoc-mai-huong', '2021-04-26 23:17:35', 0, 'attachment', 'image/png', 0),
(195, 1, '2021-04-26 23:15:54', 'tien-si-nguyen-minh-nghi', 'tien-si-nguyen-minh-nghi', 'tien-si-nguyen-minh-nghi', 'inherit', 'open', 'closed', 'tien-si-nguyen-minh-nghi', '2021-04-26 23:17:42', 0, 'attachment', 'image/png', 0),
(196, 1, '2021-04-26 23:15:54', 'tien-si-nguyen-tan-phuoc', 'tien-si-nguyen-tan-phuoc', 'tien-si-nguyen-tan-phuoc', 'inherit', 'open', 'closed', 'tien-si-nguyen-tan-phuoc', '2021-04-26 23:17:24', 0, 'attachment', 'image/png', 0),
(197, 1, '2021-04-26 23:15:55', 'tran-duc-tuan', 'tran-duc-tuan', 'tran-duc-tuan', 'inherit', 'open', 'closed', 'tran-duc-tuan', '2021-04-26 23:17:58', 0, 'attachment', 'image/png', 0),
(198, 1, '2021-04-26 23:15:55', 'vu-thi-phuong', 'vu-thi-phuong', 'vu-thi-phuong', 'inherit', 'open', 'closed', 'vu-thi-phuong', '2021-04-26 23:17:17', 0, 'attachment', 'image/png', 0),
(199, 1, '2021-04-26 23:15:55', 'diep-gia-hoang', 'diep-gia-hoang', 'diep-gia-hoang', 'inherit', 'open', 'closed', 'diep-gia-hoang', '2021-04-26 23:18:07', 0, 'attachment', 'image/png', 0),
(200, 1, '2021-04-26 23:19:36', '', 'chungnhan', '', 'inherit', 'open', 'closed', 'chungnhan', '2021-04-26 23:19:36', 0, 'attachment', 'image/png', 0),
(201, 1, '2021-04-28 02:45:46', '', '_DSC0774', '', 'inherit', 'open', 'closed', '_DSC0774', '2021-04-28 02:45:46', 0, 'attachment', 'image/jpeg', 0),
(202, 1, '2021-04-28 02:45:55', '', 'DSC_0258', '', 'inherit', 'open', 'closed', 'DSC_0258', '2021-04-28 02:45:55', 0, 'attachment', 'image/jpeg', 0),
(203, 1, '2021-04-28 02:46:10', '', 'DSC_0443', '', 'inherit', 'open', 'closed', 'DSC_0443', '2021-04-28 02:46:10', 0, 'attachment', 'image/jpeg', 0),
(204, 1, '2021-04-28 02:46:10', '', 'DSC_1110', '', 'inherit', 'open', 'closed', 'DSC_1110', '2021-04-28 02:46:10', 0, 'attachment', 'image/jpeg', 0),
(205, 1, '2021-04-28 02:46:13', '', 'DSC_1137', '', 'inherit', 'open', 'closed', 'DSC_1137', '2021-04-28 02:46:13', 0, 'attachment', 'image/jpeg', 0),
(206, 1, '2021-04-28 02:46:18', '', 'DSCF9152', '', 'inherit', 'open', 'closed', 'DSCF9152', '2021-04-28 02:46:18', 0, 'attachment', 'image/jpeg', 0),
(207, 1, '2021-04-28 02:46:20', '', 'ifa-hoi-thao-tai-ha-noi-79', '', 'inherit', 'open', 'closed', 'ifa-hoi-thao-tai-ha-noi-79', '2021-04-28 02:46:20', 0, 'attachment', 'image/jpeg', 0),
(208, 1, '2021-04-28 02:46:20', '', 'IMG_0011', '', 'inherit', 'open', 'closed', 'IMG_0011', '2021-04-28 02:46:20', 0, 'attachment', 'image/jpeg', 0),
(209, 1, '2021-04-28 02:46:33', '', 'IMG_0020', '', 'inherit', 'open', 'closed', 'IMG_0020', '2021-04-28 02:46:33', 0, 'attachment', 'image/jpeg', 0),
(210, 1, '2021-04-28 02:46:36', '', 'IMG_0021', '', 'inherit', 'open', 'closed', 'IMG_0021', '2021-04-28 02:46:36', 0, 'attachment', 'image/jpeg', 0),
(211, 1, '2021-04-28 02:58:47', '', 'DSCF0803', '', 'inherit', 'open', 'closed', 'DSCF0803', '2021-04-28 02:58:47', 0, 'attachment', 'image/jpeg', 0),
(212, 1, '2021-04-28 03:10:10', '', 'IMG_2441', '', 'inherit', 'open', 'closed', 'IMG_2441', '2021-04-28 03:10:10', 0, 'attachment', 'image/jpeg', 0),
(213, 1, '2021-04-28 03:10:10', '', 'IMG_1977', '', 'inherit', 'open', 'closed', 'IMG_1977', '2021-04-28 03:10:10', 0, 'attachment', 'image/jpeg', 0),
(214, 1, '2021-04-28 03:10:10', '', 'IMG_1980', '', 'inherit', 'open', 'closed', 'IMG_1980', '2021-04-28 03:10:10', 0, 'attachment', 'image/jpeg', 0),
(215, 1, '2021-04-28 03:10:10', '', 'IMG_2456', '', 'inherit', 'open', 'closed', 'IMG_2456', '2021-04-28 03:10:10', 0, 'attachment', 'image/jpeg', 0),
(216, 1, '2021-04-28 03:10:11', '', 'IMG_2472', '', 'inherit', 'open', 'closed', 'IMG_2472', '2021-04-28 03:10:11', 0, 'attachment', 'image/jpeg', 0),
(217, 1, '2021-04-28 03:10:11', '', 'IMG_3196', '', 'inherit', 'open', 'closed', 'IMG_3196', '2021-04-28 03:10:11', 0, 'attachment', 'image/jpeg', 0),
(218, 1, '2021-04-28 03:10:11', '', 'IMG_3213', '', 'inherit', 'open', 'closed', 'IMG_3213', '2021-04-28 03:10:11', 0, 'attachment', 'image/jpeg', 0),
(219, 1, '2021-04-28 03:10:11', '', 'IMG_3387', '', 'inherit', 'open', 'closed', 'IMG_3387', '2021-04-28 03:10:11', 0, 'attachment', 'image/jpeg', 0),
(220, 1, '2021-04-28 03:10:11', '', 'IMG_3439', '', 'inherit', 'open', 'closed', 'IMG_3439', '2021-04-28 03:10:11', 0, 'attachment', 'image/jpeg', 0),
(221, 1, '2021-04-28 03:10:11', '', 'IMG_3487', '', 'inherit', 'open', 'closed', 'IMG_3487', '2021-04-28 03:10:11', 0, 'attachment', 'image/jpeg', 0),
(224, 1, '2021-04-28 03:27:20', '', 'chungnhan', '', 'inherit', 'open', 'closed', 'chungnhan-1', '2021-04-28 03:27:20', 0, 'attachment', 'image/png', 0),
(225, 1, '2021-04-28 13:37:19', 'doanh-nhan-vo-ngoc-huyen', 'doanh-nhan-vo-ngoc-huyen', 'doanh-nhan-vo-ngoc-huyen', 'inherit', 'open', 'closed', 'doanh-nhan-vo-ngoc-huyen', '2021-04-28 13:39:14', 0, 'attachment', 'image/png', 0),
(226, 1, '2021-04-28 13:37:19', 'doanh-nhan-vo-ngoc-huyen-2', 'doanh-nhan-vo-ngoc-huyen-2', 'doanh-nhan-vo-ngoc-huyen-2', 'inherit', 'open', 'closed', 'doanh-nhan-vo-ngoc-huyen-2', '2021-04-28 13:39:37', 0, 'attachment', 'image/jpeg', 0),
(227, 1, '2021-04-28 13:37:19', 'doanh-nhan-vo-ngoc-huyen-3', 'doanh-nhan-vo-ngoc-huyen-3', 'doanh-nhan-vo-ngoc-huyen-3', 'inherit', 'open', 'closed', 'doanh-nhan-vo-ngoc-huyen-3', '2021-04-28 13:39:47', 0, 'attachment', 'image/jpeg', 0),
(228, 1, '2021-04-28 13:37:19', 'le-trao-bang-tai-ifa', 'le-trao-bang-tai-ifa', 'le-trao-bang-tai-ifa', 'inherit', 'open', 'closed', 'le-trao-bang-tai-ifa', '2021-04-28 13:39:29', 0, 'attachment', 'image/png', 0),
(229, 1, '2021-04-28 13:37:19', 'be-khanh-an', 'be-khanh-an', 'be-khanh-an', 'inherit', 'open', 'closed', 'be-khanh-an', '2021-04-28 13:38:57', 0, 'attachment', 'image/jpeg', 0),
(230, 1, '2021-04-28 13:37:19', 'doanh-nhan-vo-ngoc-huyen', 'doanh-nhan-vo-ngoc-huyen', 'doanh-nhan-vo-ngoc-huyen', 'inherit', 'open', 'closed', 'doanh-nhan-vo-ngoc-huyen', '2021-04-28 13:44:47', 0, 'attachment', 'image/jpeg', 0),
(231, 1, '2021-04-28 13:45:05', '<p style=\"text-align: justify;\"><strong>Xinh đẹp, th&agrave;nh đạt, tự tin, c&oacute; kh&iacute; chất đ&oacute; l&agrave; những h&igrave;nh dung về những người Phụ nữ Việt Nam Thế kỷ 21. V&agrave; ng&agrave;y 20 th&aacute;ng 10 ch&iacute;nh l&agrave; một dịp lễ đặc biệt để ch&uacute;ng ta t&ocirc;n vinh v&agrave; thể hiện l&ograve;ng tr&acirc;n qu&yacute; của m&igrave;nh với những người phụ nữ m&agrave; ta y&ecirc;u mến. V&agrave; để tri &acirc;n đến người phụ nữ, ch&uacute;ng t&ocirc;i đ&atilde; c&oacute; một buổi tr&ograve; chuyện với doanh nh&acirc;n Đinh V&otilde; Ngọc Huyền về vai tr&ograve; l&atilde;nh đạo cũng như vai tr&ograve; l&agrave; một người vợ, người mẹ trong gia đ&igrave;nh, th&ocirc;ng qua đ&oacute;, ch&uacute;ng ta c&oacute; thể cảm nhận s&acirc;u sắc hơn những g&igrave; m&agrave; người phụ nữ đ&atilde; hi sinh để th&ecirc;m tr&acirc;n trọng vai tr&ograve; của người phụ nữ trong x&atilde; hội hiện đại.</strong></p>\r\n<p style=\"text-align: justify;\">Trong bộn bề c&ocirc;ng việc, chị Đinh V&otilde; Ngọc Huyền, Ph&oacute; viện trường viện quản trị t&agrave;i ch&iacute;nh IFA vẫn d&agrave;nh cho ch&uacute;ng t&ocirc;i cuộc tr&ograve; chuyện cởi mở về gia đ&igrave;nh, đồng nghiệp v&agrave;, niềm vui trong ng&agrave;y Phụ nữ Việt Nam 20/10&hellip;</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/doanh-nhan-vo-ngoc-huyen.png\" alt=\"doanh-nhan-vo-ngoc-huyen\" /></p>\r\n<p style=\"text-align: center;\"><em>Doanh nh&acirc;n Đinh V&otilde; Ngọc Huyền</em></p>\r\n<p style=\"text-align: justify;\">Doanh nh&acirc;n Đinh V&otilde; Ngọc Huyền l&agrave; một trong những l&atilde;nh đạo nữ đạt được nhiều th&agrave;nh c&ocirc;ng trong c&ocirc;ng việc v&agrave; c&oacute; một gia đ&igrave;nh hạnh ph&uacute;c. Hơn 10 năm gắn b&oacute; với c&ocirc;ng việc ph&aacute;t triển nguồn lực v&agrave; quản l&iacute; nguồn lực, bằng cả t&acirc;m huyết v&agrave; dồn cả tr&iacute; lực của m&igrave;nh để c&ugrave;ng CBNV x&acirc;y dựng thương hiệu IFA tr&ecirc;n ng&agrave;y c&agrave;ng vươn xa hơn nữa. D&ugrave; c&oacute; những l&uacute;c kh&oacute; khăn tưởng chừng kh&oacute; vượt qua, c&oacute; những gian tru&acirc;n kh&ocirc;ng thể n&agrave;o đong đếm, nhưng nếu chọn lại một lần nữa, chị vẫn quyết định gắn b&oacute; đời m&igrave;nh với con đường mang t&ecirc;n IFA.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/doanh-nhan-vo-ngoc-huyen.jpg\" alt=\"doanh-nhan-vo-ngoc-huyen\" /></p>\r\n<p style=\"text-align: center;\"><em>Doanh nh&acirc;n Dinh V&otilde; Ngọc Huyền v&agrave; Viện quản trị t&agrave;i ch&iacute;nh IFA</em></p>\r\n<p style=\"text-align: justify;\">Những năm th&aacute;ng qua, chị đ&atilde; được sống trọn vẹn với t&igrave;nh y&ecirc;u v&agrave; niềm đam m&ecirc; của m&igrave;nh trong ng&ocirc;i nh&agrave; chung IFA. Với vị tr&iacute; l&atilde;nh đạo của một viện quản trị, chịu tr&aacute;ch nhiệm trước h&agrave;ng trăm con người, d&ugrave; rằng trong kinh doanh c&oacute; những l&uacute;c mệt mỏi v&agrave; những lo &acirc;u trong cả bữa ăn giấc ngủ, nhưng niềm vui th&igrave; thật lớn khi Viện quản trị v&agrave; t&agrave;i ch&iacute;nh IFA ng&agrave;y c&agrave;ng lớn mạnh về qui m&ocirc; v&agrave; chất lượng, hiệu quả</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/le-trao-bang-tai-ifa.png\" alt=\"le-trao-bang-tai-ifa\" /></p>\r\n<p style=\"text-align: center;\"><em>Lễ trao bằng cho c&aacute;c học vi&ecirc;n theo học tại Viện quản trị v&agrave; t&agrave;i ch&iacute;nh IFA</em></p>\r\n<p style=\"text-align: justify;\">V&agrave; trong nhiều năm qua, khi nhận được sự t&ocirc;n vinh của x&atilde; hội th&ocirc;ng qua nhiều giải thưởng cao qu&iacute; d&agrave;nh cho Viện quản trị v&agrave; t&agrave;i ch&iacute;nh IFA v&agrave; c&aacute; nh&acirc;n chị, chị như &nbsp;được tiếp th&ecirc;m sức mạnh để dấn th&acirc;n, đ&oacute;ng g&oacute;p ng&agrave;y c&agrave;ng nhiều hơn cho sự ph&aacute;t triển của IFA. Với chị, tất cả những danh hiệu được x&acirc;y dựng từ c&ocirc;ng sức, tr&iacute; tuệ của hơn 200 con người trong đội ngũ l&atilde;nh đạo v&agrave; giảng vi&ecirc;n của Viện quản trị v&agrave; t&agrave;i ch&iacute;nh IFA l&agrave; điều m&agrave; chị tự h&agrave;o nhiều nhất. Chị cũng t&acirc;m niệm rằng, mỗi giải thưởng l&agrave; một cột mốc, một động lực v&agrave; cũng ch&iacute;nh l&agrave; th&ecirc;m một danh hiệu để bản th&acirc;n chị v&agrave; c&aacute;c doanh nh&acirc;n n&oacute;i chung phải giữ g&igrave;n v&agrave; ph&aacute;t huy để xứng đ&aacute;ng hơn nữa với niềm kỳ vọng m&agrave; x&atilde; hội đặt l&ecirc;n vai ch&uacute;ng ta. Chị cũng mong rằng, sẽ ng&agrave;y c&agrave;ng c&oacute; nhiều nữ doanh nh&acirc;n được t&ocirc;n vinh, bởi điều đ&oacute; đồng nghĩa với việc ng&agrave;y c&agrave;ng c&oacute; th&ecirc;m nhiều phụ nữ th&agrave;nh đạt v&agrave; tự tin khẳng định bản lĩnh, t&agrave;i năng của m&igrave;nh, vượt qua những kh&oacute; khăn, vất vả để đ&oacute;ng g&oacute;p nhiều hơn cho x&atilde; hội, cộng đồng.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/doanh-nhan-vo-ngoc-huyen-2.jpg\" alt=\"doanh-nhan-vo-ngoc-huyen-2\" /></p>\r\n<p style=\"text-align: center;\"><em>DN Ngọc Huyền v&agrave; giải &aacute; kh&ocirc;i 3 cuộc thi Hoa kh&ocirc;i nhan sắc năm 2017</em></p>\r\n<p style=\"text-align: justify;\">Nh&igrave;n lại những chặng đường đ&atilde; đi qua, doanh nh&acirc;n Đinh V&otilde; Ngọc Huyền tự nhủ rằng m&igrave;nh l&agrave; một người phụ nữ may mắn khi b&ecirc;n cạnh c&ocirc;ng việc su&ocirc;n sẻ th&igrave; gia đ&igrave;nh &ndash; một nửa sự nghiệp của đời chị lu&ocirc;n l&agrave; một m&aacute;i ấm. Nhiều người n&oacute;i rằng đ&oacute; l&agrave; sự may mắn d&agrave;nh cho một người phụ nữ lu&ocirc;n nỗ lực vươn l&ecirc;n v&agrave; biết c&aacute;ch c&acirc;n bằng giữa c&ocirc;ng việc v&agrave; gia đ&igrave;nh. Chị biết ơn v&igrave; sự nh&igrave;n nhận đ&oacute;. V&agrave; chị th&iacute;ch được gọi l&agrave; một người phụ nữ hạnh ph&uacute;c hơn l&agrave; một người phụ nữ th&agrave;nh đạt, v&igrave; chị cho rằng hạnh ph&uacute;c mới l&agrave; mục đ&iacute;ch dấn th&acirc;n của người phụ nữ. Điều khiến chị hạnh ph&uacute;c nhất l&agrave; m&aacute;i ấm gia đ&igrave;nh khi c&oacute; cậu con trai b&eacute; nhỏ; v&agrave; được sự bảo ban, che chở của cha mẹ.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/doanh-nhan-vo-ngoc-huyen-3.jpg\" alt=\"doanh-nhan-vo-ngoc-huyen-3\" /></p>\r\n<p style=\"text-align: center;\"><em>DN Ngọc Huyền hạnh ph&uacute;c b&ecirc;n con trai Kh&aacute;nh An b&eacute; nhỏ</em></p>\r\n<p style=\"text-align: justify;\">D&ugrave; bận đến mấy chị vẫn tranh thủ d&agrave;nh thời gian đưa đ&oacute;n con đi học, tranh thủ thời gian n&agrave;y tr&ograve; chuyện để hiểu con th&ecirc;m v&agrave; cũng để c&aacute;c con nhận thấy sự quan t&acirc;m của mẹ. Như bao b&agrave; mẹ kh&aacute;c, chị mong muốn con m&igrave;nh kh&ocirc;n lớn, th&agrave;nh đạt v&agrave; chị &nbsp;dạy con bằng c&aacute;ch gợi mở, định hướng chứ kh&ocirc;ng &aacute;p đặt mong muốn của m&igrave;nh v&agrave;o cuộc sống của con. V&agrave; cũng thật may mắn khi con chị lu&ocirc;n ngoan ngo&atilde;n v&agrave; lễ ph&eacute;p.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/be-khanh-an.jpg\" alt=\"be-khanh-an\" /></p>\r\n<p style=\"text-align: center;\"><em>B&eacute; Kh&aacute;nh An lớn l&ecirc;n trong sự y&ecirc;u thương, che chở của mẹ v&agrave; người th&acirc;n trong gia đ&igrave;nh</em></p>', 'Doanh nhân Đinh Võ Ngọc Huyền và vai trò của người phụ nữ trong xã hội hiện đại', '', 'draft', 'open', 'open', 'doanh-nhan-dinh-vo-ngoc-huyen-va-vai-tro-cua-nguoi-phu-nu-trong-xa-hoi-hien-dai', '2021-05-04 16:06:54', 0, 'post', '', 0),
(232, 1, '2021-04-28 13:47:08', 'doanh-nhan-dinh-vo-ngoc-huyen', 'doanh-nhan-dinh-vo-ngoc-huyen', 'doanh-nhan-dinh-vo-ngoc-huyen', 'inherit', 'open', 'closed', 'doanh-nhan-dinh-vo-ngoc-huyen', '2021-04-28 13:47:23', 0, 'attachment', 'image/png', 0),
(233, 1, '2021-04-28 13:55:32', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-2', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-2', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-2', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-2', '2021-04-28 13:58:01', 0, 'attachment', 'image/jpeg', 0),
(234, 1, '2021-04-28 13:55:32', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-3', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-3', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-3', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo-3', '2021-04-28 13:57:30', 0, 'attachment', 'image/jpeg', 0),
(235, 1, '2021-04-28 13:55:32', 'do-viet-phuong-ke-toan-truong', 'do-viet-phuong-ke-toan-truong', 'do-viet-phuong-ke-toan-truong', 'inherit', 'open', 'closed', 'do-viet-phuong-ke-toan-truong', '2021-04-28 13:58:29', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `posts` (`ID`, `post_author`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_name`, `post_modified`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(236, 1, '2021-04-28 13:55:33', 'ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa', 'ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa', 'ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa', 'inherit', 'open', 'closed', 'ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa', '2021-04-28 13:58:55', 0, 'attachment', 'image/jpeg', 0),
(237, 1, '2021-04-28 13:55:33', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-tai-chinh-cfo', '2021-04-28 13:59:47', 0, 'attachment', 'image/jpeg', 0),
(238, 1, '2021-04-28 13:59:54', '<p style=\"text-align: justify;\">Ng&agrave;y 21/10/2017 tại Nha Trang, Tổng c&ocirc;ng ty Kh&aacute;nh Việt (Khatoco) phối hợp với Viện Quản trị v&agrave; T&agrave;i ch&iacute;nh (IFA) tổ chức Lễ Bế giảng kh&oacute;a đ&agrave;o tạo \"Gi&aacute;m đốc T&agrave;i ch&iacute;nh - Chief Financial Officer &ndash; CFO\".</p>\r\n<p style=\"text-align: justify;\">Ban l&atilde;nh đạo Tổng c&ocirc;ng ty Kh&aacute;nh Việt lu&ocirc;n x&aacute;c định c&ocirc;ng t&aacute;c t&agrave;i ch&iacute;nh l&agrave; nhiệm vụ quan trọng trong qu&aacute; tr&igrave;nh, vận h&agrave;nh ph&aacute;t triển doanh nghiệp ; trong đ&oacute; đội ngũ t&agrave;i ch&iacute;nh, kế to&aacute;n đ&oacute;ng vai tr&ograve; trọng yếu.</p>\r\n<p style=\"text-align: justify;\">Với triết l&yacute; \"N&acirc;ng Tầm Tri Thức V&igrave; Một Việt Nam Thịnh Vượng\", Học viện l&atilde;nh đạo IFA được th&agrave;nh lập từ năm 2006 từ t&acirc;m huyết của những nh&agrave; gi&aacute;o, nh&agrave; nghi&ecirc;n cứu khoa học v&agrave; doanh nh&acirc;n, với một đội ngũ quản l&yacute; trẻ năng động, IFA l&agrave; sự kết hợp h&agrave;i h&ograve;a giữa kiến thức học thuật chuy&ecirc;n s&acirc;u v&agrave; kỹ năng thực tế thời thượng. IFA mang đến cho người học những chương tr&igrave;nh đ&agrave;o tạo tốt nhất.</p>\r\n<p style=\"text-align: justify;\">Gi&aacute;m đốc T&agrave;i ch&iacute;nh -CFO l&agrave; những người chịu tr&aacute;ch nhiệm ch&iacute;nh trong việc quản l&yacute; t&agrave;i ch&iacute;nhv&agrave; kiểm so&aacute;t rủi ro, l&ecirc;n kế hoạch t&agrave;i ch&iacute;nh v&agrave; b&aacute;o c&aacute;o l&ecirc;n c&aacute;c cấp quản l&yacute; cao hơn trong doanh nghiệp. Đến nay vai tr&ograve; của Gi&aacute;m đốc T&agrave;i ch&iacute;nh -CFOđ&atilde; thay đổi từ việc cung cấp g&oacute;c nh&igrave;n \"gương phản chiếu\" sang vai tr&ograve; của một nh&agrave; tư vấn chiến lược v&agrave; định hướng đi tương lai cho doanh nghiệp.<br /><br />Nhằm cung cấp kiến thức cần c&oacute; của một Gi&aacute;m đốc T&agrave;i ch&iacute;nh với c&aacute;c vai tr&ograve; chủ lực như : Quản trị t&agrave;i ch&iacute;nh, chiến lược t&agrave;i ch&iacute;nh, thương vụ t&agrave;i ch&iacute;nh, tổ chức bộ m&aacute;y v&agrave; truyền th&ocirc;ng t&agrave;i ch&iacute;nh v&agrave; cũng đồng thời chuẩn bị cho Tổng c&ocirc;ng ty những Gi&aacute;m đốc T&agrave;i ch&iacute;nh chuy&ecirc;n nghiệp để phục vụ cho bước ph&aacute;t triển lớn mạnh hơn của Tổng c&ocirc;ng ty trong tương lai.<br /><br />Ban l&atilde;nh đạo Tổng c&ocirc;ng ty Kh&aacute;nh Việt đ&atilde; quyết định phải tổ chức kh&oacute;a đ&agrave;o tạo \"Gi&aacute;m đốc T&agrave;i ch&iacute;nh - Chief Financial Officer - CFO\". Bộ phận đ&agrave;o tạo Tổng c&ocirc;ng ty đ&atilde; l&agrave;m việc với 5 đơn vị đ&agrave;o tạo, tổ chức khảo s&aacute;t trước đ&agrave;o tạo. Cuối c&ugrave;ng sau qu&aacute; tr&igrave;nh lựa chọn một c&aacute;ch cẩn trọng, kh&aacute;ch quan; Viện Quản trị v&agrave; T&agrave;i ch&iacute;nh (IFA) đ&atilde; được &ldquo;chọn mặt gửi v&agrave;ng&rdquo; để k&yacute; hợp đồng với Tổng c&ocirc;ng ty.<br /><br />Mội chương tr&igrave;nh đ&agrave;o tạo được thiết kế v&agrave; cung cấp bởi Viện IFA đều được th&ocirc;ng qua c&aacute;c bước thiết lập quy tr&igrave;nh đ&agrave;o tạo do Viện IFA x&acirc;y dựng v&agrave; ph&aacute;t triển trong gần 10 năm hoạt động của Viện IFA. Ch&uacute;ng t&ocirc;i cam kết chất lượng đ&agrave;o tạo th&ocirc;ng qua quy tr&igrave;nh - giảng vi&ecirc;n - chuy&ecirc;n gia v&agrave; những dịch vụ đ&agrave;o tạo k&egrave;m theo. Đội ngũ giảng vi&ecirc;n vừa c&oacute; bằng cấp (thạc sỹ, tiến sỹ), c&oacute; phương ph&aacute;p giảng dạy; vừa c&oacute; kinh nghiệm thực tiễn (ki&ecirc;m nhiệm ban l&atilde;nh đạo c&aacute;c c&ocirc;ng ty), c&oacute; khả năng tư vấn, cố vấn. B&ecirc;n cạnh đ&oacute; Viện IFA l&agrave; đơn vị đ&atilde; đ&agrave;o tạo cho Khatoco 2 kh&oacute;a \"Gi&aacute;m đốc Điều h&agrave;nh - CEO\" trong 2 năm 2015, 2016. V&agrave; cho đến h&ocirc;m nay sự hợp t&aacute;c giữa IFA &amp; Khatoco đ&atilde; mang đến th&agrave;nh quả tốt đẹp l&agrave; 3 kh&oacute;a đ&agrave;o tạo d&agrave;i ng&agrave;y đ&atilde; th&agrave;nh c&ocirc;ng.<br /><br />Chương tr&igrave;nh Lớp CFO kỳ n&agrave;y gồm c&oacute; 12 chuy&ecirc;n đề, 38 buổi học; l&agrave; một chương tr&igrave;nh đầy đủ, chi tiết, mở rộng hơn nhiều so với chương tr&igrave;nh tại c&aacute;c trung t&acirc;m đ&agrave;o tạo. Chương tr&igrave;nh lại cũng ngắn gọn, ph&ugrave; hợp với đối tượng người đang đi l&agrave;m. B&ecirc;n cạnh c&aacute;c chuy&ecirc;n đề th&ocirc;ng thường phải c&oacute; của 1 Lớp CFO; một số chuy&ecirc;n đề c&oacute; t&iacute;nh định hướng cho tương lai như: Chiến lược t&agrave;i ch&iacute;nh, thị trường chứng kho&aacute;n, kế to&aacute;n quốc tế; nguy&ecirc;n tắc x&acirc;y dựng, lựa chọn c&aacute;c phần mềm kế to&aacute;n thực h&agrave;nh&hellip;<br /><br />Chương tr&igrave;nh đ&agrave;o tạo CFO được Viện IFA hợp t&aacute;c với Trường Đại học C&ocirc;ng lập California State University, Dominguez Hill (CSUDH), USA c&oacute; trụ sở tại Los Angeles thuộc hệ thống Đại học C&ocirc;ng lập California của Mỹ c&oacute; lịch sử hơn 53 năm (tham khảo th&ecirc;m th&ocirc;ng tin tại: wwwcsudh.edu). Cuối kho&aacute; đ&agrave;o tạo CFO, ngo&agrave;i chứng chỉ do Viện IFA cấp để chứng nhận việc ho&agrave;n th&agrave;nh kh&oacute;a học, th&igrave; kết quả học tập của học vi&ecirc;n cũng sẽ được c&ocirc;ng nhận v&agrave; cấp chứng chỉ của CSUDH c&oacute; gi&aacute; trị Quốc tế như một chứng minh cho gi&aacute; trị thực học v&agrave; khả năng ứng dụng kiến thức v&agrave;o thực tế c&ocirc;ng việc</p>\r\n<p style=\"text-align: justify;\">Kh&oacute;a đ&agrave;o tạo CFO đ&atilde; khai giảng ng&agrave;y 19/05/2017. 27 học vi&ecirc;n của Lớp l&agrave; kế to&aacute;n trưởng, kế to&aacute;n tổng hợp, quy hoạch c&aacute;n bộ nguồn chức danh kế to&aacute;n trưởng; kiểm so&aacute;t nội bộ; một số quản l&yacute; cấp trung v&agrave; l&atilde;nh đạo tại c&aacute;c đơn vị thuộc Tổng c&ocirc;ng ty. Lớp học được tổ chức v&agrave;o cuối tuần thứ S&aacute;u v&agrave; thứ Bảy, n&ecirc;n c&aacute;c học vi&ecirc;n đ&atilde; phải nỗ lực phấn đấu để vừa ho&agrave;n th&agrave;nh c&ocirc;ng việc chuy&ecirc;n m&ocirc;n tại nơi c&ocirc;ng t&aacute;c; sắp xếp việc gia đ&igrave;nh; vừa tham gia đầy đủ c&aacute;c buổi học, đảm bảo việc tiếp thu kiến thức. Sau 3 th&aacute;ng học tập, đến ng&agrave;y 08/09/2017 đ&atilde; diễn ra kỳ thi tốt nghiệp cuối kh&oacute;a. Kết quả 27 học vi&ecirc;n đều đạt điểm tốt nghiệp từ 8 điểm trở l&ecirc;n. Trong đ&oacute; 6 học vi&ecirc;n xuất sắc nhất kh&oacute;a đạt điểm 9,5.<br /><br />Ph&aacute;t biểu tại Lễ Bế giảng, &ocirc;ng Nguyễn Đ&igrave;nh Hương &ndash; Ph&oacute; Tổng Gi&aacute;m đốc Tổng c&ocirc;ng ty Kh&aacute;nh Việt chia sẻ: &ldquo;Hi vọng v&agrave; tin tưởng rằng c&aacute;c học vi&ecirc;n l&agrave; đội ngũ kế to&aacute;n ch&uacute;ng ta với những kiến thức đ&atilde; được tiếp thu trong vai tr&ograve; của m&igrave;nh sẽ:<br />+ Đ&aacute;nh gi&aacute;, ph&aacute;t hiện những g&igrave; đang tồn tại tại đơn vị của cần phải khắc phục v&agrave; phải triển khai c&aacute;c biện ph&aacute;p khắc phục những tồn tại đ&atilde; thấy được;<br />+ C&oacute; những kiến nghị, đề xuất c&aacute;c giải ph&aacute;p cho đơn vị cũng như cho Tổng c&ocirc;ng ty trong x&acirc;y dựng v&agrave; ph&aacute;t triển doanh nghiệp.&rdquo;<br /><br />Sau khi ho&agrave;n tất th&agrave;nh c&ocirc;ng chương tr&igrave;nh n&agrave;y, c&aacute;c học vi&ecirc;n Lớp CFO sẽ h&igrave;nh dung được vai tr&ograve;, tr&aacute;ch nhiệm v&agrave; chức năng của một CFO chuy&ecirc;n nghiệp với năm vai tr&ograve; chủ lực:<br />+ Vai tr&ograve; quản trị rủi ro t&agrave;i ch&iacute;nh: L&agrave; một c&aacute;n bộ quản l&yacute; t&agrave;i ch&iacute;nh, CFO nắm vững được thực trạng t&agrave;i ch&iacute;nh doanh nghiệp n&ecirc;n c&oacute; thể ngăn chặn ngay từ đầu c&aacute;c dấu hiệu xấu, từ đ&oacute; gi&uacute;p ngăn ngừa v&agrave; giảm thiểu rủi ro t&agrave;i ch&iacute;nh cho doanh nghiệp.<br />+ Vai tr&ograve; chiến lược: CFO nắm vai tr&ograve; chủ chốt trong việc gi&uacute;p Gi&aacute;m đốc điều h&agrave;nh hoạch định c&aacute;c chiến lược t&agrave;i ch&iacute;nh về ngắn, trung, d&agrave;i hạn.<br />+ Vai tr&ograve; thiết kế thương vụ: CFO quan hệ vay vốn, thu xếp nguồn vốn để trả nợ, đ&aacute;nh gi&aacute; chỉ ti&ecirc;u t&agrave;i ch&iacute;nh của c&aacute;c dự &aacute;n đầu tư, t&aacute;c động l&ecirc;n c&aacute;c mục ti&ecirc;u d&agrave;i hạn...<br />+ Vai tr&ograve; tổ chức: CFO l&agrave; người tổ chức, x&acirc;y dựng bộ m&aacute;y kế to&aacute;n, t&agrave;i ch&iacute;nh, kiểm so&aacute;t nội bộ tại đơn vị m&igrave;nh v&agrave; với những anh chị em l&agrave;m việc tại Văn ph&ograve;ng Tổng c&ocirc;ng ty c&ograve;n tham mưu cho Ban l&atilde;nh đạo Tổng c&ocirc;ng ty về c&ocirc;ng t&aacute;c tổ chức bộ m&aacute;y kế to&aacute;n, t&agrave;i ch&iacute;nh, kiểm so&aacute;t nội bộ tại c&aacute;c đơn vị trực thuộc.<br />+ Vai tr&ograve; truyền th&ocirc;ng: CFO l&agrave; người tạo dựng được uy t&iacute;n v&agrave; niềm tin của cộng đồng t&agrave;i ch&iacute;nh, đầu tư, kinh doanh v&agrave; b&aacute;o ch&iacute;...<br />Đội ngũ t&agrave;i ch&iacute;nh, kế to&aacute;n của Tổng C&ocirc;ng ty với những kiến thức mới được trang bị sẽ mang lại nhiều hiệu quả kinh doanh hơn nữa cho Tổng C&ocirc;ng ty v&agrave; từng đơn vị, trước mắt sẽ đ&oacute;ng g&oacute;p nhiều tr&iacute; tuệ v&agrave; năng lực cho tiến tr&igrave;nh thực hiện c&ocirc;ng t&aacute;c cổ phần h&oacute;a to&agrave;n tổng c&ocirc;ng ty theo lộ tr&igrave;nh của Ch&iacute;nh phủ.<br /><br />Một số h&igrave;nh ảnh của Lễ Bế giảng:</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-giam-doc-tai-chinh-cfo.jpg\" alt=\"dao-tao-inhouse-giam-doc-tai-chinh-cfo\" /></p>\r\n<div style=\"text-align: center;\"><em>&Ocirc;ng Nguyễn Đ&igrave;nh Hương &ndash; Ph&oacute; Tổng Gi&aacute;m đốc Tổng c&ocirc;ng ty Kh&aacute;nh Việt (Khatoco) ph&aacute;t biểu tại Lễ Bế giảng</em></div>\r\n<p style=\"text-align: center;\"><img src=\"../../../contents/uploads/2021/04/ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa.jpg\" alt=\"ong-nguyen-the-nhan-pho-vien-truong-vien-quan-tri-va-tai-chinh-ifa\" /></p>\r\n<div style=\"text-align: center;\"><em>&Ocirc;ng Nguyễn Thế Nh&acirc;n, Ph&oacute; Viện trưởng Viện Quản trị v&agrave; T&agrave;i ch&iacute;nh(IFA) ph&aacute;t biểu tại Lễ Bế giảng</em></div>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/do-viet-phuong-ke-toan-truong.jpg\" alt=\"do-viet-phuong-ke-toan-truong\" /></p>\r\n<div style=\"text-align: center;\"><em>Anh Đỗ Việt Phường, Kế to&aacute;n trưởng Nh&agrave; m&aacute;y Thuốc l&aacute; Khatoco Kh&aacute;nh H&ograve;a &ndash; Lớp trưởng thay mặt học vi&ecirc;n Lớp CFO c&aacute;m ơn L&atilde;nh đạo Khatoco v&agrave; Viện IFA</em></div>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-giam-doc-tai-chinh-cfo-2.jpg\" alt=\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-2\" /></p>\r\n<div style=\"text-align: center;\"><em>&Ocirc;ng Nguyễn Đ&igrave;nh Hương &ndash; Ph&oacute; Tổng Gi&aacute;m đốc Tổng c&ocirc;ng ty Kh&aacute;nh Việt (Khatoco) tặng qu&agrave; của L&atilde;nh đạo Tổng c&ocirc;ng ty cho 6 học vi&ecirc;n đạt điểm thi tốt nghiệp xuất sắc nhất kh&oacute;a</em></div>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-giam-doc-tai-chinh-cfo-3.jpg\" alt=\"dao-tao-inhouse-giam-doc-tai-chinh-cfo-3\" /></p>\r\n<div style=\"text-align: center;\"><em>27 học vi&ecirc;n Lớp CFO chụp ảnh lưu niệm với &ocirc;ng Nguyễn Đ&igrave;nh Hương v&agrave; &ocirc;ng Nguyễn Thế Nh&acirc;n</em></div>', '[ĐÀO TẠO INHOUSE] - LỄ BẾ GIẢNG KHÓA ĐÀO TẠO \"GIÁM ĐỐC TÀI CHÍNH - CFO\" - KHATOCO', '', 'publish', 'open', 'open', '[dao-tao-inhouse]---le-be-giang-khoa-dao-tao-\"giam-doc-tai-chinh---cfo\"---khatoco', '2021-04-28 13:59:54', 0, 'post', '', 0),
(249, 1, '2021-04-28 14:14:34', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg', '2021-04-28 14:16:52', 0, 'attachment', 'image/jpeg', 0),
(250, 1, '2021-04-28 14:14:34', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg', '2021-04-28 14:16:02', 0, 'attachment', 'image/jpeg', 0),
(251, 1, '2021-04-28 14:14:36', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg', '2021-04-28 14:16:17', 0, 'attachment', 'image/jpeg', 0),
(252, 1, '2021-04-28 14:14:36', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg', '2021-04-28 14:16:36', 0, 'attachment', 'image/jpeg', 0),
(253, 1, '2021-04-28 14:14:36', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg', '2021-04-28 14:16:41', 0, 'attachment', 'image/jpeg', 0),
(254, 1, '2021-04-28 14:14:42', '', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-7-min.jpg', '', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-7-min.jpg', '2021-04-28 14:14:42', 0, 'attachment', 'image/jpeg', 0),
(255, 1, '2021-04-28 14:14:42', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg', '2021-04-28 14:17:20', 0, 'attachment', 'image/jpeg', 0),
(256, 1, '2021-04-28 14:14:43', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg', '2021-04-28 14:17:38', 0, 'attachment', 'image/jpeg', 0),
(257, 1, '2021-04-28 14:14:43', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg', '2021-04-28 14:18:05', 0, 'attachment', 'image/jpeg', 0),
(258, 1, '2021-04-28 14:14:43', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg', '2021-04-28 14:15:43', 0, 'attachment', 'image/jpeg', 0),
(259, 1, '2021-04-28 14:15:27', '<p style=\"text-align: justify;\">Ng&agrave;y 15 v&agrave; 16 th&aacute;ng 11 vừa qua, tại huyện Long Th&agrave;nh, Tỉnh Đồng Nai, Viện Quản Trị v&agrave; T&agrave;i Ch&iacute;nh IFA đ&atilde; li&ecirc;n kết với C&ocirc;ng ty Sonadezi khai giảng Kh&oacute;a đ&agrave;o tạo \"Kỹ năng mềm cho quản l&yacute; cấp trung\" d&agrave;nh cho c&aacute;c anh chị nh&acirc;n vi&ecirc;n của C&ocirc;ng ty Sonadezi với dự tham gia giảng dạy của Thầy Nguyễn Ch&iacute; B&igrave;nh. Kh&oacute;a đ&agrave;o tạo tr&ecirc;n nằm trong khu&ocirc;n khổ c&aacute;c hoạt động đ&agrave;o tạo được li&ecirc;n kết tổ chức thường ni&ecirc;n giữa C&ocirc;ng ty Sonadezi v&agrave; Viện Quản Trị v&agrave; T&agrave;i Ch&iacute;nh IFA.</p>\r\n<p style=\"text-align: justify;\">Trong quá trình phát tri&ecirc;̉n của xã h&ocirc;̣i, t&acirc;́t cả các Doanh nghi&ecirc;̣p lu&ocirc;n lu&ocirc;n thay đ&ocirc;̉i cả v&ecirc;̀ cơ c&acirc;́u t&ocirc;̉ chức, nh&acirc;n sự, hợp tác cũng như sản ph&acirc;̉m, áp dụng c&ocirc;ng ngh&ecirc;̣, sáng tạo. Nhưng làm th&ecirc;́ nào đ&ecirc;̉ đưa ra những chi&ecirc;́n lược và phương pháp quản lý phù hợp với những thay đ&ocirc;̉i đang di&ecirc;̃n ra và củng c&ocirc;́, duy trì sự thay đ&ocirc;̉i theo chi&ecirc;̀u hướng tích cực có lợi cho Doanh nghi&ecirc;̣p?</p>\r\n<p style=\"text-align: justify;\">Chương trình Đào tạo \"Kỹ năng mềm cho quản l&yacute; cấp trung\" do Viện IFA cung c&acirc;́p được giảng dạy bởi TS Nguyễn Ch&iacute; B&igrave;nh gi&uacute;p cho học vi&ecirc;n h&ecirc;̣ th&ocirc;́ng hóa và n&acirc;ng cao ki&ecirc;́n thức, kỹ năng cũng như kinh nghi&ecirc;̣m c&acirc;̀n thi&ecirc;́t v&ecirc;̀ quản lý t&ocirc;̉ chức, áp dụng vào thực t&ecirc;́ của Doanh nghi&ecirc;̣p, giúp các Doanh nghi&ecirc;̣p lu&ocirc;n chủ đ&ocirc;̣ng với sự thay đ&ocirc;̉i và phát tri&ecirc;̉n b&ecirc;̀n vững. Chương tr&igrave;nh đ&atilde; cung cấp kiến thức v&agrave; r&egrave;n luyện kỹ năng, tư duy của một quản l&yacute; cấp trung trong doanh nghiệp. Phương ph&aacute;p giảng dạy ch&uacute; trọng học qua trải nghiệm (thực h&agrave;nh, Case Study, thảo luận nh&oacute;m, tr&ograve; chơi&hellip;), chia sẻ kinh nghiệm thực tiễn, b&agrave;i tập m&ocirc; phỏng&hellip;mang đến kh&ocirc;ng kh&iacute; thoải m&aacute;i v&agrave; tiếp thu hiệu quả của c&aacute;c anh chị học vi&ecirc;n.</p>\r\n<p style=\"text-align: justify;\">Đến với buổi đ&agrave;o tạo, c&aacute;c anh chị học vi&ecirc;n rất h&agrave;o hứng v&agrave; t&iacute;ch cực tham gia kh&oacute;a học n&agrave;y. Ngo&agrave;i việc tiếp thu l&yacute; thuyết của giảng vi&ecirc;n, c&aacute;c anh chị c&ograve;n được chia sẻ kinh nghiệp v&agrave; truyền tải những th&ocirc;ng điệp &yacute; nghĩa để \"tiếp sức\" th&ecirc;m nhiều đam m&ecirc; v&agrave; nhiệt huyết trong c&ocirc;ng việc, để c&oacute; th&ecirc;m nhiều động lực để vượt kh&oacute; trong qu&aacute; tr&igrave;nh c&ocirc;ng t&aacute;c.</p>\r\n<p style=\"text-align: justify;\">Một số h&igrave;nh ảnh đ&aacute;ng ch&uacute; &yacute; của kh&oacute;a học:</p>\r\n<p style=\"text-align: justify;\"><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg.jpg\" alt=\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-min.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg.jpg\" alt=\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-2-min.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg.jpg\" alt=\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-3-min.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg.jpg\" alt=\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-4-min.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg.jpg\" alt=\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-5-min.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg.jpg\" alt=\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-6-min.jpg\" /></p>\r\n<p style=\"text-align: justify;\"><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg.jpg\" alt=\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-8-min.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg.jpg\" alt=\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-9-min.jpg\" /></p>\r\n<p style=\"text-align: justify;\"><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg.jpg\" alt=\"dao-tao-inhouse-ky-nang-mem-quan-ly-cap-trung-10-min.jpg\" /></p>', '[ĐÀO TẠO INHOUSE] - KỸ NĂNG MỀM CHO QUẢN LÝ CẤP TRUNG - TS. NGUYỄN CHÍ BÌNH', '', 'publish', 'open', 'open', '[dao-tao-inhouse]---ky-nang-mem-cho-quan-ly-cap-trung---ts.-nguyen-chi-binh', '2021-04-28 14:18:08', 0, 'post', '', 0),
(264, 1, '2021-04-28 14:59:46', '<p style=\"text-align: justify;\">Ng&agrave;y 15 v&agrave; ng&agrave;y 16 th&aacute;ng 11 vừa qua, tại Th&agrave;nh phố Hồ Ch&iacute; Minh, Viện Quản Trị v&agrave; T&agrave;i Ch&iacute;nh IFA đ&atilde; li&ecirc;n kết với C&ocirc;ng ty Dược Việt Nam khai giảng kh&oacute;a đ&agrave;o tạo \"Kỹ năng b&aacute;n h&agrave;ng chuy&ecirc;n nghiệp\" d&agrave;nh cho c&aacute;c anh chị nh&acirc;n vi&ecirc;n của C&ocirc;ng ty Dược Việt Nam với dự tham gia giảng dạy của ThS. Nguyễn Mạnh Hiền. Kh&oacute;a đ&agrave;o tạo tr&ecirc;n nằm trong khu&ocirc;n khổ c&aacute;c hoạt động đ&agrave;o tạo được li&ecirc;n kết tổ chức thường ni&ecirc;n giữa C&ocirc;ng ty Dược Việt Nam v&agrave; Viện Quản Trị v&agrave; T&agrave;i Ch&iacute;nh IFA.</p>\r\n<p style=\"text-align: justify;\">Một nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng th&agrave;nh c&ocirc;ng cần phải trang bị những kiến thức cơ bản về kỹ năng b&aacute;n h&agrave;ng như giao tiếp trong b&aacute;n h&agrave;ng, nắm bắt t&acirc;m l&yacute; kh&aacute;ch h&agrave;ng, khả năng tr&igrave;nh b&agrave;y tốt về sản phẩm &ndash; dịch vụ, khả năng thuyết phục từ chối kh&aacute;ch h&agrave;ng hiệu quả v&agrave; chốt b&aacute;n h&agrave;ng. Ngo&agrave;i ra, một nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng chuy&ecirc;n nghiệp phải biết c&aacute;ch quản l&yacute;, chăm s&oacute;c kh&aacute;ch h&agrave;ng, ph&aacute;t triển mạng lưới kh&aacute;ch h&agrave;ng. Chương tr&igrave;nh đ&atilde; cung cấp kiến thức v&agrave; r&egrave;n luyện kỹ năng, tư duy b&aacute;n h&agrave;ng v&agrave; chăm s&oacute;c kh&aacute;ch h&agrave;ng chuy&ecirc;n nghiệp. Phương ph&aacute;p giảng dạy ch&uacute; trọng học qua trải nghiệm (thực h&agrave;nh, Case Study, thảo luận nh&oacute;m, tr&ograve; chơi&hellip;), chia sẻ kinh nghiệm thực tiễn, b&agrave;i tập m&ocirc; phỏng&hellip;mang đến kh&ocirc;ng kh&iacute; thoải m&aacute;i v&agrave; tiếp thu hiệu quả của c&aacute;c anh chị học vi&ecirc;n.</p>\r\n<p style=\"text-align: justify;\">Đến với buổi đ&agrave;o tạo, c&aacute;c anh chị học vi&ecirc;n rất h&agrave;o hứng v&agrave; t&iacute;ch cực tham gia kh&oacute;a học n&agrave;y. Ngo&agrave;i việc tiếp thu l&yacute; thuyết của giảng vi&ecirc;n, c&aacute;c anh chị c&ograve;n được chia sẻ kinh nghiệp v&agrave; truyền tải những th&ocirc;ng điệp &yacute; nghĩa để \"tiếp sức\" th&ecirc;m nhiều đam m&ecirc; v&agrave; nhiệt huyết trong c&ocirc;ng việc, để c&oacute; th&ecirc;m nhiều động lực để vượt kh&oacute; trong qu&aacute; tr&igrave;nh c&ocirc;ng t&aacute;c.</p>\r\n<p style=\"text-align: justify;\">Một số h&igrave;nh ảnh đ&aacute;ng ch&uacute; &yacute; của kh&oacute;a học:</p>\r\n<p style=\"text-align: justify;\"><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-min.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2-min.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3-min.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4-min.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4.jpg\" /></p>', '[ĐÀO TẠO INHOUSE] - KHÓA HỌC KỸ NĂNG BÁN HÀNG CHUYÊN NGHIỆP - THS. NGUYỄN MẠNH HIỀN', '', 'publish', 'open', 'open', '[dao-tao-inhouse]---khoa-hoc-ky-nang-ban-hang-chuyen-nghiep---ths.-nguyen-manh-hien', '2021-04-28 15:10:40', 0, 'post', '', 0),
(265, 1, '2021-04-28 15:08:47', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2.jpg', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2.jpg', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-2-min.jpg', '2021-04-28 15:09:54', 0, 'attachment', 'image/jpeg', 0),
(266, 1, '2021-04-28 15:08:47', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3.jpg', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3.jpg', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-3-min.jpg', '2021-04-28 15:10:09', 0, 'attachment', 'image/jpeg', 0),
(267, 1, '2021-04-28 15:08:48', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4.jpg', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4.jpg', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-4-min.jpg', '2021-04-28 15:10:38', 0, 'attachment', 'image/jpeg', 0),
(268, 1, '2021-04-28 15:08:48', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep.jpg', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep.jpg', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-ky-nang-ban-hang-chuyen-nghiep-min.jpg', '2021-04-28 15:09:36', 0, 'attachment', 'image/jpeg', 0),
(269, 1, '2021-04-29 03:36:20', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-29 03:36:59', 1, 'why_2', '', 0),
(270, 1, '2021-04-29 03:36:29', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-29 03:36:59', 2, 'why_2', '', 0),
(271, 1, '2021-04-29 03:36:40', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-29 03:36:59', 3, 'why_2', '', 0),
(272, 1, '2021-04-29 03:36:50', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-29 03:36:59', 4, 'why_2', '', 0),
(273, 1, '2021-04-29 03:36:59', '', '', '', 'publish', 'closed', 'closed', '', '2021-04-29 03:36:59', 0, 'why_2_object', '', 0),
(274, 1, '2021-04-30 09:08:42', '', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-1', '', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-1', '2021-04-30 09:08:42', 0, 'attachment', 'image/png', 0),
(275, 1, '2021-04-30 09:08:42', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2', '2021-04-30 09:09:46', 0, 'attachment', 'image/png', 0),
(276, 1, '2021-04-30 09:08:45', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3', '2021-04-30 09:09:55', 0, 'attachment', 'image/png', 0),
(277, 1, '2021-04-30 09:08:45', '', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung', '2021-04-30 09:09:38', 0, 'attachment', 'image/png', 0),
(278, 1, '2021-04-30 09:08:50', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4', '2021-04-30 09:10:04', 0, 'attachment', 'image/png', 0),
(279, 1, '2021-04-30 09:08:50', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5', '2021-04-30 09:10:10', 0, 'attachment', 'image/png', 0),
(280, 1, '2021-04-30 09:08:51', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6', '2021-04-30 09:11:08', 0, 'attachment', 'image/png', 0),
(281, 1, '2021-04-30 09:11:50', '<p style=\"text-align: justify;\">Kh&oacute;a học N&acirc;ng cao Năng lực Quản l&yacute; d&agrave;nh cho Đội ngũ Quản l&yacute; Cấp trung diễn ra tại Dược Hậu Giang. Với 4 ng&agrave;y học, kết hợp giữa kiến thức thực tiễn v&agrave; chia sẻ kinh nghiệm, giảng vi&ecirc;n v&agrave; học vi&ecirc;n đ&atilde; c&oacute; những ng&agrave;y học nhiều kiến thức, &yacute; nghĩa v&agrave; niềm vui. Những kỹ niệm đọng lại trong suốt kh&oacute;a học được thể hiện qua những tấm ảnh xinh đẹp v&agrave; lung linh.</p>\r\n<p><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung.png\" alt=\"\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2.png\" alt=\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-2\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3.png\" alt=\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-3\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4.png\" alt=\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-4\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5.png\" alt=\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-5\" /><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6.png\" alt=\"dao-tao-inhouse-nang-cao-nang-luc-quan-ly-cap-trung-6\" /></p>', '[ĐÀO TẠO INHOUSE] KHÓA ĐÀO TẠO NÂNG CAO NĂNG LỰC QUẢN LÝ CẤP TRUNG - MMM TẠI DƯỢC HẬU GIANG (DHG)', '', 'publish', 'open', 'open', '[dao-tao-inhouse]-khoa-dao-tao-nang-cao-nang-luc-quan-ly-cap-trung---mmm-tai-duoc-hau-giang-(dhg)', '2021-04-30 09:11:50', 0, 'post', '', 0),
(282, 1, '2021-04-30 09:23:17', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg', '2021-04-30 09:26:38', 0, 'attachment', 'image/jpeg', 0),
(283, 1, '2021-04-30 09:23:17', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg', '2021-04-30 09:25:54', 0, 'attachment', 'image/jpeg', 0),
(284, 1, '2021-04-30 09:23:18', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg', '2021-04-30 09:26:03', 0, 'attachment', 'image/jpeg', 0),
(285, 1, '2021-04-30 09:23:18', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg', '2021-04-30 09:26:12', 0, 'attachment', 'image/jpeg', 0),
(286, 1, '2021-04-30 09:23:19', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg', '2021-04-30 09:26:17', 0, 'attachment', 'image/jpeg', 0),
(287, 1, '2021-04-30 09:23:26', 'team-building-pv-oil.jpg', 'team-building-pv-oil.jpg', 'team-building-pv-oil.jpg', 'inherit', 'open', 'closed', 'team-building-pv-oil.jpg', '2021-04-30 09:27:42', 0, 'attachment', 'image/jpeg', 0),
(288, 1, '2021-04-30 09:23:26', 'team-building-pv-oil-1.jpg', 'team-building-pv-oil-1.jpg', 'team-building-pv-oil-1.jpg', 'inherit', 'open', 'closed', 'team-building-pv-oil-1.jpg', '2021-04-30 09:27:52', 0, 'attachment', 'image/jpeg', 0),
(289, 1, '2021-04-30 09:23:28', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg', '2021-04-30 09:26:47', 0, 'attachment', 'image/jpeg', 0),
(290, 1, '2021-04-30 09:23:28', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg', '2021-04-30 09:26:58', 0, 'attachment', 'image/jpeg', 0),
(291, 1, '2021-04-30 09:23:28', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-7.jpg', '2021-04-30 09:25:30', 0, 'attachment', 'image/jpeg', 0),
(292, 1, '2021-04-30 09:23:41', 'team-building-pv-oil-2.jpg', 'team-building-pv-oil-2.jpg', 'team-building-pv-oil-2.jpg', 'inherit', 'open', 'closed', 'team-building-pv-oil-2.jpg', '2021-04-30 09:27:58', 0, 'attachment', 'image/jpeg', 0),
(293, 1, '2021-04-30 09:23:41', 'team-building-pv-oil-3.jpg', 'team-building-pv-oil-3.jpg', 'team-building-pv-oil-3.jpg', 'inherit', 'open', 'closed', 'team-building-pv-oil-3.jpg', '2021-04-30 09:28:04', 0, 'attachment', 'image/jpeg', 0),
(294, 1, '2021-04-30 09:23:42', 'team-building-pv-oil-4.jpg', 'team-building-pv-oil-4.jpg', 'team-building-pv-oil-4.jpg', 'inherit', 'open', 'closed', 'team-building-pv-oil-4.jpg', '2021-04-30 09:28:09', 0, 'attachment', 'image/jpeg', 0),
(295, 1, '2021-04-30 09:25:02', '<p style=\"text-align: justify;\">Ng&agrave;y 09 v&agrave; ng&agrave;y 10 th&aacute;ng 09 vừa qua tại Th&agrave;nh phố Cần Thơ,&nbsp;<strong>Viện Quản trị v&agrave; T&agrave;i ch&iacute;nh IFA</strong>&nbsp;đ&atilde; li&ecirc;n kết với&nbsp;<strong>C&ocirc;ng ty CP Dầu kh&iacute; M&ecirc; K&ocirc;ng</strong>&nbsp;(PV OIL) khai giảng kh&oacute;a đ&agrave;o tạo cho&nbsp;<em>cửa h&agrave;ng trưởng</em>&nbsp;\"<strong>Kỹ năng b&aacute;n h&agrave;ng, chăm s&oacute;c kh&aacute;ch h&agrave;ng v&agrave; tạo động lực cho nh&acirc;n vi&ecirc;n</strong>\" do&nbsp;<strong>TS</strong>&nbsp;<strong><em>L&ecirc; Đỗ Duy &Acirc;n</em></strong>&nbsp;phụ tr&aacute;ch giảng dạy. Kh&oacute;a đ&agrave;o tạo nằm trong khu&ocirc;n khổ hoạt động đ&agrave;o tạo kết hợp với teambuilding được tổ chức thường ni&ecirc;n giữa C&ocirc;ng ty CP Dầu kh&iacute; M&ecirc; K&ocirc;ng c&ugrave;ng với Viện Quản Trị v&agrave; T&agrave;i Ch&iacute;nh IFA.</p>\r\n<p style=\"text-align: justify;\">Đến với buổi đ&agrave;o tạo, c&aacute;c anh chị học vi&ecirc;n rất h&agrave;o hứng v&agrave; t&iacute;ch cực tham gia kh&oacute;a học. Ngo&agrave;i việc tiếp thu l&yacute; thuyết của giảng vi&ecirc;n, c&aacute;c anh chị c&ograve;n được chia sẻ kinh nghiệm v&agrave; truyền tải qua những \"<strong>game</strong>\'\' mang lại những th&ocirc;ng điệp &yacute; nghĩa để \"<strong>tiếp sức</strong>\" th&ecirc;m nhiều đam m&ecirc; v&agrave; nhiệt huyết trong c&ocirc;ng việc, để c&oacute; th&ecirc;m nhiều động lực để vượt kh&oacute; trong qu&aacute; tr&igrave;nh c&ocirc;ng t&aacute;c.</p>\r\n<p style=\"text-align: justify;\">C&ugrave;ng xem lại h&igrave;nh ảnh hoạt động trong 2 ng&agrave;y qua:</p>\r\n<p style=\"text-align: justify;\"><strong>Đ&agrave;o tạo INHOUSE PV OIL NG&Agrave;Y 09/09</strong></p>\r\n<p style=\"text-align: justify;\"><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-1.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-2.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-3.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-4.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-5.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-hoc-cham-soc-khach-hang-6.jpg\" /></p>\r\n<p style=\"text-align: justify;\"><strong>TEAMBUILDING PV OIL NG&Agrave;Y 10/09</strong></p>\r\n<p style=\"text-align: justify;\"><img src=\"../../../contents/uploads/2021/04/team-building-pv-oil.jpg.jpg\" alt=\"team-building-pv-oil.jpg\" /><img src=\"../../../contents/uploads/2021/04/team-building-pv-oil-1.jpg.jpg\" alt=\"team-building-pv-oil-1.jpg\" /><img src=\"../../../contents/uploads/2021/04/team-building-pv-oil-2.jpg.jpg\" alt=\"team-building-pv-oil-2.jpg\" /><img src=\"../../../contents/uploads/2021/04/team-building-pv-oil-3.jpg.jpg\" alt=\"team-building-pv-oil-3.jpg\" /><img src=\"../../../contents/uploads/2021/04/team-building-pv-oil-4.jpg.jpg\" alt=\"team-building-pv-oil-4.jpg\" /></p>', '[ ĐÀO TẠO INHOUSE - TEAMBUILDING] KHÓA HỌC CHĂM SÓC KHÁCH HÀNG, KỸ NĂNG BÁN HÀNG VÀ TẠO ĐỘNG LỰC CHO NHÂN VIÊN - PV OIL', '', 'publish', 'open', 'open', '[-dao-tao-inhouse---teambuilding]-khoa-hoc-cham-soc-khach-hang,-ky-nang-ban-hang-va-tao-dong-luc-cho-nhan-vien---pv-oil', '2021-04-30 09:28:11', 0, 'post', '', 0),
(296, 1, '2021-04-30 09:32:18', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg', '2021-04-30 09:34:17', 0, 'attachment', 'image/jpeg', 0),
(297, 1, '2021-04-30 09:32:18', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg', '2021-04-30 09:34:25', 0, 'attachment', 'image/jpeg', 0),
(298, 1, '2021-04-30 09:32:22', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-7.png', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-7.png', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-7.png', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-7.png', '2021-04-30 09:35:51', 0, 'attachment', 'image/png', 0),
(299, 1, '2021-04-30 09:32:22', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png', '2021-04-30 09:35:15', 0, 'attachment', 'image/png', 0),
(300, 1, '2021-04-30 09:32:22', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg', '2021-04-30 09:33:30', 0, 'attachment', 'image/jpeg', 0),
(301, 1, '2021-04-30 09:32:22', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg', '2021-04-30 09:33:39', 0, 'attachment', 'image/jpeg', 0),
(302, 1, '2021-04-30 09:32:22', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg', '2021-04-30 09:33:49', 0, 'attachment', 'image/jpeg', 0),
(303, 1, '2021-04-30 09:32:22', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg', '2021-04-30 09:33:56', 0, 'attachment', 'image/jpeg', 0),
(304, 1, '2021-04-30 09:32:26', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg', '2021-04-30 09:34:08', 0, 'attachment', 'image/jpeg', 0),
(305, 1, '2021-04-30 09:35:53', '<p style=\"text-align: justify;\">Để tổ chức được kh&oacute;a học th&agrave;nh c&ocirc;ng,&nbsp;<strong>Tổng C&ocirc;ng ty Đạm Ph&uacute; Mỹ - Viện Quản trị v&agrave; T&agrave;i ch&iacute;nh</strong>&nbsp;đ&atilde; l&ecirc;n kế hoạch, trao đổi trong suốt 1 th&aacute;ng, hy vọng với quỹ thời gian ngắn ngủi nhưng đem đến đầy đủ kiến thức v&agrave; c&aacute;c kỹ năng cần thiết cho Anh/Chị Qu&yacute; c&ocirc;ng ty.<br />&nbsp;</p>\r\n<p style=\"text-align: justify;\">Trong 2 ng&agrave;y qua, dưới sự hỗ trợ nhiệt t&igrave;nh từ ban l&atilde;nh đạo, c&aacute;c giảng vi&ecirc;n t&acirc;m huyết như<strong>&nbsp;PGS. TS. Ch&acirc;u Minh Kh&ocirc;i</strong>&nbsp;(<em>Trường ĐH Cần Thơ</em>) v&agrave;&nbsp;<strong>TS. L&ecirc; Đỗ Duy &Acirc;n</strong>&nbsp;(<em>Giảng vi&ecirc;n Viện Quản trị v&agrave; T&agrave;i ch&iacute;nh</em>), để c&oacute; thể đạt được mục ti&ecirc;u giảng dạy kh&ocirc;ng thể kể đến sự nỗ lực của học vi&ecirc;n.</p>\r\n<p style=\"text-align: justify;\">Đến với kh&ocirc;ng kh&iacute; kh&oacute;a Tập huấn n&agrave;y, học vi&ecirc;n kh&ocirc;ng những được học hỏi chia sẻ kinh nghiệm từ ch&iacute;nh bản th&acirc;n, đồng thời học hỏi từ c&aacute;c ph&ograve;ng ban kh&aacute;c - từ đ&oacute; thấu hiểu những kh&oacute; khăn của Tổ chức, c&ugrave;ng nhau trao đổi với giảng vi&ecirc;n v&agrave; Qu&yacute; c&ocirc;ng ty t&igrave;m ra&nbsp;<strong><em>\"n&uacute;t thắt\"</em></strong>&nbsp;v&agrave; giải quyết c&aacute;c vấn đề&nbsp;<strong><em>\"đau đầu\"</em></strong>&nbsp;th&ocirc;ng qua t&igrave;nh huống v&agrave; những gi&acirc;y ph&uacute;t thảo luận g&acirc;y cấn, đầy s&ocirc;i nổi.</p>\r\n<p style=\"text-align: justify;\">C&ugrave;ng xem lại những h&igrave;nh ảnh v&agrave; video t&oacute;m tắt lại qu&aacute; tr&igrave;nh học tập của ch&iacute;nh bản th&acirc;n trong 2 ng&agrave;y qua.</p>\r\n<p><strong>Ng&agrave;y đầu ti&ecirc;n (29/09/2020)</strong></p>\r\n<p><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep.jpg\" /></p>\r\n<p><strong>Tổng quan lớp học KIẾN THỨC N&Ocirc;NG NGHIỆP</strong></p>\r\n<p><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-1.jpg\" /></p>\r\n<p><em><strong>do PGS. TS. Ch&acirc;u Minh Kh&ocirc;i giảng dạy</strong></em></p>\r\n<p><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-2.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-3.jpg\" /></p>\r\n<p><em>Học hỏi, thực nghiệm qua c&aacute;c th&iacute; nghiệm mẫu</em></p>\r\n<p><strong>Ng&agrave;y thứ 2 (30/09/2020), KỸ NĂNG B&Aacute;N H&Agrave;NG</strong></p>\r\n<p><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-4.jpg\" /></p>\r\n<p><em><strong>do TS. L&ecirc; Đỗ Duy &Acirc;n phụ tr&aacute;ch giảng dạy</strong></em></p>\r\n<p><em><strong><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-5.jpg\" /><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg.jpg\" alt=\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-6.jpg\" /></strong></em></p>\r\n<p><em>Thảo luận - Trao đổi - X&acirc;y dựng &yacute; kiến<br /></em></p>\r\n<p><em><img src=\"../../../contents/uploads/2021/04/dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png.png\" alt=\"dao-tao-inhouse-khoa-tap-huan-kien-thuc-nong-nghiep-8.png\" /></em></p>\r\n<p style=\"text-align: justify;\">Ch&uacute;c qu&yacute; học vi&ecirc;n sức khỏe, th&agrave;nh c&ocirc;ng trong cuộc sống v&agrave; c&ocirc;ng việc, hẹn gặp Anh/Chị trong tương lai gần với nhiều chia sẻ th&uacute; vị hơn nữa.</p>', '[ ĐÀO TẠO INHOUSE] - KHÓA TẬP HUẤN KIẾN THỨC NÔNG NGHIỆP, MARKETING VÀ KỸ NĂNG BÁN HÀNG - PVFCCO', '', 'publish', 'open', 'open', '[-dao-tao-inhouse]---khoa-tap-huan-kien-thuc-nong-nghiep,-marketing-va-ky-nang-ban-hang---pvfcco', '2021-04-30 09:37:15', 0, 'post', '', 0),
(306, 1, '2021-05-01 09:12:49', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg', '2021-05-01 09:13:53', 0, 'attachment', 'image/jpeg', 0),
(307, 1, '2021-05-01 09:12:49', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg', '2021-05-01 09:14:03', 0, 'attachment', 'image/jpeg', 0),
(308, 1, '2021-05-01 09:12:49', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg', '2021-05-01 09:14:12', 0, 'attachment', 'image/jpeg', 0),
(309, 1, '2021-05-01 09:12:49', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-5.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-5.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-5.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-5.jpg', '2021-05-01 09:15:18', 0, 'attachment', 'image/jpeg', 0),
(310, 1, '2021-05-01 09:12:50', '', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-6.jpg', '', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-6.jpg', '2021-05-01 09:12:50', 0, 'attachment', 'image/jpeg', 0),
(311, 1, '2021-05-01 09:12:50', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg', '2021-05-01 09:13:31', 0, 'attachment', 'image/jpeg', 0),
(312, 1, '2021-05-01 09:12:50', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg', '2021-05-01 09:13:44', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `posts` (`ID`, `post_author`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_name`, `post_modified`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(313, 1, '2021-05-01 09:15:28', '<p style=\"text-align: justify;\">Trong hai ng&agrave;y 16-17/10/2020 vừa qua,&nbsp;<em><strong>Viện Quản trị v&agrave; T&agrave;i ch&iacute;nh - CN Cần Thơ</strong></em>&nbsp;phối hợp với&nbsp;<strong>C&ocirc;ng ty TNHH NN MTV XỔ SỐ KIẾN THIẾT CẦN THƠ</strong>&nbsp;tổ chức chương tr&igrave;nh đ&agrave;o tạo \"<strong><em>Nghi&ecirc;n cứu thị trường v&agrave; X&acirc;y dựng chiến lược kinh doanh</em></strong>\"cho CBNV C&ocirc;ng ty. Kh&oacute;a học đ&agrave;o tạo theo nhu cầu của C&ocirc;ng ty v&agrave; do giảng vi&ecirc;n&nbsp;<strong>ThS. Đo&agrave;n Đức Minh</strong>&nbsp;thuyết giảng.</p>\r\n<p style=\"text-align: justify;\">Với chia sẻ kinh nghiệm th&uacute; vị, theo chương tr&igrave;nh đ&agrave;o tạo như &Yacute; tưởng kinh doanh, Nghi&ecirc;n cứu v&agrave; ph&acirc;n t&iacute;ch thị trường, Lựa chọn chiến lược v&agrave; x&acirc;y dựng kế hoạch kinh doanh, Triển khai v&agrave; đ&aacute;nh gi&aacute; hiệu quả kinh doanh,... c&ugrave;ng c&aacute;c Anh/Chị C&ocirc;ng ty học hỏi v&agrave; trao đổi với giảng vi&ecirc;n th&ocirc;ng qua c&aacute;c \'\'<em>hoạt động nh&oacute;m\'\'</em>, giả định m&ocirc; h&igrave;nh v&agrave; thuyết tr&igrave;nh kế hoạch kinh doanh.</p>\r\n<p style=\"text-align: justify;\">&nbsp;Th&ocirc;ng qua, c&aacute;c b&agrave;i học học vi&ecirc;n nắm r&otilde; c&aacute;c kỹ năng cũng như kiến thức cần c&oacute; để ph&aacute;t triển cho tương lại. Điểm lại những hoạt động nổi trội trong 2 ng&agrave;y qua qua c&aacute;c h&igrave;nh ảnh lớp học dưới đ&acirc;y.</p>\r\n<p style=\"text-align: justify;\"><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg.jpg\" alt=\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg.jpg\" alt=\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-1.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg.jpg\" alt=\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-2.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg.jpg\" alt=\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-3.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg.jpg\" alt=\"dao-tao-inhouse-nghien-cuu-thi-truong-ke-hoach-kinh-doanh-4.jpg\" /></p>', '[ĐÀO TẠO INHOUSE] - NGHIÊN CỨU THỊ TRƯỜNG VÀ XÂY DỰNG KẾ HOẠCH KINH DOANH - THS. ĐOÀN ĐỨC MINH', '', 'publish', 'open', 'open', '[dao-tao-inhouse]---nghien-cuu-thi-truong-va-xay-dung-ke-hoach-kinh-doanh---ths.-doan-duc-minh', '2021-05-01 09:15:28', 0, 'post', '', 0),
(314, 1, '2021-05-01 09:23:28', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg', '2021-05-01 09:24:12', 0, 'attachment', 'image/jpeg', 0),
(315, 1, '2021-05-01 09:23:28', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg', '2021-05-01 09:24:19', 0, 'attachment', 'image/jpeg', 0),
(316, 1, '2021-05-01 09:23:29', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg', '2021-05-01 09:24:25', 0, 'attachment', 'image/jpeg', 0),
(317, 1, '2021-05-01 09:23:29', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg', '2021-05-01 09:25:24', 0, 'attachment', 'image/jpeg', 0),
(318, 1, '2021-05-01 09:23:29', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-4.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-4.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-4.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-4.jpg', '2021-05-01 09:24:41', 0, 'attachment', 'image/jpeg', 0),
(319, 1, '2021-05-01 09:25:26', '<p style=\"text-align: justify;\">Với sự giảng dạy t&acirc;m huyết của Thầy Nguyễn Ch&iacute; B&igrave;nh v&agrave; Thầy L&ecirc; Duy Quang, mang đến lớp học những cải tiến mới trong kỹ năng l&atilde;nh đạo v&agrave; s&aacute;ng tạo trong từng chuy&ecirc;n mục. Song c&ugrave;ng với sự nhiệt huyết, năng nổ của Anh/Chị Tập đo&agrave;n CP Group đ&atilde; g&oacute;p phần th&agrave;nh c&ocirc;ng cho kh&oacute;a học</p>\r\n<p style=\"text-align: justify;\">C&ugrave;ng nh&igrave;n lại th&agrave;nh quả của kh&oacute;a học trong c&aacute;c ng&agrave;y qua</p>\r\n<p style=\"text-align: justify;\">Ng&agrave;y 10/11/2020, chuy&ecirc;n đề \'\'Tư duy chiến lược d&agrave;nh cho l&atilde;nh đạo\'\' - Thầy Nguyễn Ch&iacute; B&igrave;nh</p>\r\n<p><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-1.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-2.jpg\" /></p>\r\n<p><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg\" /></p>\r\n<p>Ng&agrave;y 11/11/2020, chuy&ecirc;n đề \"Kỹ năng l&atilde;nh đạo cho nh&agrave; Quản l&yacute; cao cấp\'\' - Thầy L&ecirc; Duy Quang</p>\r\n<p><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg\" /></p>\r\n<p><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg.jpg\" alt=\"dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-3.jpg\" /></p>', '[ĐÀO TẠO INHOUSE] KHÓA ĐÀO TẠO SD3 QUẢN TRỊ DOANH NGHIỆP CAO CẤP CHO CP GROUP', '', 'publish', 'open', 'open', '[dao-tao-inhouse]-khoa-dao-tao-sd3-quan-tri-doanh-nghiep-cao-cap-cho-cp-group', '2021-05-04 15:19:47', 0, 'post', '', 0),
(320, 1, '2021-05-04 15:12:53', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-6.jpg', '2021-05-04 15:14:24', 0, 'attachment', 'image/jpeg', 0),
(321, 1, '2021-05-04 15:12:53', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-7.jpg', '2021-05-04 15:14:56', 0, 'attachment', 'image/jpeg', 0),
(322, 1, '2021-05-04 15:12:54', '', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-8.jpg', '', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-8.jpg', '2021-05-04 15:12:54', 0, 'attachment', 'image/jpeg', 0),
(323, 1, '2021-05-04 15:12:54', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-9.jpg', '2021-05-04 15:17:15', 0, 'attachment', 'image/jpeg', 0),
(324, 1, '2021-05-04 15:12:55', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-10.jpg', '2021-05-04 15:17:30', 0, 'attachment', 'image/jpeg', 0),
(325, 1, '2021-05-04 15:12:55', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-11.jpg', '2021-05-04 15:17:39', 0, 'attachment', 'image/jpeg', 0),
(326, 1, '2021-05-04 15:12:56', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-12.jpg', '2021-05-04 15:17:47', 0, 'attachment', 'image/jpeg', 0),
(327, 1, '2021-05-04 15:12:56', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-13.jpg', '2021-05-04 15:17:55', 0, 'attachment', 'image/jpeg', 0),
(328, 1, '2021-05-04 15:12:57', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg', 'inherit', 'open', 'closed', 'dao-tao-inhouse-quan-tri-doanh-nghiep-cao-cap-cp-group-5.jpg', '2021-05-04 15:14:48', 0, 'attachment', 'image/jpeg', 0),
(329, 1, '2021-05-04 15:36:20', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1.jpg-min', '2021-05-04 15:37:20', 0, 'attachment', 'image/jpeg', 0),
(330, 1, '2021-05-04 15:36:20', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2.jpg-min', '2021-05-04 15:37:36', 0, 'attachment', 'image/jpeg', 0),
(331, 1, '2021-05-04 15:36:21', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3.jpg-min', '2021-05-04 15:37:49', 0, 'attachment', 'image/jpeg', 0),
(332, 1, '2021-05-04 15:36:21', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4.jpg-min', '2021-05-04 15:38:02', 0, 'attachment', 'image/jpeg', 0),
(333, 1, '2021-05-04 15:36:21', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5.jpg-min', '2021-05-04 15:38:13', 0, 'attachment', 'image/jpeg', 0),
(334, 1, '2021-05-04 15:36:21', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6.jpg-min', '2021-05-04 15:38:24', 0, 'attachment', 'image/jpeg', 0),
(335, 1, '2021-05-04 15:36:22', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7.jpg-min', '2021-05-04 15:38:33', 0, 'attachment', 'image/jpeg', 0),
(336, 1, '2021-05-04 15:36:22', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min', 'inherit', 'open', 'closed', 'dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min', '2021-05-04 15:40:25', 0, 'attachment', 'image/jpeg', 0),
(337, 1, '2021-05-04 15:40:29', '<p>Ng&agrave;y 19 v&agrave; 20/09/2020</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min.jpg\" alt=\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco.jpg-min\" /></p>\r\n<p><strong>Quản trị Marketing v&agrave; thương hiệu cho l&atilde;nh đạo</strong>&nbsp;-<em>&nbsp;Th.s</em>&nbsp;Ho&agrave;ng Văn H&ograve;a</p>\r\n<p>Ng&agrave;y 26 v&agrave; 27/09/2020</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1.jpg-min.jpg\" alt=\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-1\" /></p>\r\n<p><strong>Ph&acirc;n t&iacute;ch b&aacute;o c&aacute;o T&agrave;i ch&iacute;nh, Ph&acirc;n t&iacute;ch v&agrave; lựa chọn phương &aacute;n đầu tư</strong>&nbsp;-&nbsp;<em>Th.s&nbsp;</em>Đo&agrave;n Đức Minh</p>\r\n<p>Ng&agrave;y 03 v&agrave; 04/10/2020</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2.jpg-min.jpg\" alt=\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-2\" /></p>\r\n<p><strong>Kỹ năng l&atilde;nh đạo giao việc v&agrave; Ủy th&aacute;c c&ocirc;ng việc</strong>&nbsp;-&nbsp;<em>TS.</em>&nbsp;L&ecirc; Tấn Phước</p>\r\n<p>Ng&agrave;y 10 v&agrave; 11/10/2020</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3.jpg-min.jpg\" alt=\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-3\" /></p>\r\n<p><strong>Nghi&ecirc;n cứu thị trường v&agrave; X&acirc;y dựng chiến lược kinh doanh</strong>&nbsp;-&nbsp;<em>Th.s</em>&nbsp;Đo&agrave;n Đức Minh</p>\r\n<p>Ng&agrave;y 17 v&agrave; 18/10/2020</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4.jpg-min.jpg\" alt=\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-4\" /></p>\r\n<p><strong>Quản trị nh&acirc;n sự d&agrave;nh cho l&atilde;nh đạo</strong>&nbsp;-&nbsp;<em>Th.s</em>&nbsp;Trần Thanh Hải</p>\r\n<p>Ng&agrave;y 24 v&agrave; 25/10/2020</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5.jpg-min.jpg\" alt=\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-5\" /></p>\r\n<p><strong>Ph&aacute;p luật trong kinh doanh</strong>&nbsp;-&nbsp;<em>Th.s</em>&nbsp;LS. L&ecirc; Minh Nhựt</p>\r\n<p>Ng&agrave;y 31/10 v&agrave; 01/11/2020</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6.jpg-min.jpg\" alt=\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-6\" /></p>\r\n<p><strong>Kỹ năng b&aacute;n h&agrave;ng v&agrave; X&acirc;y dựng hệ thống k&ecirc;nh ph&acirc;n phối</strong>&nbsp;-&nbsp;<em>Th.s</em>&nbsp;Trương Ngọc Mai Hương</p>\r\n<p>Ng&agrave;y 14 v&agrave; 15/11/2020, Bế giảng kh&oacute;a</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7.jpg-min.jpg\" alt=\"dao-tao-inhouse-giam-doc-dieu-hanh-ceo-giam-doc-kinh-doanh-cco-7\" /></p>\r\n<p><strong>Kỹ năng thuyết tr&igrave;nh v&agrave; Đ&agrave;m ph&aacute;n trong kinh doanh</strong>&nbsp;-&nbsp;<em>TS</em>. L&ecirc; Đỗ Duy &Acirc;n</p>\r\n<p>&nbsp; &nbsp; &nbsp; Ch&uacute;c mừng tất cả học vi&ecirc;n của IFA ho&agrave;n th&agrave;nh kh&oacute;a học, Viện Quản trị v&agrave; T&agrave;i ch&iacute;nh hy vọng từ những chia sẻ của đội ngũ giảng vi&ecirc;n IFA gi&uacute;p &iacute;ch Anh/Chị c&oacute; những thay đổi mới v&agrave; ứng dụng hiệu quả cho doanh nghiệp m&igrave;nh.</p>', 'GIÁM ĐỐC ĐIỀU HÀNH CEO K35 VÀ GIÁM ĐỐC KINH DOANH CCO K15', '', 'publish', 'open', 'open', 'giam-doc-dieu-hanh-ceo-k35-va-giam-doc-kinh-doanh-cco-k15', '2021-05-04 15:41:12', 0, 'post', '', 0),
(339, 1, '2021-05-06 13:44:57', '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff;\">[CHUY&Ecirc;N ĐỀ] KỸ NĂNG B&Aacute;N H&Agrave;NG V&Agrave; C&Aacute;CH VƯỢT QUA NỖI SỢ H&Atilde;I TRONG B&Aacute;N H&Agrave;NG - Tiến sĩ L&ecirc; Thẩm Dương</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff;\">Nằm trong chuỗi hoạt động đ&agrave;o tạo thường ni&ecirc;n c&ugrave;ng C&ocirc;ng ty TNHH USFEED Việt Nam với sự tham gia của đại diện Ban L&atilde;nh Đạo c&ugrave;ng hơn 100 C&aacute;n bộ - Nh&acirc;n vi&ecirc;n đ&atilde; mang đến kh&ocirc;ng kh&iacute; v&ocirc; c&ugrave;ng thoải m&aacute;i.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff;\">Đồng thời, cũng trong nội dung chương tr&igrave;nh l&agrave; buổi huấn luyện &amp; chia sẻ đến từ &ocirc;ng L&ecirc; Mạnh Dung - Zoetis với chủ đề \"GIẢI PH&Aacute;P PH&Ograve;NG TRỊ NHỮNG BỆNH VI&Ecirc;M RUỘT TR&Ecirc;N GIA CẦM\"</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff;\">Một số h&igrave;nh ảnh đ&aacute;ng ch&uacute; &yacute;:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff; text-align: center;\"><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai.jpg\" alt=\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff; text-align: center;\">Tiến sĩ L&ecirc; Thẩm Dương chụp h&igrave;nh lưu niệm c&ugrave;ng USFEED</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff; text-align: center;\"><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1.jpg\" alt=\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff; text-align: center;\">Đại diện đơn vị đ&agrave;o tạo - &Ocirc;ng Nguyễn Thế Nh&acirc;n (b&ecirc;n tr&aacute;i) - Chủ tịch Viện Quản Trị V&agrave; T&agrave;i Ch&iacute;nh tham dự khai mạc</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff; text-align: center;\"><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2.jpg\" alt=\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff; text-align: center;\">TS L&ecirc; Thẩm Dương bắt đầu buổi huấn luyện</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff; text-align: center;\"><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3.jpg\" alt=\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3\" />Chương tr&igrave;nh c&oacute; sự tham gia của 120 c&aacute;n bộ nh&acirc;n vi&ecirc;n C&ocirc;ng ty USFEED</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff; text-align: center;\"><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4.jpg\" alt=\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4\" /><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-5.jpg\" alt=\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-5\" />&Ocirc;ng L&ecirc; Mạnh Dung đang hướng dẫn chủ đề \"giải ph&aacute;p ph&ograve;ng v&agrave; trị những bệnh vi&ecirc;m ruột tr&ecirc;n gia cầm\"</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-family: sans-serif, Arial, Helvetica; font-size: 14px; background-color: #ffffff;\"><img src=\"../../../contents/uploads/2021/05/dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6.jpg\" alt=\"dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6\" /></p>\r\n<p>&nbsp;</p>', '[ĐÀO TẠO INHOUSE] KỸ NĂNG BÁN HÀNG VÀ CÁCH VƯỢT QUA NỖI SỢ HÃI TRONG BÁN HÀNG - USFEED', '', 'publish', 'open', 'open', '[dao-tao-inhouse]-ky-nang-ban-hang-va-cach-vuot-qua-noi-so-hai-trong-ban-hang---usfeed', '2021-05-11 15:48:48', 0, 'post', '', 0),
(340, 1, '2021-05-06 13:45:13', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-1', '2021-05-06 13:47:12', 0, 'attachment', 'image/jpeg', 0),
(341, 1, '2021-05-06 13:45:13', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-2', '2021-05-06 13:47:24', 0, 'attachment', 'image/jpeg', 0),
(342, 1, '2021-05-06 13:45:13', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-3', '2021-05-06 13:47:38', 0, 'attachment', 'image/jpeg', 0),
(343, 1, '2021-05-06 13:45:13', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-4', '2021-05-06 13:47:48', 0, 'attachment', 'image/jpeg', 0),
(344, 1, '2021-05-06 13:45:13', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-5', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-5', '', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-5', '2021-05-06 13:48:09', 0, 'attachment', 'image/jpeg', 0),
(345, 1, '2021-05-06 13:45:13', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai-6', '2021-05-06 13:46:15', 0, 'attachment', 'image/jpeg', 0),
(346, 1, '2021-05-06 13:45:16', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai', 'inherit', 'open', 'closed', 'dao-tao-inhouse-ky-nang-ban-hang-vuot-qua-noi-so-hai', '2021-05-06 13:47:00', 0, 'attachment', 'image/jpeg', 0),
(353, 1, '2021-05-06 14:03:40', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-06 14:06:27', 6, 'study_program', '', 0),
(354, 1, '2021-05-06 14:52:45', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-06 14:54:33', 7, 'study_program', '', 0),
(355, 1, '2021-05-06 16:30:29', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-06 16:33:00', 8, 'study_program', '', 0),
(356, 1, '2021-05-10 12:10:58', '', 'PVD', '', 'inherit', 'open', 'closed', 'PVD', '2021-05-10 12:10:58', 0, 'attachment', 'image/png', 0),
(357, 1, '2021-05-10 12:11:07', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 12, 'partner', '', 0),
(358, 1, '2021-05-10 12:12:57', 'dao-tao-inhouse-Vietcombank', 'dao-tao-inhouse-Vietcombank', 'dao-tao-inhouse-Vietcombank', 'inherit', 'open', 'closed', 'VCB', '2021-05-10 12:23:52', 0, 'attachment', 'image/png', 0),
(359, 1, '2021-05-10 12:12:57', 'dao-tao-inhouse-vedan', 'dao-tao-inhouse-vedan', 'dao-tao-inhouse-vedan', 'inherit', 'open', 'closed', 'Vedan', '2021-05-10 12:14:25', 0, 'attachment', 'image/png', 0),
(360, 1, '2021-05-10 12:12:58', 'dao-tao-inhouse-Viags', 'dao-tao-inhouse-Viags', 'dao-tao-inhouse-Viags', 'inherit', 'open', 'closed', 'Viags', '2021-05-10 12:15:24', 0, 'attachment', 'image/png', 0),
(361, 1, '2021-05-10 12:12:58', 'dao-tao-inhouse-Vietsovpetro', 'dao-tao-inhouse-Vietsovpetro', 'dao-tao-inhouse-Vietsovpetro', 'inherit', 'open', 'closed', 'Vietsovpetro', '2021-05-10 12:17:02', 0, 'attachment', 'image/png', 0),
(362, 1, '2021-05-10 12:12:58', 'dao-tao-inhouse-Vinmec', 'dao-tao-inhouse-Vinmec', 'dao-tao-inhouse-Vinmec', 'inherit', 'open', 'closed', 'Vinmec', '2021-05-10 12:17:41', 0, 'attachment', 'image/png', 0),
(363, 1, '2021-05-10 12:12:58', 'dao-tao-inhouse-Zoetis', 'dao-tao-inhouse-Zoetis', 'dao-tao-inhouse-Zoetis', 'inherit', 'open', 'closed', 'Zoetis', '2021-05-10 12:18:45', 0, 'attachment', 'image/png', 0),
(364, 1, '2021-05-10 12:12:58', 'dao-tao-inhouse-Ricons', 'dao-tao-inhouse-Ricons', 'dao-tao-inhouse-Ricons', 'inherit', 'open', 'closed', 'Ricons', '2021-05-10 12:19:34', 0, 'attachment', 'image/png', 0),
(365, 1, '2021-05-10 12:12:58', '', 'dao-tao-inhouse-Scancom', '', 'inherit', 'open', 'closed', 'Scancom', '2021-05-10 12:20:12', 0, 'attachment', 'image/png', 0),
(366, 1, '2021-05-10 12:12:58', 'dao-tao-inhouse-Sheraton', 'dao-tao-inhouse-Sheraton', 'dao-tao-inhouse-Sheraton', 'inherit', 'open', 'closed', 'Sheraton', '2021-05-10 12:24:46', 0, 'attachment', 'image/png', 0),
(367, 1, '2021-05-10 12:12:58', 'dao-tao-inhouse-Shimizu', 'dao-tao-inhouse-Shimizu', 'dao-tao-inhouse-Shimizu', 'inherit', 'open', 'closed', 'Shimizu', '2021-05-10 12:20:34', 0, 'attachment', 'image/png', 0),
(368, 1, '2021-05-10 12:13:20', 'dao-tao-inhouse-DHG', 'dao-tao-inhouse-DHG', 'dao-tao-inhouse-DHG', 'inherit', 'open', 'closed', 'Duoc-Hau-Giang', '2021-05-10 12:25:18', 0, 'attachment', 'image/png', 0),
(369, 1, '2021-05-10 12:13:20', 'dao-tao-inhouse-EVN', 'dao-tao-inhouse-EVN', 'dao-tao-inhouse-EVN', 'inherit', 'open', 'closed', 'EVN', '2021-05-10 12:25:32', 0, 'attachment', 'image/png', 0),
(370, 1, '2021-05-10 12:13:20', 'dao-tao-inhouse-Khatoco', 'dao-tao-inhouse-Khatoco', 'dao-tao-inhouse-Khatoco', 'inherit', 'open', 'closed', 'Khatoco', '2021-05-10 12:25:44', 0, 'attachment', 'image/png', 0),
(371, 1, '2021-05-10 12:13:20', 'dao-tao-inhouse-Mavin', 'dao-tao-inhouse-Mavin', 'dao-tao-inhouse-Mavin', 'inherit', 'open', 'closed', 'Mavin', '2021-05-10 12:20:57', 0, 'attachment', 'image/png', 0),
(372, 1, '2021-05-10 12:13:21', 'dao-tao-inhouse-PVGAS', 'dao-tao-inhouse-PVGAS', 'dao-tao-inhouse-PVGAS', 'inherit', 'open', 'closed', 'PVGAS', '2021-05-10 12:26:19', 0, 'attachment', 'image/png', 0),
(373, 1, '2021-05-10 12:13:21', 'dao-tao-inhouse-Refico', 'dao-tao-inhouse-Refico', 'dao-tao-inhouse-Refico', 'inherit', 'open', 'closed', 'Refico', '2021-05-10 12:22:03', 0, 'attachment', 'image/png', 0),
(374, 1, '2021-05-10 12:13:21', 'dao-tao-inhouse-Ricofeed', 'dao-tao-inhouse-Ricofeed', 'dao-tao-inhouse-Ricofeed', 'inherit', 'open', 'closed', 'Ricofeed', '2021-05-10 12:22:30', 0, 'attachment', 'image/png', 0),
(375, 1, '2021-05-10 12:13:21', 'dao-tao-inhouse-USFeed', 'dao-tao-inhouse-USFeed', 'dao-tao-inhouse-USFeed', 'inherit', 'open', 'closed', 'USFeed', '2021-05-10 12:22:46', 0, 'attachment', 'image/png', 0),
(376, 1, '2021-05-10 12:13:29', 'dao-tao-inhouse-CP-Group', 'dao-tao-inhouse-CP-Group', 'dao-tao-inhouse-CP-Group', 'inherit', 'open', 'closed', 'CP-Group', '2021-05-10 12:28:53', 0, 'attachment', 'image/png', 0),
(377, 1, '2021-05-10 12:13:29', 'dao-tao-inhouse-DatxanhGroup', 'dao-tao-inhouse-DatxanhGroup', 'dao-tao-inhouse-DatxanhGroup', 'inherit', 'open', 'closed', 'Datxanh-Group', '2021-05-10 12:27:42', 0, 'attachment', 'image/png', 0),
(378, 1, '2021-05-10 12:13:29', 'dao-tao-inhouse-BIDV', 'dao-tao-inhouse-BIDV', 'dao-tao-inhouse-BIDV', 'inherit', 'open', 'closed', 'BIDV', '2021-05-10 12:28:10', 0, 'attachment', 'image/png', 0),
(379, 1, '2021-05-10 12:13:29', 'dao-tao-inhouse-CJ', 'dao-tao-inhouse-CJ', 'dao-tao-inhouse-CJ', 'inherit', 'open', 'closed', 'CJ', '2021-05-10 12:27:18', 0, 'attachment', 'image/png', 0),
(380, 1, '2021-05-10 12:13:50', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 22, 'partner', '', 0),
(381, 1, '2021-05-10 12:15:03', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 23, 'partner', '', 0),
(382, 1, '2021-05-10 12:16:26', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 11, 'partner', '', 0),
(383, 1, '2021-05-10 12:17:26', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 24, 'partner', '', 0),
(384, 1, '2021-05-10 12:18:30', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 25, 'partner', '', 0),
(385, 1, '2021-05-10 12:19:18', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 26, 'partner', '', 0),
(386, 1, '2021-05-10 12:19:50', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 27, 'partner', '', 0),
(387, 1, '2021-05-10 12:20:12', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 28, 'partner', '', 0),
(388, 1, '2021-05-10 12:20:12', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 29, 'partner', '', 0),
(389, 1, '2021-05-10 12:21:46', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 30, 'partner', '', 0),
(390, 1, '2021-05-10 12:22:15', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 31, 'partner', '', 0),
(391, 1, '2021-05-10 12:22:35', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 32, 'partner', '', 0),
(392, 1, '2021-05-10 12:23:12', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 10, 'partner', '', 0),
(393, 1, '2021-05-10 12:24:05', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 5, 'partner', '', 0),
(394, 1, '2021-05-10 12:24:10', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 6, 'partner', '', 0),
(395, 1, '2021-05-10 12:24:12', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 7, 'partner', '', 0),
(396, 1, '2021-05-10 12:24:13', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 8, 'partner', '', 0),
(397, 1, '2021-05-10 12:24:14', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 9, 'partner', '', 0),
(398, 1, '2021-05-10 12:26:48', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 2, 'partner', '', 0),
(399, 1, '2021-05-10 12:26:49', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 3, 'partner', '', 0),
(400, 1, '2021-05-10 12:26:51', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 4, 'partner', '', 0),
(401, 1, '2021-05-10 12:28:20', '', '', '', 'publish', 'closed', 'closed', '', '2021-05-10 12:28:57', 1, 'partner', '', 0),
(402, 1, '2021-05-13 13:46:38', '', 'kiemtra 1', '', 'inherit', 'open', 'closed', 'kiemtra-1', '2021-05-13 13:46:38', 0, 'attachment', 'image/png', 0),
(403, 1, '2021-05-13 13:46:38', '', 'network 1', '', 'inherit', 'open', 'closed', 'network-1', '2021-05-13 13:46:38', 0, 'attachment', 'image/png', 0),
(404, 1, '2021-05-13 13:46:38', '', 'online-learning 1', '', 'inherit', 'open', 'closed', 'online-learning-1', '2021-05-13 13:46:38', 0, 'attachment', 'image/png', 0),
(405, 1, '2021-05-13 13:46:38', '', 'thi 1', '', 'inherit', 'open', 'closed', 'thi-1', '2021-05-13 13:46:38', 0, 'attachment', 'image/png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `termmeta`
--

CREATE TABLE `termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Chưa được phân loại', 'khong-phan-loai', 0),
(2, 'Primary menu', 'primary-menu', 0),
(3, 'Sự kiện', 'su-kien', 0),
(4, 'Footer menu', 'footer-menu', 0),
(5, 'quy trình đào tạo', 'quy-trinh-dao-tao', 0),
(6, 'quy trình đào tạo inhouse', 'quy-trinh-dao-tao-inhouse', 0),
(7, 'ifa', 'ifa', 0),
(8, 'đào tạo inhouse', 'dao-tao-inhouse', 0),
(9, 'đào tạo nội bộ', 'dao-tao-noi-bo', 0),
(10, 'đào tạo doanh nghiệp', 'dao-tao-doanh-nghiep', 0),
(11, 'kỹ năng bán hàng chuyên nghiệp', 'ky-nang-ban-hang-chuyen-nghiep', 0),
(12, 'kỹ năng bán hàng', 'ky-nang-ban-hang', 0),
(13, 'bán hàng chuyên nghiệp', 'ban-hang-chuyen-nghiep', 0),
(14, 'thạc sĩ nguyễn mạnh hiền', 'thac-si-nguyen-manh-hien', 0),
(15, 'kỹ năng quản lý cấp trung', 'ky-nang-quan-ly-cap-trung', 0),
(16, 'kỹ năng quản lý', 'ky-nang-quan-ly', 0),
(17, 'quản lý cấp trung', 'quan-ly-cap-trung', 0),
(18, 'khóa học chăm sóc khách hàng', 'khoa-hoc-cham-soc-khach-hang', 0);

-- --------------------------------------------------------

--
-- Table structure for table `term_relationships`
--

CREATE TABLE `term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term_relationships`
--

INSERT INTO `term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 2, 0),
(2, 2, 0),
(3, 2, 0),
(4, 2, 0),
(5, 2, 0),
(6, 2, 0),
(9, 3, 0),
(42, 4, 0),
(43, 4, 0),
(44, 4, 0),
(45, 4, 0),
(46, 4, 0),
(47, 3, 0),
(48, 3, 0),
(49, 3, 0),
(178, 5, 0),
(178, 6, 0),
(231, 3, 0),
(231, 7, 0),
(231, 8, 0),
(231, 9, 0),
(231, 10, 0),
(238, 3, 0),
(259, 3, 0),
(259, 5, 0),
(259, 7, 0),
(259, 8, 0),
(259, 9, 0),
(259, 10, 0),
(264, 3, 0),
(264, 8, 0),
(264, 9, 0),
(264, 10, 0),
(264, 11, 0),
(264, 12, 0),
(264, 13, 0),
(264, 14, 0),
(281, 3, 0),
(281, 8, 0),
(281, 9, 0),
(281, 10, 0),
(281, 15, 0),
(281, 16, 0),
(281, 17, 0),
(295, 3, 0),
(295, 5, 0),
(295, 8, 0),
(295, 9, 0),
(295, 10, 0),
(295, 11, 0),
(295, 12, 0),
(295, 13, 0),
(295, 18, 0),
(305, 3, 0),
(305, 8, 0),
(305, 9, 0),
(305, 10, 0),
(305, 12, 0),
(313, 3, 0),
(313, 8, 0),
(313, 9, 0),
(313, 10, 0),
(319, 3, 0),
(319, 8, 0),
(319, 9, 0),
(319, 10, 0),
(337, 3, 0),
(337, 8, 0),
(337, 9, 0),
(337, 10, 0),
(339, 8, 0),
(339, 9, 0),
(339, 10, 0),
(339, 11, 0),
(339, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `term_taxonomy`
--

CREATE TABLE `term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term_taxonomy`
--

INSERT INTO `term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'nav_menu', '', 0, 0),
(3, 3, 'category', '', 0, 0),
(4, 4, 'nav_menu', '', 0, 0),
(5, 5, 'post_tag', '', 0, 0),
(6, 6, 'post_tag', '', 0, 0),
(7, 7, 'post_tag', '', 0, 0),
(8, 8, 'post_tag', '', 0, 0),
(9, 9, 'post_tag', '', 0, 0),
(10, 10, 'post_tag', '', 0, 0),
(11, 11, 'post_tag', '', 0, 0),
(12, 12, 'post_tag', '', 0, 0),
(13, 13, 'post_tag', '', 0, 0),
(14, 14, 'post_tag', '', 0, 0),
(15, 15, 'post_tag', '', 0, 0),
(16, 16, 'post_tag', '', 0, 0),
(17, 17, 'post_tag', '', 0, 0),
(18, 18, 'post_tag', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `usermeta`
--

CREATE TABLE `usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usermeta`
--

INSERT INTO `usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(2, 1, 'remember_token', 'oWdTvlidEinWYeYTmw8la6xTzZF0chIBxbafxeczmeaCtA6rVDHzRIYqcntb');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `display_name`) VALUES
(1, 'admin', '$2y$10$ePJgAmaTUrCJLj5qRCaiKepyvUPSzIzs8Q7Ri/AXc4EiwfaVhmBZK', 'admin', 'admin@startpress.net', 'https://startpress.net', '0000-00-00 00:00:00', '', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentmeta`
--
ALTER TABLE `commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD UNIQUE KEY `comment_approved_date` (`comment_approved`,`comment_date`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_author_email` (`comment_author_email`),
  ADD KEY `comment_date` (`comment_date`),
  ADD KEY `comment_parent` (`comment_parent`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `postmeta`
--
ALTER TABLE `postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_author` (`post_author`),
  ADD KEY `post_name` (`post_name`);

--
-- Indexes for table `termmeta`
--
ALTER TABLE `termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `name` (`name`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `term_relationships`
--
ALTER TABLE `term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `usermeta`
--
ALTER TABLE `usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commentmeta`
--
ALTER TABLE `commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `postmeta`
--
ALTER TABLE `postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1070;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `termmeta`
--
ALTER TABLE `termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `usermeta`
--
ALTER TABLE `usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
