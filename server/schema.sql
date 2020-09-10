CREATE DATABASE chat;

USE chat;

-- CREATE TABLE messages (
--   /* Describe your table here.*/

-- );

/* Create other tables and define schemas for them here! */

-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Users'
-- table 1''s comment
-- ---

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` INTEGER UNIQUE AUTO_INCREMENT,
  `Name` MEDIUMTEXT NULL DEFAULT NULL,
  `friends` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'table 1''s comment';

-- ---
-- Table 'Rooms'
-- table b has no comment
-- ---

DROP TABLE IF EXISTS `Rooms`;

CREATE TABLE `Rooms` (
  `id` INTEGER UNIQUE AUTO_INCREMENT,
  `roomName` MEDIUMTEXT NULL COMMENT 'test',
  PRIMARY KEY (`id`)
) COMMENT 'table b has no comment';

-- ---
-- Table 'Messages'
--
-- ---

DROP TABLE IF EXISTS `Messages`;

CREATE TABLE `Messages` (
  `id` INTEGER UNIQUE AUTO_INCREMENT,
  `message_text` MEDIUMTEXT NULL DEFAULT NULL,
  `user_id` INTEGER NULL DEFAULT NULL,
  `room_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'user-friend_link'
--
-- ---

DROP TABLE IF EXISTS `user-friend_link`;

CREATE TABLE `user-friend_link` (
  `id` INTEGER UNIQUE AUTO_INCREMENT,
  `user_id` INTEGER NULL DEFAULT NULL,
  `friend_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Messages` ADD FOREIGN KEY (user_id) REFERENCES `Users` (`id`);
ALTER TABLE `Messages` ADD FOREIGN KEY (room_id) REFERENCES `Rooms` (`id`);
ALTER TABLE `user-friend_link` ADD FOREIGN KEY (user_id) REFERENCES `Users` (`id`);
ALTER TABLE `user-friend_link` ADD FOREIGN KEY (friend_id) REFERENCES `Users` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user-friend_link` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Users` (`id`,`Name`,`friends`) VALUES
-- ('','','');
-- INSERT INTO `Rooms` (`id`,`roomName`) VALUES
-- ('','');
-- INSERT INTO `Messages` (`id`,`message_text`,`user_id`,`room_id`) VALUES
-- ('','','','');
-- INSERT INTO `user-friend_link` (`id`,`user_id`,`friend_id`) VALUES
-- ('','','');


/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

