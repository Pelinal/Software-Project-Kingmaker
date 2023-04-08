/// @description Map/Province Script core
function map_init(){
	
	// All Provinces in the Game
	// Index 0: Name, Index 1: Base Tax, Index 2: Manpower, Index 3: Base Production, Index 4: Trade Good, Index 5: Capital, Index 6: Owned By,
	// Index 7: Unit X Pos, Index 8: Unit Y Pos ( These are set in the creation event of each province ), Index 9: Object ID
	// Bretagne - Brittany
	global.provinces[0] = ["Léon", 2, 1, 1, 0, "Brest", "BRE", 0, 0, noone]
	global.provinces[1] = ["Cornuaille", 2, 1, 2, 0, "Quimper", "BRE", 0, 0, noone]
	global.provinces[2] = ["Rennais", 3, 3, 3, 1, "Rennes", "BRE", 0, 0, noone]
	global.provinces[3] = ["Vannetais", 2, 1, 2, 0, "Vannes", "BRE", 0, 0, noone]
	global.provinces[4] = ["Nantais", 4, 2, 3, 11, "Nantes", "BRE", 0, 0, noone]
	// Normandie - Normandy
	global.provinces[5] = ["Coutantin", 2, 1, 1, 0, "Avranches", "NOR", 0, 0, noone]
	global.provinces[6] = ["Caennais", 4, 2, 2, 1, "Caen", "NOR", 0, 0, noone]
	global.provinces[7] = ["Alençon", 1, 1, 1, 5, "Alençon", "NOR", 0, 0, noone]
	global.provinces[8] = ["Ébroïcien", 3, 2, 3, 2, "Evreux", "NOR", 0, 0, noone]
	global.provinces[9] = ["Rouennais", 2, 3, 4, 0, "Rouen", "NOR", 0, 0, noone]
	// Picardie - Picardy
	global.provinces[10] = ["Calais", 3, 4, 2, 0, "Calais", "PIC", 0, 0, noone]
	global.provinces[11] = ["Amienois", 5, 4, 2, 1, "Amiens", "PIC", 0, 0, noone]
	global.provinces[12] = ["Santerre", 1, 1, 2, 8, "Montdidier", "PIC", 0, 0, noone]
	global.provinces[13] = ["Vermandois", 3, 1, 3, 1, "St. Quentin", "PIC", 0, 0, noone]
	// Maine - Maine
	global.provinces[14] = ["Mayennais", 2, 2, 2, 1, "Mayenne", "MAI", 0, 0, noone]
	global.provinces[15] = ["Perche", 3, 3, 3, 2, "Le Mans", "MAI", 0, 0, noone]
	// Anjou - Anjou
	global.provinces[16] = ["Anjou", 3, 3, 4, 1, "Angers", "ANJ", 0, 0, noone]
	// Touraine - Touraine
	global.provinces[17] = ["Touraine", 4, 2, 3, 2, "Tours", "TOU", 0, 0, noone]
	// Orléanais - Orleanais
	global.provinces[18] = ["Vendomois", 3, 2, 3, 2, "Vendôme", "ORL", 0, 0, noone]
	global.provinces[19] = ["Sologne", 2, 3, 3, 2, "Blois", "ORL", 0, 0, noone]
	global.provinces[20] = ["Orléans", 7, 7, 6, 1, "Orleans", "ORL", 0, 0, noone]
	global.provinces[21] = ["Gatinois", 2, 2, 2, 4, "Montargis", "ORL", 0, 0, noone]
	// Île de France - Isle of France
	global.provinces[22] = ["Chartres", 2, 4, 4, 8, "Chartres", "FRA", 0, 0, noone]
	global.provinces[23] = ["Mantois", 4, 2, 2, 1, "Versailles", "FRA", 0, 0, noone]
	global.provinces[24] = ["Paris", 12, 12, 16, 10, "Paris", "FRA", 0, 0, noone]
	global.provinces[25] = ["Vexin", 3, 3, 2, 2, "Beauvais", "FRA", 0, 0, noone]
	global.provinces[26] = ["Valois", 4, 4, 2, 2, "Senlis", "FRA", 0, 0, noone]
	global.provinces[27] = ["Soissons", 4, 2, 3, 4, "Soissons", "FRA", 0, 0, noone]
	// Champagne - Champagne
	global.provinces[28] = ["Remois", 3, 3, 3, 4, "Reims", "CHA", 0, 0, noone]
	global.provinces[29] = ["Chalons", 2, 3, 1, 2, "Châlons", "CHA", 0, 0, noone]
	global.provinces[30] = ["Troyes", 4, 5, 5, 4, "Troyes", "CHA", 0, 0, noone]
	global.provinces[31] = ["Vallage", 2, 1, 2, 11, "Chaumont", "CHA", 0, 0, noone]
	global.provinces[32] = ["Senonois", 3, 2, 1, 1, "Sens", "CHA", 0, 0, noone]
	// Berry - Berry
	global.provinces[33] = ["Argenton", 2, 3, 2, 4, "Argenton", "BER", 0, 0, noone]
	global.provinces[34] = ["Berry", 5, 6, 6, 4, "Bourges", "BER", 0, 0, noone]
	// Bourbonnais - Bourbonnais
	global.provinces[35] = ["Bourbonnais", 3, 4, 4, 8, "Moulins", "BOU", 0, 0, noone]
	// Nivernais - Nivernais
	global.provinces[36] = ["Nivernais", 2, 4, 2, 2, "Nevers", "NIV", 0, 0, noone]
	// Poitou - Poitou
	global.provinces[37] = ["Haut-Poitou", 5, 4, 5, 4, "Poitiers", "POI", 0, 0, noone]
	global.provinces[38] = ["Bas-Poitou", 2, 4, 2, 11, "La Roche", "POI", 0, 0, noone]
	// Aunis - Aunis
	global.provinces[39] = ["Aunis", 3, 4, 2, 0, "La Rochelle", "AUN", 0, 0, noone]
	// Saintonge - Saintonge
	global.provinces[40] = ["Saintonge", 5, 2, 4, 11, "Saintes", "SAI", 0, 0, noone]
	// Angoumois - Angoumois
	global.provinces[41] = ["Angoumois", 5, 4, 3, 3, "Angoulême", "SAI", 0, 0, noone]
	// La Marche - The March
	global.provinces[42] = ["La Marche", 4, 3, 2, 2, "Guéret", "MAR", 0, 0, noone]
	// Limousin - Limousin
	global.provinces[43] = ["Limousin", 4, 4, 2, 10, "Limoges", "LIM", 0, 0, noone]
	// Auvergne - Auvergne
	global.provinces[44] = ["Basse-Auvergne", 4, 4, 8, 7, "Clermond Ferrant", "AUV", 0, 0, noone]
	global.provinces[45] = ["Haute-Auvergne", 3, 3, 6, 8, "St. Flour", "AUV", 0, 0, noone]
	// Bourgogne - Burgundy
	global.provinces[46] = ["Auxois", 3, 1, 5, 3, "Auxerne", "BUR", 0, 0, noone]
	global.provinces[47] = ["Dijonnais", 6, 4, 4, 4, "Dijon", "BUR", 0, 0, noone]
	global.provinces[48] = ["Bourgogne-Sud", 3, 3, 2, 7, "Mâcon", "BUR", 0, 0, noone]
	// Espana - Spain
	global.provinces[49] = ["Charolais", 3, 3, 3, 3, "Charolais", "SPA", 0, 0, noone]
	// Lyonnais - Lyon
	global.provinces[50] = ["Lyonnais", 10, 8, 8, 9, "Lyon", "LYO", 0, 0, noone]
	// Guyenne - Guyenne
	global.provinces[51] = ["Bordeaux", 11, 9, 8, 4, "Bordeaux", "GUY", 0, 0, noone]
	global.provinces[52] = ["Bazadois", 4, 4, 4, 0, "Bazas", "GUY", 0, 0, noone]
	global.provinces[53] = ["Cahorsin", 3, 3, 2, 8, "Cahors", "GUY", 0, 0, noone]
	global.provinces[54] = ["Périgord", 4, 5, 2, 7, "Périgueux", "GUY", 0, 0, noone]
	global.provinces[55] = ["Villefranchois", 3, 5, 1, 3, "Villefranche", "GUY", 0, 0, noone]
	// Languedoc - Languedoc
	global.provinces[56] = ["Toulouse", 8, 10, 8, 4, "Toulouse", "LAN", 0, 0, noone]
	global.provinces[57] = ["Narbonnais", 5, 4, 3, 6, "Narbonne", "LAN", 0, 0, noone]
	global.provinces[58] = ["Montpellier", 13, 5, 5, 4, "Montpellier", "LAN", 0, 0, noone]
	global.provinces[59] = ["Nimois", 3, 3, 2, 6, "Nîmes", "LAN", 0, 0, noone]
	global.provinces[60] = ["Gévaudan", 2, 2, 1, 3, "Marvejols", "LAN", 0, 0, noone]
	global.provinces[61] = ["Vivarais", 3, 5, 5, 6, "Viviers", "LAN", 0, 0, noone]
	// Stato Pontifico - The Papal States
	global.provinces[62] = ["Avignon", 4, 5, 4, 1, "Avignon", "PAP", 0, 0, noone]
	// Dauphine - Dauphine
	global.provinces[63] = ["Valentinois", 3, 3, 4, 4, "Valence", "DAU", 0, 0, noone]
	global.provinces[64] = ["Grésivaudan", 5, 4, 4, 6, "Grenoble", "DAU", 0, 0, noone]
	global.provinces[65] = ["Briançon", 2, 3, 3, 10, "Briançon", "DAU", 0, 0, noone]
	// Provence - Provence
	global.provinces[66] = ["Camargue", 10, 3, 4, 10, "Arles", "PRO", 0, 0, noone]
	global.provinces[67] = ["Aix", 7, 3, 5, 8, "Aix", "PRO", 0, 0, noone]
	global.provinces[68] = ["Toulonnais", 2, 1, 4, 0, "Toulon", "PRO", 0, 0, noone]
	// Foix - Foix
	global.provinces[69] = ["Foix", 3, 3, 3, 0, "Foix", "FOI", 0, 0, noone]
	// Gascogne - Gascony
	global.provinces[70] = ["Labourd", 3, 2, 1, 0, "Bayonne", "GAS", 0, 0, noone]
	global.provinces[71] = ["Marsan", 2, 3, 1, 3, "Roquefort", "GAS", 0, 0, noone]
	global.provinces[72] = ["Armagnac", 4, 4, 3, 4, "Auch", "GAS", 0, 0, noone]
	global.provinces[73] = ["Bigorre", 1, 3, 1, 3, "Tarbes", "GAS", 0, 0, noone]
	// Béarn - Bearn
	global.provinces[74] = ["Béarn", 4, 3, 2, 5, "Pau", "BEA", 0, 0, noone]
	// Also Ile de France:
	global.provinces[75] = ["Brie", 4, 3, 3, 5, "Nemours", "FRA", 0, 0, noone]
	// Provence Again
	global.provinces[76] = ["Forcalquier", 2, 4, 3, 7, "Forcalquier", "PRO", 0, 0, noone]
	global.provinces[77] = ["Dignois", 2, 2, 2, 5, "Digne", "PRO", 0, 0, noone]
	// Guyenne Again
	global.provinces[78] = ["Gabardan", 4, 2, 3, 5, "Nerac", "GUY", 0, 0, noone]
	
	/// Buildings Slots List
	// Index correlates to Prov ID
	// Each one is a list of Building IDS (max Four) , -1 means no building is present in slot
	global.buildslots[0] = [-1, -1, -1, -1]
	global.buildslots[1] = [-1, -1, -1, -1]
	global.buildslots[2] = [-1, -1, -1, -1]
	global.buildslots[3] = [-1, -1, -1, -1]
	global.buildslots[4] = [-1, -1, -1, -1]
	global.buildslots[5] = [-1, -1, -1, -1]
	global.buildslots[6] = [-1, -1, -1, -1]
	global.buildslots[7] = [-1, -1, -1, -1]
	global.buildslots[8] = [-1, -1, -1, -1]
	global.buildslots[9] = [-1, -1, -1, -1]
	global.buildslots[10] = [-1, -1, -1, -1]
	global.buildslots[11] = [-1, -1, -1, -1]
	global.buildslots[12] = [-1, -1, -1, -1]
	global.buildslots[13] = [-1, -1, -1, -1]
	global.buildslots[14] = [-1, -1, -1, -1]
	global.buildslots[15] = [-1, -1, -1, -1]
	global.buildslots[16] = [-1, -1, -1, -1]
	global.buildslots[17] = [-1, -1, -1, -1]
	global.buildslots[18] = [-1, -1, -1, -1]
	global.buildslots[19] = [-1, -1, -1, -1]
	global.buildslots[20] = [-1, -1, -1, -1]
	global.buildslots[21] = [-1, -1, -1, -1]
	global.buildslots[22] = [-1, -1, -1, -1]
	global.buildslots[23] = [-1, -1, -1, -1]
	global.buildslots[24] = [-1, -1, -1, -1]
	global.buildslots[25] = [-1, -1, -1, -1]
	global.buildslots[26] = [-1, -1, -1, -1]
	global.buildslots[27] = [-1, -1, -1, -1]
	global.buildslots[28] = [-1, -1, -1, -1]
	global.buildslots[29] = [-1, -1, -1, -1]
	global.buildslots[30] = [-1, -1, -1, -1]
	global.buildslots[31] = [-1, -1, -1, -1]
	global.buildslots[32] = [-1, -1, -1, -1]
	global.buildslots[33] = [-1, -1, -1, -1]
	global.buildslots[34] = [-1, -1, -1, -1]
	global.buildslots[35] = [-1, -1, -1, -1]
	global.buildslots[36] = [-1, -1, -1, -1]
	global.buildslots[37] = [-1, -1, -1, -1]
	global.buildslots[38] = [-1, -1, -1, -1]
	global.buildslots[39] = [-1, -1, -1, -1]
	global.buildslots[40] = [-1, -1, -1, -1]
	global.buildslots[41] = [-1, -1, -1, -1]
	global.buildslots[42] = [-1, -1, -1, -1]
	global.buildslots[43] = [-1, -1, -1, -1]
	global.buildslots[44] = [-1, -1, -1, -1]
	global.buildslots[45] = [-1, -1, -1, -1]
	global.buildslots[46] = [-1, -1, -1, -1]
	global.buildslots[47] = [-1, -1, -1, -1]
	global.buildslots[48] = [-1, -1, -1, -1]
	global.buildslots[49] = [-1, -1, -1, -1]
	global.buildslots[50] = [-1, -1, -1, -1]
	global.buildslots[51] = [-1, -1, -1, -1]
	global.buildslots[52] = [-1, -1, -1, -1]
	global.buildslots[53] = [-1, -1, -1, -1]
	global.buildslots[54] = [-1, -1, -1, -1]
	global.buildslots[55] = [-1, -1, -1, -1]
	global.buildslots[56] = [-1, -1, -1, -1]
	global.buildslots[57] = [-1, -1, -1, -1]
	global.buildslots[58] = [-1, -1, -1, -1]
	global.buildslots[59] = [-1, -1, -1, -1]
	global.buildslots[60] = [-1, -1, -1, -1]
	global.buildslots[61] = [-1, -1, -1, -1]
	global.buildslots[62] = [-1, -1, -1, -1]
	global.buildslots[63] = [-1, -1, -1, -1]
	global.buildslots[64] = [-1, -1, -1, -1]
	global.buildslots[65] = [-1, -1, -1, -1]
	global.buildslots[66] = [-1, -1, -1, -1]
	global.buildslots[67] = [-1, -1, -1, -1]
	global.buildslots[68] = [-1, -1, -1, -1]
	global.buildslots[69] = [-1, -1, -1, -1]
	global.buildslots[70] = [-1, -1, -1, -1]
	global.buildslots[71] = [-1, -1, -1, -1]
	global.buildslots[72] = [-1, -1, -1, -1]
	global.buildslots[73] = [-1, -1, -1, -1]
	global.buildslots[74] = [-1, -1, -1, -1]
	global.buildslots[75] = [-1, -1, -1, -1]
	global.buildslots[76] = [-1, -1, -1, -1]
	global.buildslots[77] = [-1, -1, -1, -1]
	global.buildslots[78] = [-1, -1, -1, -1]

	
	with instance_create_depth(180, 531, 0, obj_province) {
		sprite_index = spr_c_leon
		y_offset = -20
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
		angle = -80
		x_offset = 16
		prov_id = 5
	}
	with instance_create_depth(628, 450, 0, obj_province) {
		sprite_index = spr_c_caennais
		prov_id = 6
	}
	with instance_create_depth(662, 536, 0, obj_province) {
		sprite_index = spr_c_alencon
		y_offset = -12
		prov_id = 7
	}
	with instance_create_depth(772, 474, 0, obj_province) {
		sprite_index = spr_c_ebroicien
		x_offset = 4
		y_offset = -8
		prov_id = 8
	}
	with instance_create_depth(785, 373, 0, obj_province) {
		sprite_index = spr_c_rouennais
		y_offset = -9
		x_offset = 3
		prov_id = 9
	}
	with instance_create_depth(888, 198, 0, obj_province) {
		sprite_index = spr_c_calais
		angle = 86
		x_offset = -18
		prov_id = 10
	}
	with instance_create_depth(929, 307, 0, obj_province) {
		sprite_index = spr_c_amienois
		prov_id = 11
	}
	with instance_create_depth(942, 382, 0, obj_province) {
		sprite_index = spr_c_santerre
		y_offset = -14
		x_offset = 6
		prov_id = 12
	}
	with instance_create_depth(1090, 354, 0, obj_province) {
		sprite_index = spr_c_vermandois
		y_offset = -14
		prov_id = 13
	}
	with instance_create_depth(604, 623, 0, obj_province) {
		sprite_index = spr_c_mayennais
		y_offset = -20
		x_offset = -5
		prov_id = 14
	}
	with instance_create_depth(720, 633, 0, obj_province) {
		sprite_index = spr_c_perche
		x_offset = -15
		prov_id = 15
	}
	with instance_create_depth(608, 764, 0, obj_province) {
		sprite_index = spr_c_anjou
		prov_id = 16
	}
	with instance_create_depth(751, 811, 0, obj_province) {
		sprite_index = spr_c_touraine
		y_offset = -10
		prov_id = 17
	}
	with instance_create_depth(795, 686, 0, obj_province) {
		sprite_index = spr_c_vendomois
		prov_id = 18
	}
	with instance_create_depth(891, 752, 0, obj_province) {
		sprite_index = spr_c_sologne
		y_offset = -10
		x_offset = -6
		prov_id = 19
	}
	with instance_create_depth(912, 648, 0, obj_province) {
		sprite_index = spr_c_orleans
		prov_id = 20
	}
	with instance_create_depth(1011, 692, 0, obj_province) {
		sprite_index = spr_c_gatinois
		angle = -50
		prov_id = 21
	}
	with instance_create_depth(855, 583, 0, obj_province) {
		sprite_index = spr_c_chartrain
		prov_id = 22
	}
	with instance_create_depth(850, 519, 0, obj_province) {
		sprite_index = spr_c_versailles
		angle = -85
		x_offset = 17
		prov_id = 23
	}
	with instance_create_depth(932, 522, 0, obj_province) {
		sprite_index = spr_c_paris
		y_offset = -24
		prov_id = 24
	}
	with instance_create_depth(924, 426, 0, obj_province) {
		sprite_index = spr_c_beauvais
		prov_id = 25
	}
	with instance_create_depth(1025, 422, 0, obj_province) {
		sprite_index = spr_c_valois
		y_offset = 15
		angle = 25
		prov_id = 26
	}
	with instance_create_depth(1080, 413, 0, obj_province) {
		sprite_index = spr_c_soissons
		y_offset = -18
		
		prov_id = 27
	}
	with instance_create_depth(999, 562, 0, obj_province) {
		sprite_index = spr_c_brie
		prov_id = 75
	}
	with instance_create_depth(1204, 438, 0, obj_province) {
		sprite_index = spr_c_remois
		y_offset = -40
		prov_id = 28
	}
	with instance_create_depth(1101, 517, 0, obj_province) {
		sprite_index = spr_c_chalons
		prov_id = 29
	}
	with instance_create_depth(1215, 605, 0, obj_province) {
		sprite_index = spr_c_troyes
		y_offset = -20
		prov_id = 30
	}
	with instance_create_depth(1304, 623, 0, obj_province) {
		sprite_index = spr_c_vallage
		x_offset = 20
		y_offset = 20
		prov_id = 31
	}
	with instance_create_depth(1078, 644, 0, obj_province) {
		sprite_index = spr_c_senonois
		y_offset = -30
		x_offset = 20
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
		x_offset = 10
		prov_id = 38
	}
	with instance_create_depth(518, 988, 0, obj_province) {
		sprite_index = spr_c_aunis
		angle = -90
		x_offset = 35
		y_offset = -4
		prov_id = 39
	}
	with instance_create_depth(565, 1065, 0, obj_province) {
		sprite_index = spr_c_saintonge
		angle = -50
		x_offset = 20
		y_offset = 8
		prov_id = 40
	}
	with instance_create_depth(676, 1082, 0, obj_province) {
		sprite_index = spr_c_angoumois
		angle = 15
		y_offset = -22
		x_offset = -8
		prov_id = 41
	}
	with instance_create_depth(861, 987, 0, obj_province) {
		sprite_index = spr_c_la_marche
		prov_id = 42
	}
	with instance_create_depth(880, 1121, 0, obj_province) {
		sprite_index = spr_c_limousin
		y_offset = -25
		x_offset = -10
		prov_id = 43
	}
	with instance_create_depth(1044, 1077, 0, obj_province) {
		sprite_index = spr_c_basse_auvergne
		angle = -45
		x_offset = 14
		y_offset = -5
		prov_id = 44
	}
	with instance_create_depth(998, 1199, 0, obj_province) {
		sprite_index = spr_c_haute_auvergne
		angle = 20
		y_offset = -20
		x_offset = -4
		prov_id = 45
	}
	with instance_create_depth(1159, 723, 0, obj_province) {
		sprite_index = spr_c_auxois
		y_offset = -10
		prov_id = 46
	}
	with instance_create_depth(1233, 790, 0, obj_province) {
		sprite_index = spr_c_dijonnais
		prov_id = 47
	}
	with instance_create_depth(1203, 911, 0, obj_province) {
		sprite_index = spr_c_bourgogne_sud
		y_offset = -50
		x_offset = 27
		angle = -14
		prov_id = 48
	}
	with instance_create_depth(1173, 926, 0, obj_province) {
		sprite_index = spr_c_charolais
		angle = 68
		y_offset = -5
		x_offset = -10
		prov_id = 49
	}
	with instance_create_depth(1212, 1060, 0, obj_province) {
		sprite_index = spr_c_lyonnais
		x_offset = -20
		y_offset = -28
		prov_id = 50
	}
	with instance_create_depth(557, 1165, 0, obj_province) {
		sprite_index = spr_c_bordeaux
		prov_id = 51
	}
	with instance_create_depth(552, 1274, 0, obj_province) {
		sprite_index = spr_c_bazadois
		y_offset = -20
		prov_id = 52
	}
	with instance_create_depth(724, 1262, 0, obj_province) {
		sprite_index = spr_c_cahorsin
		y_offset = -20
		prov_id = 53
	}
	with instance_create_depth(770, 1147, 0, obj_province) {
		sprite_index = spr_c_perigord
		x_offset = -20
		prov_id = 54
	}
	with instance_create_depth(940, 1314, 0, obj_province) {
		sprite_index = spr_c_villefranchois
		y_offset = -26
		prov_id = 55
	}
	with instance_create_depth(892, 1418, 0, obj_province) {
		sprite_index = spr_c_toulousain
		angle = 30
		y_offset = -28
		x_offset = -13
		prov_id = 56
	}
	with instance_create_depth(951, 1513, 0, obj_province) {
		sprite_index = spr_c_narbonnais
		prov_id = 57
	}
	with instance_create_depth(1098, 1456, 0, obj_province) {
		sprite_index = spr_c_montpellierain
		angle = 29
		x_offset = -8
		y_offset = -8
		prov_id = 58
	}
	with instance_create_depth(1157, 1388, 0, obj_province) {
		sprite_index = spr_c_nimois
		y_offset = -35
		prov_id = 59
	}
	with instance_create_depth(1097, 1263, 0, obj_province) {
		sprite_index = spr_c_gevaudan
		x_offset = -8
		y_offset = -14
		prov_id = 60
	}
	with instance_create_depth(1177, 1220, 0, obj_province) {
		sprite_index = spr_c_vivarais
		x_offset = 25
		y_offset = -20
		prov_id = 61
	}
	with instance_create_depth(1291, 1348, 0, obj_province) {
		sprite_index = spr_c_avignon
		angle = -50
		x_offset = 5
		prov_id = 62
	}
	with instance_create_depth(856, 1549, 0, obj_province) {
		sprite_index = spr_c_foix
		angle = -70
		x_offset = -6
		prov_id = 69
	}
	with instance_create_depth(1323, 1272, 0, obj_province) {
		sprite_index = spr_c_valentinois
		angle = -60
		x_offset = 16
		prov_id = 63
	}
	with instance_create_depth(1345, 1132, 0, obj_province) {
		sprite_index = spr_c_gresivaudan
		prov_id = 64
	}
	with instance_create_depth(1454, 1247, 0, obj_province) {
		sprite_index = spr_c_brianconnais
		y_offset = -15
		prov_id = 65
	}
	with instance_create_depth(1265, 1444, 0, obj_province) {
		sprite_index = spr_c_arles
		y_offset = -10
		x_offset = 5
		angle = 10
		prov_id = 66
	}
	with instance_create_depth(1367, 1480, 0, obj_province) {
		sprite_index = spr_c_aix
		y_offset = -22
		prov_id = 67
	}
	with instance_create_depth(1493, 1471, 0, obj_province) {
		sprite_index = spr_c_toulonnais
		angle = 50
		y_offset = -30
		x_offset = 20
		prov_id = 68
	}
	with instance_create_depth(1364, 1364, 0, obj_province) {
		sprite_index = spr_c_forcalquieren
		angle = 45
		prov_id = 76
	}
	with instance_create_depth(1459, 1345, 0, obj_province) {
		sprite_index = spr_c_dignois
		y_offset = 10
		x_offset = 5
		prov_id = 77
	}
	with instance_create_depth(677, 1329, 0, obj_province) {
		sprite_index = spr_c_gabardan
		y_offset = 8
		prov_id = 78
	}
	with instance_create_depth(474, 1429, 0, obj_province) {
		sprite_index = spr_c_labourd
		angle = 65
		x_offset = -10
		y_offset = -4
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
		y_offset = -14
		prov_id = 74
	}

	
	with obj_province {
		image_colour = tag_fetch_colour(global.provinces[prov_id][6])
	}
}

