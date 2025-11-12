extends State


func _begin_update() -> void: 
	player.hitabble = false
	player.velocity = Vector2.ZERO
	player.velocity = Vector2(player.knockback_force.x, player.knockback_force.y)
	

func _update(delta: float) -> void:
	pass
	
# Loop da física	
func _physics_update(delta: float) -> void:
	pass

# Fim do Estado
func _end_update() -> void:
	player.hitabble = true
	state_machine.state_changer("idle")
