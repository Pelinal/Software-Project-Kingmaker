// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function tag_init() {
	// List of Country Tags
	// Index 0: Tag, Index 1: Name, Index 2: Adjective, Index 4: English Name, Index 5: Rank
	global.tags[0] = ["BRE", "Bretagne", "Breton", "Brittany", "Duchy"]
	global.tags[1] = ["NOR", "Normandie", "Norman", "Normandy", "Duchy"]
	global.tags[2] = ["PIC", "Picardie", "Picard", "Picardy", "Duchy"]
	global.tags[3] = ["MAI", "Maine", "Mainer", "Maine", "County"]
	global.tags[4] = ["ANJ", "Anjou", "Angevin", "Anjou", "County"]
	global.tags[5] = ["TOU", "Touraine", "Tourangeau", "Touraine", "County"]
	global.tags[6] = ["ORL", "Orléanais", "Orléanaise", "Orléanais", "Duchy"]
	global.tags[7] = ["FRA", "France", "Royal", "France", "Kingdom"]
	global.tags[8] = ["CHA", "Champagne", "Champagne", "Champagne", "Duchy"]
	global.tags[9] = ["BER", "Berry", "Berrichon", "Berry", "County"]
	global.tags[10] = ["BOU", "Bourbonnais", "Bourbon", "Bourbon", "County"]
	global.tags[11] = ["NIV", "Nivernais", "Nivernaise", "Nivernais", "County"]
	global.tags[12] = ["POI", "Poitou", "Poitevin", "Poitou", "Duchy"]
	global.tags[13] = ["AUN", "Aunis", "Aunisian", "Aunis", "County"]
	global.tags[14] = ["SAI", "Saintonge", "Saintongeais", "Saintonge", "County"]
	global.tags[15] = ["ANG", "Angoumois", "Angoumois", "Angoumois", "County"]
	global.tags[16] = ["MAR", "La Marche", "Marcher", "The March", "County"]
	global.tags[17] = ["LIM", "Limousin", "Limousin", "Limousin", "County"]
	global.tags[18] = ["AUV", "Auvergne", "Auvergnese", "Auvergne", "Duchy"]
	global.tags[19] = ["BUR", "Bourgogne", "Burgundian", "Burgundy", "Duchy"]
	global.tags[20] = ["SPA", "España", "Spanish", "Spain", "Kingdom"]
	global.tags[21] = ["LYO", "Lyonnais", "Lyonese", "Lyon", "County"]
	global.tags[22] = ["GUY", "Guyenne", "Guyennese", "Guyenne", "Duchy"]
	global.tags[23] = ["LAN", "Languedoc", "Languedocien", "Languedoc", "Duchy"]
	global.tags[24] = ["PAP", "Stato Pontifico", "Papal", "Papal States", "Papacy"]
	global.tags[25] = ["DAU", "Dauphine", "Dauphin", "Dauphine", "Duchy"]
	global.tags[26] = ["PRO", "Provence", "Provençal", "Provence", "Duchy"]
	global.tags[27] = ["FOI", "Foix", "Fuxéen", "Foix", "County"]
	global.tags[28] = ["GAS", "Gascogne", "Gascon", "Gascony", "Duchy"]
	global.tags[29] = ["BEA", "Béarn", "Béarnais", "Béarn", "County"]
}

