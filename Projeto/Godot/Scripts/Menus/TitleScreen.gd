extends Control

@onready var buttons_location = $MarginContainer/HBoxContainer/VBoxContainer
# @onready var Master = %Master

var HOVER_COLOR := Color(1, 1, 1)
var DEFAULT_COLOR := Color(.8, .8, .8)
func animate_color(b: Button, target: Color, ease_mode: int):
	var t := create_tween()
	t.tween_property(b, "modulate", target, 0.05)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(ease_mode)

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

func _on_button_init(b: Button):
	b.modulate = DEFAULT_COLOR

func _on_mouse_entered(b: Button):
	animate_color(b, HOVER_COLOR, Tween.EASE_OUT)
	Master.play_audio('woosh', .85, 1)

func _on_mouse_exited(b: Button):
	animate_color(b, DEFAULT_COLOR, Tween.EASE_IN)
	Master.play_audio('whool', .50, .85)

func _on_button_click(_b: Button):
	Master.play_audio('click', .85, 1)	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for button in buttons_location.get_children():
		if (button is Button):
			#! inicialização
			_on_button_init(button)

			#! detectar clique
			button.pressed.connect(
				func():
					# se o nome do botao(botao.name) for
					# uma chave do dicionario
					actions_pressed.get(button.name, (func(): pass)).call()
					# (sim tem que o usar o .call() ao invés do ())
					_on_button_click(button)
			)
			#! detectar hover
			button.mouse_entered.connect( func(): _on_mouse_entered(button) )
			#! detectar unhover
			button.mouse_exited.connect( func(): _on_mouse_exited(button) )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
