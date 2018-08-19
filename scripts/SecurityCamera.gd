extends Node2D


func _on_Body_body_entered(body):
	if body == Global.Player:
		Global.GameState.die()