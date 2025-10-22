extends State


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	pass

func _physics_update(delta: float) -> void:
	player.velocity.x = player.move(player.speed, player.direction*0.5, delta)
	player.move_and_slide()

func _end_update() -> void:
	if stopped(): state_machine.state_changer("idle")
	if not(on_ground()): state_machine.state_changer("fall")
	if jumping(): state_machine.state_changer("jump")
