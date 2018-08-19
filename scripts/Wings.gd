extends Node2D

func _process(delta):
	if Global.Player:
		$Eye.look_at(Global.Player.position)