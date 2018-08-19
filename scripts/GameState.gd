extends Node2D

var current_level

func _ready():
	Global.GameState = self
	load_next_level()
	
func remove_level():
	for level in self.get_children():
		level.queue_free()
	
func realod_level():
	load_level(current_level)

func load_next_level():
	var scene = Global.levels.pop_front()
	if(scene):
		load_level(scene)

func load_level(scene):
	current_level = scene
	remove_level()
	var level = load(scene)
	add_child(level.instance())

func die():
	realod_level()