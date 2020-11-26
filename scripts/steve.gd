extends KinematicBody2D

var velocity = Vector2(0, 0)
const SPEED = 260
const GRAVITY = 30
const JUMPFORCE = -900

func _physics_process(_delta):
	
	# Movimentação
	if(Input.is_action_pressed("ui_right")):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif(Input.is_action_pressed("ui_left")):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	
	# Animação de ar quando estiver fora do chão
	if not is_on_floor():
		$Sprite.play("air")
	
	# Gravidade
	velocity.y = velocity.y + GRAVITY
	
	# Arruma o bug da gravidade multiplicada
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity.x = lerp(velocity.x, 0, 0.2)


func _on_Fall_Zone_body_entered(body):
	get_tree().change_scene("res://scenes/level1.tscn")