function map_province_owner(province) {
	// Finds the owning tag of the specified province
	//show_debug_message(province)
	return global.provinces[province][6]
}

function map_province_development(province) {
	// Totals the Tax, Production and Manpower of a provinvce and returns it
	var dev = global.provinces[province][1] + global.provinces[province][2] + global.provinces[province][3]
	return dev
}

function map_province_is_adjacent(prov1, prov2) {
	// Determines whether or not two provinces are adjacent to each other
	
	var adj_list
	
	switch prov1 {
		case 0:
			adj_list = [1, 2]
			break
		case 1:
			adj_list = [0, 2, 3]
			break
		case 2:
			adj_list = [0, 1, 3, 4, 5, 14, 16]
			break
		case 3:
			adj_list = [1, 2, 4]
			break
		case 4:
			adj_list = [2, 3, 16, 38]
			break
		case 5:
			adj_list = [2, 7, 6, 14]
			break
		case 6:
			adj_list = [5, 7, 8]
			break
		case 7:
			adj_list = [5, 6, 8, 14, 15]
			break
		case 8:
			adj_list = [6, 7, 9, 15, 22, 23]
			break
		case 9:
			adj_list = [8, 11, 12, 25]
			break
		case 10:
			adj_list = [11]
			break
		case 11:
			adj_list = [9, 10, 12, 13] 
			break
		case 12:
			adj_list = [9, 11, 13, 25, 26]
			break
		case 13:
			adj_list = [11, 12, 26, 27, 28]
			break
		case 14:
			adj_list = [2, 5, 7, 15, 16]
			break
		case 15:
			adj_list = [7, 8, 14, 16, 17, 18, 22]
			break
		case 16:
			adj_list = [2, 4, 14, 15, 17, 37, 38]
			break
		case 17:
			adj_list = [15, 16, 18, 19, 33, 37, 42]
			break
		case 18:
			adj_list = [15, 17, 19, 20, 22]
			break
		case 19:
			adj_list = [17, 18, 20, 21, 33, 34]
			break
		case 20:
			adj_list = [18, 19, 21, 22, 24, 75]
			break
		case 21:
			adj_list = [19, 20, 32, 34, 36, 46]
			break
		case 22:
			adj_list = [8, 15, 18, 20, 23, 24]
			break
		case 23:
			adj_list = [8, 22, 24, 25]
			break
		case 24:
			adj_list = [20, 22, 23, 25, 26, 29, 75]
			break
		case 25:
			adj_list = [9, 12, 23, 24, 26]
			break
		case 26:
			adj_list = [12, 13, 24, 25, 27, 29]
			break
		case 27:
			adj_list = [13, 26, 28, 29]
			break
		case 28:
			adj_list = [13, 27, 29, 30, 31]
			break
		case 29:
			adj_list = [24, 26, 27, 28, 30, 32, 75]
			break
		case 30:
			adj_list = [28, 29, 31, 32, 46]
			break
		case 31:
			adj_list = [28, 30, 46, 47]
			break
		case 32:
			adj_list = [21, 29, 30, 46, 75]
			break
		case 33:
			adj_list = [17, 19, 34, 35, 42, 44]
			break
		case 34:
			adj_list = [19, 21, 33, 35, 36]
			break
		case 35:
			adj_list = [33, 34, 36, 44, 48, 49, 50]
			break
		case 36:
			adj_list = [21, 34, 35, 46, 47, 48]
			break
		case 37:
			adj_list = [16, 17, 38, 40, 41, 42, 43]
			break
		case 38:
			adj_list = [4, 16, 37, 39, 40]
			break
		case 39:
			adj_list = [38, 40]
			break
		case 40:
			adj_list = [37, 38, 39, 41, 51, 53]
			break
		case 41:
			adj_list = [37, 40, 43, 54, 53]
			break
		case 42:
			adj_list = [17, 33, 37, 43, 44]
			break
		case 43:
			adj_list = [37, 41, 42, 44, 45, 54, 55]
			break
		case 44:
			adj_list = [33, 35, 42, 43, 45, 50, 61]
			break
		case 45:
			adj_list = [43, 44, 55, 60]
			break
		case 46:
			adj_list = [21, 32, 30, 31, 36, 47]
			break
		case 47:
			adj_list = [31, 36, 46, 48]
			break
		case 48:
			adj_list = [35, 36, 47, 49, 50]
			break
		case 49:
			adj_list = [35, 48]
			break
		case 50:
			adj_list = [35, 44, 48, 61, 64]
			break
		case 51:
			adj_list = [40, 52, 53]
			break
		case 52:
			adj_list = [51, 53, 71, 78]
			break
		case 53:
			adj_list = [40, 41, 51, 52, 54, 55, 72, 78]
			break
		case 54:
			adj_list = [41, 43, 53, 55]
			break
		case 55:
			adj_list = [43, 45, 54, 53, 56, 57, 58, 59, 60, 72]
			break
		case 56:
			adj_list = [55, 57, 69, 72]
			break
		case 57:
			adj_list = [55, 56, 58, 69]
			break
		case 58:
			adj_list = [55, 57, 59]
			break
		case 59:
			adj_list = [55, 58, 60, 61, 62, 66]
			break
		case 60:
			adj_list = [45, 55, 59, 61]
			break
		case 61:
			adj_list = [44, 50, 59, 60, 63, 64]
			break
		case 62:
			adj_list = [59, 63, 66, 76]
			break
		case 63:
			adj_list = [61, 62, 64, 65, 76]
			break
		case 64:
			adj_list = [50, 61, 63, 65]
			break
		case 65:
			adj_list = [63, 64, 76, 77]
			break
		case 66:
			adj_list = [59, 62, 67, 76]
			break
		case 67:
			adj_list = [66, 76, 77, 68]
			break
		case 68:
			adj_list = [67, 77]
			break
		case 69:
			adj_list = [56, 57, 72, 73]
			break
		case 70:
			adj_list = [71, 74]
			break
		case 71:
			adj_list = [52, 70, 72, 74, 78]
			break
		case 72:
			adj_list = [53, 55, 56, 69, 71, 73, 74, 78]
			break
		case 73:
			adj_list = [69, 72, 74]
			break
		case 74:
			adj_list = [70, 71, 72, 73]
			break
		case 75:
			adj_list = [20, 24, 29, 32]
			break
		case 76:
			adj_list = [62, 63, 65, 66, 67, 77]
			break
		case 77:
			adj_list = [65, 67, 68, 76]
			break
		case 78:
			adj_list = [52, 53, 71, 72]
			break
	}
	
	for (var i = 0; i < array_length(adj_list); i ++) {
		if adj_list[i] == prov2 {
			return true
			break
		}
	}
	
	return false
}

