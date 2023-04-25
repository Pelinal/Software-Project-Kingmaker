// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function economy_init() {
	// List of Economies
	// Index 0: Tag, Index 1: Current Wealth, Index 2: Income, Index 3: Expense, Index 4: Manpower Per Turn, Index 5: Current Manpower,
	// Index 6: Modifier (Income), Index 7: Modifier (Manpower), Index 8: Prestige
	global.economy[0] = ["BRE", 110, 0, 0, 0, 9, 1, 1, 11]
	global.economy[1] = ["NOR", 130, 0, 0, 0, 9, 1, 1, 16]
	global.economy[2] = ["PIC", 120, 0, 0, 0, 10, 1, 1, 5]
	global.economy[3] = ["MAI", 50, 0, 0, 0, 5, 1, 1, 4]
	global.economy[4] = ["ANJ", 30, 0, 0, 0, 3, 1, 1, 10]
	global.economy[5] = ["TOU", 40, 0, 0, 0, 2, 1, 1, 3]
	global.economy[6] = ["ORL", 140, 0, 0, 0, 14, 1, 1, 10]
	global.economy[7] = ["FRA", 310, 0, 0, 0, 29, 1, 1, 30]
	global.economy[8] = ["CHA", 140, 0, 0, 0, 17, 1, 1, 18]
	global.economy[9] = ["BER", 70, 0, 0, 0, 9, 1, 1, 8]
	global.economy[10] = ["BOU", 30, 0, 0, 0, 4, 1, 1, 5]
	global.economy[11] = ["NIV", 20, 0, 0, 0, 4, 1, 1, 3]
	global.economy[12] = ["POI", 70, 0, 0, 0, 8, 1, 1, 3]
	global.economy[13] = ["AUN", 30, 0, 0, 0, 4, 1, 1, 2]
	global.economy[14] = ["SAI", 50, 0, 0, 0, 2, 1, 1, 2]
	global.economy[15] = ["ANG", 50, 0, 0, 0, 4, 1, 1, 2]
	global.economy[16] = ["MAR", 40, 0, 0, 0, 3, 1, 1, 4]
	global.economy[17] = ["LIM", 40, 0, 0, 0, 4, 1, 1, 6]
	global.economy[18] = ["AUV", 70, 0, 0, 0, 7, 1, 1, 10]
	global.economy[19] = ["BUR", 120, 0, 0, 0, 8, 1, 1, 20]
	global.economy[20] = ["SPA", 30, 0, 0, 0, 3, 1, 1, 50]
	global.economy[21] = ["LYO", 100, 0, 0, 0, 8, 1, 1, 10]
	global.economy[22] = ["GUY", 260, 0, 0, 0, 26, 1, 1, 18]
	global.economy[23] = ["LAN", 360, 0, 0, 0, 27, 1, 1, 19]
	global.economy[24] = ["PAP", 1000, 0, 0, 0, 5, 1, 1, 40]
	global.economy[25] = ["DAU", 110, 0, 0, 0, 10, 1, 1, 7]
	global.economy[26] = ["PRO", 230, 0, 0, 0, 13, 1, 1, 9]
	global.economy[27] = ["FOI", 30, 0, 0, 0, 3, 1, 1, 3]
	global.economy[28] = ["GAS", 100, 0, 0, 0, 12, 1, 1, 5]
	global.economy[29] = ["BEA", 40, 0, 0, 0, 3, 1, 1, 6]
	global.economy[30] = ["PAR", 500, 0, 0, 0, 10, 1, 1, 50]
	
	// List of Trade Goods
	// Index 0: Name, Index 1: Base Value, Index 3: Manufactory Building
	global.trade_goods[0] = ["Fish", 2, 0]
	global.trade_goods[1] = ["Cloth", 3, 0]
	global.trade_goods[2] = ["Grain", 2.5, 0]
	global.trade_goods[3] = ["Livestock", 2, 0]
	global.trade_goods[4] = ["Wine", 4, 0]
	global.trade_goods[5] = ["Lumber", 3, 0]
	global.trade_goods[6] = ["Wool", 3.5, 0]
	global.trade_goods[7] = ["Copper", 3, 0]
	global.trade_goods[8] = ["Iron", 3.5, 0]
	global.trade_goods[9] = ["Glass", 4, 0]
	global.trade_goods[10] = ["Gold", 5, 0] 
	global.trade_goods[11] = ["Salt", 4.5, 0]
	
	// List of Buildings
	// Index 0: Name, Index 1: Effect, Index 2: Effect Amount, Index 3: Cost, Index 4: Prequisite (ID, or -1), Index 5: Maintenance, Index 6: Can/Can't be upgraded?
	global.buildings[0] = ["Tax Office", "Tax", 1, 150, -1, 0, true]
	global.buildings[1] = ["Constabulary", "Tax", 3, 400, 0, 0, true]
	global.buildings[2] = ["Governor's Manor", "Tax", 5, 400, 1, 0, false]			// Extra Effect: Tax Income +20%
	global.buildings[3] = ["Trade Post", "Production", 1, 200, -1, 0, true]
	global.buildings[4] = ["Caravansary", "Production", 3, 500, 3, 0, true]
	global.buildings[5] = ["Foreign Market", "Production", 5, 1000, 4, 0, false]	// Extra Effect: Production Income +20%
	global.buildings[6] = ["Garrison", "Manpower", 1, 125, -1, 0.25, true]
	global.buildings[7] = ["Barracks", "Manpower", 3, 200, 6, 0.5, true] 
	global.buildings[8] = ["Fort", "Manpower", 4, 350, 7, 1, true]				// Extra Effect: Manpower Income +10%
	global.buildings[9] = ["Starfort", "Manpower", 5, 600, 8, 1.5, false]			// Extra Effect: Manpower Income +25%
	global.buildings[10] = ["Library", "Threat", -0.015, 200, -1, 0.25, true]
	global.buildings[11] = ["Print Shop", "Threat", -0.03, 400, 10, 0.5, true]
	global.buildings[12] = ["News Agent", "Threat", -0.05, 600, 11, 1.25, false]
	
}

