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


func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()


func _on_score_timer_timeout() -> void:
	score += 1


func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
