extends BossState



func _begin_update() -> void:
	character.sprite.play("Idle")
	character.rest_timer.set_wait_time(4)
func _update(delta: float) -> void:
	pass

func _physics_update(delta: float) -> void:
	if player_attacks_collided(): take_damage(1)
	
func _on_rest_timeout() -> void:
	state_machine.state_changer("attack")
	character.velocity.y = 10
