SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `crm_activity_call` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `call_type` enum('inbound','outbound') DEFAULT NULL,
  `call_details` enum('current','completed','schedule') NOT NULL,
  `call_start_time` datetime DEFAULT NULL,
  `call_duration` int(11) DEFAULT NULL COMMENT 'call duration in second',
  `result` text,
  `description` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_activity_call` (`id`, `owner`, `subject`, `call_type`, `call_details`, `call_start_time`, `call_duration`, `result`, `description`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 11, 'Test', 'inbound', 'current', NULL, 4111, NULL, NULL, 0, '2018-04-17 14:55:49', '2018-04-17 14:55:49', NULL, 786, NULL, NULL),
(2, 11, 'Test', 'inbound', 'current', NULL, 4111, NULL, NULL, 0, '2018-04-17 14:56:08', '2018-04-17 14:56:08', NULL, 786, NULL, NULL),
(3, 11, 'Test', 'inbound', 'current', NULL, 4111, NULL, NULL, 0, '2018-04-17 14:56:09', '2018-04-17 14:56:09', NULL, 786, NULL, NULL),
(4, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:56:14', '2018-04-17 14:56:14', NULL, 786, NULL, NULL),
(5, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:56:27', '2018-04-17 14:56:27', NULL, 786, NULL, NULL),
(6, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:57', '2018-04-17 14:57:57', NULL, 786, NULL, NULL),
(7, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:58', '2018-04-17 14:57:58', NULL, 786, NULL, NULL),
(8, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:58', '2018-04-17 14:57:58', NULL, 786, NULL, NULL),
(9, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:58', '2018-04-17 14:57:58', NULL, 786, NULL, NULL),
(10, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:59', '2018-04-17 14:57:59', NULL, 786, NULL, NULL),
(11, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:59', '2018-04-17 14:57:59', NULL, 786, NULL, NULL),
(12, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:59', '2018-04-17 14:57:59', NULL, 786, NULL, NULL),
(13, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:59', '2018-04-17 14:57:59', NULL, 786, NULL, NULL),
(14, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:59', '2018-04-17 14:57:59', NULL, 786, NULL, NULL),
(15, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:57:59', '2018-04-17 14:57:59', NULL, 786, NULL, NULL),
(16, 11, 'Test', 'inbound', 'current', NULL, 55, NULL, NULL, 0, '2018-04-17 14:58:00', '2018-04-17 14:58:00', NULL, 786, NULL, NULL);

CREATE TABLE `crm_activity_call_link` (
  `id` int(11) NOT NULL,
  `id_crm_activity_call` int(11) NOT NULL,
  `model_name` enum('Lead','Contact','Company','Opportunity','Campaign') NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_activity_call_link` (`id`, `id_crm_activity_call`, `model_name`, `model_id`) VALUES
(1, 1, 'Lead', 1),
(2, 2, 'Lead', 1),
(3, 3, 'Lead', 1),
(4, 4, 'Lead', 1),
(5, 5, 'Lead', 1),
(6, 6, 'Lead', 2),
(7, 7, 'Lead', 2),
(8, 8, 'Lead', 2),
(9, 9, 'Lead', 2),
(10, 10, 'Lead', 2),
(11, 11, 'Lead', 2),
(12, 12, 'Lead', 2),
(13, 13, 'Lead', 2),
(14, 14, 'Lead', 2),
(15, 15, 'Lead', 2),
(16, 16, 'Lead', 2);

