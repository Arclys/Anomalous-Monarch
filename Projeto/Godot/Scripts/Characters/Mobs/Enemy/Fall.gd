extends EnemyState


func _begin_update() -> void:
	character.sprite.play("Fall")
	

func _update(delta: float) -> void:
	if death(): state_machine.state_changer("death")
	if on_ground(): state_machine.state_changer("idle")
	if enemy_collided(): state_machine.state_changer("hit")
	flip_sprite_x()
	flip_sprite_y()
	
func _physics_update(delta: float) -> void:
	character.velocity.x = character.move(character.speed, 10., delta).x
	character.apply_gravity(delta)
	character.move_and_slide()

func _end_update() -> void:
	character.sprite.scale.y = 1.
