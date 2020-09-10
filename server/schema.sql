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

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INTEGER UNIQUE AUTO_INCREMENT,
  `username` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'table 1''s comment';

-- ---
-- Table 'Rooms'
-- table b has no comment
-- ---

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` INTEGER UNIQUE AUTO_INCREMENT,
  `roomname` MEDIUMTEXT NULL COMMENT 'test',
  PRIMARY KEY (`id`)
) COMMENT 'table b has no comment';

-- ---
-- Table 'Messages'
--
-- ---

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` INTEGER UNIQUE AUTO_INCREMENT,
  `message` MEDIUMTEXT NULL DEFAULT NULL,
  `username` INTEGER NULL DEFAULT NULL,
  `roomname` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'user-friend_link'
--
-- ---

DROP TABLE IF EXISTS `user-friend_link`;

CREATE TABLE `user-friend_link` (
  `id` INTEGER UNIQUE AUTO_INCREMENT,
  `username` INTEGER NULL DEFAULT NULL,
  `friend_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `messages` ADD FOREIGN KEY (username) REFERENCES `users` (`id`);
ALTER TABLE `messages` ADD FOREIGN KEY (roomname) REFERENCES `rooms` (`id`);
ALTER TABLE `user-friend_link` ADD FOREIGN KEY (username) REFERENCES `users` (`id`);
ALTER TABLE `user-friend_link` ADD FOREIGN KEY (friend_id) REFERENCES `users` (`id`);

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

INSERT INTO `users` (`id`,`username`) VALUES
('1','Bob');
INSERT INTO `users` (`id`,`username`) VALUES
('2','Joe');
INSERT INTO `users` (`id`,`username`) VALUES
('3','Amy');
INSERT INTO `users` (`id`,`username`) VALUES
('4','Kim');
INSERT INTO `rooms` (`id`,`roomname`) VALUES
('1','general');
INSERT INTO `rooms` (`id`,`roomname`) VALUES
('2','random');
INSERT INTO `messages` (`id`,`message`,`username`,`roomname`) VALUES
('1','shout out east bay ca','1','2');
INSERT INTO `messages` (`id`,`message`,`username`,`roomname`) VALUES
('2','party like its 1994','1','2');
INSERT INTO `messages` (`id`,`message`,`username`,`roomname`) VALUES
('3','this is a girk','2','1');
INSERT INTO `messages` (`id`,`message`,`username`,`roomname`) VALUES
('4','ricky bobby shake n bake','2','1');
INSERT INTO `messages` (`id`,`message`,`username`,`roomname`) VALUES
('5','whats with the bananas','3','2');
INSERT INTO `messages` (`id`,`message`,`username`,`roomname`) VALUES
('6','wooow','3','2');
INSERT INTO `messages` (`id`,`message`,`username`,`roomname`) VALUES
('7','ayy your back','4','1');
INSERT INTO `messages` (`id`,`message`,`username`,`roomname`) VALUES
('8','BAHNAHNAHS','4','2');
INSERT INTO `user-friend_link` (`id`,`username`,`friend_id`) VALUES
('1','1','2');
INSERT INTO `user-friend_link` (`id`,`username`,`friend_id`) VALUES
('2','1','4');
INSERT INTO `user-friend_link` (`id`,`username`,`friend_id`) VALUES
('4','2','1');
INSERT INTO `user-friend_link` (`id`,`username`,`friend_id`) VALUES
('5','2','3');
INSERT INTO `user-friend_link` (`id`,`username`,`friend_id`) VALUES
('6','3','2');
INSERT INTO `user-friend_link` (`id`,`username`,`friend_id`) VALUES
('7','3','4');
INSERT INTO `user-friend_link` (`id`,`username`,`friend_id`) VALUES
('8','3','1');
INSERT INTO `user-friend_link` (`id`,`username`,`friend_id`) VALUES
('10','4','3');
INSERT INTO `user-friend_link` (`id`,`username`,`friend_id`) VALUES
('11','4','2');