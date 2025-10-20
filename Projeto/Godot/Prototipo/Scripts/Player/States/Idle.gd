extends State



func begin_update() -> void:
	player.sprite.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	if get_parent().get_parent().direction:
		pass

func _physics_update(delta: float) -> void:
	if not(player.is_on_floor()):
		state_machine.state_changer("jump")
	player.move_and_slide()


