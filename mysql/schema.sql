DROP DATABASE IF EXISTS Paths;
CREATE DATABASE Paths;

USE Paths;

CREATE TABLE `objects` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `path` varchar(255)
);

CREATE TABLE `phases` (
  `id` int PRIMARY KEY,
  `phase_name` varchar(255),
  `object_id` int NOT NULL
);

CREATE TABLE `paths` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `phase_order` int,
  `phase_id` int
);


ALTER TABLE `phases` ADD FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`);
ALTER TABLE `paths` ADD FOREIGN KEY (`phase_id`) REFERENCES `phases` (`id`);
