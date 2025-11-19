extends State


func _begin_update() -> void:
	Master.global_time = Time.get_ticks_msec() / 1000.0
	player.knockback_time = 0.
	player.hitabble = false
	player.velocity = Vector2.ZERO
	player.velocity = Vector2(player.knockback_force.x, player.knockback_force.y)
	player.sprite.play("Fall") # Tá dando erro aqui

func _update(delta: float) -> void:
	pass
	
# Loop da física	
func _physics_update(delta: float) -> void:
	player.move_and_slide()
# Fim do Estado
func _end_update() -> void:
	player.hitabble = true
	state_machine.state_changer("idle")
	player.sprite.modulate.a = 1.
