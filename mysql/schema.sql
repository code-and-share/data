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
  `object_id` INT NOT NULL
);

CREATE TABLE `paths` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255),
  `phase_order` INT,
  `phase_id` INT
);


ALTER TABLE `phases` ADD FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`);
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

/* TODO one line per phase, array of object ids instead */
INSERT INTO phases (name, object_id) VALUES ('test_001', (SELECT id FROM objects WHERE name = 'forest001'));
INSERT INTO phases (name, object_id) VALUES ('test_001', (SELECT id FROM objects WHERE name = 'mountain001'));
INSERT INTO phases (name, object_id) VALUES ('test_001', (SELECT id FROM objects WHERE name = 'rain001'));
INSERT INTO phases (name, object_id) VALUES ('test_001', (SELECT id FROM objects WHERE name = 'beach001'));
INSERT INTO phases (name, object_id) VALUES ('test_002', (SELECT id FROM objects WHERE name = 'forest002'));
INSERT INTO phases (name, object_id) VALUES ('test_002', (SELECT id FROM objects WHERE name = 'mountain002'));
INSERT INTO phases (name, object_id) VALUES ('test_002', (SELECT id FROM objects WHERE name = 'rain002'));
INSERT INTO phases (name, object_id) VALUES ('test_002', (SELECT id FROM objects WHERE name = 'beach002'));
INSERT INTO phases (name, object_id) VALUES ('test_003', (SELECT id FROM objects WHERE name = 'forest003'));
INSERT INTO phases (name, object_id) VALUES ('test_003', (SELECT id FROM objects WHERE name = 'mountain003'));
INSERT INTO phases (name, object_id) VALUES ('test_003', (SELECT id FROM objects WHERE name = 'rain003'));
INSERT INTO phases (name, object_id) VALUES ('test_003', (SELECT id FROM objects WHERE name = 'beach003'));
INSERT INTO phases (name, object_id) VALUES ('test_004', (SELECT id FROM objects WHERE name = 'forest004'));
INSERT INTO phases (name, object_id) VALUES ('test_004', (SELECT id FROM objects WHERE name = 'mountain004'));
INSERT INTO phases (name, object_id) VALUES ('test_004', (SELECT id FROM objects WHERE name = 'rain004'));
INSERT INTO phases (name, object_id) VALUES ('test_004', (SELECT id FROM objects WHERE name = 'beach004'));

INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_001', 1, (SELECT id FROM phases WHERE name = 'test_001'));
INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_001', 2, (SELECT id FROM phases WHERE name = 'test_002'));
INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_001', 3, (SELECT id FROM phases WHERE name = 'test_003'));
INSERT INTO paths (name, phase_order, phase_id) VALUES ('testpath_001', 4, (SELECT id FROM phases WHERE name = 'test_004'));
