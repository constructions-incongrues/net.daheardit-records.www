-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `code` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `language` (`code`, `name`) VALUES
('en',	'English'),
('fr',	'Français');

-- 2019-03-05 17:18:04
