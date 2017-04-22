extends KinematicBody2D

const MOTION_SPEED = 16 # Pixels/seconds


func _fixed_process(delta):
	var motion = Vector2()

	if (Input.is_key_pressed(KEY_W)):
		motion += Vector2(0, -1)
	if (Input.is_key_pressed(KEY_S)):
		motion += Vector2(0, 1)
	if (Input.is_key_pressed(KEY_A)):
		motion += Vector2(-1, 0)
	if (Input.is_key_pressed(KEY_D)):
		motion += Vector2(1, 0)

	motion = motion.normalized()*MOTION_SPEED*delta
	motion = move(motion)

	# Make character slide nicely through the world
	var slide_attempts = 4
	while(is_colliding() and slide_attempts > 0):
		motion = get_collision_normal().slide(motion)
		motion = move(motion)
		slide_attempts -= 1


func _ready():
	set_fixed_process(true)
