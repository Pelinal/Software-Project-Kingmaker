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
	global.army[8] = [5000, 10000]
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

function find_enemy_armies(tag) {
	// Returns a list of all armies owned by current enemies in war
	var enemy_armies = []
	var tag_id = tag_fetch_id(tag)
	for (var i = 0; i < array_length(global.wars[tag_id]); i ++) {
		// For every enemy
		var enemy = tag_fetch_id(global.wars[tag_id][i])
		for (var j = 0; j < array_length(global.army[enemy]); j ++) {
			// Check each army
			with obj_army {
				if army_id == j && id.tag_id == enemy {
					array_push(enemy_armies, id)	
				}
			}
		}
	}
	
	return enemy_armies
}

function find_my_armies(tag_id) {
	// Returns a list of all armies owned by a tag
	var my_armies = []
	for (var army = 0; army < instance_number(obj_army); army ++) {
		if instance_find(obj_army, army).tag_id == tag_id {
			array_push(my_armies, instance_find(obj_army, army).id)
		}
	}
	
	return my_armies
}

function find_target_army(enemy_armies, army) {
	// Takes a list of army objects and determines the best one to follow in war
	var target = noone
	if array_length(enemy_armies) > 0 {
		for (var i = 0; i < array_length(enemy_armies); i ++) {
			// For each potential target
			if enemy_armies[i].total_mp <= army.total_mp {
				target = enemy_armies[i]	
			}
		}
		
		if target != noone {
			return target
		} else {
			// If no ideal target is found, just pick anything
			return enemy_armies[irandom_range(0, array_length(enemy_armies)-1)]
		}
	} else {
		var enemy_prov = find_random_enemy_province(global.tags[army.tag_id][0])
		if enemy_prov != noone {
			return enemy_prov
		} else {
			return noone
		}
	}
}

function find_random_enemy_province(tag) {
	// Locates an unoccupied enemy province to move to
	for (var i = 0; i < array_length(global.provinces); i ++) {
		if tag_is_enemy(tag, map_province_owner(i)) {
			with obj_province {
				if prov_id == i && prov_occupied_by == noone {
					return i
				}
			}
		}
	}
	
	return noone
}

function find_path_to_target(target, subject) {
    /// Takes in target object and calculates best path to reach them
	if target == noone { return [] }
	
    var distance = {}
	var previous = {}
	var unvisited = {}
    
	// Create distances list and unvisited provinces list
    for (var prov = 0; prov < array_length(global.provinces); prov ++) {
        distance[$ string(prov)] = 1000
		previous[$ string(prov)] = []
		unvisited[$ string(prov)] = 1
    }
    
    // Set distance for start province to 0 so we start at start province
    distance[$ string(subject.location)] = 0
	
	// While there are unvisited provinces	
	while variable_struct_names_count(unvisited) > 0 {
		// Get province with shortest distance that is unvisited
		var shortest_distance = 100000000
		var shortest_dist_province = noone
		for (var i = 0; i < variable_struct_names_count(distance); i ++) {    
			if distance[$ string(i)] < shortest_distance {
				try {
					if unvisited[$ string(i)] == 1 {
						shortest_distance = distance[$ string(i)]
						shortest_dist_province = i
					}
				}
			}
		}
			
		print("shortest_dist_province: " + string(shortest_dist_province))
		// Get neighbouring provinces
		var neighbours = map_province_get_adjacent_list(shortest_dist_province)
		// Filter out neighbours that have been visited
		for (var i = 0; i < array_length(neighbours); i ++) {   
			try {
				if unvisited[$ neighbours(i)] == 1 {
					// Do nothing
				}
			}
			catch(_exception) {
				array_delete(neighbours, i, 1)
			}
		}
		
		if array_length(neighbours) == 0 {
            var temp_path = []
            for (var k = 0; k < array_length(previous[$ string(shortest_dist_province)]); k ++) {
                array_push(temp_path, previous[$ string(shortest_dist_province)][k])
            }
            previous[$ string(shortest_dist_province)] = temp_path
            
            // Mark current province as visited so we don't backtrack
            variable_struct_remove(unvisited, string(shortest_dist_province))
        }
		
		print("Neighbours: " + string(neighbours))
		// Iterate through neighbouring provinces
		for (var j = 0; j < array_length(neighbours); j ++) {
			// Check if distance between current province and neighbour is shorter than
			// the distance value of the neighbouring province
			if distance[$ string(shortest_dist_province)] + 1 < distance[$ string(neighbours[j])] {
				// Apply this shorter distance to the neighbouring province
				distance[$ string(neighbours[j])] = distance[$ string(shortest_dist_province)] + 1
			}
			
			print("Previous[shortest_dist_province]"+ string(previous[$ string(shortest_dist_province)]))
			// Build list of previous provinces visited
			var temp_path = []
			for (var k = 0; k < array_length(previous[$ string(shortest_dist_province)]); k ++) {
				array_push(temp_path, previous[$ string(shortest_dist_province)][k])
			}
			array_push(temp_path, shortest_dist_province)
			
			// Set path to neighbour as list of previous provinces visited
			if array_length(previous[$ string(neighbours[j])]) == 0 {
				previous[$ string(neighbours[j])] = temp_path
			}
			
			print("Previous[" + string(neighbours[j]) + "]" + string(previous[$ string(neighbours[j])]))
			// Mark current province as visited so we don't backtrack
			variable_struct_remove(unvisited, string(shortest_dist_province))

			if typeof(target) == "ref" {
				if neighbours[j] == target.location {
					return previous[$ string(neighbours[j])]
				}
			} else {
				if neighbours[j] == target {
					return previous[$ string(neighbours[j])]
				}
			}
		}
	}
}

