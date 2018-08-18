extends Node2D

func _ready():
	Global.GameState = self
	load_level()

func load_level():
	for level in self.get_children():
		level.queue_free()
		
	var level = load("res://scenes/Level1.tscn")
	add_child(level.instance())

func die():
	load_level()