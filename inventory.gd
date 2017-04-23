extends Node2D

var rubies = []
const rubies_total = 6

func try_to_finish():
	if rubies.size() == rubies_total:
		get_tree().get_root().get_child(0).get_node("Game").finish()

func add_ruby(ruby):
	var rubies_node = get_node("Rubies")
	rubies_node.get_node(ruby).show()
	rubies.push_back(ruby)
	try_to_finish()

func _ready():
	pass