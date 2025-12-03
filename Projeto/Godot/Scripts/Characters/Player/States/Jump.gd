extends PlayerState


# Called when the node enters the scene tree for the first time.
func _begin_update() -> void:
	character.sprite.play("Jump")
	jump()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	if enemy_collided(): state_machine.state_changer("hit")
	if stopped(): state_machine.state_changer("idle")
	if falling(): state_machine.state_changer("fall")
	if transition_room(): state_machine.state_changer("roomtrade")
	if attack(): state_machine.state_changer("attack")
	flip_sprite()
	
func _physics_update(delta: float) -> void:
	character.velocity.x = character.move(character.hspd, 10., delta).x
	character.apply_gravity(delta)
	character.move_and_slide()

func _end_update() -> void:
	pass
