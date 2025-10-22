extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $Sprite
@export var speed: float = 20.
@export var jump_speed: float = 50.
@export var mass: float = 0.

var direction = Input.get_axis("ui_left", "ui_right")
var jump = Input.is_action_just_pressed("ui_accept")

func move(speed: float, acelleration: float, delta: float) -> float:
	return lerp(speed, velocity * direction, acelleration * delta)
