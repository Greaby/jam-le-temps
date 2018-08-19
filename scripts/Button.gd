extends Area2D

signal button_pressed

func _on_Button_body_entered(body):
	if body == Global.Player:
		emit_signal("button_pressed")
		queue_free()
