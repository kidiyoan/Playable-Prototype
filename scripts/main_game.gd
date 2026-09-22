extends Node2D

var new_enemy




func enemy_spwan():
	new_enemy = preload("res://scenes/enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)


func _on_timer_timeout() -> void:
	enemy_spwan()


func _on_player_player_dead() -> void:
	%"You died".visible = true
	get_tree().paused = true


func _on_restart_pressed():
	get_tree().paused = false
	%"You died".visible = false
	get_tree().reload_current_scene()