function economy_update(tag) {
	// Updates tag economy
	// Update Manpower/Wealth Per Turn
	
	var tag_id = tag_fetch_id(tag)
	var t_income = 0, p_income = 0, m_income = 0, b_expense = 0, a_expense = 0
	
	for (var i = 0; i < array_length(global.provinces); i ++) {
		var tax = global.provinces[i][1]						// Tax Value
		var man = global.provinces[i][2]						// Manpower Value
		var pro = global.provinces[i][3]						// Production Value
		var trd = global.trade_goods[global.provinces[i][4]][1] // Trade Good Value
		
		// Building Expense (Maintenance)
		for (var j = 0; j < array_length(global.buildslots[i]); j ++) {
			if global.buildslots[i][j] != -1 {
				var bex = global.buildings[global.buildslots[i][j]][5] 
				if map_province_owner(i) == tag {	
					b_expense += bex
				}
			}
		}
		
		// Army Expense (Maintenance)
		a_expense = (military_get_tag_total(tag) /1000) * 0.1 // -0.1 per 1000 men
		
		// Calculate Province Income, add total incomes
		if map_province_owner(i) == tag {
			t_income += (tax / 10)								// Tax Income
			m_income += (man / 33.334)							// Manpower Per Turn
			p_income += ((pro * trd) / 10)						// Production Income
		}
	}
	
	var expense = (b_expense + a_expense)						// Total Expense
	var income = (t_income + p_income)							// Total Income (Wealth)
	var profit = (income - expense) - (income / 10)				// Profit/Loss
	
	// Values for economy tab
	obj_control.tax_income = t_income
	obj_control.pro_income = p_income
	obj_control.man_income = m_income
	obj_control.bld_expense = b_expense
	obj_control.arm_expense = a_expense
	obj_control.pre_profit = profit
	
	global.economy[tag_id][1] = round(global.economy[tag_id][1] + profit)		// Add to current wealth
	global.economy[tag_id][2] = income											// Set previous income (for economy tab viewing)
	global.economy[tag_id][3] = expense											// Set previous expense (for economy tab also)
	global.economy[tag_id][4] = m_income										// Set previous manpower gain (for economy tab)
	global.economy[tag_id][5] += m_income										// Add to current manpower
		
	//global.economy[i][2] *= global.economy[i][6] // Multiply Income by modifier
	//global.economy[i][4] *= global.economy[i][7] // Multiply Manpower by modifier
	
	// Update Expenditure
	// Will take into account Army & Building Maintenance + Liege Taxes + Council Payments
}

