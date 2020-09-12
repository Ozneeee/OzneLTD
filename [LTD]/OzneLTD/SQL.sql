INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_ltd', 'LTD', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_ltd', 'LTD', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('ltd', 'LTD')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('ltd',0,'recruit','Stagiaire',20,'{}','{}'),
	('ltd',1,'fou','Employé Nord',40,'{}','{}'),
	('ltd',2,'experienced','Employé Sud',40,'{}','{}'),
	('ltd',3,'boss','Patron LTD',80,'{}','{}');


