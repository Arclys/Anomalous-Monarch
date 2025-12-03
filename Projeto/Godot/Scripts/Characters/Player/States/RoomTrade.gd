extends PlayerState

func _begin_update() -> void:
	character.velocity = Vector2.ZERO
	if RoomManager.player_jump_on_enter:
		jump()
		RoomManager.player_jump_on_enter = false
	

func _update(delta: float) -> void:
	if RoomManager.room_transicion_finished:
		state_machine.state_changer("Idle")
		RoomManager.room_transicion_finished = false
func _physics_update(delta: float) -> void:
	pass
func _end_update() -> void:
	on_cam_smoothing()
	RoomManager.activate = false
