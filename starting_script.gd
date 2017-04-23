extends Node2D

var start_screen = true

func _fixed_process(delta):
	if(Input.is_key_pressed(KEY_ESCAPE) && start_screen == true):
		get_tree().quit()
	if(Input.is_key_pressed(KEY_SPACE) && start_screen == true):
		var new_scene = load("root_scene.tscn").instance()
		add_child(new_scene)
		start_screen = false
		
func _ready():
	set_fixed_process(true)