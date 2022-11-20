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
	global.tags[24] = ["PAP", "Papacy", "Papal", "Papacy", "Papacy"]
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


