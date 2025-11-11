extends State


func _begin_update() -> void: 
	player.hitabble = false
	player.velocity = Vector2.ZERO
	

func _update(delta: float) -> void:
	pass
	
# Loop da física	
func _physics_update(delta: float) -> void:
	pass

# Fim do Estado
func _end_update() -> void:
	player.hitabble = true
	state_machine.state_changer("idle")
