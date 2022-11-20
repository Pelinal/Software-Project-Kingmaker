/// @description Map/Province Script core
function map_init(){
	
	// All Provinces in the Game
	// Index 0: Name, Index 1: Base Tax, Index 2: Manpower, Index 3: Base Production, Index 4: Trade Good, Index 5: Capital, Index 6: Owned By
	// Bretagne - Brittany
	global.provinces[0] = ["Léon", 2, 1, 1, 0, "Brest", "BRE"]
	global.provinces[1] = ["Cornuaille", 2, 1, 2, 0, "Quimper", "BRE"]
	global.provinces[2] = ["Rennais", 3, 3, 3, 1, "Rennes", "BRE"]
	global.provinces[3] = ["Vannetais", 2, 1, 2, 0, "Vannes", "BRE"]
	global.provinces[4] = ["Nantais", 4, 2, 3, 11, "Nantes", "BRE"]
	// Normandie - Normandy
	global.provinces[5] = ["Coutantin", 2, 1, 1, 0, "Avranches", "NOR"]
	global.provinces[6] = ["Caennais", 4, 2, 2, 1, "Caen", "NOR"]
	global.provinces[7] = ["Alençon", 1, 1, 1, 5, "Alençon", "NOR"]
	global.provinces[8] = ["Ébroïcien", 3, 2, 3, 2, "Evreux", "NOR"]
	global.provinces[9] = ["Rouennais", 2, 3, 4, 0, "Rouen", "NOR"]
	// Picardie - Picardy
	global.provinces[10] = ["Pays de Calais", 3, 4, 2, 0, "Calais", "PIC"]
	global.provinces[11] = ["Amienois", 5, 4, 2, 1, "Amiens", "PIC"]
	global.provinces[12] = ["Santerre", 1, 1, 2, 8, "Montdidier", "PIC"]
	global.provinces[13] = ["Vermandois", 3, 1, 3, 1, "St. Quentin", "PIC"]
	// Maine - Maine
	global.provinces[14] = ["Mayennais", 2, 2, 2, 1, "Mayenne", "MAI"]
	global.provinces[15] = ["Perche", 3, 3, 3, 2, "Le Mans", "MAI"]
	// Anjou - Anjou
	global.provinces[16] = ["Anjou", 3, 3, 4, 1, "Angers", "ANJ"]
	// Touraine - Touraine
	global.provinces[17] = ["Touraine", 4, 2, 3, 2, "Tours", "TOU"]
	// Orléanais - Orleanais
	global.provinces[18] = ["Vendomois", 3, 2, 3, 2, "Vendôme", "ORL"]
	global.provinces[19] = ["Sologne", 2, 3, 3, 2, "Blois", "ORL"]
	global.provinces[20] = ["Orléans", 7, 7, 6, 1, "Orleans", "ORL"]
	global.provinces[21] = ["Gatinois", 2, 2, 2, 4, "Montargis", "ORL"]
	// Île de France - Isle of France
	global.provinces[22] = ["Chartres", 2, 4, 4, 8, "Chartres", "FRA"]
	global.provinces[23] = ["Versailles", 4, 2, 2, 1, "Versailles", "FRA"]
	global.provinces[24] = ["Paris", 12, 12, 16, 10, "Paris", "FRA"]
	global.provinces[25] = ["Vexin", 3, 3, 2, 2, "Beauvais", "FRA"]
	global.provinces[26] = ["Valois", 4, 4, 2, 2, "Senlis", "FRA"]
	global.provinces[27] = ["Soissons", 4, 2, 3, 4, "Soissons", "FRA"]
	// Champagne - Champagne
	global.provinces[28] = ["Remois", 3, 3, 3, 4, "Reims", "CHA"]
	global.provinces[29] = ["Chalons", 2, 3, 1, 2, "Châlons", "CHA"]
	global.provinces[30] = ["Troyes", 4, 5, 5, 4, "Troyes", "CHA"]
	global.provinces[31] = ["Vallage", 2, 1, 2, 11, "Chaumont", "CHA"]
	global.provinces[32] = ["Senonois", 3, 2, 1, 1, "Sens", "CHA"]
	// Berry - Berry
	global.provinces[33] = ["Argenton", 2, 3, 2, 4, "Argenton", "BER"]
	global.provinces[34] = ["Berry", 5, 6, 6, 4, "Bourges", "BER"]
	// Bourbonnais - Bourbonnais
	global.provinces[35] = ["Bourbonnais", 3, 4, 4, 8, "Moulins", "BOU"]
	// Nivernais - Nivernais
	global.provinces[36] = ["Nivernais", 2, 4, 2, 2, "Nevers", "NIV"]
	// Poitou - Poitou
	global.provinces[37] = ["Haut-Poitou", 5, 4, 5, 4, "Poitiers", "POI"]
	global.provinces[38] = ["Bas-Poitou", 2, 4, 2, 11, "La Roche", "POI"]
	// Aunis - Aunis
	global.provinces[39] = ["Aunis", 3, 4, 2, 0, "La Rochelle", "AUN"]
	// Saintonge - Saintonge
	global.provinces[40] = ["Saintonge", 5, 2, 4, 11, "Saintes", "SAI"]
	// Angoumois - Angoumois
	global.provinces[41] = ["Angoumois", 5, 4, 3, 3, "Angoulême", "ANG"]
	// La Marche - The March
	global.provinces[42] = ["La Marche", 4, 3, 2, 2, "Guéret", "MAR"]
	// Limousin - Limousin
	global.provinces[43] = ["Limousin", 4, 4, 2, 10, "Limoges", "LIM"]
	// Auvergne - Auvergne
	global.provinces[44] = ["Basse-Auvergne", 4, 4, 8, 7, "Clermond Ferrant", "AUV"]
	global.provinces[45] = ["Haute-Auvergne", 3, 3, 6, 8, "St. Flour", "AUV"]
	// Bourgogne - Burgundy
	global.provinces[46] = ["Auxois", 3, 1, 5, 3, "Auxerne", "BUR"]
	global.provinces[47] = ["Dijonnais", 6, 4, 4, 4, "Dijon", "BUR"]
	global.provinces[48] = ["Bourgogne-Sud", 3, 3, 2, 7, "Mâcon", "BUR"]
	// Espana - Spain
	global.provinces[49] = ["Charolais", 3, 3, 3, 3, "Charolais", "SPA"]
	// Lyonnais - Lyon
	global.provinces[50] = ["Lyonnais", 10, 8, 8, 9, "Lyon", "LYO"]
	// Guyenne - Guyenne
	global.provinces[51] = ["Bordeaux", 11, 9, 8, 4, "Bordeaux", "GUY"]
	global.provinces[52] = ["Bazadois", 4, 4, 4, 0, "Bazas", "GUY"]
	global.provinces[53] = ["Cahorsin", 3, 3, 2, 8, "Cahors", "GUY"]
	global.provinces[54] = ["Périgord", 4, 5, 2, 7, "Périgueux", "GUY"]
	global.provinces[55] = ["Villefranchois", 3, 5, 1, 3, "Villefranche", "GUY"]
	// Languedoc - Languedoc
	global.provinces[56] = ["Toulouse", 8, 10, 8, 4, "Toulouse", "LAN"]
	global.provinces[57] = ["Narbonnais", 5, 4, 3, 6, "Narbonne", "LAN"]
	global.provinces[58] = ["Montpellier", 13, 5, 5, 4, "Montpellier", "LAN"]
	global.provinces[59] = ["Nimois", 3, 3, 2, 6, "Nîmes", "LAN"]
	global.provinces[60] = ["Gévaudan", 2, 2, 1, 3, "Marvejols", "LAN"]
	global.provinces[61] = ["Vivarais", 3, 5, 5, 6, "Viviers", "LAN"]
	// Stato Pontifico - The Papal States
	global.provinces[62] = ["Avignon", 4, 5, 4, 1, "Avignon", "PAP"]
	// Dauphine - Dauphine
	global.provinces[63] = ["Valentinois", 3, 3, 4, 4, "Valence", "DAU"]
	global.provinces[64] = ["Grésivaudan", 5, 4, 4, 6, "Grenoble", "DAU"]
	global.provinces[65] = ["Briançon", 2, 3, 3, 10, "Briançon", "DAU"]
	// Provence - Provence
	global.provinces[66] = ["Camargue", 10, 3, 4, 10, "Arles", "PRO"]
	global.provinces[67] = ["Aquisextain", 7, 3, 5, 8, "Aix", "PRO"]
	global.provinces[68] = ["Toulonnais", 2, 1, 4, 0, "Toulon", "PRO"]
	// Foix - Foix
	global.provinces[69] = ["Foix", 3, 3, 3, 0, "Foix", "FOI"]
	// Gascogne - Gascony
	global.provinces[70] = ["Labourd", 3, 2, 1, 0, "Bayonne", "GAS"]
	global.provinces[71] = ["Marsan", 2, 3, 1, 3, "Roquefort", "GAS"]
	global.provinces[72] = ["Armagnac", 4, 4, 3, 4, "Auch", "GAS"]
	global.provinces[73] = ["Bigorre", 1, 3, 1, 3, "Tarbes", "GAS"]
	// Béarn - Bearn
	global.provinces[74] = ["Béarn", 4, 3, 2, 5, "Pau", "BEA"]
	// Also Ile de France:
	global.provinces[75] = ["Brie", 4, 3, 3, 5, "Nemours", "FRA"]
	// Provence Again
	global.provinces[76] = ["Forcalquieren", 2, 4, 3, 7, "Forcalquier", "PRO"]
	global.provinces[77] = ["Dignois", 2, 2, 2, 5, "Digne", "PRO"]
	// Guyenne Again
	global.provinces[78] = ["Gabardan", 4, 2, 3, 5, "Nerac", "GUY"]
	
	with instance_create_depth(180, 531, 0, obj_province) {
		sprite_index = spr_c_leon
		prov_id = 0
	}
	with instance_create_depth(207, 616, 0, obj_province) {
		sprite_index = spr_c_cornuaille
		prov_id = 1
	}
	with instance_create_depth(411, 581, 0, obj_province) {
		sprite_index = spr_c_rennais
		prov_id = 2
	}
	with instance_create_depth(352, 686, 0, obj_province) {
		sprite_index = spr_c_vannetais
		prov_id = 3
	}
	with instance_create_depth(454, 752, 0, obj_province) {
		sprite_index = spr_c_nantais
		prov_id = 4
	}
	with instance_create_depth(512, 454, 0, obj_province) {
		sprite_index = spr_c_coutantin
		prov_id = 5
	}
	with instance_create_depth(628, 450, 0, obj_province) {
		sprite_index = spr_c_caennais
		prov_id = 6
	}
	with instance_create_depth(662, 536, 0, obj_province) {
		sprite_index = spr_c_alencon
		prov_id = 7
	}
	with instance_create_depth(772, 474, 0, obj_province) {
		sprite_index = spr_c_ebroicien
		prov_id = 8
	}
	with instance_create_depth(785, 373, 0, obj_province) {
		sprite_index = spr_c_rouennais
		prov_id = 9
	}
	with instance_create_depth(888, 198, 0, obj_province) {
		sprite_index = spr_c_calais
		prov_id = 10
	}
	with instance_create_depth(929, 307, 0, obj_province) {
		sprite_index = spr_c_amienois
		prov_id = 11
	}
	with instance_create_depth(942, 382, 0, obj_province) {
		sprite_index = spr_c_santerre
		prov_id = 12
	}
	with instance_create_depth(1090, 354, 0, obj_province) {
		sprite_index = spr_c_vermandois
		prov_id = 13
	}
	with instance_create_depth(604, 623, 0, obj_province) {
		sprite_index = spr_c_mayennais
		prov_id = 14
	}
	with instance_create_depth(720, 633, 0, obj_province) {
		sprite_index = spr_c_perche
		prov_id = 15
	}
	with instance_create_depth(608, 764, 0, obj_province) {
		sprite_index = spr_c_anjou
		prov_id = 16
	}
	with instance_create_depth(751, 811, 0, obj_province) {
		sprite_index = spr_c_touraine
		prov_id = 17
	}
	with instance_create_depth(795, 686, 0, obj_province) {
		sprite_index = spr_c_vendomois
		prov_id = 18
	}
	with instance_create_depth(891, 752, 0, obj_province) {
		sprite_index = spr_c_sologne
		prov_id = 19
	}
	with instance_create_depth(912, 648, 0, obj_province) {
		sprite_index = spr_c_orleans
		prov_id = 20
	}
	with instance_create_depth(1011, 692, 0, obj_province) {
		sprite_index = spr_c_gatinois
		prov_id = 21
	}
	with instance_create_depth(855, 583, 0, obj_province) {
		sprite_index = spr_c_chartrain
		prov_id = 22
	}
	with instance_create_depth(850, 519, 0, obj_province) {
		sprite_index = spr_c_versailles
		prov_id = 23
	}
	with instance_create_depth(932, 522, 0, obj_province) {
		sprite_index = spr_c_paris
		prov_id = 24
	}
	with instance_create_depth(924, 426, 0, obj_province) {
		sprite_index = spr_c_beauvais
		prov_id = 25
	}
	with instance_create_depth(1025, 422, 0, obj_province) {
		sprite_index = spr_c_valois
		prov_id = 26
	}
	with instance_create_depth(1080, 413, 0, obj_province) {
		sprite_index = spr_c_soissons
		prov_id = 27
	}
	with instance_create_depth(999, 562, 0, obj_province) {
		sprite_index = spr_c_brie
		prov_id = 75
	}
	with instance_create_depth(1204, 438, 0, obj_province) {
		sprite_index = spr_c_remois
		prov_id = 28
	}
	with instance_create_depth(1101, 517, 0, obj_province) {
		sprite_index = spr_c_chalons
		prov_id = 29
	}
	with instance_create_depth(1215, 605, 0, obj_province) {
		sprite_index = spr_c_troyes
		prov_id = 30
	}
	with instance_create_depth(1304, 623, 0, obj_province) {
		sprite_index = spr_c_vallage
		prov_id = 31
	}
	with instance_create_depth(1078, 644, 0, obj_province) {
		sprite_index = spr_c_senonois
		prov_id = 32
	}
	with instance_create_depth(867, 887, 0, obj_province) {
		sprite_index = spr_c_argenton
		prov_id = 33
	}
	with instance_create_depth(942, 803, 0, obj_province) {
		sprite_index = spr_c_berry
		prov_id = 34
	}
	with instance_create_depth(1039, 929, 0, obj_province) {
		sprite_index = spr_c_bourbonais
		prov_id = 35
	}
	with instance_create_depth(1082, 815, 0, obj_province) {
		sprite_index = spr_c_nivernais
		prov_id = 36
	}
	with instance_create_depth(684, 933, 0, obj_province) {
		sprite_index = spr_c_haut_poitou
		prov_id = 37
	}
	with instance_create_depth(498, 884, 0, obj_province) {
		sprite_index = spr_c_bas_poitou
		prov_id = 38
	}
	with instance_create_depth(518, 988, 0, obj_province) {
		sprite_index = spr_c_aunis
		prov_id = 39
	}
	with instance_create_depth(565, 1065, 0, obj_province) {
		sprite_index = spr_c_saintonge
		prov_id = 40
	}
	with instance_create_depth(676, 1082, 0, obj_province) {
		sprite_index = spr_c_angoumois
		prov_id = 41
	}
	with instance_create_depth(861, 987, 0, obj_province) {
		sprite_index = spr_c_la_marche
		prov_id = 42
	}
	with instance_create_depth(880, 1121, 0, obj_province) {
		sprite_index = spr_c_limousin
		prov_id = 43
	}
	with instance_create_depth(1044, 1077, 0, obj_province) {
		sprite_index = spr_c_basse_auvergne
		prov_id = 44
	}
	with instance_create_depth(998, 1199, 0, obj_province) {
		sprite_index = spr_c_haute_auvergne
		prov_id = 45
	}
	with instance_create_depth(1159, 723, 0, obj_province) {
		sprite_index = spr_c_auxois
		prov_id = 46
	}
	with instance_create_depth(1233, 790, 0, obj_province) {
		sprite_index = spr_c_dijonnais
		prov_id = 47
	}
	with instance_create_depth(1203, 911, 0, obj_province) {
		sprite_index = spr_c_bourgogne_sud
		prov_id = 48
	}
	with instance_create_depth(1173, 926, 0, obj_province) {
		sprite_index = spr_c_charolais
		prov_id = 49
	}
	with instance_create_depth(1212, 1060, 0, obj_province) {
		sprite_index = spr_c_lyonnais
		prov_id = 50
	}
	with instance_create_depth(557, 1165, 0, obj_province) {
		sprite_index = spr_c_bordeaux
		prov_id = 51
	}
	with instance_create_depth(552, 1274, 0, obj_province) {
		sprite_index = spr_c_bazadois
		prov_id = 52
	}
	with instance_create_depth(724, 1262, 0, obj_province) {
		sprite_index = spr_c_cahorsin
		prov_id = 53
	}
	with instance_create_depth(770, 1147, 0, obj_province) {
		sprite_index = spr_c_perigord
		prov_id = 54
	}
	with instance_create_depth(940, 1314, 0, obj_province) {
		sprite_index = spr_c_villefranchois
		prov_id = 55
	}
	with instance_create_depth(892, 1418, 0, obj_province) {
		sprite_index = spr_c_toulousain
		prov_id = 56
	}
	with instance_create_depth(951, 1513, 0, obj_province) {
		sprite_index = spr_c_narbonnais
		prov_id = 57
	}
	with instance_create_depth(1098, 1456, 0, obj_province) {
		sprite_index = spr_c_montpellierain
		prov_id = 58
	}
	with instance_create_depth(1157, 1388, 0, obj_province) {
		sprite_index = spr_c_nimois
		prov_id = 59
	}
	with instance_create_depth(1097, 1263, 0, obj_province) {
		sprite_index = spr_c_gevaudan
		prov_id = 60
	}
	with instance_create_depth(1177, 1220, 0, obj_province) {
		sprite_index = spr_c_vivarais
		prov_id = 61
	}
	with instance_create_depth(1291, 1348, 0, obj_province) {
		sprite_index = spr_c_avignon
		prov_id = 62
	}
	with instance_create_depth(856, 1549, 0, obj_province) {
		sprite_index = spr_c_foix
		prov_id = 69
	}
	with instance_create_depth(1323, 1272, 0, obj_province) {
		sprite_index = spr_c_valentinois
		prov_id = 63
	}
	with instance_create_depth(1345, 1132, 0, obj_province) {
		sprite_index = spr_c_gresivaudan
		prov_id = 64
	}
	with instance_create_depth(1454, 1247, 0, obj_province) {
		sprite_index = spr_c_brianconnais
		prov_id = 65
	}
	with instance_create_depth(1265, 1444, 0, obj_province) {
		sprite_index = spr_c_arles
		prov_id = 66
	}
	with instance_create_depth(1367, 1480, 0, obj_province) {
		sprite_index = spr_c_aix
		prov_id = 67
	}
	with instance_create_depth(1493, 1471, 0, obj_province) {
		sprite_index = spr_c_toulonnais
		prov_id = 68
	}
	with instance_create_depth(1364, 1364, 0, obj_province) {
		sprite_index = spr_c_forcalquieren
		prov_id = 76
	}
	with instance_create_depth(1459, 1345, 0, obj_province) {
		sprite_index = spr_c_dignois
		prov_id = 77
	}
	with instance_create_depth(677, 1329, 0, obj_province) {
		sprite_index = spr_c_gabardan
		prov_id = 78
	}
	with instance_create_depth(474, 1429, 0, obj_province) {
		sprite_index = spr_c_labourd
		prov_id = 70
	}
	with instance_create_depth(553, 1362, 0, obj_province) {
		sprite_index = spr_c_marsan
		prov_id = 71
	}
	with instance_create_depth(722, 1412, 0, obj_province) {
		sprite_index = spr_c_armagnac
		prov_id = 72
	}
	with instance_create_depth(702, 1538, 0, obj_province) {
		sprite_index = spr_c_bigorre
		prov_id = 73
	}
	with instance_create_depth(542, 1492, 0, obj_province) {
		sprite_index = spr_c_bearn
		prov_id = 74
	}

	
	with obj_province {
		image_colour = tag_fetch_colour(global.provinces[prov_id][6])
	}
}

function map_province_owner(province, tag) {
	// Finds the owning tag of the specified province
	if global.provinces[province][6] == tag {
		return true
	} else {
		return false
	}
}