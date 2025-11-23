extends PlayerState


func _begin_update() -> void:
	Master.play_audio("player_hurt", 0.6, 0.8)
	Master.global_time = Time.get_ticks_msec() / 1000.0
	take_damage(1)
	if Master != null: Master.player_hitabble = false
	character.knockback_time = 0.
	character.velocity = Vector2.ZERO
	character.velocity = Vector2(-character.knockback_dir * character.knockback_force.x, character.knockback_force.y)
	
	
	character.sprite.play("Hit")

func _update(delta: float) -> void:
	if death(): state_machine.state_changer("death"); return
	if on_ground(): state_machine.state_changer("idle"); return
	iframes_execute()
	
# Loop da física
func _physics_update(delta: float) -> void:
	character.apply_gravity(delta)
	character.move_and_slide()

# Fim do Estado
func _end_update() -> void:
	Master.player_hitabble = true
	character.sprite.modulate.a = 1.
