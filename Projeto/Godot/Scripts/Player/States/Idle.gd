extends State

func _begin_update() -> void:
	if character.sprite:
		character.sprite.play("Idle")
	else:
		push_warning("O Player não tem AnimatedSprite2D atribuído ou não foi encontrado!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	if death(): state_machine.state_changer("death")
	if enemy_collided(): state_machine.state_changer("hit")
	if walking(): state_machine.state_changer("walk")
	if not(on_ground()): state_machine.state_changer("fall")
	if jumping(): state_machine.state_changer("jump")

func _physics_update(delta: float) -> void:
	pass
	
	character.velocity.x = character.move(character.speed, 10., delta).x
	character.move_and_slide()

func _end_update() -> void:
	pass