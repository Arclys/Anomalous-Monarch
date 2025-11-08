extends State


# Called when the node enters the scene tree for the first time.
func _begin_update() -> void:
	player.sprite.play("Jump")
	player.velocity.y = -player.jump_force


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	if stopped(): state_machine.state_changer("idle")
	if falling(): state_machine.state_changer("fall")  
	flip_sprite()
func _physics_update(delta: float) -> void:
	player.velocity.x = player.move(player.speed, 10., delta).x
	player.apply_gravity(delta)
	player.move_and_slide()
func _end_update() -> void:
	pass
