//Script written by Spicher on 9/9/19
//This script handles the setting up of various campsites

//Params
_arg = (_this select 3);

//This function will spawn objects around the campfire
campSpawner = {
    params ["_campFire"];

  //Create the tents and logics
  tent_0 = "Land_TentDome_F" createVehicle getPos _campFire;
  tent_2 = "Land_TentDome_F" createVehicle getPos _campFire;
  tentLogicOut = "Land_Sleeping_bag_blue_folded_F" createVehicle getPos _campFire;
  tent2LogicOut = "Land_Sleeping_bag_folded_F" createVehicle getPos _campFire;

  //Move and rotate tent_0 and tentLogicIn
  tent_0 attachTo[_campFire,[-4,0,.3]];
  tent_0 setDir 180;
  tentLogicOut attachTo [tent_0,[-2,.4,-.4]];
  tentLogicOut setDir -90;

  //Move tent_2 and tent2LogicOut
  tent_2 attachTo[_campFire,[4,0,.3]];
  tent2LogicOut attachTo [tent_2,[-2,-.4,-.4]];
  tent2LogicOut setDir -90;

  //Add interactivity for the tents
  tent_0 addAction["Enter Tent", "scripts\tentScript.sqf", 1, 1.5, false, true];
  tent_2 addAction["Enter Tent", "scripts\tentScript.sqf", 3, 1.5, false, true];
};//End campSpawner


//This function will be responsible for dissassembling the campsites
campDelete= {
  params ["_campsite", "_campNum",  "_tent1", "_tent2", "_logic1", "_logic2"];
  //Delete all camp objects
  deleteVehicle _tent1;
  deleteVehicle _tent2;
  deleteVehicle _logic1;
  deleteVehicle _logic2;
  tentSet = false;
  removeAllActions _campsite;
  _campsite addAction["Set up Campsite", "scripts\campSetup.sqf", _campNum, 1.5, false, false];
  ["taskSucceeded",["","The campsite has been packed up"]] call BIS_fnc_showNotification;
};//End campDelete



//Switch to control with campsite to setup
switch (_arg) do
{
  //If at campsite 1
  case 1:
  {
    //Check to see if a camp is already set up
    if (!tentSet) then
    {
      [fire_1] spawn campSpawner;
      ["taskSucceeded",["","Camp setup"]] call BIS_fnc_showNotification;
      tentSet = true;
      removeAllActions fire_1;
      fire_1 addAction["Pack up campsite", {[fire_1, 1, tent_0, tent_2, tentLogicOut, tent2LogicOut] spawn campDelete;}, nil, 1.5, false, true];
    } else //Display an error message saying tents have already been set up
    {
      ["taskFailed",["","Camp is already set up elsewhere"]] call BIS_fnc_showNotification;
    };
  };//End case 1

//If at campsite 2
  case 2:
  {
    if (!tentSet) then
    {
      [fire_2] spawn campSpawner;
      ["taskSucceeded",["","Camp setup"]] call BIS_fnc_showNotification;
      tentSet = true;
      removeAllActions fire_2;
      fire_2 addAction["Pack up campsite", {[fire_2, 2, tent_0, tent_2, tentLogicOut, tent2LogicOut] spawn campDelete;}, nil, 1.5, false, true];
    } else //Display an error message saying tents have already been set up
    {
      ["taskFailed",["","Camp is already set up elsewhere"]] call BIS_fnc_showNotification;
    };
  };//End case 2

//If at campsite 3
  case 3:
  {
    if (!tentSet) then
    {
      [fire_3] spawn campSpawner;
      ["taskSucceeded",["","Camp setup"]] call BIS_fnc_showNotification;
      tentSet = true;
      removeAllActions fire_3;
      fire_3 addAction["Pack up campsite", {[fire_3, 3, tent_0, tent_2, tentLogicOut, tent2LogicOut] spawn campDelete;}, nil, 1.5, false, true];
    } else //Display an error message saying tents have already been set up
    {
      ["taskFailed",["","Camp is already set up elsewhere"]] call BIS_fnc_showNotification;
    };
  };//End case 3

//If at campsite 4
  case 4:
  {
    if (!tentSet) then
    {
      [fire_4] spawn campSpawner;
      ["taskSucceeded",["","Camp setup"]] call BIS_fnc_showNotification;
      tentSet = true;
      removeAllActions fire_4;
      fire_4 addAction["Pack up campsite", {[fire_4, 4, tent_0, tent_2, tentLogicOut, tent2LogicOut] spawn campDelete;}, nil, 1.5, false, true];
    } else //Display an error message saying tents have already been set up
    {
      ["taskFailed",["","Camp is already set up elsewhere"]] call BIS_fnc_showNotification;
    };
  };//End case 3

}; //End switch
