USE `Ozne1237fivem`;

CREATE TABLE `shops` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`store` varchar(100) NOT NULL,
	`item` varchar(100) NOT NULL,
	`price` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `shops` (id, store, item, price) VALUES

(1, 'TwentyFourSeven', 'bread', 18),

(2, 'TwentyFourSeven', 'water', 12),

(3, 'RobsLiquor', 'bread', 18),

(4, 'RobsLiquor', 'water', 12),

(5, 'LTDgasoline', 'bread', 18),

(6, 'LTDgasoline', 'water', 12),

;