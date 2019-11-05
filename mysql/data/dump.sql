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

INSERT INTO phases (name, objects) VALUES ('test_011', '[{"position": "1", "object":"forest001"}, {"position": "2", "object":"mountain001"}, {"position": "3", "object":"rain001"}, {"position": "4", "object":"beach001"}]');
INSERT INTO phases (name, objects) VALUES ('test_012', '[{"position": "1", "object":"forest002"}, {"position": "2", "object":"mountain002"}, {"position": "3", "object":"rain002"}, {"position": "4", "object":"beach002"}]');
INSERT INTO phases (name, objects) VALUES ('test_013', '[{"position": "1", "object":"forest003"}, {"position": "2", "object":"mountain003"}, {"position": "3", "object":"rain003"}, {"position": "4", "object":"beach003"}]');
INSERT INTO phases (name, objects) VALUES ('test_014', '[{"position": "1", "object":"forest004"}, {"position": "2", "object":"mountain004"}, {"position": "3", "object":"rain004"}, {"position": "4", "object":"beach004"}]');
/* Select * from phases WHERE JSON_EXTRACT(objects, '$."1"') = "forest002"; */
/* select name, JSON_EXTRACT(objects, '$[*].object') from phases WHERE name = 'test_011'; */
/* SELECT pos, obj FROM phases, JSON_TABLE(phases.objects, '$[*]' COLUMNS(pos INT PATH '$.position', obj VARCHAR(255) PATH '$.object')) AS t1 WHERE phases.name = "test_014"; */
/* SELECT t1.pos, objects.content FROM objects, phases, JSON_TABLE(phases.objects, '$[*]' COLUMNS(pos INT PATH '$.position', obj VARCHAR(255) PATH '$.object')) AS t1 WHERE phases.name = "test_014" AND objects.name = t1.obj; */

INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_002', 1, (SELECT id FROM phases WHERE name = 'test_011'));
INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_002', 2, (SELECT id FROM phases WHERE name = 'test_012'));
INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_002', 3, (SELECT id FROM phases WHERE name = 'test_013'));
INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_002', 4, (SELECT id FROM phases WHERE name = 'test_014'));
