extends EnemyState


func _begin_update() -> void:
	
	if enemy.sprite:
		enemy.sprite.play("Idle")

func _update(delta: float) -> void:
	if death(): state_machine.state_changer("death")
	if walking(): state_machine.state_changer("walk")
	if not(on_ground()): state_machine.state_changer("fall")

func _physics_update(delta: float) -> void:
	pass

func _end_update() -> void:
	pass
