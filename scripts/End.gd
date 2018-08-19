extends Area2D



func _on_End_body_entered(body):
	if body == Global.Player:
		Global.GameState.load_next_level()
