#Liam
CREATE DATABASE superdb;
#DROP DATABASE superdb;
use superdb;

CREATE TABLE team_table(
team_id SERIAL,
team_name varchar(255),
objective varchar (255),
PRIMARY KEY (team_id)
);

CREATE TABLE product(
product_id SERIAL,
product_name varchar(255),
colour varchar(255),
standard_cost decimal (8,2),
list_price decimal (8,2),
date_first_available date
);

CREATE TABLE superheroes(
hero_id SERIAL,
hero_name varchar(255),
alias varchar (255),
main_power varchar(255),
team_id BIGINT UNSIGNED,
favourite_product BIGINT UNSIGNED,
PRIMARY KEY (hero_id),
FOREIGN KEY (team_id) REFERENCES team_table (team_id),
FOREIGN KEY (favourite_product) REFERENCES product (product_id)
);

INSERT INTO product (product_name, colour, standard_cost, list_price, date_first_available) VALUES
('Star Widget', 'Yellow', 5.00, 10.00, '2023-01-01'),
('Star Widget', 'Blue', 5.50, 11.00, '2023-01-02'),
('Rocket Widget', 'Silver', 15.00, 25.00, '2023-02-01'),
('Rocket Widget', 'Black', 15.50, 26.00, '2023-02-02'),
('Flying Widget', 'Green', 10.00, 20.00, '2023-03-01'),
('Flying Widget', 'Purple', 10.50, 21.00, '2023-03-02'),
('Spinning Widget', 'Pink', 7.00, 15.00, '2023-04-01'),
('Spinning Widget', 'Turquoise', 7.50, 16.00, '2023-04-02'),
('Rainbow Widget', 'Multicolor', 12.00, 22.00, '2023-05-01'),
('Rainbow Widget', 'Pastel', 12.50, 23.00, '2023-05-02'),
('Flying Unicorn', 'White', 25.00, 40.00, '2023-06-01'),
('Flying Unicorn', 'Pink', 25.50, 41.00, '2023-06-02'),
('Rainbow Unicorn', 'Rainbow', 30.00, 50.00, '2023-07-01'),
('Rainbow Unicorn', 'Sparkle', 30.50, 51.00, '2023-07-02'),
('Golden Unicorn', 'Gold', 40.00, 70.00, '2023-08-01'),
('Golden Unicorn', 'Shiny Gold', 40.50, 71.00, '2023-08-02');

INSERT INTO team_table (team_name, objective) VALUES 
('JLA', 'protect the world'),
('JSA', 'defeat the nazis'),
('birds of prey', 'fight crime (without men)'),
('task force x', 'follow Wallers orders or die'),
('teen titans', 'teach young superheroes to be their best');

INSERT INTO superheroes (hero_name, alias, main_power, team_id, favourite_product) VALUES
('bruce wayne', 'batman', 'martial arts', 1, 1),
('clark kent', 'superman', 'flight', 1, 2),
('jay garrick', 'the flash', 'super-speed', 2, 4),
('alan scott', 'green lantern', 'ring creation', 2, 5),
('helena bertenelli', 'the huntress', 'crossbow archery', 3, 3),
('dr. harleen quinzel', 'harley quinn', 'hammer-fighting', 3, 5),
('floyd lawton', 'deadshot', 'marksmanship', 4, 9),
('cecil adams', 'count vertigo', 'induce dizziness', 4, 11),
('damien wayne', 'robin', 'swordsmanship', 5, 11),
('dick grayson', 'nightwing', 'acrobatics', 5, 15);


SELECT t.team_name, h.hero_name, p.product_name AS favourite_product
FROM superheroes h 
JOIN team_table t ON h.team_id = t.team_id 
JOIN product p ON h.favourite_product = p.product_id; 

