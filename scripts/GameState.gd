extends Node2D

var current_level

var background_switch = false

func _ready():
	randomize()
	Global.GameState = self
	load_next_level()
	
func remove_level():
	Global.Player = null
	for level in $Level.get_children():
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
	$Level.add_child(level.instance())

func die():
	Global.dead += 1
	realod_level()
	
	
func switch_background_sound():
	if not background_switch:
		$AnimationPlayer.play("switch_background_sound")
		background_switch = true

func _on_Timer_timeout():
	var voices = $Voices.get_children()
	var voice = voices[randi() % voices.size()]
	voice.play()
	$VoiceTimer.wait_time = randi() % 15 + 20
	

func _increment_time():
	Global.time += 1
	
func start_timer():
	$AnimationPlayer.play("start_game")
	$Timer.start()
	$VoiceTimer.start()
