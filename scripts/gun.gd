extends Area2D

var enemy_in_range
var enemy_target



func _physics_process(_delta):
	enemy_in_range = get_overlapping_bodies()
	if enemy_in_range.size() > 0:
		enemy_target = enemy_in_range.front()
		look_at(enemy_target.global_position)

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %Marker_shooting_point.global_position
	new_bullet.global_rotation = %Marker_shooting_point.global_rotation
	
	if enemy_in_range.size() > 0:
		%Marker_shooting_point.add_child(new_bullet)
	else:
		new_bullet = 0


func _on_timer_timeout():
	shoot()
