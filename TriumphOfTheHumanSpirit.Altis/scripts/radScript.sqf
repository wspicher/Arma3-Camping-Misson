//This script controls the radiation and death of a player if they enter the EPA clean up site

//Detect nearest player
  _nearestPeople = nearestObjects [getPos barrel1, ["Man"], 10, false];

//This function controls rad noises and deaths of the players in the cleanup zone
radKiller =
{
  params["_dPlayer"];
  _damage = 0;
  _dPlayer say3D "geiger";

  for "_i" from 1 to 8 do
  {
    _dPlayer setFatigue 1;
    _dPlayer setDamage _damage;
    _damage = _damage + 0.2;
    sleep 1;
  };

};//End function

//Loops through all the people near the barrel.
{ //If p1 enters the area
  if (_x == p1) then
  {
    [_x] spawn radKiller;
  } else
  { //If p2 enters the area
    if (_x == p2) then
    {
      [_x] spawn radKiller;
    };
  };
} forEach _nearestPeople;