function add_wealth(tag, amount) {
	// Adds wealth to specified tag
	var tag_id = tag_fetch_id(tag)
	global.economy[tag_id][1] += amount
	
	if global.economy[tag_id][1] < 0 {
		global.economy[tag_id][1] = 0
	}
}

function add_prestige(tag, amount) {
	// Adds prestige to specified tag
	var tag_id = tag_fetch_id(tag)
	global.economy[tag_id][8] += amount
	
	if global.economy[tag_id][8] < 0 {
		global.economy[tag_id][8] = 0
	}
}

function add_manpower(tag, amount) {
	// Adds manpower to specified tag
	var tag_id = tag_fetch_id(tag)
	global.economy[tag_id][5] += amount
	
	if global.economy[tag_id][5] < 0 {
		global.economy[tag_id][5] = 0
	}
}

function char_init() {
	
	// Initialise all traits
	// Index 0: Name, Index 2: Effect, Index 3: Amount
	global.traits[0] = ["Arrogant", "Prestige Gain", 1.2]			// +20 % Prestige from all sources
	global.traits[1] = ["Humble",	"General Opinion", 10]			// +10 Opinion with all Nations
	global.traits[2] = ["Lazy", "Build Time", 1.2]					// -15% Slower Construction of Units/Buildings
	global.traits[3] = ["Diligent", "Diplo Time", 0.8]				// +20 % Faster Diplomatic Interactions
	global.traits[4] = ["Dull", "Prestige Gain", 0.8]				// -20 % Prestige from all sources
	global.traits[5] = ["Shrewd", "Tax Income", 1.15]				// +15 % More Income from Tax
	global.traits[6] = ["Natural Leader", "Manpower Gain", 1.15]	// +15% Manpower Per Turn
	global.traits[7] = ["Coward", "Manpower Gain", 0.75]			// -25% Manpower Per Turn
	global.traits[8] = ["Rude", "General Opinion", 20]				// -20 Opinion with all Nations
	global.traits[9] = ["Architect", "Build Time", 0.75]			// +25% Faster Construction of Units/Buildings
	global.traits[10] = ["Greedy", "Tax Income", 0.85]				// -15% Less Income from Tax
	
	// Initialise All Characters
	// Index 0: Name, Index 1: Family Name, Index 2: House Name, Index 3,4,5: Traits // 
	global.chars[0] = ["Gaston", "d'Orléans", "Bourbon", 0, 6, 10]							// Duke Gaston of Orleans (Player)
	global.chars[1] = ["Louis XIV 'the Sun-King'", "de Bourbon", "Bourbon", 3, 5, 0]			// King Louis XIV of France (Rival AI)
	global.chars[2] = ["Louis Alexandre", "de Bourbon", "Bourbon", 0, 4, 10]				// Brittany
	global.chars[3] = ["Henri II", "d'Orléans", "Bourbon", 7, 5, 2]							// Normandy - Brother of Grand Condé
	global.chars[4] = ["Henri", "de Lorraine", "Lorraine", 9, 8, 1]							// Picardy
	global.chars[5] = ["Louise", "de La Vallière", "Vajours", 1, 2, 5]						// Bourbonnais - Mistress of the King
	global.chars[6] = ["Charles Denis", "de Bullion", "Bullion", 0, 4, 10]					// Maine
	global.chars[7] = ["Louis", "de Lorraine", "Lorraine", 6, 1, 8]							// Anjou
	global.chars[8] = ["Philippe", "de Courcillon", "Courcillon", 0, 4, 10]					// Touraine
	global.chars[9] = ["Armand", "de Bourbon", "Bourbon-Condé", 5, 7, 9]					// Champagne - Brother of Grand Condé
	global.chars[10] = ["Anne", "de Noailles", "Noailles", 1, 3, 8]							// Berry
	global.chars[11] = ["Jules", "Mazarin", "Mazarin", 10, 7, 5]							// Nivernais - Cardinal Mazarin
	global.chars[12] = ["Charles", "de La Vieuville", "Vieuville", 0, 4, 10]				// Poitou
	global.chars[13] = ["François", "de Goÿon", "Goÿon-Matignon", 6, 4, 5]					// Aunis
	global.chars[14] = ["Adrien", "de Crussol", "Uzès", 0, 2, 10]							// Saintonge
	global.chars[15] = ["", "", "", 0, 1, 2]												// None
	global.chars[16] = ["Gabriel II", "Foucault", "Saint-Germain", 0, 4, 10]				// La Marche
	global.chars[17] = ["Jean Louis", "de Nogaret", "La Valette", 9, 10, 8]					// Limousin
	global.chars[18] = ["Henri", "de Turenne", "Auvergne", 0, 4, 10]						// Auvergne - Turenne
	global.chars[19] = ["Louis 'Grand Condé'", "de Bourbon", "Bourbon-Condé", 6, 3, 5]		// Burgundy - Prince of Condé
	global.chars[20] = ["Felipe IV 'the Great'", "von Habsburg", "Habsburg", 3, 4, 0]		// Spain
	global.chars[21] = ["Henri François", "Lambert", "Herbigny", 3, 4, 9]					// Lyonnais
	global.chars[22] = ["Louis Charles", "d'Albert", "Luynes", 4, 3, 5]						// Guyenne
	global.chars[23] = ["Guillaume", "de Lamoignon", "Lamoignon", 0, 4, 10]					// Languedoc
	global.chars[24] = ["Innocent X", "", "Pamphili", 8, 7, 10]								// Papacy
	global.chars[25] = ["Leon", "d'Aubusson", "La Feuillade", 1, 3, 7]						// Dauphine
	global.chars[26] = ["Henri Jules", "de Bourbon", "Bourbon-Condé", 0, 2, 9]				// Provence - Son of Condé
	global.chars[27] = ["Jean", "de Foix", "Foix", 5, 8, 10]								// Foix
	global.chars[28] = ["Anne Marie 'Grande Mademoiselle'", "d'Orléans", "Bourbon", 3, 5, 6]// Gascony - Daughter of Gaston
	global.chars[29] = ["Antoine", "de Gramont", "Gramont", 0, 3, 8]						// Beárn
	global.chars[30] = ["Parlement", "de Paris", "Parlement", 0, 5, 10]					// Paris Parlement
}

function building_check_prov(prov, building) {
	// Checks if a specific province has a specific building built
	
	for (var i = 0; i < global.buildslots[prov]; i ++) {
		if global.buildslots[prov][i] == building {
			return true
		}
	}
	
	return false
}

function buildings_list_all(prov, slot) {
	// Lists all buildable building
	//var building_list = []
	var y_offset = 808
	obj_control.build_select = true // enable build select menu
	
	for (var i = 0; i < array_length(global.buildings); i ++) {
		// Check if building meets prerequisites
		if global.buildslots[prov][slot] == global.buildings[i][4] || (global.buildings[i][4] == -1 && global.buildslots[prov][slot] != i) {		
			var new_button = instance_create_depth(909, y_offset, -10, obj_button)
			with new_button	{
				sprite_index = spr_rectlarge_button
				type = "BuildSelect"
				building_to_select = i
				build_prov = prov
				build_slot = slot
			}
			
			y_offset += 64
		}
	}
	
	//return prov_list
}