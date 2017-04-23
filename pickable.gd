extends Area2D

func _ready():
	pass

func show_ruby(root_scene):
	var rubies = root_scene.get_node("Inventory").get_node("Rubies")
	var inventory_item = rubies.get_node(get_parent().get_name())
	inventory_item.show()

func remove_map_object(root_scene):
	for root_child in root_scene.get_children():
		if root_child.is_in_group("Levels"):
			root_child.remove_child(get_parent())
			break	

func _on_Area2D_body_enter( body ):
	if body.is_in_group("Player"):
		var root_scene = get_tree().get_root().get_child(0)
		remove_map_object(root_scene)
		show_ruby(root_scene)