extends BossState


func _update(delta: float) -> void:
	if player_in_vision(): state_machine.state_changer("attack")