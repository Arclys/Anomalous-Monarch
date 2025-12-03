extends PlayerState


func _begin_update() -> void:
	character.sprite.play("Fall")
 
func _update(delta: float) -> void:
	if enemy_collided(): state_machine.state_changer('hit')
	if on_ground(): state_machine.state_changer('idle')
	if jumping(): state_machine.state_changer('jump')
	if transition_room(): state_machine.state_changer("roomtrade")
	if attack(): state_machine.state_changer("attack")
	flip_sprite()

func _physics_update(delta: float) -> void:
	character.velocity.x = character.move(character.hspd,10.,delta).x
	character.apply_gravity(delta)
	character.move_and_slide()
	Master.play_audio("stone_step", 0.85, 1.15)
	
func _end_update() -> void:
	pass
