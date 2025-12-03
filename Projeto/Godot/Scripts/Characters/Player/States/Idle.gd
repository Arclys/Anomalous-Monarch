extends PlayerState

func _begin_update() -> void:
	if character.sprite:
		character.sprite.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	if enemy_collided(): state_machine.state_changer("hit")
	if walking(): state_machine.state_changer("walk")
	if not(on_ground()): state_machine.state_changer("fall")
	if jumping(): state_machine.state_changer("jump")
	if transition_room(): state_machine.state_changer("roomtrade")
	if attack(): state_machine.state_changer("attack")

func _physics_update(delta: float) -> void:
	character.velocity.x = character.move(character.hspd, 10., delta).x
	character.move_and_slide()

func _end_update() -> void:
	pass
