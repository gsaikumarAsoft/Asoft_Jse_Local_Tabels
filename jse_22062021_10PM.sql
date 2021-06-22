-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2021 at 06:47 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jse`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_permissions`
--

CREATE TABLE `access_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `broker_user_id` bigint(20) UNSIGNED NOT NULL,
  `access_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activitylog`
--

CREATE TABLE `activitylog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broker_clients`
--

CREATE TABLE `broker_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `local_broker_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orders_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_orders` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jcsd` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_balance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filled_orders` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `broker_clients`
--

INSERT INTO `broker_clients` (`id`, `local_broker_id`, `name`, `email`, `orders_limit`, `open_orders`, `status`, `jcsd`, `created_at`, `updated_at`, `account_balance`, `filled_orders`) VALUES
(2, 1, 'Jhon', 'jhon@test.com', '1000000', '10', 'Verified', '1234567', '2021-06-17 01:18:25', '2021-06-17 01:18:25', '1000000', '5'),
(3, 1, 'KAREN', 'karen@test.com', '2000000', '6', 'Verified', '4567890', '2021-06-17 01:18:25', '2021-06-17 01:18:25', '1500000', '3'),
(4, 1, 'BILL', 'bill@test.com', '3000000', '9', 'Verified', '9876543', '2021-06-17 01:18:25', '2021-06-17 01:18:25', '3000000', '4'),
(5, 1, 'TOM', 'tom@test.com', '4000000', '11', 'Verified', '6543210', '2021-06-17 01:18:25', '2021-06-17 01:18:25', '1200000', '6');

-- --------------------------------------------------------

--
-- Table structure for table `broker_client_orders`
--