function map_province_get_adjacent(prov1, tag) {
	// Returns the id of a random adjacent province, prioritises owned tags
	
	var adj_list
	
	switch prov1 {
		case 0:
			adj_list = [1, 2]
			break
		case 1:
			adj_list = [0, 2, 3]
			break
		case 2:
			adj_list = [0, 1, 3, 4, 5, 14, 16]
			break
		case 3:
			adj_list = [1, 2, 4]
			break
		case 4:
			adj_list = [2, 3, 16, 38]
			break
		case 5:
			adj_list = [2, 7, 6, 14]
			break
		case 6:
			adj_list = [5, 7, 8]
			break
		case 7:
			adj_list = [5, 6, 8, 14, 15]
			break
		case 8:
			adj_list = [6, 7, 9, 15, 22, 23]
			break
		case 9:
			adj_list = [8, 11, 12, 25]
			break
		case 10:
			adj_list = [11]
			break
		case 11:
			adj_list = [9, 10, 12, 13] 
			break
		case 12:
			adj_list = [9, 11, 13, 25, 26]
			break
		case 13:
			adj_list = [11, 12, 26, 27, 28]
			break
		case 14:
			adj_list = [2, 5, 7, 15, 16]
			break
		case 15:
			adj_list = [7, 8, 14, 16, 17, 18, 22]
			break
		case 16:
			adj_list = [2, 4, 14, 15, 17, 37, 38]
			break
		case 17:
			adj_list = [15, 16, 18, 19, 33, 37, 42]
			break
		case 18:
			adj_list = [15, 17, 19, 20, 22]
			break
		case 19:
			adj_list = [17, 18, 20, 21, 33, 34]
			break
		case 20:
			adj_list = [18, 19, 21, 22, 24, 75]
			break
		case 21:
			adj_list = [19, 20, 32, 34, 36, 46]
			break
		case 22:
			adj_list = [8, 15, 18, 20, 23, 24]
			break
		case 23:
			adj_list = [8, 22, 24, 25]
			break
		case 24:
			adj_list = [20, 22, 23, 25, 26, 29, 75]
			break
		case 25:
			adj_list = [9, 12, 23, 24, 26]
			break
		case 26:
			adj_list = [12, 13, 24, 25, 27, 29]
			break
		case 27:
			adj_list = [13, 26, 28, 29]
			break
		case 28:
			adj_list = [13, 27, 29, 30, 31]
			break
		case 29:
			adj_list = [24, 26, 27, 28, 30, 32, 75]
			break
		case 30:
			adj_list = [28, 29, 31, 32, 46]
			break
		case 31:
			adj_list = [28, 30, 46, 47]
			break
		case 32:
			adj_list = [21, 29, 30, 46, 75]
			break
		case 33:
			adj_list = [17, 19, 34, 35, 42, 44]
			break
		case 34:
			adj_list = [19, 21, 33, 35, 36]
			break
		case 35:
			adj_list = [33, 34, 36, 44, 48, 49, 50]
			break
		case 36:
			adj_list = [21, 34, 35, 46, 47, 48]
			break
		case 37:
			adj_list = [16, 17, 38, 40, 41, 42, 43]
			break
		case 38:
			adj_list = [4, 16, 37, 39, 40]
			break
		case 39:
			adj_list = [38, 40]
			break
		case 40:
			adj_list = [37, 38, 39, 41, 51, 53]
			break
		case 41:
			adj_list = [37, 40, 43, 54, 53]
			break
		case 42:
			adj_list = [17, 33, 37, 43, 44]
			break
		case 43:
			adj_list = [37, 41, 42, 44, 45, 54, 55]
			break
		case 44:
			adj_list = [33, 35, 42, 43, 45, 50, 61]
			break
		case 45:
			adj_list = [43, 44, 55, 60]
			break
		case 46:
			adj_list = [21, 32, 30, 31, 36, 47]
			break
		case 47:
			adj_list = [31, 36, 46, 48]
			break
		case 48:
			adj_list = [35, 36, 47, 49, 50]
			break
		case 49:
			adj_list = [35, 48]
			break
		case 50:
			adj_list = [35, 44, 48, 61, 64]
			break
		case 51:
			adj_list = [40, 52, 53]
			break
		case 52:
			adj_list = [51, 53, 71, 78]
			break
		case 53:
			adj_list = [40, 41, 51, 52, 54, 55, 72, 78]
			break
		case 54:
			adj_list = [41, 43, 53, 55]
			break
		case 55:
			adj_list = [43, 45, 54, 53, 56, 57, 58, 59, 60, 72]
			break
		case 56:
			adj_list = [55, 57, 69, 72]
			break
		case 57:
			adj_list = [55, 56, 58, 69]
			break
		case 58:
			adj_list = [55, 57, 59]
			break
		case 59:
			adj_list = [55, 58, 60, 61, 62, 66]
			break
		case 60:
			adj_list = [45, 55, 59, 61]
			break
		case 61:
			adj_list = [44, 50, 59, 60, 63, 64]
			break
		case 62:
			adj_list = [59, 63, 66, 76]
			break
		case 63:
			adj_list = [61, 62, 64, 65, 76]
			break
		case 64:
			adj_list = [50, 61, 63, 65]
			break
		case 65:
			adj_list = [63, 64, 76, 77]
			break
		case 66:
			adj_list = [59, 62, 67, 76]
			break
		case 67:
			adj_list = [66, 76, 77, 68]
			break
		case 68:
			adj_list = [67, 77]
			break
		case 69:
			adj_list = [56, 57, 72, 73]
			break
		case 70:
			adj_list = [71, 74]
			break
		case 71:
			adj_list = [52, 70, 72, 74, 78]
			break
		case 72:
			adj_list = [53, 55, 56, 69, 71, 73, 74, 78]
			break
		case 73:
			adj_list = [69, 72, 74]
			break
		case 74:
			adj_list = [70, 71, 72, 73]
			break
		case 75:
			adj_list = [20, 24, 29, 32]
			break
		case 76:
			adj_list = [62, 63, 65, 66, 67, 77]
			break
		case 77:
			adj_list = [65, 67, 68, 76]
			break
		case 78:
			adj_list = [52, 53, 71, 72]
			break
	}
	
	for (var i = 0; i < array_length(adj_list); i ++) {
		if global.provinces[adj_list[i]][6] == tag {
			return adj_list[i]
			break
		}
	}
	
	return adj_list[irandom_range(0, array_length(adj_list)-1)]
}

