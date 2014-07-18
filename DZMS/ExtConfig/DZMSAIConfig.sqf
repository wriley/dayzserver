/*
	DZMSAIConfig.sqf
	This is a configuration for the AI that spawn at missions.
	This includes their skin, weapons, gear, and skills.
	You can adjust these to your liking, but it is for advanced users.
*/

///////////////////////////////////////////////
// Array of skin classnames for the AI to use
DZMSBanditSkins = ["Bandit1_DZ","BanditW1_DZ","BanditW2_DZ","Camo1_DZ","Sniper1_DZ","Soldier1_DZ","Survivor2_DZ","SurvivorW2_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","RU_Policeman_DZ","Pilot_EP1_DZ","Haris_Press_EP1_DZ","Ins_Soldier_GL_DZ","GUE_Commander_DZ","Functionary1_EP1_DZ","Priest_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","TK_INS_Warlord_EP1_DZ","TK_INS_Soldier_EP1_DZ","Soldier_Sniper_PMC_DZ","Soldier_TL_PMC_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ","Bandit2_DZ","SurvivorWcombat_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","Soldier_Bodyguard_AA12_PMC_DZ","GUE_Soldier_CO_DZ"];

////////////////////////
// Array of AI Skills
DZMSSkills0 = [
	["aimingAccuracy",0.10,0.125],
	["aimingShake",0.45,0.55],
	["aimingSpeed",0.45,0.55],
	["endurance",0.40,0.50],
	["spotDistance",0.30,0.45],
	["spotTime",0.30,0.45],
	["courage",0.40,0.60],
	["reloadSpeed",0.50,0.60],
	["commanding",0.40,0.50],
	["general",0.40,0.60]
];

DZMSSkills1 = [
	["aimingAccuracy",0.125,0.15],
	["aimingShake",0.60,0.70],
	["aimingSpeed",0.60,0.70],
	["endurance",0.55,0.65],
	["spotDistance",0.45,0.60],
	["spotTime",0.45,0.60],
	["courage",0.55,0.75],
	["reloadSpeed",0.60,0.70],
	["commanding",0.55,0.65],
	["general",0.55,0.75]
];

DZMSSkills2 = [
	["aimingAccuracy",0.15,0.20],
	["aimingShake",0.75,0.85],
	["aimingSpeed",0.70,0.80],
	["endurance",0.70,0.80],
	["spotDistance",0.60,0.75],
	["spotTime",0.60,0.75],
	["courage",0.70,0.90],
	["reloadSpeed",0.70,0.80],
	["commanding",0.70,0.90],
	["general",0.70,0.90]
];

DZMSSkills3 = [	
	["aimingAccuracy",0.20,0.25],
	["aimingShake",0.85,0.95],
	["aimingSpeed",0.80,0.90],
	["endurance",0.80,0.90],
	["spotDistance",0.70,0.85],
	["spotTime",0.70,0.85],
	["courage",0.80,1.00],
	["reloadSpeed",0.80,0.90],
	["commanding",0.80,0.90],
	["general",0.80,1.00]
];

DZMSSkills4 = [	
	["aimingAccuracy",0.30,0.25],
	["aimingShake",0.90,0.95],
	["aimingSpeed",0.90,0.90],
	["endurance",0.90,0.90],
	["spotDistance",0.85,0.85],
	["spotTime",0.85,0.85],
	["courage",0.90,1.00],
	["reloadSpeed",0.90,0.90],
	["commanding",0.90,0.90],
	["general",0.90,1.00]
];

DZMSSkills5 = [	
	["aimingAccuracy",0.35,0.25],
	["aimingShake",0.95,0.95],
	["aimingSpeed",0.95,0.90],
	["endurance",0.95,0.90],
	["spotDistance",0.95,0.85],
	["spotTime",0.95,0.85],
	["courage",0.95,1.00],
	["reloadSpeed",0.95,0.90],
	["commanding",0.95,0.90],
	["general",0.95,1.00]
];

//////////////////////////////////////////////////////////////
// This is the primary weaponlist that can be assigned to AI
// These are assigned based on AI difficulty level
DZMSWeps0 = [
"M16A2",
"AK_74",
"AKS_74_U",
"M1014",
"M4A1",
"Remington870_lamp",
"Sa58P_EP1",
"Sa58V_EP1"
];

DZMSWeps1 = [
"M16A2",
"M16A2GL",
"AK_74",
"M4A1_Aim",
"AKS_74_kobra",
"AKS_74_U",
"AK_47_M",
"M1014",
"M4A1",
"Remington870_lamp",
"M4A1_AIM_SD_camo",
"Sa58V_CCO_EP1",
"Sa58P_EP1",
"Sa58V_EP1"
];

DZMSWeps2 = [
"FN_FAL",
"FN_FAL_ANPVS4",
"Mk_48_DZ",
"M249_EP1_DZ",
"BAF_L85A2_RIS_Holo",
"G36C",
"G36C_camo",
"G36A_camo",
"G36K_camo",
"AK_47_M",
"AKS_74_U",
"RPK_74"
];

DZMSWeps3 = [
"FN_FAL",
"FN_FAL_ANPVS4",
"Mk_48_DZ",
"M249_EP1_DZ",
"BAF_L85A2_RIS_Holo",
"G36C",
"G36C_camo",
"G36A_camo",
"G36K_camo",
"AK_47_M",
"AKS_74_U",
"M14_EP1",
"DMR_DZ",
"RPK_74"
];

DZMSWeps4 = [
"FN_FAL",
"FN_FAL_ANPVS4",
"Mk_48_DZ",
"M249_EP1_DZ",
"BAF_L85A2_RIS_Holo",
"G36C",
"G36C_camo",
"G36A_camo",
"G36K_camo",
"AK_47_M",
"AKS_74_U",
"M14_EP1",
"DMR_DZ",
"RPK_74"
];

DZMSWeps5 = [
"DMR_DZ",
"SVD",
"SVD_CAMO",
"KSVK_DZE"
];

/////////////////////////////////////////////////////////////
// These are gear sets that will be randomly given to the AI
// They are all the same, but can be customized.
DZMSGear0 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear1 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear2 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear3 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear4 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

////////////////////////////////////////////////////////////
// These are the backpacks that can be assigned to AI units.
DZMSPacklist = [
"DZ_Patrol_Pack_EP1",
"DZ_Assault_Pack_EP1",
"DZ_Czech_Vest_Puch",
"DZ_ALICE_Pack_EP1",
"DZ_TK_Assault_Pack_EP1",
"DZ_British_ACU",
"DZ_CivilBackpack_EP1",
"DZ_Backpack_EP1",
"DZ_TerminalPack_EP1",
"DZ_GunBag_EP1",
"DZ_LargeGunBag_EP1"
];