extends Sprite2D
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var noise = texture.noise as Noise
	time += delta
	
	noise.offset += Vector3(50, sin(time) * 25, 0) * delta / 2

	texture.notify_property_list_changed()
