-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 09, 2018 at 03:13 PM
-- Server version: 5.6.35
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etc_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_assets`
--

CREATE TABLE `dxcr2_assets` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) UNSIGNED NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_assets`
--

INSERT INTO `dxcr2_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 163, 0, 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1,\"10\":1,\"6\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1,\"6\":0}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1,\"6\":0}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(8, 1, 17, 20, 1, 'com_content', 'com_content', '{\"core.admin\":{\"7\":1,\"6\":0,\"3\":0},\"core.manage\":{\"6\":0,\"3\":0,\"4\":0,\"7\":0,\"10\":0},\"core.create\":{\"3\":0,\"6\":0},\"core.edit\":{\"4\":1,\"6\":0},\"core.edit.state\":{\"5\":1,\"6\":0},\"core.delete\":{\"6\":0},\"core.edit.own\":{\"6\":0},\"core.options\":{\"6\":0}}'),
(9, 1, 21, 22, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 23, 24, 1, 'com_installer', 'com_installer', '{\"core.manage\":{\"7\":0,\"6\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(11, 1, 25, 26, 1, 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":0}}'),
(12, 1, 27, 28, 1, 'com_login', 'com_login', '{}'),
(13, 1, 29, 30, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 31, 32, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 33, 34, 1, 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1,\"7\":0},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),
(16, 1, 35, 40, 1, 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":0,\"10\":0}}'),
(17, 1, 41, 42, 1, 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1,\"6\":0}}'),
(18, 1, 43, 76, 1, 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":0}}'),
(19, 1, 77, 80, 1, 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":0,\"8\":1}}'),
(20, 1, 81, 82, 1, 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":0}}'),
(21, 1, 83, 84, 1, 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":0}}'),
(22, 1, 85, 86, 1, 'com_search', 'com_search', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(23, 1, 87, 88, 1, 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":0}}'),
(24, 1, 89, 102, 1, 'com_users', 'com_users', '{\"core.admin\":{\"7\":0,\"10\":0},\"core.manage\":{\"7\":0,\"10\":1},\"core.options\":{\"10\":0}}'),
(26, 1, 103, 104, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
(30, 19, 78, 79, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
(32, 24, 90, 91, 2, 'com_users.category.7', 'Uncategorised', '{}'),
(33, 1, 105, 106, 1, 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(34, 1, 107, 108, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{\"core.manage\":{\"6\":0,\"2\":0}}'),
(35, 1, 109, 110, 1, 'com_tags', 'com_tags', '{\"core.manage\":{\"6\":0}}'),
(36, 1, 111, 112, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 113, 114, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 115, 116, 1, 'com_postinstall', 'com_postinstall', '{\"core.manage\":{\"6\":0}}'),
(39, 18, 44, 45, 2, 'com_modules.module.1', 'Main Menu', '{}'),
(40, 18, 46, 47, 2, 'com_modules.module.2', 'Login', '{}'),
(41, 18, 48, 49, 2, 'com_modules.module.3', 'Popular Articles', '{}'),
(42, 18, 50, 51, 2, 'com_modules.module.4', 'Recently Added Articles', '{}'),
(43, 18, 52, 53, 2, 'com_modules.module.8', 'Toolbar', '{}'),
(44, 18, 54, 55, 2, 'com_modules.module.9', 'Quick Icons', '{}'),
(45, 18, 56, 57, 2, 'com_modules.module.10', 'Logged-in Users', '{}'),
(46, 18, 58, 59, 2, 'com_modules.module.12', 'Admin Menu', '{}'),
(47, 18, 60, 61, 2, 'com_modules.module.13', 'Admin Submenu', '{}'),
(48, 18, 62, 63, 2, 'com_modules.module.14', 'User Status', '{}'),
(49, 18, 64, 65, 2, 'com_modules.module.15', 'Title', '{}'),
(50, 18, 66, 67, 2, 'com_modules.module.16', 'Login Form', '{}'),
(51, 18, 68, 69, 2, 'com_modules.module.17', 'Breadcrumbs', '{}'),
(52, 18, 70, 71, 2, 'com_modules.module.79', 'Multilanguage status', '{}'),
(53, 18, 72, 73, 2, 'com_modules.module.86', 'Joomla Version', '{}'),
(54, 16, 36, 37, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
(55, 18, 74, 75, 2, 'com_modules.module.87', 'Sample Data', '{}'),
(62, 1, 117, 118, 1, 'com_planner', 'com_planner', '{\"core.create\":{\"7\":0,\"4\":0},\"core.delete\":{\"7\":0},\"core.edit\":{\"7\":0,\"4\":0},\"core.edit.own\":{\"4\":0,\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(70, 1, 119, 130, 1, 'com_objectives', 'com_objectives', '{\"core.create\":{\"7\":0,\"3\":0},\"core.delete\":{\"7\":0},\"core.edit\":{\"7\":0},\"core.edit.state\":{\"7\":0},\"core.edit.own\":{\"7\":0,\"3\":0},\"core.manage\":{\"7\":1},\"core.admin\":{\"7\":0}}'),
(71, 70, 120, 121, 2, 'com_objectives.category.14', 'Brands', '{}'),
(72, 1, 131, 134, 1, 'com_products', 'com_products', '{\"core.manage\":{\"10\":1},\"core.delete\":{\"10\":0,\"7\":0},\"core.admin\":{\"10\":0,\"7\":0},\"core.create\":{\"7\":0,\"3\":0},\"core.edit\":{\"7\":0},\"core.edit.state\":{\"7\":0},\"core.edit.own\":{\"7\":0,\"3\":0}}'),
(73, 72, 132, 133, 2, 'com_products.category.15', ' Lotion', '{}'),
(79, 1, 135, 136, 1, 'com_fields', 'com_fields', '{}'),
(80, 1, 137, 138, 1, 'com_associations', 'com_associations', '{\"core.manage\":{\"6\":0}}'),
(81, 1, 139, 142, 1, 'com_submitted', 'com_submitted', '{\"core.manage\":{\"7\":1},\"core.create\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit\":{\"7\":0},\"core.edit.state\":{\"7\":0},\"core.edit.own\":{\"7\":0}}'),
(82, 81, 140, 141, 2, 'com_submitted.checklist.1', 'com_submitted.checklist.1', '{}'),
(83, 1, 143, 144, 1, 'com_reservationreport', 'COM_RESERVATIONREPORT', '{}'),
(84, 70, 122, 123, 2, 'com_objectives.category.16', 'Perfume', '{}'),
(85, 70, 124, 125, 2, 'com_objectives.category.17', 'Gold Touch', '{}'),
(86, 70, 126, 127, 2, 'com_objectives.category.18', 'Yes-No', '{}'),
(87, 70, 128, 129, 2, 'com_objectives.category.19', 'Jelly', '{}'),
(88, 91, 93, 94, 3, 'com_users.field.1', 'Region', '{}'),
(89, 91, 95, 96, 3, 'com_users.field.2', 'reports_to', '{}'),
(90, 91, 97, 98, 3, 'com_users.field.3', 'shop_id', '{\"core.edit\":{\"1\":0}}'),
(91, 24, 92, 101, 2, 'com_users.fieldgroup.1', 'Extended Information', '{}'),
(92, 91, 99, 100, 3, 'com_users.field.4', 'phone_number', '{}'),
(93, 16, 38, 39, 2, 'com_menus.menu.2', 'hidden menu', '{}'),
(95, 1, 145, 154, 1, 'com_outlets', 'com_outlets', '{\"core.create\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit\":{\"7\":0},\"core.edit.state\":{\"7\":0},\"core.edit.own\":{\"7\":0},\"core.admin\":{\"7\":0}}'),
(96, 95, 146, 147, 2, 'com_outlets.outlet.8', 'com_outlets.outlet.8', '{}'),
(97, 95, 148, 149, 2, 'com_outlets.outlet.291', 'com_outlets.outlet.291', '{}'),
(98, 95, 150, 151, 2, 'com_outlets.outlet.1', 'com_outlets.outlet.1', '{}'),
(99, 95, 152, 153, 2, 'com_outlets.outlet.2', 'com_outlets.outlet.2', '{}'),
(100, 1, 155, 156, 1, 'com_photos', 'com_photos', '{}'),
(101, 1, 157, 158, 1, 'com_logins', 'com_logins', '{}'),
(102, 1, 159, 160, 1, 'com_qissues', 'com_qissues', '{}'),
(103, 1, 161, 162, 1, 'com_voc', 'com_voc', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_associations`
--

CREATE TABLE `dxcr2_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_banners`
--

CREATE TABLE `dxcr2_banners` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_banner_clients`
--

CREATE TABLE `dxcr2_banner_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_banner_tracks`
--

CREATE TABLE `dxcr2_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) UNSIGNED NOT NULL,
  `banner_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_brandstocks`
--

CREATE TABLE `dxcr2_brandstocks` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `stockdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `brand` varchar(100) NOT NULL,
  `brandcode` varchar(20) NOT NULL,
  `currentstock` int(11) DEFAULT NULL,
  `orderplaced` int(11) DEFAULT NULL,
  `order_placed` varchar(100) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `delivered` int(11) DEFAULT NULL,
  `lpo_number` varchar(255) NOT NULL DEFAULT 'none',
  `sale` varchar(11) DEFAULT NULL,
  `store_server_id` varchar(11) DEFAULT NULL,
  `stockout` varchar(11) NOT NULL,
  `submitter` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `store` varchar(250) NOT NULL,
  `store_id` varchar(11) NOT NULL,
  `remarks` varchar(500) NOT NULL,
  `client_modified_date` varchar(50) NOT NULL,
  `coordinates` varchar(50) DEFAULT NULL,
  `created` varchar(50) NOT NULL,
  `first_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `server_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_sync_date` varchar(50) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dxcr2_brandstocks`
--

INSERT INTO `dxcr2_brandstocks` (`id`, `client_id`, `stockdate`, `brand`, `brandcode`, `currentstock`, `orderplaced`, `order_placed`, `order_date`, `delivered`, `lpo_number`, `sale`, `store_server_id`, `stockout`, `submitter`, `user_id`, `store`, `store_id`, `remarks`, `client_modified_date`, `coordinates`, `created`, `first_insert`, `server_modified_date`, `last_sync_date`, `state`, `ordering`) VALUES
(1, 1, '2017-12-19 00:00:00', 'N&L PERF/P Jelly 500GMS', 'E003', 10, 20, 'Yes', '2017-12-18', 0, 'none', '20', '1', 'No', 'd.promoter', 37, '101 Store', '1', '', '', '', '2017-12-18 21:54:25', '2017-12-18 22:05:34', '0000-00-00 00:00:00', '1513634734', 1, 0),
(2, 2, '2017-12-19 00:00:00', 'N&L PERF/B Jelly 250GMS', 'E006', 9, 30, 'Yes', '2017-12-12', 0, 'none', '01', '1', 'No', 'd.promoter', 37, '101 Store', '1', '', '', '', '2017-12-18 21:55:17', '2017-12-18 22:05:34', '0000-00-00 00:00:00', '1513634734', 1, 0),
(3, 4, '2017-12-19 00:00:00', 'N&L PERF/P Jelly 100GMS', 'E004', 200, 100, 'Yes', '2017-12-18', 0, 'none', '200', '1', 'No', 'd.promoter', 37, '101 Store', '1', '', '', '', '2017-12-18 22:17:16', '2017-12-18 22:18:03', '0000-00-00 00:00:00', '1513635483', 1, 0),
(4, 1, '2017-12-22 00:00:00', 'N&L AVOCADO Lot 400ML', 'E005', 20, 0, 'No', '', 0, '45GH', '10', '1', 'No', 'd.promoter', 37, '101 Store', '1', '', '', '-1.3605051,36.6530075', '2017-12-22 12:48:00', '2017-12-22 12:54:10', '0000-00-00 00:00:00', '1513947249', 1, 0),
(5, 2, '2017-12-22 00:00:00', 'N&L CARROT Lot 400ML', 'E0020', 250, 0, 'No', '', 0, 'none', '50', '1', 'No', 'd.promoter', 37, '101 Store', '1', '', '', '-1.3605038999999999,36.6530072', '2017-12-22 12:54:26', '2017-12-22 12:55:37', '0000-00-00 00:00:00', '1513947337', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_categories`
--

