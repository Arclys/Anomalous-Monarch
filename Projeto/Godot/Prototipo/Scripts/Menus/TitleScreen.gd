extends Control

func _start_pressed() -> void:
	get_tree().change_scene_to_file("res://Rooms/Room01.tscn")
func _quit_pressed() -> void:
	get_tree().quit()
func _credits_pressed() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MarginContainer/HBoxContainer/VBoxContainer/buttonStart.pressed.connect(_start_pressed)
	$MarginContainer/HBoxContainer/VBoxContainer/buttonQuit.pressed.connect(_quit_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
