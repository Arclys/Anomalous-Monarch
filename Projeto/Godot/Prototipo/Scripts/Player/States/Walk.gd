extends State


# Called when the node enters the scene tree for the first time.
func _begin_update() -> void:
	player.sprite.play("Walk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	if stopped(): state_machine.state_changer("idle")
	if not(on_ground()): state_machine.state_changer("fall")
	if jumping(): state_machine.state_changer("jump")
	flip_sprite()

func _physics_update(delta: float) -> void:
	player.velocity.x = player.move(player.speed, 10., delta).x
	player.move_and_slide()
	
	
func _end_update() -> void:
	pass
