/*********************************************
 * OPL 12.6.0.0 Model
 * Author: Haythem_AR0673349861
 * Creation Date: Apr 11, 2022 at 10:16:05 AM
 *********************************************/
 // INDEX
{int}branch={1,2,3,4,5,6};
{int}werehouses={1,2,3,4,5,6};
// DATA
int demand[werehouses]=[35,8,11,30,10,7];
int supply[branch]=[108,80,63,108,67,81];
int tcost[branch][werehouses]=[[35,12,16,38,5,2],[25,8,9,24,6,8],[12,8,11,27,3,2],[38,15,14,30,2,9],[10,9,8,25,10,5],[19,15,20,14,6,7]];
// Desision Varibales
 dvar float+ amonAvion[branch][werehouses];
 // OBJ.f
 dexpr float avion =sum(i in branch,j in werehouses)amonAvion[i][j]*tcost[i][j];
 // Model
 minimize avion; 
 subject to {
 SUPPLYCONS:
 forall(i in werehouses) 
 sum(j in branch)amonAvion[i][j]== supply[i];
 DEMANDCONS:
 forall(j in branch)
   sum(i in werehouses)amonAvion[i][j]==demand[j];
 
 }