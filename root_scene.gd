extends Node

var scene_loaded = false
var current_index = 1
var scene = null
const scene_paths = [
  "sand_level.tscn",
  "grass_level.tscn",
  "snow_level.tscn"
]
const exit_scene_path = "exit_base.tscn"
var exit_state = false
var loaded_scenes = {}
var play_video = false
var exit_scene = load(exit_scene_path).instance()

func get_loaded_scenes():
	return loaded_scenes

func finish():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "show_video")
	timer.start()

func show_video():
	for child in get_children():
		if child.is_in_group("Levels"):
			child.queue_free()
			break
	hide_children(self)
	var video = get_node("FinalVideo")
	video.show()
	video.play()
	play_video = true

func try_video():
	var video = get_node("FinalVideo")
	if play_video && !video.is_playing():
		video.play()

func hide_children(node):
	if !node.has_method("get_children"):
		return
	for child in node.get_children():
		if child.has_method("hide"):
			child.hide()
		hide_children(child)

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
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_node("Label").clear()
		add_child(exit_scene)
		exit_state = true
	if(Input.is_key_pressed(KEY_P) && exit_state == true):
		remove_child(exit_scene)
		exit_state = false
	if(Input.is_key_pressed(KEY_Q) && exit_state == true):
		get_tree().quit()
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
	try_video()
	if(play_video &&
	   (Input.is_key_pressed(KEY_Q) ||
	    Input.is_key_pressed(KEY_ESCAPE))):
		get_tree().quit()

func _ready():
	switch_scene()
	set_fixed_process(true)
