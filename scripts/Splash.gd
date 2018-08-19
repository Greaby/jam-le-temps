extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _process(delta):
	$Position2D.look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("start"):
		Global.GameState.start_timer()
		Global.GameState.load_next_level()
	