CREATE TABLE `dxcr2_categories` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_categories`
--

INSERT INTO `dxcr2_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 23, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 542, '2018-02-05 17:45:15', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-05 17:45:15', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-05 17:45:15', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-05 17:45:15', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-05 17:45:15', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-05 17:45:15', 0, '0000-00-00 00:00:00', 0, '*', 1),
(14, 71, 1, 11, 12, 1, 'brands', 'com_objectives', 'Brands', 'brands', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-07 16:06:03', 0, '2018-02-07 16:06:03', 0, '*', 1),
(15, 73, 1, 13, 14, 1, 'lotion', 'com_products', ' Lotion', 'lotion', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-07 16:20:17', 0, '2018-02-07 16:20:17', 0, '*', 1),
(16, 84, 1, 15, 16, 1, 'perfume', 'com_objectives', 'Perfume', 'perfume', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-07 21:32:31', 0, '2018-02-07 21:32:31', 0, '*', 1),
(17, 85, 1, 17, 18, 1, 'gold-touch', 'com_objectives', 'Gold Touch', 'gold-touch', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-07 21:32:49', 0, '2018-02-07 21:32:49', 0, '*', 1),
(18, 86, 1, 19, 20, 1, 'yes-no', 'com_objectives', 'Yes-No', 'yes-no', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-07 21:33:01', 0, '2018-02-07 21:33:01', 0, '*', 1),
(19, 87, 1, 21, 22, 1, 'jelly', 'com_objectives', 'Jelly', 'jelly', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 542, '2018-02-07 21:35:06', 0, '2018-02-07 21:35:06', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_contact_details`
--

CREATE TABLE `dxcr2_contact_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_content`
--

CREATE TABLE `dxcr2_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_contentitem_tag_map`
--

CREATE TABLE `dxcr2_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_content_frontpage`
--

CREATE TABLE `dxcr2_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_content_rating`
--

CREATE TABLE `dxcr2_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_content_types`
--

CREATE TABLE `dxcr2_content_types` (
  `type_id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_content_types`
--

INSERT INTO `dxcr2_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\"}, \"special\":{\"fulltext\":\"fulltext\"}}', 'ContentHelperRoute::getArticleRoute', '{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(2, 'Contact', 'com_contact.contact', '{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}', 'ContactHelperRoute::getContactRoute', '{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(4, 'User', 'com_users.user', '{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContentHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(6, 'Contact Category', 'com_contact.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContactHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(8, 'Tag', 'com_tags.tag', '{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}', 'TagsHelperRoute::getTagRoute', '{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(9, 'Banner', 'com_banners.banner', '{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(11, 'Banner Client', 'com_banners.client', '{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),
(12, 'User Notes', 'com_users.note', '{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(13, 'User Notes Category', 'com_users.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_core_log_searches`
--

CREATE TABLE `dxcr2_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_extensions`
--

CREATE TABLE `dxcr2_extensions` (
  `extension_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_extensions`
--

INSERT INTO `dxcr2_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 0, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 0, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 0, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 0, 'com_banners', 'component', 'com_banners', '', 1, 0, 1, 0, '{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 0, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 0, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 0, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 0, 'com_contact', 'component', 'com_contact', '', 1, 0, 1, 0, '{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_advanced\":0,\"sef_ids\":0,\"custom_fields_enable\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 0, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 0, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_jed_info\":\"1\",\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 0, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"site\":\"en-GB\",\"administrator\":\"en-GB\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 0, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 0, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 0, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 0, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 0, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"redirect_edit\":\"site\",\"adminlangfilter\":0}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"sef_advanced\":0,\"sef_ids\":0}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 0, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 0, 'com_search', 'component', 'com_search', '', 1, 0, 1, 0, '{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}', '{\"enabled\":\"0\",\"search_phrases\":\"1\",\"search_areas\":\"1\",\"show_date\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 0, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 0, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"info_block_position\":\"0\",\"info_block_show_title\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_associations\":\"0\",\"flags\":\"1\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_tags\":\"1\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"urls_position\":\"0\",\"captcha\":\"\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_heading_title_text\":\"1\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_featured\":\"show\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\",\"sef_advanced\":0,\"sef_ids\":0,\"custom_fields_enable\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 0, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 0, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"mode\":\"0\",\"separator\":\"|\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 0, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}', '{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"1\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\",\"debugUsers\":\"1\",\"debugGroups\":\"1\",\"sef_advanced\":0,\"custom_fields_enable\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 0, 'com_finder', 'component', 'com_finder', '', 1, 0, 0, 0, '{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"updatesource\":\"default\",\"customurl\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 0, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"c.core_title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"min_term_length\":\"3\",\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_descripion\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 0, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 0, 1, 0, '{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 0, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 0, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(33, 0, 'com_fields', 'component', 'com_fields', '', 1, 1, 1, 0, '{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(34, 0, 'com_associations', 'component', 'com_associations', '', 1, 1, 1, 0, '{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"Januar 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 0, 'LIB_PHPUTF8', 'library', 'phputf8', '', 0, 1, 1, 1, '{\"name\":\"LIB_PHPUTF8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 0, 'LIB_JOOMLA', 'library', 'joomla', '', 0, 1, 1, 1, '{\"name\":\"LIB_JOOMLA\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"mediaversion\":\"3272838806973077c4b7840f6be996f2\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 0, 'LIB_IDNA', 'library', 'idna_convert', '', 0, 1, 1, 1, '{\"name\":\"LIB_IDNA\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 0, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 0, 'LIB_PHPASS', 'library', 'phpass', '', 0, 1, 1, 1, '{\"name\":\"LIB_PHPASS\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 0, 'mod_banners', 'module', 'mod_banners', '', 0, 0, 1, 0, '{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 0, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 0, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 0, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 0, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 0, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 0, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 0, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 0, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 0, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 0, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 0, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 0, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 0, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 0, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 0, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 0, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 0, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 0, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 0, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 0, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 0, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 0, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 0, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 0, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 0, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 0, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 0, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 0, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 0, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}', '{\"cache\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 0, 'mod_version', 'module', 'mod_version', '', 1, 0, 1, 0, '{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}', '{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}', '{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}', '{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}', '{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(318, 0, 'mod_sampledata', 'module', 'mod_sampledata', '', 1, 1, 1, 0, '{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_sampledata\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 0, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}', '{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 0, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `dxcr2_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(402, 0, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 0, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}', '{\"mode\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}', '{\"style\":\"xhtml\"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}', '{\"position\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 0, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2017 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"http:\\/\\/codemirror.net\\/\",\"version\":\"5.34.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}', '{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 0, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2017\",\"author\":\"Ephox Corporation\",\"copyright\":\"Ephox Corporation\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"http:\\/\\/www.tinymce.com\",\"version\":\"4.5.8\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}', '{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 0, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 0, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 0, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 0, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 0, 1, 0, '{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 0, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 0, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 0, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}', '{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 0, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 0, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 0, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 0, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 0, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 0, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 0, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}', '{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 0, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 0, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 0, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 0, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 0, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 0, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 0, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 0, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 0, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 0, 1, 0, '{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 0, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 0, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 0, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 0, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 0, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 0, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(452, 0, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"May 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}', '{\"lastrun\":1518164878}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(453, 0, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(454, 0, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"November 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}', '{\"mode\":3,\"lastrun\":\"\",\"unique_id\":\"c041a38c424d294235d2a269ae283ee531b619c7\",\"interval\":12}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(455, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(456, 0, 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', 0, 1, 1, 1, '{\"name\":\"PLG_INSTALLER_FOLDERINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(457, 0, 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', 0, 1, 1, 1, '{\"name\":\"PLG_INSTALLER_URLINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(458, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(459, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(460, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', 'editors-xtd', 0, 0, 1, 0, '{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(461, 0, 'plg_system_fields', 'plugin', 'fields', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(462, 0, 'plg_fields_calendar', 'plugin', 'calendar', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(463, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(464, 0, 'plg_fields_color', 'plugin', 'color', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(465, 0, 'plg_fields_editor', 'plugin', 'editor', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(466, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(467, 0, 'plg_fields_integer', 'plugin', 'integer', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}', '{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(468, 0, 'plg_fields_list', 'plugin', 'list', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(469, 0, 'plg_fields_media', 'plugin', 'media', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(470, 0, 'plg_fields_radio', 'plugin', 'radio', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(471, 0, 'plg_fields_sql', 'plugin', 'sql', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(472, 0, 'plg_fields_text', 'plugin', 'text', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(473, 0, 'plg_fields_textarea', 'plugin', 'textarea', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(474, 0, 'plg_fields_url', 'plugin', 'url', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(475, 0, 'plg_fields_user', 'plugin', 'user', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(476, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(477, 0, 'plg_content_fields', 'plugin', 'fields', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(478, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(479, 0, 'plg_sampledata_blog', 'plugin', 'blog', 'sampledata', 0, 1, 1, 0, '{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"blog\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 0, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 0, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 0, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 0, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"templateColor\":\"\",\"logoFile\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 802, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"February 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.5\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 802, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"February 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.5\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 0, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"February 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2018 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.5\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(802, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"February 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.5.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 0, 'com_planner', 'component', 'com_planner', '', 1, 1, 0, 0, '{\"name\":\"com_planner\",\"type\":\"component\",\"creationDate\":\"2018-02-07\",\"author\":\"Michael Buluma\",\"copyright\":\"2018 Michael Buluma\",\"authorEmail\":\"michael@buluma.me.ke\",\"authorUrl\":\"http:\\/\\/buluma.me.ke\",\"version\":\"CVS: 1.0.0\",\"description\":\"Weekly Planner\",\"group\":\"\",\"filename\":\"planner\"}', '{\"save_history\":\"0\",\"history_limit\":5}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `dxcr2_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(10005, 0, 'com_objectives', 'component', 'com_objectives', '', 1, 1, 0, 0, '{\"name\":\"com_objectives\",\"type\":\"component\",\"creationDate\":\"2018-02-07\",\"author\":\"Michael Buluma\",\"copyright\":\"2018 Michael Buluma\",\"authorEmail\":\"michael@buluma.me.ke\",\"authorUrl\":\"http:\\/\\/buluma.me.ke\",\"version\":\"CVS: 1.0.0\",\"description\":\"\",\"group\":\"\",\"filename\":\"objectives\"}', '{\"save_history\":\"0\",\"history_limit\":5}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 0, 'com_products', 'component', 'com_products', '', 1, 1, 0, 0, '{\"name\":\"com_products\",\"type\":\"component\",\"creationDate\":\"2018-02-07\",\"author\":\"Michael Buluma\",\"copyright\":\"2018 Michael Buluma\",\"authorEmail\":\"michael@buluma.me.ke\",\"authorUrl\":\"http:\\/\\/buluma.me.ke\",\"version\":\"CVS: 1.0.0\",\"description\":\"Products and Stock Management\",\"group\":\"\",\"filename\":\"products\"}', '{\"save_history\":\"0\",\"history_limit\":5}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 0, 'com_submitted', 'component', 'com_submitted', '', 1, 1, 0, 0, '{\"name\":\"com_submitted\",\"type\":\"component\",\"creationDate\":\"2018-02-07\",\"author\":\"Michael Buluma\",\"copyright\":\"2018 Michael Buluma\",\"authorEmail\":\"michael@buluma.me.ke\",\"authorUrl\":\"http:\\/\\/buluma.me.ke\",\"version\":\"CVS: 1.0.0\",\"description\":\"Submitted Data\",\"group\":\"\",\"filename\":\"submitted\"}', '{\"save_history\":\"0\",\"history_limit\":5}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10010, 0, 'TBS', 'library', 'tbs', '', 0, 1, 1, 0, '{\"name\":\"TBS\",\"type\":\"library\",\"creationDate\":\"2012-03-04\",\"author\":\"Skrol29dev\",\"copyright\":\"\",\"authorEmail\":\"skrol29dev@gmail.com\",\"authorUrl\":\"http:\\/\\/www.tinybutstrong.com\\/onlyyou.html\",\"version\":\"3.8.1\",\"description\":\"TinyButStrong library for Joomla!. <br\\/>\\n  Please note that Javier G\\u00f3mez has only created an installation package, all credit belongs to Skrol29dev\\n  \",\"group\":\"\",\"filename\":\"tbs\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 0, 'Content - Aimy Charts ', 'plugin', 'aimycharts', 'content', 0, 1, 1, 0, '{\"name\":\"Content - Aimy Charts \",\"type\":\"plugin\",\"creationDate\":\"2017-10-04\",\"author\":\"Aimy Extensions (Lingua-Systems Software GmbH)\",\"copyright\":\"2013-2017 Aimy Extensions, Lingua-Systems Software GmbH\",\"authorEmail\":\"info@aimy-extensions.com\",\"authorUrl\":\"http:\\/\\/www.aimy-extensions.com\\/\",\"version\":\"3.11.0\",\"description\":\"Generates nice HTML5 Charts \",\"group\":\"\",\"filename\":\"aimycharts\"}', '{\"width\":440,\"height\":320,\"animate\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 0, 'COM_RESERVATIONREPORT', 'component', 'com_reservationreport', '', 1, 1, 0, 0, '{\"name\":\"COM_RESERVATIONREPORT\",\"type\":\"component\",\"creationDate\":\"August 2014\",\"author\":\"Norbert Kuemin\",\"copyright\":\"(C) 2017 Norbert Kuemin\",\"authorEmail\":\"momo_102@bluemail.ch\",\"authorUrl\":\"\",\"version\":\"1.1.0\",\"description\":\"COM_RESERVATIONREPORT_XML_DESC\",\"group\":\"\",\"filename\":\"com_reservationreport\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 0, 'Joomla Snitch', 'plugin', 'snitch', 'user', 0, 0, 1, 0, '{\"name\":\"Joomla Snitch\",\"type\":\"plugin\",\"creationDate\":\"Feb 2018\",\"author\":\"Michael Buluma\",\"copyright\":\"Copyright (C) 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"me@buluma.me.ke\",\"authorUrl\":\"www.buluma.me.ke\",\"version\":\"3.0.0\",\"description\":\"Joomla! Back End Snitch\",\"group\":\"\",\"filename\":\"snitch\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10015, 0, 'Joomla Snitch', 'plugin', 'snitch', 'user', 0, 1, 1, 0, '{\"name\":\"Joomla Snitch\",\"type\":\"plugin\",\"creationDate\":\"Feb 2018\",\"author\":\"Michael Buluma\",\"copyright\":\"Copyright (C) 2018 Open Source Matters. All rights reserved.\",\"authorEmail\":\"me@buluma.me.ke\",\"authorUrl\":\"www.buluma.me.ke\",\"version\":\"3.0.0\",\"description\":\"Joomla! Back End Snitch\",\"group\":\"\",\"filename\":\"snitch\"}', '{\"sendto\":\"bulumaknight@gmail.com\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10017, 0, 'Helix3 - Ajax', 'plugin', 'helix3', 'ajax', 0, 1, 1, 0, '{\"name\":\"Helix3 - Ajax\",\"type\":\"plugin\",\"creationDate\":\"Jan 2015\",\"author\":\"JoomShaper.com\",\"copyright\":\"Copyright (C) 2010 - 2017 JoomShaper. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"www.joomshaper.com\",\"version\":\"2.4\",\"description\":\"Helix3 Framework - Joomla Template Framework by JoomShaper\",\"group\":\"\",\"filename\":\"helix3\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10018, 0, 'System - Helix3 Framework', 'plugin', 'helix3', 'system', 0, 1, 1, 0, '{\"name\":\"System - Helix3 Framework\",\"type\":\"plugin\",\"creationDate\":\"Jan 2015\",\"author\":\"JoomShaper.com\",\"copyright\":\"Copyright (C) 2010 - 2017 JoomShaper. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"www.joomshaper.com\",\"version\":\"2.4\",\"description\":\"Helix3 Framework - Joomla Template Framework by JoomShaper\",\"group\":\"\",\"filename\":\"helix3\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 0, 'shaper_helix3', 'template', 'shaper_helix3', '', 0, 1, 1, 0, '{\"name\":\"shaper_helix3\",\"type\":\"template\",\"creationDate\":\"Jan 2016\",\"author\":\"JoomShaper.com\",\"copyright\":\"Copyright (C) 2010 - 2017 JoomShaper.com. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"http:\\/\\/www.joomshaper.com\",\"version\":\"2.4\",\"description\":\"Shaper Helix3 - Starter Template of Helix3 framework\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"preloader\":\"0\",\"preloader_animation\":\"circle\",\"preloader_bg\":\"#f5f5f5\",\"preloader_tx\":\"#333333\",\"goto_top\":\"0\",\"sticky_header\":\"1\",\"boxed_layout\":\"0\",\"logo_type\":\"image\",\"logo_position\":\"logo\",\"logo_load_pos\":\"default\",\"body_bg_repeat\":\"inherit\",\"body_bg_size\":\"inherit\",\"body_bg_attachment\":\"inherit\",\"body_bg_position\":\"0 0\",\"enabled_copyright\":\"1\",\"copyright_position\":\"footer1\",\"copyright_load_pos\":\"default\",\"copyright\":\"\\u00a9 2015 Your Company. All Rights Reserved. Designed By JoomShaper\",\"show_social_icons\":\"1\",\"social_position\":\"top1\",\"social_load_pos\":\"default\",\"enable_contactinfo\":\"1\",\"contact_position\":\"top2\",\"comingsoon_mode\":\"0\",\"comingsoon_title\":\"Coming Soon Title\",\"comingsoon_date\":\"5-10-2018\",\"comingsoon_content\":\"Coming soon content\",\"preset\":\"preset1\",\"preset1_bg\":\"#ffffff\",\"preset1_text\":\"#000000\",\"preset1_major\":\"#26aae1\",\"preset1_megabg\":\"#ffffff\",\"preset1_megatx\":\"#333333\",\"preset2_bg\":\"#ffffff\",\"preset2_text\":\"#000000\",\"preset2_major\":\"#3d449a\",\"preset2_megabg\":\"#ffffff\",\"preset2_megatx\":\"#333333\",\"preset3_bg\":\"#ffffff\",\"preset3_text\":\"#000000\",\"preset3_major\":\"#2bb673\",\"preset3_megabg\":\"#ffffff\",\"preset3_megatx\":\"#333333\",\"preset4_bg\":\"#ffffff\",\"preset4_text\":\"#000000\",\"preset4_major\":\"#eb4947\",\"preset4_megabg\":\"#ffffff\",\"preset4_megatx\":\"#333333\",\"menu\":\"mainmenu\",\"menu_type\":\"mega_offcanvas\",\"menu_animation\":\"menu-fade\",\"offcanvas_animation\":\"default\",\"enable_body_font\":\"1\",\"body_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"300\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h1_font\":\"1\",\"h1_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"800\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h2_font\":\"1\",\"h2_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"600\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h3_font\":\"1\",\"h3_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"regular\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h4_font\":\"1\",\"h4_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"regular\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h5_font\":\"1\",\"h5_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"600\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h6_font\":\"1\",\"h6_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"600\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_navigation_font\":\"0\",\"enable_custom_font\":\"0\",\"compress_css\":\"0\",\"compress_js\":\"0\",\"lessoption\":\"0\",\"show_post_format\":\"1\",\"commenting_engine\":\"disabled\",\"disqus_devmode\":\"0\",\"intensedebate_acc\":\"\",\"fb_width\":\"500\",\"fb_cpp\":\"10\",\"comments_count\":\"0\",\"social_share\":\"1\",\"image_small\":\"0\",\"image_small_size\":\"100X100\",\"image_thumbnail\":\"1\",\"image_thumbnail_size\":\"200X200\",\"image_medium\":\"0\",\"image_medium_size\":\"300X300\",\"image_large\":\"0\",\"image_large_size\":\"600X600\",\"blog_list_image\":\"default\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10021, 0, 'com_outlets', 'component', 'com_outlets', '', 1, 1, 0, 0, '{\"name\":\"com_outlets\",\"type\":\"component\",\"creationDate\":\"2018-02-09\",\"author\":\"Michael Buluma\",\"copyright\":\"2018 Michael Buluma\",\"authorEmail\":\"michael@buluma.me.ke\",\"authorUrl\":\"https:\\/\\/www.buluma.me.ke\",\"version\":\"CVS: 1.0.0\",\"description\":\"Outlets\",\"group\":\"\",\"filename\":\"outlets\"}', '{\"googlemapsapikey\":\"\",\"defaultlatitude\":\"\",\"defaultlongitude\":\"\",\"defaultzoomlevel\":\"\",\"custom_limit\":\"\",\"save_history\":\"0\",\"history_limit\":5}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10022, 0, 'com_photos', 'component', 'com_photos', '', 1, 1, 0, 0, '{\"name\":\"com_photos\",\"type\":\"component\",\"creationDate\":\"2018-02-09\",\"author\":\"Michael Buluma\",\"copyright\":\"2018 Michael Buluma\",\"authorEmail\":\"michael@buluma.me.ke\",\"authorUrl\":\"http:\\/\\/buluma.me.ke\",\"version\":\"CVS: 1.0.0\",\"description\":\"A Collection of Photos\",\"group\":\"\",\"filename\":\"photos\"}', '{\"save_history\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10023, 0, 'com_logins', 'component', 'com_logins', '', 1, 1, 0, 0, '{\"name\":\"com_logins\",\"type\":\"component\",\"creationDate\":\"2018-02-09\",\"author\":\"Michael Buluma\",\"copyright\":\"2018 Michael Buluma\",\"authorEmail\":\"michael@buluma.me.ke\",\"authorUrl\":\"http:\\/\\/buluma.me.ke\",\"version\":\"CVS: 1.0.0\",\"description\":\"Tracking App Logins\",\"group\":\"\",\"filename\":\"logins\"}', '{\"save_history\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 0, 'com_qissues', 'component', 'com_qissues', '', 1, 1, 0, 0, '{\"name\":\"com_qissues\",\"type\":\"component\",\"creationDate\":\"2018-02-09\",\"author\":\"Michael Buluma\",\"copyright\":\"2018 Michael Buluma\",\"authorEmail\":\"michael@buluma.me.ke\",\"authorUrl\":\"http:\\/\\/buluma.me.ke\",\"version\":\"CVS: 1.0.0\",\"description\":\"Quality Issues\",\"group\":\"\",\"filename\":\"qissues\"}', '{\"save_history\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10025, 0, 'com_voc', 'component', 'com_voc', '', 1, 1, 0, 0, '{\"name\":\"com_voc\",\"type\":\"component\",\"creationDate\":\"2018-02-09\",\"author\":\"Michael Buluma\",\"copyright\":\"2018 Michael Buluma\",\"authorEmail\":\"michael@buluma.me.ke\",\"authorUrl\":\"http:\\/\\/buluma.me.ke\",\"version\":\"CVS: 1.0.0\",\"description\":\"Voice of Customer\",\"group\":\"\",\"filename\":\"voc\"}', '{\"save_history\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_fields`
--

CREATE TABLE `dxcr2_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_fields`
--

INSERT INTO `dxcr2_fields` (`id`, `asset_id`, `context`, `group_id`, `title`, `name`, `label`, `default_value`, `type`, `note`, `description`, `state`, `required`, `checked_out`, `checked_out_time`, `ordering`, `params`, `fieldparams`, `language`, `created_time`, `created_user_id`, `modified_time`, `modified_by`, `access`) VALUES
(1, 88, 'com_users.user', 1, 'Region', 'region', 'Region', '', 'text', '', '', 1, 0, 0, '0000-00-00 00:00:00', 0, '{\"hint\":\"Please enter region\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"2\"}', '{\"filter\":\"\",\"maxlength\":\"\"}', '*', '2018-02-07 22:03:59', 542, '2018-02-07 22:10:30', 542, 1),
(2, 89, 'com_users.user', 1, 'reports_to', 'reports-to', 'reports_to', '0', 'user', '', '', 1, 0, 0, '0000-00-00 00:00:00', 0, '{\"hint\":\"Select Team Leader\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":null,\"display\":\"2\"}', '', '*', '2018-02-07 22:05:21', 542, '2018-02-07 22:10:47', 542, 1),
(3, 90, 'com_users.user', 1, 'shop_id', 'shop-id', 'shop_id', '', 'sql', '', '', 1, 0, 0, '0000-00-00 00:00:00', 0, '{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"2\"}', '{\"query\":\"SELECT id as value, shop_name as text FROM #__outlets\",\"multiple\":\"1\"}', '*', '2018-02-07 22:08:22', 542, '2018-02-07 22:14:38', 542, 1),
(4, 92, 'com_users.user', 1, 'phone_number', 'phone-number', 'phone_number', '', 'text', '', 'Users phone number', 1, 0, 0, '0000-00-00 00:00:00', 0, '{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"2\"}', '{\"filter\":\"tel\",\"maxlength\":10}', '*', '2018-02-07 22:26:44', 542, '2018-02-07 22:28:00', 542, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_fields_categories`
--

CREATE TABLE `dxcr2_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_fields_groups`
--

CREATE TABLE `dxcr2_fields_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_fields_groups`
--

INSERT INTO `dxcr2_fields_groups` (`id`, `asset_id`, `context`, `title`, `note`, `description`, `state`, `checked_out`, `checked_out_time`, `ordering`, `params`, `language`, `created`, `created_by`, `modified`, `modified_by`, `access`) VALUES
(1, 91, 'com_users.user', 'Extended Information', '', 'Extended Information', 1, 0, '0000-00-00 00:00:00', 0, '', '*', '2018-02-07 22:08:46', 542, '2018-02-07 22:16:32', 542, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_fields_values`
--

CREATE TABLE `dxcr2_fields_values` (
  `field_id` int(10) UNSIGNED NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_fields_values`
--

INSERT INTO `dxcr2_fields_values` (`field_id`, `item_id`, `value`) VALUES
(1, '544', 'Nairobi'),
(2, '544', '543'),
(3, '544', '1'),
(3, '544', '2'),
(4, '544', '.0710886052');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_filters`
--

CREATE TABLE `dxcr2_finder_filters` (
  `filter_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links`
--

CREATE TABLE `dxcr2_finder_links` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double UNSIGNED NOT NULL DEFAULT '0',
  `sale_price` double UNSIGNED NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms0`
--

CREATE TABLE `dxcr2_finder_links_terms0` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms1`
--

CREATE TABLE `dxcr2_finder_links_terms1` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms2`
--

CREATE TABLE `dxcr2_finder_links_terms2` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms3`
--

CREATE TABLE `dxcr2_finder_links_terms3` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms4`
--

CREATE TABLE `dxcr2_finder_links_terms4` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms5`
--

CREATE TABLE `dxcr2_finder_links_terms5` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms6`
--

CREATE TABLE `dxcr2_finder_links_terms6` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms7`
--

CREATE TABLE `dxcr2_finder_links_terms7` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms8`
--

CREATE TABLE `dxcr2_finder_links_terms8` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_terms9`
--

CREATE TABLE `dxcr2_finder_links_terms9` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_termsa`
--

CREATE TABLE `dxcr2_finder_links_termsa` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_termsb`
--

CREATE TABLE `dxcr2_finder_links_termsb` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_termsc`
--

CREATE TABLE `dxcr2_finder_links_termsc` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_termsd`
--

CREATE TABLE `dxcr2_finder_links_termsd` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_termse`
--

CREATE TABLE `dxcr2_finder_links_termse` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_links_termsf`
--

CREATE TABLE `dxcr2_finder_links_termsf` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_taxonomy`
--

CREATE TABLE `dxcr2_finder_taxonomy` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dxcr2_finder_taxonomy`
--

INSERT INTO `dxcr2_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_taxonomy_map`
--

CREATE TABLE `dxcr2_finder_taxonomy_map` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_terms`
--

CREATE TABLE `dxcr2_finder_terms` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_terms_common`
--

CREATE TABLE `dxcr2_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dxcr2_finder_terms_common`
--

INSERT INTO `dxcr2_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('any', 'en'),
('are', 'en'),
('aren\'t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn\'t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_tokens`
--

CREATE TABLE `dxcr2_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '1',
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_tokens_aggregate`
--

CREATE TABLE `dxcr2_finder_tokens_aggregate` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `term_weight` float UNSIGNED NOT NULL,
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `context_weight` float UNSIGNED NOT NULL,
  `total_weight` float UNSIGNED NOT NULL,
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_finder_types`
--

CREATE TABLE `dxcr2_finder_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_languages`
--

CREATE TABLE `dxcr2_languages` (
  `lang_id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_languages`
--

INSERT INTO `dxcr2_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_logins`
--

CREATE TABLE `dxcr2_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `day` datetime NOT NULL,
  `login_coords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_logins`
--

INSERT INTO `dxcr2_logins` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `username`, `login_time`, `day`, `login_coords`) VALUES
(1, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(2, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(3, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(4, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(5, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(6, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(7, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(8, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(9, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(10, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(11, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(12, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(13, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(14, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(15, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(16, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(17, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(18, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-07 00:00:00', ''),
(19, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(21, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(22, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(23, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(24, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(25, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(26, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(27, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(28, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(29, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(30, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(31, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(32, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(33, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(34, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(35, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(36, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(37, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(38, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(39, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-08 00:00:00', ''),
(40, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-17 00:00:00', ''),
(41, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-18 00:00:00', ''),
(42, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-18 00:00:00', ''),
(43, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-18 00:00:00', ''),
(44, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-18 00:00:00', ''),
(45, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-18 00:00:00', ''),
(46, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-18 00:00:00', ''),
(47, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-19 00:00:00', ''),
(48, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-19 00:00:00', ''),
(49, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-19 00:00:00', ''),
(50, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-20 00:00:00', ''),
(51, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-20 00:00:00', ''),
(52, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-20 00:00:00', ''),
(53, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-22 00:00:00', ''),
(54, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-22 00:00:00', ''),
(55, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-24 00:00:00', ''),
(56, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2017-12-24 00:00:00', ''),
(57, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2018-01-04 00:00:00', ''),
(58, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2018-01-08 00:00:00', ''),
(59, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2018-01-08 00:00:00', ''),
(60, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2018-01-08 00:00:00', ''),
(61, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, '2018-02-09 09:11:41', '2018-02-09 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_menu`
--

CREATE TABLE `dxcr2_menu` (
  `id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_menu`
--

INSERT INTO `dxcr2_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 103, 0, '*', 0),
(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 1, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 1, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 1, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'main', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 1, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 20, 0, '*', 1),
(11, 'main', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 1, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(13, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 21, 26, 0, '*', 1),
(14, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 22, 23, 0, '*', 1),
(15, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 1, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 24, 25, 0, '*', 1),
(16, 'main', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 1, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 27, 28, 0, '*', 1),
(17, 'main', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 1, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 29, 30, 0, '*', 1),
(18, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(19, 'main', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 33, 34, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 1, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 35, 36, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 1, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 37, 38, 0, '*', 1),
(22, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations', 'component', 1, 1, 1, 34, 0, '0000-00-00 00:00:00', 0, 0, 'class:associations', 0, '', 39, 40, 0, '*', 1),
(101, 'hidden-menu', 'Login', 'home', '', 'home', 'index.php?option=com_users&view=profile', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"menulayout\":\"{\\\"width\\\":600,\\\"menuItem\\\":1,\\\"menuAlign\\\":\\\"right\\\",\\\"layout\\\":[{\\\"type\\\":\\\"row\\\",\\\"attr\\\":[{\\\"type\\\":\\\"column\\\",\\\"colGrid\\\":12,\\\"menuParentId\\\":\\\"101\\\",\\\"moduleId\\\":\\\"\\\"}]}]}\",\"megamenu\":\"0\",\"showmenutitle\":\"1\",\"icon\":\"\",\"class\":\"\",\"enable_page_title\":\"0\",\"page_title_alt\":\"\",\"page_subtitle\":\"\",\"page_title_bg_color\":\"\",\"page_title_bg_image\":\"\"}', 41, 42, 1, '*', 0),
(105, 'mainmenu', 'Outlets', 'outlets', '', 'outlets', 'index.php?option=com_outlets&view=outlets', 'component', 1, 1, 1, 10021, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"menulayout\":\"{\\\"width\\\":600,\\\"menuItem\\\":1,\\\"menuAlign\\\":\\\"right\\\",\\\"layout\\\":[{\\\"type\\\":\\\"row\\\",\\\"attr\\\":[{\\\"type\\\":\\\"column\\\",\\\"colGrid\\\":12,\\\"menuParentId\\\":\\\"105\\\",\\\"moduleId\\\":\\\"\\\"}]}]}\",\"megamenu\":\"0\",\"showmenutitle\":\"1\",\"icon\":\"\",\"class\":\"\",\"enable_page_title\":\"0\",\"page_title_alt\":\"\",\"page_subtitle\":\"\",\"page_title_bg_color\":\"\",\"page_title_bg_image\":\"\"}', 43, 44, 0, '*', 0),
(119, 'mainmenu', 'Objectives', 'objectives', '', 'objectives', 'index.php?option=com_objectives&view=objectives', 'component', 1, 1, 1, 10005, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"menulayout\":\"{\\\"width\\\":600,\\\"menuItem\\\":1,\\\"menuAlign\\\":\\\"right\\\",\\\"layout\\\":[{\\\"type\\\":\\\"row\\\",\\\"attr\\\":[{\\\"type\\\":\\\"column\\\",\\\"colGrid\\\":12,\\\"menuParentId\\\":\\\"119\\\",\\\"moduleId\\\":\\\"\\\"}]}]}\",\"megamenu\":\"0\",\"showmenutitle\":\"1\",\"icon\":\"\",\"class\":\"\",\"enable_page_title\":\"0\",\"page_title_alt\":\"\",\"page_subtitle\":\"\",\"page_title_bg_color\":\"\",\"page_title_bg_image\":\"\"}', 45, 46, 0, '*', 0),
(120, 'mainmenu', 'Weekly Planner', 'weekly-planner', '', 'weekly-planner', 'index.php?option=com_planner&view=weeklyplan', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 47, 48, 0, '*', 0),
(121, 'mainmenu', 'PSC', 'psc', '', 'psc', 'index.php?option=com_submitted&view=checklists', 'component', 1, 1, 1, 10009, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 49, 50, 0, '*', 0),
(126, 'mainmenu', 'Prodcts', 'prodcts', '', 'prodcts', 'index.php?option=com_products&view=products', 'component', 1, 1, 1, 10006, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 51, 54, 0, '*', 0),
(133, 'main', 'COM_OBJECTIVES', 'com-objectives', '', 'com-objectives', 'index.php?option=com_objectives', 'component', 1, 1, 1, 10005, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 55, 60, 0, '', 1),
(134, 'main', 'COM_OBJECTIVES_TITLE_OBJECTIVES', 'com-objectives-title-objectives', '', 'com-objectives/com-objectives-title-objectives', 'index.php?option=com_objectives&view=objectives', 'component', 1, 133, 2, 10005, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 56, 57, 0, '', 1),
(135, 'main', 'COM_OBJECTIVES_OBJECTIVES_CATEGORY', 'com-objectives-objectives-category', '', 'com-objectives/com-objectives-objectives-category', 'index.php?option=com_categories&extension=com_objectives', 'component', 1, 133, 2, 10005, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 58, 59, 0, '', 1),
(140, 'main', 'COM_PRODUCTS', 'com-products', '', 'com-products', 'index.php?option=com_products', 'component', 1, 1, 1, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 61, 68, 0, '', 1),
(141, 'main', 'COM_PRODUCTS_TITLE_PRODUCTS', 'com-products-title-products', '', 'com-products/com-products-title-products', 'index.php?option=com_products&view=products', 'component', 1, 140, 2, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 62, 63, 0, '', 1),
(142, 'main', 'COM_PRODUCTS_PRODUCTS_CATEGORY', 'com-products-products-category', '', 'com-products/com-products-products-category', 'index.php?option=com_categories&extension=com_products', 'component', 1, 140, 2, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 64, 65, 0, '', 1),
(143, 'main', 'COM_PRODUCTS_TITLE_BRANDSTOCKS', 'com-products-title-brandstocks', '', 'com-products/com-products-title-brandstocks', 'index.php?option=com_products&view=brandstocks', 'component', 1, 140, 2, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 66, 67, 0, '', 1),
(159, 'main', 'COM_PLANNER', 'com-planner', '', 'com-planner', 'index.php?option=com_planner', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 69, 72, 0, '', 1),
(160, 'main', 'COM_PLANNER_TITLE_WEEKLYPLAN', 'com-planner-title-weeklyplan', '', 'com-planner/com-planner-title-weeklyplan', 'index.php?option=com_planner&view=weeklyplan', 'component', 1, 159, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 70, 71, 0, '', 1),
(167, 'mainmenu', 'Brand Stocks', 'brand-stocks', '', 'prodcts/brand-stocks', 'index.php?option=com_products&view=brandstocks', 'component', 1, 126, 2, 10006, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 52, 53, 0, '*', 0),
(168, 'main', 'COM_SUBMITTED', 'com-submitted', '', 'com-submitted', 'index.php?option=com_submitted', 'component', 1, 1, 1, 10009, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 73, 78, 0, '', 1),
(169, 'main', 'COM_SUBMITTED_TITLE_CHECKLISTS', 'com-submitted-title-checklists', '', 'com-submitted/com-submitted-title-checklists', 'index.php?option=com_submitted&view=checklists', 'component', 1, 168, 2, 10009, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 74, 75, 0, '', 1),
(170, 'main', 'COM_SUBMITTED_TITLE_TLFOCUSAREAS', 'com-submitted-title-tlfocusareas', '', 'com-submitted/com-submitted-title-tlfocusareas', 'index.php?option=com_submitted&view=tlfocusareas', 'component', 1, 168, 2, 10009, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 76, 77, 0, '', 1),
(171, 'mainmenu', 'Logout', 'logout', '', 'logout', 'index.php?option=com_users&view=login&layout=logout&task=user.menulogout', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{\"logout\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"menulayout\":\"{\\\"width\\\":600,\\\"menuItem\\\":1,\\\"menuAlign\\\":\\\"right\\\",\\\"layout\\\":[{\\\"type\\\":\\\"row\\\",\\\"attr\\\":[{\\\"type\\\":\\\"column\\\",\\\"colGrid\\\":12,\\\"menuParentId\\\":\\\"171\\\",\\\"moduleId\\\":\\\"\\\"}]}]}\",\"megamenu\":\"0\",\"showmenutitle\":\"1\",\"icon\":\"\",\"class\":\"\",\"enable_page_title\":\"0\",\"page_title_alt\":\"\",\"page_subtitle\":\"\",\"page_title_bg_color\":\"\",\"page_title_bg_image\":\"\"}', 79, 80, 0, '*', 0),
(181, 'main', 'COM_OUTLETS', 'com-outlets', '', 'com-outlets', 'index.php?option=com_outlets', 'component', 1, 1, 1, 10021, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 81, 86, 0, '', 1),
(182, 'main', 'COM_OUTLETS_TITLE_OUTLETS', 'com-outlets-title-outlets', '', 'com-outlets/com-outlets-title-outlets', 'index.php?option=com_outlets&view=outlets', 'component', 1, 181, 2, 10021, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 82, 83, 0, '', 1),
(183, 'main', 'COM_OUTLETS_TITLE_CHECKINS', 'com-outlets-title-checkins', '', 'com-outlets/com-outlets-title-checkins', 'index.php?option=com_outlets&view=checkins', 'component', 1, 181, 2, 10021, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 84, 85, 0, '', 1),
(190, 'main', 'COM_PHOTOS', 'com-photos', '', 'com-photos', 'index.php?option=com_photos', 'component', 1, 1, 1, 10022, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 87, 90, 0, '', 1),
(191, 'main', 'COM_PHOTOS_TITLE_PHOTOS', 'com-photos-title-photos', '', 'com-photos/com-photos-title-photos', 'index.php?option=com_photos&view=photos', 'component', 1, 190, 2, 10022, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 88, 89, 0, '', 1),
(192, 'main', 'COM_LOGINS', 'com-logins', '', 'com-logins', 'index.php?option=com_logins', 'component', 1, 1, 1, 10023, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 91, 94, 0, '', 1),
(193, 'main', 'COM_LOGINS_TITLE_LOGINS', 'com-logins-title-logins', '', 'com-logins/com-logins-title-logins', 'index.php?option=com_logins&view=logins', 'component', 1, 192, 2, 10023, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 92, 93, 0, '', 1),
(198, 'main', 'COM_QISSUES', 'com-qissues', '', 'com-qissues', 'index.php?option=com_qissues', 'component', 1, 1, 1, 10024, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 95, 98, 0, '', 1),
(199, 'main', 'COM_QISSUES_TITLE_ISSUES', 'com-qissues-title-issues', '', 'com-qissues/com-qissues-title-issues', 'index.php?option=com_qissues&view=issues', 'component', 1, 198, 2, 10024, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 96, 97, 0, '', 1),
(200, 'main', 'COM_VOC', 'com-voc', '', 'com-voc', 'index.php?option=com_voc', 'component', 1, 1, 1, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 99, 102, 0, '', 1),
(201, 'main', 'COM_VOC_TITLE_VOCS', 'com-voc-title-vocs', '', 'com-voc/com-voc-title-vocs', 'index.php?option=com_voc&view=vocs', 'component', 1, 200, 2, 10025, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 100, 101, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_menu_types`
--

CREATE TABLE `dxcr2_menu_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_menu_types`
--

INSERT INTO `dxcr2_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0),
(2, 93, 'hidden-menu', 'hidden menu', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_messages`
--

CREATE TABLE `dxcr2_messages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `user_id_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id_to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_messages_cfg`
--

CREATE TABLE `dxcr2_messages_cfg` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_modules`
--

CREATE TABLE `dxcr2_modules` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_modules`
--

INSERT INTO `dxcr2_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'position-8', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_popular', 3, 1, '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_latest', 3, 1, '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{\"menutype\":\"*\",\"preset\":\"modern\",\"check\":\"1\",\"shownew\":\"1\",\"showhelp\":\"0\",\"forum_url\":false,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'position-8', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{\"greeting\":\"1\",\"name\":\"0\"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(87, 55, 'Sample Data', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_sampledata', 6, 1, '{}', 1, '*');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_modules_menu`
--

CREATE TABLE `dxcr2_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_modules_menu`
--

INSERT INTO `dxcr2_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_newsfeeds`
--

CREATE TABLE `dxcr2_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `cache_time` int(10) UNSIGNED NOT NULL DEFAULT '3600',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_objective`
--

CREATE TABLE `dxcr2_objective` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `response_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_score` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_objective`
--

INSERT INTO `dxcr2_objective` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `response_type`, `category`, `target_score`) VALUES
(1, 1, 1, 542, '2018-02-06 22:19:15', 542, 542, 'score', '9', '23');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_objectives`
--

CREATE TABLE `dxcr2_objectives` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `objective` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_score` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_objectives`
--

INSERT INTO `dxcr2_objectives` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `objective`, `response_type`, `category`, `target_score`, `published`, `deleted`, `created_on`, `modified_on`) VALUES
(1, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'ETC share of space at 80% of total Lotion category', 'score', '14', '80%', '1', '0', NULL, '2017-12-18 20:38:18'),
(2, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'Lotion at the beginning of the aisle', 'score', '14', '', '1', '0', NULL, '2017-12-18 20:38:24'),
(3, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'N&L COCO/B Lot 600ML - 8% share in the Lotion category', 'score', '14', '8%', '1', '0', NULL, '2017-12-18 20:38:26'),
(4, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'N&L COCO/B Lot 200ML - 14% share in the Lotion category', 'score', '14', '14%', '1', '0', NULL, '2017-12-18 20:38:29'),
(5, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'VERS FRESH PERF 100ML - 34% share in the Perfume category', 'score', '14', '34%', '1', '0', NULL, '2017-12-18 20:38:31'),
(6, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'N&L  H/F 300GMS - 14% share in the Hair category', 'score', '14', '14%', '1', '0', NULL, '2017-12-18 20:38:33'),
(25, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'VERS FRESH PERF 100ML 50%', 'score', '16', '50%', '1', '0', NULL, '2017-12-18 20:38:41'),
(27, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'N&L PERF/B Jelly 250GMS placed at eye level', 'score', '19', '', '1', '0', NULL, '2017-12-18 20:38:43'),
(28, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'Gold Touch 50%', 'score', '17', '50%', '1', '0', NULL, '2017-12-18 20:38:45'),
(61, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'Does the outlet have a Gondola - Yes or No', 'agree', '18', '', '1', '0', NULL, '2017-12-17 21:00:00'),
(62, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'Achieved defined Lotion category - Yes or No', 'agree', '18', '', '1', '0', NULL, '2017-12-17 21:00:00'),
(63, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'Achieved defined Gold Touch category - Yes or No', 'agree', '18', '', '1', '0', NULL, '2017-12-17 21:00:00'),
(64, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'Achieved defined Hair category - Yes or No', 'agree', '18', '', '1', '0', NULL, '2017-12-17 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_objectives2`
--

CREATE TABLE `dxcr2_objectives2` (
  `id` int(11) NOT NULL,
  `objective` varchar(255) NOT NULL,
  `response_type` varchar(11) NOT NULL DEFAULT 'score',
  `category` varchar(100) DEFAULT NULL,
  `target_score` varchar(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dxcr2_objectives2`
--

INSERT INTO `dxcr2_objectives2` (`id`, `objective`, `response_type`, `category`, `target_score`, `published`, `deleted`, `created_on`, `modified_on`) VALUES
(1, 'ETC share of space at 80% of total Lotion category', 'score', 'Brands', '80%', 1, 0, NULL, '2017-12-18 20:38:18'),
(2, 'Lotion at the beginning of the aisle', 'score', 'Brands', NULL, 1, 0, NULL, '2017-12-18 20:38:24'),
(3, 'N&L COCO/B Lot 600ML - 8% share in the Lotion category', 'score', 'Brands', '8%', 1, 0, NULL, '2017-12-18 20:38:26'),
(4, 'N&L COCO/B Lot 200ML - 14% share in the Lotion category', 'score', 'Brands', '14%', 1, 0, NULL, '2017-12-18 20:38:29'),
(5, 'VERS FRESH PERF 100ML - 34% share in the Perfume category', 'score', 'Brands', '34%', 1, 0, NULL, '2017-12-18 20:38:31'),
(6, 'N&L  H/F 300GMS - 14% share in the Hair category', 'score', 'Brands', '14%', 1, 0, NULL, '2017-12-18 20:38:33'),
(25, 'VERS FRESH PERF 100ML 50%', 'score', 'Perfume', '50%', 1, 0, NULL, '2017-12-18 20:38:41'),
(27, 'N&L PERF/B Jelly 250GMS placed at eye level', 'score', 'Jelly', NULL, 1, 0, NULL, '2017-12-18 20:38:43'),
(28, 'Gold Touch 50%', 'score', 'Gold Touch', '50%', 1, 0, NULL, '2017-12-18 20:38:45'),
(61, 'Does the outlet have a Gondola - Yes or No', 'agree', 'Yes-No', NULL, 1, 0, NULL, '2017-12-17 21:00:00'),
(62, 'Achieved defined Lotion category - Yes or No', 'agree', 'Yes-No', NULL, 1, 0, NULL, '2017-12-17 21:00:00'),
(63, 'Achieved defined Gold Touch category - Yes or No', 'agree', 'Yes-No', NULL, 1, 0, NULL, '2017-12-17 21:00:00'),
(64, 'Achieved defined Hair category - Yes or No', 'agree', 'Yes-No', NULL, 1, 0, NULL, '2017-12-17 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_outlets`
--

CREATE TABLE `dxcr2_outlets` (
  `id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gmap` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `submitter` int(11) NOT NULL,
  `last_sync_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_outlets`
--

INSERT INTO `dxcr2_outlets` (`id`, `asset_id`, `ordering`, `state`, `account`, `shop_name`, `category`, `region`, `location`, `manager_name`, `manager_phone`, `manager_email`, `gmap`, `user_id`, `submitter`, `last_sync_date`, `date_created`, `modified_by`, `created_by`, `checked_out`, `checked_out_time`) VALUES
(1, 98, 0, 1, '', '101 Store', '2', 'Transbionics', 'Isiolo', 'mike', '999', '', '{\"latitude\":-1.2920659,\"longitude\":36.82194619999996,\"addres\":\"Cannon House, Nairobi, Kenya\"}', 0, 0, '', '2018-02-09 07:28:24', 542, 542, 0, '0000-00-00 00:00:00'),
(2, 99, 0, 1, '', 'A-1 Supermarket', '1', 'Sawand', 'Mombasa CBD', '', '', '', '{\"latitude\":-4.0434771,\"longitude\":39.6682065,\"addres\":\"Manyimbo, Mombasa, Kenya\"}', 0, 0, '', '2018-02-09 07:35:32', 542, 542, 0, '0000-00-00 00:00:00'),
(3, 0, 0, 1, '', 'Acacia', '1', 'Vibs', 'Kayole', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(4, 0, 0, 1, '', 'Acacia Supermaket Kitengela', '1', 'Vibs', 'Kitengela', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(5, 0, 0, 1, '', 'Afco 3kr', '2', 'Stonerise', 'nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(6, 0, 0, 1, '', 'Afco Kma', '2', 'Stonerise', 'nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(7, 0, 0, 1, '', 'Afri-face', '2', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(8, 96, 0, 1, 'AKK', 'Akk', '4', 'Transbionics', 'Isiolo', '', '', '', '', 0, 0, '', '2018-02-09 02:45:39', 542, 0, 0, '0000-00-00 00:00:00'),
(9, 0, 0, 1, '', 'Akshar Sotik', '2', 'Cinderella', 'Sotik', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(10, 0, 0, 1, '', 'Almaida', '2', 'Vibs', 'Tala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(11, 0, 0, 1, '', 'Ananas Thika', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(12, 0, 0, 1, '', 'Baccacos', '2', 'Cinderella', 'Homabay-', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(13, 0, 0, 1, '', 'Bachus', '2', 'Sawand', 'Voi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(14, 0, 0, 1, '', 'Bafaghi', '1', 'Sawand', 'Voi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(15, 0, 0, 1, '', 'Bahari', '2', 'Sawand', '', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(16, 0, 0, 1, '', 'Bamwai', '2', 'Eldovasco', 'Iten', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(17, 0, 0, 1, '', 'Bansi Supermarket- Migori Town', '1', 'Cinderella', 'Migori', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(18, 0, 0, 1, '', 'Bansi W/S', '2', 'Cinderella', 'Migori', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(19, 0, 0, 1, '', 'Baraka', '2', 'Sawand', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(20, 0, 0, 1, '', 'Baraka Tuskys - Thika', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(21, 0, 0, 1, '', 'Beautiful Lady', '1', 'Sawand', 'Mombasa CBD', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(22, 0, 0, 1, '', 'Beauty Line ', '2', 'Transbionics', 'Maua', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(23, 0, 0, 1, '', 'Beauty Shop Nyakio', '1', 'Pambazuko', 'CBD', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(24, 0, 0, 1, '', 'Beauty Shop Perida', '1', 'Pambazuko', 'CBD', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(25, 0, 0, 1, '', 'Beauty Smile', '2', 'Eldovaso', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(26, 0, 0, 1, '', 'Beco', '2', 'Cinderella', 'Liten', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(27, 0, 0, 1, '', 'Bei Nafuu', '2', '', '', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(28, 0, 0, 1, '', 'Bei Rahisi', '2', '', '', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(29, 0, 0, 1, '', 'Bei Sawa', '2', 'Transbionics', 'Maua', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(30, 0, 0, 1, '', 'Bestlady B6', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(31, 0, 0, 1, '', 'Bestly', '1', 'Go DOWN', 'Karatina', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(32, 0, 0, 1, '', 'Bestly', '1', 'Go DOWN', 'Meru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(33, 0, 0, 1, '', 'Bestly', '1', 'Go DOWN', 'Kitale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(34, 0, 0, 1, '', 'Bestly', '1', 'Go DOWN', 'Maua', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(35, 0, 0, 1, '', 'Bestly', '1', 'Go DOWN', 'Nyeri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(36, 0, 0, 1, '', 'Bestly', '1', 'Go DOWN', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(37, 0, 0, 1, '', 'Bestly', '1', 'Go DOWN', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(38, 0, 0, 1, '', 'Bestly', '1', 'Go DOWN', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(39, 0, 0, 1, '', 'Bestly 12', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(40, 0, 0, 1, '', 'Bestly 2', '1', 'Sawand', 'Mombasa CBD', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(41, 0, 0, 1, '', 'Bestly 4', '1', 'Go DOWN', 'River Road', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(42, 0, 0, 1, '', 'Bestly 5', '1', 'Go DOWN', 'Ronald Ngala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(43, 0, 0, 1, '', 'Bestly 7', '1', 'Go DOWN', 'Koja Mosque', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(44, 0, 0, 1, '', 'Bestly 8', '1', 'Go DOWN', 'Moi Avenue', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(45, 0, 0, 1, '', 'Bestly 9', '1', 'Go DOWN', 'Mombasa CBD', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(46, 0, 0, 1, '', 'Bestly Digo Rd', '1', 'Go DOWN', 'Mombasa CBD', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(47, 0, 0, 1, '', 'Bestly Mtwapa', '1', 'Go DOWN', 'Mtwapa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(48, 0, 0, 1, '', 'Bestly Thika 1', '1', 'Go DOWN', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(49, 0, 0, 1, '', 'Bestly Thika 2', '1', 'Go DOWN', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(50, 0, 0, 1, '', 'Bestprice', '2', '', '', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(51, 0, 0, 1, '', 'Betty Matt Kericho', '2', 'Cinderella', 'Kericho', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(52, 0, 0, 1, '', 'Beulah', '', '', '', '', '', '', '', 0, 0, '', '2018-02-09 02:36:04', 0, 0, 0, '0000-00-00 00:00:00'),
(53, 0, 0, 1, '', 'Bidii Matuu', '1', 'Transbionics', 'Matuu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(54, 0, 0, 1, '', 'Bidii Ruiru', '2', 'Vibs', 'Ruiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(55, 0, 0, 1, '', 'Bidii Stores', '2', 'Transbionics', '', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(56, 0, 0, 1, '', 'Binka', '3', 'Vibs', '', '', '', '', '', 0, 0, '', '2018-02-09 02:40:47', 0, 0, 0, '0000-00-00 00:00:00'),
(57, 0, 0, 1, '', 'Bondo Discount,', '2', 'Nyanza Cosmix', 'Bondo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(58, 0, 0, 1, '', 'Border', '2', 'Stonerise', '', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(59, 0, 0, 1, '', 'Boston Thika', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(60, 0, 0, 1, '', 'Bright Star', '2', 'Transbionics', '', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(61, 0, 0, 1, '', 'Brilliant Matuu', '1', 'Transbionics', 'Matuu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(62, 0, 0, 1, '', 'Budget', '1', 'Transbionics', 'Nyanyuki', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(63, 0, 0, 1, '', 'Budget Digo', '1', 'Sawand', 'Mombasa CBD', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(64, 0, 0, 1, '', 'Budget Kilindini', '1', 'Sawand', 'Mombasa ', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(65, 0, 0, 1, '', 'Budget Mini Runyenjes', '1', 'Transbionics', 'Runyenjes', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(66, 0, 0, 1, '', 'Budget Nkubu', '1', 'Transbionics', 'Nkubu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(67, 0, 0, 1, '', 'Budget S/M', '1', 'Transbionics', 'Meru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(68, 0, 0, 1, '', 'Budget Town', '1', 'Transbionics', 'Meru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(69, 0, 0, 1, '', 'Bugoma Beauty', '2', 'Eldovaso', 'Bugoma', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(70, 0, 0, 1, '', 'Busbul Supermaket', '1', 'Vibs Eastern', 'Kibwezi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(71, 0, 0, 1, '', 'Cajo A & Cajo B', '2', 'Nyanza Cosmix', 'Bondo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(72, 0, 0, 1, '', 'Cambay', '1', 'Cinderella', 'Nyamira', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(73, 0, 0, 1, '', 'Carrefour', '1', 'Direct', 'Karen', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(74, 0, 0, 1, '', 'Carrefour 2 Rivers', '1', 'Direct', 'Rwaka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(75, 0, 0, 1, '', 'Catwalk', '2', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(76, 0, 0, 1, '', 'Centra S/M', '2', 'Transbionics', 'Othaya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(77, 0, 0, 1, '', 'Central ,Kiriani', '2', 'Transbionics', 'Kiriaini', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(78, 0, 0, 1, '', 'Chamuda', '2', 'Cinderella', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(79, 0, 0, 1, '', 'Chandarana', '1', 'Direct', 'Highridge', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(80, 0, 0, 1, '', 'Chandarana 2 River', '1', 'Direct', 'Rwaka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(81, 0, 0, 1, '', 'Chandarana Abc', '1', 'Direct', 'Westlands', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(82, 0, 0, 1, '', 'Chandarana Adlife', '1', 'Direct', 'Yaya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(83, 0, 0, 1, '', 'Chandarana Diamond', '1', 'Direct', 'Parkland', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(84, 0, 0, 1, '', 'Chandarana Lavington', '1', 'Direct', 'Lavington', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(85, 0, 0, 1, '', 'Chandarana Mobil', '1', 'Direct', 'Muthaiga', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(86, 0, 0, 1, '', 'Chandarana Ngara', '1', 'Direct', 'ngara', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(87, 0, 0, 1, '', 'Chandarana Roselyn', '1', 'Direct', 'Thingiri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(88, 0, 0, 1, '', 'Chandarana Yaya', '1', 'Direct', 'Yaya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(89, 0, 0, 1, '', 'Chandaranas', '1', 'Direct', 'Karen', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(90, 0, 0, 1, '', 'Chandaranas', '1', 'Direct', 'Diani', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(91, 0, 0, 1, '', 'Chandaranas', '1', 'Direct', 'Nyanyuki', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(92, 0, 0, 1, '', 'Chockamart', '2', 'Vibs', 'Njiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(93, 0, 0, 1, '', 'Choppies', '1', 'Eldovasco', 'Bungoma', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(94, 0, 0, 1, '', 'Choppies', '1', '', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(95, 0, 0, 1, '', 'Choppies Format', '1', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(96, 0, 0, 1, '', 'Choppies kenshop', '1', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(97, 0, 0, 1, '', 'Choppies mega', '1', 'Pambazuko', 'Nairrobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(98, 0, 0, 1, '', 'Choppies Nyamasaria', '1', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(99, 0, 0, 1, '', 'Choppies Swan', '1', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(100, 0, 0, 1, '', 'ChoppiesMfangano', '1', 'Pambazuko', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(101, 0, 0, 1, '', 'ChoppiesTom Mboya', '1', 'Pambazuko', 'Nairrobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(102, 0, 0, 1, '', 'Cleanshelf  Langata', '1', 'Pambazuko', 'langata', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(103, 0, 0, 1, '', 'Cleanshelf  Rongai', '1', 'Pambazuko', 'Rongai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(104, 0, 0, 1, '', 'Cleanshelf Keroguya', '1', 'Transbionics', 'Keroguya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(105, 0, 0, 1, '', 'Cleanshelf Kiambu', '1', 'Vibs', 'Kiambu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(106, 0, 0, 1, '', 'Cleanshelf Limuru', '1', 'Pambazuko', 'Limuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(107, 0, 0, 1, '', 'Cleanshelf Nyahururu', '1', 'Transbionics', 'Nyahururu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(108, 0, 0, 1, '', 'Cleanshelf Ruaka', '1', 'Pambazuko', 'Ruaka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(109, 0, 0, 1, '', 'County Kabati', '1', 'Transbionics', 'Kabati', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(110, 0, 0, 1, '', 'County, Kenol', '1', 'Transbionics', 'Muranga', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(111, 0, 0, 1, '', 'Creammart', '1', 'Vibs', 'Eastlands', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(112, 0, 0, 1, '', 'Dana', '1', 'Cinderella', 'Bomet', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(113, 0, 0, 1, '', 'Defco 4k', '2', 'Direct', 'nanyuki', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(114, 0, 0, 1, '', 'Defco 78', '2', 'Direct', 'isiolo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(115, 0, 0, 1, '', 'Defco Huruma', '2', 'Direct', 'nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(116, 0, 0, 1, '', 'Defco Langata', '2', 'Direct', 'nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(117, 0, 0, 1, '', 'Defco Mini Kahawa', '2', 'Direct', 'nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(118, 0, 0, 1, '', 'Delta Nandi Hills', '2', 'Nyanza Cosmix', 'nandi hills', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(119, 0, 0, 1, '', 'Dicii Kwa Kairu', '1', 'vibs', 'Ruiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(120, 0, 0, 1, '', 'Dimples', '1', 'vibs', 'Umoja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(121, 0, 0, 1, '', 'Diplomat Cosmetics Kitengela', '1', 'vibs', 'Kitengela', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(122, 0, 0, 1, '', 'Double M', '2', 'Stonerise', 'Molo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(123, 0, 0, 1, '', 'Eastam Traders', '2', 'Stonerise', 'Kinangop', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(124, 0, 0, 1, '', 'Eastmatt Eastliegh', '1', 'Direct', 'Eastlands', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(125, 0, 0, 1, '', 'Eastmatt Kajiado', '1', 'Direct', 'Kajiado', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(126, 0, 0, 1, '', 'Eastmatt Kitengela', '1', 'Direct', 'Kitengela', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(127, 0, 0, 1, '', 'Eastmatt Mfangano', '1', 'Direct', 'Mfangano', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(128, 0, 0, 1, '', 'Eastmatt Mwea', '1', 'Direct', 'Mwea', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(129, 0, 0, 1, '', 'Eastmatt River Road', '1', 'Direct', 'River Road', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(130, 0, 0, 1, '', 'Eastmatt Tala', '1', 'Direct', 'Tala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(131, 0, 0, 1, '', 'Eastmatt Tomboy', '1', 'Direct', 'Tom Mboya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(132, 0, 0, 1, '', 'E-Cosmetics', '2', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(133, 0, 0, 1, '', 'Elburgon Matt', '2', 'Stonerise', 'Elburgon', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(134, 0, 0, 1, '', 'Eldomatt Hyper', '1', 'Eldovasco', 'Eldomatt', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(135, 0, 0, 1, '', 'Eldomatt Mega', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(136, 0, 0, 1, '', 'Eldoret Matresses', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(137, 0, 0, 1, '', 'Elegant Beauty', '2', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(138, 0, 0, 1, '', 'Emanuel S/M', '2', 'Transbionics', 'Kangema', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(139, 0, 0, 1, '', 'Emanuel S/M', '2', 'Transbionics', 'Kiriaini', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(140, 0, 0, 1, '', 'Embazza', '2', 'Cinderella', 'Nandi Hills', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(141, 0, 0, 1, '', 'Enjoy Cosmetics', '2', 'Sawand', 'Marikiti', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(142, 0, 0, 1, '', 'Expose', '1', 'Sawand', 'Voi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(143, 0, 0, 1, '', 'Fair Price', '2', 'Sawand', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(144, 0, 0, 1, '', 'Fair Price', '2', 'Pambazuko', 'Ruiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(145, 0, 0, 1, '', 'Fairmart Rongai', '2', 'Pambazuko', 'Rongai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(146, 0, 0, 1, '', 'Fairmatt Kinoo', '1', 'Pambazuko', 'Kinoo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(147, 0, 0, 1, '', 'Family Choice 1', '1', 'Vibs', 'Ngara', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(148, 0, 0, 1, '', 'Family Choice 2', '1', 'Vibs', 'Pangani', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(149, 0, 0, 1, '', 'Frajan Supermarket', '1', 'Vibs Eastern', 'Kibewzi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(150, 0, 0, 1, '', 'Frankmart', '2', 'Nyanza Cosmix', 'Sabatia', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(151, 0, 0, 1, '', 'Frankmatt', '1', 'Nyanza Cosmix', 'Busia', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(152, 0, 0, 1, '', 'Frankmatt', '1', 'Nyanza Cosmix', 'Nambale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(153, 0, 0, 1, '', 'Frankmatt', '1', 'Nyanza Cosmix', 'Malaba', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(154, 0, 0, 1, '', 'Frankmatt', '1', 'Nyanza Cosmix', 'Mumius', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(155, 0, 0, 1, '', 'Freddies ', '2', 'Transbionics', 'Meru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(156, 0, 0, 1, '', 'Fuso', '2', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(157, 0, 0, 1, '', 'G&G Cosmetics', '2', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(158, 0, 0, 1, '', 'Gabbs/Eldoret Cosmetics', '2', 'Eldovaso', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(159, 0, 0, 1, '', 'Galmart', '1', 'Vibs', 'Eastliegh', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(160, 0, 0, 1, '', 'Gift Center ', '2', 'Cinderella', 'Migori', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(161, 0, 0, 1, '', 'Giftmatt Litein', '2', 'Cinderella', 'Liten', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(162, 0, 0, 1, '', 'Gilanis Sm', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(163, 0, 0, 1, '', 'Gilmart Supermaket Kitengela', '1', 'Vibs', 'Kitengela', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(164, 0, 0, 1, '', 'Gmart 1', '1', 'Vibs', 'Donholm', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(165, 0, 0, 1, '', 'Gmart South B', '1', 'Vibs', 'South B', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(166, 0, 0, 1, '', 'Grama John', '2', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(167, 0, 0, 1, '', 'Greenmart 1', '1', 'Vibs', 'Kayole', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(168, 0, 0, 1, '', 'Greenmart 2', '2', 'Vibs', 'Kayole', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(169, 0, 0, 1, '', 'Greenmatt Umoja', '2', 'Vibs', 'Umoja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(170, 0, 0, 1, '', 'H.M. Eldo', '2', 'Eldovaso', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(171, 0, 0, 1, '', 'Halal', '2', 'Vibs', 'Eastleigh', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(172, 0, 0, 1, '', 'Happy Gatundu', '1', 'Vibs', 'Gatundu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(173, 0, 0, 1, '', 'Happy Juja', '1', 'Vibs', 'Juja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(174, 0, 0, 1, '', 'Harvester', '2', 'Vibs', 'Juja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(175, 0, 0, 1, '', 'Helly', '2', 'Cinderella', 'Homabay', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(176, 0, 0, 1, '', 'Homabay Supermarket-', '1', 'Cinderella', 'Homabay', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(177, 0, 0, 1, '', 'Home Of Budget', '2', 'Pambazuko', 'Banana', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(178, 0, 0, 1, '', 'Homechoice Banana', '2', 'Pambazuko', 'Banana', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(179, 0, 0, 1, '', 'Homematt  Utawala', '1', 'Vibs', 'Utawala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(180, 0, 0, 1, '', 'Homematt Fedha', '1', 'Vibs', 'Fedha', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(181, 0, 0, 1, '', 'Im Beautiful', '2', 'Sawand', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(182, 0, 0, 1, '', 'Jackmil Kinoo', '1', 'Pambazuko', 'Kinoo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(183, 0, 0, 1, '', 'Jackmil Pipeline', '1', 'Pambazuko', 'Pipeline', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(184, 0, 0, 1, '', 'Jacmil Kinoo', '1', 'Pambazuko', 'Kinoo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(185, 0, 0, 1, '', 'Jacmil Market Kinoo', '1', 'Vibs', 'Kayole', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(186, 0, 0, 1, '', 'Jaharis', '2', 'Vibs', 'Kayole', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(187, 0, 0, 1, '', 'Jaharis Embakasi', '2', 'Vibs', 'Embakasi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(188, 0, 0, 1, '', 'Jaihari', '1', 'Sawand', 'Voi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(189, 0, 0, 1, '', 'Jamaa Naivasha', '1', 'Stonerise', 'Naivasha', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(190, 0, 0, 1, '', 'Jamaa Olkalau', '1', 'Stonerise', 'Olkalau', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(191, 0, 0, 1, '', 'Jamaa S/ Market', '1', 'Stonerise', 'Nyahururu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(192, 0, 0, 1, '', 'Jatomy Embu', '1', 'Transbionics', 'Embu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(193, 0, 0, 1, '', 'Jatomy S/M', '1', 'Transbionics', 'Chuka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(194, 0, 0, 1, '', 'Jayraj', '2', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(195, 0, 0, 1, '', 'Jazeera Supermarket', '1', 'Vibs Eastern', 'Mwingi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(196, 0, 0, 1, '', 'Jeska', '2', 'Vibs', 'Umoja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(197, 0, 0, 1, '', 'Jimeli Supermaket', '2', 'Vibs Eastern', 'Wote', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(198, 0, 0, 1, '', 'Joma', '3', 'Vibs Eastern', '', '', '', '', '', 0, 0, '', '2018-02-09 02:40:47', 0, 0, 0, '0000-00-00 00:00:00'),
(199, 0, 0, 1, '', 'Jophila Supermarket Athi River', '3', 'Vibs Eastern', 'Athi River', '', '', '', '', 0, 0, '', '2018-02-09 02:40:47', 0, 0, 0, '0000-00-00 00:00:00'),
(200, 0, 0, 1, '', 'Josflo', '2', 'Nyanza Cosmix', 'Bondo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(201, 0, 0, 1, '', 'Joska', '3', 'Vibs', 'Umoja', '', '', '', '', 0, 0, '', '2018-02-09 02:40:47', 0, 0, 0, '0000-00-00 00:00:00'),
(202, 0, 0, 1, '', 'Joystar Kilgoris/', '2', 'Cinderella', 'Kilgoris', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(203, 0, 0, 1, '', 'Jube', '2', 'Transbionics', 'Nkubu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(204, 0, 0, 1, '', 'Jubilee Mercharts', '2', 'Nyanza Cosmix', 'Kapsabet', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(205, 0, 0, 1, '', 'Jujo Supermarket', '2', 'Vibs Eastern', 'Kitui', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(206, 0, 0, 1, '', 'Jumo W/S', '2', 'Cinderella', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(207, 0, 0, 1, '', 'Justan Cosmetic', '2', 'Pambazuko', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(208, 0, 0, 1, '', 'Kabati General', '2', 'Vibs Eastern', 'Kabati', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(209, 0, 0, 1, '', 'Kache Supermarket', '2', 'Eldovasco', 'Kapenguria', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(210, 0, 0, 1, '', 'Kagemi S/Market', '1', 'Pambazuko', 'Kangemi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(211, 0, 0, 1, '', 'Kalyet', '2', 'Cinderella', 'Iten', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(212, 0, 0, 1, '', 'Kamindi Donholm', '1', 'Pambazuko', 'Donholm', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(213, 0, 0, 1, '', 'Kanda Sm', '2', 'Vibs Eastern', 'Kabati', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(214, 0, 0, 1, '', 'Kanini Haraka', '2', 'Cinderella', 'Narok', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(215, 0, 0, 1, '', 'Kanini Haraka -Thika', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(216, 0, 0, 1, '', 'Kapenguria Supermarket', '1', 'Eldovasco', 'Kapenguria', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(217, 0, 0, 1, '', 'Karias 3', '1', 'Vibs', 'Dandora', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(218, 0, 0, 1, '', 'Karias 3', '1', 'Vibs', 'Dandora', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(219, 0, 0, 1, '', 'Karias 3', '1', 'Vibs', 'Dandora', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(220, 0, 0, 1, '', 'Karibu Tena', '2', 'Eldovasco', 'Lesos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(221, 0, 0, 1, '', 'Kassmart Jumbo', '1', 'Vibs', 'Githurai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(222, 0, 0, 1, '', 'Kassmatt Githurai 45', '1', 'Vibs', 'Githurai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(223, 0, 0, 1, '', 'Kassmatt Jumbo', '1', 'Vibs', 'Githurai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(224, 0, 0, 1, '', 'Kassmatt Kasarani', '1', 'Vibs', 'Kasarani', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(225, 0, 0, 1, '', 'Kassmatt Mwiki', '1', 'Vibs', 'Mwiki', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(226, 0, 0, 1, '', 'Kassmatt Thika', '1', 'Transbionics', 'thia', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(227, 0, 0, 1, '', 'Kasturi Embu', '1', 'Transbionics', 'Embu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(228, 0, 0, 1, '', 'Kathumo Supermarket', '2', 'Transbionics', 'Kagumo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(229, 0, 0, 1, '', 'Khetias C.B.D', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(230, 0, 0, 1, '', 'Khetias Center Point', '1', 'Eldovasco', 'Bungoma', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(231, 0, 0, 1, '', 'Khetias Check Point', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(232, 0, 0, 1, '', 'Khetias Cross Roads', '1', 'Eldovasco', 'Bungoma', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(233, 0, 0, 1, '', 'Khetias Dala', '1', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(234, 0, 0, 1, '', 'Khetias Euro', '1', 'Eldovasco', 'Bungoma', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(235, 0, 0, 1, '', 'Khetias Exprss', '1', 'Nyanza Cosmix', 'Mumias', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(236, 0, 0, 1, '', 'Khetias Gigamatt', '1', 'Eldovasco', 'Kitale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(237, 0, 0, 1, '', 'Khetias Plus', '1', 'Eldovasco', 'Kitale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(238, 0, 0, 1, '', 'Khetias Victoria', '1', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(239, 0, 0, 1, '', 'Khetias Wholesale', '1', 'Eldovasco', 'Kitale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(240, 0, 0, 1, '', 'Khetias Wholesale', '1', 'Eldovasco', 'Bungoma', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(241, 0, 0, 1, '', 'Khetias Wholesale', '1', 'Nyanza Cosmix', 'Kakamega', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(242, 0, 0, 1, '', 'Khetias Wholesale', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(243, 0, 0, 1, '', 'Kibuyematt', '1', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(244, 0, 0, 1, '', 'Kimolwet', '1', 'Eldovasco', 'Lesos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(245, 0, 0, 1, '', 'Kims Supermarket, Kandara', '2', 'Transbionics', 'Kandara', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(246, 0, 0, 1, '', 'Kimsa', '2', 'Vibs', 'Githurai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(247, 0, 0, 1, '', 'Kipcentre', '2', 'Eldovasco', 'Kipkaren', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(248, 0, 0, 1, '', 'Kipchimchim', '2', 'Cinderella', 'Liten', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(249, 0, 0, 1, '', 'Kirutho Stores', '2', 'Transbionics', 'Nyanyuki', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(250, 0, 0, 1, '', 'Kisii Mart', '1', 'Cinderella', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(251, 0, 0, 1, '', 'Kisii Mat', '1', 'Cinderella', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(252, 0, 0, 1, '', 'Kisii Matt 1', '1', 'Transbionics', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(253, 0, 0, 1, '', 'Kiwewa', '2', 'Nyanza Cosmix', 'Siaya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(254, 0, 0, 1, '', 'KMatt 3', '1', 'Transbionics', 'Nyeri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(255, 0, 0, 1, '', 'Kobole', '2', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(256, 0, 0, 1, '', 'Kondele', '1', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(257, 0, 0, 1, '', 'Ladies Choice', '2', 'Transbionics', 'Maua', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(258, 0, 0, 1, '', 'Leestar Express', '1', 'Vibs', 'Githurai 44', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(259, 0, 0, 1, '', 'Leestar Pioneer', '1', 'Vibs', 'Githurai 45', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(260, 0, 0, 1, '', 'Leestar Ruiru', '1', 'Vibs', 'Ruiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(261, 0, 0, 1, '', 'Leestar Thika', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(262, 0, 0, 1, '', 'Lelan Supermarket', '2', 'Eldovasco', 'Kapenguria', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(263, 0, 0, 1, '', 'Lillies S/M', '1', 'Vibs', 'K/West', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(264, 0, 0, 1, '', 'Limu Mart', '2', 'Pambazuko', 'Limuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(265, 0, 0, 1, '', 'Llen Cosmetics', '2', 'Cinderella', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(266, 0, 0, 1, '', 'Lugman', '2', 'Nyanza Cosmix', 'Mabale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(267, 0, 0, 1, '', 'Lyna Thika', '2', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(268, 0, 0, 1, '', 'Maathai Ruiru', '2', 'Transbionics', 'Ruiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(269, 0, 0, 1, '', 'Maganda Rongo        /Suneka', '2', 'Cinderella', 'Suneka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(270, 0, 0, 1, '', 'Maguna Hyper Thika', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(271, 0, 0, 1, '', 'Magunas', '1', 'Transbionics', 'Meru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(272, 0, 0, 1, '', 'Magunas Embu', '1', 'Transbionics', 'Embu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(273, 0, 0, 1, '', 'Magunas Muranga', '1', 'Transbionics', 'Muranga', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(274, 0, 0, 1, '', 'Magunas Old', '1', 'Vibs Eastern', 'Kitui', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(275, 0, 0, 1, '', 'Magunas S/M', '1', 'Transbionics', 'Kerogoya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(276, 0, 0, 1, '', 'Magunas Ushirika', '1', 'Transbionics', 'Kerogoya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(277, 0, 0, 1, '', 'Magunas Wendani', '1', 'Transbionics', 'Wendani', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(278, 0, 0, 1, '', 'Maisha Matt', '1', 'Nyanza Cosmix', 'Kakamega', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(279, 0, 0, 1, '', 'Maisha Matt 1', '1', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(280, 0, 0, 1, '', 'Mama Liz', '2', 'Nyanza Cosmix', 'Bumula', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(281, 0, 0, 1, '', 'Mama Watoto Main', '1', 'Nyanza Cosmix', 'Kakamega', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(282, 0, 0, 1, '', 'Mama Watoto Mumias', '1', 'Nyanza Cosmix', 'Mumias', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(283, 0, 0, 1, '', 'Mama Watoto Soko', '1', 'Nyanza Cosmix', 'Kakamega', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(284, 0, 0, 1, '', 'Manguna Enterprise', '1', 'Transbionics', 'thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(285, 0, 0, 1, '', 'Mannequine Thika', '2', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(286, 0, 0, 1, '', 'Mashmart Supermarket Isinya', '2', 'Vibs Eastern', 'Isinya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(287, 0, 0, 1, '', 'Mathai', '1', 'Transbionics', 'Meru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(288, 0, 0, 1, '', 'Mathai Embu', '1', 'Transbionics', 'Embu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(289, 0, 0, 1, '', 'Mathai Karatina', '1', 'Transbionics', 'Karatina', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(290, 0, 0, 1, '', 'Mathai Matco', '1', 'Transbionics', 'Nyeri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(291, 97, 0, 1, '', 'Mathai Matco', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 07:04:55', 542, 542, 0, '0000-00-00 00:00:00'),
(292, 0, 0, 1, '', 'Mathai Muranga', '1', 'Transbionics', 'Muranga', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(293, 0, 0, 1, '', 'Mathai S/M', '1', 'Transbionics', 'Nyeri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(294, 0, 0, 1, '', 'Mathai Thika', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(295, 0, 0, 1, '', 'Mathaii', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(296, 0, 0, 1, '', 'Mathaii S/M', '1', 'Transbionics', 'Ruiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(297, 0, 0, 1, '', 'Mathaii S/M', '1', 'Pambazuko', 'CBD', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(298, 0, 0, 1, '', 'Matuu Highway', '1', 'Vibs Eastern', 'Matuu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(299, 0, 0, 1, '', 'Meetmegha Keroka', '2', 'Cinderella', 'Keroka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(300, 0, 0, 1, '', 'Mega Wholesellers', '2', 'Cinderella', 'Eastleigh', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(301, 0, 0, 1, '', 'Melosa', '2', 'Vibs Eastern', 'Tala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(302, 0, 0, 1, '', 'Mhindi Meusi  Mukuru', '1', 'Vibs', 'Mukuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(303, 0, 0, 1, '', 'Mhindi Meusi  Pipeline', '1', 'Vibs', 'Pipeline', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(304, 0, 0, 1, '', 'Millan Shah', '1', 'Transbionics', 'Meru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(305, 0, 0, 1, '', 'Mkulima Wangige', '1', 'Pambazuko', 'Wangige', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(306, 0, 0, 1, '', 'Moi\'s Bridge', '1', 'Eldovasco', 'Moi\'s Bridge', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(307, 0, 0, 1, '', 'Monasussy', '2', 'Stonerise', 'Nyahururu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(308, 0, 0, 1, '', 'Moran Kilgoris', '2', 'Cinderella', 'Kilgoris', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(309, 0, 0, 1, '', 'Morning Star', '2', 'Vibs', 'Pipeline', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(310, 0, 0, 1, '', 'Mueru Canaan', '2', 'Vibs', 'Dandora', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(311, 0, 0, 1, '', 'Mulleys ', '1', 'Vibs Eastern', 'Emaili', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(312, 0, 0, 1, '', 'Mulleys ', '1', 'Vibs Eastern', 'Kitui', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(313, 0, 0, 1, '', 'Mulleys Express', '1', 'Vibs Eastern', 'Machakos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(314, 0, 0, 1, '', 'Mulleys Highway Mlolongo', '1', 'Vibs Eastern', 'Mlolongo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(315, 0, 0, 1, '', 'Mulleys Masaa', '1', 'Vibs Eastern', 'Machakos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(316, 0, 0, 1, '', 'Mulleys Mtaani Mlolongo', '1', 'Vibs Eastern', 'Mlolongo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(317, 0, 0, 1, '', 'Mulleys Pioneer', '1', 'Vibs Eastern', 'Machakos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(318, 0, 0, 1, '', 'Mulleys Tala', '1', 'Vibs Eastern', 'Tala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(319, 0, 0, 1, '', 'Mulleys W/sale', '1', 'Vibs Eastern', 'Milele', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(320, 0, 0, 1, '', 'Mumias Beauty', '2', 'Nyanza Cosmix', 'Mumias', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(321, 0, 0, 1, '', 'Muoroto', '1', 'Pambazuko', 'Githinguri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(322, 0, 0, 1, '', 'Mwaga Tech', '2', 'Pambazuko', 'Limuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(323, 0, 0, 1, '', 'Mzalendo Supermaket', '2', 'Pambazuko', 'Wangige', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(324, 0, 0, 1, '', 'Nafuu 1', '2', 'Stonerise', 'Gilgil', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(325, 0, 0, 1, '', 'Nafuu 2', '2', 'Stonerise', 'Gilgil', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(326, 0, 0, 1, '', 'Nafuu Supermarket Mlolongo', '2', 'Pambazuko', 'Mlolongo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(327, 0, 0, 1, '', 'Naivas Nakuru', '1', 'Direct', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(328, 0, 0, 1, '', 'Naivas Embu', '1', 'Direct', 'Embu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(329, 0, 0, 1, '', 'Naivas Greenhouse', '1', 'Direct', 'Greenhouse', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(330, 0, 0, 1, '', 'Naivas Westlands', '1', 'Direct', 'Westlands', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(331, 0, 0, 1, '', 'Naivas Githurai', '2', 'Direct', 'Githurai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(332, 0, 0, 1, '', 'Naivas Nyeri', '1', 'Direct', 'Nyeri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(333, 0, 0, 1, '', 'Naivas 1', '1', 'Direct', 'Ronald Ngala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(334, 0, 0, 1, '', 'Naivas 2', '1', 'Direct', 'Ronald Ngala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(335, 0, 0, 1, '', 'Naivas Bamburi', '1', 'Direct', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(336, 0, 0, 1, '', 'Naivas Bungoma', '1', 'Direct', 'Bungoma', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(337, 0, 0, 1, '', 'Naivas Buruburu', '1', 'Direct', 'Buruburu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(338, 0, 0, 1, '', 'Naivas Ciata', '1', 'Direct', 'Ciata', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(339, 0, 0, 1, '', 'Naivas Downtown', '1', 'Direct', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(340, 0, 0, 1, '', 'Naivas Eastgate', '1', 'Direct', 'Umoja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(341, 0, 0, 1, '', 'Naivas Eldoret', '1', 'Direct', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(342, 0, 0, 1, '', 'Naivas Gateway', '1', 'Direct', 'Mombasa Rd', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(343, 0, 0, 1, '', 'Naivas Utawala', '1', 'Direct', 'Utawala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(344, 0, 0, 1, '', 'Naivas Hazina', '1', 'Direct', 'South B', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `dxcr2_outlets` (`id`, `asset_id`, `ordering`, `state`, `account`, `shop_name`, `category`, `region`, `location`, `manager_name`, `manager_phone`, `manager_email`, `gmap`, `user_id`, `submitter`, `last_sync_date`, `date_created`, `modified_by`, `created_by`, `checked_out`, `checked_out_time`) VALUES
(345, 0, 0, 1, '', 'Naivas Kapsabet', '1', 'Direct', 'Kapsabet', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(346, 0, 0, 1, '', 'Naivas Kasarani', '1', 'Direct', 'Kasarani', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(347, 0, 0, 1, '', 'Naivas Riruta', '1', 'Direct', 'Kawagware', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(348, 0, 0, 1, '', 'Naivas Kisii', '1', 'Direct', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(349, 0, 0, 1, '', 'Naivas Kitengela', '1', 'Direct', 'Kitengela', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(350, 0, 0, 1, '', 'Naivas Kitui', '1', 'Direct', 'Kitui', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(351, 0, 0, 1, '', 'Naivas Komarock', '1', 'Direct', 'Komarock', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(352, 0, 0, 1, '', 'Naivas Kubwa', '1', 'Direct', 'Naivasha', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(353, 0, 0, 1, '', 'Naivas Limuru', '1', 'Direct', 'Limuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(354, 0, 0, 1, '', 'Naivas Main Machakos', '1', 'Direct', 'Machakos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(355, 0, 0, 1, '', 'Naivas Mountain Mall', '1', 'Direct', 'Thika Rd', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(356, 0, 0, 1, '', 'Naivas Narok', '1', 'Direct', 'Narok', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(357, 0, 0, 1, '', 'Naivas Ndogo', '1', 'Direct', 'Naivasha', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(358, 0, 0, 1, '', 'Naivas Ngong', '1', 'Direct', 'Ngong', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(359, 0, 0, 1, '', 'Naivas Ruaraka', '1', 'Direct', 'Ruaraka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(360, 0, 0, 1, '', 'Naivas Sokoni', '1', 'Direct', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(361, 0, 0, 1, '', 'Naivas Super Center Machakos', '1', 'Direct', 'Machakos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(362, 0, 0, 1, '', 'Naivas Thika', '1', 'Direct', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(363, 0, 0, 1, '', 'Naivas Ukunda', '1', 'Direct', 'Ukunda', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(364, 0, 0, 1, '', 'Naivas Umoja', '2', 'Direct', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(365, 0, 0, 1, '', 'Naivas Vet', '1', 'Direct', 'Vet', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(366, 0, 0, 1, '', 'Naivasha Cosmetics', '2', 'Stonerise', 'Naivasha', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(367, 0, 0, 1, '', 'Naks Corner', '2', 'Vibs', 'Kayole', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(368, 0, 0, 1, '', 'Naks Kangemi', '2', 'Pambazuko', 'Kangemi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(369, 0, 0, 1, '', 'Naks Pipeline', '2', 'Vibs', 'Pipeline', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(370, 0, 0, 1, '', 'Naks Soweto', '2', 'Vibs', 'Kayole', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(371, 0, 0, 1, '', 'Naks Tassia', '2', 'Vibs', 'Tassia', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(372, 0, 0, 1, '', 'Nakumatt - Thika', '1', 'Direct', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(373, 0, 0, 1, '', 'Nakumatt Bungoma', '1', 'Direct', 'Bungoma', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(374, 0, 0, 1, '', 'Nakumatt City', '1', 'Direct', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(375, 0, 0, 1, '', 'Nakumatt Diani', '1', 'Direct', 'Diani', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(376, 0, 0, 1, '', 'Nakumatt Eldo Centre', '1', 'Direct', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(377, 0, 0, 1, '', 'Nakumatt Emali', '1', 'Direct', 'Emali', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(378, 0, 0, 1, '', 'Nakumatt Embakasi', '1', 'Direct', 'Embakasi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(379, 0, 0, 1, '', 'Nakumatt Galleria', '1', 'Direct', 'Karen', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(380, 0, 0, 1, '', 'Nakumatt Garden City', '1', 'Direct', 'Thika Rd', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(381, 0, 0, 1, '', 'Nakumatt Household', '1', 'Direct', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(382, 0, 0, 1, '', 'Nakumatt Kakamega', '1', 'Direct', 'Kakamega', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(383, 0, 0, 1, '', 'Nakumatt Karen', '1', 'Direct', 'Karen', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(384, 0, 0, 1, '', 'Nakumatt Kericho', '1', 'Direct', 'Kericho', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(385, 0, 0, 1, '', 'Nakumatt Kisii', '1', 'Direct', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(386, 0, 0, 1, '', 'Nakumatt Kitale', '1', 'Direct', 'Kitale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(387, 0, 0, 1, '', 'Nakumatt Likoni', '1', 'Direct', 'Likoni', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(388, 0, 0, 1, '', 'Nakumatt Meru', '1', 'Direct', 'Meru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(389, 0, 0, 1, '', 'Nakumatt Midtown', '1', 'Direct', 'Kakamega', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(390, 0, 0, 1, '', 'Nakumatt Nakuru', '1', 'Direct', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(391, 0, 0, 1, '', 'Nakumatt Nyanza', '1', 'Direct', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(392, 0, 0, 1, '', 'Nakumatt Shujaa', '1', 'Direct', 'Kayole', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(393, 0, 0, 1, '', 'Nakuru Cosmetics 1', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(394, 0, 0, 1, '', 'Nakuru Cosmetics 2', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(395, 0, 0, 1, '', 'Nawal Cosmetics', '2', 'Sawand', 'Marikiti', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(396, 0, 0, 1, '', 'Nbb Thika', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(397, 0, 0, 1, '', 'Ndungi 1', '2', 'Stonerise', 'Naivasha', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(398, 0, 0, 1, '', 'Ndungi 2', '2', 'Stonerise', 'Naivasha', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(399, 0, 0, 1, '', 'Neema', '2', 'Cinderella', 'Keroka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(400, 0, 0, 1, '', 'Neema Mart', '2', 'Eldovaso', 'Soi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(401, 0, 0, 1, '', 'New Discount', '1', 'Eldovasco', 'Webuye', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(402, 0, 0, 1, '', 'New Fancy Chewele', '1', 'Eldovasco', 'Chwele', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(403, 0, 0, 1, '', 'New Generations', '1', 'Sawand', 'Voi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(404, 0, 0, 1, '', 'New Vision', '1', 'Sawand', 'Voi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(405, 0, 0, 1, '', 'Ngooni Hyper', '1', 'Vibs Eastern', 'Wote', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(406, 0, 0, 1, '', 'Northview1', '1', 'Vibs', 'Huruma', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(407, 0, 0, 1, '', 'Nyakodero Rongo /Products Chamber', '1', 'Cinderella', 'Rongo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(408, 0, 0, 1, '', 'Olkalau Traders', '2', 'Stonerise', 'Olkalau', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(409, 0, 0, 1, '', 'Oshwal', '2', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(410, 0, 0, 1, '', 'Ottmatt Kamulu', '1', 'Vibs', 'Kamulu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(411, 0, 0, 1, '', 'Oyugis Supermarket', '1', 'Cinderella', 'Oyugis', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(412, 0, 0, 1, '', 'Pamela Cosmetics', '2', 'Cinderella', 'Migori', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(413, 0, 0, 1, '', 'Paradise Cosmetics', '2', 'Sawand', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(414, 0, 0, 1, '', 'Paradise Mwembe', '2', 'Sawand', 'Marikiti', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(415, 0, 0, 1, '', 'Parkmatt', '2', 'Cinderella', 'Kericho', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(416, 0, 0, 1, '', 'Patmatt', '2', 'Pambazuko', 'Umoja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(417, 0, 0, 1, '', 'Pawa Juja', '2', 'Vibs', 'Juja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(418, 0, 0, 1, '', 'Pbk Cosmetic', '2', 'Pambazuko', 'Kawagware', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(419, 0, 0, 1, '', 'Pbk Main', '2', 'Pambazuko', 'Kawagware', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(420, 0, 0, 1, '', 'Pbk Nonic', '2', 'Pambazuko', 'Kawagware', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(421, 0, 0, 1, '', 'Perfect Choice', '2', 'Sawand', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(422, 0, 0, 1, '', 'Perfect Fatuma', '2', 'Sawand', 'Marikiti', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(423, 0, 0, 1, '', 'Pewani', '2', 'Vibs Eastern', 'Machakos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(424, 0, 0, 1, '', 'Pewani Sokoni', '2', 'Vibs Eastern', 'Machakos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(425, 0, 0, 1, '', 'Planet S/M', '2', 'Transbionics', 'Kangeta', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(426, 0, 0, 1, '', 'Popular S/M', '2', 'Transbionics', 'Naru Moru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(427, 0, 0, 1, '', 'Powerstar Express', '1', 'Vibs', 'Zimmerman', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(428, 0, 0, 1, '', 'Powerstar Hyper', '1', 'Vibs', 'Githuri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(429, 0, 0, 1, '', 'Powerstar Hyper Ruiru', '1', 'Vibs', 'Ruiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(430, 0, 0, 1, '', 'Powerstar Jambo', '1', 'Vibs', 'Ruiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(431, 0, 0, 1, '', 'Powerstar Mini', '1', 'Vibs', 'Ruiru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(432, 0, 0, 1, '', 'Powerstar Supermarket Kitengela', '1', 'Vibs', 'Kitengela', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(433, 0, 0, 1, '', 'Powerstar Zimma', '1', 'Vibs', 'Zimmerman', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(434, 0, 0, 1, '', 'Powerstar,Kangare', '1', 'Vibs', 'Kangare', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(435, 0, 0, 1, '', 'Powerster Kasarani', '1', 'Vibs', 'Kasarani', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(436, 0, 0, 1, '', 'Powerster Kikuyu', '1', 'Vibs', 'Kikuyu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(437, 0, 0, 1, '', 'Prizeworthy Juja', '1', 'Vibs', 'Juja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(438, 0, 0, 1, '', 'Quick Matt Shabab', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(439, 0, 0, 1, '', 'Quickmart Ruaka', '1', 'Vibs', 'Ruaka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(440, 0, 0, 1, '', 'Quickmart Town', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(441, 0, 0, 1, '', 'Quickmatt Kiambu Rd', '1', 'Vibs', 'Kiambu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(442, 0, 0, 1, '', 'Quickmatt Ruai', '1', 'Vibs', 'Ruai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(443, 0, 0, 1, '', 'Quikmart Kahawa', '1', 'Vibs', 'Kahawa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(444, 0, 0, 1, '', 'Radiant', '2', 'Cinderella', 'Bomet', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(445, 0, 0, 1, '', 'Rangers', '2', 'Vibs', 'Kahawa Sukari', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(446, 0, 0, 1, '', 'Raymatt Supermarket', '1', 'Cinderella', 'Homabay-', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(447, 0, 0, 1, '', 'Reenas Beauty Parlor', '2', 'Vibs Eastern', 'Kitui', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(448, 0, 0, 1, '', 'Reliance', '1', 'Eldovasco', 'Moi University', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(449, 0, 0, 1, '', 'Reliance', '2', 'Eldovaso', 'Moi University', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(450, 0, 0, 1, '', 'Rihab Matt', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(451, 0, 0, 1, '', 'Rikana', '1', 'Vibs', 'Eastlands', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(452, 0, 0, 1, '', 'Rivanas Kanu Street', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(453, 0, 0, 1, '', 'Rivanas Racecourse', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(454, 0, 0, 1, '', 'Rivanas Shabab', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(455, 0, 0, 1, '', 'River Side', '2', 'Stonerise', 'Njambini', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(456, 0, 0, 1, '', 'Riziki Kimilili', '1', 'Eldovasco', 'Kimilili', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(457, 0, 0, 1, '', 'Road Map', '2', 'Eldovasco', 'Map', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(458, 0, 0, 1, '', 'Rongai S/M', '1', 'Vibs', 'Githunguri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(459, 0, 0, 1, '', 'Rosekam', '', 'Transbionics', 'Laare', '', '', '', '', 0, 0, '', '2018-02-09 02:36:04', 0, 0, 0, '0000-00-00 00:00:00'),
(460, 0, 0, 1, '', 'Royal Mart', '2', 'Eldovasco', 'Moi\'s Bridge', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(461, 0, 0, 1, '', 'Royalmatt Supermarket', '2', 'Vibs', 'Zimmerman', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(462, 0, 0, 1, '', 'Rudikellys', '2', 'Nyanza Cosmix', 'Kisumu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(463, 0, 0, 1, '', 'Sairam', '1', 'Nyanza Cosmix', 'Mbale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(464, 0, 0, 1, '', 'Sairam', '1', 'Nyanza Cosmix', 'Lunda', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(465, 0, 0, 1, '', 'Sairam', '1', 'Nyanza Cosmix', 'Ungunja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(466, 0, 0, 1, '', 'Sairam Rongo', '1', 'Cinderella', 'Rongo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(467, 0, 0, 1, '', 'Sakina Cosmetic', '2', 'Pambazuko', 'Rongai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(468, 0, 0, 1, '', 'Saltes Embakasi', '1', 'Pambazuko', 'Embakasi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(469, 0, 0, 1, '', 'Saltes Kiserian', '1', 'Pambazuko', 'Kiserian', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(470, 0, 0, 1, '', 'Saltes Supermarket Kitengelea', '1', 'Pambazuko', 'Kitengelea', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(471, 0, 0, 1, '', 'Saltes Umoja', '1', 'Pambazuko', 'Umoja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(472, 0, 0, 1, '', 'Samart', '1', 'Transbionics', 'Nyeri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(473, 0, 0, 1, '', 'Samrat Ukunda', '1', 'Sawand', 'Ukunda', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(474, 0, 0, 1, '', 'Save-a-Coin', '2', 'Pambazuko', 'Limuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(475, 0, 0, 1, '', 'Savematt', '2', 'Pambazuko', 'Hulingam', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(476, 0, 0, 1, '', 'Self Selection, Kithimani(Once A Month)', '2', 'Vibs Eastern', 'Kithimani', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(477, 0, 0, 1, '', 'Selfridges Express', '1', 'Pambazuko', 'Kikuyu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(478, 0, 0, 1, '', 'Selfridges Pioneer', '1', 'Pambazuko', 'Kikuyu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(479, 0, 0, 1, '', 'Selfridges Pioneer', '1', 'Pambazuko', 'Wangige', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(480, 0, 0, 1, '', 'Sharp Cosmetics', '2', 'Stonerise', 'Molo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(481, 0, 0, 1, '', 'Shashkant', '2', 'Sawand', 'Voi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(482, 0, 0, 1, '', 'Shirikisho Sm', '2', 'Stonerise', 'Nyahururu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(483, 0, 0, 1, '', 'Shivam', '1', 'Cinderella', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(484, 0, 0, 1, '', 'Shivling Awendo- Awendo Town', '1', 'Cinderella', 'Awendo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(485, 0, 0, 1, '', 'Shivling Homabay-', '1', 'Cinderella', 'Homabay-', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(486, 0, 0, 1, '', 'Shivling Kisii', '1', 'Cinderella', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(487, 0, 0, 1, '', 'Shivling Main- Migori Town', '1', 'Cinderella', 'Migori', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(488, 0, 0, 1, '', 'Shivling nyamira', '1', 'Cinderella', 'nyamira', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(489, 0, 0, 1, '', 'Shivling Oyugis', '1', 'Cinderella', 'Oyugis', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(490, 0, 0, 1, '', 'Shivling Stage- Migori Town', '1', 'Cinderella', 'Migori', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(491, 0, 0, 1, '', 'Shivlings Keroka', '1', 'Cinderella', 'Keroka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(492, 0, 0, 1, '', 'Shoppers 1 &2', '1', 'Cinderella', 'Nyamira', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(493, 0, 0, 1, '', 'Shoppers 1 &3', '1', 'Cinderella', 'Keroka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(494, 0, 0, 1, '', 'Siaya Self', '1', 'Nyanza Cosmix', 'Siaya', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(495, 0, 0, 1, '', 'Silmart Kagio', '2', 'Transbionics', 'Kagio', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(496, 0, 0, 1, '', 'Sinende Bomet', '2', 'Cinderella', 'Bomet', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(497, 0, 0, 1, '', 'Skymatt 1', '1', 'Pambazuko', 'Umoja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(498, 0, 0, 1, '', 'Skymatt 2', '2', 'Vibs', 'Tena', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(499, 0, 0, 1, '', 'Slopes S/M', '2', 'Transbionics', 'Nyeri', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(500, 0, 0, 1, '', 'Smart Price Supermarket Mlolongo', '2', 'Pambazuko', 'Mlolongo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(501, 0, 0, 1, '', 'Smarthome', '1', 'Pambazuko', 'Kiambu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(502, 0, 0, 1, '', 'Society Store', '1', 'Transbionics', 'Meru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(503, 0, 0, 1, '', 'Society Store', '1', 'Pambazuko', 'Limuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(504, 0, 0, 1, '', 'Society Store', '1', 'Stonerise', 'Naivasha', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(505, 0, 0, 1, '', 'Society Stores', '1', 'Transbionics', 'Maua', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(506, 0, 0, 1, '', 'Society Stores Kayole', '1', 'Vibs', 'Kayole', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(507, 0, 0, 1, '', 'Society Stores Thika', '1', 'Transbionics', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(508, 0, 0, 1, '', 'Soi General', '2', 'Eldovasco', 'Kabaranet', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(509, 0, 0, 1, '', 'Soi Stage', '2', 'Eldovasco', 'Kabaranet', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(510, 0, 0, 1, '', 'Sotik Central', '2', 'Cinderella', 'Sotick', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(511, 0, 0, 1, '', 'SP Visram', '2', 'Cinderella', 'Kisii', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(512, 0, 0, 1, '', 'Spear S/M', '1', 'Stonerise', 'Nyahururu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(513, 0, 0, 1, '', 'Spear Sm ', '1', 'Stonerise', 'Nyahururu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(514, 0, 0, 1, '', 'Spear Sm ', '1', 'Stonerise', 'Nyahururu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(515, 0, 0, 1, '', 'Spear Sm ', '1', 'Stonerise', 'Gilgil', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(516, 0, 0, 1, '', 'Spear Sm ', '1', 'Stonerise', 'Nyanyuki', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(517, 0, 0, 1, '', 'Spear Sm 1', '1', 'Stonerise', 'Nyahururu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(518, 0, 0, 1, '', 'Stagematt Chap Chap', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(519, 0, 0, 1, '', 'Stagematt Corner', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(520, 0, 0, 1, '', 'Stagematt Pekars', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(521, 0, 0, 1, '', 'Stanmart Soko Githu 45', '1', 'Vibs', 'Githu 45', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(522, 0, 0, 1, '', 'Sterling Cosmetics', '1', 'Pambazuko', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(523, 0, 0, 1, '', 'Stewel', '2', 'Vibs', 'Umoja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(524, 0, 0, 1, '', 'Subiri Supermarket', '1', 'Eldovasco', 'Kimilili', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(525, 0, 0, 1, '', 'Sulami Makandara Athi River', '2', 'Vibs Eastern', 'Athi River', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(526, 0, 0, 1, '', 'Sulami Nyambura Athi River', '2', 'Vibs Eastern', 'Athi River', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(527, 0, 0, 1, '', 'Sumkam Njoro', '1', 'Stonerise', 'Njoro', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(528, 0, 0, 1, '', 'Sumkam Shabab', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(529, 0, 0, 1, '', 'Summit Beauty', '2', 'Eldovaso', 'Kitale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(530, 0, 0, 1, '', 'Sunkar Supermarket', '1', 'Vibs Eastern', 'Supermarket', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(531, 0, 0, 1, '', 'Suntec Sm', '2', 'Eldovasco', 'Kapenguria', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(532, 0, 0, 1, '', 'Suntec Supermarket', '2', 'Vibs Eastern', 'Kitui', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(533, 0, 0, 1, '', 'Super Cosmetic', '2', 'Pambazuko', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(534, 0, 0, 1, '', 'Super Cosmetics', '2', 'Sawand', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(535, 0, 0, 1, '', 'Super Cosmetics(Blueroom)', '2', 'Sawand', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(536, 0, 0, 1, '', 'Super Cosmetis Marikiti', '2', 'Sawand', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(537, 0, 0, 1, '', 'Super Duper', '2', 'Pambazuko', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(538, 0, 0, 1, '', 'Supercosmetics Nyali', '2', 'Sawand', 'Nyali', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(539, 0, 0, 1, '', 'Sweater Kilgoris', '1', 'Cinderella', 'Kilgoris', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(540, 0, 0, 1, '', 'Sweetworld Kikuyu', '1', 'Pambazuko', 'Kikuyu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(541, 0, 0, 1, '', 'Sweetworld Kiserian', '1', 'Pambazuko', 'Kiserian', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(542, 0, 0, 1, '', 'Sweetworld Ngong', '1', 'Pambazuko', 'Ngong', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(543, 0, 0, 1, '', 'Taito', '2', 'Nyanza Cosmix', 'Nandi Hills', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(544, 0, 0, 1, '', 'Tamu Rongo               /Maganda', '2', 'Cinderella', 'Rongo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(545, 0, 0, 1, '', 'Target Supermarket', '1', 'Vibs Eastern', 'Mwingi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(546, 0, 0, 1, '', 'Tesia  Junction', '1', 'Nyanza Cosmix', 'Busia', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(547, 0, 0, 1, '', 'Tesia Candy', '1', 'Nyanza Cosmix', 'Kandui', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(548, 0, 0, 1, '', 'Tesia Malaba', '1', 'Nyanza Cosmix', 'Malaba', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(549, 0, 0, 1, '', 'Thesis', '2', 'Vibs Eastern', 'Machakos', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(550, 0, 0, 1, '', 'Tigermatt', '1', 'Pambazuko', 'Kiambu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(551, 0, 0, 1, '', 'TOP LADY - THIKA', '2', 'Transbionics', 'THIKA', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(552, 0, 0, 1, '', 'Tradena', '2', 'Transbionics', 'Maua', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(553, 0, 0, 1, '', 'Transmara', '1', 'Cinderella', 'Kilgoris', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(554, 0, 0, 1, '', 'Transmatt East', '1', 'Eldovasco', 'Kitale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(555, 0, 0, 1, '', 'Transmatt Eldoret', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(556, 0, 0, 1, '', 'TuaskyGreenspan', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(557, 0, 0, 1, '', 'Tuksys Hakati', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(558, 0, 0, 1, '', 'Tuksys|Tmall', '1', 'Direct', 'Langata', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(559, 0, 0, 1, '', 'Tumaini Donholm', '1', 'Vibs', 'Donholm', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(560, 0, 0, 1, '', 'Tumaini Fedha', '1', 'Vibs', 'Fedha', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(561, 0, 0, 1, '', 'Tumaini Kondele', '1', 'Nyanza Cosmix', 'Kondele', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(562, 0, 0, 1, '', 'Tumaini Mayfair', '1', 'Nyanza Cosmix', 'Mayfair', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(563, 0, 0, 1, '', 'Tumaini Outering', '1', 'Vibs', 'Outering', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(564, 0, 0, 1, '', 'Tumaini Pipeline', '1', 'Vibs', 'Pipeline', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(565, 0, 0, 1, '', 'Tumaini Rongai', '1', 'Vibs', 'Rongai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(566, 0, 0, 1, '', 'Tumaini Utawala', '1', 'Vibs', 'Utawala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(567, 0, 0, 1, '', 'Turbo', '2', 'Eldovasco', 'Turbo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(568, 0, 0, 1, '', 'Tusks Imara', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(569, 0, 0, 1, '', 'Tusks Milele', '1', 'Direct', 'Ngong', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(570, 0, 0, 1, '', 'Tuskyd Bandari', '2', 'Direct', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(571, 0, 0, 1, '', 'Tuskys Adams', '3', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:40:47', 0, 0, 0, '0000-00-00 00:00:00'),
(572, 0, 0, 1, '', 'Tuskys Bandari', '1', 'Direct', 'Bandari', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(573, 0, 0, 1, '', 'Tuskys Bebabeba', '1', 'Direct', 'Bebabeba', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(574, 0, 0, 1, '', 'Tuskys Buffallo Mall', '1', 'Direct', 'Mall', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(575, 0, 0, 1, '', 'Tuskys Buruburu', '1', 'Direct', 'Buruburu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(576, 0, 0, 1, '', 'Tuskys Chania-Thika', '1', 'Direct', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(577, 0, 0, 1, '', 'Tuskys Chap ChapCBD', '3', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:40:47', 0, 0, 0, '0000-00-00 00:00:00'),
(578, 0, 0, 1, '', 'Tuskys ChapChap', '3', 'Direct', 'Thika', '', '', '', '', 0, 0, '', '2018-02-09 02:40:47', 0, 0, 0, '0000-00-00 00:00:00'),
(579, 0, 0, 1, '', 'Tuskys Chigware', '1', 'Direct', 'Chigware', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(580, 0, 0, 1, '', 'Tuskys Digo', '2', 'Direct', 'Digo', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(581, 0, 0, 1, '', 'Tuskys Embakasi', '1', 'Direct', 'Embakasi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(582, 0, 0, 1, '', 'Tuskys Hakati', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(583, 0, 0, 1, '', 'Tuskys Hyrax', '1', 'Direct', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(584, 0, 0, 1, '', 'Tuskys Imara', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(585, 0, 0, 1, '', 'Tuskys Jirani', '1', 'Direct', 'Ruai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(586, 0, 0, 1, '', 'Tuskys Juja', '1', 'Direct', 'Juja', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(587, 0, 0, 1, '', 'Tuskys Kilifi', '1', 'Direct', 'Kilifi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(588, 0, 0, 1, '', 'Tuskys Kitale', '1', 'Direct', 'Kitale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(589, 0, 0, 1, '', 'Tuskys Kmall', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(590, 0, 0, 1, '', 'Tuskys Libra', '3', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:40:47', 0, 0, 0, '0000-00-00 00:00:00'),
(591, 0, 0, 1, '', 'Tuskys Lunga', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(592, 0, 0, 1, '', 'Tuskys Magic', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(593, 0, 0, 1, '', 'Tuskys Mall', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(594, 0, 0, 1, '', 'Tuskys Mid Town', '1', 'Direct', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(595, 0, 0, 1, '', 'Tuskys Milele', '1', 'Direct', 'Milele', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(596, 0, 0, 1, '', 'Tuskys Mtwapa 1', '1', 'Direct', 'Mtwapa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(597, 0, 0, 1, '', 'Tuskys Mtwapa 2', '1', 'Direct', 'Mtwapa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(598, 0, 0, 1, '', 'Tuskys Ndonyo Kericho', '1', 'Direct', 'Kericho', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(599, 0, 0, 1, '', 'Tuskys Otc', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(600, 0, 0, 1, '', 'Tuskys Pioneer', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(601, 0, 0, 1, '', 'Tuskys Road A', '3', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:40:47', 0, 0, 0, '0000-00-00 00:00:00'),
(602, 0, 0, 1, '', 'Tuskys Rongai', '1', 'Direct', 'Rongai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(603, 0, 0, 1, '', 'Tuskys Ruaka', '2', 'Direct', 'Ruaka', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(604, 0, 0, 1, '', 'Tuskys Shilloa', '1', 'Direct', 'Shilloa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(605, 0, 0, 1, '', 'Tuskys Stadium', '1', 'Direct', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(606, 0, 0, 1, '', 'Tuskys Tmall', '1', 'Direct', 'Tmall', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(607, 0, 0, 1, '', 'Tuskys Wareng', '1', 'Direct', 'Wareng', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(608, 0, 0, 1, '', 'Tuskys Zion', '1', 'Direct', 'Zion', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(609, 0, 0, 1, '', 'Twigamatt', '1', 'Pambazuko', 'Kiambu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(610, 0, 0, 1, '', 'Uchuuzi', '2', 'Eldovasco', 'Kabaranet', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(611, 0, 0, 1, '', 'Ukwala A', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(612, 0, 0, 1, '', 'Ukwala B', '1', 'Eldovasco', 'Eldoret', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(613, 0, 0, 1, '', 'Ulay', '2', 'Sawand', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(614, 0, 0, 1, '', 'Ultimate A                   ', '1', 'Nyanza Cosmix', 'Luanda', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(615, 0, 0, 1, '', 'Ultimate B', '1', 'Nyanza Cosmix', 'Luanda', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(616, 0, 0, 1, '', 'Variety', '2', 'Eldovasco', 'Kitale', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(617, 0, 0, 1, '', 'Victory ', '2', 'Transbionics', 'Embu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(618, 0, 0, 1, '', 'Videya Supermarket', '2', 'Cinderella', 'Homabay-', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(619, 0, 0, 1, '', 'Vision Mart', '2', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(620, 0, 0, 1, '', 'Vision Matt Town', '2', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(621, 0, 0, 1, '', 'Visionmatt Free Area', '2', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(622, 0, 0, 1, '', 'Waicon Corner', '1', 'Vibs', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(623, 0, 0, 1, '', 'Waicon Main', '1', 'Vibs', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(624, 0, 0, 1, '', 'Waiyaki Way S/M', '1', 'Pambazuko', 'Kawangware', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(625, 0, 0, 1, '', 'Wakulima S/M', '1', 'Transbionics', 'Chogoria', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(626, 0, 0, 1, '', 'Wakulima S/M', '2', 'Pambazuko', 'Banana', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(627, 0, 0, 1, '', 'Wakulima S/M', '2', 'Pambazuko', 'Wangige', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(628, 0, 0, 1, '', 'Wakwitu Sm', '2', 'Vibs Eastern', 'Kibwezi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(629, 0, 0, 1, '', 'Walias', '2', 'Nyanza Cosmix', 'Kakamega', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(630, 0, 0, 1, '', 'Wamumbi Supermarket', '1', 'Eldovasco', 'Moi\'s Bridge', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(631, 0, 0, 1, '', 'Wimma', '2', 'Pambazuko', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(632, 0, 0, 1, '', 'Wiwa', '2', 'Stonerise', 'Nyahururu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(633, 0, 0, 1, '', 'Woodley S/M', '2', 'Pambazuko', 'Nairobi', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(634, 0, 0, 1, '', 'Woolmatt Central', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(635, 0, 0, 1, '', 'Woolmatt East', '1', 'Stonerise', 'Nakuru', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(636, 0, 0, 1, '', 'Yako Wholesale', '1', 'Nyanza Cosmix', 'Kakamega', '', '', '', '', 0, 0, '', '2018-02-09 02:39:58', 0, 0, 0, '0000-00-00 00:00:00'),
(637, 0, 0, 1, '', 'Yalamini', '2', 'Nyanza Cosmix', 'Yala', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(638, 0, 0, 1, '', 'Yellow Base', '2', 'Sawand', 'Kongowea', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(639, 0, 0, 1, '', 'Yourchoice Supermarket Athi River', '2', 'Vibs Eastern', 'Athi River', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(640, 0, 0, 1, '', 'Zuberi', '2', 'Sawand', 'Mombasa', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(641, 0, 0, 1, '', 'Wakulima Wamunyu', '2', 'Vibs Eastern', 'Wamnunyu', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(642, 0, 0, 1, '', 'Mumu', '2', 'Vibs Eastern', 'Wote', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(643, 0, 0, 1, '', 'Mwenetei', '2', 'Vibs Eastern', 'Salama', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(644, 0, 0, 1, '', 'Dilons', '2', 'Vibs Eastern', 'Ngoliba', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(645, 0, 0, 1, '', 'Jubilee', '2', 'Vibs Eastern', 'Kola', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(646, 0, 0, 1, '', 'K Choice ', '2', 'Pambazuko', 'Kawangware', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(647, 0, 0, 1, '', 'Destiny ', '2', 'Pambazuko', 'Kiserian', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00'),
(648, 0, 0, 1, '', 'Gravity', '2', 'Pambazuko', 'Rongai', '', '', '', '', 0, 0, '', '2018-02-09 02:39:18', 0, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_overrider`
--

CREATE TABLE `dxcr2_overrider` (
  `id` int(10) NOT NULL COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_perfect_checklist`
--

CREATE TABLE `dxcr2_perfect_checklist` (
  `id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `inputdate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_mml` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku_available` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchandising` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shelf_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `right_prices` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible_tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateformat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_perfect_checklist`
--

INSERT INTO `dxcr2_perfect_checklist` (`id`, `asset_id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `inputdate`, `client_id`, `shop_mml`, `sku_available`, `merchandising`, `shelf_quantity`, `right_prices`, `visible_tags`, `store_id`, `dateformat`) VALUES
(1, 82, 1, 1, 0, '0000-00-00 00:00:00', 542, 542, '9', '7', 'SKU', '1', '0', '7', '87', 'None', '1', '2018-02-07 23:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_photos`
--

CREATE TABLE `dxcr2_photos` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagepath` blob NOT NULL,
  `imagedate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brandcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `store` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_server_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_modified_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_sync_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_photos`
--

INSERT INTO `dxcr2_photos` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `client_id`, `imagepath`, `imagedate`, `manufacturer`, `brand`, `brandcode`, `submitter`, `user_id`, `store`, `store_id`, `store_server_id`, `remarks`, `created_on`, `coordinates`, `client_modified_date`, `first_insert_date`, `last_sync_date`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', 542, 542, '2', 0x3c703e3232793c2f703e, '2', '2', '2', '2', '542', 542, '1', '1', '1', '222', '2018-02-09 08:37:12', '', '2018-02-09 08:37:18', '2018-02-09 08:43:16', '');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_planner`
--

CREATE TABLE `dxcr2_planner` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `submitter` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `week` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `routeplan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `inputdate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_planner`
--

INSERT INTO `dxcr2_planner` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `submitter`, `user_id`, `week`, `month`, `year`, `routeplan`, `inputdate`, `coordinates`, `first_insert`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', 542, 542, 542, 542, '2', '4', '2018', '1', 'date', '098', '2018-02-05 19:52:51'),
(2, 2, 1, 542, '2018-02-07 17:18:11', 542, 542, 542, 542, '5', '2', '2018', '{\"routeplan1\":{\"day\":\"2018-02-12\",\"outlets\":[\"1\"]},\"routeplan2\":{\"day\":\"2018-02-13\",\"outlets\":[\"2\"]}}', '', '', '2018-02-07 17:18:11'),
(3, 3, -2, 0, '0000-00-00 00:00:00', 544, 544, 0, 0, '', '', '', '{\"routeplan1\":{\"day\":\"2018-02-08\",\"outlets\":[\"1\"]}}', '', '', '2018-02-08 09:02:48'),
(4, 4, 1, 0, '0000-00-00 00:00:00', 542, 542, 0, 544, '', '', '', '{\"routeplan1\":{\"day\":\"2018-02-12\",\"outlets\":[\"1\"]},\"routeplan2\":{\"day\":\"2018-02-13\",\"outlets\":[\"1\",\"2\"]},\"routeplan3\":{\"day\":\"2018-02-14\",\"outlets\":[\"4\"]},\"routeplan4\":{\"day\":\"2018-02-12\",\"outlets\":[\"4\"]},\"routeplan5\":{\"day\":\"2018-02-15\",\"outlets\":[\"5\"]},\"routeplan6\":{\"day\":\"2018-02-16\"}}', '', '', '0000-00-00 00:00:00'),
(5, 5, 1, 0, '0000-00-00 00:00:00', 542, 542, 0, 544, '', '', '', '{\"routeplan0\":{\"day\":\"2018-02-08\",\"outlets\":[\"1\"]}}', '', '', '2018-02-08 09:02:37'),
(6, 6, 1, 0, '0000-00-00 00:00:00', 544, 544, 0, 0, '', '', '', '{\"routeplan1\":{\"day\":\"2018-02-12\",\"outlets\":[\"3\",\"4\"]}}', '', '', '0000-00-00 00:00:00'),
(7, 7, 1, 0, '0000-00-00 00:00:00', 544, 544, 0, 0, '', '', '', '{\"routeplan1\":{\"day\":\"2018-02-12\",\"outlets\":[\"2\"]}}', '', '', '0000-00-00 00:00:00'),
(8, 8, 1, 0, '0000-00-00 00:00:00', 543, 543, 0, 544, '', '', '', '{\"routeplan1\":{\"day\":\"2018-02-12\",\"outlets\":[\"1\",\"7\"]},\"routeplan2\":{\"day\":\"2018-02-13\",\"outlets\":[\"12\",\"18\"]}}', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_postinstall_messages`
--

CREATE TABLE `dxcr2_postinstall_messages` (
  `postinstall_message_id` bigint(20) UNSIGNED NOT NULL,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_postinstall_messages`
--

INSERT INTO `dxcr2_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
(3, 700, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1),
(4, 700, 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', 1, 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', 1),
(5, 700, 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_TITLE', 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/joomla40checks.php', 'admin_postinstall_joomla40checks_condition', '3.7.0', 1),
(6, 700, 'TPL_HATHOR_MESSAGE_POSTINSTALL_TITLE', 'TPL_HATHOR_MESSAGE_POSTINSTALL_BODY', 'TPL_HATHOR_MESSAGE_POSTINSTALL_ACTION', 'tpl_hathor', 1, 'action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_condition', '3.7.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_products`
--

CREATE TABLE `dxcr2_products` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_classification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_uom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_cases` int(11) NOT NULL,
  `published` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `must_have` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_on` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_products`
--

INSERT INTO `dxcr2_products` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `product_code`, `product_name`, `category`, `product_classification`, `product_type`, `product_uom`, `product_price`, `product_size`, `product_cases`, `published`, `must_have`, `deleted`, `created_on`, `modified_on`) VALUES
(1, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E001', 'N&L COCO/B Lot  600ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(2, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E002', 'N&L COCO/B Lot  400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(3, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E003', 'N&L COCO/B Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(4, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E004', 'N&L AVOCADO Lot 600ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(5, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E005', 'N&L AVOCADO Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '1', '0', '2018-02-07 21:39:54', '2017-12-19 23:34:34'),
(6, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E006', 'N&L AVOCADO Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(7, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E007', 'N&L GLYCERINE Lot  600ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(8, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E008', 'N&L GLYCERINE  Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(9, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E009', 'N&L GLYCERINE Lot  200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(10, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0010', 'N&L ALOEVERA Lot 600ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '1', '0', '2018-02-07 21:39:54', '2017-12-19 23:34:37'),
(11, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0011', 'N&L ALOEVERA Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(12, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0012', 'N&L ALOEVERA Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(13, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0013', 'N&L BODY MILK Lot 600ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(14, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0014', 'N&L BODY MILK Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(15, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0015', 'N&L BODY MILK Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '1', '0', '2018-02-07 21:39:54', '2017-12-19 23:34:40'),
(16, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0016', 'N&L LOVELY LAN Lot 600ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(17, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0017', 'N&L LOVELY LAN Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(18, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0018', 'N&L LOVELY LAN Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(19, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0019', 'N&L CARROT Lot 600ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0020', 'N&L CARROT Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '1', '0', '2018-02-07 21:39:54', '2017-12-19 23:34:43'),
(21, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0021', 'N&L CARROT Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(22, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0022', 'D&L LOVELY CRÈME 6 Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(23, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0023', 'D&L LOVELY CRÈME 6 Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(24, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0024', 'VERS COOL Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(25, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0025', 'VERS COOL Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '1', '0', '2018-02-07 21:39:54', '2017-12-19 23:34:45'),
(26, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0026', 'VERS COOL Lot 100ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(27, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0027', 'VERS LUX Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(28, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0028', 'VERS LUX Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(29, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0029', 'VERS LUX Lot 100ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(30, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0030', 'VERS SPORTY Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(31, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0031', 'VERS SPORTY Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(32, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0032', 'VERS SPORTY Lot 100ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(33, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0033', 'VERS TRENDY Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(34, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0034', 'VERS TRENDY Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(35, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0035', 'VERS TRENDY Lot 100ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(36, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0036', 'VERS CLASSIC Lot 400ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(37, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0037', 'VERS CLASSIC Lot 200ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(38, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0038', 'VERS CLASSIC Lot 100ML', 'Lotion', 'Lotion', 'Lotion', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(39, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0039', 'N&L PERF/P Jelly 500GMS', 'Jelly', 'Jelly', 'Jelly', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(40, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0040', 'N&L PERF/P Jelly250GMS', 'Jelly', 'Jelly', 'Jelly', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(41, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0041', 'N&L PERF/P Jelly 100GMS', 'Jelly', 'Jelly', 'Jelly', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(42, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0042', 'N&L PERF/B Jelly 500GMS', 'Jelly', 'Jelly', 'Jelly', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(43, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0043', 'N&L PERF/B Jelly 250GMS', 'Jelly', 'Jelly', 'Jelly', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(44, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0044', 'N&L PERF/B Jelly 100GMS', 'Jelly', 'Jelly', 'Jelly', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(45, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0045', 'N&L PURE GL 110ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(46, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0046', 'N&L PURE GL 65ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(47, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0047', 'N&L PURE GL 40ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(48, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0048', 'N&L PERF GL 110ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(49, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0049', 'N&L PERF GL 65ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(50, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0050', 'N&L PERF GL 40ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(51, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0051', 'N&L ALOE VERA GL 110ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(52, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0052', 'N&L ALOE VERA GL 65ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(53, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0053', 'N&L ALOE VERA GL 40ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(54, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0054', 'N&L  COCO BUT GL 110ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(55, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0055', 'N&L  COCO BUT GL 65ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(56, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0056', 'N&L  COCO BUT GL 40ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(57, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0057', 'N&L AVOCADO GL 110ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(58, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0058', 'N&L AVOCADO GL 65ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(59, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0059', 'N&L AVOCADO GL 40ML', 'Glycerine', 'Glycerine', 'Glycerine', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(60, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0060', 'GOLD/T OILY 50GMS', 'Gold Touch', 'Gold Touch', 'Gold Touch', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(61, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0061', 'GOLD/T OILY 25GMS', 'Gold Touch', 'Gold Touch', 'Gold Touch', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(62, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0062', 'GOLD/T NORMAL 50GMS', 'Gold Touch', 'Gold Touch', 'Gold Touch', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(63, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0063', 'GOLD/T NORMAL 25GMS', 'Gold Touch', 'Gold Touch', 'Gold Touch', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(64, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0064', 'GOLD/T DRY 50GMS', 'Gold Touch', 'Gold Touch', 'Gold Touch', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(65, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0065', 'GOLD/T DRY 25GMS', 'Gold Touch', 'Gold Touch', 'Gold Touch', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(66, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0066', 'N&L  LILY ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(67, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0067', 'N&L MAG ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(68, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0068', 'N&L COT ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(69, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0069', 'N&L LOTUS ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(70, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0070', 'N&L SILKY ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(71, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0071', 'VERS COOL ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(72, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0072', 'VERS SPORTY ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(73, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0073', 'VERS TRENDY ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(74, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0074', 'VERS ACTIVE ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(75, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0075', 'VERS CLASSIC ROLL ON 50ML', 'Roll-on', 'Roll-on', 'Roll-on', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(76, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0076', 'VERS COOL PERF 100ML', 'Perfume', 'Perfume', 'Perfume', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(77, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0077', 'VERS FRESH PERF 100ML', 'Perfume', 'Perfume', 'Perfume', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(78, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0078', 'VERS SPORTY PERF 100ML', 'Perfume', 'Perfume', 'Perfume', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(79, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0079', 'VERS INDULGE PERF 100ML', 'Perfume', 'Perfume', 'Perfume', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(80, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0080', 'N&L  H/F 500GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(81, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0081', 'N&L  H/F 300GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(82, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0082', 'N&L  H/F 100GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(83, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0083', 'N&L AVOC OIL 300GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(84, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0084', 'N&L AVOC OIL 100GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(85, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0085', 'N&L PRIDE COOL 300GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(86, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0086', 'N&L PRIDE COOL 100GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(87, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0087', 'N&L ANTI- DAND 300GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(88, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0088', 'N&L ANTI- DAND 100GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(89, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0089', 'N&L CURL GEL 300GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(90, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0090', 'N&L CURL GEL 100GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(91, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0091', 'N&L STYLING GEL 135GMS', 'Hair', 'Hair', 'Hair', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(92, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0092', 'N&L BLOW OUT 140GMS', 'Relaxer', 'Relaxer', 'Relaxer', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(93, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0093', 'N&L RELAX REG 140GMS', 'Relaxer', 'Relaxer', 'Relaxer', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(94, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0094', 'N&L RELX SUP 140GMS', 'Relaxer', 'Relaxer', 'Relaxer', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(95, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0095', 'N&L CHOLE TREAT 140GMS', 'Relaxer', 'Relaxer', 'Relaxer', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(96, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0096', 'D&L FAT PRO REG RELAX 250GMS', 'Relaxer', 'Relaxer', 'Relaxer', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(97, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0097', 'D&L FAT PRO SUP RELAX 250GMS', 'Relaxer', 'Relaxer', 'Relaxer', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(98, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0098', 'D&L KIT BEAUT BEGINNINGS', 'Relaxer', 'Relaxer', 'Relaxer', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(99, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E0099', 'D&L KIT MOIST PLUS NORM', 'Relaxer', 'Relaxer', 'Relaxer', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(100, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00100', 'D&L KIT MOIST PLUS SUP', 'Relaxer', 'Relaxer', 'Relaxer', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(101, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00101', 'N&L APPLE SHAMP 1LTR', 'Shampoo', 'Shampoo', 'Shampoo', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(102, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00102', 'N&L APPLE SHAMP 500ML', 'Shampoo', 'Shampoo', 'Shampoo', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(103, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00103', 'N&L EGG SHAMP 1LTR', 'Shampoo', 'Shampoo', 'Shampoo', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(104, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00104', 'N&L EGG SHAMP 500ML', 'Shampoo', 'Shampoo', 'Shampoo', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(105, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00105', 'N&L AVOC  SHAMP 1LTR', 'Shampoo', 'Shampoo', 'Shampoo', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(106, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00106', 'N&L AVOC SHAMP 500ML', 'Shampoo', 'Shampoo', 'Shampoo', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(107, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00107', 'D&L FAT PROT FOOD  SHAMP 250ML', 'Shampoo', 'Shampoo', 'Shampoo', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(108, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00108', 'D&L AU NAT MOI REP SHAMP 250ML', 'AU NATURALE', 'AU NATURALE', 'AU NATURALE', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(109, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00109', 'D&L AU NAT KNOT-OUT COND 250ML', 'AU NATURALE', 'AU NATURALE', 'AU NATURALE', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(110, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00110', 'D&L AU NAT 3-in-1 CLEANS COND 300ML', 'AU NATURALE', 'AU NATURALE', 'AU NATURALE', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(111, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00111', 'D&L AU NAT MOIST BUTTER 250GMS', 'AU NATURALE', 'AU NATURALE', 'AU NATURALE', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(112, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00112', 'D&L AU NAT PLAIT PUDD CREAM250ML', 'AU NATURALE', 'AU NATURALE', 'AU NATURALE', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(113, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00113', 'D&L AU NAT MOI REP SHAMP 250GMS', 'AU NATURALE', 'AU NATURALE', 'AU NATURALE', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54'),
(114, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 'E00114', 'D&L AU NAT MOI REP SHAMP 250ML', 'AU NATURALE', 'AU NATURALE', 'AU NATURALE', '', '0', '0', 0, '1', '0', '0', '2018-02-07 21:39:54', '2017-12-19 23:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_quality_issues`
--

CREATE TABLE `dxcr2_quality_issues` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brandcode` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateofsale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_server_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitter` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_sync_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_quality_issues`
--

INSERT INTO `dxcr2_quality_issues` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `brand`, `brandcode`, `issue_type`, `rateofsale`, `expiry_date`, `store`, `store_id`, `store_server_id`, `created_on`, `remarks`, `client_id`, `coordinates`, `submitter`, `user_id`, `last_sync_date`, `first_insert_date`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', 542, 542, '1', '1', '1', '100', '2018-02-22 00:00:00', '1', '1', '1', '2018-02-09 09:29:48', 'none', '', '', 542, 542, '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_redirect_links`
--

CREATE TABLE `dxcr2_redirect_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_schemas`
--

CREATE TABLE `dxcr2_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_schemas`
--

INSERT INTO `dxcr2_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.8.4-2018-01-16');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_session`
--

CREATE TABLE `dxcr2_session` (
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `guest` tinyint(4) UNSIGNED DEFAULT '1',
  `time` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_session`
--

INSERT INTO `dxcr2_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('092c7b45d20f375fb6b77d6698adb4f7', 1, 1, '1518164813', 'joomla|s:596:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidG9rZW4iO3M6MzI6IkRIR2R5bjFJSmRYUVo0ZFEwQ0xEbDhkcnJsand3OTZTIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9\";', 0, ''),
('5247718af029c8fca4642807877949fe', 1, 0, '1518169734', 'joomla|s:1348:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxODtzOjU6InRva2VuIjtzOjMyOiI4OEtUWThOZ3pZN213SnR4cWRaWWYySTgyc1J3UHVJTyI7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNTE4MTY5NjY3O3M6NDoibGFzdCI7aToxNTE4MTY5NzMyO3M6Mzoibm93IjtpOjE1MTgxNjk3MzM7fX1zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoxMzoiY29tX2luc3RhbGxlciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJtZXNzYWdlIjtzOjA6IiI7czoxNzoiZXh0ZW5zaW9uX21lc3NhZ2UiO3M6MDoiIjtzOjEyOiJyZWRpcmVjdF91cmwiO047fXM6NzoiY29tX3ZvYyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJ2b2NzIjtPOjg6InN0ZENsYXNzIjoyOntzOjg6Im9yZGVyY29sIjtzOjQ6ImEuaWQiO3M6NDoibGlzdCI7YTo0OntzOjk6ImRpcmVjdGlvbiI7czozOiJhc2MiO3M6NToibGltaXQiO3M6MjoiMjAiO3M6ODoib3JkZXJpbmciO3M6NDoiYS5pZCI7czo1OiJzdGFydCI7ZDowO319czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjM6InZvYyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjtOO3M6MjoiaWQiO2E6MDp7fX19fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtzOjM6IjU0MiI7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjthOjA6e319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";', 542, 'admin'),
('ea96f748ea47bf1b5d124821cf48d7b6', 0, 1, '1518169810', 'joomla|s:1324:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTozO3M6NToidG9rZW4iO3M6MzI6IkgyZnNUTDV0eVNuSjhuTDZlVFBUSVhDbFdaRFZyYjlPIjtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE1MTgxNjk4MDM7czo0OiJsYXN0IjtpOjE1MTgxNjk4MDM7czozOiJub3ciO2k6MTUxODE2OTgwOTt9fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImNvbV92b2MiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidm9jcyI7Tzo4OiJzdGRDbGFzcyI6Njp7czo0OiJsaXN0IjthOjQ6e3M6NToibGltaXQiO2k6MjA7czo1OiJzdGFydCI7aTowO3M6ODoib3JkZXJpbmciO047czo5OiJkaXJlY3Rpb24iO047fXM6NjoiZmlsdGVyIjthOjk6e3M6Njoic2VhcmNoIjtzOjA6IiI7czo1OiJicmFuZCI7czowOiIiO3M6OToiYnJhbmRjb2RlIjtzOjA6IiI7czo4OiJjYXRlZ29yeSI7czowOiIiO3M6NToiaXRlbXMiO3M6MDoiIjtzOjk6ImNvbW1lbnRieSI7czowOiIiO3M6ODoiaXN1cmdlbnQiO3M6MToiMSI7czo1OiJzdG9yZSI7czowOiIiO3M6ODoic3RvcmVfaWQiO3M6MDoiIjt9czoxMDoibGltaXRzdGFydCI7aTowO3M6ODoib3JkZXJjb2wiO3M6MDoiIjtzOjk6Im9yZGVyZGlybiI7czowOiIiO3M6NToibGltaXQiO2k6MjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_tags`
--

CREATE TABLE `dxcr2_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_tags`
--

INSERT INTO `dxcr2_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 542, '2018-02-05 17:45:15', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_template_styles`
--

CREATE TABLE `dxcr2_template_styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_template_styles`
--

INSERT INTO `dxcr2_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.png\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{\"templateColor\":\"#6a0e0f\",\"templateBackgroundColor\":\"#ffffff\",\"logoFile\":\"images\\/eabl-logo.gif\",\"sitetitle\":\"ETC Trade Management Portal\",\"sitedescription\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"1\"}'),
(8, 'isis', 1, '1', 'isis - Default', '{\"templateColor\":\"\",\"logoFile\":\"\"}'),
(9, 'shaper_helix3', 0, '1', 'shaper_helix3 - Default', '{\"preloader\":\"1\",\"preloader_animation\":\"clock\",\"preloader_bg\":\"#f5f5f5\",\"preloader_tx\":\"#6a170f\",\"goto_top\":\"1\",\"sticky_header\":\"0\",\"favicon\":\"\",\"boxed_layout\":\"0\",\"logo_type\":\"image\",\"logo_position\":\"logo\",\"logo_load_pos\":\"default\",\"logo_image\":\"images\\/eabl-logo.gif\",\"logo_image_2x\":\"\",\"mobile_logo\":\"\",\"logo_text\":\"\",\"logo_slogan\":\"\",\"body_bg_image\":\"\",\"body_bg_repeat\":\"inherit\",\"body_bg_size\":\"inherit\",\"body_bg_attachment\":\"inherit\",\"body_bg_position\":\"0 0\",\"enabled_copyright\":\"1\",\"copyright_position\":\"footer1\",\"copyright_load_pos\":\"default\",\"copyright\":\"\\u00a9 2018 ETC Marketing. All Rights Reserved. \",\"show_social_icons\":\"0\",\"social_position\":\"top1\",\"social_load_pos\":\"default\",\"facebook\":\"\",\"twitter\":\"\",\"googleplus\":\"\",\"pinterest\":\"\",\"linkedin\":\"\",\"dribbble\":\"\",\"behance\":\"\",\"youtube\":\"\",\"flickr\":\"\",\"skype\":\"\",\"whatsapp\":\"\",\"vk\":\"\",\"custom\":\"\",\"enable_contactinfo\":\"0\",\"contact_position\":\"top2\",\"contact_phone\":\"\",\"contact_mobile\":\"\",\"contact_email\":\"\",\"contact_time\":\"\",\"comingsoon_mode\":\"0\",\"comingsoon_bg\":\"\",\"comingsoon_logo\":\"\",\"comingsoon_title\":\"Coming Soon Title\",\"comingsoon_date\":\"05-10-2018\",\"comingsoon_content\":\"Coming soon content\",\"error_bg\":\"\",\"error_logo\":\"\",\"preset\":\"preset4\",\"preset1_bg\":\"#ffffff\",\"preset1_text\":\"#000000\",\"preset1_major\":\"#26aae1\",\"preset1_megabg\":\"#ffffff\",\"preset1_megatx\":\"#333333\",\"preset2_bg\":\"#ffffff\",\"preset2_text\":\"#000000\",\"preset2_major\":\"#3d449a\",\"preset2_megabg\":\"#ffffff\",\"preset2_megatx\":\"#333333\",\"preset3_bg\":\"#ffffff\",\"preset3_text\":\"#000000\",\"preset3_major\":\"#2bb673\",\"preset3_megabg\":\"#ffffff\",\"preset3_megatx\":\"#333333\",\"preset4_bg\":\"#f7f7f7\",\"preset4_text\":\"#560300\",\"preset4_major\":\"#560300\",\"preset4_megabg\":\"#560300\",\"preset4_megatx\":\"#c87d08\",\"layoutlist\":\"default.json\",\"layout\":\"[{\\\"type\\\":\\\"row\\\",\\\"layout\\\":\\\"39\\\",\\\"settings\\\":{\\\"custom_class\\\":\\\"\\\",\\\"fluidrow\\\":0,\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"link_hover_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"name\\\":\\\"Header\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"className\\\":\\\"layout-column col-sm-3\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"md_hidden\\\":0,\\\"ms_hidden\\\":0,\\\"xs_hidden\\\":0,\\\"custom_class\\\":\\\"\\\",\\\"xs_col\\\":\\\"col-xs-8\\\",\\\"sm_col\\\":\\\"\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"name\\\":\\\"logo\\\",\\\"column_type\\\":0}},{\\\"type\\\":\\\"sp_col\\\",\\\"className\\\":\\\"layout-column col-sm-9\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"custom_class\\\":\\\"\\\",\\\"md_hidden\\\":0,\\\"ms_hidden\\\":0,\\\"xs_hidden\\\":0,\\\"name\\\":\\\"menu\\\",\\\"column_type\\\":0,\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"col-xs-4\\\"}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":12,\\\"settings\\\":{\\\"name\\\":\\\"Page Title\\\",\\\"background_color\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"fluidrow\\\":1,\\\"custom_class\\\":\\\"\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"className\\\":\\\"layout-column col-sm-12\\\",\\\"settings\\\":{\\\"column_type\\\":0,\\\"name\\\":\\\"title\\\",\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\"}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":\\\"363\\\",\\\"settings\\\":{\\\"name\\\":\\\"Main Body\\\",\\\"bg_color\\\":\\\"\\\",\\\"bg_image\\\":\\\"\\\",\\\"text_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"xs_hidden\\\":0,\\\"ms_hidden\\\":0,\\\"md_hidden\\\":0,\\\"custom_class\\\":\\\"\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"className\\\":\\\"layout-column col-sm-3\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"custom_class\\\":\\\"custom-class\\\",\\\"md_hidden\\\":0,\\\"ms_hidden\\\":0,\\\"xs_hidden\\\":0,\\\"name\\\":\\\"left\\\",\\\"column_type\\\":0}},{\\\"type\\\":\\\"sp_col\\\",\\\"className\\\":\\\"layout-column col-sm-6\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"xs_hidden\\\":0,\\\"ms_hidden\\\":0,\\\"md_hidden\\\":0,\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"\\\",\\\"column_type\\\":1}},{\\\"type\\\":\\\"sp_col\\\",\\\"className\\\":\\\"layout-column col-sm-3\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"column_type\\\":0,\\\"name\\\":\\\"right\\\",\\\"xs_hidden\\\":0,\\\"ms_hidden\\\":0,\\\"md_hidden\\\":0,\\\"custom_class\\\":\\\"class2\\\"}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":12,\\\"settings\\\":{\\\"name\\\":\\\"Footer\\\",\\\"bg_color\\\":\\\"\\\",\\\"bg_image\\\":\\\"\\\",\\\"text_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"xs_hidden\\\":0,\\\"ms_hidden\\\":0,\\\"md_hidden\\\":0,\\\"custom_class\\\":\\\"\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"className\\\":\\\"layout-column col-sm-12\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"custom_class\\\":\\\"\\\",\\\"md_hidden\\\":0,\\\"ms_hidden\\\":0,\\\"xs_hidden\\\":0,\\\"name\\\":\\\"footer1\\\",\\\"column_type\\\":0,\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\"}}]}]\",\"menu\":\"mainmenu\",\"menu_type\":\"mega\",\"dropdown_width\":\"\",\"menu_animation\":\"menu-fade\",\"offcanvas_animation\":\"default\",\"enable_body_font\":\"1\",\"body_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"300\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h1_font\":\"1\",\"h1_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"800\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h2_font\":\"1\",\"h2_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"600\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h3_font\":\"1\",\"h3_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"regular\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h4_font\":\"1\",\"h4_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"regular\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h5_font\":\"1\",\"h5_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"600\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_h6_font\":\"1\",\"h6_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontWeight\\\":\\\"600\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_navigation_font\":\"0\",\"navigation_font\":\"{\\\"fontFamily\\\":\\\"ABeeZee\\\",\\\"fontWeight\\\":\\\"regular\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"enable_custom_font\":\"0\",\"custom_font\":\"{\\\"fontFamily\\\":\\\"ABeeZee\\\",\\\"fontWeight\\\":\\\"regular\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontSize\\\":\\\"\\\"}\",\"custom_font_selectors\":\"\",\"before_head\":\"\",\"before_body\":\"\",\"custom_css\":\"\",\"custom_js\":\"\",\"compress_css\":\"0\",\"compress_js\":\"0\",\"exclude_js\":\"\",\"lessoption\":\"0\",\"show_post_format\":\"1\",\"commenting_engine\":\"disabled\",\"disqus_subdomain\":\"\",\"disqus_devmode\":\"0\",\"intensedebate_acc\":\"\",\"fb_appID\":\"\",\"fb_width\":\"500\",\"fb_cpp\":\"10\",\"comments_count\":\"0\",\"social_share\":\"1\",\"image_small\":\"0\",\"image_small_size\":\"100X100\",\"image_thumbnail\":\"1\",\"image_thumbnail_size\":\"200X200\",\"image_medium\":\"0\",\"image_medium_size\":\"300X300\",\"image_large\":\"0\",\"image_large_size\":\"600X600\",\"blog_list_image\":\"default\"}');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_ucm_base`
--

CREATE TABLE `dxcr2_ucm_base` (
  `ucm_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_ucm_content`
--

CREATE TABLE `dxcr2_ucm_content` (
  `core_content_id` int(10) UNSIGNED NOT NULL,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_ucm_history`
--

CREATE TABLE `dxcr2_ucm_history` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) UNSIGNED NOT NULL,
  `ucm_type_id` int(10) UNSIGNED NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `character_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_ucm_history`
--

INSERT INTO `dxcr2_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 2, 0, '', '2018-02-05 19:53:37', 542, 371, '21a16042e2c91739d5106556fffa4529ad574b1a', '{\"id\":2,\"asset_id\":63,\"ordering\":2,\"state\":\"1\",\"checked_out\":null,\"checked_out_time\":null,\"created_by\":\"542\",\"modified_by\":\"542\",\"account\":\"Nakumatt\",\"shop_name\":\"Nakumatt Ukay\",\"category\":\"1\",\"region\":\"Nairobi\",\"location\":\"Nairobi\",\"manager_name\":\"Mike\",\"manager_phone\":\"07878787\",\"submitter\":\"0\",\"last_sync_date\":\"78\",\"date_created\":\"2018-02-05 22:53:30\",\"user_id\":\"0\"}', 0),
(2, 2, 0, '', '2018-02-05 19:54:07', 542, 396, '6c9735faaf0935543c00a0cc6fd3ee56c91a5186', '{\"id\":2,\"asset_id\":\"63\",\"ordering\":\"2\",\"state\":\"1\",\"checked_out\":\"542\",\"checked_out_time\":\"2018-02-05 19:53:37\",\"created_by\":\"542\",\"modified_by\":\"542\",\"account\":\"Nakumatt\",\"shop_name\":\"Nakumatt Nyali\",\"category\":\"2\",\"region\":\"Nairobi\",\"location\":\"Nairobi\",\"manager_name\":\"Shadow\",\"manager_phone\":\"07878787\",\"submitter\":\"0\",\"last_sync_date\":\"78\",\"date_created\":\"2018-02-05 22:53:37\",\"user_id\":\"0\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_updates`
--

CREATE TABLE `dxcr2_updates` (
  `update_id` int(11) NOT NULL,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_update_sites`
--

CREATE TABLE `dxcr2_update_sites` (
  `update_site_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

--
-- Dumping data for table `dxcr2_update_sites`
--

INSERT INTO `dxcr2_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 0, 0, ''),
(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', 0, 0, ''),
(3, 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1518162227, ''),
(4, 'Aimy Charts Update Server', 'extension', 'http://updates.aimy-extensions.com/joomla/plg_aimycharts.xml', 1, 1518162227, ''),
(5, 'COM_RESERVATIONREPORT_UPDATE_NAME', 'extension', 'http://kuem.in/joomlaupdate/com_reservationreport.xml', 1, 1518162227, ''),
(6, 'Helix3 - Ajax', 'extension', 'http://www.joomshaper.com/updates/plg-ajax-helix3.xml', 1, 1518162228, ''),
(7, 'System - Helix3 Framework', 'extension', 'http://www.joomshaper.com/updates/plg-system-helix3.xml', 1, 1518162229, ''),
(8, 'shaper_helix3', 'extension', 'https://www.joomshaper.com/updates/shaper-helix3.xml', 1, 1518162230, '');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_update_sites_extensions`
--

CREATE TABLE `dxcr2_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- Dumping data for table `dxcr2_update_sites_extensions`
--

INSERT INTO `dxcr2_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 802),
(3, 28),
(4, 10011),
(5, 10012),
(6, 10017),
(7, 10018),
(8, 10019);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_usergroups`
--

CREATE TABLE `dxcr2_usergroups` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_usergroups`
--

INSERT INTO `dxcr2_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 10, 17, 'Registered'),
(3, 2, 11, 16, 'Field'),
(4, 3, 12, 15, 'Team Leaders'),
(5, 4, 13, 14, 'Publisher'),
(6, 1, 4, 9, 'Manager'),
(7, 6, 5, 6, 'Client'),
(8, 1, 18, 19, 'Super Users'),
(9, 1, 2, 3, 'Guest'),
(10, 6, 7, 8, 'Team Leaders');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_users`
--

CREATE TABLE `dxcr2_users` (
  `id` int(11) NOT NULL,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_users`
--

INSERT INTO `dxcr2_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(542, 'Super User', 'admin', 'michael@buluma.me.ke', '$2y$10$vg4YI3tNQYjS2xZZ/qctXOVfPvltAz/Rmow6uz7tIcWrlwtWIxgNu', 0, 1, '2018-02-05 17:45:26', '2018-02-09 09:47:47', '0', '', '0000-00-00 00:00:00', 0, '', '', 0),
(543, 'tm_leader', 'tm_leader', 'tm_leader@buluma.me.ke', '$2y$10$vET74tp9xVnqNQQPFWlfo.h968.EYBShx6moFGJGWsoM767kdE21S', 0, 0, '2018-02-07 17:34:24', '2018-02-08 14:06:21', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}', '0000-00-00 00:00:00', 0, '', '', 0),
(544, 'user', 'user', 'user@buluma.me.ke', '$2y$10$JwXo01OtpMUzgSivIA78X.vwxgLX3k2/co/CQhBWNtzj/Rjjyj4o2', 0, 0, '2018-02-07 17:35:04', '2018-02-08 13:48:55', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}', '0000-00-00 00:00:00', 0, '', '', 0),
(545, 'client', 'client', 'client@buluma.me.ke', '$2y$10$GovBRyf0h7H5AgmOOEdM0uIpuW1Y48DM6BUiRZ4mmqBO1H5mvnef6', 0, 0, '2018-02-07 18:25:12', '2018-02-09 07:43:37', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_user_keys`
--

CREATE TABLE `dxcr2_user_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_user_notes`
--

CREATE TABLE `dxcr2_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_user_profiles`
--

CREATE TABLE `dxcr2_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_user_usergroup_map`
--

CREATE TABLE `dxcr2_user_usergroup_map` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_user_usergroup_map`
--

INSERT INTO `dxcr2_user_usergroup_map` (`user_id`, `group_id`) VALUES
(542, 8),
(543, 10),
(544, 3),
(545, 7);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_utf8_conversion`
--

CREATE TABLE `dxcr2_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_utf8_conversion`
--

INSERT INTO `dxcr2_utf8_conversion` (`converted`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_viewlevels`
--

CREATE TABLE `dxcr2_viewlevels` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_viewlevels`
--

INSERT INTO `dxcr2_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]'),
(7, 'Team Leaders', 0, '[10,4]');

-- --------------------------------------------------------

--
-- Table structure for table `dxcr2_voc`
--

CREATE TABLE `dxcr2_voc` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `submitter` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_sync_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photos` blob NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brandcode` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentby` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isurgent` tinyint(1) NOT NULL,
  `store` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_server_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_modified_date` datetime NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dxcr2_voc`
--

INSERT INTO `dxcr2_voc` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `submitter`, `user_id`, `last_sync_date`, `insert_date`, `photos`, `brand`, `brandcode`, `category`, `items`, `commentby`, `isurgent`, `store`, `store_id`, `store_server_id`, `remarks`, `coordinates`, `client_modified_date`, `client_id`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', 542, 542, 542, 542, '', '2018-02-09 09:48:32', 0x3c703e686572653c2f703e, '1', '1', '1', '1', '1', 0, '1', '1', '1', 'yes', '', '2018-02-09 09:48:28', ''),
(2, 2, 1, 0, '0000-00-00 00:00:00', 542, 542, 542, 542, '', '2018-02-09 09:48:53', 0x3c703e686572653c2f703e, '1', '1', '1', '1', '1', 1, '1', '1', '1', 'yes', '', '2018-02-09 09:48:52', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dxcr2_assets`
--
ALTER TABLE `dxcr2_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_asset_name` (`name`),
  ADD KEY `idx_lft_rgt` (`lft`,`rgt`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `dxcr2_associations`
--
ALTER TABLE `dxcr2_associations`
  ADD PRIMARY KEY (`context`,`id`),
  ADD KEY `idx_key` (`key`);

--
-- Indexes for table `dxcr2_banners`
--
ALTER TABLE `dxcr2_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  ADD KEY `idx_banner_catid` (`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `dxcr2_banner_clients`
--
ALTER TABLE `dxcr2_banner_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100));

--
-- Indexes for table `dxcr2_banner_tracks`
--
ALTER TABLE `dxcr2_banner_tracks`
  ADD PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  ADD KEY `idx_track_date` (`track_date`),
  ADD KEY `idx_track_type` (`track_type`),
  ADD KEY `idx_banner_id` (`banner_id`);

--
-- Indexes for table `dxcr2_brandstocks`
--
ALTER TABLE `dxcr2_brandstocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_categories`
--
ALTER TABLE `dxcr2_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`extension`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `dxcr2_contact_details`
--
ALTER TABLE `dxcr2_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `dxcr2_content`
--
ALTER TABLE `dxcr2_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`),
  ADD KEY `idx_alias` (`alias`(191));

--
-- Indexes for table `dxcr2_contentitem_tag_map`
--
ALTER TABLE `dxcr2_contentitem_tag_map`
  ADD UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  ADD KEY `idx_tag_type` (`tag_id`,`type_id`),
  ADD KEY `idx_date_id` (`tag_date`,`tag_id`),
  ADD KEY `idx_core_content_id` (`core_content_id`);

--
-- Indexes for table `dxcr2_content_frontpage`
--
ALTER TABLE `dxcr2_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `dxcr2_content_rating`
--
ALTER TABLE `dxcr2_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `dxcr2_content_types`
--
ALTER TABLE `dxcr2_content_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `idx_alias` (`type_alias`(100));

--
-- Indexes for table `dxcr2_extensions`
--
ALTER TABLE `dxcr2_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `element_clientid` (`element`,`client_id`),
  ADD KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  ADD KEY `extension` (`type`,`element`,`folder`,`client_id`);

--
-- Indexes for table `dxcr2_fields`
--
ALTER TABLE `dxcr2_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_user_id` (`created_user_id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `dxcr2_fields_categories`
--
ALTER TABLE `dxcr2_fields_categories`
  ADD PRIMARY KEY (`field_id`,`category_id`);

--
-- Indexes for table `dxcr2_fields_groups`
--
ALTER TABLE `dxcr2_fields_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `dxcr2_fields_values`
--
ALTER TABLE `dxcr2_fields_values`
  ADD KEY `idx_field_id` (`field_id`),
  ADD KEY `idx_item_id` (`item_id`(191));

--
-- Indexes for table `dxcr2_finder_filters`
--
ALTER TABLE `dxcr2_finder_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `dxcr2_finder_links`
--
ALTER TABLE `dxcr2_finder_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_title` (`title`(100)),
  ADD KEY `idx_md5` (`md5sum`),
  ADD KEY `idx_url` (`url`(75)),
  ADD KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  ADD KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`);

--
-- Indexes for table `dxcr2_finder_links_terms0`
--
ALTER TABLE `dxcr2_finder_links_terms0`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_terms1`
--
ALTER TABLE `dxcr2_finder_links_terms1`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_terms2`
--
ALTER TABLE `dxcr2_finder_links_terms2`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_terms3`
--
ALTER TABLE `dxcr2_finder_links_terms3`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_terms4`
--
ALTER TABLE `dxcr2_finder_links_terms4`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_terms5`
--
ALTER TABLE `dxcr2_finder_links_terms5`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_terms6`
--
ALTER TABLE `dxcr2_finder_links_terms6`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_terms7`
--
ALTER TABLE `dxcr2_finder_links_terms7`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_terms8`
--
ALTER TABLE `dxcr2_finder_links_terms8`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_terms9`
--
ALTER TABLE `dxcr2_finder_links_terms9`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_termsa`
--
ALTER TABLE `dxcr2_finder_links_termsa`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_termsb`
--
ALTER TABLE `dxcr2_finder_links_termsb`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_termsc`
--
ALTER TABLE `dxcr2_finder_links_termsc`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_termsd`
--
ALTER TABLE `dxcr2_finder_links_termsd`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_termse`
--
ALTER TABLE `dxcr2_finder_links_termse`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_links_termsf`
--
ALTER TABLE `dxcr2_finder_links_termsf`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `dxcr2_finder_taxonomy`
--
ALTER TABLE `dxcr2_finder_taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `state` (`state`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `access` (`access`),
  ADD KEY `idx_parent_published` (`parent_id`,`state`,`access`);

--
-- Indexes for table `dxcr2_finder_taxonomy_map`
--
ALTER TABLE `dxcr2_finder_taxonomy_map`
  ADD PRIMARY KEY (`link_id`,`node_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Indexes for table `dxcr2_finder_terms`
--
ALTER TABLE `dxcr2_finder_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `idx_term` (`term`),
  ADD KEY `idx_term_phrase` (`term`,`phrase`),
  ADD KEY `idx_stem_phrase` (`stem`,`phrase`),
  ADD KEY `idx_soundex_phrase` (`soundex`,`phrase`);

--
-- Indexes for table `dxcr2_finder_terms_common`
--
ALTER TABLE `dxcr2_finder_terms_common`
  ADD KEY `idx_word_lang` (`term`,`language`),
  ADD KEY `idx_lang` (`language`);

--
-- Indexes for table `dxcr2_finder_tokens`
--
ALTER TABLE `dxcr2_finder_tokens`
  ADD KEY `idx_word` (`term`),
  ADD KEY `idx_context` (`context`);

--
-- Indexes for table `dxcr2_finder_tokens_aggregate`
--
ALTER TABLE `dxcr2_finder_tokens_aggregate`
  ADD KEY `token` (`term`),
  ADD KEY `keyword_id` (`term_id`);

--
-- Indexes for table `dxcr2_finder_types`
--
ALTER TABLE `dxcr2_finder_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `dxcr2_languages`
--
ALTER TABLE `dxcr2_languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `idx_sef` (`sef`),
  ADD UNIQUE KEY `idx_langcode` (`lang_code`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Indexes for table `dxcr2_logins`
--
ALTER TABLE `dxcr2_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_menu`
--
ALTER TABLE `dxcr2_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  ADD KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  ADD KEY `idx_menutype` (`menutype`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `dxcr2_menu_types`
--
ALTER TABLE `dxcr2_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_menutype` (`menutype`);

--
-- Indexes for table `dxcr2_messages`
--
ALTER TABLE `dxcr2_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Indexes for table `dxcr2_messages_cfg`
--
ALTER TABLE `dxcr2_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Indexes for table `dxcr2_modules`
--
ALTER TABLE `dxcr2_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `dxcr2_modules_menu`
--
ALTER TABLE `dxcr2_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Indexes for table `dxcr2_newsfeeds`
--
ALTER TABLE `dxcr2_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `dxcr2_objective`
--
ALTER TABLE `dxcr2_objective`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_objectives`
--
ALTER TABLE `dxcr2_objectives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_objectives2`
--
ALTER TABLE `dxcr2_objectives2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_outlets`
--
ALTER TABLE `dxcr2_outlets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_overrider`
--
ALTER TABLE `dxcr2_overrider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_perfect_checklist`
--
ALTER TABLE `dxcr2_perfect_checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_photos`
--
ALTER TABLE `dxcr2_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_planner`
--
ALTER TABLE `dxcr2_planner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_postinstall_messages`
--
ALTER TABLE `dxcr2_postinstall_messages`
  ADD PRIMARY KEY (`postinstall_message_id`);

--
-- Indexes for table `dxcr2_products`
--
ALTER TABLE `dxcr2_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_quality_issues`
--
ALTER TABLE `dxcr2_quality_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dxcr2_redirect_links`
--
ALTER TABLE `dxcr2_redirect_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_old_url` (`old_url`(100)),
  ADD KEY `idx_link_modifed` (`modified_date`);

--
-- Indexes for table `dxcr2_schemas`
--
ALTER TABLE `dxcr2_schemas`
  ADD PRIMARY KEY (`extension_id`,`version_id`);

--
-- Indexes for table `dxcr2_session`
--
ALTER TABLE `dxcr2_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `dxcr2_tags`
--
ALTER TABLE `dxcr2_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_idx` (`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `dxcr2_template_styles`
--
ALTER TABLE `dxcr2_template_styles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_home` (`home`);

--
-- Indexes for table `dxcr2_ucm_base`
--
ALTER TABLE `dxcr2_ucm_base`
  ADD PRIMARY KEY (`ucm_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_item_id`),
  ADD KEY `idx_ucm_type_id` (`ucm_type_id`),
  ADD KEY `idx_ucm_language_id` (`ucm_language_id`);

--
-- Indexes for table `dxcr2_ucm_content`
--
ALTER TABLE `dxcr2_ucm_content`
  ADD PRIMARY KEY (`core_content_id`),
  ADD KEY `tag_idx` (`core_state`,`core_access`),
  ADD KEY `idx_access` (`core_access`),
  ADD KEY `idx_alias` (`core_alias`(100)),
  ADD KEY `idx_language` (`core_language`),
  ADD KEY `idx_title` (`core_title`(100)),
  ADD KEY `idx_modified_time` (`core_modified_time`),
  ADD KEY `idx_created_time` (`core_created_time`),
  ADD KEY `idx_content_type` (`core_type_alias`(100)),
  ADD KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  ADD KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  ADD KEY `idx_core_created_user_id` (`core_created_user_id`),
  ADD KEY `idx_core_type_id` (`core_type_id`);

--
-- Indexes for table `dxcr2_ucm_history`
--
ALTER TABLE `dxcr2_ucm_history`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  ADD KEY `idx_save_date` (`save_date`);

--
-- Indexes for table `dxcr2_updates`
--
ALTER TABLE `dxcr2_updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Indexes for table `dxcr2_update_sites`
--
ALTER TABLE `dxcr2_update_sites`
  ADD PRIMARY KEY (`update_site_id`);

--
-- Indexes for table `dxcr2_update_sites_extensions`
--
ALTER TABLE `dxcr2_update_sites_extensions`
  ADD PRIMARY KEY (`update_site_id`,`extension_id`);

--
-- Indexes for table `dxcr2_usergroups`
--
ALTER TABLE `dxcr2_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE;

--
-- Indexes for table `dxcr2_users`
--
ALTER TABLE `dxcr2_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`(100)),
  ADD KEY `idx_block` (`block`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `dxcr2_user_keys`
--
ALTER TABLE `dxcr2_user_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series` (`series`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `dxcr2_user_notes`
--
ALTER TABLE `dxcr2_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`catid`);

--
-- Indexes for table `dxcr2_user_profiles`
--
ALTER TABLE `dxcr2_user_profiles`
  ADD UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`);

--
-- Indexes for table `dxcr2_user_usergroup_map`
--
ALTER TABLE `dxcr2_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `dxcr2_viewlevels`
--
ALTER TABLE `dxcr2_viewlevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_assetgroup_title_lookup` (`title`);

--
-- Indexes for table `dxcr2_voc`
--
ALTER TABLE `dxcr2_voc`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dxcr2_assets`
--
ALTER TABLE `dxcr2_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `dxcr2_banners`
--
ALTER TABLE `dxcr2_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_banner_clients`
--
ALTER TABLE `dxcr2_banner_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_brandstocks`
--
ALTER TABLE `dxcr2_brandstocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dxcr2_categories`
--
ALTER TABLE `dxcr2_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `dxcr2_contact_details`
--
ALTER TABLE `dxcr2_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_content`
--
ALTER TABLE `dxcr2_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_content_types`
--
ALTER TABLE `dxcr2_content_types`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `dxcr2_extensions`
--
ALTER TABLE `dxcr2_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10026;
--
-- AUTO_INCREMENT for table `dxcr2_fields`
--
ALTER TABLE `dxcr2_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dxcr2_fields_groups`
--
ALTER TABLE `dxcr2_fields_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dxcr2_finder_filters`
--
ALTER TABLE `dxcr2_finder_filters`
  MODIFY `filter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_finder_links`
--
ALTER TABLE `dxcr2_finder_links`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_finder_taxonomy`
--
ALTER TABLE `dxcr2_finder_taxonomy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dxcr2_finder_terms`
--
ALTER TABLE `dxcr2_finder_terms`
  MODIFY `term_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_finder_types`
--
ALTER TABLE `dxcr2_finder_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_languages`
--
ALTER TABLE `dxcr2_languages`
  MODIFY `lang_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dxcr2_logins`
--
ALTER TABLE `dxcr2_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `dxcr2_menu`
--
ALTER TABLE `dxcr2_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT for table `dxcr2_menu_types`
--
ALTER TABLE `dxcr2_menu_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dxcr2_messages`
--
ALTER TABLE `dxcr2_messages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_modules`
--
ALTER TABLE `dxcr2_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `dxcr2_newsfeeds`
--
ALTER TABLE `dxcr2_newsfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_objective`
--
ALTER TABLE `dxcr2_objective`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dxcr2_objectives`
--
ALTER TABLE `dxcr2_objectives`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `dxcr2_objectives2`
--
ALTER TABLE `dxcr2_objectives2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `dxcr2_outlets`
--
ALTER TABLE `dxcr2_outlets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;
--
-- AUTO_INCREMENT for table `dxcr2_overrider`
--
ALTER TABLE `dxcr2_overrider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `dxcr2_perfect_checklist`
--
ALTER TABLE `dxcr2_perfect_checklist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dxcr2_photos`
--
ALTER TABLE `dxcr2_photos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dxcr2_planner`
--
ALTER TABLE `dxcr2_planner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dxcr2_postinstall_messages`
--
ALTER TABLE `dxcr2_postinstall_messages`
  MODIFY `postinstall_message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dxcr2_products`
--
ALTER TABLE `dxcr2_products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `dxcr2_quality_issues`
--
ALTER TABLE `dxcr2_quality_issues`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dxcr2_redirect_links`
--
ALTER TABLE `dxcr2_redirect_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_tags`
--
ALTER TABLE `dxcr2_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dxcr2_template_styles`
--
ALTER TABLE `dxcr2_template_styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `dxcr2_ucm_content`
--
ALTER TABLE `dxcr2_ucm_content`
  MODIFY `core_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_ucm_history`
--
ALTER TABLE `dxcr2_ucm_history`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dxcr2_updates`
--
ALTER TABLE `dxcr2_updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_update_sites`
--
ALTER TABLE `dxcr2_update_sites`
  MODIFY `update_site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dxcr2_usergroups`
--
ALTER TABLE `dxcr2_usergroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `dxcr2_users`
--
ALTER TABLE `dxcr2_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=546;
--
-- AUTO_INCREMENT for table `dxcr2_user_keys`
--
ALTER TABLE `dxcr2_user_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_user_notes`
--
ALTER TABLE `dxcr2_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dxcr2_viewlevels`
--
ALTER TABLE `dxcr2_viewlevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `dxcr2_voc`
--
ALTER TABLE `dxcr2_voc`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
