//Script written by Spicher on 9/8/19
//Controls the entering and exiting of a tent

/* In order for this script to work, there needs to be:
4 tents named tent_0 - tent_3
tent_1 and tent_3 need to be decorated and placed on level surfaces
There also need to be logic markers tentLogicIn,tentLogicOut, tent2LogicIn, and tent2LogicOut
From there is is just configuration
*/


_arg = (_this select 3);

//Switch statement
switch (_arg) do
{
    //Entering tent 1
    case 1:
    {
      //Detect closest player
      _man = nearestObject[getPos tent_0, "Man"];
      tent_0 say3D "zipper";
      _man switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
      sleep 0.8;
      _man unassignItem "ItemMap";
      _man removeItem "ItemMap";
      _man setPos getPos tentLogicIn;
      _man setDir getDir tentLogicIn;
    };//End case 1

    //Exiting the tent
    case 2:
    {
      //Detect closest player
      _man = nearestObject[getPos tent_1, "Man"];
      tent_1 say3D "zipper2";
      _man switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
      sleep 0.8;
      _man addItem "ItemMap";
      _man assignItem "ItemMap";
      _man setPos getPos tentLogicOut;
      _man setDir getDir tentLogicOut;
    };//End case 2

    //Entering tent 2
    case 3:
    {
      //Detect closest player
      _man = nearestObject[getPos tent_2, "Man"];
      tent_2 say3D "zipper";
      _man switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
      sleep 0.8;
      _man unassignItem "ItemMap";
      _man removeItem "ItemMap";
      _man setPos getPos tent2LogicIn;
      _man setDir getDir tent2LogicIn;
    };//End case 3

    //Exiting tent 2
    case 4:
    {
      //Detect closest player
      _man = nearestObject[getPos tent_3, "Man"];
      tent_3 say3D "zipper2";
      _man switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
      sleep 0.8;
      _man addItem "ItemMap";
      _man assignItem "ItemMap";
      _man setPos getPos tent2LogicOut;
      _man setDir getDir tent2LogicOut;
    };//End case 4


};//End switch
