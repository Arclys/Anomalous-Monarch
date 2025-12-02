extends PlayerState



func _begin_update() -> void:
	if RoomManager.player_jump_on_enter:
		jump()
		RoomManager.player_jump_on_enter = false
	Master.player_coords = RoomManager.player_coords

func _update(delta: float) -> void:
	pass

func _physics_update(delta: float) -> void:
	state_machine.state_changer("Idle")

func _end_update() -> void:
	RoomManager.activate = false
