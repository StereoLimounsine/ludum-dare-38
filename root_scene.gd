extends Node

var scene_loaded = false
var current_index = 2
var scene = null
const scene_paths = [
  "grave_level.tscn", "sand_level.tscn",
  "grass_level.tscn", "concrete_level.tscn",
  "snow_level.tscn", "water_level.tscn"
]
var loaded_scenes = {}

func switch_scene():
	var scene_path = scene_paths[current_index]
	var new_scene
	if(loaded_scenes.has(scene_path)):
		new_scene = loaded_scenes[scene_path]
	else:
		new_scene = load(scene_path).instance()
		loaded_scenes[scene_path] = new_scene
	add_child(new_scene)
	if(scene):
		remove_child(scene)
	scene = new_scene
	scene_loaded = true

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
		switch_scene()

func _ready():
	switch_scene()
	set_fixed_process(true)