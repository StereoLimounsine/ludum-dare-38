extends Node

var scene_loaded = false
var current_index = 0
var scene = preload("grass_level.tscn").instance()
const scene_paths = [
  "grass_level.tscn", "concrete_level.tscn",
  "grave_level.tscn", "sand_level.tscn",
  "snow_level.tscn", "water_level.tscn"
]

func _fixed_process(delta):
	if(Input.is_key_pressed(KEY_K) && 
	   scene_loaded &&
	   current_index + 1 < scene_paths.size()):
		current_index += 1
		scene_loaded = false
	if(Input.is_key_pressed(KEY_J) && 
	   scene_loaded &&
	   current_index - 1 >= 0):
		current_index -= 1
		scene_loaded = false
	if(!scene_loaded && 
	   !Input.is_key_pressed(KEY_K) && 
	   !Input.is_key_pressed(KEY_J)):
		var scene_path = scene_paths[current_index]
		var new_scene = load(scene_path).instance()
		add_child(new_scene)
		if(scene):
			remove_child(scene)
		scene = new_scene
		scene_loaded = true

func _ready():
	add_child(scene)
	set_fixed_process(true)