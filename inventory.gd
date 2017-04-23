extends Node2D

var rubies = []

func add_ruby(ruby):
	var rubies_node = get_node("Rubies")
	rubies_node.get_node(ruby).show()
	rubies.push_back(ruby)

func _ready():
	pass