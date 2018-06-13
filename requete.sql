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
	WHERE p.idPersonne = l.idParent AND p.prenom='Sirius');

//4
SELECT DISTINCT p.nom, p.prenom, (SELECT p.nom FROM personnes p WHERE l.idParent =p.idPersonne) "Nom du pere"
FROM personnes p, lienParente l
WHERE p.idPersonne = l.idEnfant AND
	l.idParent IN (SELECT p.idPersonne
	FROM personnes p, lienParente l
	WHERE p.idPersonne = l.idParent AND p.prenom='Sirius');

//5
SELECT DISTINCT p.idPersonne, p.nom, p.prenom
FROM personnes p, lienParente l
WHERE (l.idParent=p.idPersonne AND l.adoption=0  AND (SELECT COUNT(1)
				   		   FROM personnes p, lienParente l
				    	           WHERE l.idEnfant=p.idPersonne AND p.sexe=1)=0)
	OR (p.idPersonne Not In (SELECT l.idParent
				FROM lienparente l));

//6
SELECT per.idPersonne, per.nom, per.prenom, (SELECT p.prenom FROM personnes p WHERE l.idEnfant = p.idPersonne) "Prenom garcon",(SELECT p.dateNaissance FROM personnes p WHERE l.idEnfant = p.idPersonne) "DateNaissance garcon"
FROM personnes per, lienparente l
WHERE l.idParent=per.idPersonne AND l.idEnfant IN(SELECT li.idEnfant
					FROM personnes p, lienparente li
					WHERE li.idEnfant = p.idPersonne AND p.dateNaissance= (SELECT MIN(p.dateNaissance)
FROM personnes p, lienparente l
WHERE l.idEnfant = p.idPersonne AND l.idParent = per.idPersonne AND p.sexe=0 AND 
		(SELECT count(1)
		FROM personnes p, lienparente l
		WHERE l.idEnfant = p.idPersonne AND l.idParent = per.idPersonne AND p.sexe=1)=1)
);



//index
CREATE BITMAP INDEX adoption ON lienparente(adoption);


