CREATE TABLE `crm_activity_event` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `event_start_time` datetime NOT NULL,
  `event_end_time` datetime DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `crm_activity_event_link` (
  `id` int(11) NOT NULL,
  `id_crm_activity_event` int(11) NOT NULL,
  `model_name` enum('Lead','Contact','Company','Opportunity','Campaign') NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `crm_activity_event_participant` (
  `id` int(11) NOT NULL,
  `id_crm_activity_event` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `crm_activity_task` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `due_date` datetime NOT NULL,
  `id_crm_task_status_master` tinyint(3) DEFAULT NULL,
  `recurrence_type` enum('daily','weekly','monthly','yearly','none') NOT NULL COMMENT '''daily'',''weekly'',''monthly'',''yearly'',''none''',
  `end_date_option` tinyint(1) DEFAULT NULL COMMENT '1 means no end date, 2 means end after n occurence and 3 means end by any date    ',
  `end_after_occurence` int(11) DEFAULT NULL COMMENT 'number of occurrence before end ',
  `recurrence_end_date` datetime DEFAULT NULL COMMENT 'recurrence end date',
  `description` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_activity_task` (`id`, `owner`, `subject`, `due_date`, `id_crm_task_status_master`, `recurrence_type`, `end_date_option`, `end_after_occurence`, `recurrence_end_date`, `description`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 786, 'Test Daily', '2018-04-03 05:17:09', NULL, 'daily', NULL, NULL, NULL, NULL, 0, '2018-04-18 12:01:25', '2018-04-18 12:01:25', NULL, 786, NULL, NULL),
(2, 786, 'Test Daily', '2018-04-03 05:17:09', NULL, 'daily', NULL, NULL, NULL, NULL, 0, '2018-04-18 12:03:08', '2018-04-18 12:03:08', NULL, 786, NULL, NULL);

CREATE TABLE `crm_activity_task_link` (
  `id` int(11) NOT NULL,
  `id_crm_activity_task` int(11) NOT NULL,
  `model_name` enum('Lead','Contact','Company','Opportunity','Campaign') NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_activity_task_link` (`id`, `id_crm_activity_task`, `model_name`, `model_id`) VALUES
(1, 1, 'Lead', 18),
(2, 2, 'Lead', 18);

CREATE TABLE `crm_address` (
  `id` int(11) NOT NULL,
  `address_type` enum('default','mailing','billing','shipping','others') DEFAULT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `address_line3` varchar(255) DEFAULT NULL,
  `street` text,
  `city` int(11) DEFAULT NULL,
  `state_province` int(11) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `country` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_address` (`id`, `address_type`, `address_line1`, `address_line2`, `address_line3`, `street`, `city`, `state_province`, `zip_code`, `country`) VALUES
(1, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(2, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(3, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(4, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(5, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(6, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(7, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(8, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(9, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(10, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(11, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(12, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(13, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(14, 'default', NULL, NULL, NULL, NULL, 5, 5, '784512', 105),
(15, 'default', NULL, NULL, NULL, 'dffdf', NULL, NULL, '110096', NULL),
(16, 'default', NULL, NULL, NULL, 'dffdf', NULL, NULL, '110096', NULL),
(17, 'default', NULL, NULL, NULL, 'dffdf', NULL, NULL, '110096', NULL),
(18, 'default', NULL, NULL, NULL, 'dffdf', NULL, NULL, '110096', NULL),
(19, 'default', NULL, NULL, NULL, 'A 19 First Floor Sector 16', NULL, NULL, '201301', NULL),
(20, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'default', NULL, NULL, NULL, 'dffdf, fdfd, fdf', NULL, NULL, '41425', NULL),
(25, 'default', NULL, NULL, NULL, '', NULL, NULL, '', NULL),
(26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL),
(27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL),
(28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL),
(29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL),
(30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL),
(31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL),
(32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, NULL, NULL, NULL, NULL, 'dffdf, fdfd, fdf', NULL, NULL, '110096', NULL),
(43, NULL, NULL, NULL, NULL, 'dffdf, fdfd, fdf', NULL, NULL, '110096', NULL),
(44, NULL, NULL, NULL, NULL, 'dffdf, fdfd, fdf', NULL, NULL, '110096', NULL),
(45, NULL, NULL, NULL, NULL, 'dffdf, fdfd, fdf', NULL, NULL, NULL, NULL),
(46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, NULL, NULL, NULL, NULL, 'dffdf, fdfd, fdf', NULL, NULL, '110096', NULL),
(48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, NULL, NULL, NULL, NULL, 'dffdf, fdfd, fdf', NULL, NULL, '110096', NULL),
(50, NULL, NULL, NULL, NULL, 'dffdf, fdfd, fdf', NULL, NULL, '110096', NULL),
(51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, NULL, NULL, NULL, NULL, 'dffdf, fdfd, fdf', NULL, NULL, '110096', NULL);

CREATE TABLE `crm_campaign` (
  `id` int(11) NOT NULL,
  `owner` int(11) DEFAULT NULL,
  `id_crm_campaign_type_master` int(11) DEFAULT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `campaign_status` enum('planning','active','inactive','complete') DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `expected_revenue` decimal(20,2) DEFAULT NULL,
  `budgeted_cost` decimal(20,2) DEFAULT NULL,
  `actual_cost` decimal(20,2) DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_campaign` (`id`, `owner`, `id_crm_campaign_type_master`, `campaign_name`, `campaign_status`, `start_date`, `end_date`, `expected_revenue`, `budgeted_cost`, `actual_cost`, `description`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 786, 1, 'hasan test campaign', 'planning', '2018-05-05 00:00:00', '2018-05-05 00:00:00', '1878.00', '177.00', '1222.00', NULL, 0, '2018-04-12 04:41:15', '2018-04-12 04:41:15', NULL, 786, NULL, NULL),
(2, 786, 1, 'hasan test campaign', 'planning', '2018-05-05 00:00:00', '2018-05-05 00:00:00', '1878.00', '177.00', '1222.00', NULL, 1, '2018-04-12 04:41:16', '2018-04-17 12:35:29', '2018-04-17 12:35:29', 786, NULL, 786),
(3, 786, 1, 'hasan test campaign', 'planning', '2018-05-05 00:00:00', '2018-05-05 00:00:00', '1878.00', '177.00', '1222.00', NULL, 0, '2018-04-12 04:41:17', '2018-04-12 04:41:17', NULL, 786, NULL, NULL),
(4, 786, 1, 'hasan test campaign', 'planning', '2018-05-05 00:00:00', '2018-05-05 00:00:00', '1878.00', '177.00', '1222.00', NULL, 0, '2018-04-12 04:41:17', '2018-04-12 04:41:17', NULL, 786, NULL, NULL),
(5, 786, 1, 'hasan test campaign', 'planning', '2018-05-05 00:00:00', '2018-05-05 00:00:00', '1878.00', '177.00', '1222.00', NULL, 0, '2018-04-12 04:41:17', '2018-04-12 04:41:17', NULL, 786, NULL, NULL),
(6, 786, 1, 'hasan test campaign', 'planning', '2018-05-05 00:00:00', '2018-05-05 00:00:00', '1878.00', '177.00', '1222.00', NULL, 0, '2018-04-12 04:45:30', '2018-04-12 04:45:30', NULL, 786, NULL, NULL),
(7, 786, 1, 'hasan test campaign', 'planning', '2018-05-05 00:00:00', '2018-05-05 00:00:00', '1878.00', '177.00', '1222.00', NULL, 0, '2018-04-12 06:19:47', '2018-04-12 06:19:47', NULL, 786, NULL, NULL),
(8, 786, 1, 'hasan test campaign', 'planning', '2018-05-05 00:00:00', '2018-05-05 00:00:00', '1878.00', '177.00', '1222.00', NULL, 0, '2018-04-12 06:21:07', '2018-04-12 06:21:07', NULL, 786, NULL, NULL),
(9, 786, 1, 'hasan test campaign', 'planning', '2018-05-05 00:00:00', '2018-05-05 00:00:00', '1878.00', '177.00', '1222.00', NULL, 0, '2018-04-12 06:21:08', '2018-04-12 06:21:08', NULL, 786, NULL, NULL),
(10, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-16 05:47:26', '2018-04-16 05:47:26', NULL, 786, NULL, NULL),
(11, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-16 06:09:35', '2018-04-16 06:09:35', NULL, 786, NULL, NULL),
(12, 786, 6, 'Deepika', 'inactive', NULL, NULL, NULL, NULL, NULL, 'sgfg', 1, '2018-04-16 06:37:48', '2018-04-16 06:37:48', '2018-04-16 11:51:07', 786, NULL, 786),
(13, 786, 4, 'Deepika', 'active', '2018-04-18 00:00:00', '2018-04-13 00:00:00', '2222.00', NULL, NULL, 'adada', 0, '2018-04-16 06:41:18', '2018-04-16 06:41:18', NULL, 786, NULL, NULL),
(14, 786, 4, 'Deepika', 'active', '2018-04-18 00:00:00', '2018-04-13 00:00:00', '2222.00', NULL, NULL, 'adada', 1, '2018-04-16 12:12:02', '2018-04-16 12:12:02', '2018-04-16 12:01:46', 786, NULL, 786),
(15, 786, 4, 'Deepika', 'planning', '2018-04-17 00:00:00', '2018-04-18 00:00:00', '200000.00', '5000000.00', '10000.00', 'Deepika', 0, '2018-04-16 06:45:37', '2018-04-16 06:45:37', NULL, 786, NULL, NULL),
(16, 786, 3, 'Deepika', 'active', '2018-04-23 00:00:00', '2018-04-14 00:00:00', '200000.00', '2222.00', '10000.00', 'zxzxz', 0, '2018-04-16 06:46:52', '2018-04-16 06:46:52', NULL, 786, NULL, NULL),
(17, 786, 3, 'Deepika', 'active', '2018-04-02 00:00:00', '2018-04-19 00:00:00', '258.00', '2222.00', '222.00', 'czczc', 1, '2018-04-16 06:48:35', '2018-04-17 05:59:08', '2018-04-17 05:59:08', 786, NULL, 786),
(18, 786, 3, 'Some Text', 'active', '2018-04-16 00:00:00', '2018-04-26 00:00:00', '2222.00', '852.00', '10000.00', 'Some TextSome TextSome TextSome TextSome TextSome Text', 0, '2018-04-16 06:49:39', '2018-04-16 06:49:39', NULL, 786, NULL, NULL),
(19, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-16 08:58:09', '2018-04-16 08:58:09', '2018-04-17 04:53:03', 786, NULL, 786),
(20, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-16 08:59:39', '2018-04-16 08:59:39', '2018-04-17 04:52:57', 786, NULL, 786),
(21, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-16 08:59:39', '2018-04-16 08:59:39', '2018-04-16 12:24:40', 786, NULL, 786),
(22, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-16 08:59:40', '2018-04-16 08:59:40', '2018-04-16 12:24:28', 786, NULL, 786),
(23, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-16 08:59:48', '2018-04-16 08:59:48', '2018-04-17 04:52:54', 786, NULL, 786),
(24, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-16 10:46:21', '2018-04-16 10:46:21', '2018-04-16 12:01:57', 786, NULL, 786),
(25, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-16 10:48:02', '2018-04-16 10:48:02', '2018-04-16 13:27:19', 786, NULL, 786),
(26, 786, 6, 'UpdateTestName', 'inactive', '2018-04-13 00:00:00', '2018-04-20 00:00:00', '12345.00', '852.00', '222.00', 'Hello', 0, '2018-04-16 11:26:26', '2018-04-17 06:22:30', NULL, 786, 786, NULL),
(27, 786, 6, 'Aditi', 'complete', '2018-04-16 00:00:00', '2018-04-26 00:00:00', '258.00', '5436.00', '10000.00', 'llllllllllllllllllllllllllll', 0, '2018-04-17 09:03:17', '2018-04-17 09:03:17', NULL, 786, NULL, NULL),
(28, 786, 4, 'Deepika', NULL, '2018-04-03 00:00:00', '2018-05-04 00:00:00', NULL, NULL, NULL, NULL, 0, '2018-04-17 10:18:29', '2018-04-17 10:18:29', NULL, 786, NULL, NULL),
(29, 786, 3, 'Some Text', 'inactive', '2018-04-17 00:00:00', '2018-05-12 00:00:00', '12345.00', '5436.00', '10000.00', NULL, 0, '2018-04-17 10:20:44', '2018-04-17 10:20:44', NULL, 786, NULL, NULL),
(30, 786, 8, 'Demo', 'complete', '2018-04-06 00:00:00', '2018-04-20 00:00:00', NULL, NULL, NULL, NULL, 0, '2018-04-17 10:21:55', '2018-04-17 10:21:55', NULL, 786, NULL, NULL),
(31, 786, 4, 'Deepika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-04-17 10:26:03', '2018-04-17 11:04:54', NULL, 786, 786, NULL),
(32, 786, 6, 'Deepika', 'inactive', '2018-04-17 00:00:00', '2018-04-26 00:00:00', NULL, NULL, NULL, NULL, 0, '2018-04-17 10:26:55', '2018-04-17 10:26:55', NULL, 786, NULL, NULL),
(33, 786, 7, 'Synthesis CRM', 'planning', '2018-04-17 00:00:00', '2018-04-26 00:00:00', '80000000.00', '10000000.00', '5000000.00', 'That\'s a demo text. Enjoy!!!', 0, '2018-04-17 11:14:34', '2018-04-17 11:14:34', NULL, 786, NULL, NULL),
(34, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:15:03', '2018-04-17 11:15:03', NULL, 786, NULL, NULL),
(35, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:15:30', '2018-04-17 11:15:30', NULL, 786, NULL, NULL),
(36, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:18:13', '2018-04-17 11:18:13', NULL, 786, NULL, NULL),
(37, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:18:15', '2018-04-17 11:18:15', NULL, 786, NULL, NULL),
(38, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:18:15', '2018-04-17 11:18:15', NULL, 786, NULL, NULL),
(39, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:18:22', '2018-04-17 11:18:22', NULL, 786, NULL, NULL),
(40, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:20:23', '2018-04-17 11:20:23', NULL, 786, NULL, NULL),
(41, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:20:24', '2018-04-17 11:20:24', NULL, 786, NULL, NULL),
(42, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:20:24', '2018-04-17 11:20:24', NULL, 786, NULL, NULL),
(43, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:20:25', '2018-04-17 11:20:25', NULL, 786, NULL, NULL),
(44, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:20:25', '2018-04-17 11:20:25', NULL, 786, NULL, NULL),
(45, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:20:26', '2018-04-17 11:20:26', NULL, 786, NULL, NULL),
(46, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:20:26', '2018-04-17 11:20:26', NULL, 786, NULL, NULL),
(47, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:21:26', '2018-04-17 11:21:26', NULL, 786, NULL, NULL),
(48, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:21:34', '2018-04-17 11:21:34', NULL, 786, NULL, NULL),
(49, 786, NULL, 'Deepika', 'planning', '2018-04-03 00:00:00', '2018-04-03 00:00:00', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:22:20', '2018-04-17 12:18:08', NULL, 786, 786, NULL),
(50, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-17 11:22:43', '2018-04-18 06:01:32', '2018-04-18 06:01:32', 786, NULL, 786),
(51, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-04-17 11:22:44', '2018-04-17 11:22:44', NULL, 786, NULL, NULL),
(52, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-04-17 11:22:52', '2018-04-17 11:22:52', NULL, 786, NULL, NULL),
(53, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-04-17 11:23:11', '2018-04-17 11:23:11', NULL, 786, NULL, NULL),
(54, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 0, '2018-04-17 11:23:22', '2018-04-17 11:23:22', NULL, 786, NULL, NULL),
(55, 786, NULL, 'hello test campaign', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-17 11:23:23', '2018-04-17 12:26:38', '2018-04-17 12:26:38', 786, NULL, 786),
(56, 786, 2, 'Synthesis CRM', 'active', '2018-04-02 00:00:00', '2018-04-25 00:00:00', '80000000.00', '10000000.00', '5000000.00', 'That\'s demo text!!!', 0, '2018-04-17 11:24:46', '2018-04-17 11:24:46', NULL, 786, NULL, NULL),
(57, 786, 8, 'Aditi', 'active', '2018-04-26 00:00:00', '2018-04-27 00:00:00', '12345.00', '5436.00', '10000.00', NULL, 1, '2018-04-17 11:32:53', '2018-04-17 12:17:39', '2018-04-17 12:17:39', 786, NULL, 786),
(58, 786, 8, 'Aditi', 'active', '2018-04-26 00:00:00', '2018-04-27 00:00:00', '12345.00', '5436.00', '10000.00', NULL, 1, '2018-04-17 11:37:41', '2018-04-17 12:17:35', '2018-04-17 12:17:35', 786, NULL, 786),
(59, 786, 8, 'Aditi', 'active', '2018-04-26 00:00:00', '2018-04-27 00:00:00', '12345.00', '5436.00', '10000.00', NULL, 1, '2018-04-17 11:37:46', '2018-04-17 12:17:31', '2018-04-17 12:17:31', 786, NULL, 786),
(60, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 1, '2018-04-17 11:37:51', '2018-04-17 12:17:27', '2018-04-17 12:17:27', 786, NULL, 786),
(61, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 1, '2018-04-17 11:37:52', '2018-04-17 12:17:16', '2018-04-17 12:17:16', 786, NULL, 786),
(62, 786, NULL, 'Deepika', NULL, '2018-04-03 05:17:09', '2018-04-03 05:17:09', NULL, NULL, NULL, NULL, 1, '2018-04-17 11:37:52', '2018-04-17 12:17:20', '2018-04-17 12:17:20', 786, NULL, 786),
(63, 786, 8, 'Aditi', 'active', '2018-04-26 00:00:00', '2018-04-27 00:00:00', '12345.00', '5436.00', '10000.00', NULL, 0, '2018-04-17 11:37:59', '2018-04-17 11:37:59', NULL, 786, NULL, NULL),
(64, 786, 8, 'Aditi', 'active', '2018-04-26 00:00:00', '2018-04-27 00:00:00', '12345.00', '5436.00', '10000.00', NULL, 0, '2018-04-17 11:38:20', '2018-04-17 11:38:20', NULL, 786, NULL, NULL),
(65, 786, 8, 'Some Text', 'active', '2018-04-25 00:00:00', '2018-04-21 00:00:00', '2222.00', '2222.00', '258.00', 'DEMO', 1, '2018-04-17 11:40:32', '2018-04-17 12:26:31', '2018-04-17 12:26:31', 786, 786, 786),
(66, 786, 3, 'Synthesis CRM', 'inactive', '2018-04-11 00:00:00', '2018-04-27 00:00:00', NULL, NULL, NULL, 'Demo Text', 0, '2018-04-17 12:12:01', '2018-04-17 12:16:47', NULL, 786, 786, NULL),
(67, 786, NULL, '898', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-18 05:50:57', '2018-04-18 05:57:23', '2018-04-18 05:57:23', 786, NULL, 786),
(68, 786, NULL, 'ggfg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-18 05:53:10', '2018-04-18 05:57:21', '2018-04-18 05:57:21', 786, NULL, 786),
(69, 786, NULL, 'uiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-18 05:55:24', '2018-04-18 05:57:19', '2018-04-18 05:57:19', 786, NULL, 786),
(70, 786, NULL, 'bvcbvc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-04-18 05:56:01', '2018-04-18 05:57:16', '2018-04-18 05:57:16', 786, NULL, 786),
(71, 786, NULL, 'l8', NULL, NULL, NULL, '8989.00', NULL, NULL, NULL, 1, '2018-04-18 05:57:09', '2018-04-18 05:57:14', '2018-04-18 05:57:14', 786, NULL, 786),
(72, 786, NULL, 'Asergis ', NULL, NULL, NULL, '4545.00', '5454.00', '454.00', NULL, 1, '2018-04-18 06:01:16', '2018-04-18 06:01:22', '2018-04-18 06:01:22', 786, NULL, 786);

CREATE TABLE `crm_campaign_link` (
  `id` int(11) NOT NULL,
  `model_name` enum('Lead','Contact') NOT NULL,
  `model_id` int(11) NOT NULL,
  `id_crm_campaign` int(11) NOT NULL,
  `id_crm_campaign_status_master` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_campaign_link` (`id`, `model_name`, `model_id`, `id_crm_campaign`, `id_crm_campaign_status_master`) VALUES
(3, 'Lead', 2, 5, 4),
(1, 'Lead', 2, 6, 4),
(4, 'Lead', 2, 7, 6),
(2, 'Lead', 2, 8, 3),
(9, 'Lead', 3, 6, 3),
(48, 'Contact', 2, 3, 1),
(33, 'Contact', 2, 7, 3);

CREATE TABLE `crm_campaign_status_master` (
  `id` tinyint(3) NOT NULL,
  `campaign_status` varchar(40) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_campaign_status_master` (`id`, `campaign_status`, `weight`) VALUES
(1, 'Planned', 0),
(2, 'Invited', 0),
(3, 'Sent', 0),
(4, 'Received', 0),
(5, 'Opened', 0),
(6, 'Responded', 0),
(7, 'Bounced', 0),
(8, 'Opted Out', 0);

CREATE TABLE `crm_campaign_type_master` (
  `id` int(11) NOT NULL,
  `campaign_type` varchar(50) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_campaign_type_master` (`id`, `campaign_type`, `weight`) VALUES
(1, 'Conference', 0),
(2, 'Webinar', 0),
(3, 'Banner Ads', 0),
(4, 'Telemarketing', 0),
(6, 'Email', 0),
(7, 'Trade Show', 0),
(8, 'Public Relations', 0),
(9, 'Others', 0);

CREATE TABLE `crm_company` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `registration_number` varchar(50) DEFAULT NULL,
  `no_of_employees` int(8) DEFAULT NULL,
  `annual_revenue` decimal(18,0) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `company_email` varchar(255) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` text,
  `id_crm_industry_master` int(11) DEFAULT NULL,
  `id_crm_company_ownership_master` int(11) DEFAULT NULL,
  `id_crm_company_status_master` tinyint(3) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_company` (`id`, `owner`, `company_name`, `registration_number`, `no_of_employees`, `annual_revenue`, `phone`, `company_email`, `fax`, `website`, `description`, `id_crm_industry_master`, `id_crm_company_ownership_master`, `id_crm_company_status_master`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 0, 'B9F37685-3', 'R-784512', 120, '0', NULL, 'CDJN@gmail.com', NULL, NULL, 'Description', 3, 1, 2, 1, '2018-04-05 12:09:15', '2018-04-16 18:06:13', '2018-04-16 18:06:13', 786, NULL, 786),
(2, 0, 'B9F58619-3', '78451254', NULL, '0', NULL, 'NDBU@gmail.com', NULL, NULL, NULL, NULL, NULL, 2, 0, '2018-04-07 12:00:58', '2018-04-07 12:11:39', NULL, 786, NULL, NULL),
(3, 0, 'B9F5870E-3', '78451254', NULL, '0', NULL, 'YMMA@gmail.com', NULL, NULL, NULL, NULL, NULL, 2, 1, '2018-04-07 12:01:02', '2018-04-16 18:05:43', '2018-04-16 18:05:43', 786, NULL, 786),
(4, 0, 'B9F5874D-3', '78451254', NULL, '0', NULL, 'PCMI@gmail.com', NULL, NULL, NULL, NULL, NULL, 2, 0, '2018-04-07 12:01:07', '2018-04-16 12:36:38', NULL, 786, NULL, 786),
(5, 0, 'B9F5877D-3', '78451254', NULL, '0', NULL, 'CLCD@gmail.com', NULL, NULL, NULL, NULL, NULL, 2, 0, '2018-04-07 12:01:12', '2018-04-07 12:11:39', NULL, 786, NULL, NULL),
(6, 0, 'B9F587A8-3', '78451254', NULL, '0', NULL, 'JMGW@gmail.com', NULL, NULL, NULL, NULL, NULL, 2, 0, '2018-04-07 12:01:21', '2018-04-07 12:11:39', NULL, 786, NULL, NULL),
(7, 0, 'B9F587D4-3', '78451254', NULL, '0', NULL, 'TBBB@gmail.com', NULL, NULL, NULL, NULL, NULL, 2, 0, '2018-04-07 12:01:29', '2018-04-07 12:11:39', NULL, 786, NULL, NULL),
(8, 0, 'B9F58801-3', '78451254', NULL, '0', NULL, 'BESD@gmail.com', NULL, NULL, NULL, NULL, NULL, 2, 0, '2018-04-07 12:01:29', '2018-04-07 12:11:39', NULL, 786, NULL, NULL),
(9, 0, 'B9F5882D-3', '78451254', NULL, '0', NULL, 'MBVB@gmail.com', NULL, NULL, NULL, NULL, NULL, 2, 0, '2018-04-07 12:01:29', '2018-04-07 12:11:39', NULL, 786, NULL, NULL),
(10, 0, 'Web Soft Technology', 'sdsd', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2018-04-07 17:58:38', '2018-04-07 17:58:38', NULL, 786, NULL, NULL),
(11, 0, 'Web Soft Technology', 'sdsd', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2018-04-07 18:06:03', '2018-04-07 18:06:03', NULL, 786, NULL, NULL),
(12, 0, 'Web Soft Technology', 'sdsd', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2018-04-09 11:25:56', '2018-04-16 17:20:45', '2018-04-16 17:20:45', 786, NULL, 786),
(13, 0, 'fdfdf', '', 4, '0', '', '', '', '', '', NULL, NULL, 3, 1, '2018-04-13 16:57:54', '2018-04-16 15:44:42', '2018-04-16 15:44:42', 786, 786, 786),
(14, 0, 'New company', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, '2018-04-16 15:59:43', '2018-04-16 17:26:44', '2018-04-16 17:26:44', 786, NULL, 786),
(15, 0, 'ggf', '', NULL, '0', '', '', '', '', '', NULL, NULL, 3, 0, '2018-04-16 18:27:14', '2018-04-16 18:27:14', NULL, 786, NULL, NULL),
(16, 0, 'dfdfd', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', NULL, 4, NULL, NULL, 0, '2018-04-17 17:18:10', '2018-04-17 17:18:10', NULL, 786, NULL, NULL),
(17, 0, 'dfdfd', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', NULL, 4, NULL, NULL, 0, '2018-04-17 17:18:50', '2018-04-17 17:18:50', NULL, 786, NULL, NULL),
(18, 0, 'dfdfd', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', NULL, 4, NULL, NULL, 0, '2018-04-17 17:20:59', '2018-04-17 17:20:59', NULL, 786, NULL, NULL),
(19, 0, 'dfdfd', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', NULL, 4, NULL, NULL, 0, '2018-04-17 17:21:31', '2018-04-17 17:21:31', NULL, 786, NULL, NULL),
(20, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:23:18', '2018-04-17 17:23:18', NULL, 786, NULL, NULL),
(21, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:25:02', '2018-04-17 17:25:02', NULL, 786, NULL, NULL),
(22, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:25:32', '2018-04-17 17:25:32', NULL, 786, NULL, NULL),
(23, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:26:07', '2018-04-17 17:26:07', NULL, 786, NULL, NULL),
(24, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:26:37', '2018-04-17 17:26:37', NULL, 786, NULL, NULL),
(25, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:26:38', '2018-04-17 17:26:38', NULL, 786, NULL, NULL),
(26, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:26:47', '2018-04-17 17:26:47', NULL, 786, NULL, NULL),
(27, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:26:48', '2018-04-17 17:26:48', NULL, 786, NULL, NULL),
(28, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:27:05', '2018-04-17 17:27:05', NULL, 786, NULL, NULL),
(29, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:27:05', '2018-04-17 17:27:05', NULL, 786, NULL, NULL),
(30, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:27:27', '2018-04-17 17:27:27', NULL, 786, NULL, NULL),
(31, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:27:52', '2018-04-17 17:27:52', NULL, 786, NULL, NULL),
(32, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:28:03', '2018-04-17 17:28:03', NULL, 786, NULL, NULL),
(33, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:28:04', '2018-04-17 17:28:04', NULL, 786, NULL, NULL),
(34, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:28:08', '2018-04-17 17:28:08', NULL, 786, NULL, NULL),
(35, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:32:30', '2018-04-17 17:32:30', NULL, 786, NULL, NULL),
(36, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:32:31', '2018-04-17 17:32:31', NULL, 786, NULL, NULL),
(37, 0, 'dfdfd', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:33:01', '2018-04-17 17:33:01', NULL, 786, NULL, NULL),
(38, 0, 'test company', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:38:37', '2018-04-17 17:38:37', NULL, 786, NULL, NULL),
(39, 0, 'test company', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:39:41', '2018-04-17 17:39:41', NULL, 786, NULL, NULL),
(40, 0, 'test company', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:41:01', '2018-04-17 17:41:01', NULL, 786, NULL, NULL),
(41, 0, 'test company', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:41:50', '2018-04-17 17:41:50', NULL, 786, NULL, NULL),
(42, 0, 'test company', NULL, 600, '0', '022-45125478', NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:42:14', '2018-04-17 17:42:14', NULL, 786, NULL, NULL),
(43, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:46:03', '2018-04-17 17:46:03', NULL, 786, NULL, NULL),
(44, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:46:28', '2018-04-17 17:46:28', NULL, 786, NULL, NULL),
(45, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:46:29', '2018-04-17 17:46:29', NULL, 786, NULL, NULL),
(46, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:46:29', '2018-04-17 17:46:29', NULL, 786, NULL, NULL),
(47, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:47:34', '2018-04-17 17:47:34', NULL, 786, NULL, NULL),
(48, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:48:30', '2018-04-17 17:48:30', NULL, 786, NULL, NULL),
(49, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:48:55', '2018-04-17 17:48:55', NULL, 786, NULL, NULL),
(50, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 17:49:11', '2018-04-17 17:49:11', NULL, 786, NULL, NULL),
(51, 0, 'Asergis', NULL, NULL, '0', '989898989898', NULL, '', '', NULL, NULL, NULL, NULL, 0, '2018-04-17 17:56:51', '2018-04-17 17:56:51', NULL, 786, NULL, NULL),
(52, 0, 'Asergis', NULL, NULL, '0', '989898989898', NULL, '', '', NULL, NULL, NULL, NULL, 0, '2018-04-17 17:57:21', '2018-04-17 17:57:21', NULL, 786, NULL, NULL),
(53, 0, 'Asergis', NULL, NULL, '0', '989898989898', NULL, '', '', NULL, NULL, NULL, NULL, 0, '2018-04-17 18:02:03', '2018-04-17 18:02:03', NULL, 786, NULL, NULL),
(54, 0, 'Asergis', NULL, NULL, '0', '989898989898', NULL, '', '', NULL, NULL, NULL, NULL, 0, '2018-04-17 18:02:55', '2018-04-17 18:02:55', NULL, 786, NULL, NULL),
(55, 0, 'Asergis', NULL, NULL, '0', '989898989898', NULL, '', '', NULL, NULL, NULL, NULL, 0, '2018-04-17 18:04:22', '2018-04-17 18:04:22', NULL, 786, NULL, NULL),
(56, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:08:31', '2018-04-17 18:08:31', NULL, 786, NULL, NULL),
(57, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:08:31', '2018-04-17 18:08:31', NULL, 786, NULL, NULL),
(58, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:08:53', '2018-04-17 18:08:53', NULL, 786, NULL, NULL),
(59, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:10:49', '2018-04-17 18:10:49', NULL, 786, NULL, NULL),
(60, 0, 'Asergis', NULL, NULL, '0', '989898989898', NULL, '', '', NULL, NULL, NULL, NULL, 0, '2018-04-17 18:23:41', '2018-04-17 18:23:41', NULL, 786, NULL, NULL),
(61, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:43:52', '2018-04-17 18:43:52', NULL, 786, NULL, NULL),
(62, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:50:39', '2018-04-17 18:50:39', NULL, 786, NULL, NULL),
(63, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:50:39', '2018-04-17 18:50:39', NULL, 786, NULL, NULL),
(64, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:51:18', '2018-04-17 18:51:18', NULL, 786, NULL, NULL),
(65, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:54:55', '2018-04-17 18:54:55', NULL, 786, NULL, NULL),
(66, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-17 18:55:07', '2018-04-17 18:55:07', NULL, 786, NULL, NULL),
(67, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 11:34:29', '2018-04-18 11:34:29', NULL, 786, NULL, NULL),
(68, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 11:38:36', '2018-04-18 11:38:36', NULL, 786, NULL, NULL),
(69, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 11:38:55', '2018-04-18 11:38:55', NULL, 786, NULL, NULL),
(70, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 11:39:24', '2018-04-18 11:39:24', NULL, 786, NULL, NULL),
(71, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 11:39:50', '2018-04-18 11:39:50', NULL, 786, NULL, NULL),
(72, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 11:47:33', '2018-04-18 11:47:33', NULL, 786, NULL, NULL),
(73, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 12:02:12', '2018-04-18 12:02:12', NULL, 786, NULL, NULL),
(74, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 12:02:42', '2018-04-18 12:02:42', NULL, 786, NULL, NULL),
(75, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 12:03:00', '2018-04-18 12:03:00', NULL, 786, NULL, NULL),
(76, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 12:03:56', '2018-04-18 12:03:56', NULL, 786, NULL, NULL),
(77, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 12:04:35', '2018-04-18 12:04:35', NULL, 786, NULL, NULL),
(78, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 12:04:54', '2018-04-18 12:04:54', NULL, 786, NULL, NULL),
(79, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 12:04:55', '2018-04-18 12:04:55', NULL, 786, NULL, NULL),
(80, 0, 'test company', NULL, 600, '0', NULL, NULL, '45125478894', 'www.test.com', 'Its my test descriptiomn', 4, NULL, NULL, 0, '2018-04-18 12:05:54', '2018-04-18 12:05:54', NULL, 786, NULL, NULL);

CREATE TABLE `crm_company_address` (
  `id_crm_company` int(11) NOT NULL,
  `id_crm_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_company_address` (`id_crm_company`, `id_crm_address`) VALUES
(64, 21),
(65, 21),
(66, 21),
(67, 21),
(68, 21),
(69, 21),
(70, 21),
(71, 21),
(72, 21),
(73, 21),
(74, 21),
(75, 21),
(76, 21),
(77, 21),
(78, 21),
(79, 21),
(80, 21);

CREATE TABLE `crm_company_ownership_master` (
  `id` int(11) NOT NULL,
  `company_ownership` varchar(50) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_company_ownership_master` (`id`, `company_ownership`, `weight`) VALUES
(1, 'private', 0),
(2, 'public', 0),
(3, 'government', 0),
(4, 'subsidiary', 0);

CREATE TABLE `crm_company_status_master` (
  `id` tinyint(3) NOT NULL,
  `company_status` varchar(50) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_company_status_master` (`id`, `company_status`, `weight`) VALUES
(1, 'None', 0),
(2, 'Acquired', 0),
(3, 'Active', 0),
(4, 'Market Failed', 0),
(5, 'Project Cancelled', 0),
(6, 'Shut Down', 0);

CREATE TABLE `crm_company_type_master` (
  `id` int(11) NOT NULL,
  `company_type` varchar(50) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_company_type_master` (`id`, `company_type`, `weight`) VALUES
(1, 'Analyst', 0),
(2, 'Competitor', 0),
(3, 'Customer', 0),
(4, 'Integrator', 0),
(5, 'Investor', 0),
(6, 'Partner', 0),
(7, 'Press', 0),
(8, 'Prospect', 0),
(9, 'Reseller', 0),
(10, 'Others', 0);

CREATE TABLE `crm_contact` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `description` text,
  `id_crm_company` int(11) DEFAULT NULL,
  `id_crm_lead_source_master` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_contact` (`id`, `owner`, `title`, `first_name`, `last_name`, `date_of_birth`, `mobile`, `phone`, `email`, `fax`, `designation`, `department`, `description`, `id_crm_company`, `id_crm_lead_source_master`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:39', '2018-04-18 11:56:46', NULL, 786, NULL, 786),
(2, 786, NULL, '', '', '2018-02-07', NULL, NULL, NULL, NULL, NULL, 'IT ', NULL, 1, NULL, 0, '2018-04-05 12:09:37', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(4, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:38', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(5, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:38', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(6, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:39', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(7, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:39', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(9, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:39', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(10, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:39', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(11, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:39', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(12, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:39', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(13, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:40', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(14, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:40', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(15, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:40', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(16, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:40', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(17, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:40', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(18, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:40', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(19, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-05 12:09:41', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(20, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-13 18:27:27', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(21, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 12:47:34', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(22, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 12:47:36', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(23, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 12:49:13', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(24, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 12:50:16', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(25, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 12:50:50', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(26, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 12:51:09', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(27, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 12:51:26', '2018-04-16 12:51:26', NULL, 786, NULL, NULL),
(28, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 12:52:49', '2018-04-16 12:52:49', NULL, 786, NULL, NULL),
(29, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-16 15:46:01', '2018-04-16 15:46:52', NULL, 786, 786, NULL),
(30, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, '2018-04-16 16:17:58', '2018-04-16 16:17:58', NULL, 786, NULL, NULL),
(31, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, '2018-04-16 16:19:23', '2018-04-16 16:19:23', NULL, 786, NULL, NULL),
(32, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-16 16:32:50', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(33, 4, NULL, '', '', '2018-04-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-16 16:32:50', '2018-04-18 11:56:52', NULL, 786, 786, 786),
(34, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2018-04-16 17:01:08', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(35, 1, NULL, '', '', '2018-04-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, '2018-04-16 17:11:55', '2018-04-18 11:56:52', NULL, 786, 786, 786),
(36, 4, NULL, '', '', '2018-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, '2018-04-16 17:54:52', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(37, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 18:22:17', '2018-04-16 18:23:05', NULL, 786, 786, NULL),
(38, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, '2018-04-16 18:23:54', '2018-04-16 18:23:54', NULL, 786, NULL, NULL),
(39, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 18:28:50', '2018-04-16 18:29:16', NULL, 786, 786, NULL),
(40, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 18:30:23', '2018-04-16 18:30:23', NULL, 786, NULL, NULL),
(41, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 18:33:48', '2018-04-16 18:33:48', NULL, 786, NULL, NULL),
(42, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 18:34:24', '2018-04-16 18:34:24', NULL, 786, NULL, NULL),
(43, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 18:49:37', '2018-04-16 18:49:37', NULL, 786, NULL, NULL),
(44, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 18:51:19', '2018-04-16 18:51:19', NULL, 786, NULL, NULL),
(45, 3, NULL, '', '', '2018-04-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, '2018-04-16 18:59:36', '2018-04-18 11:56:52', NULL, 786, 786, 786),
(46, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 19:11:51', '2018-04-16 19:11:51', NULL, 786, NULL, NULL),
(47, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-16 19:17:11', '2018-04-16 19:17:11', NULL, 786, NULL, NULL),
(48, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 0, '2018-04-17 10:30:01', '2018-04-17 11:00:12', NULL, 786, 786, NULL),
(49, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-17 11:14:21', '2018-04-17 11:15:07', NULL, 786, 786, NULL),
(50, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, '2018-04-17 11:40:25', '2018-04-17 11:40:35', NULL, 786, 786, NULL),
(51, 5, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, 0, '2018-04-17 12:16:06', '2018-04-17 12:17:00', NULL, 786, 786, NULL),
(52, 1, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, '2018-04-17 12:20:21', '2018-04-17 12:20:36', NULL, 786, 786, NULL),
(53, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, 0, '2018-04-17 17:32:30', '2018-04-17 17:32:30', NULL, 786, NULL, NULL),
(54, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, 0, '2018-04-17 17:32:31', '2018-04-17 17:32:31', NULL, 786, NULL, NULL),
(55, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, 0, '2018-04-17 17:33:01', '2018-04-17 17:33:01', NULL, 786, NULL, NULL),
(56, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, 0, '2018-04-17 17:38:37', '2018-04-17 17:38:37', NULL, 786, NULL, NULL),
(57, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, 0, '2018-04-17 17:39:41', '2018-04-17 17:39:41', NULL, 786, NULL, NULL),
(58, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, 0, '2018-04-17 17:41:01', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(59, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, 0, '2018-04-17 17:41:50', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(60, 786, NULL, '', '', '2018-04-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, 0, '2018-04-17 17:42:14', '2018-04-18 11:56:52', NULL, 786, 786, 786),
(61, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, 0, '2018-04-17 17:46:03', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(62, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, 0, '2018-04-17 17:46:28', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(63, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, NULL, 0, '2018-04-17 17:46:29', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(64, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, 0, '2018-04-17 17:46:29', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(65, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, NULL, 0, '2018-04-17 17:47:34', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(66, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, 0, '2018-04-17 17:48:30', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(67, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, 0, '2018-04-17 17:48:55', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(68, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, 0, '2018-04-17 17:49:11', '2018-04-18 11:56:52', NULL, 786, NULL, 786),
(69, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, 0, '2018-04-17 18:02:55', '2018-04-17 18:02:55', NULL, 786, NULL, NULL),
(70, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, 0, '2018-04-17 18:04:22', '2018-04-17 18:04:22', NULL, 786, NULL, NULL),
(71, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, 0, '2018-04-17 18:08:31', '2018-04-17 18:08:31', NULL, 786, NULL, NULL),
(72, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, 0, '2018-04-17 18:08:32', '2018-04-17 18:08:32', NULL, 786, NULL, NULL),
(73, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, 0, '2018-04-17 18:08:53', '2018-04-17 18:08:53', NULL, 786, NULL, NULL),
(74, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, 0, '2018-04-17 18:10:49', '2018-04-17 18:10:49', NULL, 786, NULL, NULL),
(75, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, 0, '2018-04-17 18:23:41', '2018-04-17 18:23:41', NULL, 786, NULL, NULL),
(76, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, 0, '2018-04-17 18:43:52', '2018-04-17 18:43:52', NULL, 786, NULL, NULL),
(77, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, NULL, 0, '2018-04-17 18:50:39', '2018-04-17 18:50:39', NULL, 786, NULL, NULL),
(78, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, 0, '2018-04-17 18:50:39', '2018-04-17 18:50:39', NULL, 786, NULL, NULL),
(79, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, 0, '2018-04-17 18:51:18', '2018-04-17 18:51:18', NULL, 786, NULL, NULL),
(80, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, 0, '2018-04-17 18:54:55', '2018-04-17 18:54:55', NULL, 786, NULL, NULL),
(81, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, 0, '2018-04-17 18:55:07', '2018-04-17 18:55:07', NULL, 786, NULL, NULL),
(83, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, 0, '2018-04-18 11:34:29', '2018-04-18 11:34:29', NULL, 786, NULL, NULL),
(84, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, 0, '2018-04-18 11:38:36', '2018-04-18 11:38:36', NULL, 786, NULL, NULL),
(85, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, 0, '2018-04-18 11:38:55', '2018-04-18 11:38:55', NULL, 786, NULL, NULL),
(86, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, 0, '2018-04-18 11:39:24', '2018-04-18 11:39:24', NULL, 786, NULL, NULL),
(87, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, 0, '2018-04-18 11:39:51', '2018-04-18 11:39:51', NULL, 786, NULL, NULL),
(88, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, 0, '2018-04-18 11:47:33', '2018-04-18 11:47:33', NULL, 786, NULL, NULL),
(89, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, NULL, 0, '2018-04-18 12:02:12', '2018-04-18 12:02:12', NULL, 786, NULL, NULL),
(90, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, 0, '2018-04-18 12:02:42', '2018-04-18 12:02:42', NULL, 786, NULL, NULL),
(91, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, 0, '2018-04-18 12:03:00', '2018-04-18 12:03:00', NULL, 786, NULL, NULL),
(92, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, 0, '2018-04-18 12:03:56', '2018-04-18 12:03:56', NULL, 786, NULL, NULL),
(93, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, 0, '2018-04-18 12:04:35', '2018-04-18 12:04:35', NULL, 786, NULL, NULL),
(94, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, NULL, 0, '2018-04-18 12:04:54', '2018-04-18 12:04:54', NULL, 786, NULL, NULL),
(95, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, 0, '2018-04-18 12:04:55', '2018-04-18 12:04:55', NULL, 786, NULL, NULL),
(96, 786, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, 0, '2018-04-18 12:05:54', '2018-04-18 12:05:54', NULL, 786, NULL, NULL);

CREATE TABLE `crm_contact_address` (
  `id_crm_contact` int(11) NOT NULL,
  `id_crm_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_contact_address` (`id_crm_contact`, `id_crm_address`) VALUES
(79, 21),
(80, 21),
(81, 21),
(83, 21),
(84, 21),
(85, 21),
(86, 21),
(87, 21),
(88, 21),
(89, 21),
(90, 21),
(91, 21),
(92, 21),
(93, 21),
(94, 21),
(95, 21),
(96, 21);

CREATE TABLE `crm_contact_role_master` (
  `id` int(11) NOT NULL,
  `contact_role` varchar(50) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `crm_industry_master` (
  `id` int(11) NOT NULL,
  `industry_name` varchar(50) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_industry_master` (`id`, `industry_name`, `weight`) VALUES
(1, 'Wireless Industry', 0),
(2, 'ASP (Application Service Provider)', 0),
(3, 'Real Estate', 0),
(4, 'Service Provider', 0),
(5, 'Data/Telecom OEM', 0),
(6, 'ERP (Enterprise Resource Planning)', 0),
(7, 'Government/Military', 0),
(8, 'Large Enterprise', 0),
(9, 'MSP (Management Service provider', 0),
(10, 'Network Equippment Enterprise', 0),
(11, 'Storage Service Provider', 0),
(12, 'Storage Equipment', 0),
(13, 'System Integrator', 0);

CREATE TABLE `crm_lead` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `fax_opt_out` tinyint(1) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `email_opt_out` tinyint(1) DEFAULT '0',
  `website` varchar(100) DEFAULT NULL,
  `annual_revenue` decimal(18,0) DEFAULT NULL,
  `no_of_employees` int(8) DEFAULT NULL,
  `last_transfer_date` date DEFAULT NULL,
  `description` text,
  `id_crm_lead_status_master` int(11) DEFAULT NULL,
  `id_crm_rating_master` int(11) DEFAULT NULL,
  `id_crm_industry_master` int(11) DEFAULT NULL,
  `id_crm_lead_source_master` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_lead` (`id`, `owner`, `company_name`, `title`, `first_name`, `last_name`, `mobile`, `do_not_call`, `phone`, `fax`, `fax_opt_out`, `email`, `email_opt_out`, `website`, `annual_revenue`, `no_of_employees`, `last_transfer_date`, `description`, `id_crm_lead_status_master`, `id_crm_rating_master`, `id_crm_industry_master`, `id_crm_lead_source_master`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 786, 'Ratru', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-06 15:55:15', '2018-04-30 12:57:04', NULL, 786, NULL, 786),
(2, 786, 'test company', NULL, 'demo', 'jkjk', NULL, 0, NULL, '45125478894', 0, NULL, 0, 'www.test.com', '123456', 600, NULL, NULL, 2, 5, 4, 3, 0, '2018-04-06 15:53:33', '2018-04-30 12:57:11', NULL, 786, 786, 786),
(7, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:01:07', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(8, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:03:58', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(9, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:04:28', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(10, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:04:31', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(11, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:04:33', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(13, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:27:29', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(14, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:41:57', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(15, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:09', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(16, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:25', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(17, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:37', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(18, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:38', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(19, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:39', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(20, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:39', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(21, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, 4, 6, 4, 3, 0, '2018-04-05 11:42:39', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(22, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:39', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(23, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:40', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(24, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:40', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(25, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:42:58', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(26, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:43:08', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(27, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:43:09', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(28, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:43:09', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(29, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:43:09', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(30, 786, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:43:09', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(31, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:43:09', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(32, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:43:09', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(33, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:43:10', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(34, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:43:10', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(35, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:44:03', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(39, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:46:06', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(40, 786, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, 2, 3, 0, '2018-04-05 11:46:32', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(41, 786, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 11:46:32', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(42, 786, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, 2, 3, 0, '2018-04-05 12:02:17', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(43, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, 2, 3, 0, '2018-04-05 12:02:55', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(44, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, 2, 3, 0, '2018-04-05 12:03:42', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(45, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, 2, 3, 0, '2018-04-05 12:09:53', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(46, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 12:22:50', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(47, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 13:56:13', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(48, 786, 'E-virtusal Services', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '525252', 9999999, NULL, NULL, NULL, 6, 3, 3, 0, '2018-04-05 14:19:50', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(49, 786, 'E-virtusal Services', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5252522', 99999999, NULL, NULL, NULL, 6, 3, 3, 0, '2018-04-05 14:22:14', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(50, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:19', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(51, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:20', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(52, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:22', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(53, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:22', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(54, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:22', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(55, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:22', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(56, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:22', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(57, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:23', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(58, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:23', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(59, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:23', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(60, 786, 'Asergis', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-05 15:20:23', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(61, 786, 'E-virtusal Services', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '25252', 250, NULL, NULL, NULL, 6, 3, 3, 0, '2018-04-05 18:14:35', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(62, 786, 'Asergis Telecom', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '4545455', 5000, NULL, NULL, NULL, 6, 4, 3, 0, '2018-04-05 19:02:48', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(67, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:05:32', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(68, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, 600, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:05:54', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(69, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:06:55', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(70, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, 100, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:07:02', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(71, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, 5222, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:07:23', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(72, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, 4500, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:07:33', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(73, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:07:38', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(74, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:16:28', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(75, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:16:39', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(76, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:17:53', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(77, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:18:46', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(78, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:19:27', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(79, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:19:40', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(80, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:22:26', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(81, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:22:49', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(82, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:22:55', '2018-04-30 12:57:11', NULL, 786, NULL, 786),
(83, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:23:00', '2018-04-30 12:57:11', NULL, 786, NULL, 786),
(84, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:23:06', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(85, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:23:37', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(86, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:23:41', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(87, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:24:09', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(88, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:24:21', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(89, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:26:17', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(90, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:26:35', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(91, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:26:35', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(92, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-06 15:26:51', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(94, 786, 'Friend', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-06 15:51:46', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(95, 786, 'fgfdhgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-10 16:23:39', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(96, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '525252', NULL, NULL, NULL, NULL, 7, 1, 3, 0, '2018-04-11 19:04:33', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(97, 786, 'nhjhn', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '5000', 500, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-16 14:12:21', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(98, 786, 'nhjhn', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-16 14:12:54', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(99, 786, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-16 14:13:33', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(100, 786, 'dfgdfgsdf', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '0', NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 14:25:47', '2018-04-30 12:57:11', NULL, 786, NULL, 786),
(101, 786, 'sdfgdfsgdf', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '0', NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 14:28:00', '2018-04-30 12:57:11', NULL, 786, NULL, 786),
(102, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '0', NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 14:32:39', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(103, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '0', NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 14:33:48', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(104, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', '0', NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 14:37:44', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(105, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 14:39:13', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(106, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 14:40:20', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(107, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 14:41:37', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(108, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 14:43:27', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(109, 786, 'hghhg', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 17:58:06', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(110, 786, 'hghhg', NULL, 'demo', 'jkjk', NULL, 0, NULL, '', 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-16 18:40:08', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(130, 786, 'fdff', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-17 15:21:23', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(133, 786, 'fdff', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, 2, 5, NULL, 3, 0, '2018-04-17 15:23:03', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(134, 786, 'fdff', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, 2, 5, NULL, 3, 0, '2018-04-17 15:25:00', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(135, 786, 'fdff', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, 2, 5, NULL, 3, 0, '2018-04-17 15:31:46', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(136, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-17 15:32:39', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(137, 786, 'Software Company', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-17 15:33:17', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(138, 786, 'CWS Technology', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-17 15:44:16', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(139, 786, 'WebSoft Technology', NULL, 'demo', 'jkjk', NULL, 0, NULL, '52451245', 0, NULL, 0, 'https://www.solanki.com', '525252', NULL, NULL, NULL, NULL, 6, 2, 3, 0, '2018-04-17 15:56:26', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(140, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, 2, 5, NULL, 3, 0, '2018-04-17 15:57:03', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(141, 786, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '52451245', 0, NULL, 0, 'https://www.solanki.com', '525252', NULL, NULL, NULL, NULL, 6, 3, 3, 0, '2018-04-17 16:00:58', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(142, 786, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, 2, 5, NULL, 3, 0, '2018-04-17 16:04:07', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(143, 786, 'fdff', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, 2, 5, NULL, 3, 0, '2018-04-17 16:05:26', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(144, 786, 'fdff', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, 2, 5, NULL, 3, 0, '2018-04-17 16:12:09', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(145, 786, 'Software Company', NULL, 'demo', 'jkjk', NULL, 0, NULL, '52451245', 0, NULL, 0, 'https://www.solanki.com', '525252', 9999999, NULL, NULL, NULL, 7, 2, 3, 0, '2018-04-17 16:13:49', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(146, 786, 'dfhdjhfdj', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, '2018-04-17 16:28:50', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(147, 1, 'test company', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, 'https://www.solanki.com', NULL, NULL, NULL, NULL, NULL, 5, 1, 3, 0, '2018-04-17 16:33:22', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(148, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-17 17:09:23', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(149, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-17 17:09:24', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(150, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-17 17:09:39', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(151, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-17 17:09:56', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(152, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-17 17:10:05', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(153, 786, 'hasan Account', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 0, '2018-04-17 17:10:09', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(154, 1, 'Software Company', NULL, 'demo', 'jkjk', NULL, 0, NULL, '52451245', 0, NULL, 0, NULL, '525252', 9999999, NULL, NULL, NULL, 7, 4, 3, 0, '2018-04-17 17:39:03', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(155, 1, 'Software Company', NULL, 'demo', 'jkjk', NULL, 0, NULL, '52451245', 0, NULL, 0, 'https://www.solanki.com', '525252', 9999999, NULL, NULL, NULL, 6, 2, 3, 0, '2018-04-17 17:41:05', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(156, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 7, 13, 3, 0, '2018-04-17 17:52:57', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(157, 786, 'Software Company', NULL, 'demo', 'jkjk', NULL, 0, NULL, '52451245', 0, NULL, 0, 'https://www.solanki.com', '525252', 9999999, NULL, NULL, NULL, 7, 3, 3, 0, '2018-04-17 18:09:35', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(158, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '52451245', 0, NULL, 0, 'https://www.solanki.com', '525252', 9999999, NULL, NULL, NULL, 7, 7, 3, 0, '2018-04-17 18:11:29', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(159, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, '52451245', 0, NULL, 0, NULL, '525252', 9999999, NULL, NULL, NULL, 7, 4, 3, 0, '2018-04-17 18:13:16', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(160, 786, 'fdff', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, 2, 5, NULL, 3, 0, '2018-04-17 18:15:43', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(161, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '12524', 2525, NULL, NULL, 2, 5, NULL, 3, 0, '2018-04-17 18:18:43', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(162, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, 3, 0, '2018-04-17 18:20:27', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(163, 786, 'hjghjgh', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, 3, 0, '2018-04-17 18:22:19', '2018-04-30 12:57:11', NULL, 786, NULL, NULL),
(164, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, 3, 0, '2018-04-17 18:23:12', '2018-04-30 12:57:11', NULL, 786, 786, NULL),
(165, 1, 'dfdfd', NULL, 'demo', 'jkjk', NULL, 0, NULL, '52451245', 0, NULL, 0, 'https://www.solanki.com', '525252', 9999999, NULL, NULL, NULL, 6, 2, 3, 0, '2018-04-18 10:32:24', '2018-04-30 12:57:11', NULL, 786, 786, NULL);

CREATE TABLE `crm_lead_address` (
  `id_crm_lead` int(11) NOT NULL,
  `id_crm_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_lead_address` (`id_crm_lead`, `id_crm_address`) VALUES
(8, 1),
(9, 2),
(10, 3),
(11, 4),
(13, 5),
(25, 6),
(35, 7),
(39, 8),
(40, 9),
(42, 10),
(43, 11),
(44, 12),
(45, 13),
(47, 14),
(48, 15),
(49, 16),
(49, 17),
(61, 18),
(62, 19),
(94, 20),
(2, 21),
(1, 22),
(95, 23),
(96, 24),
(100, 26),
(101, 27),
(102, 28),
(103, 29),
(104, 30),
(105, 31),
(106, 32),
(107, 33),
(108, 34),
(109, 36),
(110, 38),
(136, 39),
(137, 40),
(138, 41),
(139, 42),
(141, 43),
(145, 44),
(147, 45),
(154, 46),
(155, 47),
(156, 48),
(157, 49),
(158, 50),
(159, 51),
(162, 52),
(163, 53),
(164, 54),
(165, 55);

CREATE TABLE `crm_lead_contact_parent` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` text,
  `id_crm_lead_source_master` int(11) DEFAULT NULL,
  `is_lead` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_lead_contact_parent` (`id`, `first_name`, `title`, `designation`, `phone`, `mobile`, `email`, `description`, `id_crm_lead_source_master`, `is_lead`) VALUES
(1, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(2, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(3, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(4, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(5, 'Hasan', 'Mr.', 'Developer', NULL, '7503244045', 'test@mail.com', 'Its my test descriptiomn', NULL, 1),
(6, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(7, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(8, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(9, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(10, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(11, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(12, 'rezxa', NULL, 'dfdfd', NULL, NULL, NULL, NULL, 1, 1),
(13, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(14, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(15, 'Aditi', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(16, 'Amita', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(17, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(18, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(19, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(20, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(21, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(22, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(23, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(24, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(25, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(26, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(27, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(28, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(29, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(30, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(31, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(32, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(33, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(34, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(35, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(36, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(37, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(38, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(39, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(40, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(41, 'Abc', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(42, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, 1, 1),
(43, 'rezxa', NULL, 'Tester', NULL, NULL, NULL, NULL, 1, 1),
(44, 'hello', NULL, 'Tester', NULL, NULL, NULL, NULL, 1, 1),
(45, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(46, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(47, 'Arjun', 'Test Title', 'SSP', '7845125478', '7845125478', 'test@gmail.com', NULL, 1, 1),
(48, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(49, 'hasan', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(50, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(51, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(52, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(53, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(54, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(55, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(56, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(57, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(58, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(59, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(60, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(61, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(62, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(63, 'Arjun', NULL, 'SSP', NULL, NULL, NULL, NULL, NULL, 1),
(64, 'hello', NULL, 'Tester', NULL, NULL, NULL, NULL, 1, 1),
(65, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(66, 'hello', NULL, 'Tester', NULL, NULL, NULL, NULL, 1, 1),
(67, 'kaushal', 'Mr', 'React Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', 'iio;io;', 2, 1),
(68, 'Ram ', 'Mr', 'React Developer', '9911136424', '88888888888', 'kaushal.solanki@asergis.in', 'wqwqwqw', 3, 1),
(69, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(70, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(71, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(72, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(73, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(74, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(75, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(76, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(77, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(78, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(79, 'Deepika', NULL, NULL, '989898989898', NULL, 'deepika.srivastav@asergis.in', NULL, NULL, 1),
(80, 'Ashwani ', 'Mrs', 'React Developer Advanced', '11111111111111', '22222222222222222', 'kaushal.solanki@asergis.in', 'dgdfgd', 3, 1),
(81, 'Ashwani', 'Mr', 'UI Developer', '9891757272', '9891667272', 'akumar757272@gmail.com', 'Build responsive, mobile-first projects on the web with the world\'s most popular front-end component library.\n\nBootstrap is an open source toolkit for developing with HTML, CSS, and JS. Quickly prototype your ideas or build your entire app with our Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful plugins built on jQuery.\n\n', 3, 1),
(82, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(83, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(84, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(85, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(86, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(87, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(88, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(89, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(90, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(91, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(92, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(93, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(94, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(95, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(96, 'rezxa', 'fgfhfghgh', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(97, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(98, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(99, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(100, 'rezxa', NULL, '5656', NULL, NULL, NULL, NULL, NULL, 1),
(101, 'rezxa', NULL, '6567', NULL, NULL, NULL, NULL, NULL, 1),
(102, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(103, 'rezxa', NULL, '', NULL, NULL, NULL, NULL, NULL, 1),
(104, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(105, 'rezxa', NULL, '45454', NULL, NULL, NULL, NULL, NULL, 1),
(106, 'rezxa', NULL, '', NULL, NULL, NULL, NULL, NULL, 1),
(107, 'rezxa', NULL, '', NULL, NULL, NULL, NULL, NULL, 1),
(108, 'rezxa', NULL, '', NULL, NULL, NULL, NULL, NULL, 1),
(109, 'rezxa', NULL, '5655', NULL, NULL, NULL, NULL, NULL, 1),
(110, 'rezxa', NULL, '5655', NULL, NULL, NULL, NULL, NULL, 1),
(111, 'rezxa', NULL, '', NULL, NULL, NULL, NULL, NULL, 1),
(112, 'Ankit', '', '', '965201', '965000', 'a@a.com', '', 5, 1),
(113, 'Ankit', NULL, NULL, '654123', NULL, 'a@a.com', NULL, 2, 1),
(114, 'Ghert', NULL, NULL, '562413', NULL, 'as@a.com', NULL, 3, 1),
(115, 'lokpal', NULL, 'node js ', '456123', NULL, 'a@a.com', NULL, 3, 1),
(116, 'kaushal', 'developer', 'React Developer', '9911136424', NULL, NULL, NULL, NULL, 1),
(117, 'kaushal', 'developer', 'React Developer', '9911136424', NULL, NULL, NULL, NULL, 1),
(118, 'kaushal', 'developer', 'React Developer', '9911136424', NULL, NULL, NULL, NULL, 1),
(119, 'kaushal', 'developer', 'React Developer', '9911136424', NULL, NULL, NULL, NULL, 1),
(120, 'kaushal', 'developer', 'React Developer', '9911136424', NULL, NULL, NULL, NULL, 1),
(121, 'kaushal', 'developer', 'React Developer', '9911136424', NULL, NULL, NULL, NULL, 1),
(122, 'kaushal', 'developer', 'React Developer', '9911136424', NULL, NULL, NULL, NULL, 1),
(123, 'ak', 'developer', 'react developer', '5555555', '9999999999', 'ag@gmail.com', NULL, NULL, 1),
(124, 'ak', 'developer', 'react developer', '5555555', '9999999999', 'ag@gmail.com', NULL, NULL, 1),
(125, 'ak', 'developer', 'react developer', '5555555', '9999999999', 'ag@gmail.com', NULL, NULL, 1),
(126, 'ak', 'developer', 'react developer', '5555555', '9999999999', 'ag@gmail.com', NULL, NULL, 1),
(127, 'ak', 'developer', 'react developer', '5555555', '9999999999', 'ag@gmail.com', NULL, NULL, 1),
(128, 'ak', 'developer', 'react developer', '5555555', '9999999999', 'ag@gmail.com', NULL, NULL, 1),
(129, 'gfgfg', NULL, NULL, '3434343434', NULL, 'fffs@dfsdf.cm', NULL, 1, 1),
(130, 'kaushal', 'Mrs', 'React Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', 'ghgjjhjgh', 3, 1),
(131, 'fff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(132, 'hasan', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(133, 'hasan', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(134, 'hasan', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(135, 'hasan', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(136, 'hasan', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(137, 'hasan', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(138, 'hasan', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(139, 'hasan', NULL, 'Tester', NULL, NULL, NULL, NULL, NULL, 1),
(140, 'rezxa', NULL, 'dfdfd', NULL, NULL, NULL, NULL, 1, 1),
(141, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(142, 'rezxa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(143, 'dfgdfg', NULL, NULL, '456464568855', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(144, 'ergdsgsdf', NULL, NULL, '564654664', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(145, 'kaushal', NULL, NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(146, 'kaushal', NULL, NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(147, 'kaushal', NULL, NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(148, 'kaushal', NULL, NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(149, 'kaushal', NULL, NULL, '9911136424', '88888888888', 'kaushal.solanki@asergis.in', NULL, 1, 1),
(150, 'kaushal', NULL, NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(151, 'kaushal', NULL, NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(152, 'ak2', 'Ms', 'react test', '5555555', '99999999999', 'gfgfdg@gmail.com', 'fdsfdfds', NULL, 1),
(153, 'rrr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(154, 'uu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(155, 'rr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(156, 'rr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(157, 'r12', 'Dr', 'rr', '99999999999', '999999999999', 'gfgfdg@gmail.com', 'dfdfdf hhh yy uu', NULL, 1),
(158, 'ajit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(159, 'ak2', 'Mrs', 'dee', '999999999998', '7777777777778', 'gfgfdg2@gmail.com', 'testxxx', NULL, 1),
(160, 'rr', 'Mrs', 'ui dev', '99999999999', '999999999995', 'gfgfdg@gmail.com', 'ttttt', NULL, 1),
(161, 'tt', NULL, NULL, '9911136424', NULL, 'gfgfdg@gmail.com', NULL, 1, 1),
(162, 'Ram cxzcx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(163, 'Ram SIngh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(164, 'ddsdsd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(165, 'tt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(166, 'rr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(167, 'abc', 'Mr', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(168, 'ak', NULL, NULL, '9911136424', NULL, 'gfgfdg@gmail.com', NULL, 1, 1),
(169, 'ajitrr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(170, 'sanjay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(171, 'aktesttt', 'Dr', 'ui devvv', '99999999999', '777777777777', 'gfgfdg@gmail.com', 'fdfdsf', NULL, 1),
(172, 'rr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(173, 'ttttt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(174, 'test17', 'Mrs', NULL, NULL, NULL, NULL, NULL, 2, 1),
(175, 'test17-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(176, 'test17-33yy', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
(177, 'tt-17 apr', 'Mrs', NULL, NULL, NULL, NULL, NULL, 15, 1),
(178, 'aktesttt-3366', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
(179, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(180, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(181, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(182, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(183, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(184, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(185, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(186, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(187, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(188, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(189, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(190, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(191, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(192, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(193, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(194, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(195, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(196, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(197, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(198, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(199, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(200, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(201, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(202, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(203, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(204, 'kaushal', NULL, NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(205, 'Ram', NULL, NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(206, 'Chote ', NULL, NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 1, 1),
(207, 'jhau', 'Mr', 'React Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', 'xcxcz', 3, 1),
(208, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(209, 'Ram ', 'Mrs', 'React Developer', '1425635241', '8057145263', 'kaushal.solanki@asergis.in', 'xxcsdcsdcsdc', 3, 1),
(210, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(211, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(212, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(213, 'Arif', NULL, 'Node Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', 'Hello Guys,', 3, 1),
(214, 'jjjj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(215, 'rezxa', NULL, '5655', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', 'rtyrthrth', 1, 1),
(216, 'rezxa', NULL, '5655', NULL, NULL, NULL, NULL, NULL, 1),
(217, 'rezxa', NULL, '5655', NULL, NULL, NULL, NULL, NULL, 1),
(218, 'rezxa', NULL, '5655', NULL, NULL, NULL, NULL, NULL, 1),
(219, 'rezxa', NULL, '5655', NULL, NULL, NULL, NULL, NULL, 1),
(220, 'rezxa', NULL, '5655', NULL, NULL, NULL, NULL, NULL, 1),
(221, 'rezxa', NULL, '5655', NULL, NULL, NULL, NULL, NULL, 1),
(222, 'kaushalvvvvvvvvvvvvvvvvvv', 'Mr', 'React Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', NULL, 3, 1),
(223, 'kaushalqqqqqqqqqqqqqqqqqqqqq', 'Prof', 'React Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', 'ghjhjh', 5, 1),
(224, 'Nitin', 'Prof', NULL, '9911136424', '8057145263', 'kaushal.solanki@asergis.in', NULL, 21, 1),
(225, 'Ajityyyyyyyyyyyyyyyyyyyyyyy', 'Mr', 'React Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', 'sdsd', 14, 1),
(226, 'Gangarrrrrrrrrrrrrrrrrrrrr', 'Prof', 'React Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', 'xcxc', 21, 1),
(227, 'Ankit', 'Prof', 'React Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', NULL, 11, 1),
(228, 'kaushakl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(229, 'kaushakl', 'Mr', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(230, 'rahul', 'Dr', NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 11, 1),
(231, 'Arjun', 'Prof', NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 6, 1),
(232, 'kaushal', 'Prof', NULL, '9911136424', NULL, 'kaushal.solanki@asergis.in', NULL, 3, 1),
(233, 'Ariflllllllllllllllll', 'Dr', 'React Developer', '9911136424', '8057145263', 'kaushal.solanki@asergis.in', 'fasdfdffd', 5, 1),
(236, 'ak', 'developer', 'react developer', '5555555', '9999999999', 'ag@gmail.com', NULL, NULL, 1);

CREATE TABLE `crm_lead_source_master` (
  `id` int(11) NOT NULL,
  `source` varchar(50) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_lead_source_master` (`id`, `source`, `weight`) VALUES
(1, 'Advertisement', 0),
(2, 'Social', 0),
(3, 'Employee Referral', 0),
(5, 'Trade Show', 0),
(6, 'Web', 0),
(9, 'None', 0),
(11, 'External Referral', 0),
(12, 'Online Store', 0),
(13, 'Public Relations', 0),
(14, 'Sales Email Alias', 0),
(15, 'Seminar Partner', 0),
(16, 'Internal Seminar', 0),
(17, 'Web Download', 0),
(19, 'Web Research', 0),
(20, 'Chat', 0),
(21, 'Partner', 0);

CREATE TABLE `crm_lead_status_master` (
  `id` int(11) NOT NULL,
  `status` varchar(40) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_lead_status_master` (`id`, `status`, `weight`) VALUES
(1, 'None', 0),
(2, 'New', 0),
(4, 'Working', 0),
(5, 'Qualified', 0),
(6, 'Unqualified', 0),
(9, 'Attempted to Contact', 0),
(10, 'Contact in Future', 0),
(11, 'Contacted', 0),
(12, 'Junk Lead', 0),
(13, 'Not Contacted', 0),
(14, 'Lost Lead', 0),
(15, 'Pre-Qualified', 0);

CREATE TABLE `crm_model_attachement` (
  `id` int(11) NOT NULL,
  `model_name` enum('Lead','Contact','Company','Opportunity','Campaign') NOT NULL,
  `model_id` int(11) NOT NULL,
  `minio_file_id` varchar(100) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_model_attachement` (`id`, `model_name`, `model_id`, `minio_file_id`, `is_deleted`, `created_at`, `deleted_at`, `created_by`, `deleted_by`) VALUES
(1, 'Contact', 2, '06f444f0-34ca-11e8-9ad5-87fe3de8757e', 0, '2018-04-12 16:14:02', NULL, 786, NULL),
(4, 'Contact', 2, '8292d860-34ca-11e8-9ad5-87fe3de8757e', 0, '2018-04-12 16:14:12', NULL, 786, NULL),
(5, 'Lead', 2, 'xfghgfdg yz', 0, '2018-04-12 16:14:19', NULL, 786, NULL),
(6, 'Contact', 2, 'abc', 1, '2018-04-12 16:46:23', '2018-04-12 16:54:06', 786, NULL),
(7, 'Contact', 2, 'xyz', 0, '2018-04-12 16:46:23', NULL, 786, NULL),
(8, 'Lead', 2, 'abc', 0, '2018-04-12 16:46:36', NULL, 786, NULL),
(9, 'Lead', 2, 'xyz', 0, '2018-04-12 16:46:36', NULL, 786, NULL);

CREATE TABLE `crm_model_note` (
  `id` int(11) NOT NULL,
  `model_name` enum('Lead','Contact','Company','Opportunity','Campaign') NOT NULL,
  `model_id` int(11) NOT NULL,
  `note_title` varchar(255) DEFAULT NULL,
  `note_description` text NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_model_note` (`id`, `model_name`, `model_id`, `note_title`, `note_description`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(2, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(5, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(6, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(7, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(8, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(9, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(10, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(11, 'Lead', 2, 'Note Title test now', 'ad InformationLer entering the leaLead Source (none, advertisement, employee referral, external referral, other, social, trade show, web, word of mouth', 1, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(12, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(13, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(14, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(15, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(16, 'Contact', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(17, 'Contact', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(18, 'Contact', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(19, 'Contact', 2, 'hello arif', 'arif testter', 0, '2018-04-16 10:28:44', '2018-04-16 10:28:44', NULL, 0, NULL, NULL),
(20, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 06:56:27', '2018-04-16 07:14:16', '2018-04-16 07:14:16', 786, NULL, 786),
(21, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 06:56:53', '2018-04-16 07:14:20', '2018-04-16 07:14:20', 786, NULL, 786),
(22, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 06:56:53', '2018-04-16 07:14:27', '2018-04-16 07:14:27', 786, NULL, 786),
(23, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 06:56:54', '2018-04-16 07:18:22', '2018-04-16 07:18:22', 786, NULL, 786),
(24, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 06:57:55', '2018-04-16 07:20:17', '2018-04-16 07:20:17', 786, NULL, 786),
(25, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 06:57:55', '2018-04-16 07:20:22', '2018-04-16 07:20:22', 786, NULL, 786),
(26, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 06:57:56', '2018-04-16 07:20:24', '2018-04-16 07:20:24', 786, NULL, 786),
(27, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 06:59:05', '2018-04-16 07:20:32', '2018-04-16 07:20:32', 786, NULL, 786),
(28, 'Lead', 2, 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 1, '2018-04-16 07:00:37', '2018-04-16 07:20:46', '2018-04-16 07:20:46', 786, NULL, 786),
(29, 'Lead', 2, 'What are HOCs and why use them with ReactTable', 'What are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTable', 1, '2018-04-16 07:01:29', '2018-04-16 07:19:04', '2018-04-16 07:19:04', 786, NULL, 786),
(30, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 07:05:41', '2018-04-16 07:20:35', '2018-04-16 07:20:35', 786, NULL, 786),
(31, 'Lead', 2, 'How Railways releases berths under Emergency Quota', 'How Railways releases berths under Emergency Quota', 1, '2018-04-16 07:08:47', '2018-04-16 07:20:45', '2018-04-16 07:20:45', 786, 786, 786),
(32, 'Lead', 2, 'What are HOCs and why use them with ReactTable', 'What are HOCs and why use them with ReactTable\n\n\nWhat are HOCs and why use them with ReactTable', 1, '2018-04-16 07:10:30', '2018-04-16 07:20:43', '2018-04-16 07:20:43', 786, 786, 786),
(33, 'Lead', 2, 'What are HOCs and why use them with ReactTable', 'What are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTable', 1, '2018-04-16 07:10:44', '2018-04-16 07:20:41', '2018-04-16 07:20:41', 786, NULL, 786),
(34, 'Lead', 2, 'What are HOCs and why use them with ReactTable', 'What are HOCs and why use them with ReactTable', 1, '2018-04-16 07:11:24', '2018-04-16 07:20:40', '2018-04-16 07:20:40', 786, NULL, 786),
(35, 'Lead', 2, 'What are HOCs and why use them with ReactTable', 'What are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTableWhat are HOCs and why use them with ReactTable', 1, '2018-04-16 07:11:37', '2018-04-16 07:20:03', '2018-04-16 07:20:03', 786, NULL, 786),
(36, 'Lead', 2, 'What are HOCs and why use them with ReactTable', 'What are HOCs and why use them with ReactTable', 1, '2018-04-16 07:23:43', '2018-04-16 07:42:11', '2018-04-16 07:42:11', 786, 786, 786),
(37, 'Lead', 2, 'hello arif', 'arif testter', 0, '2018-04-16 07:42:38', '2018-04-16 11:10:01', NULL, 786, 786, NULL),
(38, 'Lead', 2, 'How Railways releases berths under Emergency Quota', 'How Railways releases berths under Emergency Quota', 1, '2018-04-16 07:44:08', '2018-04-17 13:07:03', '2018-04-17 13:07:03', 786, 786, 786),
(39, 'Lead', 2, 'MS Dhoni', 'MS Dhoni\'s daughter Ziva celebrates CSK\'s win over KKR with Shah Rukh Khan- See pic', 1, '2018-04-16 08:41:03', '2018-04-17 13:07:04', '2018-04-17 13:07:04', 786, NULL, 786),
(40, 'Lead', 2, 'svsv', 'sdvsdvsd', 1, '2018-04-16 08:45:42', '2018-04-17 13:07:05', '2018-04-17 13:07:05', 786, 786, 786),
(41, 'Lead', 2, 'note title', 'note title', 1, '2018-04-16 08:48:01', '2018-04-16 08:48:07', '2018-04-16 08:48:07', 786, NULL, 786),
(42, 'Lead', 2, 'note title', 'note title', 1, '2018-04-16 08:48:16', '2018-04-17 13:07:05', '2018-04-17 13:07:05', 786, NULL, 786),
(43, 'Lead', 2, 'note titlenote titlenote title', 'note titlenote titlenote title', 1, '2018-04-16 08:48:40', '2018-04-17 13:07:05', '2018-04-17 13:07:05', 786, NULL, 786),
(44, 'Lead', 2, 'note titlenote titlenote title', 'note titlenote titlenote titlenote titlenote titlenote titlenote titlenote titlenote titlenote title', 1, '2018-04-16 08:49:09', '2018-04-17 13:07:06', '2018-04-17 13:07:06', 786, NULL, 786),
(45, 'Lead', 2, 'note title', 'note title', 1, '2018-04-16 08:50:25', '2018-04-17 13:07:06', '2018-04-17 13:07:06', 786, NULL, 786),
(46, 'Lead', 2, 'What are HOCs and why use them with ReactTable', 'What are HOCs and why use them with ReactTable', 1, '2018-04-16 08:52:43', '2018-04-17 13:07:06', '2018-04-17 13:07:06', 786, NULL, 786),
(47, 'Lead', 2, 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 1, '2018-04-16 08:54:31', '2018-04-17 13:07:06', '2018-04-17 13:07:06', 786, NULL, 786),
(48, 'Lead', 2, 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 1, '2018-04-16 08:56:36', '2018-04-17 13:07:06', '2018-04-17 13:07:06', 786, NULL, 786),
(49, 'Lead', 2, 'What are HOCs and why use them with ReactTable', 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 1, '2018-04-16 08:58:26', '2018-04-17 13:07:07', '2018-04-17 13:07:07', 786, NULL, 786),
(50, 'Lead', 2, 'Rapes of minors shameful, is PM Narendra Modi serious about \'justice\' for daughters, asks Rahul Gandhi', 'Rapes of minors shameful, is PM Narendra Modi serious about \'justice\' for daughters, asks Rahul Gandhi', 1, '2018-04-16 09:02:07', '2018-04-17 13:07:07', '2018-04-17 13:07:07', 786, 786, 786),
(51, 'Lead', 2, 'attachedFileattachedFileattachedFile', 'attachedFile', 1, '2018-04-16 09:05:18', '2018-04-17 13:07:07', '2018-04-17 13:07:07', 786, 786, 786),
(52, 'Lead', 2, 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 'http://192.168.1.171:3020/file-upload', 1, '2018-04-16 09:23:51', '2018-04-17 13:07:08', '2018-04-17 13:07:08', 786, NULL, 786),
(53, 'Lead', 2, 'hello arif', 'arif testter', 1, '2018-04-16 09:43:33', '2018-04-17 13:07:08', '2018-04-17 13:07:08', 786, NULL, 786),
(54, 'Lead', 2, 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 'Commonwealth Games 2018, Gold Coast, Day 7 overall medals tally- live updates from Australia', 1, '2018-04-16 09:43:58', '2018-04-17 13:07:08', '2018-04-17 13:07:08', 786, NULL, 786),
(55, 'Lead', 2, 'How Railways releases berths under Emergency Quota', 'How Railways releases berths under Emergency Quota', 1, '2018-04-16 09:44:20', '2018-04-17 13:07:08', '2018-04-17 13:07:08', 786, NULL, 786),
(56, 'Lead', 2, 'The filter() method creates a new array with all elements that pass the test implemented by the provided function.', 'The filter() method creates a new array with all elements that pass the test implemented by the provided function.\n\n', 0, '2018-04-16 09:44:46', '2018-04-16 09:44:46', NULL, 786, NULL, NULL);

CREATE TABLE `crm_model_note_attachement` (
  `id` int(11) NOT NULL,
  `id_crm_model_note` int(11) NOT NULL,
  `minio_file_id` varchar(100) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_model_note_attachement` (`id`, `id_crm_model_note`, `minio_file_id`, `is_deleted`, `created_at`, `deleted_at`, `created_by`, `deleted_by`) VALUES
(10, 5, 'abc', 0, '2018-04-13 13:56:05', NULL, NULL, NULL),
(11, 5, 'xyz', 0, '2018-04-13 13:56:05', NULL, NULL, NULL),
(16, 8, 'gfg', 0, '2018-04-13 13:58:44', NULL, NULL, NULL),
(17, 8, 'xfgfgyz', 0, '2018-04-13 13:58:44', NULL, NULL, NULL),
(20, 10, 'ghjhfg', 0, '2018-04-13 13:59:31', NULL, NULL, NULL),
(21, 10, 'xfgfjhjgyz', 0, '2018-04-13 13:59:31', NULL, NULL, NULL),
(22, 11, 'ghjjhhfg', 0, '2018-04-13 13:59:47', NULL, NULL, NULL),
(23, 11, 'xfgfjhjhjjgyz', 0, '2018-04-13 13:59:47', NULL, NULL, NULL),
(29, 11, 'zyz', 1, '2018-04-13 14:21:11', '2018-04-13 15:29:34', 786, 786),
(30, 11, 'llll', 1, '2018-04-13 14:21:38', '2018-04-13 15:29:34', 786, 786),
(31, 11, 'pppp', 1, '2018-04-13 14:21:38', '2018-04-13 15:29:34', 786, 786),
(32, 12, 'ghjjhhfg', 0, '2018-04-13 17:51:54', NULL, NULL, NULL),
(33, 12, 'xfgfjhjhjjgyz', 0, '2018-04-13 17:51:54', NULL, NULL, NULL),
(34, 13, 'ghjjhhfg', 0, '2018-04-13 17:54:31', NULL, NULL, NULL),
(35, 13, 'xfgfjhjhjjgyz', 0, '2018-04-13 17:54:31', NULL, NULL, NULL),
(36, 14, 'ghjjhhfg', 0, '2018-04-13 17:54:34', NULL, NULL, NULL),
(37, 14, 'xfgfjhjhjjgyz', 0, '2018-04-13 17:54:34', NULL, NULL, NULL),
(38, 15, 'ghjjhhfg', 0, '2018-04-13 17:54:36', NULL, NULL, NULL),
(39, 15, 'xfgfjhjhjjgyz', 0, '2018-04-13 17:54:36', NULL, NULL, NULL),
(40, 16, 'ghjjhhfg', 0, '2018-04-13 17:57:25', NULL, NULL, NULL),
(41, 16, 'xfgfjhjhjjgyz', 0, '2018-04-13 17:57:25', NULL, NULL, NULL),
(42, 17, 'xfgfjhjhjjgyz', 0, '2018-04-13 18:05:13', NULL, NULL, NULL),
(43, 17, 'ghjjhhfg', 0, '2018-04-13 18:05:13', NULL, NULL, NULL),
(44, 18, 'ghjjhhfg', 0, '2018-04-13 18:05:14', NULL, NULL, NULL),
(45, 18, 'xfgfjhjhjjgyz', 0, '2018-04-13 18:05:14', NULL, NULL, NULL),
(46, 19, 'ghjjhhfg', 0, '2018-04-13 18:06:18', NULL, NULL, NULL),
(47, 19, 'xfgfjhjhjjgyz', 0, '2018-04-13 18:06:18', NULL, NULL, NULL),
(48, 10, 'xxx', 0, '2018-04-13 18:09:38', NULL, 786, NULL),
(49, 10, 'yyy', 0, '2018-04-13 18:09:38', NULL, 786, NULL),
(50, 20, 'ghjhfg', 0, '2018-04-16 12:26:27', NULL, NULL, NULL),
(51, 20, 'xfgfjhjgyz', 0, '2018-04-16 12:26:27', NULL, NULL, NULL),
(52, 21, 'ghjhfg', 0, '2018-04-16 12:26:53', NULL, NULL, NULL),
(53, 21, 'xfgfjhjgyz', 0, '2018-04-16 12:26:53', NULL, NULL, NULL),
(54, 22, 'ghjhfg', 0, '2018-04-16 12:26:53', NULL, NULL, NULL),
(55, 22, 'xfgfjhjgyz', 0, '2018-04-16 12:26:53', NULL, NULL, NULL),
(56, 23, 'ghjhfg', 0, '2018-04-16 12:26:54', NULL, NULL, NULL),
(57, 23, 'xfgfjhjgyz', 0, '2018-04-16 12:26:54', NULL, NULL, NULL),
(58, 24, 'ghjhfg', 0, '2018-04-16 12:27:55', NULL, NULL, NULL),
(59, 24, 'xfgfjhjgyz', 0, '2018-04-16 12:27:55', NULL, NULL, NULL),
(60, 25, 'ghjhfg', 0, '2018-04-16 12:27:56', NULL, NULL, NULL),
(61, 25, 'xfgfjhjgyz', 0, '2018-04-16 12:27:56', NULL, NULL, NULL),
(62, 26, 'ghjhfg', 0, '2018-04-16 12:27:56', NULL, NULL, NULL),
(63, 26, 'xfgfjhjgyz', 0, '2018-04-16 12:27:56', NULL, NULL, NULL),
(64, 27, 'ghjjhhfg', 0, '2018-04-16 12:29:05', NULL, NULL, NULL),
(65, 27, 'xfgfjhjhjjgyz', 0, '2018-04-16 12:29:05', NULL, NULL, NULL),
(66, 28, 'db5bf050-4143-11e8-bb15-e732607ac9be', 0, '2018-04-16 12:30:37', NULL, NULL, NULL),
(67, 28, 'dc242250-4143-11e8-bb15-e732607ac9be', 0, '2018-04-16 12:30:37', NULL, NULL, NULL),
(68, 29, 'fab23f40-4143-11e8-bb15-e732607ac9be', 0, '2018-04-16 12:31:29', NULL, NULL, NULL),
(69, 29, 'fc850370-4143-11e8-bb15-e732607ac9be', 0, '2018-04-16 12:31:29', NULL, NULL, NULL),
(70, 30, 'ghjhfg', 0, '2018-04-16 12:35:41', NULL, NULL, NULL),
(71, 30, 'xfgfjhjgyz', 0, '2018-04-16 12:35:41', NULL, NULL, NULL),
(72, 35, '65f7fd20-4145-11e8-bb15-e732607ac9be', 0, '2018-04-16 12:41:37', NULL, NULL, NULL),
(73, 31, '65f7fd20-4145-11e8-bb15-e732607ac9be', 1, '2018-04-16 12:42:20', '2018-04-16 12:50:45', 786, 786),
(74, 37, 'xxx', 0, '2018-04-16 13:13:05', NULL, 786, NULL),
(75, 37, 'yyy', 0, '2018-04-16 13:13:05', NULL, 786, NULL),
(76, 52, 'd996a990-4157-11e8-bb78-c9b30993b3b0', 0, '2018-04-16 14:53:51', NULL, NULL, NULL),
(77, 51, 'd996a990-4157-11e8-bb78-c9b30993b3b0', 1, '2018-04-16 14:54:24', '2018-04-17 18:37:07', 786, 786),
(78, 50, '0518d0c0-4158-11e8-bb78-c9b30993b3b0', 1, '2018-04-16 14:55:37', '2018-04-17 18:37:07', 786, 786),
(79, 40, '2d0a0900-4158-11e8-bb78-c9b30993b3b0', 1, '2018-04-16 14:56:02', '2018-04-17 18:37:05', 786, 786),
(80, 40, '34f1bd00-415a-11e8-accc-e98cfae98db4', 1, '2018-04-16 15:11:23', '2018-04-17 18:37:05', 786, 786),
(81, 40, '36772480-415a-11e8-accc-e98cfae98db4', 1, '2018-04-16 15:11:23', '2018-04-17 18:37:05', 786, 786),
(82, 40, '37546520-415a-11e8-accc-e98cfae98db4', 1, '2018-04-16 15:11:23', '2018-04-17 18:37:05', 786, 786),
(83, 40, '35b9ef00-415a-11e8-accc-e98cfae98db4', 1, '2018-04-16 15:11:23', '2018-04-17 18:37:05', 786, 786),
(84, 40, '38522610-415a-11e8-accc-e98cfae98db4', 1, '2018-04-16 15:11:23', '2018-04-17 18:37:05', 786, 786),
(85, 53, 'ghjjhhfg', 0, '2018-04-16 15:13:33', NULL, NULL, NULL),
(86, 53, 'xfgfjhjhjjgyz', 0, '2018-04-16 15:13:33', NULL, NULL, NULL),
(87, 54, 'ac880ea0-415a-11e8-accc-e98cfae98db4', 0, '2018-04-16 15:13:58', NULL, NULL, NULL),
(88, 55, 'bb8a5f70-415a-11e8-accc-e98cfae98db4', 0, '2018-04-16 15:14:20', NULL, NULL, NULL),
(89, 56, 'c2e9bb80-415a-11e8-accc-e98cfae98db4', 0, '2018-04-16 15:14:47', NULL, NULL, NULL),
(90, 56, 'c4b023a0-415a-11e8-accc-e98cfae98db4', 0, '2018-04-16 15:14:47', NULL, NULL, NULL),
(91, 56, 'c40f28b0-415a-11e8-accc-e98cfae98db4', 0, '2018-04-16 15:14:47', NULL, NULL, NULL);

CREATE TABLE `crm_opportunity` (
  `id` int(11) NOT NULL,
  `owner` int(11) DEFAULT NULL,
  `opportunity_name` varchar(100) NOT NULL,
  `opportunity_type` enum('none','existing_business','new_business') DEFAULT NULL,
  `opportunity_amount` decimal(20,2) DEFAULT NULL,
  `opportunity_closing_date` datetime NOT NULL,
  `description` text,
  `id_crm_company` int(11) NOT NULL,
  `id_crm_lead_source_master` int(11) DEFAULT NULL,
  `id_crm_pipeline_stage` tinyint(3) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_opportunity` (`id`, `owner`, `opportunity_name`, `opportunity_type`, `opportunity_amount`, `opportunity_closing_date`, `description`, `id_crm_company`, `id_crm_lead_source_master`, `id_crm_pipeline_stage`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(3, 786, 'dasddas', 'existing_business', '78.00', '2016-04-12 00:00:00', 'dfdfd', 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:43', NULL, 0, NULL, NULL),
(4, 786, 'hasan Opportunity', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(5, 786, 'hasan Opportunity', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(6, 786, 'hasan Opportunity', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(7, 786, 'hasan Opportunity', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(8, 786, 'hasan Opportunity', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 1, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(9, 786, 'hasan Opportunity', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(10, 786, 'hasan Opportunity', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(11, 786, 'hasan Opportunity', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(12, 786, '1', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(13, 786, '1', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(14, 786, '1', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(15, 786, '1', 'existing_business', '78.00', '2000-12-31 18:30:00', NULL, 67, 1, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(27, 786, 'gfg', 'existing_business', '78.00', '2016-04-07 00:00:00', 'sdfsdfdf', 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(28, 786, 'gfg', 'existing_business', '78.00', '2016-04-07 00:00:00', 'sdfsdfdf', 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(29, 786, 'gfg', 'existing_business', '78.00', '2016-04-07 00:00:00', 'sdfsdfdf', 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(30, 786, 'gfg', 'existing_business', '78.00', '2016-04-07 00:00:00', 'sdfsdfdf', 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(31, 786, 'gfg', 'existing_business', '78.00', '2016-04-07 00:00:00', 'sdfsdfdf', 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(32, 786, 'gfg', 'existing_business', '78.00', '2016-04-07 00:00:00', 'sdfsdfdf', 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(33, 786, 'Hasasn Raja', 'existing_business', '78.00', '1999-12-31 18:30:00', 'sacasca', 67, 12, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(34, 786, 'Ashwani kumar', 'existing_business', '78.00', '1999-12-31 18:30:00', 'sacasca', 67, 12, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(35, 786, 'Ashwani kumar', 'existing_business', '78.00', '1999-12-31 18:30:00', 'sacasca', 67, 12, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(36, 786, 'Ajitn ', 'existing_business', '78.00', '1999-12-31 18:30:00', 'sacasca', 67, 12, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(37, 786, 'Gaurav Chauhan', 'existing_business', '78.00', '2018-04-04 12:31:50', 'hnvbjh', 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(38, 786, 'Kaushal Solanki', 'existing_business', '78.00', '2018-04-16 12:33:27', 'ghgh', 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(39, 786, 'Gaurav Chauhan', 'existing_business', '78.00', '2018-04-02 12:52:52', 'vbmmn', 67, 2, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(40, 786, 'Gaurav Chauhan', 'existing_business', '78.00', '2018-04-09 12:53:15', 'yjhgjh', 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(41, 786, 'Ankit Gupta', 'existing_business', '78.00', '2018-04-10 12:53:59', 'sddsd', 67, 2, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(42, 786, 'uuuuuuuuuuuu', 'existing_business', '78.00', '2018-04-10 12:55:03', 'gbhfgh', 67, NULL, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(43, 786, 'ppppppppppp', 'existing_business', '78.00', '2018-04-10 12:55:49', NULL, 67, NULL, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(44, 786, 'Gaurav Chauhan', 'new_business', NULL, '2018-04-02 13:33:16', NULL, 67, 3, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(45, 786, 'rrrrrrrrrrrrrrrrrrrrrrrr', 'none', NULL, '2018-04-03 13:38:20', NULL, 67, NULL, 6, 0, '2018-04-16 10:25:16', '2018-04-30 16:28:48', NULL, 0, NULL, NULL),
(46, 786, 'tyty', NULL, NULL, '2018-04-20 00:00:00', NULL, 67, NULL, 6, 0, '2018-04-16 10:26:27', '2018-04-30 16:28:48', NULL, 786, NULL, NULL),
(47, 786, 'Gaurav Chauhan', NULL, NULL, '2018-04-02 09:29:48', NULL, 67, NULL, 6, 0, '2018-04-16 09:29:42', '2018-04-30 16:28:48', NULL, 786, NULL, NULL),
(48, 786, 'Gaurav Chauhan', NULL, NULL, '2018-04-02 09:31:03', NULL, 67, NULL, 6, 0, '2018-04-16 09:30:54', '2018-04-30 16:28:48', NULL, 786, NULL, NULL),
(49, 786, 'Ritika Chauhan', NULL, '1020.00', '2018-04-02 12:47:56', 'ghghjgh', 67, 2, 6, 0, '2018-04-16 12:48:05', '2018-04-30 16:28:48', NULL, 786, 786, NULL),
(50, 786, 'ghjghghj', 'none', '650.00', '2018-04-09 09:27:15', NULL, 67, 2, 6, 0, '2018-04-17 09:26:18', '2018-04-30 16:28:48', NULL, 786, NULL, NULL),
(51, 786, 'Gaurav Chauhan', NULL, NULL, '2018-04-02 10:15:47', NULL, 67, NULL, 6, 0, '2018-04-17 10:15:42', '2018-04-30 16:28:48', NULL, 786, NULL, NULL),
(52, 786, 'My Great Opportunity', NULL, NULL, '2018-12-03 18:30:00', NULL, 67, NULL, 6, 0, '2018-04-18 06:35:54', '2018-04-30 16:28:48', NULL, 786, NULL, NULL);

CREATE TABLE `crm_opportunity_pipeline_history` (
  `id` int(11) NOT NULL,
  `id_crm_opportunity` int(11) NOT NULL,
  `id_crm_pipeline_stage` tinyint(3) NOT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `expected_revenue` decimal(20,2) DEFAULT NULL,
  `closing_date` datetime DEFAULT NULL,
  `stage_duration` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `crm_pipeline` (
  `id` tinyint(2) NOT NULL,
  `pipeline_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_pipeline` (`id`, `pipeline_name`, `is_active`) VALUES
(1, 'Sales Pipeline', 1);

CREATE TABLE `crm_pipeline_stage` (
  `id` tinyint(3) NOT NULL,
  `id_crm_pipeline` tinyint(2) NOT NULL,
  `stage_name` varchar(40) NOT NULL,
  `win_probabality` varchar(50) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_pipeline_stage` (`id`, `id_crm_pipeline`, `stage_name`, `win_probabality`, `weight`) VALUES
(1, 1, 'None', '0', 0),
(2, 1, 'Introduction', '10', 0),
(3, 1, 'Opportunity', '20', 0),
(6, 1, 'Proposal/Price Quote', '50', 0),
(7, 1, 'Negotiation/Review', '60', 0),
(8, 1, 'Closed Won', '100', 0),
(9, 1, 'Closed Lost', '0 ', 0);

CREATE TABLE `crm_rating_master` (
  `id` int(11) NOT NULL,
  `rating` varchar(100) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_rating_master` (`id`, `rating`, `weight`) VALUES
(5, 'Warm', 0),
(6, 'Hot', 0),
(7, 'Cold', 0);

CREATE TABLE `crm_recurrence_daily` (
  `id` int(11) NOT NULL,
  `id_crm_activity_task` int(11) NOT NULL,
  `daily_option` enum('daily','weekday') DEFAULT 'daily',
  `daily_day_no` int(11) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_recurrence_daily` (`id`, `id_crm_activity_task`, `daily_option`, `daily_day_no`, `is_deleted`, `deleted_at`) VALUES
(1, 1, 'daily', 5, 0, NULL),
(2, 2, 'daily', 5, 0, NULL);

CREATE TABLE `crm_recurrence_monthly` (
  `id` int(11) NOT NULL,
  `id_crm_activity_task` int(11) NOT NULL,
  `monthly_option` enum('day','weekly') DEFAULT 'day',
  `monthly_day` tinyint(3) UNSIGNED DEFAULT NULL,
  `monthly_every_month` tinyint(3) UNSIGNED DEFAULT NULL,
  `monthly_week` varchar(25) DEFAULT NULL,
  `monthly_day_of_week` varchar(25) DEFAULT NULL,
  `monthly_of_every_month` tinyint(3) UNSIGNED DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `crm_recurrence_weekly` (
  `id` int(11) NOT NULL,
  `id_crm_activity_task` int(11) NOT NULL,
  `recur_every_week` int(11) NOT NULL DEFAULT '0',
  `weekly_monday` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 means yes and 0 means no',
  `weekly_tuesday` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 means yes and 0 means no',
  `weekly_wednesday` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 means yes and 0 means no',
  `weekly_thursday` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 means yes and 0 means no',
  `weekly_friday` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 means yes and 0 means no',
  `weekly_saturday` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 means yes and 0 means no',
  `weekly_sunday` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 means yes and 0 means no',
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `crm_recurrence_yearly` (
  `id` int(11) NOT NULL,
  `id_crm_activity_task` int(11) NOT NULL,
  `recur_every_year` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '1 means yes and 0 means no',
  `yearly_option` enum('monthly','weekly') DEFAULT 'monthly',
  `yearly_on_month` enum('january','february','march','april','may','june','july','august','september','october','november','december') DEFAULT 'january',
  `yearly_on_month_day` tinyint(4) UNSIGNED DEFAULT NULL,
  `yearly_week` enum('first','second','third','fourth','last') DEFAULT 'first',
  `yearly_day_of_week` enum('day','weekday','weekend day','sunday','monday','tuesday','wednesday','thursday','friday','saturday') DEFAULT 'monday',
  `yearly_of_every_month` enum('january','february','march','april','may','june','july','august','september','october','november','december') DEFAULT 'january',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 means deleted and 0 means undeleted',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `crm_task_status_master` (
  `id` tinyint(3) NOT NULL,
  `task_status` varchar(50) NOT NULL,
  `weight` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `crm_task_status_master` (`id`, `task_status`, `weight`) VALUES
(1, 'Not Started', 0),
(2, 'Deferred', 0),
(3, 'In Progress', 0),
(4, 'Completed', 0),
(5, 'Pending', 0);


ALTER TABLE `crm_activity_call`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `crm_activity_call_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_activity_call_link_1_idx` (`id_crm_activity_call`);

ALTER TABLE `crm_activity_event`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `crm_activity_event_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_activity_event_link_1_idx` (`id_crm_activity_event`);

ALTER TABLE `crm_activity_event_participant`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `crm_activity_task`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_crm_activity_task_1_idx` (`id_crm_task_status_master`);

ALTER TABLE `crm_activity_task_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_activity_task_link_1_idx` (`id_crm_activity_task`);

ALTER TABLE `crm_address`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_crm_campaign_type_master` (`id_crm_campaign_type_master`);

ALTER TABLE `crm_campaign_link`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `model_name` (`model_name`,`model_id`,`id_crm_campaign`,`id_crm_campaign_status_master`),
  ADD KEY `fk_crm_campaign_link_1_idx` (`id_crm_campaign`),
  ADD KEY `fk_crm_campaign_link_2_idx` (`id_crm_campaign_status_master`);

ALTER TABLE `crm_campaign_status_master`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_campaign_type_master`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_company_3_idx` (`id_crm_company_ownership_master`),
  ADD KEY `fk_crm_company_4_idx` (`id_crm_industry_master`),
  ADD KEY `fk_crm_company_1_idx` (`id_crm_company_status_master`);

ALTER TABLE `crm_company_address`
  ADD KEY `fk_crm_company_address_1_idx` (`id_crm_company`),
  ADD KEY `fk_crm_company_address_2_idx` (`id_crm_address`);

ALTER TABLE `crm_company_ownership_master`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_company_status_master`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_company_type_master`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_contact_1_idx` (`id_crm_company`),
  ADD KEY `fk_crm_contact_1_idx1` (`id_crm_lead_source_master`);

ALTER TABLE `crm_contact_address`
  ADD KEY `fk_crm_contact_address_1_idx` (`id_crm_contact`),
  ADD KEY `fk_crm_contact_address_2_idx` (`id_crm_address`);

ALTER TABLE `crm_industry_master`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_lead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_lead_1_idx` (`id_crm_lead_status_master`),
  ADD KEY `fk_crm_lead_4_idx` (`id_crm_industry_master`),
  ADD KEY `fk_crm_lead_3_idx` (`id_crm_rating_master`),
  ADD KEY `fk_crm_lead_1_idx1` (`id_crm_lead_source_master`);

ALTER TABLE `crm_lead_address`
  ADD KEY `fk_crm_lead_address_1_idx` (`id_crm_address`),
  ADD KEY `fk_crm_lead_address_2_idx` (`id_crm_lead`);

ALTER TABLE `crm_lead_contact_parent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_lead_contact_parent_1_idx` (`id_crm_lead_source_master`);

ALTER TABLE `crm_lead_source_master`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_lead_status_master`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_model_attachement`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_model_note`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_model_note_attachement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_model_note_attachement_1_idx` (`id_crm_model_note`);

ALTER TABLE `crm_opportunity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_opportunity_4_idx` (`id_crm_pipeline_stage`),
  ADD KEY `fk_crm_opportunity_5_idx` (`id_crm_lead_source_master`),
  ADD KEY `fk_crm_opportunity_2_idx` (`id_crm_company`);

ALTER TABLE `crm_opportunity_pipeline_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_opportunity_pipeline_history_1_idx` (`id_crm_pipeline_stage`),
  ADD KEY `fk_crm_opportunity_pipeline_history_2_idx` (`id_crm_opportunity`);

ALTER TABLE `crm_pipeline`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_pipeline_stage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_pipeline_stage_1` (`id_crm_pipeline`);

ALTER TABLE `crm_rating_master`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crm_recurrence_daily`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_recurrence_daily_1_idx` (`id_crm_activity_task`);

ALTER TABLE `crm_recurrence_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_recurrence_monthly_1_idx` (`id_crm_activity_task`);

ALTER TABLE `crm_recurrence_weekly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_recurrence_weekly_1_idx` (`id_crm_activity_task`);

ALTER TABLE `crm_recurrence_yearly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_crm_recurrence_yearly_1_idx` (`id_crm_activity_task`);

ALTER TABLE `crm_task_status_master`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `crm_activity_call`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `crm_activity_call_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `crm_activity_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `crm_activity_event_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `crm_activity_event_participant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `crm_activity_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `crm_activity_task_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `crm_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

ALTER TABLE `crm_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

ALTER TABLE `crm_campaign_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

ALTER TABLE `crm_campaign_status_master`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `crm_campaign_type_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `crm_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

ALTER TABLE `crm_company_status_master`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `crm_company_type_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `crm_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

ALTER TABLE `crm_industry_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

ALTER TABLE `crm_lead`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

ALTER TABLE `crm_lead_contact_parent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

ALTER TABLE `crm_lead_source_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `crm_lead_status_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `crm_model_attachement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `crm_model_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

ALTER TABLE `crm_model_note_attachement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

ALTER TABLE `crm_opportunity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

ALTER TABLE `crm_opportunity_pipeline_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `crm_pipeline`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `crm_pipeline_stage`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `crm_rating_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `crm_recurrence_daily`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `crm_recurrence_monthly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `crm_recurrence_weekly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `crm_recurrence_yearly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `crm_task_status_master`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `crm_activity_call_link`
  ADD CONSTRAINT `fk_crm_activity_call_link_1` FOREIGN KEY (`id_crm_activity_call`) REFERENCES `crm_activity_call` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `crm_activity_event_link`
  ADD CONSTRAINT `fk_crm_activity_event_link_1` FOREIGN KEY (`id_crm_activity_event`) REFERENCES `crm_activity_event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `crm_activity_task`
  ADD CONSTRAINT `fk_crm_activity_task_1` FOREIGN KEY (`id_crm_task_status_master`) REFERENCES `crm_task_status_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `crm_activity_task_link`
  ADD CONSTRAINT `fk_crm_activity_task_link_1` FOREIGN KEY (`id_crm_activity_task`) REFERENCES `crm_activity_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `crm_campaign`
  ADD CONSTRAINT `crm_campaign_ibfk_1` FOREIGN KEY (`id_crm_campaign_type_master`) REFERENCES `crm_campaign_type_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `crm_campaign_link`
  ADD CONSTRAINT `fk_crm_campaign_link_1` FOREIGN KEY (`id_crm_campaign`) REFERENCES `crm_campaign` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_crm_campaign_link_2` FOREIGN KEY (`id_crm_campaign_status_master`) REFERENCES `crm_campaign_status_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `crm_company`
  ADD CONSTRAINT `fk_crm_company_1` FOREIGN KEY (`id_crm_company_status_master`) REFERENCES `crm_company_status_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_crm_company_3` FOREIGN KEY (`id_crm_company_ownership_master`) REFERENCES `crm_company_ownership_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_crm_company_4` FOREIGN KEY (`id_crm_industry_master`) REFERENCES `crm_industry_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `crm_company_address`
  ADD CONSTRAINT `fk_crm_company_address_1` FOREIGN KEY (`id_crm_company`) REFERENCES `crm_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_crm_company_address_2` FOREIGN KEY (`id_crm_address`) REFERENCES `crm_address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `crm_contact`
  ADD CONSTRAINT `fk_crm_contact_1` FOREIGN KEY (`id_crm_lead_source_master`) REFERENCES `crm_lead_source_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_crm_contact_2` FOREIGN KEY (`id_crm_company`) REFERENCES `crm_company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `crm_contact_address`
  ADD CONSTRAINT `fk_crm_contact_address_1` FOREIGN KEY (`id_crm_contact`) REFERENCES `crm_contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_crm_contact_address_2` FOREIGN KEY (`id_crm_address`) REFERENCES `crm_address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `crm_lead`
  ADD CONSTRAINT `fk_crm_lead_1` FOREIGN KEY (`id_crm_lead_source_master`) REFERENCES `crm_lead_source_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_crm_lead_2` FOREIGN KEY (`id_crm_lead_status_master`) REFERENCES `crm_lead_status_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_crm_lead_3` FOREIGN KEY (`id_crm_rating_master`) REFERENCES `crm_rating_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_crm_lead_4` FOREIGN KEY (`id_crm_industry_master`) REFERENCES `crm_industry_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `crm_lead_address`
  ADD CONSTRAINT `fk_crm_lead_address_1` FOREIGN KEY (`id_crm_address`) REFERENCES `crm_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_crm_lead_address_2` FOREIGN KEY (`id_crm_lead`) REFERENCES `crm_lead` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `crm_lead_contact_parent`
  ADD CONSTRAINT `fk_crm_lead_contact_parent_1` FOREIGN KEY (`id_crm_lead_source_master`) REFERENCES `crm_lead_source_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `crm_model_note_attachement`
  ADD CONSTRAINT `fk_crm_model_note_attachement_1` FOREIGN KEY (`id_crm_model_note`) REFERENCES `crm_model_note` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `crm_opportunity`
  ADD CONSTRAINT `fk_crm_opportunity_2` FOREIGN KEY (`id_crm_company`) REFERENCES `crm_company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_crm_opportunity_4` FOREIGN KEY (`id_crm_pipeline_stage`) REFERENCES `crm_pipeline_stage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_crm_opportunity_5` FOREIGN KEY (`id_crm_lead_source_master`) REFERENCES `crm_lead_source_master` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `crm_opportunity_pipeline_history`
  ADD CONSTRAINT `fk_crm_opportunity_pipeline_history_1` FOREIGN KEY (`id_crm_pipeline_stage`) REFERENCES `crm_pipeline_stage` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_crm_opportunity_pipeline_history_2` FOREIGN KEY (`id_crm_opportunity`) REFERENCES `crm_opportunity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `crm_pipeline_stage`
  ADD CONSTRAINT `fk_crm_pipeline_stage_1` FOREIGN KEY (`id_crm_pipeline`) REFERENCES `crm_pipeline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `crm_recurrence_daily`
  ADD CONSTRAINT `fk_crm_recurrence_daily_1` FOREIGN KEY (`id_crm_activity_task`) REFERENCES `crm_activity_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `crm_recurrence_monthly`
  ADD CONSTRAINT `fk_crm_recurrence_monthly_1` FOREIGN KEY (`id_crm_activity_task`) REFERENCES `crm_activity_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `crm_recurrence_weekly`
  ADD CONSTRAINT `fk_crm_recurrence_weekly_1` FOREIGN KEY (`id_crm_activity_task`) REFERENCES `crm_activity_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `crm_recurrence_yearly`
  ADD CONSTRAINT `fk_crm_recurrence_yearly_1` FOREIGN KEY (`id_crm_activity_task`) REFERENCES `crm_activity_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
