extends CharacterBody2D

signal Player_dead

var Health = 100.0
const TAKE_DAMAGE = 10.0
var hurt_area_mobs

var direction
@export var speed := 300

func _physics_process(delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed 
	move_and_slide()
	
	if velocity.length() > 0.0:
		%Rudi.play_walk_animation()
	else :
		%Rudi.play_idle_animation()
		
	
	hurt_area_mobs = %hurtBox.get_overlapping_bodies()
	if hurt_area_mobs.size() > 0:
		Health -= TAKE_DAMAGE * hurt_area_mobs.size() * delta
		%ProgressBar.value = Health
		if Health <= 0.0:
			Player_dead.emit()
