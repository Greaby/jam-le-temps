extends "res://scripts/Character.gd"

var motion = Vector2()

func _process(delta):
	update_motion(delta)
	move_and_slide(motion)

func update_motion(delta):
	var velocity = Vector2()
	velocity.x += int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocity.y += int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	velocity = velocity.normalized() * SPEED
	
	if not velocity == Vector2():
		motion = velocity
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
		motion.y = lerp(motion.y, 0, FRICTION)