function check_for_adjacent_enemy(army) {
	var adjs = map_province_get_adjacent_list(army.location)
	var enemies = find_enemy_armies(global.tags[army.tag_id][0])
	
	for (var i = 0; i < array_length(adjs); i ++) {
		for (var j = 0; j < array_length(enemies); j ++) {
			if adjs[i] == enemies[j].location {
				return enemies[j]	
			}
		}
	}
	
	return noone
}

function check_for_potential_battle(your_army) {
	var battle_enemy = check_for_adjacent_enemy(your_army)
	show_debug_message("Battle Enemy: " + string(battle_enemy))
	if your_army.moves_remaining > 0 && battle_enemy != noone {
		if battle_enemy.total_mp > your_army.total_mp {
			// If their army is stronger than yours
			global.army[your_army.tag_id][your_army.army_id] -= global.army[battle_enemy.tag_id][battle_enemy.army_id] - global.army[your_army.tag_id][your_army.army_id]
			global.army[battle_enemy.tag_id][battle_enemy.army_id] -= ((global.army[battle_enemy.tag_id][battle_enemy.army_id] - global.army[your_army.tag_id][your_army.army_id]) / 2) * (1 + (obj_control.army_quality[your_army.tag_id]/10))
		} else {
			// If their army is weaker or equal to yours
			global.army[your_army.tag_id][your_army.army_id] -= (global.army[your_army.tag_id][your_army.army_id] - global.army[battle_enemy.tag_id][battle_enemy.army_id]) / 2
			global.army[battle_enemy.tag_id][battle_enemy.army_id] -= (global.army[your_army.tag_id][your_army.army_id] - global.army[battle_enemy.tag_id][battle_enemy.army_id]) * (1 + (obj_control.army_quality[your_army.tag_id]/10))
		}
		
		if battle_enemy.total_mp <= 0 { instance_destroy(battle_enemy) }
					
		your_army.moves_remaining = 0
	}
}

function refresh_armies() {
	// Delete Exisiting Armies
	var prev_locs = [] // List of previous locations of armies
	for (var i = 0; i < instance_number(obj_army); i ++) {	
		if instance_find(obj_army, i).tag_id == tag_fetch_id(obj_control.player_tag) {
			with obj_province {
				if unit_in_prov == instance_find(obj_army, i)  {
					unit_in_prov = noone
				}
			}
							
			array_push(prev_locs, instance_find(obj_army, i).location)
			instance_destroy(instance_find(obj_army, i))
		}
	}
					
	// Recreate from updated army list
	for (var j = 0; j < array_length(global.army[tag_fetch_id(obj_control.player_tag)]); j ++) {
		with instance_create_depth(global.provinces[prev_locs[j]][7], global.provinces[prev_locs[j]][8], -1000, obj_army) {
			tag_id = tag_fetch_id(obj_control.player_tag)
			army_id = j
			location = prev_locs[j]
		}
	}	
}