extends State

@onready var player: Player = get_parent().get_parent()

func begin_process() -> void:
	sprite.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent().get_parent().direction:
		pass

func _physics_process(delta: float) -> void:
	player.move_and_slide()
func end_process() -> void:
	pass
