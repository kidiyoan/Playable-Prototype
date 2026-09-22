extends Area2D

var bullet_speed = 1000
var bullet_direction
var bullet_start_range = 0
var bullet_range = 500


func _physics_process(delta):
	bullet_direction = Vector2.RIGHT.rotated(rotation)
	position += bullet_direction * bullet_speed * delta
	
	bullet_start_range += bullet_speed * delta
	
	if bullet_start_range > bullet_range:
		queue_free()
	


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
