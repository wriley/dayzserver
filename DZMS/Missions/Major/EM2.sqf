/*
	Devil's Castle base custom loot mission
	based on: Medical C-130 Crash by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Modified to new format by Vampire
*/

private ["_missName","_coords","_wreck","_trash","_trash1","_trash2","_trash3","_trash4","_trash5","_veh1","_veh2","_vehicle","_vehicle1","_crate","_crate1"];

//Name of the Mission
_missName = "Bandit supplies";

// Devil's Castle
_coords = [6883.00,11414.6,0];

[nil,nil,rTitleText,"The bandit base at Devil's Castle has received a large shipment!\nSee if you can get into this heavily guarded location!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
_crate = createVehicle ["TKSpecialWeapons_EP1",[6896.272, 11408.117,0],[], 0, "CAN_COLLIDE"];
_crate setDir -103.4057;
[_crate,"supplyL"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

_crate1 = createVehicle ["TKOrdnanceBox_EP1",[6897.0894, 11405.865,0],[], 0, "CAN_COLLIDE"];
_crate1 setDir 32.75177;
[_crate1,"supplyL"] ExecVM DZMSBoxSetup;
[_crate1] call DZMSProtectObj;

_crate2 = createVehicle ["TKBasicWeapons_EP1",[6898.5103, 11401.389,0],[], 0, "CAN_COLLIDE"];
_crate2 setDir -14.947231;
[_crate2,"money"] ExecVM DZMSBoxSetup;
[_crate2] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) - 5.0,(_coords select 1) + 2.0,0],2,4,"DZMSUnitsMajor"] call DZMSAISpawn;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The supplies at Devil's Castle have been secured by survivors!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: Major EM2 Devil's Castle has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;