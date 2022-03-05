create database ecole;

CREATE TABLE promotion
(
    id char(25) PRIMARY KEY,
    nom char(50)
);

insert into promotion (id, nom) VALUES ('p10','p10'),('p11','p11');

CREATE TABLE etudiant
(
    id char(25) PRIMARY KEY,
    nom char(100),
    prenom char(100),
    sexe char(20),
    datenaissance date,
    idpromotion char(25),
    FOREIGN KEY (idpromotion) REFERENCES promotion(id)

);

insert into etudiant(id, nom, prenom, sexe, datenaissance, idpromotion) VALUES 
('etudiant1','Jean','Michel','M','1990-09-23','p10'),
('etudiant2','Bob','Louche','M','1993-02-11','p10'),
('etudiant3','Clara','Mell','F','1999-05-04','p10'),
('etudiant4','Adam','Max','M','2000-03-05','p11'),
('etudiant5','Lisa','Rise','F','1992-11-12','p11');


CREATE TABLE classe
(
    id char(25) PRIMARY KEY,
    nom char(50)

);

insert into classe(id,nom) VALUES 
('TD','TD'),
('TC','TC'),
('TL','TL'),
('1ere','1ere');


CREATE TABLE classeetudiant
(
    id char(25) PRIMARY KEY,
    idetudiant char(25),
    idclasse char(25),
    annee char(25),
    FOREIGN KEY (idetudiant) REFERENCES etudiant(id),
    FOREIGN KEY (idclasse) REFERENCES classe(id)
);
--annee:'2020-2021'
insert into classeetudiant(id, idetudiant, idclasse, annee) VALUES 
('1','etudiant1','TD','2021-2022'),
('2','etudiant2','TC','2021-2022'),
('3','etudiant3','TL','2021-2022'),
('4','etudiant4','1ere','2021-2022'),
('5','etudiant5','1ere','2021-2022');

CREATE TABLE ecolage
(
    id char(25) PRIMARY KEY,
    valeur numeric(12,3),
    idclasse char(25),
    FOREIGN KEY (idclasse) REFERENCES classe(id)
);

insert into ecolage(id, valeur, idclasse) VALUES 
('ecolageTD',20000,'TD'),
('ecolageTC',20000,'TC'),
('ecolageTL',20000,'TL'),
('ecolage1ere',15000,'1ere');


CREATE TABLE payement
(
    id char(25) PRIMARY KEY,
    valeur numeric(12,3),
    idetudiant char(25),
    idecolage char(25),
    mois char(15),
    annee char(4),
    datepayement date,
    remarque text,
    FOREIGN KEY (idetudiant) REFERENCES etudiant(id),
    FOREIGN KEY (idecolage) REFERENCES ecolage(id)
);

insert into payement(id, valeur, idetudiant, idecolage, mois, annee, datepayement, remarque) VALUES 
('payement1','10000','etudiant1','ecolageTD','février','2022','2022-02-22',''),
('payement2','20000','etudiant2','ecolageTC','février','2022','2022-02-22',''),
('payement3','20000','etudiant3','ecolageTL','février','2022','2022-02-22',''),
('payement4','10000','etudiant4','ecolage1ere','février','2022','2022-02-22',''),
('payement5','15000','etudiant5','ecolage1ere','février','2022','2022-02-22','');





