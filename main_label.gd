extends Label

func _ready():
	pass

func update_text(caller, text):
	set_text(text)
	set_hidden(false)
	set_meta("last", caller)

func clear_text(caller):
	if(get_meta("last") == caller):
		set_text("")
		set_hidden(true)
		caller.get_node("Timer").stop()