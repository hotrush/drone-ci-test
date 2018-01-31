-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dealroom
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT '0',
  `is_public` tinyint(4) DEFAULT '1',
  `type` varchar(35) DEFAULT NULL,
  `date` int(10) DEFAULT '0',
  `bobject_user_id` int(10) DEFAULT '0',
  `extra_1` varchar(250) DEFAULT NULL,
  `extra_2` varchar(250) DEFAULT NULL,
  `extra_3` varchar(250) DEFAULT NULL,
  `extra_4` varchar(250) DEFAULT NULL,
  `extra_5` varchar(250) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=307789 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activities_non_public_access`
--

DROP TABLE IF EXISTS `activities_non_public_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities_non_public_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT NULL,
  `activity_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_automatic_imports`
--

DROP TABLE IF EXISTS `admin_automatic_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_automatic_imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_automatic_imports_items`
--

DROP TABLE IF EXISTS `admin_automatic_imports_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_automatic_imports_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) DEFAULT NULL,
  `bobject_id` int(11) DEFAULT NULL,
  `funding_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_id` (`import_id`),
  KEY `funding_id` (`funding_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `admin_automatic_imports_items_ibfk_1` FOREIGN KEY (`import_id`) REFERENCES `admin_automatic_imports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_automatic_imports_items_ibfk_2` FOREIGN KEY (`funding_id`) REFERENCES `bobjects_fundings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_automatic_imports_items_ibfk_3` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_editable_emails`
--

DROP TABLE IF EXISTS `admin_editable_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_editable_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` int(11) DEFAULT NULL,
  `company_subject` varchar(250) DEFAULT NULL,
  `investor_subject` varchar(250) DEFAULT NULL,
  `company_text` text,
  `investor_text` text,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_exports`
--

DROP TABLE IF EXISTS `admin_exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_exports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `percents` tinyint(4) DEFAULT NULL,
  `file` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_live_deal_notifications`
--

DROP TABLE IF EXISTS `admin_live_deal_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_live_deal_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_company_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_register`
--

DROP TABLE IF EXISTS `admin_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_user_id` int(11) DEFAULT NULL,
  `bobject_company_id` int(11) DEFAULT NULL,
  `is_new_company` tinyint(4) DEFAULT '0',
  `is_from_linkedin` tinyint(4) DEFAULT '0',
  `date` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_user_id` (`bobject_user_id`),
  KEY `bobject_company_id` (`bobject_company_id`),
  CONSTRAINT `admin_register_ibfk_1` FOREIGN KEY (`bobject_user_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_register_ibfk_2` FOREIGN KEY (`bobject_company_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3996 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_ribbons`
--

DROP TABLE IF EXISTS `admin_ribbons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_ribbons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` int(11) DEFAULT NULL,
  `text` text CHARACTER SET latin1,
  `button_text` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `button_action` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_static_blocks`
--

DROP TABLE IF EXISTS `admin_static_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_static_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` int(11) DEFAULT NULL,
  `text` text CHARACTER SET latin1,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_static_pages`
--

DROP TABLE IF EXISTS `admin_static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_static_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` int(11) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `text` text CHARACTER SET latin1,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_uniq` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_auth`
--

DROP TABLE IF EXISTS `api_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `api_version` int(11) DEFAULT NULL,
  `api_key` varchar(250) DEFAULT NULL,
  `app_id` varchar(250) DEFAULT NULL,
  `priori_access` tinyint(4) DEFAULT '0',
  `results_limit` int(11) DEFAULT NULL,
  `rate_limit` int(11) DEFAULT NULL,
  `rate_counter` int(11) DEFAULT '0',
  `period` varchar(30) DEFAULT NULL,
  `period_start` int(11) DEFAULT NULL,
  `period_end` int(11) DEFAULT NULL,
  `app_domains` text,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blocked_recommended`
--

DROP TABLE IF EXISTS `blocked_recommended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocked_recommended` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_company_source_id` int(10) DEFAULT NULL,
  `bobject_user_source_id` int(10) DEFAULT NULL,
  `bobject_copany_target_id` int(10) DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_actions`
--

DROP TABLE IF EXISTS `bobjects_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) NOT NULL DEFAULT '0',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `target_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date` int(11) NOT NULL,
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `bobjects_actions_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_aliases`
--

DROP TABLE IF EXISTS `bobjects_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobjects_aliases` (`bobject_id`),
  CONSTRAINT `bobjects_aliases_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_backgrounds`
--

DROP TABLE IF EXISTS `bobjects_backgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_backgrounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) NOT NULL DEFAULT '0',
  `background_id` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `background_id` (`background_id`),
  CONSTRAINT `bobjects_backgrounds_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_backgrounds_ibfk_2` FOREIGN KEY (`background_id`) REFERENCES `param_backgrounds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_categories`
--

DROP TABLE IF EXISTS `bobjects_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT '0',
  `category_id` int(10) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `bobjects_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `param_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_categories_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10457 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_city_fundings`
--

DROP TABLE IF EXISTS `bobjects_city_fundings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_city_fundings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `bobject_id` int(11) DEFAULT NULL,
  `city` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `country` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `6_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `1_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `bobjects_city_fundings_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_city_fundings_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `city_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_country_fundings`
--

DROP TABLE IF EXISTS `bobjects_country_fundings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_country_fundings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `6_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `1_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `bobjects_country_fundings_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_country_fundings_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=395202 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_event_participants`
--

