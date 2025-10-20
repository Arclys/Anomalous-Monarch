extends State


# Called when the node enters the scene tree for the first time.
func _begin_update() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	player.sprite.play("Fall")

func _physics_update(delta: float) -> void:
	pass