extends Node

var stack = []

func main_scene():
	return get_tree().get_root().get_child(0).get_node("Game")

func get_ruby(ruby_name):
	for child in main_scene().get_loaded_scenes().values():
		var ruby_node = child.get_node(ruby_name)
		if ruby_node:
			return ruby_node
	return null

func add_to_stack(object):
	stack.push_back(object)

func _ready():
	pass