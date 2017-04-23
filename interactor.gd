extends Area2D

var current_body = null
var update_label = false

func _ready():
	set_fixed_process(true)

func update_label():
	var message = get_node("Message").get_text()
	get_tree().get_root().get_child(0).get_node("Label").update_text(self, message)

func clear_label():
	get_tree().get_root().get_child(0).get_node("Label").clear_text(self)

func delayed_clear_label():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "clear_label")
	timer.start()

func _fixed_process(delta):
	if(current_body):
		if(Input.is_key_pressed(KEY_SPACE)):
			update_label = true
		elif(update_label):
			update_label()
			delayed_clear_label()
			update_label = false

func _on_Area2D_body_enter( body ):
	if(body.is_in_group("Player")):
		current_body = body

func _on_Area2D_body_exit( body ):
	current_body = null