function tag_fetch_colour(tag) {
	switch tag {
		case "BRE":
			new_colour = make_colour_rgb(144, 112, 110)
			return new_colour
		case "NOR":
			new_colour = make_colour_rgb(220, 20, 45)
			return new_colour
		case "PIC":
			new_colour = make_colour_rgb(200, 155, 45)
			return new_colour
		case "MAI":
			new_colour = make_colour_rgb(200, 50, 45)
			return new_colour
		case "ANJ":
			new_colour = make_colour_rgb(95, 35, 105)
			return new_colour
		case "TOU":
			new_colour = make_colour_rgb(95, 125, 165)
			return new_colour
		case "ORL":
			new_colour = make_colour_rgb(95, 70, 180)
			return new_colour
		case "FRA":
			new_colour = make_colour_rgb(20, 80, 230)
			return new_colour
		case "CHA":
			new_colour = make_colour_rgb(200, 50, 135)
			return new_colour
		case "BER":
			new_colour = make_colour_rgb(235, 90, 235)
			return new_colour
		case "BOU":
			new_colour = make_colour_rgb(140, 140, 230)
			return new_colour
		case "NIV":
			new_colour = make_colour_rgb(20, 215, 105)
			return new_colour
		case "POI":
			new_colour = make_colour_rgb(105, 215, 105)
			return new_colour
		case "AUN":
			new_colour = make_colour_rgb(225, 40, 40)
			return new_colour
		case "SAI":
			new_colour = make_colour_rgb(225, 160, 160)
			return new_colour
		case "ANG":
			new_colour = make_colour_rgb(235, 90, 235)
			return new_colour
		case "MAR":
			new_colour = make_colour_rgb(230, 75, 55)
			return new_colour
		case "LIM":
			new_colour = make_colour_rgb(155, 40, 205)
			return new_colour
		case "AUV":
			new_colour = make_colour_rgb(225, 145, 40)
			return new_colour
		case "BUR":
			new_colour = make_colour_rgb(225, 20, 80)
			return new_colour
		case "SPA":
			new_colour = make_colour_rgb(225, 150, 60)
			return new_colour
		case "LYO":
			new_colour = make_colour_rgb(225, 100, 100)
			return new_colour
		case "GUY":
			new_colour = make_colour_rgb(225, 165, 115)
			return new_colour
		case "LAN":
			new_colour = make_colour_rgb(155, 100, 180)
			return new_colour
		case "PAP":
			new_colour = make_colour_rgb(225, 225, 225)
			return new_colour
		case "DAU":
			new_colour = make_colour_rgb(225, 115, 225)
			return new_colour
		case "PRO":
			new_colour = make_colour_rgb(155, 175, 65)
			return new_colour
		case "FOI":
			new_colour = make_colour_rgb(235, 70, 20)
			return new_colour
		case "GAS":
			new_colour = make_colour_rgb(220, 20, 170)
			return new_colour
		case "BEA":
			new_colour = make_colour_rgb(70, 185, 20)
			return new_colour
		
		default:
			return c_white
	}
}
function tag_fetch_id(tag) {
	// Takes TAG input and returns corresponding id in global.tags list
	for (i = 0; i < array_length(global.tags); i ++) {
		if global.tags[i][0] == tag {
			return i
		}
	}
	
	return 0
}

