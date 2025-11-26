extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var sprite := $Noise

	# posição final suavizada da câmera
	sprite.global_position = get_screen_center_position()
