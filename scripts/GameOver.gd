extends Node2D

func _ready():
	$Time.text = "Temps : " + str(Global.time) + "s"
	$Dead.text = "Morts : " + str(Global.dead)