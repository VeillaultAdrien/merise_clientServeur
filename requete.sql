//1
SELECT DISTINCT p.nom, p.prenom, p.sexe
FROM personnes p, lienParente l
WHERE p.idPersonne = l.idEnfant AND l.adoption = 1;

//2
SELECT DISTINCT p.nom, p.prenom, p.sexe
FROM personnes p, lienParente l
WHERE p.idPersonne = l.idEnfant AND
	l.idParent IN (SELECT p.idPersonne
	FROM personnes p, lienParente l
	WHERE p.idPersonne = l.idEnfant AND l.adoption = 1 AND l.dateAdoption > (to_date('01/01/1981','dd/mm/yyyy')));

//3
SELECT DISTINCT p.nom, p.prenom
FROM personnes p, lienParente l
WHERE p.idPersonne = l.idEnfant AND
	l.idParent IN (SELECT p.idPersonne
	FROM personnes p, lienParente l
	WHERE p.idPersonne = l.idEnfant AND p.prenom='Sirius');

//4
SELECT DISTINCT p.nom, p.prenom, (SELECT p.nom FROM personnes p WHERE l.idParent =p.idPersonne) "Nom du pere"
FROM personnes p, lienParente l
WHERE p.idPersonne = l.idEnfant AND
	l.idParent IN (SELECT p.idPersonne
	FROM personnes p, lienParente l
	WHERE p.idPersonne = l.idEnfant AND p.prenom='Sirius');

//5
