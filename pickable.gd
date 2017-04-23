extends Area2D

func _ready():
	pass

func _on_Area2D_body_enter( body ):
	if body.is_in_group("Player"):
		var root_children = get_tree().get_root().get_child(0).get_children()
		for root_child in root_children:
			if root_child.is_in_group("Levels"):
				root_child.remove_child(get_parent())
				break
