extends CharacterBody2D

var enemy_health = 3

@onready var player = get_node("/root/Game/Player")


var direction
@export var enemy_speed := 100

func _ready():
	%Slime.play_walk_animation()

func _physics_process(_delta):
	direction = global_position.direction_to(player.global_position)
	velocity = direction * enemy_speed
	move_and_slide()

func take_damage():
	enemy_health -= 1
	%Slime.play_hurt_animation()
	
	if enemy_health == 0:
		queue_free()
		
		const SMOKE_EFFECT = preload("uid://be3o8gve8c5v1")
		var smoke = SMOKE_EFFECT.instantiate()
		get_parent().add_child(smoke)
		
		smoke.global_position = global_position
		
