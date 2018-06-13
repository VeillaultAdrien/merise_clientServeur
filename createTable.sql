////Génération des tables et remplissages////

CREATE TABLE personnes(
idPersonne NUMBER GENERATED ALWAYS AS IDENTITY, 
nom VARCHAR2(30) NOT NULL,
prenom VARCHAR2(30) NOT NULL,
sexe NUMBER(1) NOT NULL,
dateNaissance DATE NOT NULL);

ALTER TABLE personnes
ADD PRIMARY KEY (idPersonne);

CREATE TABLE lienParente(
idParent Number,
idEnfant Number,
adoption NUMBER(1) NOT NULL,
dateAdoption DATE);

ALTER TABLE lienParente
ADD PRIMARY KEY (idParent,idEnfant);

ALTER TABLE lienParente
ADD CONSTRAINT idParent FOREIGN KEY (idParent) REFERENCES personnes(idPersonne);

ALTER TABLE lienParente
ADD CONSTRAINT idEnfant FOREIGN KEY (idEnfant) REFERENCES personnes(idPersonne);

INSERT INTO personnes (nom, prenom, sexe, dateNaissance) 
VALUES('Potter','Harry',0, to_date('24/05/1985', 'dd/mm/yyyy'));

INSERT INTO personnes (nom, prenom, sexe, dateNaissance) 
VALUES('Granger','Hermione',1, to_date('02/11/1956', 'dd/mm/yyyy'));

INSERT INTO personnes (nom, prenom, sexe, dateNaissance) 
VALUES('Weasley','Ronald',0, to_date('18/09/1854', 'dd/mm/yyyy'));

INSERT INTO personnes (nom, prenom, sexe, dateNaissance) 
VALUES('Black','Sirius',0, to_date('25/10/1947', 'dd/mm/yyyy'));

INSERT INTO personnes (nom, prenom, sexe, dateNaissance) 
VALUES('Dumbledore','Albus',0, to_date('30/05/1962', 'dd/mm/yyyy'));

INSERT INTO personnes (nom, prenom, sexe, dateNaissance) 
VALUES('Lovegood','Luna',1, to_date('21/08/1999', 'dd/mm/yyyy'));

INSERT INTO personnes (nom, prenom, sexe, dateNaissance) 
VALUES('Rogue','Severus',0, to_date('19/02/1974', 'dd/mm/yyyy'));

INSERT INTO personnes (nom, prenom, sexe, dateNaissance) 
VALUES('Mimi','Geignarde',1, to_date('19/02/2000', 'dd/mm/yyyy'));


INSERT INTO lienParente (idParent, idEnfant, adoption, dateAdoption)
VALUES ((Select idPersonne FROM personnes p WHERE p.nom='Black'), (Select idPersonne FROM personnes p WHERE p.nom='Potter'), 1,  to_date('16/09/1989', 'dd/mm/yyyy'));

INSERT INTO lienParente (idParent, idEnfant, adoption, dateAdoption)
VALUES ((Select idPersonne FROM personnes p WHERE p.nom='Lovegood'), (Select idPersonne FROM personnes p WHERE p.nom='Potter'), 1,  to_date('16/09/1989', 'dd/mm/yyyy'));

INSERT INTO lienParente (idParent, idEnfant, adoption, dateAdoption)
VALUES ((Select idPersonne FROM personnes p WHERE p.nom='Granger'), (Select idPersonne FROM personnes p WHERE p.nom='Lovegood'), 0, NULL);

INSERT INTO lienParente (idParent, idEnfant, adoption, dateAdoption)
VALUES ((Select idPersonne FROM personnes p WHERE p.nom='Rogue'), (Select idPersonne FROM personnes p WHERE p.nom='Lovegood'), 0, NULL);

INSERT INTO lienParente (idParent, idEnfant, adoption, dateAdoption)
VALUES ((Select idPersonne FROM personnes p WHERE p.nom='Weasley'), (Select idPersonne FROM personnes p WHERE p.nom='Black'), 1, to_date('16/09/1981', 'dd/mm/yyyy'));

INSERT INTO lienParente (idParent, idEnfant, adoption, dateAdoption)
VALUES ((Select idPersonne FROM personnes p WHERE p.nom='Black'), (Select idPersonne FROM personnes p WHERE p.nom='Mimi'), 1, to_date('16/09/2002', 'dd/mm/yyyy'));

INSERT INTO lienParente (idParent, idEnfant, adoption, dateAdoption)
VALUES ((Select idPersonne FROM personnes p WHERE p.nom='Lovegood'), (Select idPersonne FROM personnes p WHERE p.nom='Mimi'), 1,  to_date('16/09/2002', 'dd/mm/yyyy'));


