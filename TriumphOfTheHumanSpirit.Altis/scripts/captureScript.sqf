//This script controls the killing and scripted events of the players capture

hunter doTarget p1;

hunter fire currentWeapon hunter;
p1 setDamage 0.5;
p1 setUnconscious true;
sleep 3;

hunter doTarget p1;
hunter fire currentWeapon hunter;
p2 setDamage 0.5;
p2 setUnconscious true;

hunter doMove getPos p1;
sleep 8;
hunter playMoveNow "Acts_Ambient_Relax_4";

sleep 4;
cutText["","BLACK OUT", 3];
sleep 6;

playSound "legion";
skipTime 10;

p1 setUnconscious false;
p2 setUnconscious false;

//Remove maps
p1 unassignItem "ItemMap";
p1 removeItem "ItemMap";
p1 unassignItem "ItemMap";
p2 removeItem "ItemMap";

//Make hunter sit in chair
hunter setPos getPos hunterPos;
[hunter,"SIT_U1", "ASIS",chair_0] call BIS_fnc_ambientAnim;

//Unlock player anims
p1 switchMove "AidlPpneMstpSnonWnonDnon_AI";
p2 switchMove "AidlPpneMstpSnonWnonDnon_AI";

//Move players
p1 setPos getPos slumPos_0;
p2 setPos getPos slumPos_1;
cutText["10 hours later...", "BLACK IN", 5];
