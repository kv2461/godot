extends Node

@export var mob_scene: PackedScene
var score


func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass


func game_over() -> void:
	$ScoreTimer.stop()
	$Mobtimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
