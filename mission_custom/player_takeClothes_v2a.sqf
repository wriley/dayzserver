// By Zabn 2014
// modified by Kerbo based on http://opendayz.net/threads/help-discussion-zabns-take-clothes.13198/page-6
private["_isEpoch","_itemNew","_onLadder","_skin","_body","_okSkin","_clothesTaken","_itemNewName","_result","_animState","_takeClothesUsageTime","_started","_finished","_takeClothesUseTime","_bag","_bmags","_bweps","_corpse","_mags","_object","_weps"];

if (!isNil "DZE_ActionInProgress") then { // check if this is dayz epoch
	if (DZE_ActionInProgress) exitWith {}; // Do not allow if any script is running.
};

_body = _this select 3;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText ["You can't perform this action while on a ladder!" , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not take clothes while in a vehicle", "PLAIN DOWN"]};

player removeAction s_player_clothes;
s_player_clothes = -1;

_skin = typeOf _body;

_itemNew = _skin;

switch (_itemNew) do {
	case "Survivor3_DZ": {
		_itemNew = "Survivor2_DZ";
	};
	case "Bandit1_DZ": {
		_itemNew = "Survivor2_DZ";
	};
};

_itemNew = "Skin_" + _itemNew;
_okSkin = isClass (configFile >> "CfgMagazines" >> _itemNew);

_takeClothesUseTime = 6;

r_interrupt = false; 
r_doLoop = true; 
_takeClothesUsageTime = time;
_animState = animationState player;
_started = false;
_finished = false;

if(_okSkin) then {
	_clothesTaken = _body getVariable["clothesTaken",false];
	if(!_clothesTaken) then {
		while {r_doLoop} do {
			private ["_isMedic"];
			
			_clothesTaken = _body getVariable["clothesTaken",false];
			_animState = animationState player;
			_isMedic = ["medic",_animState] call fnc_inString;
			if(_clothesTaken) then { 
				r_doLoop = false; 
			};
			if (_isMedic) then {
				_started = true;
			};
			if(!_isMedic && !r_interrupt && (time - _takeClothesUsageTime) < _takeClothesUseTime) then {
				player playActionNow "Medic"; 
				_isMedic = true;
			};
			if (_started && !_isMedic && (time - _takeClothesUsageTime) > _takeClothesUseTime) then {
				r_doLoop = false; 
				_finished = true;
			};
			if (r_interrupt) then {
				r_doLoop = false; 
			};
			sleep 0.1;
		};
		r_doLoop = false; 

		if(_finished) then {
			_itemNewName = getText (configFile >> "CfgMagazines" >> _itemNew >> "displayName");
			_result = [player,_itemNew] call BIS_fnc_invAdd;
			if (_result) then {
				_mags = magazines _body;
				_weps = weapons _body;
				_bag = unitBackpack _body;
				_corpse = createVehicle ["Body", position _body, [], 0, "CAN_COLLIDE"];
				_object = createVehicle ["WeaponHolder", position _corpse, [], 0, "CAN_COLLIDE"];
				_object setVariable ["permaLoot",true];
				{_object addMagazineCargoGlobal [_x, 1];} forEach _mags;
				{_object addWeaponCargoGlobal [_x, 1];} forEach _weps;
				if (!isNull _bag) then {
					_bmags = getMagazineCargo _bag;
					_bweps = getWeaponCargo _bag;
					_object addBackpackCargoGlobal [(typeOf _bag), 1];
					{_object addMagazineCargoGlobal [_x, ((_bmags select 1) select _forEachIndex)];} forEach (_bmags select 0);
					{_object addWeaponCargoGlobal [_x, ((_bweps select 1) select _forEachIndex)];} forEach (_bweps select 0);
				};
				if (!isNull _body) then {deleteVehicle _body};
				cutText [format["One %1 has been added to your inventory!",_itemNewName], "PLAIN DOWN"];
			} else {
				cutText [format["You didn't have enough room to store a %1 :(",_itemNewName], "PLAIN DOWN"];
			};
		} else {
			if(_clothesTaken) then { 
				player switchMove "";
				player playActionNow "stop";
				cutText ["This Skin has already been taken!", "PLAIN DOWN"];
			} else {
				r_interrupt = false;
				player switchMove "";
				player playActionNow "stop";
				cutText [format["You have interrupted taking clothes!"], "PLAIN DOWN"]; //display text at bottom center of screen on interrupt
			};
		};
	} else {
		cutText ["This Skin has already been taken!", "PLAIN DOWN"];
	};
} else {
	cutText [format["Currently %1 is not supported by the steal skin script.",_skin], "PLAIN DOWN"];
};