function map_province_get_adjacent_list(prov1) {
	// Returns the id of a random adjacent province, prioritises owned tags
	
	var adj_list = []
	
	switch prov1 {
		case 0:
			adj_list = [1, 2]
			break
		case 1:
			adj_list = [0, 2, 3]
			break
		case 2:
			adj_list = [0, 1, 3, 4, 5, 14, 16]
			break
		case 3:
			adj_list = [1, 2, 4]
			break
		case 4:
			adj_list = [2, 3, 16, 38]
			break
		case 5:
			adj_list = [2, 7, 6, 14]
			break
		case 6:
			adj_list = [5, 7, 8]
			break
		case 7:
			adj_list = [5, 6, 8, 14, 15]
			break
		case 8:
			adj_list = [6, 7, 9, 15, 22, 23]
			break
		case 9:
			adj_list = [8, 11, 12, 25]
			break
		case 10:
			adj_list = [11]
			break
		case 11:
			adj_list = [9, 10, 12, 13] 
			break
		case 12:
			adj_list = [9, 11, 13, 25, 26]
			break
		case 13:
			adj_list = [11, 12, 26, 27, 28]
			break
		case 14:
			adj_list = [2, 5, 7, 15, 16]
			break
		case 15:
			adj_list = [7, 8, 14, 16, 17, 18, 22]
			break
		case 16:
			adj_list = [2, 4, 14, 15, 17, 37, 38]
			break
		case 17:
			adj_list = [15, 16, 18, 19, 33, 37, 42]
			break
		case 18:
			adj_list = [15, 17, 19, 20, 22]
			break
		case 19:
			adj_list = [17, 18, 20, 21, 33, 34]
			break
		case 20:
			adj_list = [18, 19, 21, 22, 24, 75]
			break
		case 21:
			adj_list = [19, 20, 32, 34, 36, 46]
			break
		case 22:
			adj_list = [8, 15, 18, 20, 23, 24]
			break
		case 23:
			adj_list = [8, 22, 24, 25]
			break
		case 24:
			adj_list = [20, 22, 23, 25, 26, 29, 75]
			break
		case 25:
			adj_list = [9, 12, 23, 24, 26]
			break
		case 26:
			adj_list = [12, 13, 24, 25, 27, 29]
			break
		case 27:
			adj_list = [13, 26, 28, 29]
			break
		case 28:
			adj_list = [13, 27, 29, 30, 31]
			break
		case 29:
			adj_list = [24, 26, 27, 28, 30, 32, 75]
			break
		case 30:
			adj_list = [28, 29, 31, 32, 46]
			break
		case 31:
			adj_list = [28, 30, 46, 47]
			break
		case 32:
			adj_list = [21, 29, 30, 46, 75]
			break
		case 33:
			adj_list = [17, 19, 34, 35, 42, 44]
			break
		case 34:
			adj_list = [19, 21, 33, 35, 36]
			break
		case 35:
			adj_list = [33, 34, 36, 44, 48, 49, 50]
			break
		case 36:
			adj_list = [21, 34, 35, 46, 47, 48]
			break
		case 37:
			adj_list = [16, 17, 38, 40, 41, 42, 43]
			break
		case 38:
			adj_list = [4, 16, 37, 39, 40]
			break
		case 39:
			adj_list = [38, 40]
			break
		case 40:
			adj_list = [37, 38, 39, 41, 51, 53]
			break
		case 41:
			adj_list = [37, 40, 43, 54, 53]
			break
		case 42:
			adj_list = [17, 33, 37, 43, 44]
			break
		case 43:
			adj_list = [37, 41, 42, 44, 45, 54, 55]
			break
		case 44:
			adj_list = [33, 35, 42, 43, 45, 50, 61]
			break
		case 45:
			adj_list = [43, 44, 55, 60]
			break
		case 46:
			adj_list = [21, 32, 30, 31, 36, 47]
			break
		case 47:
			adj_list = [31, 36, 46, 48]
			break
		case 48:
			adj_list = [35, 36, 47, 49, 50]
			break
		case 49:
			adj_list = [35, 48]
			break
		case 50:
			adj_list = [35, 44, 48, 61, 64]
			break
		case 51:
			adj_list = [40, 52, 53]
			break
		case 52:
			adj_list = [51, 53, 71, 78]
			break
		case 53:
			adj_list = [40, 41, 51, 52, 54, 55, 72, 78]
			break
		case 54:
			adj_list = [41, 43, 53, 55]
			break
		case 55:
			adj_list = [43, 45, 54, 53, 56, 57, 58, 59, 60, 72]
			break
		case 56:
			adj_list = [55, 57, 69, 72]
			break
		case 57:
			adj_list = [55, 56, 58, 69]
			break
		case 58:
			adj_list = [55, 57, 59]
			break
		case 59:
			adj_list = [55, 58, 60, 61, 62, 66]
			break
		case 60:
			adj_list = [45, 55, 59, 61]
			break
		case 61:
			adj_list = [44, 50, 59, 60, 63, 64]
			break
		case 62:
			adj_list = [59, 63, 66, 76]
			break
		case 63:
			adj_list = [61, 62, 64, 65, 76]
			break
		case 64:
			adj_list = [50, 61, 63, 65]
			break
		case 65:
			adj_list = [63, 64, 76, 77]
			break
		case 66:
			adj_list = [59, 62, 67, 76]
			break
		case 67:
			adj_list = [66, 76, 77, 68]
			break
		case 68:
			adj_list = [67, 77]
			break
		case 69:
			adj_list = [56, 57, 72, 73]
			break
		case 70:
			adj_list = [71, 74]
			break
		case 71:
			adj_list = [52, 70, 72, 74, 78]
			break
		case 72:
			adj_list = [53, 55, 56, 69, 71, 73, 74, 78]
			break
		case 73:
			adj_list = [69, 72, 74]
			break
		case 74:
			adj_list = [70, 71, 72, 73]
			break
		case 75:
			adj_list = [20, 24, 29, 32]
			break
		case 76:
			adj_list = [62, 63, 65, 66, 67, 77]
			break
		case 77:
			adj_list = [65, 67, 68, 76]
			break
		case 78:
			adj_list = [52, 53, 71, 72]
			break
	}

	return adj_list
}