function economy_init() {
	// List of Economies
	// Index 0: Tag, Index 1: Current Wealth, Index 2: Income, Index 3: Expense, Index 4: Manpower Per Turn, Index 5: Current Manpower,
	// Index 6: Modifier (Income), Index 7: Modifier (Manpower)
	global.economy[0] = ["BRE", 110, 0, 0, 0, 9, 1, 1]
	global.economy[1] = ["NOR", 130, 0, 0, 0, 9, 1, 1]
	global.economy[2] = ["PIC", 120, 0, 0, 0, 10, 1, 1]
	global.economy[3] = ["MAI", 50, 0, 0, 0, 5, 1, 1]
	global.economy[4] = ["ANJ", 30, 0, 0, 0, 3, 1, 1]
	global.economy[5] = ["TOU", 40, 0, 0, 0, 2, 1, 1]
	global.economy[6] = ["ORL", 140, 0, 0, 0, 14, 1, 1]
	global.economy[7] = ["FRA", 310, 0, 0, 0, 29, 1, 1]
	global.economy[8] = ["CHA", 140, 0, 0, 0, 17, 1, 1]
	global.economy[9] = ["BER", 70, 0, 0, 0, 9, 1, 1]
	global.economy[10] = ["BOU", 30, 0, 0, 0, 4, 1, 1]
	global.economy[11] = ["NIV", 20, 0, 0, 0, 4, 1, 1]
	global.economy[12] = ["POI", 70, 0, 0, 0, 8, 1, 1]
	global.economy[13] = ["AUN", 30, 0, 0, 0, 4, 1, 1]
	global.economy[14] = ["SAI", 50, 0, 0, 0, 2, 1, 1]
	global.economy[15] = ["ANG", 50, 0, 0, 0, 4, 1, 1]
	global.economy[16] = ["MAR", 40, 0, 0, 0, 3, 1, 1]
	global.economy[17] = ["LIM", 40, 0, 0, 0, 4, 1, 1]
	global.economy[18] = ["AUV", 70, 0, 0, 0, 7, 1, 1]
	global.economy[19] = ["BUR", 120, 0, 0, 0, 8, 1, 1]
	global.economy[20] = ["SPA", 30, 0, 0, 0, 3, 1, 1]
	global.economy[21] = ["LYO", 100, 0, 0, 0, 8, 1, 1]
	global.economy[22] = ["GUY", 260, 0, 0, 0, 26, 1, 1]
	global.economy[23] = ["LAN", 360, 0, 0, 0, 27, 1, 1]
	global.economy[24] = ["PAP", 1000, 0, 0, 0, 5, 1, 1]
	global.economy[25] = ["DAU", 110, 0, 0, 0, 10, 1, 1]
	global.economy[26] = ["PRO", 230, 0, 0, 0, 13, 1, 1]
	global.economy[27] = ["FOI", 30, 0, 0, 0, 3, 1, 1]
	global.economy[28] = ["GAS", 100, 0, 0, 0, 12, 1, 1]
	global.economy[29] = ["BEA", 40, 0, 0, 0, 3, 1, 1]
	
	// List of Trade Goods
	// Index 0: Name, Index 1: Base Value, Index 3: Manufactory Building
	global.trade_goods[0] = ["Fish", .25, 0]
	global.trade_goods[1] = ["Cloth", .3, 0]
	global.trade_goods[2] = ["Grain", .25, 0]
	global.trade_goods[3] = ["Livestock", .2, 0]
	global.trade_goods[4] = ["Wine", .4, 0]
	global.trade_goods[5] = ["Lumber", .3, 0]
	global.trade_goods[6] = ["Wool", .35, 0]
	global.trade_goods[7] = ["Copper", .3, 0]
	global.trade_goods[8] = ["Iron", .35, 0]
	global.trade_goods[9] = ["Glass", .35, 0]
	global.trade_goods[10] = ["Gold", .5, 0] 
	global.trade_goods[11] = ["Salt", .3, 0]
}

function economy_update() {
	// Updates all economies
	// Update Manpower/Wealth Per Turn
	for (i = 0; i < array_length(global.tags); i ++) {
		global.economy[i][2] = 0
		global.economy[i][4] = 0
		
		for (j = 0; j < array_length(global.provinces); j ++) {
			if global.tags[i][0] == global.provinces[j][6] {
				global.economy[i][2] += (global.provinces[j][1])/4		// Add 1/4 of Base Tax
				global.economy[i][2] += (global.trade_goods[global.provinces[j][4]][1]) * global.provinces[j][3]	// Add Trade Good price times production
				global.economy[i][4] += (global.provinces[j][2])/4		// Add 1/4 of Manpower
			}
		}
		
		global.economy[i][2] *= global.economy[i][6] // Multiply Income by modifier
		global.economy[i][4] *= global.economy[i][7] // Multiply Manpower by modifier
	}
	
	// Update Expenditure
	// Will take into account Army & Building Maintenance + Liege Taxes + Council Payments
}


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
	with instance_create_depth(873, 461, 0, obj_province) {
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
	with instance_create_depth(948, 509, 0, obj_province) {
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
