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
	
	// List of Opinions
	// Each index corresponds to a countries opinion of the corresponding Tag Index
	global.opinions[0] = [100, 0, 25, -25, -25, 0, 50, 50, 0, 0, -50, -100, 0, 0, 0, 0, 0, 0, 0, 25, -50, 0, 0, 0, 100, 0, 0, 0, 50, 0]
	global.opinions[1] = [0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[2] = [0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[3] = [0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[4] = [0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[5] = [0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[6] = [0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[7] = [100, -50, 0, 0, 0, 0, -25, 100, -25, 25, 50, 100, 0, 0, 0, 0, 0, 0, 0, -75, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[8] = [0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[10] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[11] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[12] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[14] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[15] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[16] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[17] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[18] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[19] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[20] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[21] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[22] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0]
	global.opinions[23] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0]
	global.opinions[24] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0]
	global.opinions[25] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0]
	global.opinions[26] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0]
	global.opinions[27] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0]
	global.opinions[28] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0]
	global.opinions[29] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100]
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

function tag_declare_peace(tag1, tag2) {
	// Removes Tag1 + Tag2 as enemies
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	for (var i = 0; i < array_length(global.wars[tag1_id]); i ++) {
		if global.wars[tag1_id][i] == tag2 {
			array_delete(global.wars[tag1_id], i, 1)
		}
	}
	
	for (var ii = 0; ii < array_length(global.wars[tag2_id]); ii ++) {
		if global.wars[tag2_id][ii] == tag1 {
			array_delete(global.wars[tag2_id], ii, 1)
		}
	}
	
	if array_length(global.allies[tag1_id]) > 0 {
		// Peaces out allies too
		for (var iii = 0; iii < array_length(global.allies[tag1_id]); iii ++) {
			var ally_tag_id = tag_fetch_id(global.allies[tag1_id][iii])
			for (var jjj = 0; jjj < array_length(global.wars[ally_tag_id]); jjj ++) {
				array_delete(global.wars[ally_tag_id], jjj, 1)
			}
		}
	}
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
	// Tag 1 Declares war on Tag2
	var tag1_id = tag_fetch_id(tag1)
	var tag2_id = tag_fetch_id(tag2)
	
	array_push(global.wars[tag1_id], tag2)
	array_push(global.wars[tag2_id], tag1)
	
	if array_length(global.allies[tag1_id]) > 0 {
		// Adds Allies to the war
		for (var i = 0; i < array_length(global.allies[tag1_id]); i ++) {
			var ally_tag_id = tag_fetch_id(global.allies[tag1_id][i])
			array_push(global.wars[ally_tag_id], tag2)
			array_push(global.wars[tag2_id], global.allies[tag1_id][i])
		}
	}
}