CREATE TABLE `broker_client_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `local_broker_id` int(10) UNSIGNED NOT NULL,
  `foreign_broker_id` int(10) UNSIGNED NOT NULL,
  `handling_instructions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` date NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `market_order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stop_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_in_force` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `broker_client_id` bigint(20) UNSIGNED NOT NULL,
  `filled_orders` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `clordid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trading_account_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_partial` tinyint(1) NOT NULL DEFAULT 0,
  `remaining` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_floor` int(11) DEFAULT NULL,
  `display_range` int(11) DEFAULT NULL,
  `amount_filled` int(11) NOT NULL DEFAULT 0,
  `value_filled` double(8,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `broker_client_orders`
--

INSERT INTO `broker_client_orders` (`id`, `local_broker_id`, `foreign_broker_id`, `handling_instructions`, `order_quantity`, `order_type`, `order_status`, `order_date`, `currency`, `client_order_number`, `market_order_number`, `stop_price`, `side`, `value`, `quantity`, `expiration_date`, `time_in_force`, `symbol`, `price`, `country`, `status_time`, `created_at`, `updated_at`, `broker_client_id`, `filled_orders`, `clordid`, `trading_account_id`, `is_partial`, `remaining`, `max_floor`, `display_range`, `amount_filled`, `value_filled`, `created_by`, `updated_by`) VALUES
(10, 1, 2, NULL, 5, NULL, NULL, '2021-05-26', 'CAD', '20210525072308400', '1234-90-009-1', NULL, 'Buy', NULL, NULL, NULL, NULL, 'HSE', NULL, NULL, NULL, NULL, NULL, 2, '0', NULL, '1', 0, '0.00', NULL, NULL, 0, 28.00, '', ''),
(11, 1, 2, NULL, 8, NULL, NULL, '2021-05-28', 'CAD', '20210525072308401', '1234-90-009-2', NULL, 'Buy', NULL, NULL, NULL, NULL, 'HSE', NULL, NULL, NULL, NULL, NULL, 5, '0', NULL, '1', 0, '0.00', NULL, NULL, 0, 10.00, '', ''),
(12, 1, 2, NULL, 5, NULL, NULL, '2021-05-29', 'CAD', '20210525072308402', '1234-90-009-3', NULL, 'Sell', NULL, NULL, NULL, NULL, 'BB.TO', NULL, NULL, NULL, NULL, NULL, 3, '0', NULL, '1', 0, '0.00', NULL, NULL, 0, 12.00, '', ''),
(13, 1, 2, NULL, 8, NULL, NULL, '2021-05-30', 'CAD', '20210525072308403', '1234-90-009-4', NULL, 'Sell', NULL, NULL, NULL, NULL, 'BB.TO', NULL, NULL, NULL, NULL, NULL, 4, '0', NULL, '1', 0, '0.00', NULL, NULL, 0, 14.00, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `broker_client_order_execution_reports`
--

CREATE TABLE `broker_client_order_execution_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `clordid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderID` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordRejRes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyorSell` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `securitySubType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderQty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeInForce` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qTradeacc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stopPx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senderSubID` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seqNum` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sendingTime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messageDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `broker_client_order_execution_reports`
--

INSERT INTO `broker_client_order_execution_reports` (`id`, `clordid`, `orderID`, `text`, `ordRejRes`, `status`, `buyorSell`, `securitySubType`, `time`, `ordType`, `orderQty`, `timeInForce`, `symbol`, `qTradeacc`, `price`, `stopPx`, `execType`, `senderSubID`, `seqNum`, `sendingTime`, `messageDate`, `created_at`, `updated_at`) VALUES
(1, '20210525072308400', '10', 'Ordered Sucess', NULL, NULL, NULL, NULL, NULL, NULL, '4', NULL, 'HSE', NULL, '100', NULL, NULL, NULL, NULL, NULL, '2021-05-26', NULL, NULL),
(2, '20210525072308401', '11', 'Ordered Sucess', NULL, NULL, NULL, NULL, NULL, NULL, '6', NULL, 'HSE', NULL, '200', NULL, NULL, NULL, NULL, NULL, '2021-05-26', NULL, NULL),
(3, '20210525072308402', '12', 'Ordered Sucess', NULL, NULL, NULL, NULL, NULL, NULL, '8', NULL, 'HSE', NULL, '300', NULL, NULL, NULL, NULL, NULL, '2021-05-28', NULL, NULL),
(4, '20210525072308403', '13', 'Ordered Sucess', NULL, NULL, NULL, NULL, NULL, NULL, '9', NULL, 'HSE', NULL, '400', NULL, NULL, NULL, NULL, NULL, '2021-05-28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `broker_client_permissions`
--

CREATE TABLE `broker_client_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `broker_client_id` bigint(20) UNSIGNED NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broker_settlement_accounts`
--

CREATE TABLE `broker_settlement_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `local_broker_id` bigint(20) UNSIGNED NOT NULL,
  `foreign_broker_id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settlement_agent_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_broker_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_balance` decimal(16,2) NOT NULL,
  `amount_allocated` decimal(16,2) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filled_orders` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `broker_settlement_accounts`
--

INSERT INTO `broker_settlement_accounts` (`id`, `local_broker_id`, `foreign_broker_id`, `bank_name`, `account`, `email`, `hash`, `settlement_agent_status`, `foreign_broker_status`, `account_balance`, `amount_allocated`, `status`, `created_at`, `updated_at`, `currency`, `filled_orders`) VALUES
(1, 1, 2, 'JNB', '1010101', 'abc@gmail.com', '', '1', '1', '0.00', '0.00', '1', '2021-06-16 12:55:06', NULL, 'USD', '10');

-- --------------------------------------------------------

--
-- Table structure for table `broker_trading_accounts`
--

CREATE TABLE `broker_trading_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `local_broker_id` bigint(20) UNSIGNED NOT NULL,
  `foreign_broker_id` bigint(20) UNSIGNED NOT NULL,
  `broker_settlement_account_id` bigint(20) UNSIGNED NOT NULL,
  `umir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trading_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_comp_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_comp_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `socket` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `broker_trading_accounts`
--

INSERT INTO `broker_trading_accounts` (`id`, `local_broker_id`, `foreign_broker_id`, `broker_settlement_account_id`, `umir`, `trading_account_number`, `target_comp_id`, `sender_comp_id`, `socket`, `port`, `created_at`, `updated_at`, `status`, `hash`) VALUES
(1, 1, 2, 1, '', NULL, '', '', '', '', '2021-06-16 12:55:06', NULL, '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `broker_users`
--

CREATE TABLE `broker_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dma_broker_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `broker_trading_account_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broker_user_permissions`
--

CREATE TABLE `broker_user_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `broker_user_id` bigint(20) UNSIGNED NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `expiring_buy_orders`
-- (See below for the actual view)
--
CREATE TABLE `expiring_buy_orders` (
`local_broker` varchar(191)
,`foreign_broker` varchar(191)
,`client` varchar(191)
,`jcsd` varchar(191)
,`client_order_id` varchar(191)
,`market_order_number` varchar(191)
,`order_date` date
,`updated_at` timestamp
,`expiration_date` varchar(191)
,`order_type` varchar(254)
,`order_time_in_force` varchar(254)
,`order_side` varchar(254)
,`order_status` varchar(191)
,`order_symbol` varchar(254)
,`order_quantity` int(11)
,`quantity` varchar(191)
,`currency` varchar(254)
,`price` decimal(8,2)
,`remaining` decimal(8,2)
,`amount_filled` int(11)
,`trading_account` text
,`order_id` bigint(20) unsigned
,`local_broker_id` bigint(20) unsigned
,`local_broker_user_id` bigint(20) unsigned
,`trading_account_id` bigint(20) unsigned
,`settlement_account_id` bigint(20) unsigned
,`foreign_broker_user_id` int(10) unsigned
,`client_id` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `foreign_brokers`
--

CREATE TABLE `foreign_brokers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dma_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `foreign_brokers`
--

INSERT INTO `foreign_brokers` (`id`, `user_id`, `dma_client_id`, `created_at`, `updated_at`) VALUES
(2, 10, NULL, '2021-06-16 12:55:06', '2021-06-16 12:55:06');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `local_brokers`
--

CREATE TABLE `local_brokers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dma_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_can_trade` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `local_brokers`
--

INSERT INTO `local_brokers` (`id`, `user_id`, `dma_client_id`, `created_at`, `updated_at`, `admin_can_trade`) VALUES
(1, 6, NULL, '2021-06-16 12:20:33', '2021-06-20 02:00:20', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `log_activities`
--

CREATE TABLE `log_activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_activities`
--

INSERT INTO `log_activities` (`id`, `subject`, `url`, `method`, `ip`, `agent`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Created A Local Broker', 'http://127.0.0.1:8000/jse-admin/store-local-broker', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', 1, '2021-06-16 12:20:32', '2021-06-16 12:20:32'),
(2, 'Updated Local Broker Details', 'http://127.0.0.1:8000/jse-admin/store-local-broker', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', 1, '2021-06-16 12:35:26', '2021-06-16 12:35:26'),
(3, 'Updated Local Broker Details', 'http://127.0.0.1:8000/jse-admin/store-local-broker', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', 1, '2021-06-16 12:37:38', '2021-06-16 12:37:38'),
(4, 'Updated Local Broker Details', 'http://127.0.0.1:8000/jse-admin/store-local-broker', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', 1, '2021-06-16 12:50:08', '2021-06-16 12:50:08'),
(5, 'Created New Foreign Broker', 'http://127.0.0.1:8000/jse-admin/store-foreign-broker', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', 1, '2021-06-16 12:52:12', '2021-06-16 12:52:12'),
(6, 'Update Foreign Broker Details', 'http://127.0.0.1:8000/jse-admin/store-foreign-broker', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', 1, '2021-06-16 12:52:27', '2021-06-16 12:52:27'),
(7, 'Created New Foreign Broker', 'http://127.0.0.1:8000/jse-admin/store-foreign-broker', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', 1, '2021-06-16 12:55:09', '2021-06-16 12:55:09'),
(8, 'Created Client Account: JCSD: 1234567, Balance: 1000000, Open Orders: 10, Filed Orders: 5', 'http://127.0.0.1:8000/broker/store-broker-client', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', 6, '2021-06-17 01:18:25', '2021-06-17 01:18:25'),
(9, 'Updated Local Broker Details', 'http://127.0.0.1:8000/jse-admin/store-local-broker', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 1, '2021-06-20 01:58:18', '2021-06-20 01:58:18'),
(10, 'Updated Local Broker Details', 'http://127.0.0.1:8000/jse-admin/store-local-broker', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 1, '2021-06-20 02:00:20', '2021-06-20 02:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2020_03_03_024154_create_local_broker_table', 1),
(9, '2020_03_03_024159_create_foreign_broker', 1),
(10, '2020_03_03_024504_create_broker_client_table', 1),
(11, '2020_03_03_024903_create_broker_user', 1),
(12, '2020_03_03_025920_create_broker_settlement_account', 1),
(13, '2020_03_03_030459_create_broker_trading_account', 1),
(14, '2020_03_06_142702_create_activity_log_table', 1),
(15, '2020_03_06_145954_create_log_activity_table', 1),
(16, '2020_03_10_181701_create_roles_table', 1),
(17, '2020_03_10_181808_create_role_user_table', 1),
(18, '2020_03_13_160440_create_broker_client_orders', 1),
(19, '2020_04_15_052829_broker_users_permissions_table', 1),
(20, '2020_04_15_212601_broker_clients_permissions', 1),
(21, '2020_04_16_192535_create_access_permissions_table', 1),
(22, '2020_04_16_201739_create_permission_tables', 1),
(23, '2020_04_17_003846_add_local_broker_id_to_users_table', 1),
(24, '2020_04_21_125304_add_currency_field_to_broker_settlement_account_table', 1),
(25, '2020_04_28_134802_add_account_balance_to_broker_clients_table', 1),
(26, '2020_05_03_185942_add_broker_client_id_to_broker_client_orders_table', 1),
(27, '2020_05_04_215857_add_filled_orders_to_broker_client_orders_table', 1),
(28, '2020_05_04_220060_add_filled_orders_to_broker_settlement_accounts', 1),
(29, '2020_05_05_030258_add_filler_orders_to_broker_clients_table', 1),
(30, '2020_05_05_171833_add_clordid_to_broker_client_orders_table', 1),
(31, '2020_05_05_172894_create_broker_client_order_execution_reports', 1),
(32, '2020_05_28_243830_add_status_to_broker_trading_accounts_table', 1),
(33, '2020_06_18_182628_add_trading_account_number_to_broker_client_orders', 1),
(34, '2020_07_10_115058_update_broker_client_orders_price_column_to_decimal', 1),
(35, '2020_07_17_210456_add_is_partial_and_remaining_to_broker_client_orders_table', 1),
(36, '2020_08_17_162212_add_max_floor_to_broker_client_orders', 1),
(37, '2020_08_21_213610_create_jobs_table', 1),
(38, '2021_03_23_140623_update_log_activities_table', 1),
(39, '2021_04_11_202657_add_admin_can_trade_to_users_table', 1),
(40, '2021_05_08_220948_create_expiring_orders_view', 1),
(41, '2021_05_27_235047_add_amount_filled_to_broker_client_orders_table', 1),
(42, '2021_05_28_131238_add_value_filled_to_broker_client_orders_table', 1),
(43, '2021_05_28_131531_add_created_by_to_broker_client_orders_table', 1),
(44, '2021_05_28_131542_add_updated_by_to_broker_client_orders_table', 1),
(45, '2021_05_31_161353_add_amount_filled_to_expiring_orders_view', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'create-broker-user', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(2, 'read-broker-user', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(3, 'update-broker-user', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(4, 'delete-broker-user', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(5, 'approve-broker-user', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(6, 'create-broker-client', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(7, 'read-broker-client', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(8, 'update-broker-client', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(9, 'delete-broker-client', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(10, 'approve-broker-client', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(11, 'create-broker-order', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(12, 'read-broker-order', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(13, 'update-broker-order', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(14, 'delete-broker-order', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(15, 'approve-broker-order', 'web', '2021-06-16 12:07:40', '2021-06-16 12:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ADMD', 'web', 'DMA Admin	', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(2, '	OPRD', 'web', 'DMA Operator', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(3, 'BRKF', 'web', 'Outbound Foreign Broker	', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(4, 'AGTS', 'web', 'Settlement Bank	', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(5, 'ADMB', 'web', 'Local Broker Admin', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(6, 'OPRB', 'web', 'Local Broker Operator	', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(7, 'TRDB', 'web', 'Local Broker Trader', '2021-06-16 12:07:40', '2021-06-16 12:07:40'),
(8, 'FIXR', 'web', 'FIX Router', '2021-06-16 12:07:40', '2021-06-16 12:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 5, 6),
(7, 3, 8),
(8, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `local_broker_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `status`, `password`, `hash`, `remember_token`, `created_at`, `updated_at`, `local_broker_id`) VALUES
(1, 'JSE DMA Admin', 'admin@innovate10x.com', NULL, 'Approved', '$2y$10$71XpHcVTFR9kE07UhONXaudZ/EUIpcdo3Y5wvDhXpxVIkFy.3dgpi', NULL, 'acteXD61dLsL92K2emQuDE8rL76qkHglYf4Ne215NuZssUzVcG8p5hmaHA5l', '2021-06-16 12:07:41', '2021-06-16 12:07:41', NULL),
(2, 'JSE DMA Admin1', 'admin1@innovate10x.com', NULL, 'Approved', '$2y$10$QJgGHh5jQSfQzG7NW8ZSIO8XEeMdZtYsp6UTh8MPK8GJUfDKHxBgu', NULL, NULL, '2021-06-16 12:07:41', '2021-06-16 12:07:41', NULL),
(3, 'JSE DMA Admin2', 'admin2@innovate10x.com', NULL, 'Approved', '$2y$10$04bfi8yC3GzZO7mUc7xpPecnS3UmvRY6i5fN2vcl6W8fMjHBWp9KC', NULL, NULL, '2021-06-16 12:07:41', '2021-06-16 12:07:41', NULL),
(4, 'JSE DMA Admin3', 'admin3@innovate10x.com', NULL, 'Approved', '$2y$10$JBMK06H6Sjs1I1pDNfiTl.drKR9BGisLAcj5cJOXGqx3jPUbgfYyK', NULL, NULL, '2021-06-16 12:07:42', '2021-06-16 12:07:42', NULL),
(5, 'JSE DMA Admin4', 'admin4@innovate10x.com', NULL, 'Approved', '$2y$10$4.bPrBLN7QfPgDHJ2Tm2w.TO/YnTyUQLbj0IAkM.gTxtfwzw9pp1i', NULL, NULL, '2021-06-16 12:07:42', '2021-06-16 12:07:42', NULL),
(6, 'BARITA', 'gsaikumar472@gmail.com', NULL, 'Verified', '$2y$10$5dSxNj30iMiJ9JeBzY067uncHpSX/MVk3P0mTKWvEH5GmkDe6ppKi', 'rv9AeQ0Q9nEzQ4Qq7qY8', NULL, '2021-06-16 12:20:33', '2021-06-20 02:00:33', NULL),
(10, 'CIBC', 'gsnala472@gmail.com', NULL, 'Verified', '$2y$10$5dSxNj30iMiJ9JeBzY067uncHpSX/MVk3P0mTKWvEH5GmkDe6ppKi', '38Ti0Mqjv2LbOhnlYAaG', NULL, '2021-06-16 12:55:06', '2021-06-16 12:55:06', NULL);

-- --------------------------------------------------------

--
-- Structure for view `expiring_buy_orders`
--
DROP TABLE IF EXISTS `expiring_buy_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `expiring_buy_orders`  AS   (select `u`.`name` AS `local_broker`,`uf`.`name` AS `foreign_broker`,`c`.`name` AS `client`,`c`.`jcsd` AS `jcsd`,`o`.`clordid` AS `client_order_id`,`o`.`market_order_number` AS `market_order_number`,`o`.`order_date` AS `order_date`,`o`.`updated_at` AS `updated_at`,case when ucase(json_unquote(json_extract(`o`.`time_in_force`,'$.text'))) = 'GTD' then `o`.`expiration_date` when ucase(json_unquote(json_extract(`o`.`time_in_force`,'$.text'))) = 'DAY' then `o`.`order_date` when ucase(json_unquote(json_extract(`o`.`time_in_force`,'$.text'))) = 'GTC' then `o`.`order_date` + 90 else `o`.`expiration_date` end AS `expiration_date`,ucase(json_unquote(json_extract(replace(replace(replace(`o`.`order_type`,'\\"','"'),'"{','{'),'}"','}'),'$.text'))) AS `order_type`,ucase(json_unquote(json_extract(`o`.`time_in_force`,'$.text'))) AS `order_time_in_force`,ucase(json_unquote(json_extract(`o`.`side`,'$.value'))) AS `order_side`,case when `o`.`order_status` = '-1' then 'FAILED' when `o`.`order_status` = '0' then 'NEW' when `o`.`order_status` = '1' then 'PARTIALLY FILLED' when `o`.`order_status` = '2' then 'FILLED' when `o`.`order_status` = '3' then 'DONE FOR DAY' when `o`.`order_status` = '4' then 'CANCELLED' when `o`.`order_status` = '5' then 'REPLACED' when `o`.`order_status` = '6' then 'PENDING CANCEL' when `o`.`order_status` = '7' then 'STOPPED' when `o`.`order_status` = '8' then 'REJECTED' when `o`.`order_status` = '9' then 'SUSPENDED' when `o`.`order_status` = 'A' then 'PENDING NEW' when `o`.`order_status` = 'B' then 'CALCULATED' when `o`.`order_status` = 'C' then 'EXPIRED' when `o`.`order_status` = 'D' then 'ACCPETED' when `o`.`order_status` = 'E' then 'PENDING REPLACE' else ucase(`o`.`order_status`) end AS `order_status`,json_unquote(json_extract(`o`.`symbol`,'$.text')) AS `order_symbol`,`o`.`order_quantity` AS `order_quantity`,`o`.`quantity` AS `quantity`,json_unquote(json_extract(`o`.`currency`,'$.value')) AS `currency`,`o`.`price` AS `price`,`o`.`remaining` AS `remaining`,`o`.`amount_filled` AS `amount_filled`,concat(`t`.`sender_comp_id`,'=>',`t`.`target_comp_id`,' : ',`t`.`trading_account_number`,' : ',`s`.`bank_name`,'-',`s`.`account`) AS `trading_account`,`o`.`id` AS `order_id`,`b`.`id` AS `local_broker_id`,`u`.`id` AS `local_broker_user_id`,`t`.`id` AS `trading_account_id`,`s`.`id` AS `settlement_account_id`,`o`.`foreign_broker_id` AS `foreign_broker_user_id`,`c`.`id` AS `client_id` from (((((((`broker_client_orders` `o` join `local_brokers` `b` on(`b`.`id` = `o`.`local_broker_id`)) join `users` `u` on(`u`.`id` = `b`.`user_id`)) join `broker_clients` `c` on(`c`.`id` = `o`.`broker_client_id`)) join `users` `uf` on(`uf`.`id` = `o`.`foreign_broker_id`)) join `foreign_brokers` `f` on(`uf`.`id` = `f`.`user_id`)) join `broker_trading_accounts` `t` on(`t`.`id` = `o`.`trading_account_id`)) join `broker_settlement_accounts` `s` on(`s`.`id` = `t`.`broker_settlement_account_id`)) where json_unquote(json_extract(`o`.`side`,'$.value')) = 'Buy' and `o`.`order_status` in ('0','1','6','9','Submitted') and (json_unquote(json_extract(`o`.`time_in_force`,'$.text')) = 'GTD' and `o`.`expiration_date` <= curdate() or json_unquote(json_extract(`o`.`time_in_force`,'$.text')) = 'GTC' and `o`.`order_date` + 90 or ucase(json_unquote(json_extract(`o`.`time_in_force`,'$.text'))) = 'DAY'))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_permissions`
--
ALTER TABLE `access_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_permissions_broker_user_id_foreign` (`broker_user_id`);

--
-- Indexes for table `activitylog`
--
ALTER TABLE `activitylog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activitylog_log_name_index` (`log_name`),
  ADD KEY `subject` (`subject_id`,`subject_type`),
  ADD KEY `causer` (`causer_id`,`causer_type`);

--
-- Indexes for table `broker_clients`
--
ALTER TABLE `broker_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `broker_clients_email_unique` (`email`),
  ADD KEY `broker_clients_local_broker_id_foreign` (`local_broker_id`);

--
-- Indexes for table `broker_client_orders`
--
ALTER TABLE `broker_client_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broker_client_orders_broker_client_id_foreign` (`broker_client_id`);

--
-- Indexes for table `broker_client_order_execution_reports`
--
ALTER TABLE `broker_client_order_execution_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broker_client_permissions`
--
ALTER TABLE `broker_client_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broker_client_permissions_broker_client_id_foreign` (`broker_client_id`);

--
-- Indexes for table `broker_settlement_accounts`
--
ALTER TABLE `broker_settlement_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broker_trading_accounts`
--
ALTER TABLE `broker_trading_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broker_trading_accounts_local_broker_id_foreign` (`local_broker_id`),
  ADD KEY `broker_trading_accounts_foreign_broker_id_foreign` (`foreign_broker_id`),
  ADD KEY `broker_trading_accounts_broker_settlement_account_id_foreign` (`broker_settlement_account_id`);

--
-- Indexes for table `broker_users`
--
ALTER TABLE `broker_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broker_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `broker_user_permissions`
--
ALTER TABLE `broker_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broker_user_permissions_broker_user_id_foreign` (`broker_user_id`);

--
-- Indexes for table `foreign_brokers`
--
ALTER TABLE `foreign_brokers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_brokers_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `local_brokers`
--
ALTER TABLE `local_brokers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `local_brokers_user_id_foreign` (`user_id`);

--
-- Indexes for table `log_activities`
--
ALTER TABLE `log_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_local_broker_id_foreign` (`local_broker_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_permissions`
--
ALTER TABLE `access_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activitylog`
--
ALTER TABLE `activitylog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `broker_clients`
--
ALTER TABLE `broker_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `broker_client_orders`
--
ALTER TABLE `broker_client_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `broker_client_order_execution_reports`
--
ALTER TABLE `broker_client_order_execution_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `broker_client_permissions`
--
ALTER TABLE `broker_client_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `broker_settlement_accounts`
--
ALTER TABLE `broker_settlement_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `broker_trading_accounts`
--
ALTER TABLE `broker_trading_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `broker_users`
--
ALTER TABLE `broker_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `broker_user_permissions`
--
ALTER TABLE `broker_user_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foreign_brokers`
--
ALTER TABLE `foreign_brokers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `local_brokers`
--
ALTER TABLE `local_brokers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_activities`
--
ALTER TABLE `log_activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_permissions`
--
ALTER TABLE `access_permissions`
  ADD CONSTRAINT `access_permissions_broker_user_id_foreign` FOREIGN KEY (`broker_user_id`) REFERENCES `broker_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `broker_clients`
--
ALTER TABLE `broker_clients`
  ADD CONSTRAINT `broker_clients_local_broker_id_foreign` FOREIGN KEY (`local_broker_id`) REFERENCES `local_brokers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `broker_client_orders`
--
ALTER TABLE `broker_client_orders`
  ADD CONSTRAINT `broker_client_orders_broker_client_id_foreign` FOREIGN KEY (`broker_client_id`) REFERENCES `broker_clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `broker_client_permissions`
--
ALTER TABLE `broker_client_permissions`
  ADD CONSTRAINT `broker_client_permissions_broker_client_id_foreign` FOREIGN KEY (`broker_client_id`) REFERENCES `broker_clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `broker_trading_accounts`
--
ALTER TABLE `broker_trading_accounts`
  ADD CONSTRAINT `broker_trading_accounts_broker_settlement_account_id_foreign` FOREIGN KEY (`broker_settlement_account_id`) REFERENCES `broker_settlement_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `broker_trading_accounts_foreign_broker_id_foreign` FOREIGN KEY (`foreign_broker_id`) REFERENCES `foreign_brokers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `broker_trading_accounts_local_broker_id_foreign` FOREIGN KEY (`local_broker_id`) REFERENCES `local_brokers` (`id`);

--
-- Constraints for table `broker_users`
--
ALTER TABLE `broker_users`
  ADD CONSTRAINT `broker_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `broker_user_permissions`
--
ALTER TABLE `broker_user_permissions`
  ADD CONSTRAINT `broker_user_permissions_broker_user_id_foreign` FOREIGN KEY (`broker_user_id`) REFERENCES `broker_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `foreign_brokers`
--
ALTER TABLE `foreign_brokers`
  ADD CONSTRAINT `foreign_brokers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `local_brokers`
--
ALTER TABLE `local_brokers`
  ADD CONSTRAINT `local_brokers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_local_broker_id_foreign` FOREIGN KEY (`local_broker_id`) REFERENCES `local_brokers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
