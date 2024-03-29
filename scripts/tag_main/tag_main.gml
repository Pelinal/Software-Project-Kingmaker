/// @description All functions related to country tags

function tag_init() {
	// List of Country Tags
	// Index 0: Tag, Index 1: Name, Index 2: Adjective, Index 3: English Name, Index 4: Rank, Index 5: Rank Adjective, Index 6: Ruler
	global.tags[0] = ["BRE", "Bretagne", "Breton", "Brittany", "Duchy", "Duke", 2]
	global.tags[1] = ["NOR", "Normandie", "Norman", "Normandy", "Duchy", "Duke", 3]
	global.tags[2] = ["PIC", "Picardie", "Picard", "Picardy", "Duchy", "Duke", 4]
	global.tags[3] = ["MAI", "Maine", "Mainer", "Maine", "County", "Count", 6]
	global.tags[4] = ["ANJ", "Anjou", "Angevin", "Anjou", "County", "Count", 7]
	global.tags[5] = ["TOU", "Touraine", "Tourangeau", "Touraine", "County", "Count", 8]
	global.tags[6] = ["ORL", "Orléanais", "Orléanaise", "Orléanais", "Duchy", "Duke", 0]
	global.tags[7] = ["FRA", "France", "Royal", "France", "Kingdom", "King", 1]
	global.tags[8] = ["CHA", "Champagne", "Champagne", "Champagne", "Duchy", "Duke", 9]
	global.tags[9] = ["BER", "Berry", "Berrichon", "Berry", "County", "Count", 10]
	global.tags[10] = ["BOU", "Bourbonnais", "Bourbon", "Bourbon", "County", "Duchess", 5]
	global.tags[11] = ["NIV", "Nivernais", "Nivernaise", "Nivernais", "County", "Cardinal", 11]
	global.tags[12] = ["POI", "Poitou", "Poitevin", "Poitou", "Duchy", "Duke", 12]
	global.tags[13] = ["AUN", "Aunis", "Aunisian", "Aunis", "County", "Count", 13]
	global.tags[14] = ["SAI", "Saintonge", "Saintongeais", "Saintonge", "County", "Count", 14]
	global.tags[15] = ["ANG", "Angoumois", "Angoumois", "Angoumois", "County", "Count", 15]
	global.tags[16] = ["MAR", "La Marche", "Marcher", "The March", "County", "Count", 16]
	global.tags[17] = ["LIM", "Limousin", "Limousin", "Limousin", "County", "Count", 17]
	global.tags[18] = ["AUV", "Auvergne", "Auvergnese", "Auvergne", "County", "Viscount", 18]
	global.tags[19] = ["BUR", "Bourgogne", "Burgundian", "Burgundy", "Duchy", "Prince", 19]
	//global.tags[20] = ["SPA", "España", "Spanish", "Spain", "Kingdom", "King", 20]
	global.tags[20] = ["SPA", "Charolais", "Charolaise", "Charolais", "County", "King", 20]
	global.tags[21] = ["LYO", "Lyonnais", "Lyonese", "Lyon", "County", "Count", 21]
	global.tags[22] = ["GUY", "Guyenne", "Guyennese", "Guyenne", "Duchy", "Duke", 22]
	global.tags[23] = ["LAN", "Languedoc", "Languedocien", "Languedoc", "Duchy", "Duke", 23]
	global.tags[24] = ["PAP", "Papacy", "Papal", "Papacy", "Theocracy", "Pope", 24]
	global.tags[25] = ["DAU", "Dauphine", "Dauphin", "Dauphine", "Duchy", "Duke", 25]
	global.tags[26] = ["PRO", "Provence", "Provençal", "Provence", "Duchy", "Duke", 26]
	global.tags[27] = ["FOI", "Foix", "Fuxéen", "Foix", "County", "Count", 27]
	global.tags[28] = ["GAS", "Gascogne", "Gascon", "Gascony", "Duchy", "Duchess", 28]
	global.tags[29] = ["BEA", "Béarn", "Béarnais", "Béarn", "County", "Count", 29]
	global.tags[30] = ["PAR", "Paris", "Parisian", "Paris", "Parlement", "Le", 30]
	
	// List of Alliances
	global.allies[0] = ["FRA"]
	global.allies[1] = ["BUR"]
	global.allies[2] = ["ANJ"]
	global.allies[3] = []
	global.allies[4] = ["PIC"]
	global.allies[5] = []
	global.allies[6] = ["GAS"]
	global.allies[7] = ["BRE", "BOU"]
	global.allies[8] = ["BUR"]
	global.allies[9] = []
	global.allies[10] = ["FRA"]
	global.allies[11] = []
	global.allies[12] = []
	global.allies[13] = []
	global.allies[14] = []
	global.allies[15] = []
	global.allies[16] = []
	global.allies[17] = []
	global.allies[18] = []
	global.allies[19] = ["NOR", "CHA", "PRO"]
	global.allies[20] = []
	global.allies[21] = []
	global.allies[22] = []
	global.allies[23] = []
	global.allies[24] = []
	global.allies[25] = []
	global.allies[26] = ["BUR"]
	global.allies[27] = ["BEA"]
	global.allies[28] = ["ORL"]
	global.allies[29] = ["FOI"]
	global.allies[30] = []
	
	// List of Wars
	global.wars[0] = []
	global.wars[1] = []
	global.wars[2] = []
	global.wars[3] = []
	global.wars[4] = []
	global.wars[5] = []
	global.wars[6] = []
	global.wars[7] = []
	global.wars[8] = []
	global.wars[9] = []
	global.wars[10] = []
	global.wars[11] = []
	global.wars[12] = []
	global.wars[13] = []
	global.wars[14] = []
	global.wars[15] = []
	global.wars[16] = []
	global.wars[17] = []
	global.wars[18] = []
	global.wars[19] = []
	global.wars[20] = []
	global.wars[21] = []
	global.wars[22] = []
	global.wars[23] = []
	global.wars[24] = []
	global.wars[25] = []
	global.wars[26] = []
	global.wars[27] = []
	global.wars[28] = []
	global.wars[29] = []
	global.wars[30] = []
	
	// List of Claims
	global.claims[0] = []
	global.claims[1] = []
	global.claims[2] = []
	global.claims[3] = []
	global.claims[4] = []
	global.claims[5] = []
	global.claims[6] = []
	global.claims[7] = []
	global.claims[8] = []
	global.claims[9] = []
	global.claims[10] = []
	global.claims[11] = []
	global.claims[12] = []
	global.claims[13] = []
	global.claims[14] = []
	global.claims[15] = []
	global.claims[16] = []
	global.claims[17] = []
	global.claims[18] = []
	global.claims[19] = []
	global.claims[20] = []
	global.claims[21] = []
	global.claims[22] = []
	global.claims[23] = []
	global.claims[24] = []
	global.claims[25] = []
	global.claims[26] = []
	global.claims[27] = []
	global.claims[28] = []
	global.claims[29] = []
	global.claims[30] = []
	
	// List of Opinions
	// Each index corresponds to a countries opinion of the corresponding Tag Index
	global.opinions[0] = [100, 0, 25, -25, -25, 0, 50, 50, 0, 0, -50, -100, 0, 0, 0, 0, 0, 0, 0, 25, -50, 0, 0, 0, 100, 0, 0, 0, 50, 0, 0]
	global.opinions[1] = [0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[2] = [0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[3] = [0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[4] = [0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[5] = [0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[6] = [0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[7] = [100, -50, 0, 0, 0, 0, -25, 100, -25, 25, 50, 100, 0, 0, 0, 0, 0, 0, 0, -75, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[8] = [0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[10] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[11] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[12] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[14] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[15] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[16] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[17] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[18] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[19] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[20] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[21] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[22] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[23] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[24] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0]
	global.opinions[25] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0]
	global.opinions[26] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0]
	global.opinions[27] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0]
	global.opinions[28] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0]
	global.opinions[29] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0]
	global.opinions[30] = [0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100]
	
	// List of Flags
	// Index corresponds to Tag_ID, each value is a list formatted: ["FlagName", TurnsRemaining (Integer)]
	global.flags[0] = []
	global.flags[1] = []
	global.flags[2] = []
	global.flags[3] = []
	global.flags[4] = []
	global.flags[5] = []
	global.flags[6] = []
	global.flags[7] = []
	global.flags[8] = []
	global.flags[9] = []
	global.flags[10] = []
	global.flags[11] = []
	global.flags[12] = []
	global.flags[13] = []
	global.flags[14] = []
	global.flags[15] = []
	global.flags[16] = []
	global.flags[17] = []
	global.flags[18] = []
	global.flags[19] = []
	global.flags[20] = []
	global.flags[21] = []
	global.flags[22] = []
	global.flags[23] = []
	global.flags[24] = []
	global.flags[25] = []
	global.flags[26] = []
	global.flags[27] = []
	global.flags[28] = []
	global.flags[29] = []
	global.flags[30] = []
	
	// List of active wars
	// 0 - Attacker, 1 - Defender, 2 - Attacker Allies, 3 - Defender Allies
	//global.a_wars = [] 
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
			new_colour = make_colour_rgb(180, 50, 45)
			return new_colour
		case "ANJ":
			new_colour = make_colour_rgb(105, 45, 105)
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
			new_colour = make_colour_rgb(160, 100, 180)
			return new_colour
		case "BOU":
			new_colour = make_colour_rgb(140, 140, 230)
			return new_colour
		case "NIV":
			new_colour = make_colour_rgb(80, 200, 105)
			return new_colour
		case "POI":
			new_colour = make_colour_rgb(105, 160, 105)
			return new_colour
		case "AUN":
			new_colour = make_colour_rgb(225, 40, 40)
			return new_colour
		case "SAI":
			new_colour = make_colour_rgb(225, 160, 160)
			return new_colour
		case "ANG":
			new_colour = make_colour_rgb(235, 120, 235)
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
			new_colour = make_colour_rgb(225, 40, 90)
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
			new_colour = make_colour_rgb(180, 180, 180)
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
		case "PAR":
			new_colour = make_colour_rgb(150, 25, 215)
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


function tag_total_development(tag){
	// Adds all the development of each county of the specified tag
	var dev = 0
	for (i = 0; i < array_length(global.provinces); i ++) {
		if global.provinces[i][6] == tag {
			dev += map_province_development(i)
		}
	}
	
	return dev
}

function tag_total_provinces(tag){
	// Returns the amount of provinces a specified tag owns
	var num = 0
	for (var i = 0; i < instance_number(obj_province); i ++) {
		if instance_find(obj_province, i).tag == tag { num ++ }
	}
	
	return num
}

function tag_get_name(tag) {
	for (i = 0; i < array_length(global.tags); i ++) {
		if global.tags[i][0] == tag {
			return global.tags[i][obj_control.lang_setting]
		}
	}
	
	return "N/A"
}

function tag_get_allies(tag) {
	// Returns a list as a string of all a tag's allies
	
	var list = ""
	var allies = global.allies[tag_fetch_id(tag)]
	
	if array_length(allies) > 1 {
		for (var i = 0; i < array_length(allies); i ++) {
			list += tag_get_name(allies[i])
			if i < array_length(allies) - 1 {
				list += ", "
			}
		}
	} else if array_length(allies) == 1 {
		list = tag_get_name(allies[0])
	} else {
		list = "None"	
	}
	
	return list
}

function tag_is_ally(tag1, tag2) {
	// Checks if one tag is allied to another
	var allies = global.allies[tag_fetch_id(tag1)]
	
	if array_length(allies) > 1 {
		for (var i = 0; i < array_length(allies); i ++) {
			if allies[i] == tag2 {
				return true
			}
		}
	} else if array_length(allies) == 1 {
		if allies[0] == tag2 { return true }
	} else {
		return false
	}
	
	return false
}

function tag_is_enemy(tag1, tag2) {
	// Checks if one tag is in a war with the other
	var enemies = global.wars[tag_fetch_id(tag1)]
	
	if array_length(enemies) > 1 {
		for (var i = 0; i < array_length(enemies); i ++) {
			if enemies[i] == tag2 {
				return true
			}
		}
	} else if array_length(enemies) == 1 {
		if enemies[0] == tag2 { return true }
	} else {
		return false
	}
	
	return false
}

function tag_get_enemies(tag) {
	// Returns a list as a string of all a tag's enemies
	
	var list = ""
	var enemies = global.wars[tag_fetch_id(tag)]
	
	if array_length(enemies) > 1 {
		for (var i = 0; i < array_length(enemies); i ++) {
			list += tag_get_name(enemies[i])
			if i < array_length(enemies) - 1 {
				list += ", "
			}
		}
	} else if array_length(enemies) == 1 {
		list = tag_get_name(enemies[0])
	} else {
		list = "None"	
	}
	
	return list
}

function tag_get_claims(tag) {
	// Returns a list as a string of all a tag's enemies
	
	var list = ""
	var claims = global.claims[tag_fetch_id(tag)]
	
	if array_length(claims) > 1 {
		for (var i = 0; i < array_length(claims); i ++) {
			list += tag_get_name(claims[i])
			//list += claims[i]
			if i < array_length(claims) - 1 {
				list += ", "
			}
		}
	} else if array_length(claims) == 1 {
		list = tag_get_name(claims[0])
		//list += claims[i]
	} else {
		list = "None"	
	}
	
	return list
}

function tag_opinion_of(tag1, tag2) {
	// Checks tag1's opinion of tag2
	
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	return global.opinions[tag1_id][tag2_id]
}

function tag_add_opinion(tag1, tag2, amount) {
	// adds tag1 opinion of tag2
	
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	if (global.opinions[tag1_id][tag2_id] + amount) > 100 {
		global.opinions[tag1_id][tag2_id] = 100
	} else {
		global.opinions[tag1_id][tag2_id] += amount
	}
}

function tag_remove_opinion(tag1, tag2, amount) {
	// removes tag1 opinion of tag2
	
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	if (global.opinions[tag1_id][tag2_id] - amount) < -100 {
		global.opinions[tag1_id][tag2_id] = -100
	} else {
		global.opinions[tag1_id][tag2_id] -= amount
	}
}

function tag_add_ally(tag1, tag2) {
	// Adds Tag1 + Tag2 as allies
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	array_push(global.allies[tag1_id], tag2)
	array_push(global.allies[tag2_id], tag1)
}

function tag_remove_ally(tag1, tag2) {
	// Removes Tag1 + Tag2 as allies
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	for (var i = 0; i < array_length(global.allies[tag1_id]); i ++) {
		if global.allies[tag1_id][i] == tag2 {
			array_delete(global.allies[tag1_id], i, 1)
		}
	}
	
	for (var ii = 0; ii < array_length(global.allies[tag2_id]); ii ++) {
		if global.allies[tag2_id][ii] == tag1 {
			array_delete(global.allies[tag2_id], ii, 1)
		}
	}
}

function tag_remove_dead_enemy(tag1, tag2) {
	// Removes Tag2 from Tag2's global.wars
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	global.wars[tag2_id] = []
	
	for (var i = 0; i < array_length(global.wars[tag1_id]); i++ ) {
		// Search enemies list
		if global.wars[tag1_id][i] == tag2_id {
			// Remove
			array_delete(global.wars[tag1_id], i, 1)
		}
	}
}

function tag_declare_peace(tag1, tag2) {
	// Removes Tag1 + Tag2 as enemies
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	/// CORE BELLIGERENTS
	//array_delete(global.wars[tag1_id], 0, 1)
	//array_delete(global.wars[tag2_id], 0, 1)
	
	//// Stop core belligerents from being at war with each other's allies
	//for (var a1 = 0; a1 < array_length(global.allies[tag1_id]); a1 ++) {
	//	for (var w2 = 0; w2 < array_length(global.wars[tag2_id]); w2 ++) {
	//		if global.wars[tag2_id][w2] == global.allies[tag1_id][a1] {
	//			array_delete(global.wars[tag2_id], w2, 1)
	//		}
	//	}
	//}
	
	//for (var a2 = 0; a2 < array_length(global.allies[tag2_id]); a2 ++) {
	//	for (var w1 = 0; w1 < array_length(global.wars[tag1_id]); w1 ++) {
	//		if global.wars[tag1_id][w1] == global.allies[tag2_id][a2] {
	//			array_delete(global.wars[tag1_id], w1, 1)
	//		}
	//	}
	//}
	
	//// Stop Tag 1's allies from being at war with Tag 2's allies
	//for (var a1 = 0; a1 < array_length(global.allies[tag1_id]); a1 ++) {
	//	var ally_id = tag_fetch_id(global.allies[tag1_id][a1])
	//	for (var wa1 = 0; wa1 < array_length(global.wars[ally_id]); wa1 ++) {
	//		// Go through ally's wars, remove main belligerent
	//		if global.wars[ally_id][wa1] == tag2 {
	//			array_delete(global.wars[ally_id], wa1, 1)
	//		}
	//	}
		
	//	for (var aw1 = 0; aw1 < array_length(global.allies[tag2_id]); aw1 ++) {
	//		// Go through enemy allies and remove them from wars
	//		for (var ww1 = 0; ww1 < array_length(global.wars[ally_id]); ww1 ++) {
	//			if global.wars[ally_id][ww1] == global.allies[tag2_id][aw1] {
	//				array_delete(global.wars[ally_id], ww1, 1)
	//			}
	//		}
	//	}
	//}
	
	//// Stop Tag 2's allies from being at war with Tag 1's allies
	//for (var a2 = 0; a2 < array_length(global.allies[tag2_id]); a2 ++) {
	//	var elly_id = tag_fetch_id(global.allies[tag2_id][a2])
	//	for (var wa2 = 0; wa2 < array_length(global.wars[elly_id]); wa2 ++) {
	//		// Go through ally's wars, remove main belligerent
	//		if global.wars[elly_id][wa2] == tag1 {
	//			array_delete(global.wars[elly_id], wa2, 1)
	//		}
	//	}
		
	//	for (var aw2 = 0; aw2 < array_length(global.allies[tag1_id]); aw2 ++) {
	//		// Go through enemy allies and remove them from wars
	//		for (var ww2 = 0; ww2 < array_length(global.wars[elly_id]); ww2 ++) {
	//			if global.wars[elly_id][ww2] == global.allies[tag1_id][aw2]
	//				array_delete(global.wars[elly_id], ww2, 1)
	//		}
	//	}
	//}
	
	for (var i = 0; i < array_length(global.wars[tag1_id]); i ++) {
		// Clear Player Enemies
		if tag_is_ally(global.wars[tag1_id][i], tag2) {
			// If they're an enemy ally
			array_delete(global.wars[tag1_id], i, 1)
			continue
		}
		
		if global.wars[tag1_id][i] == tag2 {
			// If they're the enemy
			array_delete(global.wars[tag1_id], i, 1)
			continue
		}
	}
	
	for (var j = 0; j < array_length(global.wars[tag2_id]); j ++) {
		// Clear Enemy Enemies
		if tag_is_ally(global.wars[tag2_id][j], tag1) {
			// If they're a player ally
			array_delete(global.wars[tag2_id], j, 1)
			continue
		}
		
		if global.wars[tag2_id][j] == tag2 {
			// If they're the enemy
			array_delete(global.wars[tag2_id], j, 1)
			continue
		}	
	}
	
	/// ALLIES OF BELIGERENTS
	
	if array_length(global.allies[tag1_id]) > 0 {
		for (var k = 0; k < array_length(global.allies[tag1_id]); k ++) {
			// Clear Enemies from Player Allies
			var ally_id = tag_fetch_id(global.allies[tag1_id][k])
			if array_length(global.wars[ally_id]) > 0 {
				for (var k2 = 0; k2 < array_length(global.wars[ally_id]); k2 ++) {
					if tag_is_ally(global.wars[ally_id][k2], tag2) {
						// If they're an enemy ally
						array_delete(global.wars[ally_id], k2, 1)
						continue
					}
			
					if global.wars[ally_id][k2] == tag2 {
						// If they're the enemy
						array_delete(global.wars[ally_id], k2, 1)
						continue
					}
				}
			}
		}
	}
	
	if array_length(global.allies[tag2_id]) > 0 {
		for (var l = 0; l < array_length(global.allies[tag2_id]); l ++) {
			// Clear Enemies from Enemy Allies
			var elly_id = tag_fetch_id(global.allies[tag2_id][l])
			
			if array_length(global.wars[elly_id]) > 0 {
				for (var l2 = 0; l2 < array_length(global.wars[elly_id]); l2 ++) {
					if tag_is_ally(global.wars[elly_id][l2], tag1) {
						// If they're a player ally
						array_delete(global.wars[elly_id], l2, 1)
						continue
					}
			
					if global.wars[elly_id][l2] == tag1 {
						// If they're the player
						array_delete(global.wars[elly_id], l2, 1)
						continue
					}
				}
			}
		}
	}
	wars_update(tag1_id)
	
	//if array_length(global.wars[tag1_id]) > 0 && array_length(global.wars[tag2_id]) > 0 {
	//	for (var i = 0; i < array_length(global.wars[tag1_id]); i ++) {
	//		if global.wars[tag1_id][i] == tag2 || tag_is_ally(global.wars[tag1_id][i], tag2) {
	//			array_delete(global.wars[tag1_id], i, 1)
	//		}
	//	}
	
	//	for (var ii = 0; ii < array_length(global.wars[tag2_id]); ii ++) {
	//		if global.wars[tag2_id][ii] == tag1 || tag_is_ally(global.wars[tag2_id][ii], tag1) {
	//			array_delete(global.wars[tag2_id], ii, 1)
	//		}
	//	}
	
	//	if array_length(global.allies[tag1_id]) > 0 {
	//		// Peaces out allies too
	//		for (var iii = 0; iii < array_length(global.allies[tag1_id]); iii ++) {
	//			var ally_tag_id = tag_fetch_id(global.allies[tag1_id][iii])
	//			for (var jjj = 0; jjj < array_length(global.wars[ally_tag_id]); jjj ++) {
	//				array_delete(global.wars[ally_tag_id], jjj, 1)
	//			}
	//		}
	//	}
	//	if array_length(global.allies[tag2_id]) > 0 {
	//		// Peaces out enemy allies too
	//		for (var iv = 0; iv < array_length(global.allies[tag2_id]); iv ++) {
	//			var ally_tag_id = tag_fetch_id(global.allies[tag2_id][iv])
	//			for (var jv = 0; jv < array_length(global.wars[ally_tag_id]); jv ++) {
	//				array_delete(global.wars[ally_tag_id], jv, 1)
	//			}
	//		}
	//	}
	//}
}


function tag_add_claim(tag1, tag2) {
	// Tag1 gets a claim on tag2
	var tag1_id = tag_fetch_id(tag1)
	// var tag2_id = tag_fetch_id(tag2)
	
	array_push(global.claims[tag1_id], tag2)
}
function tag_remove_claim(tag1, tag2) {
	// Tag1 loses a claim on tag2
	var tag1_id = tag_fetch_id(tag1)
	// var tag2_id = tag_fetch_id(tag2)
	
	for (var i = 0; i < array_length(global.claims[tag1_id]); i ++)
		if global.claims[tag1_id][i] == tag2 {
			array_delete(global.claims[tag1_id], i, 1)
		}
}

function tag_has_claim(tag1, tag2) {
	// checks to see if tag1 has a claim on tag2
	
	var tag1_id = tag_fetch_id(tag1)
	// var tag2_id = tag_fetch_id(tag2)
	
	for (var i = 0; i < array_length(global.claims[tag1_id]); i ++) {
		if global.claims[tag1_id][i] == tag2 {
			return true
		}
	}
	
	return false
}

function tag_declare_war(tag1, tag2) {
	// Tag 1 Declares war on Tag 2
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	// Add main enemies to each belligerent
	array_push(global.wars[tag1_id], tag2)
	array_push(global.wars[tag2_id], tag1)
	
	// Set Tag 2's allies as enemies of Tag 1
	for (var e_allies = 0; e_allies < array_length(global.allies[tag2_id]); e_allies ++) {
		array_push(global.wars[tag1_id], global.allies[tag2_id][e_allies])
	}
	
	// Set Tag 1's allies as enemies of Tag 2
	for (var allies = 0; allies < array_length(global.allies[tag1_id]); allies ++) {
		array_push(global.wars[tag2_id], global.allies[tag1_id][allies])
	}
	
	// Make all allies of both parties at war with each other's allies
	// Allies of Tag 1:
	for (var allies = 0; allies < array_length(global.allies[tag1_id]); allies ++) {
		var ally = tag_fetch_id(global.allies[tag1_id][allies])
		// Set Tag 2 as enemy of ally
		array_push(global.wars[ally], tag2)
		// Set Tag 2's allies as enemies of ally
		for (var e_allies = 0; e_allies < array_length(global.allies[tag2_id]); e_allies ++) {
			array_push(global.wars[ally], global.allies[tag2_id][e_allies])
		}
	}
	// Allies of Tag 2:
	for (var e_allies = 0; e_allies < array_length(global.allies[tag2_id]); e_allies ++) {
		var e_ally = tag_fetch_id(global.allies[tag2_id][e_allies])
		// Set Tag 1 as enemy of ally
		array_push(global.wars[e_ally], tag1)
		// Set Tag 1's allies as enemies of enemy ally
		for (var allies = 0; allies < array_length(global.allies[tag1_id]); allies ++) {
			array_push(global.wars[e_ally], global.allies[tag1_id][allies])
		}
	}
	
	//if array_length(global.allies[tag1_id]) > 0 {
	//	// Adds Allies to the war
	//	for (var i = 0; i < array_length(global.allies[tag1_id]); i ++) {
	//		var ally_tag_id = tag_fetch_id(global.allies[tag1_id][i])
	//		if global.allies[ally_tag_id] != "FRA" || global.allies[ally_tag_id] != "SPA" || global.allies[ally_tag_id] != "PAP" {
	//			array_push(global.wars[ally_tag_id], tag2)
	//			array_push(global.wars[tag2_id], global.allies[tag1_id][i])
	//		}
	//	}
	//}
	
	//if array_length(global.allies[tag2_id]) > 0 {
	//	// Adds Enemy Allies to the war
	//	for (var i = 0; i < array_length(global.allies[tag2_id]); i ++) {
	//		var ally_tag_id = tag_fetch_id(global.allies[tag2_id][i])
	//		array_push(global.wars[ally_tag_id], tag1)
	//		array_push(global.wars[tag1_id], global.allies[tag2_id][i])
	//	}
	//}
	
	
	
	if tag_has_claim(tag1, tag2) {
		tag_remove_claim(tag1, tag2)
	}
}

function flag_add(tag, flag, timer) {
	// Adds a flag to the tag
	var tag_id = tag_fetch_id(tag)
	
	array_push(global.flags[tag_id], [flag, timer])
}

function tag_has_flag(tag, flag) {
	// Determines if a tag has the specified flag
	var flag_list = global.flags[tag_fetch_id(tag)]
	
	if array_length(flag_list) > 0 {
		for (var i = 0; i < array_length(flag_list); i ++) {
			// Check each flag
			
			if flag_list[i][0] == flag {
				return true
			}
		}
	} else {
		return false	
	}
	
	return false
}

function flags_update(tag_id) {
	// Goes through all flags of a target country, and ticks them by one
	var flag_list = global.flags[tag_id]
	
	if array_length(flag_list) > 0 {
		for (var i = 0; i < array_length(flag_list); i ++) {
			flag_list[i][1] -= 1 // Decrement flag timer by 1
			
			if flag_list[i][1] <= 0 {
				// Remove Flag if timer runs out
				array_delete(global.flags[tag_id], i, 1)
			}
		}
	} else {
		return	
	}
}

function allies_update(tag_id) {
	// removes dead allies or allies who are also enemies
	var allies = global.allies[tag_id]
	var enemies = global.wars[tag_id]
	
	if array_length(allies) > 0 {
		for (var i = 0; i < array_length(allies); i ++) {
			// Cycle through allies
			if tag_total_provinces(allies[i]) == 0 {
				array_delete(global.allies[tag_id], i, 1)
				continue
			}
			
			if array_length(enemies) > 0 {
				// Cycle through enemies
				for (var j = 0; j < array_length(enemies); j ++) {
					if enemies[j] == allies[i] {
						array_delete(global.allies[tag_id], i, 1)
						break
					}
				}
			}
		}
	}
}

function wars_update(tag_id) {
	// Removes enemies that aren't mutual
	var enemies = global.wars[tag_id]
	
	for (var i = 0; i < array_length(enemies); i ++) {
		// Cycle thorugh enemies
		var enemy_enemies = global.wars[tag_fetch_id(enemies[i])]
		var found = false
		for (var j = 0; j < array_length(enemy_enemies); j ++) {
			// Cycle through enemy's enemies
			if enemy_enemies[j] == enemies[i] {
				found = true
			}
		}
		
		if !found {
			array_delete(global.wars[tag_id], i, 1)
		}
	}
}

function fronde_end(type) {
	// End the Fronde
	
	//end_all_wars() // End all conflict
	
	
	if type == "france" {
		// France Wins
		global.tags[7] = ["FRA", "France", "Royal", "France", "Kingdom", "King", 1]
		show_event("Louis XIV Crushes the Fronde", "The period of civil unrest and anarchy across France is fianlly at an end. The leaders of the the Fronde and their allies have been arrested, and the Kingdom is united under the absolute rule of Louis XIV. (The Game is Over, you have LOST)", 7, ["We are resigned to history's pages..."])
	} else if type == "conde" {
		// Conde Wins
		global.chars[19] = ["Louis XV 'Grand Condé'", "de Bourbon", "Bourbon-Condé", 6, 3, 5]
		global.tags[19] = ["BUR", "Empire Français", "French", "French Empire", "Empire", "Emperor", 19]
		show_event("The House of Bourbon-Condé", "And so it was, on this day in 1653, a new French dynasty was born. The Great Condé has seized Paris and forced the King into a full surrender, thus swearing his crown over to him. Long live Emperor Louis XV! (The Game is Over, Burgundy has WON)", 0, ["Long may he reign."])
	} else if type == "player" {
		// Player Wins
		var player_id = tag_fetch_id(obj_control.player_tag)
		
		if obj_control.player_tag != "AUN" {
			global.tags[player_id] = [obj_control.player_tag, "Nouvelle France", "French", "New France", "Kingdom", "King", global.tags[player_id][6]]
		}
		
		show_event("A New France", "It was an outcome that none of the belligerent parties of the war had expected, but it was neither the Royalists nor the Frondeurs who prevailed. We have declare ourselves as the new rulers of france, long live King " + global.chars[global.tags[player_id][6]][0] + "! Vive la France! (The Game is Over, you have WON)", 10, ["Vive le Roi, pour la victoire!"])
	}
	
	obj_province.prov_occupied_by = noone // End all occupations
	tag_declare_peace("FRA", "BUR")
	tag_declare_peace("FRA", obj_control.player_tag)
}