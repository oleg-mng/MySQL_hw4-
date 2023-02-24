CREATE DATABASE IF NOT EXISTS hw4;

USE hw4;

CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
        
-- Используя JOIN-ы, выполните следующие операции:
-- 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)

SELECT name, shops_id
FROM cats AS ca
JOIN shops AS sh
ON sh.id = ca.shops_id;

-- 2. Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)

SELECT sh.shopname
FROM shops AS sh
JOIN cats AS ca
ON sh.id = ca.shops_id AND ca.name= 'Murzik';

SELECT sh.shopname, ca.shops_id, ca.name
FROM cats AS ca
JOIN shops AS sh
ON sh.id = ca.shops_id
WHERE ca.name= 'Murzik';

-- 3 Вывести магазины, в котором НЕ продаются коты “Мурзик” и “Zuza”

SELECT sh.id, sh.shopname, ca.shops_id, ca.name, ca.id
FROM shops AS sh
JOIN cats AS ca
ON ca.shops_id = sh.id 
WHERE not ca.name = 'Murzik' and not ca.name = 'Zuza';

SELECT sh.id, sh.shopname, ca.shops_id
FROM shops AS sh
JOIN cats AS ca
ON ca.shops_id = sh.id AND (ca.name != 'Murzik' AND  ca.name != 'Zuza')
ORDER BY sh.id;

