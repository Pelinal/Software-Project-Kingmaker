// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more informationp
function military_init() {
	// List of Unit Types + Type Advantages
	// Index 0: Name, Index 1: Strong Against, Index 2: Weak Against, Index 3: Preferred Terrain
	global.unit_type[0] = ["Light Infantry", [1, 4], [3, 2], "Flat"]
	global.unit_type[1] = ["Heavy Infantry", [2, 3], [0, 4], "Flat"]
	global.unit_type[2] = ["Specialist", [0, 4], [1, 3], "Hills"]
	global.unit_type[3] = ["Light Cavalry", [0, 2], [1, 4], "Hills"]
	global.unit_type[4] = ["Heavy Cavalry", [1, 3], [0, 2], "Hills"]
	
	// Potential recruitable units list
	// Index 0: Name, Index 1: Unit Type, Index 2: Damage, Index 3: Armour, Index 4: Piercing Damage (extra damage that ignores armour), Index 5: Morale, Index 6: Upkeep Per Turn
	global.unit[0] = ["Irregular Infantry", 0, 10, 10, 0, 20, 0.1]
	global.unit[1] = ["Line Infantry", 0, 20, 20, 5, 20, 0.3]
	global.unit[2] = ["Swiss Mercenaries", 0, 30, 15, 10, 35, 0.8]
	
	global.unit[3] = ["Pikemen", 1, 15, 20, 10, 20, 0.15]
	global.unit[4] = ["Halberdiers", 1, 20, 35, 15, 30, 0.4]
	global.unit[5] = ["Légionnaires", 1, 35, 30, 10, 30, 1.0]
	global.unit[6] = ["Royal Guard", 1, 40, 35, 15, 35, 0.8]	// Cannot be recruited, only the King has access to them
	
	global.unit[7] = ["Fusiliers", 2, 20, 0, 10, 30, 0.5]
	global.unit[8] = ["Musketeers", 2, 30, 10, 20, 40, 1.25]
	global.unit[9] = ["Grenadiers", 2, 40, 15, 25, 30, 1.75]
	global.unit[10] = ["Cannoneers", 2, 0, 5, 60, 20, 2.5]
	
	global.unit[11] = ["Cuirassiers", 3, 7.5, 0, 10, 30, 0.6]
	global.unit[12] = ["Chasseurs", 3, 10, 5, 20, 35, 0.9]
	global.unit[13] = ["Dragoons", 3, 15, 15, 30, 40, 1.1]
	global.unit[14] = ["Hussars", 3, 20, 20, 40, 50, 1.6]
	
	global.unit[15] = ["Chevaulégers", 4, 0, 30, 30, 30, 1.4]
	global.unit[16] = ["Lanciers", 4, 0, 40, 40, 40, 2.1]
	global.unit[17] = ["Cavalerie", 4, 0, 50, 50, 50, 2.7]
	global.unit[18] = ["Winged Hussars", 4, 0, 100, 100, 100, 5.0] // OP Unit, only available near the endgame
	
	// List of Exisiting Generals
	// Index 0: Name, Index 1: Owner Tag, Index 2: Army Assigned, Index 3: Tact (Attack), Index 4: Charisma (Morale), Index 5: Cunning (Defence)
	global.general[0] = ["César de Choiseul", "FRA", 1, 3, 3, 3]
	
	// List of Existing Armies
	// Index 0: Name, Index 1: General ID, Index 2: Owner Tag, Index 3: Unit List (0: Type, 1: Unit Strength)
	//global.army[0] = ["Armée de Orléans", noone, "ORL", [[1, 1000], [1, 1000], [1, 1000], [1, 1000], [3, 1000], [3, 1000], [11, 1000]] ] // Orleans' Starting Army (7000 men)
	//global.army[1] = ["Armée Royale Française", 0, "FRA", [[1, 1000], [1, 1000], [2, 1000], [3, 1000], [3, 1000], [6, 1000], [6, 1000], [11, 1000], [11, 1000], [15, 1000]] ] // King's Starting Army 1 (10k men)
	//global.army[2] = ["Armée de Paris", 0, "FRA", [[0, 1000], [0, 1000], [7, 1000], [7, 1000]] ] // King's Starting Army 2 (4k men)
	
	// Simple Version for times' sake
	// a list of armies
	global.army[0] = [5000]
	global.army[1] = [5000]
	global.army[2] = [2000]
	global.army[3] = [1000]
	global.army[4] = [1000]
	global.army[5] = [1000]
	global.army[6] = [7000, 3000]
	global.army[7] = [5000, 5000, 10000]
	global.army[8] = [15000]
	global.army[9] = [1000]
	global.army[10] = [1000]
	global.army[11] = [2000]
	global.army[12] = [2000]
	global.army[13] = [500]
	global.army[14] = [1000]
	global.army[15] = []
	global.army[16] = [1000]
	global.army[17] = [1500]
	global.army[18] = [4000, 2000]
	global.army[19] = [8000, 4000, 4000]
	global.army[20] = []
	global.army[21] = [500]
	global.army[22] = [5000, 5000]
	global.army[23] = [3000, 4000]
	global.army[24] = []
	global.army[25] = [4000]
	global.army[26] = [4000]
	global.army[27] = [500]
	global.army[28] = [3000, 2000]
	global.army[29] = [1000]
}

function military_get_tag_total(tag) {
	var total_troops = 0
	for (var i = 0; i < array_length(global.army); i ++) {
		if i == tag_fetch_id(tag) {
			for (var j = 0; j < array_length(global.army[i]); j ++) {
				total_troops += global.army[i][j]
			}
		}
	}
	
	return total_troops
}