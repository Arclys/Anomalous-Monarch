extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $Sprite
@export var speed: float = 0.
@export var jump_speed: float = 0.
@export var mass: float = 0.
var direction = Input.get_axis("ui_left", "ui_right")
var jump = Input.is_action_just_pressed("ui_accept")

func horizon_move(speed: float, acelleration: float, delta: float) -> void:
	velocity = lerp(speed, velocity * direction, acelleration * delta)
