DROP DATABASE IF EXISTS Paths;
CREATE DATABASE Paths;

USE Paths;

CREATE TABLE `objects` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255),
  `content` VARCHAR(255)
);

CREATE TABLE `phases` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255),
  `objects` JSON NOT NULL
);

CREATE TABLE `paths` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255),
  `phase_order` INT,
  `phase_id` INT
);


ALTER TABLE `paths` ADD FOREIGN KEY (`phase_id`) REFERENCES `phases` (`id`);

INSERT INTO objects (name, content) VALUES ('forest001', 'forest001.jpg');
INSERT INTO objects (name, content) VALUES ('forest002', 'forest002.jpg');
INSERT INTO objects (name, content) VALUES ('forest003', 'forest003.jpg');
INSERT INTO objects (name, content) VALUES ('forest004', 'forest004.jpg');
INSERT INTO objects (name, content) VALUES ('mountain001', 'mountain001.jpg');
INSERT INTO objects (name, content) VALUES ('mountain002', 'mountain002.jpg');
INSERT INTO objects (name, content) VALUES ('mountain003', 'mountain003.jpg');
INSERT INTO objects (name, content) VALUES ('mountain004', 'mountain004.jpg');
INSERT INTO objects (name, content) VALUES ('rain001', 'rain001.jpg');
INSERT INTO objects (name, content) VALUES ('rain002', 'rain002.jpg');
INSERT INTO objects (name, content) VALUES ('rain003', 'rain003.jpg');
INSERT INTO objects (name, content) VALUES ('rain004', 'rain004.jpg');
INSERT INTO objects (name, content) VALUES ('beach001', 'beach001.jpg');
INSERT INTO objects (name, content) VALUES ('beach002', 'beach002.jpg');
INSERT INTO objects (name, content) VALUES ('beach003', 'beach003.jpg');
INSERT INTO objects (name, content) VALUES ('beach004', 'beach004.jpg');

INSERT INTO phases (name, objects) VALUES ('test_001', '{"1": "forest001", "2": "mountain001", "3": "rain001", "4": "beach001"}');
INSERT INTO phases (name, objects) VALUES ('test_002', '{"1": "forest002", "2": "mountain002", "3": "rain002", "4": "beach002"}');
INSERT INTO phases (name, objects) VALUES ('test_003', '{"1": "forest003", "2": "mountain003", "3": "rain003", "4": "beach003"}');
INSERT INTO phases (name, objects) VALUES ('test_004', '{"1": "forest004", "2": "mountain004", "3": "rain004", "4": "beach004"}');
INSERT INTO phases (name, objects) VALUES ('test_011', '[{"position": "1", "object":"forest001"}, {"position": "2", "object":"mountain001"}, {"position": "3", "object":"rain001"}, {"position": "4", "object":"beach001"}]');
/* Select * from phases WHERE JSON_EXTRACT(objects, '$."1"') = "forest002"; */
/* select name, JSON_EXTRACT(objects, '$[*].object') from phases WHERE name = 'test_011';

INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_001', 1, (SELECT id FROM phases WHERE name = 'test_001'));
INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_001', 2, (SELECT id FROM phases WHERE name = 'test_002'));
INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_001', 3, (SELECT id FROM phases WHERE name = 'test_003'));
INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_001', 4, (SELECT id FROM phases WHERE name = 'test_004'));