function find_adjacent_armies(prov1, tag) {
	// Checks ajacent provinces for friendly armies
	
	var adj_list
	
	switch prov1 {
		case 0:
			adj_list = [1, 2]
			break
		case 1:
			adj_list = [0, 2, 3]
			break
		case 2:
			adj_list = [0, 1, 3, 4, 5, 14, 16]
			break
		case 3:
			adj_list = [1, 2, 4]
			break
		case 4:
			adj_list = [2, 3, 16, 38]
			break
		case 5:
			adj_list = [2, 7, 6, 14]
			break
		case 6:
			adj_list = [5, 7, 8]
			break
		case 7:
			adj_list = [5, 6, 8, 14, 15]
			break
		case 8:
			adj_list = [6, 7, 9, 15, 22, 23]
			break
		case 9:
			adj_list = [8, 11, 12, 25]
			break
		case 10:
			adj_list = [11]
			break
		case 11:
			adj_list = [9, 10, 12, 13] 
			break
		case 12:
			adj_list = [9, 11, 13, 25, 26]
			break
		case 13:
			adj_list = [11, 12, 26, 27, 28]
			break
		case 14:
			adj_list = [2, 5, 7, 15, 16]
			break
		case 15:
			adj_list = [7, 8, 14, 16, 17, 18, 22]
			break
		case 16:
			adj_list = [2, 4, 14, 15, 17, 37, 38]
			break
		case 17:
			adj_list = [15, 16, 18, 19, 33, 37, 42]
			break
		case 18:
			adj_list = [15, 17, 19, 20, 22]
			break
		case 19:
			adj_list = [17, 18, 20, 21, 33, 34]
			break
		case 20:
			adj_list = [18, 19, 21, 22, 24, 75]
			break
		case 21:
			adj_list = [19, 20, 32, 34, 36, 46]
			break
		case 22:
			adj_list = [8, 15, 18, 20, 23, 24]
			break
		case 23:
			adj_list = [8, 22, 24, 25]
			break
		case 24:
			adj_list = [20, 22, 23, 25, 26, 29, 75]
			break
		case 25:
			adj_list = [9, 12, 23, 24, 26]
			break
		case 26:
			adj_list = [12, 13, 24, 25, 27, 29]
			break
		case 27:
			adj_list = [13, 26, 28, 29]
			break
		case 28:
			adj_list = [13, 27, 29, 30, 31]
			break
		case 29:
			adj_list = [24, 26, 27, 28, 30, 32, 75]
			break
		case 30:
			adj_list = [28, 29, 31, 32, 46]
			break
		case 31:
			adj_list = [28, 30, 46, 47]
			break
		case 32:
			adj_list = [21, 29, 30, 46, 75]
			break
		case 33:
			adj_list = [17, 19, 34, 35, 42, 44]
			break
		case 34:
			adj_list = [19, 21, 33, 35, 36]
			break
		case 35:
			adj_list = [33, 34, 36, 44, 48, 49, 50]
			break
		case 36:
			adj_list = [21, 34, 35, 46, 47, 48]
			break
		case 37:
			adj_list = [16, 17, 38, 40, 41, 42, 43]
			break
		case 38:
			adj_list = [4, 16, 37, 39, 40]
			break
		case 39:
			adj_list = [38, 40]
			break
		case 40:
			adj_list = [37, 38, 39, 41, 51, 53]
			break
		case 41:
			adj_list = [37, 40, 43, 54, 53]
			break
		case 42:
			adj_list = [17, 33, 37, 43, 44]
			break
		case 43:
			adj_list = [37, 41, 42, 44, 45, 54, 55]
			break
		case 44:
			adj_list = [33, 35, 42, 43, 45, 50, 61]
			break
		case 45:
			adj_list = [43, 44, 55, 60]
			break
		case 46:
			adj_list = [21, 32, 30, 31, 36, 47]
			break
		case 47:
			adj_list = [31, 36, 46, 48]
			break
		case 48:
			adj_list = [35, 36, 47, 49, 50]
			break
		case 49:
			adj_list = [35, 48]
			break
		case 50:
			adj_list = [35, 44, 48, 61, 64]
			break
		case 51:
			adj_list = [40, 52, 53]
			break
		case 52:
			adj_list = [51, 53, 71, 78]
			break
		case 53:
			adj_list = [40, 41, 51, 52, 54, 55, 72, 78]
			break
		case 54:
			adj_list = [41, 43, 53, 55]
			break
		case 55:
			adj_list = [43, 45, 54, 53, 56, 57, 58, 59, 60, 72]
			break
		case 56:
			adj_list = [55, 57, 69, 72]
			break
		case 57:
			adj_list = [55, 56, 58, 69]
			break
		case 58:
			adj_list = [55, 57, 59]
			break
		case 59:
			adj_list = [55, 58, 60, 61, 62, 66]
			break
		case 60:
			adj_list = [45, 55, 59, 61]
			break
		case 61:
			adj_list = [44, 50, 59, 60, 63, 64]
			break
		case 62:
			adj_list = [59, 63, 66, 76]
			break
		case 63:
			adj_list = [61, 62, 64, 65, 76]
			break
		case 64:
			adj_list = [50, 61, 63, 65]
			break
		case 65:
			adj_list = [63, 64, 76, 77]
			break
		case 66:
			adj_list = [59, 62, 67, 76]
			break
		case 67:
			adj_list = [66, 76, 77, 68]
			break
		case 68:
			adj_list = [67, 77]
			break
		case 69:
			adj_list = [56, 57, 72, 73]
			break
		case 70:
			adj_list = [71, 74]
			break
		case 71:
			adj_list = [52, 70, 72, 74, 78]
			break
		case 72:
			adj_list = [53, 55, 56, 69, 71, 73, 74, 78]
			break
		case 73:
			adj_list = [69, 72, 74]
			break
		case 74:
			adj_list = [70, 71, 72, 73]
			break
		case 75:
			adj_list = [20, 24, 29, 32]
			break
		case 76:
			adj_list = [62, 63, 65, 66, 67, 77]
			break
		case 77:
			adj_list = [65, 67, 68, 76]
			break
		case 78:
			adj_list = [52, 53, 71, 72]
			break
	}
	
	var units_to_merge = []
	
	for (var i = 0; i < array_length(adj_list); i ++) {
		with obj_province {
			if adj_list[i] == prov_id && unit_in_prov != noone {
				if unit_in_prov.tag_id == tag_fetch_id(tag) {
					array_push(units_to_merge, unit_in_prov)
				}
			}
		}
	}
	
	if array_length(units_to_merge) == 0 {
		return noone	
	} else {
		return units_to_merge
	}
}

