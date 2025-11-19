extends State


func _begin_update() -> void:
	Master.global_time = Time.get_ticks_msec() / 1000.0
	Master.player_hp -= 1.
	if Master != null: Master.player_hitabble = false
	player.knockback_time = 0.
	player.velocity = Vector2.ZERO
	player.velocity = Vector2(-player.knockback_direction * player.knockback_force.x, player.knockback_force.y)
	
	
	player.sprite.play("Hit")

func _update(delta: float) -> void:
	if death(): state_machine.state_changer("death")
	if on_ground(): state_machine.state_changer("idle")
# Loop da física	
func _physics_update(delta: float) -> void:
	
	player.apply_gravity(delta)
	player.move_and_slide()
# Fim do Estado
func _end_update() -> void:
	Master.player_hitabble = true
	
	player.sprite.modulate.a = 1.
