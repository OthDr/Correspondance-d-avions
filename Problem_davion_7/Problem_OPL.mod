/*********************************************
 * OPL 12.6.0.0 Model
 * Author: Haythem_AR0673349861
 * Creation Date: Apr 13, 2022 at 2:30:59 AM
 *********************************************/
//lire dans un fichier le nb d'objet et minimiser le nombre de passagers changeant d’avion à Roissy
int nbObjet = ...; //déclarer le nombre des Avion
range objets_i = 1..nbObjet;  //déclarer le nombre de passagers en transfert entre i et j 
range objet_j = 1..nbObjet;  //déclarer le nombre de passagers en transfert entre j et i 
//déclarer des tableaux de données indexés sur les objets, 
//ils seront remplis en lisant le fichier de données
int p[objets_i][objet_j] = ...; 
dvar boolean x[objets_i][objet_j]; // Déclarer les variables de décisions
// function objectif
minimize sum(i in objets_i) sum(j in objet_j)p[i][j] * x[i][j]; 
// contraintes
subject to {
 SUPPLYCONS:
 forall(i in objets_i) 
 forall(j in objets_i)
 sum(i in objets_i)x[i][j]== 1;
 DEMANDCONS:
 forall(i in objets_i)
 forall(j in objet_j)
   sum(j in objet_j)x[i][j] == 1;
 
 }
