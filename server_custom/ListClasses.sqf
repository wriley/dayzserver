private ["_cfgvehicles", "_cfgmags", "_vehicle", "_weapon", "_mag", "_veh_type", "_veh_name", "_veh_magazines"];

if (isServer) exitWith {};
diag_log "ListClasses waiting for login";
waitUntil { sleep 1; !isNil ("Dayz_loginCompleted") };
diag_log "ListClasses done waiting for login, sleeping 60 seconds";

sleep 60;

hint "Generating Weapon listings...";        
_cfgweapons = configFile >> "cfgWeapons";

for "_i" from 0 to (count _cfgweapons)-1 do {
	_vehicle = _cfgweapons select _i;
	if (isClass _vehicle) then {
		_veh_class = configName(_vehicle);
		_veh_name = (getText(_vehicle >> "displayname"));
		_veh_pic = (getText(_vehicle >> "picture"));
		_veh_type = (getNumber(_vehicle >> "type"));
		if ((getNumber(_vehicle >> "scope")==2)and(getText(_vehicle >> "picture")!= "")) then {
			diag_log format ["WEAPONSLIST,%1,%2,%3,%4",_veh_class,_veh_name,_veh_pic,_veh_type];
		};
	};
};

hint "Generating Magazine listings...";
_cfgmags = configFile >> "CfgMagazines";

for "_i" from 0 to (count _cfgmags)-1 do {
	_mag = _cfgmags select _i;
	if (isClass _mag) then {
		_veh_class = configName(_mag);
		_veh_name = (getText(_mag >> "displayname"));
		_veh_pic = (getText(_mag >> "picture"));
		_veh_type = (getNumber(_mag >> "type"));
		if ((getNumber(_mag >> "scope")==2)and(getText(_mag >> "picture")!= "")) then {
			diag_log format ["MAGAZINESLIST,%1,%2,%3,%4",_veh_class,_veh_name,_veh_pic,_veh_type];
		};
	};
};

hint "Generating Vehicle listings...";
_cfgvehicles = configFile >> "CfgVehicles";

for "_i" from 0 to (count _cfgvehicles)-1 do {
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_veh_class = configName(_vehicle);
		_veh_name = (getText(_vehicle >> "displayname"));
		_veh_pic = (getText(_vehicle >> "picture"));
		_veh_type = (getText(_vehicle >> "vehicleclass"));
		_veh_side = (getNumber(_vehicle >> "side"));
		_veh_faction = (getText(_vehicle >> "faction"));
		_veh_cargo = (getNumber(_vehicle >> "transportsoldier"));
		_veh_weapons = (getNumber(_vehicle >> "transportmaxweapons"));
		_veh_magazines = (getNumber(_vehicle >> "transportmaxmagazines"));
		_veh_backpacks = (getNumber(_vehicle >> "transportmaxbackpacks"));
		if (
			getNumber(_vehicle >> "scope")==2 and (
				_veh_type == "Air" or
				_veh_type == "Backpacks" or
				_veh_type == "Car" or
				_veh_type == "CarD" or
				_veh_type == "CarW" or
				_veh_type == "Ship" or
				_veh_type == "Survival" or
				_veh_type == "Military"
				)
			) then {
			diag_log format ["VEHICLESLIST,%1,%2,%3,%4,%5,%6,%7,%8,%9,%10",_veh_class,_veh_name,_veh_pic,_veh_type,_veh_side,_veh_faction,_veh_cargo,_veh_weapons,_veh_magazines,_veh_backpacks];
		};
	};
};
