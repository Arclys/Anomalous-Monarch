extends Control

@onready var buttons_location = $MarginContainer/HBoxContainer/VBoxContainer

func _start_pressed() -> void:
	get_tree().change_scene_to_file("res://Rooms/Room01.tscn")
func _quit_pressed() -> void:
	get_tree().quit()
func _credits_pressed() -> void:
	pass

var actions_pressed : Dictionary[String, Callable] = {
	"buttonStart": func():
		_start_pressed()
		,
	"buttonCredits": func():
		_credits_pressed()
		,
	"buttonQuit": func():
		_quit_pressed()
		,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for botao in buttons_location.get_children():
		if (botao is Button):
			botao.pressed.connect(
				func():
					# se o nome do botao(botao.name) for
					# uma chave do dicionario
					actions_pressed.get(botao.name, (func(): pass)).call()
					# (sim tem que o usar o .call() ao invés do ())
			)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
