-- SUPPRESSION BDD SI EXISTANTE
DROP DATABASE IF EXISTS moscatelli2;

-- CREATION BDD SI INEXISTANTE
CREATE DATABASE  IF NOT EXISTS moscatelli2 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- CONNEXION A LA BDD
USE moscatelli2;

-- CREATION TABLES
CREATE TABLE outils (

    id 							BIGINT              PRIMARY KEY AUTO_INCREMENT,
    designation 				VARCHAR(100) 		NOT NULL,
    fournisseur 				VARCHAR(100),	
    marque 						VARCHAR(100) 		NOT NULL,
    modele 					    VARCHAR(100),
    numero_de_serie 			VARCHAR(100)  		UNIQUE,
    capacite                    VARCHAR(30),
    puissance 					VARCHAR(30),		
    repere 					    VARCHAR(30),
    etat 						TEXT,
    statut 					    ENUM("Fonction", "Rebut", "Manquant", "Maintenance","Étalonnage")   NOT NULL,
    periodicite 				VARCHAR(30),
    utilisateur_creation	    VARCHAR(255)	   NOT NULL DEFAULT 'root',
	date_creation		        DATETIME		   NOT NULL DEFAULT CURRENT_TIMESTAMP,
	utilisateur_maj		        VARCHAR(255)	   NOT NULL DEFAULT 'root',
	date_maj			        DATETIME		   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(designation),
	INDEX(marque),
	INDEX(modele),
	INDEX(numero_de_serie),
    INDEX(statut),
    INDEX(designation, marque, modele)
);

CREATE TABLE utilisateurs(
    
    id 		    BIGINT PRIMARY KEY AUTO_INCREMENT,
    nom		    VARCHAR(100)	NOT NULL,
    prenom		VARCHAR(100)	NOT NULL,
    email      	VARCHAR(100)	NOT NULL UNIQUE,
    mdp 		VARCHAR(100),	
    telephone 	VARCHAR(20),	
    niveau 		ENUM ("Administrateur","Magasinier","Visiteur")			NOT NULL DEFAULT 'Visiteur',
    utilisateur_creation	VARCHAR(255)	NOT NULL DEFAULT 'root',
	date_creation		DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	utilisateur_maj		VARCHAR(255)	NOT NULL DEFAULT 'root',
	date_maj			DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(nom),
	INDEX(prenom),
	INDEX(email),
	INDEX(niveau),
    INDEX(nom, prenom)
	
);

CREATE TABLE entrees_sorties(
    id 		            BIGINT PRIMARY KEY AUTO_INCREMENT,
    id_utilisateur		BIGINT NOT NULL,
    id_outil			BIGINT NOT NULL,
    date_sortie			datetime NOT NULL,
    date_retour_prevue	datetime NOT NULL,
    date_retour         datetime,
    probleme 			TEXT,
    referencePv			VARCHAR(255),
    utilisateur_creation	VARCHAR(255)	NOT NULL DEFAULT 'root',
	date_creation		DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	utilisateur_maj		VARCHAR(255)	NOT NULL DEFAULT 'root',
	date_maj			DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(id_utilisateur),
    INDEX(id_outil),
    INDEX(date_sortie),
    INDEX(date_retour_prevue),
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id) ON DELETE RESTRICT,
	FOREIGN KEY (id_outil) REFERENCES outils(id) ON DELETE RESTRICT

);
INSERT INTO utilisateurs (
	 nom, prenom, email, mdp, telephone, niveau, utilisateur_creation, date_creation, utilisateur_maj, date_maj) VALUES ( 'Dupont', 'Marc', 'dupont@gmail.com', '********', '06 42 56 60 65', 'Administrateur', 'root', '2021-11-26 15:51', 'root', '2021-11-26 15:51' );
	
