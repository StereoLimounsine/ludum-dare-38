extends Label

func _ready():
	pass

func update_text(caller, text):
	get_node("Timer").stop()
	get_node("Timer").emit_signal("timeout")
	set_text(text)
	set_hidden(false)
	set_meta("last", caller)
	delayed_clear_text(caller)

func delayed_clear_text(caller):
	var timer = get_node("Timer")
	timer.disconnect("timeout", self, "clear_text")
	timer.connect("timeout", self, "clear_text", [caller])
	timer.start()

func clear_text(caller):
	if(get_meta("last") == caller):
		set_text("")
		set_hidden(true)
		get_node("Timer").stop()