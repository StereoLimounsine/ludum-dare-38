extends Node

var visit_stack = []

const riddle_stacks = {
  "Red ruby": [
    "Spring Tree 4 KEY", 
    "Summer Tree KEY", 
    "Autumn Tree KEY", 
    "Winter Tree 2 KEY"
  ]
}

func main_scene():
	return get_tree().get_root().get_child(0).get_node("Game")

func get_ruby(ruby_name):
	for child in main_scene().get_loaded_scenes().values():
		var ruby_node = child.get_node(ruby_name)
		if ruby_node:
			return ruby_node
	return null

func last_n(array, n):
	var retval = []
	for i in range(n):
		var index = -i - 1
		if -index > array.size():
			break
		retval.push_front(array[index])
	return retval

func check_riddles():
	for riddle_key in riddle_stacks:
		var riddle = riddle_stacks[riddle_key]
		var last_n = last_n(visit_stack, riddle.size())
		if last_n == riddle:
			get_ruby(riddle_key).show()

func add_to_stack(object):
	visit_stack.push_back(object)
	check_riddles()

func _ready():
	pass