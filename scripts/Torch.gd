extends Light2D

func _on_Area2D_body_entered(body):
	if body == Global.Player:
		Global.GameState.die()