DROP TABLE IF EXISTS `bobjects_event_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_event_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_event_id` int(11) NOT NULL,
  `bobject_participant_id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_participant_id` (`bobject_participant_id`),
  KEY `bobject_event_id` (`bobject_event_id`),
  CONSTRAINT `bobjects_event_participants_ibfk_1` FOREIGN KEY (`bobject_participant_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_event_participants_ibfk_2` FOREIGN KEY (`bobject_event_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_events`
--

DROP TABLE IF EXISTS `bobjects_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_organizer_id` int(11) NOT NULL,
  `bobject_event_id` int(11) NOT NULL,
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_organizer_id` (`bobject_organizer_id`),
  KEY `bobject_event_id` (`bobject_event_id`),
  CONSTRAINT `bobjects_events_ibfk_1` FOREIGN KEY (`bobject_organizer_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_events_ibfk_2` FOREIGN KEY (`bobject_event_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_funding_investors`
--

DROP TABLE IF EXISTS `bobjects_funding_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_funding_investors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funding_id` int(11) DEFAULT '0',
  `bobject_investor_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `funding_investor_unique` (`funding_id`,`bobject_investor_id`),
  KEY `funding_id` (`funding_id`),
  KEY `bobject_investor_id` (`bobject_investor_id`),
  CONSTRAINT `bobjects_funding_investors_ibfk_1` FOREIGN KEY (`funding_id`) REFERENCES `bobjects_fundings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_funding_investors_ibfk_2` FOREIGN KEY (`bobject_investor_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33424 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_fundings`
--

DROP TABLE IF EXISTS `bobjects_fundings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_fundings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT '0',
  `undisclosed_amount` int(11) DEFAULT '0',
  `amount` bigint(20) DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `month` int(11) DEFAULT '0',
  `year` int(11) DEFAULT '0',
  `week` int(11) DEFAULT NULL,
  `week_year` int(11) DEFAULT NULL,
  `round` varchar(50) DEFAULT NULL,
  `valuation` bigint(20) DEFAULT NULL,
  `valuation_generated_min` bigint(20) DEFAULT NULL,
  `valuation_generated_max` bigint(20) DEFAULT NULL,
  `hidden_angels` varchar(250) DEFAULT NULL,
  `investors` longtext,
  `data_from_crunchbase` tinyint(4) DEFAULT '0',
  `news_source` varchar(255) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `bobjects_fundings_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24825 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_funds`
--

DROP TABLE IF EXISTS `bobjects_funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `fund_name` varchar(250) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `feed_item_id` int(11) DEFAULT NULL,
  `is_closed` tinyint(4) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  `fund_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `feed_item_id` (`feed_item_id`),
  CONSTRAINT `bobjects_funds_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_funds_ibfk_2` FOREIGN KEY (`feed_item_id`) REFERENCES `feed_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_hq_locations`
--

DROP TABLE IF EXISTS `bobjects_hq_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_hq_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hq_location_continent_id` int(11) DEFAULT NULL,
  `hq_location_country_id` int(11) DEFAULT NULL,
  `hq_location_city_id` int(11) DEFAULT NULL,
  `bobject_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `street_number` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `is_headquarters` tinyint(4) NOT NULL DEFAULT '0',
  `lat` decimal(11,8) DEFAULT NULL,
  `lon` decimal(11,8) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hq_location_continent_id` (`hq_location_continent_id`),
  KEY `hq_location_country_id` (`hq_location_country_id`),
  KEY `hq_location_city_id` (`hq_location_city_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `bobjects_hq_locations_ibfk_1` FOREIGN KEY (`hq_location_continent_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_hq_locations_ibfk_2` FOREIGN KEY (`hq_location_country_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_hq_locations_ibfk_3` FOREIGN KEY (`hq_location_city_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_hq_locations_ibfk_4` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1745160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_hq_locations_normalized`
--

DROP TABLE IF EXISTS `bobjects_hq_locations_normalized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_hq_locations_normalized` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hq_location_id` int(11) DEFAULT NULL,
  `bobject_id` int(11) DEFAULT NULL,
  `is_headquarters` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bobject_hq_location` (`bobject_id`,`hq_location_id`),
  KEY `hq_location_id` (`hq_location_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `bobjects_hq_locations_normalized_ibfk_1` FOREIGN KEY (`hq_location_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_hq_locations_normalized_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5717517 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_industry_fundings`
--

DROP TABLE IF EXISTS `bobjects_industry_fundings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_industry_fundings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `industry_id` int(11) DEFAULT NULL,
  `6_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `1_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `industry_id` (`industry_id`),
  CONSTRAINT `bobjects_industry_fundings_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_industry_fundings_ibfk_2` FOREIGN KEY (`industry_id`) REFERENCES `industry_pages` (`industry_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=722671 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_locations`
--

DROP TABLE IF EXISTS `bobjects_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_locations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT '0',
  `location_id` int(10) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `bobjects_locations_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `param_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_locations_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1891758 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_models`
--

DROP TABLE IF EXISTS `bobjects_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `bobjects_models_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_models_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `param_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_momentums`
--

DROP TABLE IF EXISTS `bobjects_momentums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_momentums` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `momentum_id` int(10) DEFAULT NULL,
  `bobject_id` int(10) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `momentum_id` (`momentum_id`),
  CONSTRAINT `bobjects_momentums_ibfk_1` FOREIGN KEY (`momentum_id`) REFERENCES `param_momentums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_momentums_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3581 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_occupations`
--

DROP TABLE IF EXISTS `bobjects_occupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_occupations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT '0',
  `occupation_id` int(10) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `search` (`bobject_id`),
  KEY `occupation_id` (`occupation_id`),
  CONSTRAINT `bobjects_occupations_ibfk_1` FOREIGN KEY (`occupation_id`) REFERENCES `param_occupations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_occupations_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1922 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_ownerships`
--

DROP TABLE IF EXISTS `bobjects_ownerships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_ownerships` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT NULL,
  `ownership_id` int(10) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `search` (`bobject_id`),
  KEY `ownership_id` (`ownership_id`),
  CONSTRAINT `bobjects_ownerships_ibfk_1` FOREIGN KEY (`ownership_id`) REFERENCES `param_ownerships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_ownerships_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23574 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_payments`
--

DROP TABLE IF EXISTS `bobjects_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `bobjects_payments_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_payments_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `param_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_places`
--

DROP TABLE IF EXISTS `bobjects_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) NOT NULL DEFAULT '0',
  `place_id` int(11) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `place_id` (`place_id`),
  CONSTRAINT `bobjects_places_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_places_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `param_places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1386 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_ranks`
--

DROP TABLE IF EXISTS `bobjects_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `bobjects_ranks_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_revenue_fundings`
--

DROP TABLE IF EXISTS `bobjects_revenue_fundings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_revenue_fundings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `revenue_id` int(11) DEFAULT NULL,
  `6_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `1_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `revenue_id` (`revenue_id`),
  CONSTRAINT `bobjects_revenue_fundings_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_revenue_fundings_ibfk_2` FOREIGN KEY (`revenue_id`) REFERENCES `revenue_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128692 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_revenues`
--

DROP TABLE IF EXISTS `bobjects_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_revenues` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `revenue_id` int(10) DEFAULT NULL,
  `bobject_id` int(10) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `revenue_id` (`revenue_id`),
  CONSTRAINT `bobjects_revenues_ibfk_1` FOREIGN KEY (`revenue_id`) REFERENCES `param_revenues` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_revenues_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107576 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_sectors`
--

DROP TABLE IF EXISTS `bobjects_sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_sectors` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT '0',
  `sector_id` int(10) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `sector_id` (`sector_id`),
  CONSTRAINT `bobjects_sectors_ibfk_1` FOREIGN KEY (`sector_id`) REFERENCES `param_sectors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_sectors_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=408549 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_skills`
--

DROP TABLE IF EXISTS `bobjects_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_skills` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT '0',
  `skill_id` int(10) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `search` (`id`,`bobject_id`,`skill_id`),
  KEY `skill_id` (`skill_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `bobjects_skills_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `param_skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_skills_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4550 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_tag_fundings`
--

DROP TABLE IF EXISTS `bobjects_tag_fundings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_tag_fundings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `6_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `1_month_fundings` bigint(20) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `bobjects_tag_fundings_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_tag_fundings_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8766 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_tg_hq_locations`
--

DROP TABLE IF EXISTS `bobjects_tg_hq_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_tg_hq_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hq_location_id` int(11) DEFAULT NULL,
  `bobject_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hq_location_id` (`hq_location_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `bobjects_tg_hq_locations_ibfk_1` FOREIGN KEY (`hq_location_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_tg_hq_locations_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_tg_locations`
--

DROP TABLE IF EXISTS `bobjects_tg_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_tg_locations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT '0',
  `location_id` int(10) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `search` (`bobject_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `bobjects_tg_locations_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `param_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_tg_locations_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122451 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_twitter_stats`
--

DROP TABLE IF EXISTS `bobjects_twitter_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_twitter_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) NOT NULL DEFAULT '0',
  `followers` int(11) NOT NULL DEFAULT '0',
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `reach_json` text,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3218 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_universities`
--

DROP TABLE IF EXISTS `bobjects_universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_universities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_user_id` int(11) NOT NULL DEFAULT '0',
  `bobject_university_id` int(11) NOT NULL DEFAULT '0',
  `year_start` int(11) DEFAULT NULL,
  `year_end` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_user_id` (`bobject_user_id`),
  KEY `bobject_university_id` (`bobject_university_id`),
  KEY `degree_id` (`degree_id`),
  CONSTRAINT `bobjects_universities_ibfk_1` FOREIGN KEY (`bobject_user_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_universities_ibfk_2` FOREIGN KEY (`bobject_university_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_universities_ibfk_3` FOREIGN KEY (`degree_id`) REFERENCES `param_degrees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_universities_majors`
--

DROP TABLE IF EXISTS `bobjects_universities_majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_universities_majors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobjects_universities_id` int(11) NOT NULL DEFAULT '0',
  `major_id` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobjects_universities_id` (`bobjects_universities_id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `bobjects_universities_majors_ibfk_1` FOREIGN KEY (`bobjects_universities_id`) REFERENCES `bobjects_universities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobjects_universities_majors_ibfk_2` FOREIGN KEY (`major_id`) REFERENCES `param_majors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bobjects_widget_images`
--

DROP TABLE IF EXISTS `bobjects_widget_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobjects_widget_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `bobjects_widget_images_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_objects`
--

DROP TABLE IF EXISTS `business_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_objects` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT '0' COMMENT '0- user, 1 - individual, 2 - startup ,  3- investors',
  `status` int(1) DEFAULT '0',
  `is_editorial` tinyint(4) NOT NULL DEFAULT '0',
  `object_id` int(10) DEFAULT '0',
  `url` varchar(250) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timeverify` datetime DEFAULT NULL,
  `crunchbase_perma_link` varchar(250) DEFAULT NULL,
  `crunchabase_imported` int(11) DEFAULT '0',
  `crunchbase_id` int(11) DEFAULT '0',
  `name` varchar(250) DEFAULT NULL,
  `tagline` varchar(250) DEFAULT NULL,
  `linkedin` varchar(250) DEFAULT NULL,
  `youtube` varchar(250) DEFAULT NULL,
  `facebook` varchar(250) DEFAULT NULL,
  `slideshare` varchar(250) DEFAULT NULL,
  `twitter` varchar(250) DEFAULT NULL,
  `google` varchar(250) DEFAULT NULL,
  `crunchbase` varchar(250) DEFAULT NULL,
  `website` varchar(250) DEFAULT NULL,
  `website_domain` varchar(250) DEFAULT NULL,
  `angellist` varchar(250) DEFAULT NULL,
  `tr_number_empl` varchar(100) DEFAULT NULL,
  `about` text,
  `recommend` int(11) NOT NULL DEFAULT '1',
  `priority_company_research` int(11) NOT NULL DEFAULT '0',
  `priority_investor_search` int(11) NOT NULL DEFAULT '0',
  `priority_users_search` int(11) NOT NULL DEFAULT '0',
  `investment_stage_1` int(11) DEFAULT '0',
  `investment_stage_2` int(11) DEFAULT '0',
  `investment_stage_3` int(11) DEFAULT '0',
  `investment_stage_4` int(11) DEFAULT '0',
  `min_deal_size` bigint(20) DEFAULT '0',
  `max_deal_size` bigint(20) DEFAULT '0',
  `photo` int(11) NOT NULL DEFAULT '0',
  `investment_stage` int(11) NOT NULL DEFAULT '0',
  `fund_stage` int(11) NOT NULL DEFAULT '0',
  `security_2` int(11) DEFAULT '0',
  `security_3` int(11) DEFAULT '0',
  `security_4` int(11) DEFAULT '0',
  `security_5` int(11) DEFAULT '0',
  `security_6` int(11) DEFAULT '0',
  `seeking_financing` int(11) DEFAULT '0',
  `seeking_financing_temp` int(11) NOT NULL DEFAULT '0',
  `launch_date` int(11) DEFAULT '0',
  `deal_structure_minority` int(11) DEFAULT '0',
  `deal_structure_majority` int(11) DEFAULT '0',
  `investor_b2b` int(11) NOT NULL DEFAULT '0',
  `investor_b2c` int(11) NOT NULL DEFAULT '0',
  `accept_venture_dept` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `delivery_method` int(11) NOT NULL DEFAULT '0',
  `launch_year` int(11) DEFAULT '0',
  `launch_month` int(11) DEFAULT '0',
  `live_deal_lastupdate` int(11) NOT NULL DEFAULT '0',
  `is_advisor` int(11) NOT NULL DEFAULT '0',
  `is_press` int(11) NOT NULL DEFAULT '0',
  `is_venture_fund` tinyint(4) DEFAULT '0',
  `is_family_office` tinyint(4) DEFAULT '0',
  `is_angel_fund` tinyint(4) DEFAULT NULL,
  `is_others` tinyint(4) DEFAULT '0',
  `category_2` int(11) NOT NULL DEFAULT '0',
  `app_id_appstore` varchar(255) DEFAULT NULL,
  `app_id_playmarket` varchar(255) DEFAULT NULL,
  `total_fundings` bigint(20) DEFAULT NULL,
  `recent_fundings` bigint(20) DEFAULT NULL,
  `average_fundings` bigint(20) DEFAULT NULL,
  `yearly_fundings` bigint(20) DEFAULT NULL,
  `corporate_investor_bobject_id` int(11) DEFAULT NULL,
  `twitter_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `street_number` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `lat` decimal(11,8) DEFAULT NULL,
  `lon` decimal(11,8) DEFAULT NULL,
  `is_accelerator` int(11) DEFAULT '0',
  `company_status` tinyint(4) DEFAULT '0',
  `similarweb_traffic` bigint(20) DEFAULT NULL,
  `similarweb_rank` int(11) DEFAULT NULL,
  `similarweb_hidden` tinyint(4) DEFAULT '0',
  `momentum_rank` smallint(6) DEFAULT NULL,
  `is_cole` tinyint(4) NOT NULL DEFAULT '0',
  `investor_activity_rank` smallint(6) DEFAULT NULL,
  `investor_performance_rank` smallint(6) DEFAULT NULL,
  `profile_views` int(11) DEFAULT '0',
  `creator_bobject_id` tinyint(4) DEFAULT NULL,
  `fum_amount` bigint(20) DEFAULT NULL,
  `fum_currency` varchar(5) DEFAULT NULL,
  `cfs_amount` bigint(20) DEFAULT NULL,
  `cfs_currency` varchar(5) DEFAULT NULL,
  `is_admin_edited` tinyint(4) NOT NULL DEFAULT '0',
  `investor_total_fundings` bigint(20) DEFAULT NULL,
  `investor_exits_fundings` bigint(20) DEFAULT NULL,
  `investor_capital_efficiency` int(11) DEFAULT NULL,
  `investor_exit_score` int(11) DEFAULT NULL,
  `founder_funder_rank` int(11) DEFAULT NULL,
  `new_fund_feed_item_id` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `growth_index_unique` int(11) DEFAULT NULL,
  `growth_index_unique_rank` int(11) DEFAULT NULL,
  `app_installs_growth` int(11) DEFAULT NULL,
  `app_growth` int(11) DEFAULT NULL,
  `app_growth_rank` int(11) DEFAULT NULL,
  `combi_growth` int(11) DEFAULT NULL,
  `combi_growth_rank` int(11) DEFAULT NULL,
  `employee_growth` int(11) DEFAULT NULL,
  `employee_growth_rank` int(11) DEFAULT NULL,
  `event_date_start` date DEFAULT NULL,
  `event_date_end` date DEFAULT NULL,
  `similarweb_3_months_growth` int(11) DEFAULT NULL,
  `similarweb_3_months_growth_rank` int(11) DEFAULT NULL,
  `similarweb_6_months_growth` int(11) DEFAULT NULL,
  `similarweb_6_months_growth_rank` int(11) DEFAULT NULL,
  `similarweb_12_months_growth` int(11) DEFAULT NULL,
  `similarweb_12_months_growth_rank` int(11) DEFAULT NULL,
  `lastupdate_bobject_id` int(11) DEFAULT NULL,
  `soet_import` tinyint(4) DEFAULT '0',
  `app_3_months_growth` int(11) DEFAULT NULL,
  `app_3_months_growth_rank` int(11) DEFAULT NULL,
  `app_6_months_growth` int(11) DEFAULT NULL,
  `app_6_months_growth_rank` int(11) DEFAULT NULL,
  `app_12_months_growth` int(11) DEFAULT NULL,
  `app_12_months_growth_rank` int(11) DEFAULT NULL,
  `employee_3_months_growth` int(11) DEFAULT NULL,
  `employee_3_months_growth_rank` int(11) DEFAULT NULL,
  `employee_6_months_growth` int(11) DEFAULT NULL,
  `employee_6_months_growth_rank` int(11) DEFAULT NULL,
  `employee_12_months_growth` int(11) DEFAULT NULL,
  `employee_12_months_growth_rank` int(11) DEFAULT NULL,
  `verify_bobject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_type` (`type`),
  KEY `bobject_object_id` (`object_id`),
  KEY `is_editorial` (`is_editorial`),
  KEY `is_cole` (`is_cole`),
  KEY `url` (`url`),
  KEY `new_fund_feed_item_id` (`new_fund_feed_item_id`),
  KEY `lastupdate_bobject_id` (`lastupdate_bobject_id`),
  KEY `verify_bobject_id` (`verify_bobject_id`),
  CONSTRAINT `business_objects_ibfk_1` FOREIGN KEY (`new_fund_feed_item_id`) REFERENCES `feed_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `business_objects_ibfk_2` FOREIGN KEY (`lastupdate_bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `business_objects_ibfk_3` FOREIGN KEY (`verify_bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=879243 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city_pages`
--

DROP TABLE IF EXISTS `city_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(250) DEFAULT NULL,
  `hq_location_country_id` int(11) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `hq_location_city_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `description` text,
  `recent_fundings` bigint(20) DEFAULT NULL,
  `total_fundings` bigint(20) DEFAULT NULL,
  `1_month_fundings` bigint(20) DEFAULT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_public` (`is_public`),
  KEY `region_id` (`region_id`),
  KEY `hq_location_city_id` (`hq_location_city_id`),
  KEY `hq_location_country_id` (`hq_location_country_id`),
  CONSTRAINT `city_pages_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_pages_ibfk_2` FOREIGN KEY (`hq_location_city_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_pages_ibfk_3` FOREIGN KEY (`hq_location_country_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_board_members`
--

DROP TABLE IF EXISTS `companies_board_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_board_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_company_id` int(11) NOT NULL DEFAULT '0',
  `bobject_user_id` int(11) NOT NULL DEFAULT '0',
  `bobject_initiator_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_company_id` (`bobject_company_id`),
  KEY `bobject_user_id` (`bobject_user_id`),
  KEY `status` (`status`),
  CONSTRAINT `companies_board_members_ibfk_1` FOREIGN KEY (`bobject_company_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companies_board_members_ibfk_2` FOREIGN KEY (`bobject_user_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_charts`
--

DROP TABLE IF EXISTS `companies_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_charts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `type` (`type`),
  CONSTRAINT `companies_charts_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21984354 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_investors`
--

DROP TABLE IF EXISTS `companies_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_investors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `investor_bobject_id` int(10) DEFAULT '0',
  `company_bobject_id` int(10) DEFAULT '0',
  `status` int(1) DEFAULT '1',
  `is_exited` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_investor_unique` (`investor_bobject_id`,`company_bobject_id`),
  KEY `company_bobject_id` (`company_bobject_id`),
  KEY `investor_bobject_id` (`investor_bobject_id`),
  CONSTRAINT `companies_investors_ibfk_1` FOREIGN KEY (`investor_bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companies_investors_ibfk_2` FOREIGN KEY (`company_bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29676 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_investors_tmp2`
--

DROP TABLE IF EXISTS `companies_investors_tmp2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_investors_tmp2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `investor_bobject_id` int(10) DEFAULT '0',
  `company_bobject_id` int(10) DEFAULT '0',
  `status` int(10) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `search` (`id`,`investor_bobject_id`,`company_bobject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4965 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_similar_web`
--

DROP TABLE IF EXISTS `companies_similar_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_similar_web` (
  `business_objects_id` int(11) NOT NULL,
  `traffic_month` smallint(5) unsigned NOT NULL,
  `traffic_year` int(10) unsigned NOT NULL,
  `traffic_users` float unsigned NOT NULL,
  `traffic_reach_json` text,
  PRIMARY KEY (`business_objects_id`,`traffic_month`,`traffic_year`),
  CONSTRAINT `fk_companies_similar_web_id` FOREIGN KEY (`business_objects_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_similar_web_ranking`
--

DROP TABLE IF EXISTS `companies_similar_web_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_similar_web_ranking` (
  `business_objects_id` int(11) NOT NULL,
  `rank` int(10) unsigned NOT NULL,
  PRIMARY KEY (`business_objects_id`),
  CONSTRAINT `fk_companies_similar_rank_id` FOREIGN KEY (`business_objects_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_users`
--

DROP TABLE IF EXISTS `companies_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_user_id` int(10) NOT NULL DEFAULT '0',
  `bobject_company_id` int(10) NOT NULL DEFAULT '0',
  `bobject_initiator_id` int(10) NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `is_past` int(11) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_founder` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_user` (`bobject_user_id`,`bobject_company_id`),
  KEY `bobject_user_id` (`bobject_user_id`),
  KEY `bobject_company_id` (`bobject_company_id`),
  KEY `is_past` (`is_past`),
  CONSTRAINT `companies_users_ibfk_1` FOREIGN KEY (`bobject_user_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companies_users_ibfk_2` FOREIGN KEY (`bobject_company_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148880 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_users_confirmations`
--

DROP TABLE IF EXISTS `companies_users_confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_users_confirmations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_bobject_id` int(11) NOT NULL,
  `user_bobject_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `is_past` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_bobject_id` (`company_bobject_id`),
  KEY `user_bobject_id` (`user_bobject_id`),
  CONSTRAINT `companies_users_confirmations_ibfk_1` FOREIGN KEY (`company_bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companies_users_confirmations_ibfk_2` FOREIGN KEY (`user_bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country_pages`
--

DROP TABLE IF EXISTS `country_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(250) DEFAULT NULL,
  `hq_location_country_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `description` text,
  `is_public` tinyint(4) NOT NULL DEFAULT '0',
  `1_month_fundings` bigint(20) DEFAULT NULL,
  `recent_fundings` bigint(20) DEFAULT NULL,
  `total_fundings` bigint(20) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_public` (`is_public`),
  KEY `region_id` (`region_id`),
  KEY `hq_location_country_id` (`hq_location_country_id`),
  CONSTRAINT `country_pages_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `country_pages_ibfk_2` FOREIGN KEY (`hq_location_country_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country_pages_data`
--

DROP TABLE IF EXISTS `country_pages_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_pages_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_page_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `key` varchar(250) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_page_id` (`country_page_id`),
  KEY `country_page_id_type` (`country_page_id`,`type`),
  CONSTRAINT `country_pages_data_ibfk_1` FOREIGN KEY (`country_page_id`) REFERENCES `country_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1574 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataroom_files`
--

DROP TABLE IF EXISTS `dataroom_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataroom_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataroom_id` int(11) NOT NULL DEFAULT '0',
  `bobject_user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `file` varchar(250) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `type` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  `bucket` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dataroom_id` (`dataroom_id`),
  KEY `bobject_user_id` (`bobject_user_id`),
  CONSTRAINT `dataroom_files_ibfk_1` FOREIGN KEY (`dataroom_id`) REFERENCES `datarooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataroom_files_ibfk_2` FOREIGN KEY (`bobject_user_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataroom_kpi_summary`
--

DROP TABLE IF EXISTS `dataroom_kpi_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataroom_kpi_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataroom_id` int(11) NOT NULL DEFAULT '0',
  `bobject_company_id` int(11) NOT NULL DEFAULT '0',
  `bobject_user_id` int(11) NOT NULL DEFAULT '0',
  `users` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `users_growth` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `paying_customers` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `volume` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `avg_price` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `revenues` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `revenues_predictive` varchar(50) DEFAULT NULL,
  `ebidta` varchar(50) DEFAULT NULL,
  `ebitda_source` tinyint(4) DEFAULT NULL,
  `currency` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `yoy_growth` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `gross_margin` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `operating_margin` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `valuation` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `market_cap` bigint(20) DEFAULT NULL,
  `revenues_hidden` tinyint(4) DEFAULT NULL,
  `ebitda_hidden` tinyint(4) DEFAULT NULL,
  `market_cap_hidden` tinyint(4) DEFAULT NULL,
  `valuation_hidden` tinyint(4) DEFAULT NULL,
  `profit_hidden` tinyint(4) DEFAULT NULL,
  `market_cap_source` tinyint(4) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_updated` int(11) DEFAULT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `values_source_1` tinyint(4) DEFAULT '0',
  `values_source_2` tinyint(4) DEFAULT '0',
  `values_source_3` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dataroom_id` (`dataroom_id`),
  KEY `bobject_company_id` (`bobject_company_id`),
  KEY `bobject_user_id` (`bobject_user_id`),
  CONSTRAINT `dataroom_kpi_summary_ibfk_1` FOREIGN KEY (`dataroom_id`) REFERENCES `datarooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataroom_kpi_summary_ibfk_2` FOREIGN KEY (`bobject_user_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataroom_kpi_summary_ibfk_3` FOREIGN KEY (`bobject_company_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=315159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataroom_kpi_summary_valuations`
--

DROP TABLE IF EXISTS `dataroom_kpi_summary_valuations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataroom_kpi_summary_valuations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kpi_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `valuation` bigint(20) DEFAULT NULL,
  `valuation_currency` varchar(255) DEFAULT NULL,
  `market_cap` bigint(20) DEFAULT NULL,
  `market_cap_currency` varchar(255) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kpi_year_month` (`kpi_id`,`year`,`month`),
  KEY `kpi_id` (`kpi_id`),
  CONSTRAINT `dataroom_kpi_summary_valuations_ibfk_1` FOREIGN KEY (`kpi_id`) REFERENCES `dataroom_kpi_summary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataroom_kpi_summary_values`
--

DROP TABLE IF EXISTS `dataroom_kpi_summary_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataroom_kpi_summary_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kpi_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) DEFAULT NULL,
  `revenue` bigint(20) DEFAULT NULL,
  `revenue_growth` int(11) DEFAULT NULL,
  `ebitda` bigint(20) DEFAULT NULL,
  `ebitda_margin` int(11) DEFAULT NULL,
  `profit` bigint(20) DEFAULT NULL,
  `profit_margin` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kpi_year` (`kpi_id`,`year`),
  KEY `kpi_id` (`kpi_id`),
  CONSTRAINT `dataroom_kpi_summary_values_ibfk_1` FOREIGN KEY (`kpi_id`) REFERENCES `dataroom_kpi_summary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=731 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datarooms`
--

DROP TABLE IF EXISTS `datarooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datarooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_company_id` int(11) NOT NULL DEFAULT '0',
  `bobject_user_id` int(11) NOT NULL DEFAULT '0',
  `is_public` int(11) NOT NULL DEFAULT '1',
  `project_type` int(11) NOT NULL DEFAULT '0',
  `module_1` int(11) NOT NULL DEFAULT '0',
  `module_2` int(11) NOT NULL DEFAULT '0',
  `module_3` int(11) NOT NULL DEFAULT '0',
  `module_4` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  `dataroom_name` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_company_id` (`bobject_company_id`),
  KEY `status` (`status`),
  KEY `bobject_user_id` (`bobject_user_id`),
  CONSTRAINT `datarooms_ibfk_1` FOREIGN KEY (`bobject_company_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `datarooms_ibfk_2` FOREIGN KEY (`bobject_user_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=314985 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datarooms_users`
--

DROP TABLE IF EXISTS `datarooms_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datarooms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataroom_id` int(11) NOT NULL DEFAULT '0',
  `bobject_user_id` int(11) NOT NULL DEFAULT '0',
  `bobject_initiator_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dataroom_id` (`dataroom_id`),
  KEY `bobject_user_id` (`bobject_user_id`),
  CONSTRAINT `datarooms_users_ibfk_1` FOREIGN KEY (`dataroom_id`) REFERENCES `datarooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `datarooms_users_ibfk_2` FOREIGN KEY (`bobject_user_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=324184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) DEFAULT NULL,
  `work_time` int(11) NOT NULL DEFAULT '0',
  `extra_1` varchar(250) DEFAULT NULL,
  `extra_2` varchar(250) DEFAULT NULL,
  `extra_3` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135325 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `digest_followers_banned`
--

DROP TABLE IF EXISTS `digest_followers_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digest_followers_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5008 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `digest_funding_banned`
--

DROP TABLE IF EXISTS `digest_funding_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digest_funding_banned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) NOT NULL DEFAULT '0',
  `funding_id` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=838043 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `digest_log`
--

DROP TABLE IF EXISTS `digest_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digest_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `digest_recommended_banned`
--

DROP TABLE IF EXISTS `digest_recommended_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digest_recommended_banned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) NOT NULL DEFAULT '0',
  `bobject_recommended_id` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258511 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `digest_statistic`
--

DROP TABLE IF EXISTS `digest_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digest_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(150) DEFAULT NULL,
  `action_url` varchar(250) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `timecreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3547 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exits`
--

DROP TABLE IF EXISTS `exits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funding_id` int(11) DEFAULT NULL,
  `total_ev` int(11) DEFAULT NULL,
  `ev_ltm_sales` float DEFAULT NULL,
  `ev_ltm_ebidta` float DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` varchar(250) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `workload` text NOT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=776468 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_authors`
--

DROP TABLE IF EXISTS `feed_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  CONSTRAINT `feed_authors_ibfk_1` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_categories`
--

DROP TABLE IF EXISTS `feed_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  CONSTRAINT `feed_categories_ibfk_1` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1735 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_excluded_domains`
--

DROP TABLE IF EXISTS `feed_excluded_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_excluded_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_items`
--

DROP TABLE IF EXISTS `feed_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) DEFAULT NULL,
  `item_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `author_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `feed_item_round_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `pub_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `pub_datetime` datetime DEFAULT NULL,
  `summary` text CHARACTER SET latin1,
  `content` text CHARACTER SET latin1,
  `status` tinyint(4) DEFAULT '0',
  `is_core` tinyint(4) NOT NULL DEFAULT '0',
  `is_new_fund` tinyint(4) DEFAULT '0',
  `is_postponed` tinyint(4) DEFAULT '0',
  `is_ignored` tinyint(4) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  KEY `feed_item_round_id` (`feed_item_round_id`),
  CONSTRAINT `feed_items_ibfk_1` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feed_items_ibfk_2` FOREIGN KEY (`feed_item_round_id`) REFERENCES `feed_items_rounds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4215 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_items_bobjects`
--

DROP TABLE IF EXISTS `feed_items_bobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_items_bobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_item_id` int(11) DEFAULT NULL,
  `feed_bobject_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_item_id` (`feed_item_id`),
  KEY `feed_bobject_id` (`feed_bobject_id`),
  CONSTRAINT `feed_items_bobjects_ibfk_1` FOREIGN KEY (`feed_item_id`) REFERENCES `feed_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feed_items_bobjects_ibfk_2` FOREIGN KEY (`feed_bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10391 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_items_categories`
--

DROP TABLE IF EXISTS `feed_items_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_items_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_item_id` int(11) DEFAULT NULL,
  `feed_category_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_item_id` (`feed_item_id`),
  KEY `feed_category_id` (`feed_category_id`),
  CONSTRAINT `feed_items_categories_ibfk_1` FOREIGN KEY (`feed_item_id`) REFERENCES `feed_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feed_items_categories_ibfk_2` FOREIGN KEY (`feed_category_id`) REFERENCES `feed_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4681 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_items_round_investors`
--

DROP TABLE IF EXISTS `feed_items_round_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_items_round_investors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_item_round_id` int(11) DEFAULT NULL,
  `bobject_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_item_round_id` (`feed_item_round_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `feed_items_round_investors_ibfk_1` FOREIGN KEY (`feed_item_round_id`) REFERENCES `feed_items_rounds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feed_items_round_investors_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_items_rounds`
--

DROP TABLE IF EXISTS `feed_items_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_items_rounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `round` varchar(255) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `imported_round_id` int(11) DEFAULT NULL,
  `is_duplicate` tinyint(4) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `imported_round_id` (`imported_round_id`),
  CONSTRAINT `feed_items_rounds_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feed_items_rounds_ibfk_2` FOREIGN KEY (`imported_round_id`) REFERENCES `bobjects_fundings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_keyword_tags`
--

DROP TABLE IF EXISTS `feed_keyword_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_keyword_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_keywords`
--

DROP TABLE IF EXISTS `feed_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_keywords_tags`
--

DROP TABLE IF EXISTS `feed_keywords_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_keywords_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_keyword_id` int(11) NOT NULL DEFAULT '0',
  `feed_keyword_tag_id` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_keyword_id` (`feed_keyword_id`),
  KEY `feed_keyword_tag_id` (`feed_keyword_tag_id`),
  CONSTRAINT `feed_keywords_tags_ibfk_1` FOREIGN KEY (`feed_keyword_id`) REFERENCES `feed_keywords` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feed_keywords_tags_ibfk_2` FOREIGN KEY (`feed_keyword_tag_id`) REFERENCES `feed_keyword_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `regular_expression` text NOT NULL,
  `feed_keyword_id` int(11) DEFAULT NULL,
  `is_public` tinyint(4) DEFAULT '0',
  `is_core` tinyint(4) NOT NULL DEFAULT '0',
  `last_import` int(11) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_keyword_id` (`feed_keyword_id`),
  CONSTRAINT `feeds_ibfk_1` FOREIGN KEY (`feed_keyword_id`) REFERENCES `feed_keywords` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_matrix`
--

DROP TABLE IF EXISTS `funding_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_country_id` int(11) NOT NULL DEFAULT '0',
  `receiver_country_id` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `value_excluded` bigint(20) NOT NULL DEFAULT '0',
  `year` int(11) DEFAULT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9381 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_matrix_cities`
--

DROP TABLE IF EXISTS `funding_matrix_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_matrix_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_city_id` int(11) NOT NULL DEFAULT '0',
  `receiver_city_id` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2402 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_matrix_item_investors`
--

DROP TABLE IF EXISTS `funding_matrix_item_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_matrix_item_investors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matrix_item_id` int(11) DEFAULT NULL,
  `bobject_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matrix_item_id` (`matrix_item_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `funding_matrix_item_investors_ibfk_1` FOREIGN KEY (`matrix_item_id`) REFERENCES `funding_matrix_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `funding_matrix_item_investors_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25708 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_matrix_items`
--

DROP TABLE IF EXISTS `funding_matrix_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_matrix_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matrix_id` int(11) DEFAULT NULL,
  `funding_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matrix_id` (`matrix_id`),
  KEY `funding_id` (`funding_id`),
  CONSTRAINT `funding_matrix_items_ibfk_1` FOREIGN KEY (`matrix_id`) REFERENCES `funding_matrix` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `funding_matrix_items_ibfk_2` FOREIGN KEY (`funding_id`) REFERENCES `bobjects_fundings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33268 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_quarterly_cities`
--

DROP TABLE IF EXISTS `funding_quarterly_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_quarterly_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `quarter` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `value_full` bigint(20) NOT NULL DEFAULT '0',
  `count` int(11) DEFAULT NULL,
  `count_full` int(11) DEFAULT NULL,
  `target_type` tinyint(4) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `year` (`year`),
  KEY `quarter` (`quarter`),
  KEY `value` (`value`),
  CONSTRAINT `funding_quarterly_cities_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_quarterly_countries`
--

DROP TABLE IF EXISTS `funding_quarterly_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_quarterly_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `quarter` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `value_full` bigint(20) NOT NULL DEFAULT '0',
  `count` int(11) DEFAULT NULL,
  `count_full` int(11) DEFAULT NULL,
  `target_type` tinyint(4) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `year` (`year`),
  KEY `quarter` (`quarter`),
  KEY `value` (`value`),
  CONSTRAINT `funding_quarterly_countries_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89537 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_quarterly_industries`
--

DROP TABLE IF EXISTS `funding_quarterly_industries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_quarterly_industries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `quarter` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `value_full` bigint(20) NOT NULL DEFAULT '0',
  `count` int(11) DEFAULT NULL,
  `count_full` int(11) DEFAULT NULL,
  `target_type` tinyint(4) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `industry_id` (`industry_id`),
  KEY `year` (`year`),
  KEY `quarter` (`quarter`),
  KEY `value` (`value`),
  CONSTRAINT `funding_quarterly_industries_ibfk_1` FOREIGN KEY (`industry_id`) REFERENCES `industry_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_quarterly_revenues`
--

DROP TABLE IF EXISTS `funding_quarterly_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_quarterly_revenues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revenue_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `quarter` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `value_full` bigint(20) NOT NULL DEFAULT '0',
  `count` int(11) DEFAULT NULL,
  `count_full` int(11) DEFAULT NULL,
  `target_type` tinyint(4) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revenue_id` (`revenue_id`),
  KEY `year` (`year`),
  KEY `quarter` (`quarter`),
  KEY `value` (`value`),
  CONSTRAINT `funding_quarterly_revenues_ibfk_1` FOREIGN KEY (`revenue_id`) REFERENCES `revenue_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34783 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_quarterly_tags`
--

DROP TABLE IF EXISTS `funding_quarterly_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_quarterly_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `quarter` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `value_full` bigint(20) NOT NULL DEFAULT '0',
  `count` int(11) DEFAULT NULL,
  `count_full` int(11) DEFAULT NULL,
  `target_type` tinyint(4) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `year` (`year`),
  KEY `quarter` (`quarter`),
  KEY `value` (`value`),
  CONSTRAINT `funding_quarterly_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_quarterly_weighted_industries`
--

DROP TABLE IF EXISTS `funding_quarterly_weighted_industries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_quarterly_weighted_industries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `quarter` int(11) NOT NULL DEFAULT '0',
  `weight` bigint(20) NOT NULL DEFAULT '0',
  `weight_full` bigint(20) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `industry_id` (`industry_id`),
  KEY `year` (`year`),
  KEY `quarter` (`quarter`),
  KEY `weight` (`weight`),
  CONSTRAINT `funding_quarterly_weighted_industries_ibfk_1` FOREIGN KEY (`industry_id`) REFERENCES `industry_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30229 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_quarterly_weighted_revenues`
--

DROP TABLE IF EXISTS `funding_quarterly_weighted_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_quarterly_weighted_revenues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revenue_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `quarter` int(11) NOT NULL DEFAULT '0',
  `weight` bigint(20) NOT NULL DEFAULT '0',
  `weight_full` bigint(20) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revenue_id` (`revenue_id`),
  KEY `year` (`year`),
  KEY `quarter` (`quarter`),
  KEY `weight` (`weight`),
  CONSTRAINT `funding_quarterly_weighted_revenues_ibfk_1` FOREIGN KEY (`revenue_id`) REFERENCES `revenue_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funds_quarterly_countries`
--

DROP TABLE IF EXISTS `funds_quarterly_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funds_quarterly_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `quarter` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `year` (`year`),
  KEY `quarter` (`quarter`),
  KEY `value` (`value`),
  CONSTRAINT `funds_quarterly_countries_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) NOT NULL DEFAULT '',
  `file` varchar(250) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `bobject_id` int(11) unsigned DEFAULT NULL,
  `storage` varchar(10) NOT NULL DEFAULT '',
  `draft` int(1) NOT NULL DEFAULT '0',
  `delete` int(1) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114297 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `industries_multiples`
--

DROP TABLE IF EXISTS `industries_multiples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industries_multiples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL DEFAULT '0',
  `f1` varchar(250) DEFAULT NULL,
  `f2` varchar(250) DEFAULT NULL,
  `f3` varchar(250) DEFAULT NULL,
  `f4` varchar(250) DEFAULT NULL,
  `f5` varchar(250) DEFAULT NULL,
  `f6` varchar(250) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_id` (`import_id`),
  KEY `industry_1` (`f2`),
  KEY `industry_2` (`f3`)
) ENGINE=InnoDB AUTO_INCREMENT=3351 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `industries_multiples_imports`
--

DROP TABLE IF EXISTS `industries_multiples_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industries_multiples_imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL DEFAULT '0',
  `rows` int(11) NOT NULL DEFAULT '0',
  `file` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `industry_pages`
--

DROP TABLE IF EXISTS `industry_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industry_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(250) DEFAULT NULL,
  `description` text,
  `image_url` varchar(250) DEFAULT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0',
  `1_month_fundings` bigint(20) DEFAULT NULL,
  `recent_fundings` bigint(20) DEFAULT NULL,
  `total_fundings` bigint(20) DEFAULT NULL,
  `companies_count` int(11) DEFAULT NULL,
  `funds_count` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `industry_id` (`industry_id`),
  KEY `is_public` (`is_public`),
  CONSTRAINT `industry_pages_ibfk_1` FOREIGN KEY (`industry_id`) REFERENCES `param_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `investment_opportunities`
--

DROP TABLE IF EXISTS `investment_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment_opportunities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_company_id` int(11) DEFAULT NULL,
  `bobject_initiator_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `is_public` int(11) NOT NULL DEFAULT '1',
  `financing_stage` varchar(250) DEFAULT NULL,
  `currency` varchar(250) DEFAULT NULL,
  `amount` varchar(250) DEFAULT NULL,
  `file_id` int(11) NOT NULL DEFAULT '0',
  `equity` int(11) DEFAULT NULL,
  `target_company` varchar(250) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  `track_record` longtext,
  `traction` longtext,
  `show_industry` int(1) DEFAULT '1',
  `show_location` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `bobject_company_id` (`bobject_company_id`),
  KEY `status` (`status`),
  KEY `is_public` (`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `investment_opportunities_investors`
--

DROP TABLE IF EXISTS `investment_opportunities_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment_opportunities_investors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(11) NOT NULL DEFAULT '0',
  `bobject_investor_id` int(11) NOT NULL DEFAULT '0',
  `date` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opportunity_id` (`opportunity_id`),
  KEY `bobject_investor_id` (`bobject_investor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `investment_opportunities_users`
--

DROP TABLE IF EXISTS `investment_opportunities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment_opportunities_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(11) NOT NULL DEFAULT '0',
  `bobject_user_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `date` int(11) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opportunity_id` (`opportunity_id`),
  KEY `bobject_user_id` (`bobject_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `investment_opportunity_files`
--

DROP TABLE IF EXISTS `investment_opportunity_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment_opportunity_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_user_id` int(11) NOT NULL DEFAULT '0',
  `file` varchar(250) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `preview` varchar(250) NOT NULL DEFAULT '',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `investors_lp_investments`
--

DROP TABLE IF EXISTS `investors_lp_investments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investors_lp_investments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_investor_id` int(11) NOT NULL DEFAULT '0',
  `bobject_investment_id` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_investor_id` (`bobject_investor_id`),
  KEY `bobject_investment_id` (`bobject_investment_id`),
  CONSTRAINT `investors_lp_investments_ibfk_1` FOREIGN KEY (`bobject_investor_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `investors_lp_investments_ibfk_2` FOREIGN KEY (`bobject_investment_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL DEFAULT '',
  `name` varchar(250) NOT NULL DEFAULT '',
  `title` varchar(150) NOT NULL DEFAULT '',
  `is_admin` int(1) NOT NULL DEFAULT '0',
  `hash` varchar(64) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `bobject_company_id` int(11) DEFAULT NULL,
  `bobject_initiator_id` int(11) DEFAULT NULL,
  `is_board_member` int(11) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `tiemupdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists`
--

DROP TABLE IF EXISTS `lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `is_public` tinyint(4) DEFAULT NULL,
  `special` tinyint(4) DEFAULT NULL,
  `share_token` varchar(100) DEFAULT NULL,
  `alerts_enabled` tinyint(4) DEFAULT '0',
  `date` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `lists_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists_bobjects`
--

DROP TABLE IF EXISTS `lists_bobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists_bobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) DEFAULT NULL,
  `bobject_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `list_bobject` (`bobject_id`,`list_id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `list_id` (`list_id`),
  CONSTRAINT `lists_bobjects_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lists_bobjects_ibfk_2` FOREIGN KEY (`list_id`) REFERENCES `lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=885958 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(250) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `storage` varchar(15) NOT NULL DEFAULT '',
  `bobject_id` int(11) unsigned DEFAULT NULL,
  `is_draft` int(1) NOT NULL DEFAULT '0',
  `delete` int(1) NOT NULL DEFAULT '0',
  `description` varchar(250) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OLD_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128907 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_dialogs`
--

DROP TABLE IF EXISTS `message_dialogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_dialogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(200) NOT NULL DEFAULT '',
  `bobject_user_1` int(11) NOT NULL DEFAULT '0',
  `bobject_user_2` int(11) NOT NULL DEFAULT '0',
  `timestamp_last_message` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) NOT NULL DEFAULT '0',
  `last_message_from` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dialog_users` (`bobject_user_1`,`bobject_user_2`),
  KEY `last_message_id` (`last_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) DEFAULT '0',
  `receiver_id` int(10) DEFAULT '0',
  `date` int(10) DEFAULT '0',
  `body` text,
  `sender_status` int(1) DEFAULT '1',
  `receiver_status` int(1) DEFAULT '0',
  `dialog_id` int(11) NOT NULL DEFAULT '0',
  `user_1_delete` int(1) NOT NULL DEFAULT '0',
  `user_2_delete` int(1) NOT NULL DEFAULT '0',
  `dataroom_id` int(11) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IMPORT_DONE` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dialog_id` (`dialog_id`),
  KEY `sender_receiver` (`sender_id`,`receiver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages_contacts`
--

DROP TABLE IF EXISTS `messages_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bobject_user_1` int(11) DEFAULT NULL,
  `bobject_user_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_groups`
--

DROP TABLE IF EXISTS `notification_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `options` varchar(250) NOT NULL DEFAULT '1.2.3.4.5.6',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_postoned`
--

DROP TABLE IF EXISTS `notification_postoned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_postoned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `item_type` varchar(25) NOT NULL DEFAULT '',
  `notification_group` int(1) NOT NULL DEFAULT '2',
  `notification_group_setting` int(1) NOT NULL DEFAULT '3',
  `bobject_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1279166 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_types`
--

DROP TABLE IF EXISTS `notification_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(150) NOT NULL,
  `group` int(2) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `template` text NOT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(10) DEFAULT '0',
  `date` int(10) DEFAULT '0',
  `status` int(10) DEFAULT '0',
  `bobject_initiator_id` int(10) DEFAULT '0',
  `from_bobject_id` int(10) DEFAULT '0',
  `OLD_FROM_OBJECT_TYPE` int(10) DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `extra_1` varchar(255) DEFAULT NULL,
  `extra_2` varchar(255) DEFAULT NULL,
  `extra_3` varchar(255) DEFAULT NULL,
  `extra_4` varchar(255) DEFAULT NULL,
  `extra_5` varchar(255) DEFAULT NULL,
  `result_action` varchar(50) DEFAULT '',
  `code` varchar(250) NOT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1310434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications_params`
--

DROP TABLE IF EXISTS `notifications_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_params` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `notification_id` int(10) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11399 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications_timestamps`
--

DROP TABLE IF EXISTS `notifications_timestamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_timestamps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `notifications_timestamps_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT '0',
  `availability` varchar(30) DEFAULT '0',
  `requirements` text NOT NULL,
  `position` varchar(30) DEFAULT '',
  `location` varchar(250) DEFAULT NULL,
  `company_url` varchar(250) DEFAULT '0',
  `offer_url` varchar(250) DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `date` int(11) DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4776 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_backgrounds`
--

DROP TABLE IF EXISTS `param_backgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_backgrounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_categories`
--

DROP TABLE IF EXISTS `param_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent` int(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_degrees`
--

DROP TABLE IF EXISTS `param_degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_hq_location_relations`
--

DROP TABLE IF EXISTS `param_hq_location_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_hq_location_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `param_id` int(11) DEFAULT NULL,
  `belongs_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `param_id` (`param_id`),
  KEY `belongs_to` (`belongs_to`),
  CONSTRAINT `param_hq_location_relations_ibfk_1` FOREIGN KEY (`param_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `param_hq_location_relations_ibfk_2` FOREIGN KEY (`belongs_to`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28535 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_hq_locations`
--

DROP TABLE IF EXISTS `param_hq_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_hq_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `is_continent` tinyint(4) DEFAULT '0',
  `is_country` tinyint(4) DEFAULT '0',
  `is_city` tinyint(4) DEFAULT '0',
  `lat` decimal(11,8) DEFAULT NULL,
  `lon` decimal(11,8) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `param_hq_locations_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `param_hq_locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29810 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_location_relations`
--

DROP TABLE IF EXISTS `param_location_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_location_relations` (
  `param_id` int(11) unsigned NOT NULL DEFAULT '0',
  `belongs_to` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `location_id` (`param_id`,`belongs_to`),
  KEY `belongs_to_fk` (`belongs_to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_locations`
--

DROP TABLE IF EXISTS `param_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_locations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `timecreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timeupdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved` int(1) NOT NULL DEFAULT '0',
  `is_country` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21794 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_majors`
--

DROP TABLE IF EXISTS `param_majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_majors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_models`
--

DROP TABLE IF EXISTS `param_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_momentums`
--

DROP TABLE IF EXISTS `param_momentums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_momentums` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_occupations`
--

DROP TABLE IF EXISTS `param_occupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_occupations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_ownerships`
--

DROP TABLE IF EXISTS `param_ownerships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_ownerships` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` int(10) DEFAULT NULL,
  `approved` int(1) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_payments`
--

DROP TABLE IF EXISTS `param_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_places`
--

DROP TABLE IF EXISTS `param_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `approved` int(11) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_revenues`
--

DROP TABLE IF EXISTS `param_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_revenues` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=839 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_sectors`
--

DROP TABLE IF EXISTS `param_sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_sectors` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `timecreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timeupdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11142 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_skills`
--

DROP TABLE IF EXISTS `param_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_skills` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2277 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `premium`
--

DROP TABLE IF EXISTS `premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `expire_on` int(11) DEFAULT NULL,
  `is_trial` tinyint(4) DEFAULT '0',
  `trial_used` tinyint(4) NOT NULL DEFAULT '0',
  `trial_used_on` int(11) DEFAULT NULL,
  `access_emails` tinyint(4) NOT NULL DEFAULT '0',
  `access_analytics` tinyint(4) NOT NULL DEFAULT '0',
  `access_filters` tinyint(4) NOT NULL DEFAULT '0',
  `access_export` tinyint(4) NOT NULL DEFAULT '0',
  `access_markets` tinyint(4) NOT NULL DEFAULT '0',
  `exports_limit` int(11) DEFAULT NULL,
  `emails_limit` int(11) DEFAULT NULL,
  `rows_limit` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  `exports_number` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `premium_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `premium_domains`
--

DROP TABLE IF EXISTS `premium_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premium_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) DEFAULT NULL,
  `expire_on` int(11) DEFAULT NULL,
  `access_emails` tinyint(4) NOT NULL DEFAULT '0',
  `access_analytics` tinyint(4) NOT NULL DEFAULT '0',
  `access_filters` tinyint(4) NOT NULL DEFAULT '0',
  `access_export` tinyint(4) NOT NULL DEFAULT '0',
  `access_markets` tinyint(4) NOT NULL DEFAULT '0',
  `exports_limit` int(11) DEFAULT NULL,
  `emails_limit` int(11) DEFAULT NULL,
  `rows_limit` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile_views`
--

DROP TABLE IF EXISTS `profile_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_company_id` int(11) DEFAULT NULL,
  `bobject_user_id` int(11) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `is_owner` tinyint(4) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_user_id` (`bobject_user_id`),
  KEY `bobject_company_id` (`bobject_company_id`),
  CONSTRAINT `profile_views_ibfk_1` FOREIGN KEY (`bobject_user_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profile_views_ibfk_2` FOREIGN KEY (`bobject_company_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5368370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quickfill_keywords`
--

DROP TABLE IF EXISTS `quickfill_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quickfill_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `b2b` tinyint(4) NOT NULL DEFAULT '0',
  `b2c` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2294 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quickfill_keywords_categories`
--

DROP TABLE IF EXISTS `quickfill_keywords_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quickfill_keywords_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `keyword_id` (`keyword_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `quickfill_keywords_categories_ibfk_1` FOREIGN KEY (`keyword_id`) REFERENCES `quickfill_keywords` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quickfill_keywords_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `param_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1753 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quickfill_keywords_revenues`
--

DROP TABLE IF EXISTS `quickfill_keywords_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quickfill_keywords_revenues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL,
  `revenue_id` int(11) NOT NULL,
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `keyword_id` (`keyword_id`),
  KEY `revenue_id` (`revenue_id`),
  CONSTRAINT `quickfill_keywords_revenues_ibfk_1` FOREIGN KEY (`keyword_id`) REFERENCES `quickfill_keywords` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quickfill_keywords_revenues_ibfk_2` FOREIGN KEY (`revenue_id`) REFERENCES `param_revenues` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quickfill_keywords_sectors`
--

DROP TABLE IF EXISTS `quickfill_keywords_sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quickfill_keywords_sectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `keyword_id` (`keyword_id`),
  KEY `sector_id` (`sector_id`),
  CONSTRAINT `quickfill_keywords_sectors_ibfk_1` FOREIGN KEY (`keyword_id`) REFERENCES `quickfill_keywords` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quickfill_keywords_sectors_ibfk_2` FOREIGN KEY (`sector_id`) REFERENCES `param_sectors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redirects`
--

DROP TABLE IF EXISTS `redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) DEFAULT NULL,
  `new_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regions_cities`
--

DROP TABLE IF EXISTS `regions_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `hq_location_city_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `hq_location_country_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  KEY `hq_location_city_id` (`hq_location_city_id`),
  KEY `hq_location_country_id` (`hq_location_country_id`),
  CONSTRAINT `regions_cities_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `regions_cities_ibfk_2` FOREIGN KEY (`hq_location_city_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `regions_cities_ibfk_3` FOREIGN KEY (`hq_location_country_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regions_countries`
--

DROP TABLE IF EXISTS `regions_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `hq_location_country_id` int(11) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  KEY `hq_location_country_id` (`hq_location_country_id`),
  CONSTRAINT `regions_countries_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `regions_countries_ibfk_2` FOREIGN KEY (`hq_location_country_id`) REFERENCES `param_hq_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_picture` varchar(255) DEFAULT NULL,
  `user_linkedin` varchar(255) DEFAULT NULL,
  `user_bio` longtext,
  `user_education` varchar(255) DEFAULT NULL,
  `user_skills` varchar(255) DEFAULT NULL,
  `user_business_types` varchar(255) DEFAULT NULL,
  `business_types` varchar(255) NOT NULL,
  `company_title` varchar(255) DEFAULT NULL,
  `company_is_board_member` int(11) NOT NULL DEFAULT '0',
  `company_name` varchar(255) DEFAULT NULL,
  `company_picture` varchar(255) DEFAULT NULL,
  `company_tagline` longtext,
  `company_description` longtext,
  `company_number_of_employees` varchar(255) NOT NULL,
  `company_locations` varchar(255) DEFAULT NULL,
  `company_categories` varchar(255) DEFAULT NULL,
  `company_sectors` varchar(255) DEFAULT NULL,
  `company_stage_1` int(1) DEFAULT '0',
  `company_stage_2` int(1) DEFAULT '0',
  `company_stage_3` int(1) DEFAULT '0',
  `company_stage_4` int(1) DEFAULT '0',
  `company_tg_locations` varchar(255) DEFAULT NULL,
  `company_revenues` varchar(255) DEFAULT NULL,
  `company_ownerships` varchar(255) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `company_facebook` varchar(255) DEFAULT NULL,
  `company_linkedin` varchar(255) DEFAULT NULL,
  `company_twitter` varchar(255) DEFAULT NULL,
  `company_markets` varchar(255) DEFAULT NULL,
  `company_youtube` varchar(255) DEFAULT NULL,
  `company_slides` varchar(255) DEFAULT NULL,
  `investor_deal_min` varchar(255) DEFAULT NULL,
  `investor_deal_max` varchar(255) DEFAULT NULL,
  `security_1` tinyint(4) NOT NULL DEFAULT '0',
  `security_2` tinyint(4) NOT NULL DEFAULT '0',
  `security_3` tinyint(4) NOT NULL DEFAULT '0',
  `security_4` tinyint(4) NOT NULL DEFAULT '0',
  `security_5` tinyint(4) NOT NULL DEFAULT '0',
  `security_6` tinyint(4) NOT NULL DEFAULT '0',
  `invitation_bobject` int(10) DEFAULT '0',
  `company_fund_stage` int(1) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `investor_b2b` int(1) NOT NULL DEFAULT '0',
  `investor_b2c` int(1) NOT NULL DEFAULT '0',
  `category` int(1) NOT NULL DEFAULT '0',
  `category_2` int(11) NOT NULL DEFAULT '0',
  `is_complete` int(1) NOT NULL DEFAULT '0',
  `is_declined` int(11) NOT NULL DEFAULT '0',
  `imported_user_id` int(11) NOT NULL DEFAULT '0',
  `user_facebook` varchar(255) DEFAULT NULL,
  `user_twitter` varchar(255) DEFAULT NULL,
  `user_angellist` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90018033 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_commentmeta`
--

DROP TABLE IF EXISTS `research_wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_comments`
--

DROP TABLE IF EXISTS `research_wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_links`
--

DROP TABLE IF EXISTS `research_wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_options`
--

DROP TABLE IF EXISTS `research_wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_postmeta`
--

DROP TABLE IF EXISTS `research_wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_posts`
--

DROP TABLE IF EXISTS `research_wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_name` (`post_name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_term_relationships`
--

DROP TABLE IF EXISTS `research_wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_term_taxonomy`
--

DROP TABLE IF EXISTS `research_wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_terms`
--

DROP TABLE IF EXISTS `research_wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_usermeta`
--

DROP TABLE IF EXISTS `research_wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_wp_users`
--

DROP TABLE IF EXISTS `research_wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `researches`
--

DROP TABLE IF EXISTS `researches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobject_id` int(11) DEFAULT NULL,
  `author` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `title` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `summary` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `url` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `date` int(11) NOT NULL,
  `approved` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `researches_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `researches_categories`
--

DROP TABLE IF EXISTS `researches_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researches_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `research_id` (`research_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `researches_categories_ibfk_1` FOREIGN KEY (`research_id`) REFERENCES `researches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `researches_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `param_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `researches_companies`
--

DROP TABLE IF EXISTS `researches_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researches_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) NOT NULL,
  `bobject_id` int(11) NOT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `research_id` (`research_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `researches_companies_ibfk_1` FOREIGN KEY (`research_id`) REFERENCES `researches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `researches_companies_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `researches_locations`
--

DROP TABLE IF EXISTS `researches_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researches_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `research_id` (`research_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `researches_locations_ibfk_1` FOREIGN KEY (`research_id`) REFERENCES `researches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `researches_locations_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `param_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `researches_param_tags`
--

DROP TABLE IF EXISTS `researches_param_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researches_param_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `researches_tags`
--

DROP TABLE IF EXISTS `researches_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researches_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `research_id` (`research_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `researches_tags_ibfk_1` FOREIGN KEY (`research_id`) REFERENCES `researches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `researches_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `researches_param_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revenue_pages`
--

DROP TABLE IF EXISTS `revenue_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revenue_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revenue_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `description` text CHARACTER SET latin1,
  `recent_fundings` bigint(20) DEFAULT NULL,
  `total_fundings` bigint(20) DEFAULT NULL,
  `1_month_fundings` bigint(20) DEFAULT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_public` (`is_public`),
  KEY `revenue_id` (`revenue_id`),
  CONSTRAINT `revenue_pages_ibfk_1` FOREIGN KEY (`revenue_id`) REFERENCES `param_revenues` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `search_type` varchar(50) DEFAULT NULL,
  `keyword` varchar(255) NOT NULL,
  `params` text,
  `bobject_id` int(11) NOT NULL DEFAULT '0',
  `alerts_enabled` tinyint(4) DEFAULT '0',
  `alerts_status` tinyint(4) DEFAULT '0',
  `items_number` int(11) DEFAULT '0',
  `is_public` tinyint(4) DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `bobjects_timeupdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bobject_id` (`bobject_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saved_searches_bobjects`
--

DROP TABLE IF EXISTS `saved_searches_bobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_searches_bobjects` (
  `saved_search_id` int(10) unsigned NOT NULL,
  `bobject_id` int(11) NOT NULL,
  `from_init` tinyint(4) DEFAULT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  KEY `saved_search_id` (`saved_search_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `saved_searches_bobjects_ibfk_1` FOREIGN KEY (`saved_search_id`) REFERENCES `saved_search` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saved_searches_bobjects_ibfk_2` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag_pages`
--

DROP TABLE IF EXISTS `tag_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(250) DEFAULT NULL,
  `recent_fundings` bigint(20) DEFAULT NULL,
  `total_fundings` bigint(20) DEFAULT NULL,
  `1_month_fundings` bigint(20) DEFAULT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_public` (`is_public`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `tag_pages_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `param_sectors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trading_multiples`
--

DROP TABLE IF EXISTS `trading_multiples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trading_multiples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL DEFAULT '0',
  `bobject_id` int(11) DEFAULT NULL,
  `company_name` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `industry_1` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `industry_2` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `market_equity` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `market_equity_eur_source` bigint(20) DEFAULT NULL,
  `share_price` varchar(255) DEFAULT NULL,
  `share_price_eur_source` bigint(20) DEFAULT NULL,
  `market_firm` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `market_firm_eur_source` bigint(20) DEFAULT NULL,
  `revenue_2014` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `revenue_2014_source` int(11) DEFAULT NULL,
  `revenue_2015` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `revenue_2015_source` int(11) DEFAULT NULL,
  `ebitda_2014` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `ebitda_2014_source` int(11) DEFAULT NULL,
  `ebitda_2015` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `ebitda_2015_source` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `revenue_1` int(11) DEFAULT NULL,
  `revenue_2` int(11) DEFAULT NULL,
  `ebitda_1` int(11) DEFAULT NULL,
  `ebitda_2` int(11) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_id` (`import_id`),
  KEY `industry_1` (`industry_1`),
  KEY `industry_2` (`industry_2`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `trading_multiples_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7596 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trading_multiples_imports`
--

DROP TABLE IF EXISTS `trading_multiples_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trading_multiples_imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL DEFAULT '0',
  `rows` int(11) NOT NULL DEFAULT '0',
  `file` varchar(250) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trading_multiples_values`
--

DROP TABLE IF EXISTS `trading_multiples_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trading_multiples_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trading_multiple_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) DEFAULT NULL,
  `ev` varchar(255) DEFAULT NULL,
  `ev_source` bigint(20) DEFAULT NULL,
  `ev_revenue` varchar(255) DEFAULT NULL,
  `ev_revenue_source` bigint(20) DEFAULT NULL,
  `ev_ebitda` varchar(255) DEFAULT NULL,
  `ev_ebitda_source` bigint(20) DEFAULT NULL,
  `revenue` bigint(20) DEFAULT NULL,
  `ebitda` bigint(20) DEFAULT NULL,
  `profit` bigint(20) DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_year` (`trading_multiple_id`,`year`),
  KEY `trading_multiple_id` (`trading_multiple_id`),
  CONSTRAINT `trading_multiples_values_ibfk_1` FOREIGN KEY (`trading_multiple_id`) REFERENCES `trading_multiples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2867 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_multiples`
--

DROP TABLE IF EXISTS `transaction_multiples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_multiples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL DEFAULT '0',
  `date` varchar(250) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `industry_1` varchar(250) DEFAULT NULL,
  `industry_2` varchar(250) DEFAULT NULL,
  `industry_3` varchar(250) DEFAULT NULL,
  `acquiror` varchar(250) DEFAULT NULL,
  `acquiror_bobject_id` int(11) DEFAULT NULL,
  `target` varchar(250) DEFAULT NULL,
  `target_bobject_id` int(11) DEFAULT NULL,
  `total_ev` varchar(250) DEFAULT NULL,
  `total_ev_sort` float DEFAULT NULL,
  `ev_ltm_sales` varchar(250) DEFAULT NULL,
  `ev_ltm_sales_sort` float DEFAULT NULL,
  `ev_ltm_ebidta` varchar(250) DEFAULT NULL,
  `ev_ltm_ebidta_sort` float DEFAULT NULL,
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_id` (`import_id`),
  KEY `industry_1` (`industry_1`),
  KEY `industry_2` (`industry_2`)
) ENGINE=InnoDB AUTO_INCREMENT=38208 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_multiples_imports`
--

DROP TABLE IF EXISTS `transaction_multiples_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_multiples_imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL DEFAULT '0',
  `rows` int(11) NOT NULL DEFAULT '0',
  `file` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `timecreate` datetime DEFAULT NULL,
  `timeupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_actions_log`
--

DROP TABLE IF EXISTS `user_actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_actions_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(250) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `user_agent` varchar(250) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `bobject_id` int(11) NOT NULL DEFAULT '1',
  `action` varchar(250) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_exports_log`
--

DROP TABLE IF EXISTS `user_exports_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_exports_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `bobject_id` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `form_data` text,
  `timecreate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `bobject_id` (`bobject_id`),
  CONSTRAINT `user_exports_log_ibfk_1` FOREIGN KEY (`bobject_id`) REFERENCES `business_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_linkedin_data`
--

DROP TABLE IF EXISTS `user_linkedin_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_linkedin_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `payload` text NOT NULL,
  `timecreate` int(11) DEFAULT NULL,
  `timeupdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(200) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58720 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` char(100) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `last_login` int(10) DEFAULT NULL,
  `logins` int(10) unsigned DEFAULT NULL,
  `password_recovery_code` varchar(255) DEFAULT NULL,
  `password_recovery_expire` int(11) NOT NULL DEFAULT '0',
  `date_create` int(11) DEFAULT '0',
  `status` int(10) DEFAULT '1',
  `is_editorial` tinyint(4) NOT NULL DEFAULT '0',
  `timecreate` timestamp NULL DEFAULT NULL,
  `timeupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `autologin_code` varchar(255) DEFAULT '',
  `notification_group_1` int(1) NOT NULL DEFAULT '1',
  `notification_group_2` int(1) NOT NULL DEFAULT '2',
  `notification_group_3` int(1) NOT NULL DEFAULT '3',
  `notification_group_4` int(1) NOT NULL DEFAULT '3',
  `notification_group_5` int(1) NOT NULL DEFAULT '6',
  `notification_group_6` int(1) NOT NULL DEFAULT '1',
  `messages_hash` varchar(150) DEFAULT NULL,
  `wizzard_complete` int(11) NOT NULL DEFAULT '0',
  `lastvisit_newsfeed_messages` int(11) NOT NULL DEFAULT '0',
  `lastvisit_newsfeed_todos` int(11) NOT NULL DEFAULT '0',
  `email_2` varchar(255) NOT NULL DEFAULT '',
  `register_confirmation_code` varchar(255) DEFAULT NULL,
  `register_confirmation_expire` int(11) DEFAULT NULL,
  `linkedin_id` varchar(255) DEFAULT NULL,
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  `segment_identified` tinyint(4) DEFAULT '0',
  `sendgrid_recipient_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_editorial` (`is_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=194224 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=43538 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=9112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_name` (`post_name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=3401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-24 10:08:45
