extends Node2D


func play_effect():
	$AnimationPlayer.play("smoke_active")

func _ready():
	play_effect()
