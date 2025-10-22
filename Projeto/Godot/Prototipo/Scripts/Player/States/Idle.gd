extends State

func begin_update() -> void:
	player.sprite.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	pass

func _physics_update(delta: float) -> void:
	player.velocity.x = player.move(player.speed, player.direction*0.5, delta)
	player.move_and_slide()

func _end_update() -> void:
	if walking(): state_machine.state_changer("walk")
	if not(on_ground()): state_machine.state_changer("fall")
	if jumping(): state_machine.state_changer("jump")
