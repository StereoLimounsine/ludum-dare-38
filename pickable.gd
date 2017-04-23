extends Area2D

func _ready():
	pass

func add_to_inventory(root_scene):
	var inventory = root_scene.get_node("Inventory")
	inventory.add_ruby(get_parent().get_name())

func remove_map_object(root_scene):
	for root_child in root_scene.get_children():
		if root_child.is_in_group("Levels"):
			root_child.remove_child(get_parent())
			break	

func _on_Area2D_body_enter( body ):
	if body.is_in_group("Player"):
		var root_scene = get_tree().get_root().get_child(0).get_node("Game")
		remove_map_object(root_scene)
		add_to_inventory(root_scene)