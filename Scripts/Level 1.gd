extends Node3D

@onready var warrior_scene: PackedScene = preload("res://Scenes/Monsters/skeleton_warrior_monster.tscn")

@onready var gridmap_floor = get_node("floor")
@onready var gridmap_walls = get_node("walls")

func _ready() -> void:
	while get_node("Monsters").get_child_count() < 10:
		var x_pos = randi_range(-20,20)
		var z_pos = randi_range(-10,20)
		var monster_temp = warrior_scene.instantiate()
		if gridmap_floor.get_cell_item(Vector3i(x_pos, -1, z_pos)) == 1:
			if gridmap_floor.get_cell_item(Vector3i(x_pos, -1, z_pos)) != 3:
				monster_temp.position = Vector3(x_pos, 3, z_pos)
				monster_temp.player = get_node("player")
				get_node("Monsters").add_child(monster_temp)
				print_debug("monster spawned")
			else:
				print_debug("wall error")
		else: 
			print_debug("floor error")
			
