-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2026 at 09:34 PM
-- Server version: 8.0.46-37
-- PHP Version: 8.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sgyvnlte_badexample`
--

-- --------------------------------------------------------

--
-- Table structure for table `nova_access_groups`
--

CREATE TABLE `nova_access_groups` (
  `group_id` int NOT NULL,
  `group_name` varchar(255) NOT NULL DEFAULT '',
  `group_order` int NOT NULL DEFAULT '99'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_access_groups`
--

INSERT INTO `nova_access_groups` (`group_id`, `group_name`, `group_order`) VALUES
(1, 'General Admin', 0),
(2, 'Writing Features', 1),
(3, 'Site Management', 2),
(4, 'Data Management', 3),
(5, 'Reports', 4),
(6, 'Characters', 5),
(7, 'Users', 6),
(8, 'Wiki', 7);

-- --------------------------------------------------------

--
-- Table structure for table `nova_access_pages`
--

CREATE TABLE `nova_access_pages` (
  `page_id` int NOT NULL,
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `page_url` varchar(255) NOT NULL DEFAULT '',
  `page_level` varchar(3) NOT NULL DEFAULT '',
  `page_group` int NOT NULL DEFAULT '0',
  `page_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_access_pages`
--

INSERT INTO `nova_access_pages` (`page_id`, `page_name`, `page_url`, `page_level`, `page_group`, `page_desc`) VALUES
(1, 'Admin Control Panel', 'admin/index', '', 1, 'Can access the admin control panel with recent posts, stats and other information'),
(2, 'Upload Images', 'upload/index', '', 1, 'Can upload images to the server'),
(3, 'Manage Uploads', 'upload/manage', '', 1, 'Can delete upload records'),
(4, 'Private Messages', 'messages/index', '', 2, 'Can send and receive private messages'),
(5, 'Writing Control Panel', 'write/index', '', 2, 'Can access the writing control panel with saved entries and recent posts'),
(6, 'Write Mission Post', 'write/missionpost', '', 2, 'Can post a mission entry to the system'),
(7, 'Write Personal Log', 'write/personallog', '', 2, 'Can post a personal log to the system'),
(8, 'Write News Item', 'write/newsitem', '', 2, 'Can post a news items to the system'),
(9, 'Site Settings', 'site/settings', '', 3, 'Can add, delete or edit any of the system settings'),
(10, 'Site Messages', 'site/messages', '', 3, 'Can add, delete or edit any of the site messages for the system'),
(11, 'Role Access', 'site/roles', '', 3, 'Can add, delete or edit access roles including access page sections and access pages'),
(12, 'Bio/Join Form', 'site/bioform', '', 3, 'Can add to, edit or remove from the dynamic bio form including bio tabs and bio sections'),
(13, 'Specs Form', 'site/specsform', '', 3, 'Can add to, edit or remove from the dynamic specifications form including specs sections'),
(14, 'Tour Form', 'site/tourform', '', 3, 'Can add to, edit or remove from the dynamic tour form'),
(15, 'Docking Form', 'site/dockingform', '', 3, 'Can add to, edit or remove from the dynamic docking form'),
(16, 'Menus', 'site/menus', '', 3, 'Can add, delete and edit system menus'),
(17, 'System Catalogue - Ranks', 'site/catalogueranks', '', 3, 'Can add, delete and edit system ranks'),
(18, 'System Catalogue - Skins', 'site/catalogueskins', '', 3, 'Can add, delete and edit system skins'),
(19, 'Manage Sim Types', 'site/simtypes', '', 3, 'Can add, delete and edit the different sim types'),
(20, 'Specs', 'manage/specs', '', 4, 'Can update the specifications'),
(21, 'Deck Listing', 'manage/decks', '', 4, 'Can add to, edit or remove from the deck listing'),
(22, 'Manage Comments', 'manage/comments', '', 4, 'Can approve, delete and edit any comments'),
(23, 'Manage Positions', 'manage/positions', '', 4, 'Can add, delete and edit positions'),
(24, 'Manage Departments', 'manage/depts', '', 4, 'Can add, delete and edit departments'),
(25, 'Manage Ranks', 'manage/ranks', '', 4, 'Can add, delete and edit ranks'),
(26, 'Manage Awards', 'manage/awards', '', 4, 'Can add, delete and edit awards'),
(27, 'Manage Tour Items', 'manage/tour', '', 4, 'Can add, delete and edit tour items'),
(28, 'Manage Docked Items', 'manage/docked', '', 4, 'Can add, approve, delete, edit and reject docked items'),
(29, 'Manage Missions', 'manage/missions', '', 4, 'Can add, delete and edit missions'),
(30, 'Manage Mission Posts (Level 1)', 'manage/posts', '1', 4, 'Can delete and edit any of their own mission posts'),
(31, 'Manage Mission Posts (Level 2)', 'manage/posts', '2', 4, 'Can delete and edit all mission posts in the system'),
(32, 'Manage Personal Logs (Level 1)', 'manage/logs', '1', 4, 'Can delete and edit any of their own personal logs'),
(33, 'Manage Personal Logs (Level 2)', 'manage/logs', '2', 4, 'Can delete and edit all personal logs in the system'),
(34, 'Manage News Items (Level 1)', 'manage/news', '1', 4, 'Can delete and edit any of their own news items'),
(35, 'Manage News Items (Level 2)', 'manage/news', '2', 4, 'Can delete and edit all news items in the system'),
(36, 'Manage News Categories', 'manage/newscats', '', 4, 'Can manage all news categories available for news items'),
(37, 'LOA Report', 'report/loa', '', 5, 'Can view a report on LOAs taken over the life of the system'),
(38, 'System &amp; Versions', 'report/versions', '', 5, 'Can view a report on system information and all previous versions of the system'),
(39, 'Crew Activity', 'report/activity', '', 5, 'Can view a report on active crew\'s activity levels'),
(40, 'Posting Levels', 'report/posting', '', 5, 'Can view a report on posting levels for all playing characters'),
(41, 'Moderation', 'report/moderation', '', 5, 'Can view a report on the moderation status of users'),
(42, 'Milestones', 'report/milestones', '', 5, 'Can view a report on the milestones of users'),
(43, 'Award Nominations', 'report/awardnominations', '', 5, 'Can view a report on all award nominations'),
(44, 'Applications', 'report/applications', '', 5, 'Can view a report on all applications submitted through the system'),
(45, 'Sim Statistics', 'report/stats', '', 5, 'Can view a report on sim statistics for the current and previous months'),
(46, 'Character Management', 'characters/index', '', 6, 'Can manage all playing characters including accepting and rejecting applicants'),
(47, 'NPC Management (Level 1)', 'characters/npcs', '1', 6, 'Can manage any non-playing characters in their primary department (first position only)'),
(48, 'NPC Management (Level 2)', 'characters/npcs', '2', 6, 'Can manage any non-playing characters in any of their departments (first and second positions)'),
(49, 'NPC Management (Level 3)', 'characters/npcs', '3', 6, 'Can manage all non-playing characters in the system'),
(50, 'Chain of Command', 'characters/coc', '', 6, 'Can add, delete and edit the chain of command'),
(51, 'Character Bio (Level 1)', 'characters/bio', '1', 6, 'Can edit the bio of any of their own characters'),
(52, 'Character Bio (Level 2)', 'characters/bio', '2', 6, 'Can edit the bio of any of their characters as well as any NPC in the system'),
(53, 'Character Bio (Level 3)', 'characters/bio', '3', 6, 'Can edit any character in the system, including rank and position'),
(54, 'Create Character (Level 1)', 'characters/create', '1', 6, 'Can create playing and non-playing characters but playing characters require approval'),
(55, 'Create Character (Level 2)', 'characters/create', '2', 6, 'Can create playing and non-playing characters without any approval'),
(56, 'Give/Remove Award', 'characters/awards', '', 6, 'Can give/remove awards to/from any character in the system'),
(57, 'User Account (Level 1)', 'user/account', '1', 7, 'Can update their own account settings'),
(58, 'User Account (Level 2)', 'user/account', '2', 7, 'Can update any account in the system including moderation flags and admin items'),
(59, 'Crew Award Nominations (Level 1)', 'user/nominate', '1', 7, 'Can nominate playing and non-playing characters for awards'),
(60, 'Crew Award Nominations (Level 2)', 'user/nominate', '2', 7, 'Can nominate playing and non-playing characters for awards as well as approving/rejecting pending award nominations'),
(61, 'Wiki Pages (Level 1)', 'wiki/page', '1', 8, 'Can create wiki pages and edit any pages they have created, including viewing history and reverting to previous drafts'),
(62, 'Wiki Pages (Level 2)', 'wiki/page', '2', 8, 'Can create wiki pages and edit all pages, including viewing history and reverting to previous drafts'),
(63, 'Wiki Pages (Level 3)', 'wiki/page', '3', 8, 'Can create, delete and edit all wiki pages (including system pages), including viewing history and reverting to previous drafts. Level 3 permissions can bypass all access restrictions on a wiki page.'),
(64, 'Wiki Categories', 'wiki/categories', '', 8, 'Can create, delete and edit wiki categories'),
(65, 'Ban Controls', 'site/bans', '', 3, 'Can add or remove site bans'),
(66, 'Site Manifests', 'site/manifests', '', 3, 'Can create, delete and edit site manifests');

-- --------------------------------------------------------

--
-- Table structure for table `nova_access_roles`
--

CREATE TABLE `nova_access_roles` (
  `role_id` int NOT NULL,
  `role_name` varchar(255) NOT NULL DEFAULT '',
  `role_access` text,
  `role_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_access_roles`
--

INSERT INTO `nova_access_roles` (`role_id`, `role_name`, `role_access`, `role_desc`) VALUES
(1, 'System Administrator', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,31,33,35,36,37,38,39,40,41,42,43,44,45,46,49,50,53,55,56,58,60,63,64,65,66', 'System administrators can take any action in the system. Only give this access level out to people you implicitly trust.'),
(2, 'Basic Administrator', '1,2,3,4,5,6,7,8,20,21,22,27,31,33,35,37,39,40,41,42,43,44,45,46,49,53,54,58,59,63,64', 'Basic administrators have power to do some of the tasks system administrators do, but with more restrictions. This role is intended to be used for senior players on the RPG.'),
(3, 'Power User', '1,2,4,5,6,7,8,30,32,34,39,40,42,45,48,52,54,57,59,62', 'Power users are users that can take more action than a standard user. This role is intended to be used for senior players on the RPG (department heads for example).'),
(4, 'Standard User', '1,2,4,5,6,7,8,30,32,34,39,40,42,45,51,54,57,59,61', 'Standard users are generally the majority of players. This role gives them access to all the pieces they will need to play the game and use the system.'),
(5, 'Inactive User', '1,4,45,51,54,57', 'Inactive players are players that have left the RPG. Instead of being completely locked out, the player can log in and take some very limited actions.');

-- --------------------------------------------------------

--
-- Table structure for table `nova_applications`
--

CREATE TABLE `nova_applications` (
  `app_id` int NOT NULL,
  `app_email` varchar(255) NOT NULL DEFAULT '',
  `app_ip` varchar(45) NOT NULL DEFAULT '',
  `app_user` int NOT NULL,
  `app_user_name` varchar(255) NOT NULL DEFAULT '',
  `app_character` int NOT NULL,
  `app_character_name` text,
  `app_position` varchar(255) NOT NULL DEFAULT '',
  `app_date` bigint NOT NULL,
  `app_action` varchar(100) NOT NULL DEFAULT '',
  `app_message` text,
  `app_sample_post` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_awards`
--

CREATE TABLE `nova_awards` (
  `award_id` int NOT NULL,
  `award_name` varchar(255) NOT NULL DEFAULT '',
  `award_image` varchar(100) NOT NULL DEFAULT '',
  `award_order` int NOT NULL,
  `award_desc` text,
  `award_cat` enum('ic','ooc','both') NOT NULL DEFAULT 'ic',
  `award_display` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_awards_queue`
--

CREATE TABLE `nova_awards_queue` (
  `queue_id` int NOT NULL,
  `queue_receive_character` int NOT NULL DEFAULT '0',
  `queue_receive_user` int NOT NULL,
  `queue_nominate` int NOT NULL DEFAULT '0',
  `queue_award` int NOT NULL,
  `queue_reason` text,
  `queue_status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `queue_date` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_awards_received`
--

CREATE TABLE `nova_awards_received` (
  `awardrec_id` int NOT NULL,
  `awardrec_user` int NOT NULL,
  `awardrec_character` int NOT NULL DEFAULT '0',
  `awardrec_nominated_by` int NOT NULL DEFAULT '0',
  `awardrec_award` int NOT NULL,
  `awardrec_date` bigint NOT NULL,
  `awardrec_reason` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_bans`
--

CREATE TABLE `nova_bans` (
  `ban_id` int NOT NULL,
  `ban_level` int NOT NULL DEFAULT '1',
  `ban_ip` varchar(45) NOT NULL DEFAULT '',
  `ban_email` varchar(100) NOT NULL DEFAULT '',
  `ban_reason` text,
  `ban_date` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_catalogue_ranks`
--

CREATE TABLE `nova_catalogue_ranks` (
  `rankcat_id` int NOT NULL,
  `rankcat_name` varchar(100) NOT NULL DEFAULT '',
  `rankcat_location` varchar(100) NOT NULL DEFAULT '',
  `rankcat_preview` varchar(50) NOT NULL DEFAULT 'preview.png',
  `rankcat_blank` varchar(50) NOT NULL DEFAULT 'blank.png',
  `rankcat_extension` varchar(5) NOT NULL DEFAULT '.png',
  `rankcat_status` enum('active','inactive','development') NOT NULL DEFAULT 'active',
  `rankcat_credits` text,
  `rankcat_url` text,
  `rankcat_default` enum('y','n') NOT NULL DEFAULT 'n',
  `rankcat_genre` varchar(10) NOT NULL DEFAULT 'blank'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_catalogue_ranks`
--

INSERT INTO `nova_catalogue_ranks` (`rankcat_id`, `rankcat_name`, `rankcat_location`, `rankcat_preview`, `rankcat_blank`, `rankcat_extension`, `rankcat_status`, `rankcat_credits`, `rankcat_url`, `rankcat_default`, `rankcat_genre`) VALUES
(1, 'Rank Catalogue', 'default', 'preview.png', 'blank.png', '.png', 'active', 'This is a blank rank catalogue record to be used as an example of what should be included in a rank catalogue record. Please edit this record to match your ranks or remove the record altogether.', '', 'y', 'blank');

-- --------------------------------------------------------

--
-- Table structure for table `nova_catalogue_skins`
--

CREATE TABLE `nova_catalogue_skins` (
  `skin_id` int NOT NULL,
  `skin_name` varchar(100) NOT NULL DEFAULT '',
  `skin_location` varchar(100) NOT NULL DEFAULT '',
  `skin_credits` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_catalogue_skins`
--

INSERT INTO `nova_catalogue_skins` (`skin_id`, `skin_name`, `skin_location`, `skin_credits`) VALUES
(1, 'Pulsar', 'default', 'The Pulsar skin was created by Anodyne Productions. Edits are permissible as long as original credits stay intact. The Pulsar skin includes the jQuery BlockUI plugin by Malsup. More information can be found at <a href=\"http://malsup.com/jquery/block/\">http://malsup.com/jquery/block/</a>.'),
(2, 'Titan', 'titan', 'The Titan skin was created by Anodyne Productions. Edits are permissible provided the original credits remain intact.'),
(3, 'Pulsar', 'default', '  The Pulsar skin was created by Anodyne. Edits are permissible as long as original credits stay intact. The Pulsar skin includes the jQuery BlockUI plugin by Malsup. More information can be found at <a href=\"http://malsup.com/jquery/block/\">http://malsup.com/jquery/block/</a>.');

-- --------------------------------------------------------

--
-- Table structure for table `nova_catalogue_skinsecs`
--

CREATE TABLE `nova_catalogue_skinsecs` (
  `skinsec_id` int NOT NULL,
  `skinsec_section` varchar(50) NOT NULL DEFAULT '',
  `skinsec_skin` varchar(100) NOT NULL DEFAULT '',
  `skinsec_image_preview` varchar(50) NOT NULL DEFAULT '',
  `skinsec_status` enum('active','inactive','development') NOT NULL DEFAULT 'active',
  `skinsec_default` enum('y','n') NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_catalogue_skinsecs`
--

INSERT INTO `nova_catalogue_skinsecs` (`skinsec_id`, `skinsec_section`, `skinsec_skin`, `skinsec_image_preview`, `skinsec_status`, `skinsec_default`) VALUES
(1, 'main', 'default', 'preview-main.jpg', 'active', 'y'),
(2, 'admin', 'default', 'preview-admin.jpg', 'active', 'y'),
(3, 'wiki', 'default', 'preview-wiki.jpg', 'active', 'y'),
(4, 'login', 'default', 'preview-login.jpg', 'active', 'y'),
(5, 'main', 'titan', 'preview-main.jpg', 'active', 'n'),
(6, 'wiki', 'titan', 'preview-wiki.jpg', 'active', 'n'),
(7, 'login', 'titan', 'preview-login.jpg', 'active', 'n'),
(8, 'admin', 'titan', 'preview-admin.jpg', 'active', 'n'),
(9, 'main', 'default', 'preview-main.jpg', 'active', 'n'),
(10, 'login', 'default', 'preview-login.jpg', 'active', 'n'),
(11, 'wiki', 'default', 'preview-wiki.jpg', 'active', 'n'),
(12, 'admin', 'default', 'preview-admin.jpg', 'active', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters`
--

CREATE TABLE `nova_characters` (
  `charid` int NOT NULL,
  `user` int DEFAULT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `middle_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `suffix` varchar(50) NOT NULL DEFAULT '',
  `crew_type` enum('active','inactive','pending','npc') NOT NULL DEFAULT 'active',
  `date_activate` bigint DEFAULT NULL,
  `date_deactivate` bigint DEFAULT NULL,
  `images` text,
  `rank` int DEFAULT NULL,
  `position_1` int NOT NULL DEFAULT '1',
  `position_2` int DEFAULT NULL,
  `last_post` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_characters`
--

INSERT INTO `nova_characters` (`charid`, `user`, `first_name`, `middle_name`, `last_name`, `suffix`, `crew_type`, `date_activate`, `date_deactivate`, `images`, `rank`, `position_1`, `position_2`, `last_post`) VALUES
(1, 1, 'Charles', '', 'Lancaster', '', 'active', 1793935844, NULL, NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_data`
--

CREATE TABLE `nova_characters_data` (
  `data_id` bigint NOT NULL,
  `data_field` int NOT NULL,
  `data_char` int NOT NULL,
  `data_user` int DEFAULT NULL,
  `data_value` text,
  `data_updated` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_characters_data`
--

INSERT INTO `nova_characters_data` (`data_id`, `data_field`, `data_char`, `data_user`, `data_value`, `data_updated`) VALUES
(1, 1, 1, 1, '', 1793935844),
(2, 2, 1, 1, '', 1793935844),
(3, 3, 1, 1, '', 1793935844),
(4, 4, 1, 1, '', 1793935844),
(5, 5, 1, 1, '', 1793935844),
(6, 6, 1, 1, '', 1793935844),
(7, 7, 1, 1, '', 1793935844),
(8, 8, 1, 1, '', 1793935844),
(9, 9, 1, 1, '', 1793935844),
(10, 10, 1, 1, '', 1793935844),
(11, 11, 1, 1, '', 1793935844),
(12, 12, 1, 1, '', 1793935844),
(13, 13, 1, 1, '', 1793935844),
(14, 14, 1, 1, '', 1793935844),
(15, 15, 1, 1, '', 1793935844),
(16, 16, 1, 1, '', 1793935844),
(17, 17, 1, 1, '', 1793935844),
(18, 18, 1, 1, '', 1793935844),
(19, 19, 1, 1, '', 1793935844),
(20, 20, 1, 1, '', 1793935844),
(21, 21, 1, 1, '', 1793935844);

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_fields`
--

CREATE TABLE `nova_characters_fields` (
  `field_id` int NOT NULL,
  `field_type` enum('text','select','textarea') DEFAULT 'text',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `field_fid` varchar(100) NOT NULL DEFAULT '',
  `field_class` text,
  `field_label_page` text,
  `field_value` text,
  `field_order` int NOT NULL,
  `field_display` enum('y','n') NOT NULL DEFAULT 'y',
  `field_rows` int NOT NULL DEFAULT '5',
  `field_section` int NOT NULL DEFAULT '1',
  `field_help` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_characters_fields`
--

INSERT INTO `nova_characters_fields` (`field_id`, `field_type`, `field_name`, `field_fid`, `field_class`, `field_label_page`, `field_value`, `field_order`, `field_display`, `field_rows`, `field_section`, `field_help`) VALUES
(1, 'select', 'gender', 'gender', NULL, 'Gender', NULL, 1, 'y', 5, 1, NULL),
(2, 'text', 'species', 'species', '', 'Species', NULL, 2, 'y', 5, 1, NULL),
(3, 'text', 'age', 'age', 'small', 'Age', NULL, 3, 'y', 5, 1, NULL),
(4, 'text', 'height', 'height', 'medium', 'Height', NULL, 1, 'y', 5, 2, NULL),
(5, 'text', 'weight', 'weight', 'medium', 'Weight', NULL, 2, 'y', 5, 2, NULL),
(6, 'text', 'hair_color', 'hair_color', '', 'Hair Color', NULL, 3, 'y', 5, 2, NULL),
(7, 'text', 'eye_color', 'eye_color', '', 'Eye Color', NULL, 4, 'y', 5, 2, NULL),
(8, 'textarea', 'physical_desc', 'physical_desc', '', 'Physical Description', NULL, 5, 'y', 5, 2, NULL),
(9, 'textarea', 'personality', 'personality', '', 'General Overview', NULL, 0, 'y', 5, 4, NULL),
(10, 'textarea', 'strengths', 'strengths', '', 'Strengths &amp; Weaknesses', NULL, 1, 'y', 5, 4, NULL),
(11, 'textarea', 'ambitions', 'ambitions', '', 'Ambitions', NULL, 2, 'y', 5, 4, NULL),
(12, 'textarea', 'hobbies', 'hobbies', '', 'Hobbies &amp; Interests', NULL, 3, 'y', 5, 4, NULL),
(13, 'text', 'spouse', 'spouse', '', 'Spouse', NULL, 0, 'y', 5, 3, NULL),
(14, 'textarea', 'children', 'children', '', 'Children', NULL, 1, 'y', 5, 3, NULL),
(15, 'text', 'father', 'father', '', 'Father', NULL, 2, 'y', 5, 3, NULL),
(16, 'text', 'mother', 'mother', '', 'Mother', NULL, 3, 'y', 5, 3, NULL),
(17, 'textarea', 'brothers', 'brothers', '', 'Brother(s)', NULL, 4, 'y', 5, 3, NULL),
(18, 'textarea', 'sisters', 'sisters', '', 'Sister(s)', NULL, 5, 'y', 5, 3, NULL),
(19, 'textarea', 'other_family', 'other_family', '', 'Other Family', NULL, 6, 'y', 5, 3, NULL),
(20, 'textarea', 'history', 'history', '', 'Personal History', NULL, 0, 'y', 15, 5, NULL),
(21, 'textarea', 'service_record', 'service_record', '', 'Service Record', NULL, 1, 'y', 15, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_promotions`
--

CREATE TABLE `nova_characters_promotions` (
  `prom_id` bigint NOT NULL,
  `prom_user` int DEFAULT NULL,
  `prom_char` int NOT NULL,
  `prom_old_order` int NOT NULL,
  `prom_old_rank` varchar(100) NOT NULL DEFAULT '',
  `prom_new_order` int NOT NULL,
  `prom_new_rank` varchar(100) NOT NULL DEFAULT '',
  `prom_date` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_sections`
--

CREATE TABLE `nova_characters_sections` (
  `section_id` int NOT NULL,
  `section_name` varchar(255) NOT NULL DEFAULT '',
  `section_order` int NOT NULL,
  `section_tab` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_characters_sections`
--

INSERT INTO `nova_characters_sections` (`section_id`, `section_name`, `section_order`, `section_tab`) VALUES
(1, 'Character Information', 0, 1),
(2, 'Physical Appearance', 1, 1),
(3, 'Family', 2, 1),
(4, 'Personality &amp; Traits', 0, 2),
(5, '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_tabs`
--

CREATE TABLE `nova_characters_tabs` (
  `tab_id` int NOT NULL,
  `tab_order` int NOT NULL,
  `tab_name` varchar(100) NOT NULL DEFAULT '',
  `tab_link_id` varchar(50) NOT NULL DEFAULT 'one',
  `tab_display` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_characters_tabs`
--

INSERT INTO `nova_characters_tabs` (`tab_id`, `tab_order`, `tab_name`, `tab_link_id`, `tab_display`) VALUES
(1, 1, 'Basic Info', 'one', 'y'),
(2, 2, 'Personality', 'two', 'y'),
(3, 3, 'History', 'three', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_values`
--

CREATE TABLE `nova_characters_values` (
  `value_id` int NOT NULL,
  `value_field` int NOT NULL,
  `value_field_value` varchar(255) NOT NULL DEFAULT '',
  `value_selected` varchar(10) NOT NULL DEFAULT '',
  `value_content` text,
  `value_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_characters_values`
--

INSERT INTO `nova_characters_values` (`value_id`, `value_field`, `value_field_value`, `value_selected`, `value_content`, `value_order`) VALUES
(1, 1, 'Male', '', 'Male', 1),
(2, 1, 'Female', '', 'Female', 2),
(3, 1, 'Transgendered/Intersex', '', 'Transgendered/Intersex', 3),
(4, 1, 'Agendered/Non-Binary', '', 'Agendered/Non-Binary', 4);

-- --------------------------------------------------------

--
-- Table structure for table `nova_coc`
--

CREATE TABLE `nova_coc` (
  `coc_id` int NOT NULL,
  `coc_crew` int NOT NULL,
  `coc_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_coc`
--

INSERT INTO `nova_coc` (`coc_id`, `coc_crew`, `coc_order`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nova_departments`
--

CREATE TABLE `nova_departments` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(255) NOT NULL DEFAULT '',
  `dept_desc` text,
  `dept_order` int NOT NULL,
  `dept_display` enum('y','n') NOT NULL DEFAULT 'y',
  `dept_type` enum('playing','nonplaying') NOT NULL DEFAULT 'playing',
  `dept_parent` int NOT NULL DEFAULT '0',
  `dept_manifest` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_departments`
--

INSERT INTO `nova_departments` (`dept_id`, `dept_name`, `dept_desc`, `dept_order`, `dept_display`, `dept_type`, `dept_parent`, `dept_manifest`) VALUES
(1, 'Department', 'This is a blank department to be used as an example of what should be included in a department record. Please edit this record to match your sim\'s style and needs or remove the record altogether.', 0, 'y', 'playing', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking`
--

CREATE TABLE `nova_docking` (
  `docking_id` int NOT NULL,
  `docking_sim_name` varchar(255) NOT NULL DEFAULT '',
  `docking_sim_url` text,
  `docking_gm_name` varchar(255) NOT NULL DEFAULT '',
  `docking_gm_email` varchar(255) NOT NULL DEFAULT '',
  `docking_status` enum('active','inactive','pending') NOT NULL DEFAULT 'pending',
  `docking_date` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking_data`
--

CREATE TABLE `nova_docking_data` (
  `data_id` bigint NOT NULL,
  `data_docking_item` int NOT NULL,
  `data_field` int NOT NULL,
  `data_value` text,
  `data_updated` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking_fields`
--

CREATE TABLE `nova_docking_fields` (
  `field_id` int NOT NULL,
  `field_type` enum('text','select','textarea') DEFAULT 'text',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `field_fid` varchar(100) NOT NULL DEFAULT '',
  `field_class` text,
  `field_label_page` text,
  `field_value` text,
  `field_selected` varchar(20) NOT NULL DEFAULT '',
  `field_order` int NOT NULL,
  `field_display` enum('y','n') NOT NULL DEFAULT 'y',
  `field_rows` int NOT NULL DEFAULT '5',
  `field_section` int NOT NULL DEFAULT '1',
  `field_help` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking_sections`
--

CREATE TABLE `nova_docking_sections` (
  `section_id` int NOT NULL,
  `section_name` varchar(255) NOT NULL DEFAULT '',
  `section_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking_values`
--

CREATE TABLE `nova_docking_values` (
  `value_id` int NOT NULL,
  `value_field` int NOT NULL,
  `value_field_value` varchar(255) NOT NULL DEFAULT '',
  `value_selected` varchar(10) NOT NULL DEFAULT '',
  `value_content` text,
  `value_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_login_attempts`
--

CREATE TABLE `nova_login_attempts` (
  `login_id` int NOT NULL,
  `login_ip` varchar(45) NOT NULL DEFAULT '',
  `login_email` varchar(100) NOT NULL DEFAULT '',
  `login_time` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_manifests`
--

CREATE TABLE `nova_manifests` (
  `manifest_id` int NOT NULL,
  `manifest_name` varchar(255) NOT NULL DEFAULT '',
  `manifest_order` int NOT NULL,
  `manifest_desc` text,
  `manifest_header_content` text,
  `manifest_display` enum('y','n') NOT NULL DEFAULT 'y',
  `manifest_default` enum('y','n') NOT NULL DEFAULT 'n',
  `manifest_view` text,
  `manifest_metadata` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_manifests`
--

INSERT INTO `nova_manifests` (`manifest_id`, `manifest_name`, `manifest_order`, `manifest_desc`, `manifest_header_content`, `manifest_display`, `manifest_default`, `manifest_view`, `manifest_metadata`) VALUES
(1, 'Primary Manifest', 0, 'This is the primary manifest used by the sim.', 'Update your manifest header content from the manifest management page.', 'y', 'y', '$(\'tr.active\').show();,$(\'tr.npc\').show();', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nova_menu_categories`
--

CREATE TABLE `nova_menu_categories` (
  `menucat_id` int NOT NULL,
  `menucat_order` int NOT NULL DEFAULT '1',
  `menucat_menu_cat` varchar(20) NOT NULL DEFAULT '',
  `menucat_name` varchar(100) NOT NULL DEFAULT '',
  `menucat_type` enum('sub','adminsub') NOT NULL DEFAULT 'sub'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_menu_categories`
--

INSERT INTO `nova_menu_categories` (`menucat_id`, `menucat_order`, `menucat_menu_cat`, `menucat_name`, `menucat_type`) VALUES
(1, 0, 'main', 'Main', 'sub'),
(2, 1, 'personnel', 'Personnel', 'sub'),
(3, 2, 'sim', 'The Sim', 'sub'),
(4, 3, 'admin', 'Admin Control Panel', 'adminsub'),
(5, 4, 'write', 'Write', 'adminsub'),
(6, 5, 'messages', 'Private Messages', 'adminsub'),
(7, 6, 'site', 'Site Management', 'adminsub'),
(8, 7, 'manage', 'Management', 'adminsub'),
(9, 8, 'characters', 'Characters', 'adminsub'),
(10, 9, 'user', 'User', 'adminsub'),
(11, 10, 'report', 'Reports', 'adminsub'),
(12, 11, 'wiki', 'Wiki', 'sub');

-- --------------------------------------------------------

--
-- Table structure for table `nova_menu_items`
--

CREATE TABLE `nova_menu_items` (
  `menu_id` int NOT NULL,
  `menu_name` varchar(150) NOT NULL DEFAULT '',
  `menu_group` int NOT NULL,
  `menu_order` int NOT NULL,
  `menu_link` text,
  `menu_link_type` enum('onsite','offsite') NOT NULL DEFAULT 'onsite',
  `menu_need_login` enum('y','n','none') NOT NULL DEFAULT 'none',
  `menu_use_access` enum('y','n') NOT NULL DEFAULT 'n',
  `menu_access` varchar(255) NOT NULL DEFAULT '',
  `menu_access_level` int NOT NULL DEFAULT '0',
  `menu_type` enum('main','sub','adminsub') NOT NULL DEFAULT 'main',
  `menu_cat` varchar(20) NOT NULL DEFAULT '',
  `menu_display` enum('y','n') NOT NULL DEFAULT 'y',
  `menu_sim_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_menu_items`
--

INSERT INTO `nova_menu_items` (`menu_id`, `menu_name`, `menu_group`, `menu_order`, `menu_link`, `menu_link_type`, `menu_need_login`, `menu_use_access`, `menu_access`, `menu_access_level`, `menu_type`, `menu_cat`, `menu_display`, `menu_sim_type`) VALUES
(1, 'Main', 0, 0, 'main/index', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(2, 'Personnel', 0, 1, 'personnel/index', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(3, 'Sim', 0, 2, 'sim/index', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(4, 'Wiki', 0, 3, 'wiki/index', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(5, 'Search', 0, 4, 'search/index', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(6, 'Control Panel', 0, 5, 'admin/index', 'onsite', 'y', 'n', '', 0, 'main', 'main', 'y', 1),
(7, 'Log In', 0, 6, 'login/index', 'onsite', 'n', 'n', '', 0, 'main', 'main', 'y', 1),
(8, 'Log Out', 0, 7, 'login/logout', 'onsite', 'y', 'n', '', 0, 'main', 'main', 'y', 1),
(9, 'Main', 0, 0, 'main/index', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(10, 'News', 0, 1, 'main/news', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(11, 'Contact', 0, 2, 'main/contact', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(12, 'Credits', 0, 3, 'main/credits', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(13, 'Join', 0, 4, 'main/join', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(14, 'Rules', 0, 5, 'main/rules', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(15, 'Search', 0, 6, 'search/index', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(16, 'Manifest', 0, 0, 'personnel/index', 'onsite', 'none', 'n', '', 0, 'sub', 'personnel', 'y', 1),
(17, 'Chain of Command', 0, 1, 'personnel/coc', 'onsite', 'none', 'n', '', 0, 'sub', 'personnel', 'y', 1),
(18, 'Crew Awards', 0, 2, 'sim/awards', 'onsite', 'none', 'n', '', 0, 'sub', 'personnel', 'y', 1),
(19, 'Join', 0, 3, 'main/join', 'onsite', 'none', 'n', '', 0, 'sub', 'personnel', 'y', 1),
(20, 'The Sim', 0, 0, 'sim/index', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(21, 'Missions', 0, 1, 'sim/missions', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(22, 'Mission Groups', 0, 2, 'sim/missions/group', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(23, 'Personal Logs', 0, 3, 'sim/listlogs', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(24, 'Stats', 0, 4, 'sim/stats', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(25, 'Crew Awards', 0, 5, 'sim/awards', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(26, 'Tour', 1, 0, 'sim/tour', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(27, 'Specifications', 1, 1, 'sim/specs', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(28, 'Deck Listing', 1, 2, 'sim/decks', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(29, 'Departments', 1, 3, 'sim/departments', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(30, 'Docked Items', 2, 0, 'sim/docked', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'n', 3),
(31, 'Docking Request', 2, 1, 'sim/dockingrequest', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'n', 3),
(32, 'Main Page', 0, 0, 'wiki/index', 'onsite', 'none', 'n', '', 0, 'sub', 'wiki', 'y', 1),
(33, 'Recent Changes', 0, 1, 'wiki/recent', 'onsite', 'none', 'n', '', 0, 'sub', 'wiki', 'y', 1),
(34, 'Categories', 0, 2, 'wiki/categories', 'onsite', 'none', 'n', '', 0, 'sub', 'wiki', 'y', 1),
(35, 'Manage Pages', 1, 0, 'wiki/managepages', 'onsite', 'y', 'y', 'wiki/page', 0, 'sub', 'wiki', 'y', 1),
(36, 'Manage Categories', 1, 1, 'wiki/managecategories', 'onsite', 'y', 'y', 'wiki/categories', 0, 'sub', 'wiki', 'y', 1),
(37, 'Create New Page', 2, 0, 'wiki/page', 'onsite', 'y', 'y', 'wiki/page', 0, 'sub', 'wiki', 'y', 1),
(38, 'Control Panel', 0, 0, 'admin/index', 'onsite', 'none', 'y', 'admin/index', 0, 'adminsub', 'admin', 'y', 1),
(39, 'Writing Control Panel', 0, 0, 'write/index', 'onsite', 'none', 'y', 'write/index', 0, 'adminsub', 'write', 'y', 1),
(40, 'Write Mission Post', 0, 1, 'write/missionpost', 'onsite', 'none', 'y', 'write/missionpost', 0, 'adminsub', 'write', 'y', 1),
(41, 'Write Personal Log', 0, 2, 'write/personallog', 'onsite', 'none', 'y', 'write/personallog', 0, 'adminsub', 'write', 'y', 1),
(42, 'Write News Item', 0, 3, 'write/newsitem', 'onsite', 'none', 'y', 'write/newsitem', 0, 'adminsub', 'write', 'y', 1),
(43, 'Inbox', 0, 0, 'messages/index', 'onsite', 'none', 'y', 'messages/index', 0, 'adminsub', 'messages', 'y', 1),
(44, 'Sent Messages', 0, 1, 'messages/sent', 'onsite', 'none', 'y', 'messages/index', 0, 'adminsub', 'messages', 'y', 1),
(45, 'Write New Message', 0, 2, 'messages/write', 'onsite', 'none', 'y', 'messages/index', 0, 'adminsub', 'messages', 'y', 1),
(46, 'Settings', 0, 0, 'site/settings', 'onsite', 'none', 'y', 'site/settings', 0, 'adminsub', 'site', 'y', 1),
(47, 'Messages &amp; Titles', 0, 1, 'site/messages', 'onsite', 'none', 'y', 'site/messages', 0, 'adminsub', 'site', 'y', 1),
(48, 'Menu Items', 0, 2, 'site/menus', 'onsite', 'none', 'y', 'site/menus', 0, 'adminsub', 'site', 'y', 1),
(49, 'Access Roles', 0, 3, 'site/roles', 'onsite', 'none', 'y', 'site/roles', 0, 'adminsub', 'site', 'y', 1),
(50, 'Ban Controls', 0, 4, 'site/bans', 'onsite', 'none', 'y', 'site/bans', 0, 'adminsub', 'site', 'y', 1),
(51, 'Site Manifests', 0, 5, 'site/manifests', 'onsite', 'none', 'y', 'site/manifests', 0, 'adminsub', 'site', 'y', 1),
(52, 'Bio Form', 1, 0, 'site/bioform', 'onsite', 'none', 'y', 'site/bioform', 0, 'adminsub', 'site', 'y', 1),
(53, 'Specs Form', 1, 1, 'site/specsform', 'onsite', 'none', 'y', 'site/specsform', 0, 'adminsub', 'site', 'y', 1),
(54, 'Tour Form', 1, 2, 'site/tourform', 'onsite', 'none', 'y', 'site/tourform', 0, 'adminsub', 'site', 'y', 1),
(55, 'Docking Form', 1, 3, 'site/dockingform', 'onsite', 'none', 'y', 'site/dockingform', 0, 'adminsub', 'site', 'y', 3),
(56, 'Sim Types', 2, 0, 'site/simtypes', 'onsite', 'none', 'y', 'site/simtypes', 0, 'adminsub', 'site', 'y', 1),
(57, 'Rank Catalogue', 2, 1, 'site/catalogueranks', 'onsite', 'none', 'y', 'site/catalogueranks', 0, 'adminsub', 'site', 'y', 1),
(58, 'Skin Catalogue', 2, 2, 'site/catalogueskins', 'onsite', 'none', 'y', 'site/catalogueskins', 0, 'adminsub', 'site', 'y', 1),
(59, 'Awards', 0, 0, 'manage/awards', 'onsite', 'none', 'y', 'manage/awards', 0, 'adminsub', 'manage', 'y', 1),
(60, 'Departments', 0, 1, 'manage/depts', 'onsite', 'none', 'y', 'manage/depts', 0, 'adminsub', 'manage', 'y', 1),
(61, 'Positions', 0, 2, 'manage/positions', 'onsite', 'none', 'y', 'manage/positions', 0, 'adminsub', 'manage', 'y', 1),
(62, 'Ranks', 0, 3, 'manage/ranks', 'onsite', 'none', 'y', 'manage/ranks', 0, 'adminsub', 'manage', 'y', 1),
(63, 'Missions', 1, 0, 'manage/missions', 'onsite', 'none', 'y', 'manage/missions', 0, 'adminsub', 'manage', 'y', 1),
(64, 'Mission Groups', 1, 1, 'manage/missiongroups', 'onsite', 'none', 'y', 'manage/missions', 0, 'adminsub', 'manage', 'y', 1),
(65, 'Mission Posts', 1, 2, 'manage/posts', 'onsite', 'none', 'y', 'manage/posts', 0, 'adminsub', 'manage', 'y', 1),
(66, 'Personal Logs', 1, 3, 'manage/logs', 'onsite', 'none', 'y', 'manage/logs', 0, 'adminsub', 'manage', 'y', 1),
(67, 'News Items', 1, 4, 'manage/news', 'onsite', 'none', 'y', 'manage/news', 0, 'adminsub', 'manage', 'y', 1),
(68, 'News Categories', 1, 5, 'manage/newscats', 'onsite', 'none', 'y', 'manage/newscats', 0, 'adminsub', 'manage', 'y', 1),
(69, 'Comments', 1, 6, 'manage/comments', 'onsite', 'none', 'y', 'manage/comments', 0, 'adminsub', 'manage', 'y', 1),
(70, 'Specs', 2, 0, 'manage/specs', 'onsite', 'none', 'y', 'manage/specs', 0, 'adminsub', 'manage', 'y', 1),
(71, 'Tour', 2, 1, 'manage/tour', 'onsite', 'none', 'y', 'manage/tour', 0, 'adminsub', 'manage', 'y', 1),
(72, 'Deck Listing', 2, 2, 'manage/decks', 'onsite', 'none', 'y', 'manage/decks', 0, 'adminsub', 'manage', 'y', 1),
(73, 'Docked Items', 2, 3, 'manage/docked', 'onsite', 'none', 'y', 'manage/docked', 0, 'adminsub', 'manage', 'y', 3),
(74, 'Upload Images', 3, 0, 'upload/index', 'onsite', 'none', 'y', 'upload/index', 0, 'adminsub', 'manage', 'y', 1),
(75, 'Manage Uploads', 3, 1, 'upload/manage', 'onsite', 'none', 'y', 'upload/manage', 0, 'adminsub', 'manage', 'y', 1),
(76, 'All Characters', 0, 0, 'characters/index', 'onsite', 'none', 'y', 'characters/index', 0, 'adminsub', 'characters', 'y', 1),
(77, 'All NPCs', 0, 1, 'characters/npcs', 'onsite', 'none', 'y', 'characters/npcs', 0, 'adminsub', 'characters', 'y', 1),
(78, 'Create Character', 0, 2, 'characters/create', 'onsite', 'none', 'y', 'characters/create', 0, 'adminsub', 'characters', 'y', 1),
(79, 'Chain of Command', 1, 0, 'characters/coc', 'onsite', 'none', 'y', 'characters/coc', 0, 'adminsub', 'characters', 'y', 1),
(80, 'Give/Remove Awards', 1, 1, 'characters/awards', 'onsite', 'none', 'y', 'characters/awards', 0, 'adminsub', 'characters', 'y', 1),
(81, 'My Account', 0, 0, 'user/account', 'onsite', 'none', 'y', 'user/account', 0, 'adminsub', 'user', 'y', 1),
(82, 'My Bio', 0, 1, 'characters/bio', 'onsite', 'none', 'y', 'characters/bio', 0, 'adminsub', 'user', 'y', 1),
(83, 'Site Options', 1, 0, 'user/options', 'onsite', 'none', 'y', 'user/account', 0, 'adminsub', 'user', 'y', 1),
(84, 'Request LOA', 1, 1, 'user/status', 'onsite', 'none', 'y', 'user/account', 0, 'adminsub', 'user', 'y', 1),
(85, 'Award Nominations', 1, 2, 'user/nominate', 'onsite', 'none', 'y', 'user/nominate', 0, 'adminsub', 'user', 'y', 1),
(86, 'All Users', 1, 3, 'user/all', 'onsite', 'none', 'y', 'user/account', 2, 'adminsub', 'user', 'y', 1),
(87, 'Link Characters', 1, 4, 'user/characterlink', 'onsite', 'none', 'y', 'user/account', 2, 'adminsub', 'user', 'y', 1),
(88, 'Crew Activity', 0, 0, 'report/activity', 'onsite', 'none', 'y', 'report/activity', 0, 'adminsub', 'report', 'y', 1),
(89, 'Posting Levels', 0, 1, 'report/posting', 'onsite', 'none', 'y', 'report/posting', 0, 'adminsub', 'report', 'y', 1),
(90, 'Sim Statistics', 0, 2, 'report/stats', 'onsite', 'none', 'y', 'report/stats', 0, 'adminsub', 'report', 'y', 1),
(91, 'Moderation', 1, 0, 'report/moderation', 'onsite', 'none', 'y', 'report/moderation', 0, 'adminsub', 'report', 'y', 1),
(92, 'Milestones', 1, 1, 'report/milestones', 'onsite', 'none', 'y', 'report/milestones', 0, 'adminsub', 'report', 'y', 1),
(93, 'LOA Records', 1, 2, 'report/loa', 'onsite', 'none', 'y', 'report/loa', 0, 'adminsub', 'report', 'y', 1),
(94, 'Award Nominations', 1, 3, 'report/awardnominations', 'onsite', 'none', 'y', 'report/awardnominations', 0, 'adminsub', 'report', 'y', 1),
(95, 'Applications', 1, 4, 'report/applications', 'onsite', 'none', 'y', 'report/applications', 0, 'adminsub', 'report', 'y', 1),
(96, 'System &amp; Versions', 1, 5, 'report/versions', 'onsite', 'none', 'y', 'report/versions', 0, 'adminsub', 'report', 'y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nova_messages`
--

CREATE TABLE `nova_messages` (
  `message_id` int NOT NULL,
  `message_key` varchar(255) NOT NULL DEFAULT '',
  `message_label` varchar(255) NOT NULL DEFAULT '',
  `message_content` text,
  `message_type` enum('title','message','other') NOT NULL DEFAULT 'message',
  `message_protected` enum('y','n') NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_messages`
--

INSERT INTO `nova_messages` (`message_id`, `message_key`, `message_label`, `message_content`, `message_type`, `message_protected`) VALUES
(1, 'welcome_msg', 'Welcome Page Message', 'Define your welcome message and welcome page header through the Site Messages page.', 'message', 'n'),
(2, 'rules', 'Rules Message', 'Define your sim\'s rules through the Site Messages page.', 'message', 'n'),
(3, 'sim', 'Sim Message', 'Define your sim message through the Site Messages page.', 'message', 'n'),
(4, 'credits_perm', 'Permanent Credits', 'Nova has been developed on the <a href=\'http://www.codeigniter.com\' target=\'_blank\'>CodeIgniter</a> PHP framework by <a href=\'http://www.ellislab.com\' target=\'_blank\'>EllisLab</a>.\r\n\r\nIcons used throughout Nova were created by <a href=\'http://www.famfamfam.com\'>FamFamFam</a> and <a href=\'http://www.pinvoke.com\'>Pinvoke</a>.', 'message', 'y'),
(5, 'credits', 'Credits', 'Define your site credits through the Site Messages page.', 'message', 'n'),
(6, 'join_disclaimer', 'Join Disclaimer', 'Members are expected to follow the rules and regulations of both the sim and fleet at all times, both in character and out of character. By continuing, you affirm that you will sim in a proper and adequate manner. Members who choose to make ultra short posts, post very infrequently, or post posts with explicit content (above PG-13) will be removed immediately, and by continuing, you agree to this. In addition, in compliance with the Children\'s Online Privacy Protection Act of 1998 (COPPA), we do not accept players under the age of 13.  Any players found to be under the age of 13 will be immediately removed without question.  By agreeing to these terms, you are also saying that you are above the age of 13.', 'other', 'n'),
(7, 'join_instructions', 'Join Instructions', 'Define your join instructions through the Site Message page.', 'message', 'n'),
(8, 'join_post', 'Join Sample Post', 'Define your join sample post through the Site Message page.', 'other', 'n'),
(9, 'accept_message', 'User Acceptance Email', 'Define your user acceptance message through the Site Message page.', 'other', 'n'),
(10, 'reject_message', 'User Rejection Message', 'Define your user rejection message through the Site Messages page.', 'other', 'n'),
(11, 'docking_accept_message', 'Docking Acceptance Email', 'Define your docking acceptance message through the Site Message page.', 'other', 'n'),
(12, 'docking_reject_message', 'Docking Rejection Message', 'Define your docking rejection message through the Site Messages page.', 'other', 'n'),
(13, 'contact', 'Contact Instructions', '', 'message', 'n'),
(14, 'welcome_head', 'Welcome Header', 'Welcome to the DEADSTICK Logistics!', 'title', 'n'),
(15, 'main_credits_title', 'Site Credits Header', 'Site Credits', 'title', 'n'),
(16, 'main_join_title', 'Join Page Header', 'Join', 'title', 'n'),
(17, 'policy-privacy', 'Privacy Policy', 'The #sim_name# (\"Service\" or \"We\") collects and uses personal information solely for the purpose of providing an online collaborative writing environment. Where feasible, We collect personal information only with the knowledge and consent of the individual concerned (\"Individual\"), and, if the Individual notifies us that they wish to revoke their consent, We will make a best effort to remove all personal information related to the Individual from our Service.\n\nThis Privacy Policy, along with our Cookie Policy, Do Not Track Policy, and Your California Privacy Rights page, define in full how the Service collects, manages and processes an Individual\'s personal information.\n\nWHAT INFORMATION IS COLLECTED?\n\n\"Required Member Information\": When an Individual signs up for the Service (becoming a \"Member\"), We collect the Member\'s name, age, email address, language and timezone.\n\n\"Optional Member Information\": We allow a Member, at their discretion, to provide additional contact information, a geographic location, interests and a biography.\n\n\"Access Logs\": When an Individual visits the Service, We collect incidental personal information in the Service\'s logs including the Individual\'s IP address and user agent.\n\nHOW IS INFORMATION COLLECTED?\n\nRequired Member Information and Optional Member Information are collected with an Individual\'s consent when the Individual signs up for the Service or edits their account within the Service. In order to participate in the Service, a Member must provide all Required Member Information. A Member may provide a pseudonym instead of their real name, if they do not wish to disclose their real name.\n\nAccess Logs are collected by our web server and web application when an Individual uses the Service.\n\nWHY IS INFORMATION COLLECTED?\n\nRequired Member Information is collected in order to allow a Member to participate in the Service. A Member\'s name, email address and timezone are listed on their profile. A Member\'s email address will also be used to contact the Member and to send the Member story posts and other content directly related to the Service. A Member\'s age is only used to confirm the Member meets the legal requirements to participate in this Service.\n\nOptional Member Information is collected in order to allow a Member to share more details about themselves to other Members of the service.\n\nAccess Logs are collected for diagnosing technical problems with our Service. In rare situations, We may also use Access Logs to ban an Individual found to be acting inappropriately with the Service, including, but not limited to, violating the rules of the Service, placing an undue burden on the Service or violating applicable laws (\"Inappropriate Use\").\n\nWITH WHOM IS INFORMATION SHARED?\n\nA Member\'s name, email address, timezone and Optional Member Information are shared with other Members of the Service through the Member\'s user profile.\n\nA Member\'s name, age, email address, timezone and Optional Member Information may also be shared with any applicable parent organization to which the Service belongs.\n\nAccess Logs are generally not shared, although they may in rare circumstances be shared with any applicable parent organization to which the Service belongs or the #hosting_company# (\"Host\") to diagnose technical problems or when an Individual is reasonably believed to have committed Inappropriate Use of the Service.\n\nThe Service or the Host may share personal information with relevant law enforcement authorities as required to comply with applicable laws. The Service will notify the Individual, if permitted by applicable laws, when this occurs.\n\nThe Service will not share any personal information with any other parties without the Individual\'s consent.\n\nHOW IS INFORMATION PROTECTED?\n\nWe protect all personal information using reasonable security safeguards against loss or theft, as well as unauthorized access, disclosure, copying, use or modification. We are committed to managing the Service in accordance with these principles in order to ensure that the confidentiality of personal information is protected and maintained.\n\nUpon request from an Individual, we will make readily available information about our practices and policies relating to the management of personal data.\n\nHOW LONG IS INFORMATION RETAINED?\n\nRequired Member Information and Optional Member Information is retained as long as the Individual remains a Member of the Service.\n\nAccess Logs are retained for #access_log_purge#.\n\nHOW CAN INFORMATION BE REMOVED?\n\nAn Member may submit a request to <strong>#admin_email#</strong> to have their account deleted and all Required Member Information and Optional Member Information removed from the Service. This will cause them to no longer be a Member.\n\nThe Service cannot ensure that other Members do not personally retain Required Member Information or Optional Member Information shared to these other Members through the Service as described in this Policy.\n\nThe Service routinely deletes all Access Logs, so an Individual does not need to request its removal explicitly.', 'message', 'n'),
(18, 'policy-cookie', 'Cookie Policy', 'The #sim_name# (\"Service\" or \"We\") uses cookies solely for the purpose of providing an online collaborative writing environment.\n\nCookies are small pieces of text sent back and forth between your web browser and a website you visit. A cookie file is stored in your web browser and allows the Service to recognize you and make your next visit easier and the Service more useful to you. Cookies can be \"persistent\" or \"session\" cookies.\n\nWhen an Individual accesses or uses the Service, the Service may place a number of cookies in the Individual\'s web browser. We use both session and persistent cookies. Specifically, We use cookies to authenticate Individuals and prevent fraudulent use of accounts, and We use cookies to remember an Individual\'s email address when prompting the Individual to log in again.', 'message', 'n'),
(19, 'policy-do-not-track', 'Do Not Track Policy', 'The #sim_name# (\"Service\" or \"We\") does not track Individuals over time to provide targeted advertising and therefore does not respond to Do Not Track (\"DNT\") signals.', 'message', 'n'),
(20, 'policy-california', 'California Privacy Rights Policy', 'If you are a California resident, California Civil Code Section 1798.83 permits you to request information regarding the disclosure of your personal information by #sim_name# to third parties for the third parties\' direct marketing purposes. To make such a request, please email <strong>#admin_email#</strong>.', 'message', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `nova_missions`
--

CREATE TABLE `nova_missions` (
  `mission_id` int NOT NULL,
  `mission_title` varchar(255) NOT NULL DEFAULT '',
  `mission_images` text,
  `mission_order` int NOT NULL,
  `mission_group` int DEFAULT NULL,
  `mission_status` enum('upcoming','current','completed') NOT NULL DEFAULT 'upcoming',
  `mission_start` bigint DEFAULT NULL,
  `mission_end` bigint DEFAULT NULL,
  `mission_desc` text,
  `mission_summary` text,
  `mission_notes` text,
  `mission_notes_updated` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_mission_groups`
--

CREATE TABLE `nova_mission_groups` (
  `misgroup_id` int NOT NULL,
  `misgroup_name` varchar(255) NOT NULL DEFAULT '',
  `misgroup_order` int NOT NULL,
  `misgroup_desc` text,
  `misgroup_parent` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_news`
--

CREATE TABLE `nova_news` (
  `news_id` int NOT NULL,
  `news_title` varchar(255) NOT NULL DEFAULT '',
  `news_author_user` int NOT NULL,
  `news_author_character` int NOT NULL,
  `news_cat` int NOT NULL,
  `news_date` bigint NOT NULL,
  `news_content` longtext,
  `news_status` enum('activated','saved','pending') NOT NULL DEFAULT 'activated',
  `news_private` enum('y','n') NOT NULL DEFAULT 'n',
  `news_tags` text,
  `news_last_update` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_news_categories`
--

CREATE TABLE `nova_news_categories` (
  `newscat_id` int NOT NULL,
  `newscat_name` varchar(255) NOT NULL DEFAULT '',
  `newscat_display` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_news_categories`
--

INSERT INTO `nova_news_categories` (`newscat_id`, `newscat_name`, `newscat_display`) VALUES
(1, 'General News', 'y'),
(2, 'Out of Character', 'y'),
(3, 'Sim Announcement', 'y'),
(4, 'Website Update', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `nova_news_comments`
--

CREATE TABLE `nova_news_comments` (
  `ncomment_id` int NOT NULL,
  `ncomment_author_user` int NOT NULL,
  `ncomment_author_character` int NOT NULL,
  `ncomment_news` int NOT NULL,
  `ncomment_content` text,
  `ncomment_date` bigint NOT NULL,
  `ncomment_status` enum('activated','pending') NOT NULL DEFAULT 'activated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_personallogs`
--

CREATE TABLE `nova_personallogs` (
  `log_id` int NOT NULL,
  `log_title` varchar(255) NOT NULL DEFAULT '',
  `log_author_user` int NOT NULL,
  `log_author_character` int NOT NULL,
  `log_content` longtext,
  `log_date` bigint NOT NULL,
  `log_status` enum('activated','saved','pending') NOT NULL DEFAULT 'activated',
  `log_tags` text,
  `log_last_update` bigint NOT NULL DEFAULT '0',
  `log_words` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_personallogs_comments`
--

CREATE TABLE `nova_personallogs_comments` (
  `lcomment_id` int NOT NULL,
  `lcomment_author_user` int NOT NULL,
  `lcomment_author_character` int NOT NULL,
  `lcomment_log` int NOT NULL,
  `lcomment_content` text,
  `lcomment_date` bigint NOT NULL,
  `lcomment_status` enum('activated','pending') NOT NULL DEFAULT 'activated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_positions`
--

CREATE TABLE `nova_positions` (
  `pos_id` int NOT NULL,
  `pos_name` varchar(255) NOT NULL DEFAULT '',
  `pos_desc` text,
  `pos_dept` int NOT NULL,
  `pos_order` int NOT NULL,
  `pos_open` int NOT NULL,
  `pos_display` enum('y','n') NOT NULL DEFAULT 'y',
  `pos_type` enum('senior','officer','enlisted','other') NOT NULL DEFAULT 'officer',
  `pos_top_open` enum('y','n') NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_positions`
--

INSERT INTO `nova_positions` (`pos_id`, `pos_name`, `pos_desc`, `pos_dept`, `pos_order`, `pos_open`, `pos_display`, `pos_type`, `pos_top_open`) VALUES
(1, 'Position', 'This is a blank position to be used as an example of what should be included in a position record. Please edit this record to match your sim\'s style and needs or remove the record altogether.', 1, 0, 1, 'y', 'senior', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `nova_posts`
--

CREATE TABLE `nova_posts` (
  `post_id` int NOT NULL,
  `post_title` varchar(255) NOT NULL DEFAULT '',
  `post_location` varchar(255) NOT NULL DEFAULT '',
  `post_timeline` varchar(255) NOT NULL DEFAULT '',
  `post_date` bigint NOT NULL,
  `post_authors` text,
  `post_authors_users` text,
  `post_mission` int NOT NULL,
  `post_saved` int DEFAULT NULL,
  `post_status` enum('activated','saved','pending') NOT NULL DEFAULT 'activated',
  `post_content` longtext,
  `post_tags` text,
  `post_last_update` bigint NOT NULL DEFAULT '0',
  `post_participants` text,
  `post_lock_user` int DEFAULT NULL,
  `post_lock_date` bigint DEFAULT NULL,
  `post_words` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_posts_comments`
--

CREATE TABLE `nova_posts_comments` (
  `pcomment_id` int NOT NULL,
  `pcomment_author_user` int NOT NULL,
  `pcomment_author_character` int NOT NULL,
  `pcomment_post` int NOT NULL,
  `pcomment_content` text,
  `pcomment_date` bigint NOT NULL,
  `pcomment_status` enum('activated','pending') NOT NULL DEFAULT 'activated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_privmsgs`
--

CREATE TABLE `nova_privmsgs` (
  `privmsgs_id` bigint NOT NULL,
  `privmsgs_author_user` int NOT NULL,
  `privmsgs_author_character` int NOT NULL,
  `privmsgs_date` bigint NOT NULL,
  `privmsgs_subject` varchar(255) NOT NULL DEFAULT '',
  `privmsgs_content` text,
  `privmsgs_author_display` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_privmsgs_to`
--

CREATE TABLE `nova_privmsgs_to` (
  `pmto_id` bigint NOT NULL,
  `pmto_message` bigint NOT NULL,
  `pmto_recipient_user` int NOT NULL,
  `pmto_recipient_character` int NOT NULL,
  `pmto_unread` enum('y','n') NOT NULL DEFAULT 'y',
  `pmto_display` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_ranks`
--

CREATE TABLE `nova_ranks` (
  `rank_id` int NOT NULL,
  `rank_name` varchar(100) NOT NULL DEFAULT '',
  `rank_short_name` varchar(20) NOT NULL DEFAULT '',
  `rank_image` varchar(100) NOT NULL DEFAULT '',
  `rank_order` int NOT NULL,
  `rank_display` enum('y','n') NOT NULL DEFAULT 'y',
  `rank_class` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_ranks`
--

INSERT INTO `nova_ranks` (`rank_id`, `rank_name`, `rank_short_name`, `rank_image`, `rank_order`, `rank_display`, `rank_class`) VALUES
(1, 'Blank', 'BLANK', '', 0, 'y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nova_security_questions`
--

CREATE TABLE `nova_security_questions` (
  `question_id` int NOT NULL,
  `question_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_security_questions`
--

INSERT INTO `nova_security_questions` (`question_id`, `question_value`) VALUES
(1, 'What is your father\'s middle name?'),
(2, 'What was the name of your first pet?'),
(3, 'What city were you born in?'),
(4, 'What is your favorite animal?'),
(5, 'Who was your favorite teacher?'),
(6, 'What is the last book you read?');

-- --------------------------------------------------------

--
-- Table structure for table `nova_sessions`
--

CREATE TABLE `nova_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_settings`
--

CREATE TABLE `nova_settings` (
  `setting_id` int NOT NULL,
  `setting_key` varchar(100) NOT NULL DEFAULT '',
  `setting_value` text,
  `setting_label` varchar(255) NOT NULL DEFAULT '',
  `setting_user_created` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_settings`
--

INSERT INTO `nova_settings` (`setting_id`, `setting_key`, `setting_value`, `setting_label`, `setting_user_created`) VALUES
(1, 'sim_name', 'DEADSTICK Logistics', '', 'n'),
(2, 'sim_year', '', '', 'n'),
(3, 'sim_type', '2', '', 'n'),
(4, 'maintenance', 'off', '', 'n'),
(5, 'skin_main', 'default', '', 'n'),
(6, 'skin_admin', 'default', '', 'n'),
(7, 'skin_wiki', 'default', '', 'n'),
(8, 'skin_login', 'default', '', 'n'),
(9, 'display_rank', 'default', '', 'n'),
(10, 'bio_num_awards', '10', '', 'n'),
(11, 'allowed_chars_playing', '1', '', 'n'),
(12, 'allowed_chars_npc', '3', '', 'n'),
(13, 'system_email', 'on', '', 'n'),
(14, 'email_subject', '[DEADSTICK Logistics]', '', 'n'),
(15, 'timezone', 'UTC', '', 'n'),
(16, 'daylight_savings', 'FALSE', '', 'n'),
(17, 'date_format', '%l %F %j%S, %Y @ %g:%i%a', '', 'n'),
(18, 'list_logs_num', '25', '', 'n'),
(19, 'list_posts_num', '25', '', 'n'),
(20, 'list_news_num', '25', '', 'n'),
(21, 'manifest_defaults', '$(\'tr.active\').show();,$(\'tr.npc\').show();', '', 'n'),
(22, 'updates', 'none', '', 'n'),
(23, 'show_news', 'y', '', 'n'),
(24, 'show_logs', 'y', '', 'n'),
(25, 'show_posts', 'y', '', 'n'),
(26, 'post_count_format', 'multiple', '', 'n'),
(27, 'use_sample_post', 'y', '', 'n'),
(28, 'default_email_name', '', '', 'n'),
(29, 'default_email_address', '', '', 'n'),
(30, 'use_mission_notes', 'y', '', 'n'),
(31, 'online_timespan', '5', '', 'n'),
(32, 'posting_requirement', '14', '', 'n'),
(33, 'use_post_participants', 'y', '', 'n'),
(34, 'hosting_company', '', '', 'n'),
(35, 'access_log_purge', '24 hours', '', 'n'),
(36, 'contact_form_enabled', 'y', '', 'n'),
(37, 'show_logs_preview', 'y', '', 'n'),
(38, 'show_posts_preview', 'y', '', 'n'),
(39, 'show_news_preview', 'y', '', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `nova_sim_type`
--

CREATE TABLE `nova_sim_type` (
  `simtype_id` int NOT NULL,
  `simtype_name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_sim_type`
--

INSERT INTO `nova_sim_type` (`simtype_id`, `simtype_name`) VALUES
(1, 'all'),
(2, 'ship'),
(3, 'base'),
(4, 'colony'),
(5, 'unit'),
(6, 'realm'),
(7, 'planet'),
(8, 'organization');

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs`
--

CREATE TABLE `nova_specs` (
  `specs_id` int NOT NULL,
  `specs_name` varchar(255) NOT NULL DEFAULT '',
  `specs_order` int NOT NULL,
  `specs_display` enum('y','n') NOT NULL DEFAULT 'y',
  `specs_images` text,
  `specs_summary` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs_data`
--

CREATE TABLE `nova_specs_data` (
  `data_id` bigint NOT NULL,
  `data_item` int NOT NULL,
  `data_field` int NOT NULL,
  `data_value` text,
  `data_updated` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs_fields`
--

CREATE TABLE `nova_specs_fields` (
  `field_id` int NOT NULL,
  `field_type` enum('text','select','textarea') DEFAULT 'text',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `field_fid` varchar(100) NOT NULL DEFAULT '',
  `field_class` text,
  `field_label_page` text,
  `field_value` text,
  `field_selected` varchar(20) NOT NULL DEFAULT '',
  `field_order` int NOT NULL,
  `field_display` enum('y','n') NOT NULL DEFAULT 'y',
  `field_rows` int NOT NULL DEFAULT '5',
  `field_section` int NOT NULL DEFAULT '1',
  `field_help` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_specs_fields`
--

INSERT INTO `nova_specs_fields` (`field_id`, `field_type`, `field_name`, `field_fid`, `field_class`, `field_label_page`, `field_value`, `field_selected`, `field_order`, `field_display`, `field_rows`, `field_section`, `field_help`) VALUES
(1, 'text', 'class', 'class', '', 'Class', NULL, '', 0, 'y', 5, 1, NULL),
(2, 'text', 'role', 'role', '', 'Role', NULL, '', 1, 'y', 5, 1, NULL),
(3, 'text', 'duration', 'duration', '', 'Duration', NULL, '', 2, 'y', 5, 1, NULL),
(4, 'text', 'refit', 'refit', '', 'Time Between Refits', NULL, '', 3, 'y', 5, 1, NULL),
(5, 'text', 'resupply', 'resupply', '', 'Time Between Resupply', NULL, '', 4, 'y', 5, 1, NULL),
(6, 'text', 'length', 'length', '', 'Length', NULL, '', 0, 'y', 5, 2, NULL),
(7, 'text', 'width', 'width', '', 'Width', NULL, '', 1, 'y', 5, 2, NULL),
(8, 'text', 'height', 'height', '', 'Height', NULL, '', 2, 'y', 5, 2, NULL),
(9, 'text', 'decks', 'decks', 'medium', 'Decks', NULL, '', 3, 'y', 5, 2, NULL),
(10, 'text', 'compliment_officers', 'compliment_officers', 'medium', 'Officers', NULL, '', 0, 'y', 5, 3, NULL),
(11, 'text', 'compliment_enlisted', 'compliment_enlisted', 'medium', 'Enlisted Crew', NULL, '', 1, 'y', 5, 3, NULL),
(12, 'text', 'compliment_marines', 'compliment_marines', 'medium', 'Marines', NULL, '', 2, 'y', 5, 3, NULL),
(13, 'text', 'compliment_civilians', 'compliment_civilians', 'medium', 'Civilians', NULL, '', 3, 'y', 5, 3, NULL),
(14, 'text', 'compliment_emergency', 'compliment_emergency', 'medium', 'Emergency Capacity', NULL, '', 4, 'y', 5, 3, NULL),
(15, 'text', 'speed_normal', 'speed_normal', 'medium', 'Cruise Speed', NULL, '', 0, 'y', 5, 4, NULL),
(16, 'text', 'speed_max', 'speed_max', 'medium', 'Maximum Speed', NULL, '', 1, 'y', 5, 4, NULL),
(17, 'text', 'speed_emergency', 'speed_emergency', 'medium', 'Emergency Speed', NULL, '', 2, 'y', 5, 4, NULL),
(18, 'textarea', 'defensive', 'defensive', '', 'Shields', NULL, '', 0, 'y', 5, 5, NULL),
(19, 'textarea', 'weapons', 'weapons', '', 'Weapon Systems', NULL, '', 1, 'y', 5, 5, NULL),
(20, 'textarea', 'armament', 'armament', '', 'Armament', NULL, '', 2, 'y', 5, 5, NULL),
(21, 'text', 'shuttlebays', 'shuttlebays', 'small', 'Shuttlebays', NULL, '', 0, 'y', 5, 6, NULL),
(22, 'textarea', 'shuttles', 'shuttles', '', 'Shuttles', NULL, '', 1, 'y', 5, 6, NULL),
(23, 'textarea', 'fighters', 'fighters', '', 'Fighters', NULL, '', 2, 'y', 5, 6, NULL),
(24, 'textarea', 'runabouts', 'runabouts', '', 'Runabouts', NULL, '', 3, 'y', 5, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs_sections`
--

CREATE TABLE `nova_specs_sections` (
  `section_id` int NOT NULL,
  `section_name` varchar(255) NOT NULL DEFAULT '',
  `section_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_specs_sections`
--

INSERT INTO `nova_specs_sections` (`section_id`, `section_name`, `section_order`) VALUES
(1, 'General', 0),
(2, 'Dimensions', 1),
(3, 'Personnel', 2),
(4, 'Speed', 3),
(5, 'Weapons &amp; Defensive Systems', 4),
(6, 'Auxiliary Craft', 5);

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs_values`
--

CREATE TABLE `nova_specs_values` (
  `value_id` int NOT NULL,
  `value_field` int NOT NULL,
  `value_type` enum('option') NOT NULL DEFAULT 'option',
  `value_field_value` varchar(255) NOT NULL DEFAULT '',
  `value_selected` varchar(10) NOT NULL DEFAULT '',
  `value_content` text,
  `value_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_system_info`
--

CREATE TABLE `nova_system_info` (
  `sys_id` int NOT NULL,
  `sys_uid` varchar(32) NOT NULL DEFAULT '',
  `sys_install_date` bigint NOT NULL,
  `sys_last_update` bigint DEFAULT NULL,
  `sys_version_major` int NOT NULL,
  `sys_version_minor` int NOT NULL,
  `sys_version_update` int NOT NULL,
  `sys_version_ignore` varchar(20) NOT NULL DEFAULT '',
  `sys_anodyne_game_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_system_info`
--

INSERT INTO `nova_system_info` (`sys_id`, `sys_uid`, `sys_install_date`, `sys_last_update`, `sys_version_major`, `sys_version_minor`, `sys_version_update`, `sys_version_ignore`, `sys_anodyne_game_id`) VALUES
(1, 'auvmqyO1oTA6kVQ49ldSsJjUYrwDxch2', 1793935805, NULL, 2, 7, 19, '', 'game_b10d9fc1b31640e48ed309199f8bbf96');

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour`
--

CREATE TABLE `nova_tour` (
  `tour_id` int NOT NULL,
  `tour_name` varchar(255) NOT NULL DEFAULT '',
  `tour_order` int NOT NULL,
  `tour_display` enum('y','n') NOT NULL DEFAULT 'y',
  `tour_images` text,
  `tour_summary` text,
  `tour_spec_item` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour_data`
--

CREATE TABLE `nova_tour_data` (
  `data_id` bigint NOT NULL,
  `data_tour_item` int NOT NULL,
  `data_field` int NOT NULL,
  `data_value` text,
  `data_updated` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour_decks`
--

CREATE TABLE `nova_tour_decks` (
  `deck_id` int NOT NULL,
  `deck_name` varchar(255) NOT NULL DEFAULT '',
  `deck_order` int NOT NULL,
  `deck_content` text,
  `deck_item` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour_fields`
--

CREATE TABLE `nova_tour_fields` (
  `field_id` int NOT NULL,
  `field_type` enum('text','select','textarea') DEFAULT 'text',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `field_fid` varchar(100) NOT NULL DEFAULT '',
  `field_class` text,
  `field_label_page` text,
  `field_value` text,
  `field_selected` varchar(20) NOT NULL DEFAULT '',
  `field_order` int NOT NULL,
  `field_display` enum('y','n') NOT NULL DEFAULT 'y',
  `field_rows` int NOT NULL DEFAULT '5',
  `field_help` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_tour_fields`
--

INSERT INTO `nova_tour_fields` (`field_id`, `field_type`, `field_name`, `field_fid`, `field_class`, `field_label_page`, `field_value`, `field_selected`, `field_order`, `field_display`, `field_rows`, `field_help`) VALUES
(1, 'text', 'location', 'location', '', 'Location', NULL, '', 0, 'y', 5, NULL),
(2, 'textarea', 'long_desc', 'long_desc', '', 'Description', NULL, '', 1, 'y', 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour_values`
--

CREATE TABLE `nova_tour_values` (
  `value_id` int NOT NULL,
  `value_field` int NOT NULL,
  `value_field_value` varchar(255) NOT NULL DEFAULT '',
  `value_selected` varchar(10) NOT NULL DEFAULT '',
  `value_content` text,
  `value_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_uploads`
--

CREATE TABLE `nova_uploads` (
  `upload_id` bigint NOT NULL,
  `upload_filename` text,
  `upload_mime_type` varchar(255) NOT NULL DEFAULT '',
  `upload_resource_type` varchar(100) NOT NULL DEFAULT '',
  `upload_user` int NOT NULL,
  `upload_ip` varchar(45) NOT NULL DEFAULT '',
  `upload_date` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_users`
--

CREATE TABLE `nova_users` (
  `userid` int NOT NULL,
  `status` enum('active','inactive','pending') NOT NULL DEFAULT 'active',
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `date_of_birth` varchar(50) NOT NULL DEFAULT '',
  `instant_message` text,
  `main_char` int DEFAULT NULL,
  `access_role` int DEFAULT NULL,
  `is_sysadmin` enum('y','n') NOT NULL DEFAULT 'n',
  `is_game_master` enum('y','n') NOT NULL DEFAULT 'n',
  `is_webmaster` enum('y','n') NOT NULL DEFAULT 'n',
  `is_firstlaunch` enum('y','n') NOT NULL DEFAULT 'y',
  `timezone` varchar(5) NOT NULL DEFAULT 'UTC',
  `daylight_savings` varchar(1) NOT NULL DEFAULT '0',
  `language` varchar(50) NOT NULL DEFAULT 'english',
  `join_date` bigint DEFAULT NULL,
  `leave_date` bigint DEFAULT NULL,
  `last_post` bigint DEFAULT NULL,
  `last_login` bigint DEFAULT NULL,
  `loa` enum('active','loa','eloa') NOT NULL DEFAULT 'active',
  `display_rank` varchar(100) NOT NULL DEFAULT 'default',
  `skin_main` varchar(100) NOT NULL DEFAULT 'default',
  `skin_wiki` varchar(100) NOT NULL DEFAULT 'default',
  `skin_admin` varchar(100) NOT NULL DEFAULT 'default',
  `location` text,
  `interests` text,
  `bio` text,
  `security_question` int NOT NULL DEFAULT '1',
  `security_answer` varchar(40) NOT NULL DEFAULT '',
  `password_reset` int NOT NULL DEFAULT '0',
  `moderate_posts` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_logs` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_news` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_post_comments` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_log_comments` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_news_comments` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_wiki_comments` enum('y','n') NOT NULL DEFAULT 'n',
  `my_links` text,
  `last_update` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_users`
--

INSERT INTO `nova_users` (`userid`, `status`, `name`, `email`, `password`, `date_of_birth`, `instant_message`, `main_char`, `access_role`, `is_sysadmin`, `is_game_master`, `is_webmaster`, `is_firstlaunch`, `timezone`, `daylight_savings`, `language`, `join_date`, `leave_date`, `last_post`, `last_login`, `loa`, `display_rank`, `skin_main`, `skin_wiki`, `skin_admin`, `location`, `interests`, `bio`, `security_question`, `security_answer`, `password_reset`, `moderate_posts`, `moderate_logs`, `moderate_news`, `moderate_post_comments`, `moderate_log_comments`, `moderate_news_comments`, `moderate_wiki_comments`, `my_links`, `last_update`) VALUES
(1, 'active', 'cmdrlanc', 'cmdrlanc@gmail.com', '06bff3cc632ade1b5792195e472769a83e66e77f', '', NULL, 1, 1, 'y', 'y', 'y', 'y', 'UTC', '0', 'english', 1793935844, NULL, NULL, NULL, 'active', 'default', 'default', 'default', 'default', NULL, NULL, NULL, 1, 'b7f73c5b66dca06b94aa7a7134c24e0159e1dd0a', 0, 'n', 'n', 'n', 'n', 'n', 'n', 'n', '84', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nova_user_loa`
--

CREATE TABLE `nova_user_loa` (
  `loa_id` int NOT NULL,
  `loa_user` int NOT NULL,
  `loa_start_date` bigint DEFAULT NULL,
  `loa_end_date` bigint DEFAULT NULL,
  `loa_duration` text,
  `loa_reason` text,
  `loa_type` enum('active','loa','eloa') NOT NULL DEFAULT 'loa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_user_prefs`
--

CREATE TABLE `nova_user_prefs` (
  `pref_id` int NOT NULL,
  `pref_key` varchar(100) NOT NULL DEFAULT '',
  `pref_label` varchar(255) NOT NULL DEFAULT '',
  `pref_default` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_user_prefs`
--

INSERT INTO `nova_user_prefs` (`pref_id`, `pref_key`, `pref_label`, `pref_default`) VALUES
(1, 'email_new_news_comments', 'Email News Comments', 'y'),
(2, 'email_new_log_comments', 'Email Log Comments', 'y'),
(3, 'email_new_post_comments', 'Email Post Comments', 'y'),
(4, 'email_new_wiki_comments', 'Email Wiki Comments', 'y'),
(5, 'email_private_message', 'Email Private Messages', 'y'),
(6, 'email_personal_logs', 'Email Personal Logs', 'y'),
(7, 'email_news_items', 'Email News Items', 'y'),
(8, 'email_mission_posts', 'Email Mission Posts', 'y'),
(9, 'email_mission_posts_save', 'Email Mission Post Saved Notifications', 'y'),
(10, 'email_mission_posts_delete', 'Email Mission Post Delete Notifications', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `nova_user_prefs_values`
--

CREATE TABLE `nova_user_prefs_values` (
  `prefvalue_id` int NOT NULL,
  `prefvalue_user` int NOT NULL,
  `prefvalue_key` varchar(100) NOT NULL DEFAULT '',
  `prefvalue_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_user_prefs_values`
--

INSERT INTO `nova_user_prefs_values` (`prefvalue_id`, `prefvalue_user`, `prefvalue_key`, `prefvalue_value`) VALUES
(1, 1, 'email_new_news_comments', 'y'),
(2, 1, 'email_new_log_comments', 'y'),
(3, 1, 'email_new_post_comments', 'y'),
(4, 1, 'email_new_wiki_comments', 'y'),
(5, 1, 'email_private_message', 'y'),
(6, 1, 'email_personal_logs', 'y'),
(7, 1, 'email_news_items', 'y'),
(8, 1, 'email_mission_posts', 'y'),
(9, 1, 'email_mission_posts_save', 'y'),
(10, 1, 'email_mission_posts_delete', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_categories`
--

CREATE TABLE `nova_wiki_categories` (
  `wikicat_id` int NOT NULL,
  `wikicat_name` varchar(100) NOT NULL DEFAULT '',
  `wikicat_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_comments`
--

CREATE TABLE `nova_wiki_comments` (
  `wcomment_id` int NOT NULL,
  `wcomment_author_user` int NOT NULL,
  `wcomment_author_character` int NOT NULL,
  `wcomment_page` int NOT NULL,
  `wcomment_date` bigint NOT NULL,
  `wcomment_content` text,
  `wcomment_status` enum('activated','pending') NOT NULL DEFAULT 'activated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_drafts`
--

CREATE TABLE `nova_wiki_drafts` (
  `draft_id` int NOT NULL,
  `draft_id_old` int DEFAULT NULL,
  `draft_title` varchar(255) NOT NULL DEFAULT '',
  `draft_author_user` int NOT NULL,
  `draft_author_character` int NOT NULL,
  `draft_summary` text,
  `draft_content` longtext,
  `draft_page` int NOT NULL,
  `draft_created_at` bigint NOT NULL,
  `draft_categories` text,
  `draft_changed_comments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_wiki_drafts`
--

INSERT INTO `nova_wiki_drafts` (`draft_id`, `draft_id_old`, `draft_title`, `draft_author_user`, `draft_author_character`, `draft_summary`, `draft_content`, `draft_page`, `draft_created_at`, `draft_categories`, `draft_changed_comments`) VALUES
(1, NULL, 'Welcome to Thresher', 0, 0, 'This is the main wiki system page.', '<p>Welcome to Thresher R2. Thresher is Nova\'s built-in mini-wiki to help your RPG collaborate and share information easily. You can change this message by editing the system page from the Wiki Page Management page.</p>', 1, 1793935805, NULL, NULL),
(2, NULL, 'Create Wiki Page', 0, 0, '', '', 2, 1793935805, NULL, NULL),
(3, NULL, 'Edit Wiki Page', 0, 0, '', '', 3, 1793935805, NULL, NULL),
(4, NULL, 'Wiki Categories', 0, 0, 'Categories in Thresher allow pages to be broken up in to different subject matters and categorized in a way that makes sense. Below is the complete list of categories. Clicking on one of the categories will show all pages associated with that category.', '', 4, 1793935805, NULL, NULL),
(5, NULL, 'Wiki Category Page', 0, 0, '', '', 5, 1793935805, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_pages`
--

CREATE TABLE `nova_wiki_pages` (
  `page_id` int NOT NULL,
  `page_draft` int NOT NULL,
  `page_created_at` bigint NOT NULL,
  `page_created_by_user` int NOT NULL,
  `page_created_by_character` int NOT NULL,
  `page_updated_at` bigint DEFAULT NULL,
  `page_updated_by_user` int DEFAULT NULL,
  `page_updated_by_character` int DEFAULT NULL,
  `page_comments` enum('open','closed') NOT NULL DEFAULT 'open',
  `page_type` enum('standard','system') NOT NULL DEFAULT 'standard',
  `page_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nova_wiki_pages`
--

INSERT INTO `nova_wiki_pages` (`page_id`, `page_draft`, `page_created_at`, `page_created_by_user`, `page_created_by_character`, `page_updated_at`, `page_updated_by_user`, `page_updated_by_character`, `page_comments`, `page_type`, `page_key`) VALUES
(1, 1, 1793935805, 0, 0, NULL, NULL, NULL, 'closed', 'system', 'index'),
(2, 2, 1793935805, 0, 0, NULL, NULL, NULL, 'closed', 'system', 'create'),
(3, 3, 1793935805, 0, 0, NULL, NULL, NULL, 'closed', 'system', 'edit'),
(4, 4, 1793935805, 0, 0, NULL, NULL, NULL, 'closed', 'system', 'categories'),
(5, 5, 1793935805, 0, 0, NULL, NULL, NULL, 'closed', 'system', 'category');

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_restrictions`
--

CREATE TABLE `nova_wiki_restrictions` (
  `restr_id` int NOT NULL,
  `restr_page` int NOT NULL,
  `restr_created_at` bigint NOT NULL,
  `restr_created_by` int NOT NULL,
  `restr_updated_at` bigint DEFAULT NULL,
  `restr_updated_by` int DEFAULT NULL,
  `restrictions` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nova_access_groups`
--
ALTER TABLE `nova_access_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `nova_access_pages`
--
ALTER TABLE `nova_access_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `nova_access_roles`
--
ALTER TABLE `nova_access_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `nova_applications`
--
ALTER TABLE `nova_applications`
  ADD PRIMARY KEY (`app_id`);

--
-- Indexes for table `nova_awards`
--
ALTER TABLE `nova_awards`
  ADD PRIMARY KEY (`award_id`);

--
-- Indexes for table `nova_awards_queue`
--
ALTER TABLE `nova_awards_queue`
  ADD PRIMARY KEY (`queue_id`);

--
-- Indexes for table `nova_awards_received`
--
ALTER TABLE `nova_awards_received`
  ADD PRIMARY KEY (`awardrec_id`);

--
-- Indexes for table `nova_bans`
--
ALTER TABLE `nova_bans`
  ADD PRIMARY KEY (`ban_id`);

--
-- Indexes for table `nova_catalogue_ranks`
--
ALTER TABLE `nova_catalogue_ranks`
  ADD PRIMARY KEY (`rankcat_id`);

--
-- Indexes for table `nova_catalogue_skins`
--
ALTER TABLE `nova_catalogue_skins`
  ADD PRIMARY KEY (`skin_id`);

--
-- Indexes for table `nova_catalogue_skinsecs`
--
ALTER TABLE `nova_catalogue_skinsecs`
  ADD PRIMARY KEY (`skinsec_id`);

--
-- Indexes for table `nova_characters`
--
ALTER TABLE `nova_characters`
  ADD PRIMARY KEY (`charid`);

--
-- Indexes for table `nova_characters_data`
--
ALTER TABLE `nova_characters_data`
  ADD PRIMARY KEY (`data_id`);

--
-- Indexes for table `nova_characters_fields`
--
ALTER TABLE `nova_characters_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `nova_characters_promotions`
--
ALTER TABLE `nova_characters_promotions`
  ADD PRIMARY KEY (`prom_id`);

--
-- Indexes for table `nova_characters_sections`
--
ALTER TABLE `nova_characters_sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `nova_characters_tabs`
--
ALTER TABLE `nova_characters_tabs`
  ADD PRIMARY KEY (`tab_id`);

--
-- Indexes for table `nova_characters_values`
--
ALTER TABLE `nova_characters_values`
  ADD PRIMARY KEY (`value_id`);

--
-- Indexes for table `nova_coc`
--
ALTER TABLE `nova_coc`
  ADD PRIMARY KEY (`coc_id`);

--
-- Indexes for table `nova_departments`
--
ALTER TABLE `nova_departments`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `nova_docking`
--
ALTER TABLE `nova_docking`
  ADD PRIMARY KEY (`docking_id`);

--
-- Indexes for table `nova_docking_data`
--
ALTER TABLE `nova_docking_data`
  ADD PRIMARY KEY (`data_id`);

--
-- Indexes for table `nova_docking_fields`
--
ALTER TABLE `nova_docking_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `nova_docking_sections`
--
ALTER TABLE `nova_docking_sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `nova_docking_values`
--
ALTER TABLE `nova_docking_values`
  ADD PRIMARY KEY (`value_id`);

--
-- Indexes for table `nova_login_attempts`
--
ALTER TABLE `nova_login_attempts`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `nova_manifests`
--
ALTER TABLE `nova_manifests`
  ADD PRIMARY KEY (`manifest_id`);

--
-- Indexes for table `nova_menu_categories`
--
ALTER TABLE `nova_menu_categories`
  ADD PRIMARY KEY (`menucat_id`);

--
-- Indexes for table `nova_menu_items`
--
ALTER TABLE `nova_menu_items`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `nova_messages`
--
ALTER TABLE `nova_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `nova_missions`
--
ALTER TABLE `nova_missions`
  ADD PRIMARY KEY (`mission_id`);

--
-- Indexes for table `nova_mission_groups`
--
ALTER TABLE `nova_mission_groups`
  ADD PRIMARY KEY (`misgroup_id`);

--
-- Indexes for table `nova_news`
--
ALTER TABLE `nova_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `nova_news_categories`
--
ALTER TABLE `nova_news_categories`
  ADD PRIMARY KEY (`newscat_id`);

--
-- Indexes for table `nova_news_comments`
--
ALTER TABLE `nova_news_comments`
  ADD PRIMARY KEY (`ncomment_id`);

--
-- Indexes for table `nova_personallogs`
--
ALTER TABLE `nova_personallogs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `nova_personallogs_comments`
--
ALTER TABLE `nova_personallogs_comments`
  ADD PRIMARY KEY (`lcomment_id`);

--
-- Indexes for table `nova_positions`
--
ALTER TABLE `nova_positions`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `nova_posts`
--
ALTER TABLE `nova_posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `nova_posts_comments`
--
ALTER TABLE `nova_posts_comments`
  ADD PRIMARY KEY (`pcomment_id`);

--
-- Indexes for table `nova_privmsgs`
--
ALTER TABLE `nova_privmsgs`
  ADD PRIMARY KEY (`privmsgs_id`);

--
-- Indexes for table `nova_privmsgs_to`
--
ALTER TABLE `nova_privmsgs_to`
  ADD PRIMARY KEY (`pmto_id`);

--
-- Indexes for table `nova_ranks`
--
ALTER TABLE `nova_ranks`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `nova_security_questions`
--
ALTER TABLE `nova_security_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `nova_sessions`
--
ALTER TABLE `nova_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nova_settings`
--
ALTER TABLE `nova_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `nova_sim_type`
--
ALTER TABLE `nova_sim_type`
  ADD PRIMARY KEY (`simtype_id`);

--
-- Indexes for table `nova_specs`
--
ALTER TABLE `nova_specs`
  ADD PRIMARY KEY (`specs_id`);

--
-- Indexes for table `nova_specs_data`
--
ALTER TABLE `nova_specs_data`
  ADD PRIMARY KEY (`data_id`);

--
-- Indexes for table `nova_specs_fields`
--
ALTER TABLE `nova_specs_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `nova_specs_sections`
--
ALTER TABLE `nova_specs_sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `nova_specs_values`
--
ALTER TABLE `nova_specs_values`
  ADD PRIMARY KEY (`value_id`);

--
-- Indexes for table `nova_system_info`
--
ALTER TABLE `nova_system_info`
  ADD PRIMARY KEY (`sys_id`);

--
-- Indexes for table `nova_tour`
--
ALTER TABLE `nova_tour`
  ADD PRIMARY KEY (`tour_id`);

--
-- Indexes for table `nova_tour_data`
--
ALTER TABLE `nova_tour_data`
  ADD PRIMARY KEY (`data_id`);

--
-- Indexes for table `nova_tour_decks`
--
ALTER TABLE `nova_tour_decks`
  ADD PRIMARY KEY (`deck_id`);

--
-- Indexes for table `nova_tour_fields`
--
ALTER TABLE `nova_tour_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `nova_tour_values`
--
ALTER TABLE `nova_tour_values`
  ADD PRIMARY KEY (`value_id`);

--
-- Indexes for table `nova_uploads`
--
ALTER TABLE `nova_uploads`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `nova_users`
--
ALTER TABLE `nova_users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `nova_user_loa`
--
ALTER TABLE `nova_user_loa`
  ADD PRIMARY KEY (`loa_id`);

--
-- Indexes for table `nova_user_prefs`
--
ALTER TABLE `nova_user_prefs`
  ADD PRIMARY KEY (`pref_id`);

--
-- Indexes for table `nova_user_prefs_values`
--
ALTER TABLE `nova_user_prefs_values`
  ADD PRIMARY KEY (`prefvalue_id`);

--
-- Indexes for table `nova_wiki_categories`
--
ALTER TABLE `nova_wiki_categories`
  ADD PRIMARY KEY (`wikicat_id`);

--
-- Indexes for table `nova_wiki_comments`
--
ALTER TABLE `nova_wiki_comments`
  ADD PRIMARY KEY (`wcomment_id`);

--
-- Indexes for table `nova_wiki_drafts`
--
ALTER TABLE `nova_wiki_drafts`
  ADD PRIMARY KEY (`draft_id`);

--
-- Indexes for table `nova_wiki_pages`
--
ALTER TABLE `nova_wiki_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `nova_wiki_restrictions`
--
ALTER TABLE `nova_wiki_restrictions`
  ADD PRIMARY KEY (`restr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nova_access_groups`
--
ALTER TABLE `nova_access_groups`
  MODIFY `group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `nova_access_pages`
--
ALTER TABLE `nova_access_pages`
  MODIFY `page_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `nova_access_roles`
--
ALTER TABLE `nova_access_roles`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nova_applications`
--
ALTER TABLE `nova_applications`
  MODIFY `app_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_awards`
--
ALTER TABLE `nova_awards`
  MODIFY `award_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_awards_queue`
--
ALTER TABLE `nova_awards_queue`
  MODIFY `queue_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_awards_received`
--
ALTER TABLE `nova_awards_received`
  MODIFY `awardrec_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_bans`
--
ALTER TABLE `nova_bans`
  MODIFY `ban_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_catalogue_ranks`
--
ALTER TABLE `nova_catalogue_ranks`
  MODIFY `rankcat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nova_catalogue_skins`
--
ALTER TABLE `nova_catalogue_skins`
  MODIFY `skin_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nova_catalogue_skinsecs`
--
ALTER TABLE `nova_catalogue_skinsecs`
  MODIFY `skinsec_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `nova_characters`
--
ALTER TABLE `nova_characters`
  MODIFY `charid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nova_characters_data`
--
ALTER TABLE `nova_characters_data`
  MODIFY `data_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nova_characters_fields`
--
ALTER TABLE `nova_characters_fields`
  MODIFY `field_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nova_characters_promotions`
--
ALTER TABLE `nova_characters_promotions`
  MODIFY `prom_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_characters_sections`
--
ALTER TABLE `nova_characters_sections`
  MODIFY `section_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nova_characters_tabs`
--
ALTER TABLE `nova_characters_tabs`
  MODIFY `tab_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nova_characters_values`
--
ALTER TABLE `nova_characters_values`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nova_coc`
--
ALTER TABLE `nova_coc`
  MODIFY `coc_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nova_departments`
--
ALTER TABLE `nova_departments`
  MODIFY `dept_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nova_docking`
--
ALTER TABLE `nova_docking`
  MODIFY `docking_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_docking_data`
--
ALTER TABLE `nova_docking_data`
  MODIFY `data_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_docking_fields`
--
ALTER TABLE `nova_docking_fields`
  MODIFY `field_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_docking_sections`
--
ALTER TABLE `nova_docking_sections`
  MODIFY `section_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_docking_values`
--
ALTER TABLE `nova_docking_values`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_login_attempts`
--
ALTER TABLE `nova_login_attempts`
  MODIFY `login_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_manifests`
--
ALTER TABLE `nova_manifests`
  MODIFY `manifest_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nova_menu_categories`
--
ALTER TABLE `nova_menu_categories`
  MODIFY `menucat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `nova_menu_items`
--
ALTER TABLE `nova_menu_items`
  MODIFY `menu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `nova_messages`
--
ALTER TABLE `nova_messages`
  MODIFY `message_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `nova_missions`
--
ALTER TABLE `nova_missions`
  MODIFY `mission_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_mission_groups`
--
ALTER TABLE `nova_mission_groups`
  MODIFY `misgroup_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_news`
--
ALTER TABLE `nova_news`
  MODIFY `news_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_news_categories`
--
ALTER TABLE `nova_news_categories`
  MODIFY `newscat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nova_news_comments`
--
ALTER TABLE `nova_news_comments`
  MODIFY `ncomment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_personallogs`
--
ALTER TABLE `nova_personallogs`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_personallogs_comments`
--
ALTER TABLE `nova_personallogs_comments`
  MODIFY `lcomment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_positions`
--
ALTER TABLE `nova_positions`
  MODIFY `pos_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nova_posts`
--
ALTER TABLE `nova_posts`
  MODIFY `post_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_posts_comments`
--
ALTER TABLE `nova_posts_comments`
  MODIFY `pcomment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_privmsgs`
--
ALTER TABLE `nova_privmsgs`
  MODIFY `privmsgs_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_privmsgs_to`
--
ALTER TABLE `nova_privmsgs_to`
  MODIFY `pmto_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_ranks`
--
ALTER TABLE `nova_ranks`
  MODIFY `rank_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nova_security_questions`
--
ALTER TABLE `nova_security_questions`
  MODIFY `question_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nova_settings`
--
ALTER TABLE `nova_settings`
  MODIFY `setting_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `nova_sim_type`
--
ALTER TABLE `nova_sim_type`
  MODIFY `simtype_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `nova_specs`
--
ALTER TABLE `nova_specs`
  MODIFY `specs_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_specs_data`
--
ALTER TABLE `nova_specs_data`
  MODIFY `data_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_specs_fields`
--
ALTER TABLE `nova_specs_fields`
  MODIFY `field_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `nova_specs_sections`
--
ALTER TABLE `nova_specs_sections`
  MODIFY `section_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nova_specs_values`
--
ALTER TABLE `nova_specs_values`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_system_info`
--
ALTER TABLE `nova_system_info`
  MODIFY `sys_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nova_tour`
--
ALTER TABLE `nova_tour`
  MODIFY `tour_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_tour_data`
--
ALTER TABLE `nova_tour_data`
  MODIFY `data_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_tour_decks`
--
ALTER TABLE `nova_tour_decks`
  MODIFY `deck_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_tour_fields`
--
ALTER TABLE `nova_tour_fields`
  MODIFY `field_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nova_tour_values`
--
ALTER TABLE `nova_tour_values`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_uploads`
--
ALTER TABLE `nova_uploads`
  MODIFY `upload_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_users`
--
ALTER TABLE `nova_users`
  MODIFY `userid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nova_user_loa`
--
ALTER TABLE `nova_user_loa`
  MODIFY `loa_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_user_prefs`
--
ALTER TABLE `nova_user_prefs`
  MODIFY `pref_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `nova_user_prefs_values`
--
ALTER TABLE `nova_user_prefs_values`
  MODIFY `prefvalue_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `nova_wiki_categories`
--
ALTER TABLE `nova_wiki_categories`
  MODIFY `wikicat_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_wiki_comments`
--
ALTER TABLE `nova_wiki_comments`
  MODIFY `wcomment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nova_wiki_drafts`
--
ALTER TABLE `nova_wiki_drafts`
  MODIFY `draft_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nova_wiki_pages`
--
ALTER TABLE `nova_wiki_pages`
  MODIFY `page_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nova_wiki_restrictions`
--
ALTER TABLE `nova_wiki_restrictions`
  MODIFY `restr_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
