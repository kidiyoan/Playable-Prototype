extends Sprite2D

func play_walk_animation():
	%AnimationPlayer.play("enemy_walk")

func play_hurt_animation():
	%AnimationPlayer.play("enemy_hurt")
	%AnimationPlayer.queue("enemy_walk")
