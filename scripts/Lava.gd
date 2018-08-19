extends Area2D


func _on_Lava_body_entered(body):
	if body == Global.Player:
		Global.GameState.die()
