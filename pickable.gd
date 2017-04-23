extends Area2D

func _ready():
	pass

func _on_Area2D_body_enter( body ):
	if(body.is_in_group("Player")):
		get_parent().remove_child(self)