function map_province_own(prov, tag) {
	// changes the owner of a province
	global.provinces[prov][6] = tag
}

function map_list_provselect(tag) {
	// lists all provinces owned by a certain tag in a scroll menu
	var y_offset = 252
	obj_control.prov_select = true // enable prov select menu
	
	for (var i = 0; i < array_length(global.provinces); i ++) {
		if global.provinces[i][6] == tag && i != 24 {
			//array_push(prov_list, global.provinces[i][6]) // Add owned ids to list
			
			if obj_control.prov_select_purpose != "BuildArmy" || (obj_control.prov_select_purpose == "BuildArmy" && global.provinces[i][9].unit_in_prov == noone) {
				var new_button = instance_create_depth(717, y_offset, -10, obj_button)
				with new_button	{
					sprite_index = spr_rectlarge_button
					type = "ProvSelect"
					prov_to_select = i
				}
			
				y_offset += 64
			}
		}
	}
	
	//return prov_list
	
}

function map_find_owned_list(tag) {
	// lists all provinces owned by a certain tag and returns a list
	var prov_list = []
	
	for (var i = 0; i < array_length(global.provinces); i ++) {
		if global.provinces[i][6] == tag {
			array_push(prov_list, i)
		}
	}
	
	return prov_list
	
}

function map_damage_random(tag) {
	var owned = map_find_owned_list(tag)
	if array_length(owned) > 1 {
		var rand_id = owned[irandom_range(0, array_length(owned)-1)]
	} else {
		var rand_id = owned[0]
	}
	var rand_val = choose(1, 2, 3)
	
	print("Damaging " + global.provinces[rand_id][0] + " owned by " + tag)
	
	global.provinces[rand_id][rand_val] -= 2
	if global.provinces[rand_id][rand_val] <= 0 {
		global.provinces[rand_id][rand_val] = 1
	}
	
	return string("province of " + global.provinces[rand_id][0] + " owned by " + global.tags[tag_fetch_id(tag)][1])
}
