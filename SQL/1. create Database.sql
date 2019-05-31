
CREATE TABLE adresse (
                id INT AUTO_INCREMENT NOT NULL,
                type_rue VARCHAR(100),
                nom_rue VARCHAR(100),
                numero VARCHAR(10) NOT NULL,
                code_postal VARCHAR(20) NOT NULL,
                ville VARCHAR(100) NOT NULL,
                pays VARCHAR(50) DEFAULT 'FRANCE' NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE restaurant (
                id SMALLINT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) DEFAULT 'OC Pizza' NOT NULL,
                id_adresse INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE pizza (
                id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(255) NOT NULL,
                disponible BOOLEAN NOT NULL,
                prixHT DOUBLE PRECISION NOT NULL,
                menu INT,
                PRIMARY KEY (id)
);


CREATE TABLE menu (
                id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(255) NOT NULL,
                id_pizza INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE ingredient (
                id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(255) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE stock (
                id_restaurant SMALLINT NOT NULL,
                id_ingredient INT NOT NULL,
                quantite INT,
                PRIMARY KEY (id_restaurant, id_ingredient)
);


CREATE TABLE composition (
                id_pizza INT AUTO_INCREMENT NOT NULL,
                id_ingredient INT NOT NULL,
                PRIMARY KEY (id_pizza, id_ingredient)
);

create table recette
(
	id_pizza int auto_increment,
	recette text null,
	constraint recette_pk
		primary key (id_pizza)
);


CREATE TABLE client (
                id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(255) NOT NULL,
                prenom VARCHAR(255) NOT NULL,
                id_adresse INT NOT NULL,
                mail VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE commande (
                id INT AUTO_INCREMENT NOT NULL,
                is_payed BOOLEAN DEFAULT FALSE NOT NULL,
                etat SMALLINT,
                PRIMARY KEY (id)
);


CREATE TABLE personnel (
                id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(255) NOT NULL,
                prenom VARCHAR(255) NOT NULL,
                mail VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL,
                role SMALLINT DEFAULT 0 NOT NULL,
                id_restaurant SMALLINT DEFAULT 0 NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE livraison (
                id INT AUTO_INCREMENT NOT NULL,
                id_commande INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE paiement (
                id INT AUTO_INCREMENT NOT NULL,
                date DATE NOT NULL,
                id_commande INT NOT NULL,
                PRIMARY KEY (id)
);

create table etat
(
	id int auto_increment,
	etat varchar(20) null,
	constraint table_name_pk
	primary key (id)
);

ALTER TABLE client ADD CONSTRAINT adresse_client_fk
FOREIGN KEY (id_adresse)
REFERENCES adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE restaurant ADD CONSTRAINT adresse_restaurant_fk
FOREIGN KEY (id_adresse)
REFERENCES adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE personnel ADD CONSTRAINT restaurant_personnel_fk
FOREIGN KEY (id_restaurant)
REFERENCES restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock ADD CONSTRAINT restaurant_stock_fk
FOREIGN KEY (id_restaurant)
REFERENCES restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE recette ADD CONSTRAINT pizza_recette_fk
FOREIGN KEY (id_pizza)
REFERENCES pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE menu ADD CONSTRAINT pizza_menu_fk
FOREIGN KEY (id_pizza)
REFERENCES pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE client ADD CONSTRAINT menu_client_fk
FOREIGN KEY (id)
REFERENCES menu (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (id_ingredient)
REFERENCES ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (id)
REFERENCES client (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE paiement ADD CONSTRAINT commande_paiement_fk
FOREIGN KEY (id_commande)
REFERENCES commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE livraison ADD CONSTRAINT commande_livraison_fk
FOREIGN KEY (id_commande)
REFERENCES commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE personnel ADD CONSTRAINT commande_personnel_fk
FOREIGN KEY (id)
REFERENCES commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
