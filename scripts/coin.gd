extends Area2D

signal coin_collected

func _on_Coin_body_entered(body):
	$AnimationPlayer.play("bounce")
	# Remove o colision shape para que o player não consiga
	# pegar a moeda duas vezes
	
	set_collision_layer_bit(0, false)
	
	# Emite um sinal para contabilizar uma moeda ao personagem
	emit_signal("coin_collected")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
